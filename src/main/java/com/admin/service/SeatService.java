package com.admin.service;

import com.bean.Seat;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

/**
 * @PackageName: com.admin.service
 * @ClassName: SeatService
 * @Description:
 * @author:
 * @date: 2021/6/16 18:34
 */
public interface SeatService {

    public String getSeatAdd(Seat seat, Model model);

    public String addSeat(Seat seat, Model model, MultipartFile myFile, HttpServletRequest req);

    public String getSeatsUser(String aname, Model model);

    public String getSeatsAdmin(int currPage, String aname, Model model);

    public String selectSeat(int seatid, Model model);

    public String selectSeatByName(String seatname,String anem, Model model);

    public String updateSeat(Seat seat, Model model);

    public String deleteSeat(int seatid, Model model);

    public String deleteSeats(int[] seatids, Model model);

}
