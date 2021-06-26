package com.admin.service;

import com.bean.Order;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @PackageName: com.admin.service
 * @InterfaceName: OrderService
 * @Description:
 * @author:
 * @date: 2021/6/23 15:34
 */
public interface OrderService {

    public String selectSeatOrder(int sid, Model model, HttpSession session);

    public String selectOrders(int currPage, Model model);

    public String deleteOrder(int oid, Model model);

    public String deleteOrderUser(int uid, Model model);

    public String deleteOrders(int[] oids, Model model);

    public String order(int sid, int aid, int uid, String start, String end, Model model);

    public String selectUserOrder(int uid, Model model);
}
