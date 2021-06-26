package com.admin.service;

import com.admin.dao.AreaDao;
import com.bean.Area;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

/**
 * @PackageName: com.admin.service
 * @ClassName: AreaServiceImpl
 * @Description:
 * @author:
 * @date: 2021/6/16 14:55
 */
@Service("areaService")
public class AreaServiceImpl implements AreaService {

    @Autowired
    AreaDao areaDao;

    @Override
    public String addArea(Area area, Model model) {
        try {
            areaDao.addArea(area);
            return "admin/succ";
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            model.addAttribute("mess", "添加失败！");
            return "admin/addArea";
        }
    }

    @Override
    public String selectAreas(Model model) {
        try {
            List<Area> areas = areaDao.selectAreas();
            model.addAttribute("areas", areas);
            return "admin/areaTypeShow";
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            return "admin/main";
        }
    }

    @Override
    public String updateArea(Area area, Model model) {
        try {
            int i = areaDao.updateArea(area);
            if(i>0) {
                model.addAttribute("mess", "修改成功！");
            }else {
                model.addAttribute("mess", "修改失败！");
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            model.addAttribute("mess", "数据库访问异常！");
        }
        return "forward:selectAreas";
    }

    @Override
    public String updateAreaId(Area area, Model model) {
        try {
            int i = areaDao.updateAreaId(area);
            if(i>0) {
                model.addAttribute("mess", "修改成功！");
            }else {
                model.addAttribute("mess", "修改失败！");
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            model.addAttribute("mess", "数据库访问异常！");
        }
        return "forward:selectAreas";
    }

    @Override
    public String selectAreaById(int aid, Model model) {
        Area area = areaDao.selectAreaById(aid);
        model.addAttribute("area", area);

        return "admin/areaUpdate";
    }

    @Override
    public String selectAreaByName(String aname, Model model) {
        Area area = areaDao.selectAreaByName(aname);
        model.addAttribute("area", area);
        return "admin/areaUpdateId";
    }


    @Override
    public String deleteArea(int aid, Model model) {
        try {
            int i = areaDao.deleteArea(aid);
            if(i>0) {
                return "admin/succ";
            }else {
                model.addAttribute("mess", "删除失败！");
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            model.addAttribute("mess", "数据库访问异常！");

        }
        return "forward:selectAreas";
    }

    @Override
    public String deleteAreas(int[] aids, Model model) {
        try {
            int i = areaDao.deleteAreas(aids);
            if(i>0) {
                return "admin/succ";
            }else {
                model.addAttribute("mess", "删除失败！");
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            model.addAttribute("mess", "数据库访问异常！");

        }
        return "forward:selectAreas";
    }
}
