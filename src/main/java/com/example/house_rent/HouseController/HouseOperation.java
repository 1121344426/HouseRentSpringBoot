package com.example.house_rent.HouseController;


import com.example.house_rent.Bean.*;
import com.example.house_rent.ServiceImpl.ClientService;
import com.example.house_rent.ServiceImpl.HouseService;
import com.example.house_rent.ServiceImpl.OrderService;
import com.example.house_rent.utils.StringUtils;
import com.example.house_rent.utils.WebUtils;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageInfo;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.logging.Logger;


@Controller
public class HouseOperation {
    @Autowired
    private OrderService orderService;
    @Autowired
    private HouseService houseService;
    @Autowired
    private JavaMailSenderImpl javaMailSender;
    @Autowired
    RedisTemplate redisTemplate;
    @Autowired
    private ClientService clientService;
    @Autowired
    private RabbitTemplate rabbitTemplate;
    @Autowired
    private ObjectMapper mapper;
    @RequestMapping("PublishHouses")
    public String publishHouses(){

        return "PublishHouses";
    }
    @RequestMapping("DefaultHouses")
    public String findDefaultHouses(HttpServletRequest req, @RequestParam("page") Integer page){
        PageInfo<House> housesPage = houseService.findHousesPage(page);
        PageInfo<House> housesOrderByPriceAsc = houseService.findHousesOrderByPriceAsc(page);
        PageInfo<House> housesOrderByPriceDesc = houseService.findHousesOrderByPriceDesc(page);
        PageInfo<House> housesOrderByDateAsc = houseService.findHousesOrderByDateAsc(page);
        req.setAttribute("defaultOrder",housesPage);
        req.setAttribute("priceDesc",housesOrderByPriceDesc);
        req.setAttribute("priceAsc",housesOrderByPriceAsc);
        req.setAttribute("dateAsc",housesOrderByDateAsc);
        return "FindHouse";
    }
    @RequestMapping("testFileUpload")
    public String testFileUploas(@RequestParam("des") String des, @RequestParam("file")
            MultipartFile file) throws IOException {
        System.out.println("desc:"+des);
        System.out.println("文件名:"+file.getOriginalFilename());
        System.out.println("流:"+file.getInputStream());
        File creatFile =new File("e:\\test","3.jpg");
        if(!creatFile.getParentFile().exists()){
            creatFile.getParentFile().mkdirs();
        }
        file.transferTo(creatFile);

        /**
         * 1、首先获取文件存储的位置的绝对路径
         * String path = req.getServletContext.getRealPath("路径");
         * 2、然后获取需要上传文件的名字
         * String fileName = file.getOriginalFilename()
         * 3、创建文件
         * File creatFile =new File(path,fileName);
         * 4、创建文件的上级目录(如果不存在)
         * if(!creatFile.getParentFile.exists()){
         *     creatFile.getParentFile.mkdirs();
         * }
         * file.transferTo(creatFile);
         * return "需要过去的页面";
         *
         * 文件上传实现过程:
         * 加入fileupload和io 的jar包
         * 配置文件配置:CommonsMultipartResolver
         * 创建表单,在action过来的方法的入参传入MultipartFile类型的参数
         */

        return "success";
    }
    @RequestMapping("sendMailCli")
    public String sendMail(){
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        try {
            MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage,true,"UTF-8");
            messageHelper.setFrom("1121344426@qq.com");//发件人
            messageHelper.setTo("1837395390@qq.com");
            messageHelper.setSubject("验证码");
            messageHelper.setText("123456",true);//true代表支持html格式
            javaMailSender.send(mimeMessage);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return "success";
    }
    @ResponseBody
    @RequestMapping("looking")
    public boolean looking(){
        return true;
    }

