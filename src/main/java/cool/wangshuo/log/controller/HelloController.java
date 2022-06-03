package cool.wangshuo.log.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author wangsh
 * @date 2022/6/3 20:52
 */

@RestController
public class HelloController {

    @RequestMapping(value = "/")
    public String hello(){
        return "Hello,World";
    }

}
