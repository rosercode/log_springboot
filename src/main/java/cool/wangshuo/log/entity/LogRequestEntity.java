package cool.wangshuo.log.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 用户请求日志信息表(LogRequest)实体类
 *
 * @author wangsh
 * @since 2022-06-04 15:32:50
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class LogRequestEntity implements Serializable {
    private static final long serialVersionUID = -51174392276273731L;
    /**
     * 主键ID
     */
    private String id;

    /**
     * 请求的客户端Ip
     */
    private String clientIp;

    /**
     * 协议
     */
    private String protocol;

    private Integer clientPort;

    /**
     * 请求的路径信息
     */
    private String url;
    /**
     * 请求头
     */
    private String header;
    /**
     * 请求的时间长度
     */
    private Long timeLength;

}

