package cool.wangshuo.log.mapper;

import cool.wangshuo.log.entity.LogRequestEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * 用户请求日志信息表(LogRequest)表数据库访问层
 *
 * @author wangsh
 * @since 2022-06-04 15:32:50
 */
@Mapper
public interface LogRequestMapper {

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
     * @return 影响行数
     */
    int insert(LogRequestEntity logRequestEntity);

    /**
     * 批量新增数据（MyBatis原生foreach方法）
     *
     * @param entities List<LogRequest> 实例对象列表
     * @return 影响行数
     */
    int insertBatch(@Param("entities") List<LogRequestEntity> entities);


    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(Integer id);

}

