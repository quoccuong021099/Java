package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.viewbean;

public class LSMHdao {
	Dungchung dc =new Dungchung();
	public ArrayList<viewbean> getview() throws Exception{
		ArrayList<viewbean> ds=new ArrayList<viewbean>();
		dc.KetNoi();
		String sql="select * from vls";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			String makh = rs.getString("makh");
			String hoten = rs.getString("hoten");
			String tensach = rs.getString("tensach");
			String ngaymua = rs.getString("NgayMua");
			String diachi = rs.getString("diachi");
			long gia = rs.getLong("gia");
			long soluong = rs.getLong("SoLuongMua");
			long tt = rs.getLong("tt");
			viewbean view = new viewbean(makh, hoten, tensach, ngaymua,diachi, gia, soluong, tt);
			ds.add(view);
		}
		rs.close();dc.cn.close();
		return ds;
	}
}
