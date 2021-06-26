package com.admin.controller;

import com.admin.service.SeatService;
import com.bean.Seat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @PackageName: com.admin.controller
 * @ClassName: SeatController
 * @Description:
 * @author:
 * @date: 2021/6/16 18:38
 */
@Controller
@RequestMapping("admin")
public class SeatController {

    @Autowired
    SeatService seatService;

    @RequestMapping("getSeatAdd")
    public String getSeatAdd(Seat seat, Model model){
        return seatService.getSeatAdd(seat, model);
    }

    @RequestMapping("addSeat")
    public String addSeat(Seat seat, Model model, MultipartFile myFile, HttpServletRequest req) {
        return seatService.addSeat(seat, model, myFile, req);
    }

    @RequestMapping("getSeatsUser")
    public String getSeats(String area, Model model) {
        return seatService.getSeatsUser(area, model);
    }

    @RequestMapping("getSeatsAdmin")
    public String getSeatsAdmin(String currPage, String area, Model model, HttpSession session) {
        if(currPage!="" && currPage!=null) {
            session.setAttribute("currPage", currPage);
        }
        String s=(String)session.getAttribute("currPage");
        int cpage=Integer.parseInt(s);
        return seatService.getSeatsAdmin(cpage, area, model);
    }

    @RequestMapping("selectSeat")
    public String selectSeat(int seatid, Model model) {
        return seatService.selectSeat(seatid, model);
    }

    @RequestMapping("selectSeatByName")
    public String selectSeatByName(String seatname, String area, Model model) {
        if(seatname == "" ){
            return seatService.getSeatsAdmin(1, area, model);
        }
        return seatService.selectSeatByName(seatname, area, model);
    }

    @RequestMapping("updateSeat")
    public String updateSeat(Seat seat, Model model){
        return seatService.updateSeat(seat, model);
    }

    @RequestMapping("deleteSeat")
    public String deleteSeat(int seatid, Model model) {
        return seatService.deleteSeat(seatid, model);
    }

    @RequestMapping("deleteSeats")
    public String deleteSeats(int[] seatids, Model model) {
        return seatService.deleteSeats(seatids, model);
    }
}
