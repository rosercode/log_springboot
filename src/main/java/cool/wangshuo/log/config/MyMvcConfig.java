package cool.wangshuo.log.config;

import cool.wangshuo.log.interceptor.LogInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author wangsh
 * @date 2022/4/29 14:21
 */

@Configuration
public class MyMvcConfig implements WebMvcConfigurer {


    // ......
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LogInterceptor())
                .addPathPatterns("/**");
    }
}
