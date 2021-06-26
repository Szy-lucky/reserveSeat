package com.bean;

/**
 * @PackageName: com.bean
 * @ClassName: Seat
 * @Description:
 * @author:
 * @date: 2021/6/15 19:33
 */
public class Seat {
    private int seatid;
    private String seatname;
    private String spic;
    private int areaid;

    private String haselectricity;

    private String reservation;
    private String intr;
    public int getSeatid() {
        return seatid;
    }

    public void setSeatid(int seatid) {
        this.seatid = seatid;
    }

    public String getSpic() {
        return spic;
    }

    public void setSpic(String spic) {
        this.spic = spic;
    }

    public String getSeatname() {
        return seatname;
    }

    public void setSeatname(String seatname) {
        this.seatname = seatname;
    }

    public int getAreaid() {
        return areaid;
    }

    public void setAreaid(int areaid) {
        this.areaid = areaid;
    }

    public String getHaselectricity() {
        return haselectricity;
    }

    public void setHaselectricity(String haselectricity) {
        this.haselectricity = haselectricity;
    }

    public String getReservation() {
        return reservation;
    }

    public void setReservation(String reservation) {
        this.reservation = reservation;
    }

    public String getIntr() {
        return intr;
    }

    public void setIntr(String intr) {
        this.intr = intr;
    }
}
