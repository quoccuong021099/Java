package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Date;

import bean.HoaDonbean;

public class HoaDonDao {
	public void themHoaDon(String tendn, boolean damua) throws Exception {
		try {
			Dungchung dc =new Dungchung();
			dc.KetNoi();
			String sql = "select * from KhachHang where tendn='" + tendn + "'";
			PreparedStatement cmd=dc.cn.prepareStatement(sql);
			ResultSet rs=cmd.executeQuery();
			int makh=0;
			while(rs.next()){
				makh=rs.getInt("makh");
			}
			//Chuyển Date thành Timestamp và Timestamp thành Date
			Date now=new Date();
			String sql2="insert into hoadon(makh,NgayMua,damua) values(?,?,?)";
			PreparedStatement hd=dc.cn.prepareStatement(sql2);
			hd.setInt(1, makh);
			hd.setTimestamp(2, new Timestamp(now.getTime()));
			hd.setBoolean(3, true);
			hd.executeUpdate();
			dc.cn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		}
	public void themCTHD(HoaDonbean HD ) throws Exception {
		try {
			Dungchung dc =new Dungchung();
			dc.KetNoi();
			String sql = "INSERT INTO ChiTietHoaDon" + "(MaSach,SoLuongMua,MaHoaDon) VALUES" + "(?,?,?);";
			PreparedStatement cmd =dc.cn.prepareStatement(sql);
			String sql1="select max(MaHoaDon) as MaHoaDonLonNhat  from hoadon";
			// lấy về mã hóa đơn max trong bảng hóa đơn
			PreparedStatement cmd1 = dc.cn.prepareStatement(sql1);
			ResultSet rs1 = cmd1.executeQuery();
			int MaHoaDonMax=0;
			while(rs1.next()) {
				MaHoaDonMax=rs1.getInt("MaHoaDonLonNhat");	
			}

			{
				//add mã sách số lượng với mã hóa đơn vào trong bảng chi tiết hóa đơn 
				//mã chi tiết hóa đơn cho chạy tăng dần
				cmd.setString(1, HD.getMaSach());
				cmd.setLong(2, HD.getSoLuongMua());
				cmd.setInt(3, MaHoaDonMax);
				cmd.executeUpdate();
			}}
			
			catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		}
	
}