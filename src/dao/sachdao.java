package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.loaibean;
import bean.sachbean;

public class sachdao {
	Dungchung dc = new Dungchung();
	public ArrayList<sachbean> getSach() throws Exception
	{
		ArrayList<sachbean> ds = new ArrayList<sachbean>();
		dc.KetNoi();
		//B2: thiêìt lâòp câu lêònh sql
		String sql = "select * from sach ";
		//B3: lay du lieu ve
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		//B4: duyet qua cac don vi
		while(rs.next()) {
			String masach = rs.getString("masach");
			String tensach = rs.getString("tensach");
			String tacgia = rs.getString("tacgia");
			long gia = rs.getLong("gia");
			String anh = rs.getString("anh");
			String maloai = rs.getString("maloai");
			sachbean sach  = new sachbean(masach, tensach, tacgia, gia, anh, maloai );
			ds.add(sach);
		}
		rs.close();
		dc.cn.close();
		return ds; 
	}
}