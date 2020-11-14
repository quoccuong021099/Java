package bean;

public class dangnhapbean {
	private String tendangnhap; 
	private String matkhau;
	private boolean quyen;
	
	public dangnhapbean(String tendangnhap, String matkhau, boolean quyen) {
		super();
		this.tendangnhap = tendangnhap;
		this.matkhau = matkhau;
		this.quyen = quyen;
	}
	/**
	 * @return the tendangnhap
	 */
	public String getTendangnhap() {
		return tendangnhap;
	}
	/**
	 * @param tendangnhap the tendangnhap to set
	 */
	public void setTendangnhap(String tendangnhap) {
		this.tendangnhap = tendangnhap;
	}
	/**
	 * @return the matkhau
	 */
	public String getMatkhau() {
		return matkhau;
	}
	/**
	 * @param matkhau the matkhau to set
	 */
	public void setMatkhau(String matkhau) {
		this.matkhau = matkhau;
	}
	/**
	 * @return the quyen
	 */
	public boolean getQuyen() {
		return quyen;
	}
	/**
	 * @param quyen the quyen to set
	 */
	public void setQuyen(boolean quyen) {
		this.quyen = quyen;
	}
	
	
}
