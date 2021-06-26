package com.admin.dao;

import com.bean.Seat;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @PackageName: com.admin.dao
 * @ClassName: SeatDao
 * @Description:
 * @author:
 * @date: 2021/6/15 19:33
 */
@Repository
@Mapper
public interface SeatDao {
    public int addSeat(Seat seat);

    public List<Seat> selectSeats(int area);

    public List<Seat> selectSeatsP(int area, int start, int end);

    public int count(int area);

    public Seat selectSeat(int seatid);

    public List<Seat> selectSeatByName(String seatname, int seatid);

    public int updateSeat(Seat seat);

    public int deleteSeat(int seatid);

    public int deleteSeats(int[] seatids);
}
