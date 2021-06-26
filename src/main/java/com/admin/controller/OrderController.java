package com.admin.controller;

import com.admin.service.OrderService;
import com.bean.Order;
import com.bean.Seat;
import com.bean.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * @PackageName: com.admin.controller
 * @ClassName: OrderController
 * @Description:
 * @author:
 * @date: 2021/6/23 16:06
 */
@Controller
@RequestMapping("order")
public class OrderController {


    @Autowired
    OrderService orderService;

    @RequestMapping("selectSeatOrder")
    public String selectSeatOrder(int sid, Model model, HttpSession session) {
        return orderService.selectSeatOrder(sid, model, session);
    }

    @RequestMapping("selectOrders")
    public String selectOrders(String currPage, Model model, HttpSession session) {
        if(currPage!="" && currPage!=null) {
            session.setAttribute("currPage", currPage);
        }
        String s=(String)session.getAttribute("currPage");
        int cpage=Integer.parseInt(s);
        return orderService.selectOrders(cpage, model);
    }

    @RequestMapping("deleteOrder")
    public String deleteOrder(int oid, Model model) {
        return orderService.deleteOrder(oid, model);
    }

    @RequestMapping("deleteOrderUser")
    public String deleteOrderUser(int uid, Model model) {
        return orderService.deleteOrderUser(uid, model);
    }

    @RequestMapping("deleteOrders")
    public String deleteOrders(int[] oids, Model model) {
        return orderService.deleteOrders(oids, model);
    }

    @RequestMapping("order")
    public String order(Order order, Model model, HttpSession session){
        String start = order.getStart();
        String end = order.getEnd();
        User user = (User) session.getAttribute("user");
        Seat seat = (Seat) session.getAttribute("seat");
        int uid = user.getUid();
        int sid = seat.getSeatid();
        return orderService.order(sid, seat.getAreaid(), uid, start, end, model);
    }

    @RequestMapping("selectOrder")
    public String selectOrder(Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        int uid = user.getUid();
        return orderService.selectUserOrder(uid, model);
    }
}
