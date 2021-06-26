package com.admin.service;

import com.admin.dao.AreaDao;
import com.admin.dao.OrderDao;
import com.admin.dao.SeatDao;
import com.bean.Area;
import com.bean.Order;
import com.bean.Seat;
import com.bean.User;
import com.user.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * @PackageName: com.admin.service
 * @ClassName: OrderServiceImpl
 * @Description:
 * @author:
 * @date: 2021/6/23 15:36
 */
@Service("orderServiceImpl")
public class OrderServiceImpl implements OrderService{

    @Autowired
    OrderDao orderDao;

    @Autowired
    AreaDao areaDao;

    @Autowired
    UserDao userDao;

    @Autowired
    SeatDao seatDao;

    @Override
    public String selectSeatOrder(int sid, Model model, HttpSession session) {
        Seat seat = seatDao.selectSeat(sid);
        Area area = areaDao.selectAreaById(seat.getAreaid());
        List<String> orderStarts = new ArrayList<>();
        List<String> orderEnds = new ArrayList<>();
        List<Order> orders = orderDao.selectOrders(sid);
        int[] times = new int[48];
        int count = 0;
        Iterator<Order> iterator = orders.iterator();
        while (iterator.hasNext()){
            Order next = iterator.next();
            String start = next.getStart();
            String end = next.getEnd();
            String[] starts = start.split(":");
            String[] ends = end.split(":");
            int i = Integer.parseInt(starts[0]);
            int i1 = Integer.parseInt(starts[1]);
            int i2 = Integer.parseInt(ends[0]);
            int i3 = Integer.parseInt(ends[1]);
            int start2;
            int end2;
            if(i !=0 || i1 != 0){
                orderEnds.add(start);
            }
            if(i1 == 30){
                start2 = 2 * i + 1;
            }else{
                start2 = 2 * i;
            }
            if(i3 == 30){
                end2 = 2 * i2 + 1;
            }else{
                end2 = 2 * i2;
            }
            for (int j = start2; j < end2; j++){
                times[j] = 1;
                count++;
            }
        }

        String[] time = {"0:00","0:30","1:00","1:30","2:00","2:30","3:00","3:30","4:00","4:30","5:00","5:30","6:00","6:30","7:00","7:30"
                ,"8:00","8:30","9:00","9:30","10:00","10:30","11:00","11:30","12:00","12:30","13:00","13:30","14:00","14:30","15:00","15:30"
                ,"16:00","16:30","17:00","17:30","18:00","18:30","19:00","19:30","20:00","20:30","21:00","21:30","22:00","22:30","23:00","23:30"
                ,"24:00"};
        for (int i = 0; i < times.length; i++) {
            if (i < 1){
                if (times[i] == 0){
                    orderStarts.add(time[i]);
                }
            }else{
                if (times[i] == 0){
                    orderStarts.add(time[i]);
                    orderEnds.add(time[i]);
                }
                if(i == times.length - 1){
                    if (times[i] == 0){
                        orderEnds.add(time[i + 1]);
                    }
                }
            }
        }
        Iterator<Order> iterator2 = orders.iterator();
        while (iterator2.hasNext()){
            Order next = iterator2.next();
            String end = next.getEnd();
            orderEnds.remove(end);
        }
        Collections.sort(orderEnds, new Comparator<String>() {
            @Override
            public int compare(String o1, String o2) {
                String[] starts = o1.split(":");
                String[] ends = o2.split(":");
                int i = Integer.parseInt(starts[0]);
                int i1 = Integer.parseInt(starts[1]);
                int i2 = Integer.parseInt(ends[0]);
                int i3 = Integer.parseInt(ends[1]);
                if(i == i2){
                    return i1 - i3;
                }else{
                    return i - i2;
                }
            }
        });
        session.setAttribute("seat",seat);
        model.addAttribute("orderStarts", orderStarts);
        model.addAttribute("orderEnds", orderEnds);
        model.addAttribute("times", times);
        model.addAttribute("area", area);
        model.addAttribute("seat", seat);
        return "user/seatShow";
    }

