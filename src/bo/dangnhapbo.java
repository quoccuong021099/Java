package bo;

import dao.DangKyDao;

public class dangnhapbo {
	DangKyDao dn = new DangKyDao();
	public boolean KtDangNhap(String un, String pass) throws Exception{

	return dn.KtDangNhap(un, pass);

	}
}
