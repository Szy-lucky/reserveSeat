package com.admin.service;

import com.bean.Area;
import org.springframework.ui.Model;

/**
 * @PackageName: com.admin.service
 * @ClassName: AreaService
 * @Description:
 * @author:
 * @date: 2021/6/16 14:52
 */
public interface AreaService {
    public String addArea(Area area, Model model);

    public String selectAreas(Model model);

    public String updateArea(Area area, Model model);

    public String updateAreaId(Area area, Model model);

    public String selectAreaById(int aid,Model model);

    public String selectAreaByName(String aname,Model model);

    public String deleteArea(int aid, Model model);

    public String deleteAreas(int[] aids,Model model);
}