    @ResponseBody
    @RequestMapping("checking")
    public boolean checking(HttpServletRequest req) throws JsonProcessingException {
        System.out.println(1);
        emailAndChecking emailAndChecking = new emailAndChecking(req.getParameter("email"), req.getParameter("action"));
        rabbitTemplate.convertAndSend("emailSendChecking_fanout_exchange","",mapper.writeValueAsString(emailAndChecking));
        return true;
    }
    @RabbitListener(queues = "email_sendChecking_queue")
    public void sendEmailToPublishExchange(String email) throws JsonProcessingException {
        emailAndChecking emailAndChecking = mapper.readValue(email, emailAndChecking.class);
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        try {
            String checking = WebUtils.getChecking(6);
            if(emailAndChecking.getChecking() != null){
                redisTemplate.boundValueOps("registerChecking").set(checking,120, TimeUnit.SECONDS);
            }else {
                redisTemplate.boundValueOps("publishChecking").set(checking,120, TimeUnit.SECONDS);
            }

            //控制台打印邮箱
            System.out.println(email);
            MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage,true,"UTF-8");
            messageHelper.setFrom("1121344426@qq.com");//发件人
            messageHelper.setTo(emailAndChecking.getEmail());
            messageHelper.setSubject("验证码");
            messageHelper.setText(checking,true);//true代表支持html格式
            //控制台打印验证码
            System.out.println(checking);
            javaMailSender.send(mimeMessage);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("homePage")
    public String toHomePage(HttpSession session){
        int random = (int)(Math.random()*4);
        ArrayList<Integer> recommond = new ArrayList<>();
        ArrayList<Integer> recommond2 = new ArrayList<>();

        for (int i =0;i < 4;i++){
            recommond.add((int)(Math.random()*4)+1);
            recommond2.add((int)(Math.random()*4)+1);
        }
        session.setAttribute("recommond",recommond);
        session.setAttribute("recommond2",recommond2);
        return "forward:/index.jsp";
    }

    @GetMapping("change")
    public String change(HttpServletRequest req, HttpSession session){
        String action = req.getParameter("action");
        if("recommend".equals(action)){
            ArrayList<Integer> recommond = (ArrayList<Integer>) session.getAttribute("recommond");
            recommond.clear();
            for(int i = 0;i < 4;i++){
                recommond.add((int)(Math.random()*4)+1);
            }
            session.setAttribute("recommond",recommond);
        }else if("recommend2".equals(action)){
            ArrayList<Integer> recommond2 = (ArrayList<Integer>) session.getAttribute("recommond2");
            recommond2.clear();
            for(int i = 0;i < 4;i++){
                recommond2.add((int)(Math.random()*4)+1);
            }
            session.setAttribute("recommond2",recommond2);
        }
        return "forward:/index.jsp";
    }
    @ResponseBody
    @RequestMapping("publishHouse")
    public String publish(HttpServletRequest req, HttpSession session, @RequestParam("img") MultipartFile file) throws JsonProcessingException {
        String check = req.getParameter("check");
        String publishChecking = redisTemplate.boundValueOps("publishChecking").get().toString();
        if(publishChecking == null || !check.equals(publishChecking)){
            return "no";
        }
        String title = req.getParameter("descr");
        Double price = Double.valueOf(req.getParameter("price"));
        Integer id = (Integer)session.getAttribute("id");
        String style = req.getParameter("style");
        String city = req.getParameter("city");
        String area = req.getParameter("area");
        String village = req.getParameter("village");
        String squareString = req.getParameter("square");
        String direction = req.getParameter("direction");
        String storey = req.getParameter("storey");
        Integer square = Integer.valueOf(squareString);
        String stepForImgNumber =  redisTemplate.boundValueOps("stepForImgNumber").get().toString();
        if(stepForImgNumber == null){
            redisTemplate.boundValueOps("stepForImgNumber").set(13);
            stepForImgNumber = "13";
        }else {
            //String stepForImgNumber = readJedis.get("stepForImgNumber");
            redisTemplate.boundValueOps("stepForImgNumber").increment();
            //writeJedis.incr("stepForImgNumber");
        }
        String path = stepForImgNumber+".jpg";

        House house = new House(null, id, null, style, price, title, null, village, city, area, '0', path,square,direction,storey);
        rabbitTemplate.convertAndSend("emailPublish_fanout_exchange","",mapper.writeValueAsString(house));
        //boolean isExists = houseService.insertHouse(house);

        File creatFile =new File("/opt/houseRenter",stepForImgNumber + ".jpg");
        if(!creatFile.getParentFile().exists()){
            creatFile.getParentFile().mkdirs();
        }
        try {
            file.transferTo(creatFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //readJedis.close();
        //writeJedis.close();
        return "OK";
    }
    @RabbitListener(queues = "email_publish_queue")
    public void saveHouseToDatabase(String message) throws JsonProcessingException {
        House house = mapper.readValue(message, House.class);
        houseService.insertHouse(house);
    }
    @RabbitListener(queues = "email_publish_queue")
    public void sendEmailOfHouseToClient(String message) throws JsonProcessingException {
        House house = mapper.readValue(message, House.class);
        Client client = clientService.findClientForid(house.getOwner());
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        try {
            //控制台打印邮箱
           // System.out.println(email);
            MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage,true,"UTF-8");
            messageHelper.setFrom("1121344426@qq.com");//发件人
            messageHelper.setTo(client.getEmail());
            messageHelper.setSubject("验证码");
            messageHelper.setText("您的房子已经上传成功",true);//true代表支持html格式
            //控制台打印验证码
           // System.out.println(checking);
            javaMailSender.send(mimeMessage);
        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }
    @RequestMapping("singleHouse")
    public String seeSingleHouse(HttpServletRequest req, HttpSession session, @RequestParam("remove")String remove, @RequestParam("agree") Integer agree){
        Integer userId = null;
        String idString = req.getParameter("id");
        Integer id = Integer.valueOf(idString);
        House house = houseService.findHouse(id);
        Object loginId = session.getAttribute("id");
        if(loginId instanceof  Integer){
            userId = (Integer)loginId;
        }
        List<String> personalList = redisTemplate.boundListOps(idString + "HousePersonal").range(0,-1);
        //List<String> personalList = readJedis.lrange(idString + "HousePersonal", 0, -1);
        List<String> publicList = redisTemplate.boundListOps(idString + "HousePublic").range(0,-1);
        //List<String> publicList = readJedis.lrange(idString + "HousePublic", 0, -1);
        List<String> lrange = redisTemplate.boundListOps(id + "HouseOther").range(0,-1);
        //List<String> lrange = readJedis.lrange(id + "HouseOther", 0, -1);
        HouseOther houseOther = null;
        if(lrange.size() != 0){
            houseOther = WebUtils.redisToBeanHouseOther(lrange);
        }
        if(remove.equals("2")){
            req.setAttribute("remove",2);
        }else if(remove.equals("1")){
            req.setAttribute("remove",1);
        }
        else if(remove.equals("3")){
            req.setAttribute("remove",3);
        }
        Integer renterId = null;
        String renterid = req.getParameter("renterid");
        if(renterid != null){
            renterId = Integer.valueOf(renterid);
        }
        req.setAttribute("renterid",renterId);
        req.setAttribute("agree",agree);
        req.setAttribute("house",house);
        req.setAttribute("houseOther",houseOther);
        req.setAttribute("personalList",personalList);
        req.setAttribute("publicList",publicList);
        req.setAttribute("id",id);
        redisTemplate.boundListOps(userId + "_history").remove(1,idString);
        //writeJedis.lrem(userId + "_history", 1, idString);
        redisTemplate.boundListOps(userId+"_history").leftPush(idString);
        //writeJedis.lpush(userId+"_history",idString);
        //readJedis.close();
        //writeJedis.close();
        return "SingleHouse";
    }
    @RequestMapping("personalCenter")
    public String personCenterRequest(HttpServletRequest req, HttpSession session){
        Object idString = session.getAttribute("id");
        Integer id = null;
        if(idString instanceof Integer){
            id = (Integer)idString;
        }
        PageInfo<House> houses = houseService.findHousesByOwnerId(id, 1);

        String name = clientService.findName(id);
        req.setAttribute("name",name);
        //获取自己的房子
        if(houses.getList() != null && houses.getList().size() != 0){
            req.setAttribute("house",houses);
        }

        //获取浏览记录
        List<Integer> lrangeHistory = redisTemplate.boundListOps(idString + "_history").range(0,-1);
        System.out.println(lrangeHistory);
        //List<String> lrangeHistory = readJedis.lrange(idString + "_history", 0, -1);

        if(lrangeHistory.size() != 0){
            //List<Integer> historyList = WebUtils.stringListToInteger(lrangeHistory);
            PageInfo<House> houseHistory = houseService.findListHistoryHouse(lrangeHistory,1);
            req.setAttribute("history",houseHistory);
        }
        //获取自己的清单
        List<String> lrangeList = redisTemplate.boundListOps(idString + "ListForWander").range(0,-1);
        //List<String> lrangeList = readJedis.lrange(idString + "ListForWander", 0, -1);
        List<Integer> integers = WebUtils.stringListToInteger(lrangeList);
        //获取消息
        PageInfo<Order> ownerOrders = orderService.findOwnerOrders(id, 1, 10);
        if(ownerOrders.getList().size() > 0 && ownerOrders != null){
            req.setAttribute("message",1);
        }
        req.setAttribute("message",2);
        System.out.println(integers);
        if(integers.size() == 0){
            integers = null;
        }
        PageInfo<House> listHouse = houseService.findListHouse(integers, 1);
        if(listHouse.getList().size() == 0){
            listHouse = null;
        }

        req.setAttribute("personalList",listHouse);


        //获取自己租的房子
        PageInfo<House> housesByRenterId = houseService.findHousesByRenterId(id, 1);
        if(housesByRenterId.getList() != null && housesByRenterId.getList().size() != 0){
            req.setAttribute("myHouses",housesByRenterId);
        }
        //readJedis.close();
        return "PersonalCenter";
    }
    @ResponseBody
    @RequestMapping("housesConditions/{page}")
    public List<PageInfo<House>> findHousesByConditions(HttpServletRequest req, @PathVariable("page") Integer page){
        String price = req.getParameter("price");
        String area = req.getParameter("area");
        String houseStyle = req.getParameter("houseStyle");
        Integer price_min = null;
        Integer price_max = null;
        if(price != null && !"f".equals(price)){
            price_min = Integer.valueOf(price);
            price_max = price_min*2;
            if(price_min == 8000){
                price_max = 100000;
            }
        }

        Integer area_min = null;
        Integer area_max = null;
        if(area != null && !"f".equals(area)){
            area_min = Integer.valueOf(area);
            area_max = Integer.valueOf(area) + 20;
            if(area_min == 0){
                area_max = 50;
            }
        }
        if("f".equals(price)){
            String price_minString = req.getParameter("price_min");
            String price_maxString = req.getParameter("price_max");
            price_min = Integer.valueOf(price_minString);
            price_max = Integer.valueOf(price_maxString);
        }
        if("f".equals(area)){
            String area_minStr = req.getParameter("area_min");
            String area_maxStr = req.getParameter("area_max");
            area_min = Integer.valueOf(area_minStr);
            area_max = Integer.valueOf(area_maxStr);
        }
        PageInfo<House> housesByAllConditions = houseService.findHousesByAllConditions(houseStyle, "余杭区", price_min, price_max, area_min, area_max, null, null, page);
        PageInfo<House> housesByPriceAsc = houseService.findHousesByAllConditions(houseStyle,"余杭区",price_min,price_max,area_min,area_max,"publishdate","desc",page);
        PageInfo<House> housesByPriceDesc = houseService.findHousesByAllConditions(houseStyle,"余杭区",price_min,price_max,area_min,area_max,"price","asc",page);
        PageInfo<House> housesByDateAsc = houseService.findHousesByAllConditions(houseStyle,"余杭区",price_min,price_max,area_min,area_max,"price","desc",page);
        ArrayList<PageInfo<House>> pageInfos = new ArrayList<>();
        WebUtils.addList(pageInfos,housesByAllConditions,housesByDateAsc,housesByPriceAsc,housesByPriceDesc);
        return pageInfos;
    }

    @RequestMapping("findFriend")
    public String findFriend(){
        return "success";
    }
    @RequestMapping("houseSetting")
    public String houseSetting(HttpServletRequest req, @RequestParam("id")Integer id){
        List<String> allFacilities = redisTemplate.boundListOps("allFacilities").range(0,-1);
        //List<String> allFacilities = readJedis.lrange("allFacilities", 0, -1);
        List<String> personalFacilities = redisTemplate.boundListOps(id + "HousePersonal").range(0,-1);
        //List<String> personalFacilities = readJedis.lrange(id + "HousePersonal", 0, -1);
        List<String> publicFacilities = redisTemplate.boundListOps(id + "HousePublic").range(0,-1);
        //List<String> publicFacilities = readJedis.lrange(id + "HousePublic", 0, -1);
        List<String> allFacilities2 = allFacilities;
        allFacilities2.removeAll(publicFacilities);
        allFacilities.removeAll(personalFacilities);
        House house = houseService.findHouse(id);
        req.setAttribute("house",house);
        req.setAttribute("id",id);
        //私人设施没有的
        req.setAttribute("allFacilities",allFacilities);
        System.err.println(allFacilities);
        System.err.println(allFacilities2);
        System.err.println(personalFacilities);
        System.err.println(publicFacilities);
        //公共设置没有的
        req.setAttribute("allFacilities2",allFacilities2);
        //私人设施拥有的
        req.setAttribute("personal",personalFacilities);
        //公共设施拥有的
        req.setAttribute("publics",publicFacilities);
        //readJedis.close();
        return "HouseSetting";
    }
    @ResponseBody
    @PostMapping(value = "moreFileUpLoad")
    public String moreFileUpload(HttpServletRequest req) throws IOException {
        HttpSession session = req.getSession();
        //得到文件的列表
        List<MultipartFile> files = ((MultipartHttpServletRequest)req).getFiles("file");
        //String filePath = "F:\\HouseRent\\src\\main\\webapp\\img\\InnerHomeShow";
        System.err.println(11);
        String filePath = "E:\\44";
        //这里的地址文件上传到的地方
        System.err.println(22);
        Object idString = session.getAttribute("id");
        Integer id = null;
        id = (Integer)idString;
        System.err.println(33);
        Integer houseInnerMax = (Integer) redisTemplate.boundValueOps("houseInnerMaxNumber").get();
        //String houseInnerMax = readJedis.get("houseInnerMaxNumber");
        System.err.println("我是:"+houseInnerMax);
        if(houseInnerMax == null){
            redisTemplate.boundValueOps("houseInnerMaxNumber").set(0);
            //writeJedis.set("houseInnerMaxNumber","0");
        }
        redisTemplate.boundValueOps("houseInnerMaxNumber").increment();
        //writeJedis.incr("houseInnerMaxNumber");
        MultipartFile file = files.get(0);
        redisTemplate.boundListOps(idString+"List").leftPush(houseInnerMax);
        //writeJedis.lpush(idString+"List",houseInnerMax);
        File dest = new File(filePath ,houseInnerMax+".jpg");
        file.transferTo(dest);
        return "1";
    }
    @ResponseBody
    @RequestMapping("nextPage")
    public PageInfo<House> firstPage(HttpServletRequest req, @RequestParam("page") Integer page, @RequestParam("action")String action, @RequestParam("status")Integer status){
        String price = req.getParameter("price");
        String area = req.getParameter("area");
        String houseStyle = req.getParameter("houseStyle");
        Integer price_min = null;
        Integer price_max = null;
        if(price != null && !"f".equals(price)){
            price_min = Integer.valueOf(price);
            price_max = (Integer.valueOf(price))*2;
            if(price_min == 8000){
                price_max = 100000;
            }
        }

        Integer area_min = null;
        Integer area_max = null;
        if(area != null && !"f".equals(area)){
            area_min = Integer.valueOf(area);
            area_max = Integer.valueOf(area) + 20;
            if(area_min == 0){
                area_max = 50;
            }
        }
        if("f".equals(price)){
            String price_minString = req.getParameter("price_min");
            String price_maxString = req.getParameter("price_max");
            price_min = Integer.valueOf(price_minString);
            price_max = Integer.valueOf(price_maxString);
        }
        if("f".equals(area)){
            String area_minStr = req.getParameter("area_min");
            String area_maxStr = req.getParameter("area_max");
            area_min = Integer.valueOf(area_minStr);
            area_max = Integer.valueOf(area_maxStr);
        }
        if("default".equals(action)){
            if(status == 1){
                Integer countOfHouse = houseService.queryCountOfHouses();
                Integer pageNum = WebUtils.pageNum(countOfHouse, 6);
                PageInfo<House> housesByAllConditions = houseService.findHousesByAllConditions(houseStyle, "余杭区", price_min, price_max, area_min, area_max, null, null, pageNum);
                return housesByAllConditions;
            }
            PageInfo<House> housesByAllConditions = houseService.findHousesByAllConditions(houseStyle, "余杭区", price_min, price_max, area_min, area_max, null, null, page);
            return housesByAllConditions;
        }else if("dateAsc".equals(action)){
            if(status == 1){
                Integer countOfHouse = houseService.queryCountOfHouses();
                Integer pageNum = WebUtils.pageNum(countOfHouse, 6);
                PageInfo<House> housesByAllConditions = houseService.findHousesByAllConditions(houseStyle, "余杭区", price_min, price_max, area_min, area_max, "publishdate", "desc", pageNum);
                return housesByAllConditions;
            }
            PageInfo<House> housesByAllConditions = houseService.findHousesByAllConditions(houseStyle, "余杭区", price_min, price_max, area_min, area_max, "publishdate", "desc", page);
            return housesByAllConditions;
        }else if("priceAsc".equals(action)){
            if(status == 1){
                Integer countOfHouse = houseService.queryCountOfHouses();
                Integer pageNum = WebUtils.pageNum(countOfHouse, 6);
                PageInfo<House> housesByAllConditions = houseService.findHousesByAllConditions(houseStyle, "余杭区", price_min, price_max, area_min, area_max, "price", "asc", pageNum);
                return housesByAllConditions;
            }
            PageInfo<House> housesByAllConditions = houseService.findHousesByAllConditions(houseStyle, "余杭区", price_min, price_max, area_min, area_max, "price", "asc", page);
            return housesByAllConditions;
        }else if("priceDesc".equals(action)){
            if(status == 1){
                Integer countOfHouse = houseService.queryCountOfHouses();
                Integer pageNum = WebUtils.pageNum(countOfHouse, 6);
                PageInfo<House> housesByAllConditions = houseService.findHousesByAllConditions(houseStyle, "余杭区", price_min, price_max, area_min, area_max, "price", "desc", pageNum);
                return housesByAllConditions;
            }
            PageInfo<House> housesByAllConditions = houseService.findHousesByAllConditions(houseStyle, "余杭区", price_min, price_max, area_min, area_max, "price", "desc", page);
            return housesByAllConditions;
        }
        return null;
    }
    @ResponseBody
    @GetMapping("saveImformation")
    public String saveImformation(@RequestParam("pub[]")String[] pub, @RequestParam("per[]")String[] per, @RequestParam("id")Integer id, HttpServletRequest req){
        HouseOther param = WebUtils.getParam(req);
        WebUtils.addHouseOtherToList(redisTemplate,param,id);
        List<String> delList = new ArrayList();
        delList.add(id+"HousePersonal");
        delList.add(id+"HousePublic");
        redisTemplate.delete(delList);
        //writeJedis.del(id+"HousePersonal",id+"HousePublic");
        redisTemplate.boundListOps(id+"HousePersonal").leftPushAll(StringUtils.trimAll(pub));
        //writeJedis.lpush(id+"HousePersonal", StringUtils.trimAll(pub));
        redisTemplate.boundListOps(id+"HousePublic").leftPushAll(StringUtils.trimAll(per));
        //writeJedis.lpush(id+"HousePublic",StringUtils.trimAll(per));
        //writeJedis.close();
        return "ok";
    }

    @RequestMapping("exit")
    public String exit(HttpSession session){
        session.invalidate();
        return "forward:/index.jsp";
    }
    @ResponseBody
    @RequestMapping("orderHouse")
    public String orderHouse(@RequestParam("id")Integer id, HttpSession session){
        House house = houseService.findHouse(id);
        Object personId = session.getAttribute("id");
        Integer personIntegerId = (int)personId;
        Integer owner = house.getOwner();
        String emailById = clientService.findEmailById(owner);
        boolean b = orderService.insertOrderByRenter(new Order(owner,personIntegerId,house.getId(),emailById));
        if(b){
            return "ok";
        }else {
            return null;
        }
    }

    @ResponseBody
    @RequestMapping("addPersonalList")
    public String addPersonalListToRedis(@RequestParam("id")Integer id, HttpSession session){
        Object idObject = session.getAttribute("id");
        Integer idInteger = (int)idObject;
        Boolean exists = redisTemplate.hasKey(idInteger + "ListForWander");
        //Boolean exists = readJedis.exists(idInteger + "ListForWander");
        if(exists){
            List<String> lrange = redisTemplate.boundListOps(idInteger + "ListForWander").range(0,-1);
            //List<String> lrange = readJedis.lrange(idInteger + "ListForWander", 0, -1);
            if( lrange.contains(id)){
               //readJedis.close();
                return "exists";
            }
            //readJedis.close();
            redisTemplate.boundListOps(idInteger+"ListForWander").rightPush(id+"");
            //writeJedis.rpush(idInteger+"ListForWander",id+"");
            //writeJedis.close();
            return "ok";
        }else {
            //readJedis.close();
            redisTemplate.boundListOps(idInteger+"ListForWander").rightPush(id+"");
            //writeJedis.rpush(idInteger+"ListForWander",id+"");
            //writeJedis.close();
            return "ok";
        }
    }
    @ResponseBody
    @RequestMapping("findOrders")
    public orderMap<List<Order>> findOrders(HttpSession session, @RequestParam("page")Integer page, @RequestParam("limit")int limit){
        Object idObj = session.getAttribute("id");
        Integer id = (int)idObj;
        PageInfo<Order> ownerOrders = orderService.findOwnerOrders(id, page, limit);
        Integer ordersCount = orderService.findOrdersCount(id);
        List<Order> list = ownerOrders.getList();
        return new orderMap<>("1",0,list,ordersCount);
    }
    @ResponseBody
    @RequestMapping("removePersonalList")
    public String removePersonalList(HttpSession session, @RequestParam("id")Integer id){
        Object idObj = session.getAttribute("id");
        Integer idP = (int)idObj;
        redisTemplate.boundListOps(idP+"ListForWander").remove(0,id+"");
        //writeJedis.lrem(idP+"ListForWander",0,id+"");
        return "ok";
    }
    @ResponseBody
    @RequestMapping("removeHouse")
    public String removePersonalList(@RequestParam("id")Integer id){
        if(houseService.delHouseById(id)){
            return "ok";
        }
        return null;
    }
    @ResponseBody
    @RequestMapping("agreeRenter")
    public String agreeRenter(@RequestParam("id")Integer id, @RequestParam("renterid")Integer renterid){
        if(houseService.updateHouseToRenter(id,renterid)){
            return "ok";
        }
        return null;
    }
    @ResponseBody
    @RequestMapping("removeOrder")
    public String delOrder(@RequestParam("id")Integer id){
        if(orderService.delOrderById(id)){
            return "ok";
        }
        return null;
    }

    @ResponseBody
    @RequestMapping("pageHelp")
    public PageInfo<House> personalHouse(HttpServletRequest req,@RequestParam("page")Integer page){
        HttpSession session = req.getSession();
        Integer id = (Integer) session.getAttribute("id");
        if("houseOwner".equals(req.getParameter("action"))){
            if("1".equals(req.getParameter("status"))){
                Integer integer = houseService.queryCountOfHouses();
                if(integer % 3 == 0){
                    integer = integer / 3;
                }
                integer = integer / 3 + 1;
                return houseService.findHousesByOwnerId(Integer.valueOf(id),integer);
            }
            return houseService.findHousesByOwnerId(Integer.valueOf(id),page);
        }else if("houseRenter".equals(req.getParameter("action"))){
            if("1".equals(req.getParameter("status"))){
                Integer integer = houseService.queryCountOfHouses();
                if(integer % 3 == 0){
                    integer = integer / 3;
                }
                integer = integer / 3 + 1;
                return houseService.findHousesByRenterId(Integer.valueOf(id),integer);
            }
            return houseService.findHousesByRenterId(Integer.valueOf(id),page);
        }else if("houseList".equals(req.getParameter("action"))){
            List<Integer> range = redisTemplate.boundListOps(id + "ListForWander").range(0, -1);
            if(range.size() == 0){
                return null;
            }
            if("1".equals(req.getParameter("status"))){

                Integer integer = houseService.queryCountOfHouses();
                if(integer % 3 == 0){
                    integer = integer / 3;
                }
                integer = integer / 3 + 1;
                return houseService.findListHouse(range,integer);
            }
            return houseService.findListHouse(range,page);

        }else if("history".equals(req.getParameter("action"))){
            List<Integer> historyList = redisTemplate.boundListOps(id + "_history").range(0, -1);
            if(historyList.size() == 0 || historyList == null){
                return null;
            }
            if("1".equals(req.getParameter("status"))){

                Integer integer = houseService.queryCountOfHouses();
                if(integer % 3 == 0){
                    integer = integer / 3;
                }
                integer = integer / 3 + 1;
                return houseService.findListHouse(historyList,integer);
            }
            return houseService.findListHouse(historyList,page);
        }
        return null;
    }
}
