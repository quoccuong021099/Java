package bean;

public class viewbean {
	private String makh;
	private String hoten;
	private String tensach;
	private String ngaymua;
	private String diachi;
	private long gia;
	private long soluong;
	private long tt;
	public viewbean(String makh, String hoten, String tensach, String ngaymua, String diachi, long gia, long soluong,
			long tt) {
		super();
		this.makh = makh;
		this.hoten = hoten;
		this.tensach = tensach;
		this.ngaymua = ngaymua;
		this.diachi = diachi;
		this.gia = gia;
		this.soluong = soluong;
		this.tt = tt;
	}
	public String getMakh() {
		return makh;
	}
	public void setMakh(String makh) {
		this.makh = makh;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public String getTensach() {
		return tensach;
	}
	public void setTensach(String tensach) {
		this.tensach = tensach;
	}
	public String getNgaymua() {
		return ngaymua;
	}
	public void setNgaymua(String ngaymua) {
		this.ngaymua = ngaymua;
	}
	public String getDiachi() {
		return diachi;
	}
	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public long getSoluong() {
		return soluong;
	}
	public void setSoluong(long soluong) {
		this.soluong = soluong;
	}
	public long getTt() {
		return tt;
	}
	public void setTt(long tt) {
		this.tt = gia*soluong;
	}

}
