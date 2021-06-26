package com.admin.controller;

import com.admin.service.AreaService;
import com.bean.Area;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @PackageName: com.admin.controller
 * @ClassName: AreaController
 * @Description:
 * @author:
 * @date: 2021/6/16 15:04
 */
@Controller
@RequestMapping("admin")
public class AreaController {

    @Autowired
    AreaService areaService;

    @RequestMapping("addArea")
    public String addArea(Area area, Model model) {
        return areaService.addArea(area, model);
    }


    @RequestMapping("selectAreas")
    public String selectAreas(Model model){
        return areaService.selectAreas(model);
    }

    @RequestMapping("updateArea")
    public String updateArea(Area area, Model model){
        return areaService.updateArea(area, model);
    }

    @RequestMapping("selectAreaById")
    public String selectAreaById(int aid, Model model) {
        return areaService.selectAreaById(aid, model);
    }

    @RequestMapping("selectAreaByName")
    public String selectAreaByName(String aname, Model model) {
        return areaService.selectAreaByName(aname, model);
    }

    @RequestMapping("updateAreaId")
    public String updateAreaId(Area area, Model model){
        return areaService.updateAreaId(area, model);
    }

    @RequestMapping("deleteAreaById")
    public String deleteAreaById(int aid, Model model) {
        return areaService.deleteArea(aid, model);
    }

    @RequestMapping("deleteAreas")
    public String deleteAreas(int[] aids, Model model) {
        return areaService.deleteAreas(aids, model);
    }
}
