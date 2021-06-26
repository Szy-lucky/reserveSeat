package com.admin.dao;

import com.bean.Order;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @PackageName: com.admin.dao
 * @InterfaceName: OrderDao
 * @Description:
 * @author:
 * @date: 2021/6/23 15:18
 */
@Repository
@Mapper
public interface OrderDao {
    public List<Order> selectOrders(int sid);

    public List<Order> selectOrdersAdmin(int start, int end);

    public int countOrders();

    public int deleteOrder(int oid);

    public int deleteOrderUser(int uid);

    public int deleteOrderUsers(int[] uids);

    public int deleteOrders(int[] oids);

    public int order(int sid, int aid, int uid, String start, String end);

    public Order selectUserOrder(int uid);
}
