package bean;

public class loaibean {
	private String maloai; 
	private String tenloai;
	
	public loaibean(String maloai, String tenloai) {
		super();
		this.maloai = maloai;
		this.tenloai = tenloai;
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

	/**
	 * @return the tenloai
	 */
	public String getTenloai() {
		return tenloai;
	}

	/**
	 * @param tenloai the tenloai to set
	 */
	public void setTenloai(String tenloai) {
		this.tenloai = tenloai;
	}
	
	
	
}
