package bean;

public class sachbean {
	private String masach; 
	private String tensach;
	private String tacgia;
	private long gia;
	private String anh;
	private String maloai;
	
	public sachbean(String masach, String tensach, String tacgia, long gia, String anh, String maloai) {
		super();
		this.masach = masach;
		this.tensach = tensach;
		this.tacgia = tacgia;
		this.gia = gia;
		this.anh = anh;
		this.maloai = maloai;
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

	/**
	 * @return the tacgia
	 */
	public String getTacgia() {
		return tacgia;
	}

	/**
	 * @param tacgia the tacgia to set
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
	 * @return the anh
	 */
	public String getAnh() {
		return anh;
	}

	/**
	 * @param anh the anh to set
	 */
	public void setAnh(String anh) {
		this.anh = anh;
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
