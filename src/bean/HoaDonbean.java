package bean;

import java.sql.Timestamp;

public class HoaDonbean {
	
	 private String MaSach; 
	 private long SoLuongMua;
	 private long makh;
	 private Timestamp NgayMua;
	 private boolean DaMua;
	

	public HoaDonbean(String maSach, long soLuongMua, long makh, Timestamp ngayMua, boolean daMua) {
		super();
		MaSach = maSach;
		SoLuongMua = soLuongMua;
		this.makh = makh;
		NgayMua = ngayMua;
		DaMua = daMua;
	}

	
	public String getMaSach() {
		return MaSach;
	}


	public void setMaSach(String maSach) {
		MaSach = maSach;
	}


	public long getSoLuongMua() {
		return SoLuongMua;
	}


	public void setSoLuongMua(long soLuongMua) {
		SoLuongMua = soLuongMua;
	}


	public long getMakh() {
		return makh;
	}


	public void setMakh(long makh) {
		this.makh = makh;
	}


	public Timestamp getNgayMua() {
		return NgayMua;
	}


	public void setNgayMua(Timestamp ngayMua) {
		NgayMua = ngayMua;
	}


	public boolean isDaMua() {
		return DaMua;
	}


	public void setDaMua(boolean daMua) {
		DaMua = daMua;
	}


	public HoaDonbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	 
}