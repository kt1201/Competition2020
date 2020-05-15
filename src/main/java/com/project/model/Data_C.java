package com.project.model;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

@Data
@Table(name = "gamma")
@Entity
public class Data_C implements Serializable{
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Long sq;
	public String host;
	public double col1;
	public double col2;
	public double col3;
	public double col4;
	public int label;
	public int result;
	public Date createTime;
	public Date regTime;

//	public int getSq() {
//		return sq;
//	}
//	public void setSq(int sq) {
//		this.sq = sq;
//	}
//	public double getCol1() {
//		return col1;
//	}
//	public void setCol1(double col1) {
//		this.col1 = col1;
//	}
//	public double getCol2() {
//		return col2;
//	}
//	public void setCol2(double col2) {
//		this.col2 = col2;
//	}
//	public double getCol3() {
//		return col3;
//	}
//	public void setCol3(double col3) {
//		this.col3 = col3;
//	}
//	public double getCol4() {
//		return col4;
//	}
//	public void setCol4(double col4) {
//		this.col4 = col4;
//	}
//	public int getLabel() {
//		return label;
//	}
//	public void setLabel(int label) {
//		this.label = label;
//	}
//	public int getResult() {
//		return result;
//	}
//	public void setResult(int result) {
//		this.result = result;
//	}
//	public Date getCreateTime() {
//		return createTime;
//	}
//	public void setCreateTime(Date createTime) {
//		this.createTime = createTime;
//	}
//	public Date getRegTime() {
//		return regTime;
//	}
//	public void setRegTime(Date regTime) {
//		this.regTime = regTime;
//	}
}
