package com.admin.dao;

import com.bean.Area;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @PackageName: com.admin.dao
 * @InterfaceName: AreaDao
 * @Description:
 * @author:
 * @date: 2021/6/16 14:22
 */
@Repository
@Mapper
public interface AreaDao {
    public List<Area> selectAreas();

    public int addArea(Area area);

    public int updateArea(Area area);

    public int updateAreaId(Area area);

    public Area selectAreaById(int aid);

    public Area selectAreaByName(String aname);

    public int deleteArea(int aid);

    public int deleteAreas(int[] aids);
}
