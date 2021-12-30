package map_model;

public class map_DTO {
	
	private String gu;
	private String name;
	private String address;
	private String tel;
	
	
	public map_DTO( String gu, String name, String address, String tel) {
		super();
		
		this.gu = gu;
		this.name = name;
		this.address = address;
		this.tel = tel;
	}
	
	
	

	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
	
}
