package bo;

import bean.HoaDonbean;
import dao.HoaDonDao;

public class DatHangBo {
	HoaDonDao hoaDonDao=new HoaDonDao();
	public void ThemHoaDon(String tendn, boolean damua) throws Exception {
		hoaDonDao.themHoaDon(tendn, damua);
	}
	public void themCTHD(HoaDonbean HD) throws Exception {

		hoaDonDao.themCTHD(HD);
}
}