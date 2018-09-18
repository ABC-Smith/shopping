package com.tedu.entity;

import java.io.Serializable;
import java.util.Date;

public class Goods implements Serializable {
    private Integer gid;

    private String gname;

    private Integer number;

    private String types;

    private String producer;

    private Float price;

    private Float carriage;

    private Date pdate;

    private String paddress;

    private String described;

    private static final long serialVersionUID = 1L;

    public Integer getGid() {
        return gid;
    }

    public void setGid(Integer gid) {
        this.gid = gid;
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname == null ? null : gname.trim();
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getTypes() {
        return types;
    }

    public void setTypes(String types) {
        this.types = types == null ? null : types.trim();
    }

    public String getProducer() {
        return producer;
    }

    public void setProducer(String producer) {
        this.producer = producer == null ? null : producer.trim();
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Float getCarriage() {
        return carriage;
    }

    public void setCarriage(Float carriage) {
        this.carriage = carriage;
    }

    public Date getPdate() {
        return pdate;
    }

    public void setPdate(Date pdate) {
        this.pdate = pdate;
    }

    public String getPaddress() {
        return paddress;
    }

    public void setPaddress(String paddress) {
        this.paddress = paddress == null ? null : paddress.trim();
    }

    public String getDescribed() {
        return described;
    }

    public void setDescribed(String described) {
        this.described = described == null ? null : described.trim();
    }

	@Override
	public String toString() {
		return "Goods [gid=" + gid + ", gname=" + gname + ", number=" + number + ", types=" + types + ", producer="
				+ producer + ", price=" + price + ", carriage=" + carriage + ", pdate=" + pdate + ", paddress="
				+ paddress + ", described=" + described + "]";
	}
    
    
}