package bean;

public class giohangbean {
	private String masach;
	private String tensach;
	private String tacgia;
	private String anh;
	private long gia;
	private long soluong;
	private long thanhtien;
	private String maloai;
	
	
	public giohangbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public giohangbean(String masach, String tensach,String tacgia, long gia, long soluong, String maloai, String anh) {
		super();
		this.anh = anh;
		this.masach = masach;
		this.tensach = tensach;
		this.tacgia = tacgia;
		this.gia = gia;
		this.soluong = soluong;
		this.thanhtien = soluong*gia;
		this.maloai = maloai;
	}
	
	public String getAnh() {
		return anh;
	}
	public void setAnh(String masach) {
		this.anh = anh;
	}
	/**
	 * @return the masach
	 */
	
	public String getMasach() {
		return masach;
	}
	/**
	 * @param masach the masach to set
	 */
	public void setMasach(String masach) {
		this.masach = masach;
	}
	/**
	 * @return the tensach
	 */
	public String getTensach() {
		return tensach;
	}
	/**
	 * @param tensach the tensach to set
	 */
	public void setTensach(String tensach) {
		this.tensach = tensach;
	}
	public String getTacgia() {
		return tacgia;
	}
	/**
	 * @param tensach the tensach to set
	 */
	public void setTacgia(String tacgia) {
		this.tacgia = tacgia;
	}
	/**
	 * @return the gia
	 */
	public long getGia() {
		return gia;
	}
	/**
	 * @param gia the gia to set
	 */
	public void setGia(long gia) {
		this.gia = gia;
	}
	/**
	 * @return the soluong
	 */
	public long getSoluong() {
		return soluong;
	}
	/**
	 * @param soluong the soluong to set
	 */
	public void setSoluong(long soluong) {
		this.soluong = soluong;
	}
	/**
	 * @return the thanhtien
	 */
	public long getThanhtien() {
		return soluong*gia;
	}
	/**
	 * @param thanhtien the thanhtien to set
	 */
	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}
	/**
	 * @return the maloai
	 */
	public String getMaloai() {
		return maloai;
	}
	/**
	 * @param maloai the maloai to set
	 */
	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}
	
	
}
