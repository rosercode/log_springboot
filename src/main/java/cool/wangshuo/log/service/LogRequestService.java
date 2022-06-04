package cool.wangshuo.log.service;

import cool.wangshuo.log.entity.LogRequestEntity;


/**
 * 用户请求日志信息表(LogRequest)表服务接口
 *
 * @author wangsh
 * @since 2022-06-04 15:32:50
 */
public interface LogRequestService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    LogRequestEntity queryById(Integer id);


    /**
     * 新增数据
     *
     * @param logRequestEntity 实例对象
     * @return 实例对象
     */
    LogRequestEntity insert(LogRequestEntity logRequestEntity);


    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean deleteById(Integer id);

}
