package cool.wangshuo.log.service.impl;

import cool.wangshuo.log.entity.LogRequestEntity;
import cool.wangshuo.log.mapper.LogRequestMapper;
import cool.wangshuo.log.service.LogRequestService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 用户请求日志信息表(LogRequest)表服务实现类
 *
 * @author wangsh
 * @since 2022-06-04 15:32:50
 */
@Service("logRequestService")
public class LogRequestServiceImpl implements LogRequestService {

    @Resource
    private LogRequestMapper logRequestMapper;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public LogRequestEntity queryById(Integer id) {
        return this.logRequestMapper.queryById(id);
    }



    /**
     * 新增数据
     *
     * @param logRequestEntity 实例对象
     * @return 实例对象
     */
    @Override
    public LogRequestEntity insert(LogRequestEntity logRequestEntity) {
        this.logRequestMapper.insert(logRequestEntity);
        return logRequestEntity;
    }


    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer id) {
        return this.logRequestMapper.deleteById(id) > 0;
    }
}
