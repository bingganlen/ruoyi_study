package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.SysAttachment;
import java.util.List;

/**
 * 附件Mapper接口
 * 
 * @author ruoyi
 * @date 2019-09-18
 */
public interface SysAttachmentMapper 
{
    /**
     * 查询附件
     * 
     * @param id 附件ID
     * @return 附件
     */
    public SysAttachment selectSysAttachmentById(Integer id);

    /**
     * 查询附件列表
     * 
     * @param sysAttachment 附件
     * @return 附件集合
     */
    public List<SysAttachment> selectSysAttachmentList(SysAttachment sysAttachment);

    /**
     * 新增附件
     * 
     * @param sysAttachment 附件
     * @return 结果
     */
    public int insertSysAttachment(SysAttachment sysAttachment);

    /**
     * 修改附件
     * 
     * @param sysAttachment 附件
     * @return 结果
     */
    public int updateSysAttachment(SysAttachment sysAttachment);

    /**
     * 删除附件
     * 
     * @param id 附件ID
     * @return 结果
     */
    public int deleteSysAttachmentById(Integer id);

    /**
     * 批量删除附件
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysAttachmentByIds(String[] ids);
}
