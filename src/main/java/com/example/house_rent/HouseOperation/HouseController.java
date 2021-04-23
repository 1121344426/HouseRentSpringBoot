package com.example.house_rent.HouseOperation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HouseController {
    @RequestMapping("success")
    public String success(){
        return "success";
    }
}