    @Override
    public String selectOrders(int currPage, Model model) {
        int pageSize=9;
        int countPage;
        int starIndex=(currPage-1)*pageSize;
        int endIndex=starIndex+pageSize;
        int len=orderDao.countOrders();
        countPage=len/pageSize+1;
        if(len%pageSize==0) {
            countPage=countPage-1;
        }
        if(currPage==countPage) {
            endIndex=len;
        }
        List<Order> orders = orderDao.selectOrdersAdmin(starIndex,pageSize);
        model.addAttribute("orders", orders);
        model.addAttribute("currPage", currPage);
        model.addAttribute("countPage", countPage);
        model.addAttribute("starIndex", starIndex);

        return "admin/orderShow";
    }

    @Override
    public String deleteOrder(int oid, Model model) {
        try {
            int i = orderDao.deleteOrder(oid);
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
        return "forward:selectOrders";
    }

    @Override
    public String deleteOrderUser(int uid, Model model) {
        try {
            int i = orderDao.deleteOrderUser(uid);
            if(i>0) {
                model.addAttribute("mess", "取消成功！");
                return "user/main";
            }else {
                model.addAttribute("mess", "删除失败！");
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            model.addAttribute("mess", "数据库访问异常！");

        }
        return "user/orderShow";
    }

    @Override
    public String deleteOrderUsers(int[] uid, Model model) {
        try {
            int i = orderDao.deleteOrderUsers(uid);
            if(i>0) {
                model.addAttribute("mess", "取消成功！");
                return "user/main";
            }else {
                model.addAttribute("mess", "删除失败！");
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            model.addAttribute("mess", "数据库访问异常！");

        }
        return "user/orderShow";
    }

    @Override
    public String deleteOrders(int[] oids, Model model) {
        try {
            int i = orderDao.deleteOrders(oids);
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
        return "forward:selectOrders";
    }

    @Override
    public String order(int sid, int aid, int uid, String start, String end, Model model) {
        User user = userDao.selectUser(uid);
        if(user.getCredit().equals("y")){
            model.addAttribute("mess", "该账号违约！请联系管理员");
            return "user/main";
        }
        Order order1 = orderDao.selectUserOrder(uid);
        if(order1!=null){
            model.addAttribute("mess", "已有预约");
            return "forward:selectOrder";
        }
        String[] starts = start.split(":");
        String[] ends = end.split(":");
        int i = Integer.parseInt(starts[0]);
        int i1 = Integer.parseInt(starts[1]);
        int i2 = Integer.parseInt(ends[0]);
        int i3 = Integer.parseInt(ends[1]);
        if(i > i2){
            model.addAttribute("mess", "时间选择有误请重新选择！");
            return "forward:selectSeatOrder?sid=" + sid;
        }else if(i == i2){
            if(i1 > i3){
                model.addAttribute("mess", "时间选择有误请重新选择！");
                return "forward:selectSeatOrder?sid=" + sid;
            }
        }
        try {
            int order = orderDao.order(sid, aid, uid, start, end);
            if(order > 0){
                model.addAttribute("mess", "预约成功");
                return "forward:selectOrder";
            }
            else {
                model.addAttribute("mess", "预约失败!");
                return "forward:selectSeatOrder?sid=" + sid;
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            model.addAttribute("mess", "预约失败!");
            return "forward:selectSeatOrder?sid=" + sid;
        }

    }

    @Override
    public String selectUserOrder(int uid, Model model) {
        Order order = orderDao.selectUserOrder(uid);
        Area area = null;
        Seat seat = null;
        if(order==null){
            return "user/orderShowNull";
        }
        area = areaDao.selectAreaById(order.getAid());
        seat = seatDao.selectSeat(order.getSid());
        model.addAttribute("seat", seat);
        model.addAttribute("area", area);
        model.addAttribute("order", order);
        return "user/orderShow";
    }

}
