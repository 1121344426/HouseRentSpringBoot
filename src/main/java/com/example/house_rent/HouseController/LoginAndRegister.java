package com.example.house_rent.HouseController;



import com.example.house_rent.Bean.Client;
import com.example.house_rent.ServiceImpl.ClientService;
import com.example.house_rent.utils.WebUtils;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.concurrent.TimeUnit;

@Controller
public class LoginAndRegister {
    @Autowired
    private ClientService clientService;
    @Autowired
    private JavaMailSenderImpl javaMailSender;
    @Autowired
    private RabbitTemplate rabbitTemplate;
    @Autowired
    private RedisTemplate redisTemplate;
    @Autowired
    private ObjectMapper mapper;

    @ResponseBody
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(HttpServletRequest req, HttpSession session){
        String userName = req.getParameter("userName");
        boolean userIsExists = clientService.userExists(userName);
        if(!userIsExists){
            return "isNotExits";
        }
        String passWord = req.getParameter("userPassword");
        String userPassword = clientService.findPassword(passWord);
        if(passWord.equals(userPassword)){
            Integer id = clientService.findId(userName);
            session.setAttribute("id",id);
            session.setAttribute("loginUser",userName);
            return "OK";
        }
        return "NO";
    }
    @ResponseBody
    @RequestMapping(value = "register",method = RequestMethod.POST)
    public String register(HttpServletRequest req) throws JsonProcessingException {
        String userName = req.getParameter("userName");
        String checking = (String) redisTemplate.boundValueOps("registerChecking").get();
        String check = req.getParameter("check");
        System.out.println("验证码是："+check+",发送的验证码是："+checking);
        if(checking == null || !checking.equals(check)){
            //System.out.println(1);
            return "outTime";
        }
        boolean isExists = clientService.userExists(userName);
        if(isExists){
            //System.out.println(2);
            return "exists";
        }else {
            System.out.println(3);
            String userPassword = req.getParameter("userPassword");
            String email = req.getParameter("email");
            String name = req.getParameter("name");
            Client client = new Client(null, name, userName, userPassword, email);
            rabbitTemplate.convertAndSend("emailRegister_fanout_exchange","",mapper.writeValueAsString(client));
            return "OK";
        }

    }
    @RabbitListener(queues = "email_register_queue" )
    public void insertClient(String message) throws JsonProcessingException {
        Client client = mapper.readValue(message, Client.class);
        System.err.println(client);
        clientService.insertClient(client);
    }
    @RabbitListener(queues = "email_register_queue" )
    public void sendEmailToClient(String message) throws JsonProcessingException {
        Client client = mapper.readValue(message, Client.class);
        clientService.insertClient(client);
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        try {
            MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage,true,"UTF-8");
            messageHelper.setFrom("1121344426@qq.com");//发件人
            messageHelper.setTo(client.getEmail());
            messageHelper.setSubject("蜗壳提示");
            messageHelper.setText("您的账号已经注册成功",true);//true代表支持html格式
            javaMailSender.send(mimeMessage);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
