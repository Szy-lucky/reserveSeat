package com.admin.service;

import com.admin.dao.AreaDao;
import com.admin.dao.SeatDao;
import com.bean.Area;
import com.bean.Seat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;

/**
 * @PackageName: com.admin.service
 * @ClassName: SeatServiceImpl
 * @Description:
 * @author:
 * @date: 2021/6/16 18:35
 */
@Service("seatServiceImpl")
public class SeatServiceImpl implements SeatService{

    @Autowired
    AreaDao areaDao;

    @Autowired
    SeatDao seatDao;

    //***************************************
    public String fileUpload(MultipartFile myFile, HttpServletRequest req) {
        //***指定上传文件的上传路劲
        //http://localhost:8080/myproject2021_demo/a/b/uploadfiles
        String realPath=req.getServletContext().getRealPath("uploadfiles");
        String fileName=myFile.getOriginalFilename();
        File filePath=new File(realPath);
        if (!filePath.exists()) {
            filePath.mkdirs();
        }
        File saveFile=new File(filePath,fileName);
        try {
            myFile.transferTo(saveFile);
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return fileName;
    }

    @Override
    public String getSeatAdd(Seat seat, Model model) {
        List<Area> areas = areaDao.selectAreas();
        model.addAttribute("seat", seat);
        model.addAttribute("areas", areas);
        return "admin/seatAdd";
    }

    @Override
    public String addSeat(Seat seat, Model model, MultipartFile myFile, HttpServletRequest req) {
        try {
            //***实现图片上传*********************//
            if(!myFile.isEmpty()) {
                String spic=fileUpload(myFile, req);
                seat.setSpic(spic);
            }
            int n = seatDao.addSeat(seat);
            if(n>0) {
                return "admin/succ";
            }else {
                model.addAttribute("mess", "输入的信息有误！");
            }

        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            model.addAttribute("mess", "数据库访问异常！");
        }
        model.addAttribute("seat", seat);
        List<Area> areas = areaDao.selectAreas();
        model.addAttribute("areas",areas);
        return "admin/seatAdd";
    }

    @Override
    public String getSeatsUser(String aname, Model model) {
        Area area = areaDao.selectAreaByName(aname);
        List<Seat> seats = seatDao.selectSeats(area.getAid());
        model.addAttribute("area",aname);
        model.addAttribute("seats", seats);
        return "user/seatshowuser";
    }

    @Override
    public String getSeatsAdmin(int currPage, String aname, Model model) {
        Area area = areaDao.selectAreaByName(aname);

        int pageSize=9;
        int countPage;
        int starIndex=(currPage-1)*pageSize;
        int endIndex=starIndex+pageSize;
        int len=seatDao.count(area.getAid());
        countPage=len/pageSize+1;
        if(len%pageSize==0) {
            countPage=countPage-1;
        }
        if(currPage==countPage) {
            endIndex=len;
        }
        List<Seat> seats = seatDao.selectSeatsP(area.getAid(), starIndex, pageSize);
        model.addAttribute("seats", seats);
        model.addAttribute("currPage", currPage);
        model.addAttribute("countPage", countPage);
        model.addAttribute("starIndex", starIndex);

        model.addAttribute("area",aname);
        return "admin/seatShow";
    }

    @Override
    public String selectSeat(int seatid, Model model) {
        Seat seat = seatDao.selectSeat(seatid);
        List<Area> areas = areaDao.selectAreas();
        model.addAttribute("areas", areas);
        model.addAttribute("seat", seat);
        return "admin/seatUpdate";
    }

    @Override
    public String selectSeatByName(String seatname, String aname, Model model) {
        Area area = areaDao.selectAreaByName(aname);
        List<Seat> seats = seatDao.selectSeatByName(seatname, area.getAid());
        model.addAttribute("area",aname);
        model.addAttribute("seats", seats);
        return "admin/seatShow";
    }

    @Override
    public String updateSeat(Seat seat, Model model) {
        Area area = areaDao.selectAreaById(seat.getAreaid());
        try {
            int i = seatDao.updateSeat(seat);
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
        return "forward:getSeatsAdmin?area=" + area.getAname() +"&currPage=1";
    }

    @Override
    public String deleteSeat(int seatid, Model model) {
        Area area = areaDao.selectAreaById(seatid);
        try {
            int i = seatDao.deleteSeat(seatid);
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
        return "forward:getSeatsAdmin?area=" + area.getAname() +"&currPage=1";
    }

    @Override
    public String deleteSeats(int[] seatids, Model model) {
        Area area = areaDao.selectAreaById(seatids[0]);
        try {
            int i = seatDao.deleteSeats(seatids);
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
        return "forward:getSeatsAdmin?area=" + area.getAname() +"&currPage=1";
    }

}
