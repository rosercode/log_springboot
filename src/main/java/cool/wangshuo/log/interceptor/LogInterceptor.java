package cool.wangshuo.log.interceptor;

import  cool.wangshuo.log.LogManager;
import cool.wangshuo.log.entity.LogRequestEntity;
import cool.wangshuo.log.service.LogRequestService;
import cool.wangshuo.log.utils.CommonUtils;
import cool.wangshuo.log.utils.SpringUtil;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Enumeration;

/**
 * 日志信息收集拦截器
 * @author wangsh
 * @date 2022/6/4 15:21
 */

@Component
public class LogInterceptor extends LogManager implements HandlerInterceptor {


    public LogInterceptor(){

    }


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {


        request.setAttribute("http_id", CommonUtils.uuid()); // 主键 id
        request.setAttribute("stime", System.currentTimeMillis());  // 开始时间

        // 拦截后端接口
        if (handler instanceof HandlerMethod) {


        }else{
            // 静态资源
        }


        return true;
    }


    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);

        long stime = (long) request.getAttribute("stime");
        long etime = System.currentTimeMillis();  // 结束时间

        // 获取请求头信息
        Enumeration<String> headerNames = request.getHeaderNames();
        StringBuilder header = new StringBuilder();
        while (headerNames.hasMoreElements()){
            String headerName =  (String) headerNames.nextElement();
            header.append(headerName + "=" + request.getHeader(headerName) + ";");
        }

        LogRequestEntity logRequestEntity = LogRequestEntity.builder()
                .id((String) request.getAttribute("http_id"))
                .timeLength(etime - stime)
                .protocol(request.getProtocol())
                .clientPort(request.getRemotePort())
                .clientIp(request.getRemoteAddr())
                .header(header.toString())
                .url(request.getRequestURI())
                .build();
        LogRequestService logRequestService = SpringUtil.getBean(LogRequestService.class);
        logRequestService.insert(logRequestEntity);
        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
    }
}
