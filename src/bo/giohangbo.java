package bo;

import java.util.ArrayList;

import bean.giohangbean;

public class giohangbo {
	
	public ArrayList<giohangbean> ds= new ArrayList<giohangbean>();
	
	public void Them(String masach, String tensach,String tacgia, long gia, long soluong, String maloai, String anh) {
		
		
		//Hang trung`
		for(giohangbean g: ds)
			if(g.getMasach().equals(masach)) {
				g.setSoluong(g.getSoluong()+1);
				return;
			}
		
		giohangbean gh= new giohangbean(masach, tensach,tacgia, gia, soluong, maloai, anh);
		ds.add(gh);
	}
	
	public void Bot(String masach, String tensach,String tacgia, long gia, long soluong, String maloai, String anh) {
			
			//Hang trung`
			for(giohangbean g: ds)
				if(g.getMasach().equals(masach)) {
					if(g.getSoluong()>0) {
					g.setSoluong(g.getSoluong()-1);}
					if(g.getSoluong()==0) {
						g.setSoluong(0);
					}
					
					return;
				}
			
			giohangbean gh= new giohangbean(masach, tensach,tacgia, gia, soluong, maloai, anh);
			ds.add(gh);
		}
	
	public void bth(String masach, String tensach,String tacgia, long gia, long soluong, String maloai, String anh) {
		
		//Hang trung`
		for(giohangbean g: ds)
			if(g.getMasach().equals(masach)) {
				g.setSoluong(g.getSoluong());
				return;
			}
		
		giohangbean gh= new giohangbean(masach, tensach,tacgia, gia, soluong, maloai, anh);
		ds.add(gh);
	}
	public void xoa(String masach) {
		for(giohangbean g: ds)
			if(g.getMasach().equals(masach)) {
				ds.remove(g); 
				break;
			}
	}
	
	public long tongtien() {
		long s=0;
		for(giohangbean g: ds)
			s+=g.getThanhtien();
		return s;
	}
}
