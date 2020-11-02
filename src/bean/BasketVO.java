package bean;

public class BasketVO {

	private String productid; //productid
	private String userid;
	private String title;
	private int price;
	private String content;
	private String img;
	
	@Override
	public String toString() {
		return "BasketVO [productid=" + productid + ", userid=" + userid + ", title=" + title + ", price=" + price
				+ ", content=" + content + ", img=" + img + "]";
	}
	
	
	public String getProductid() {
		return productid;
	}
	public void setProductid(String productid) {
		this.productid = productid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	
	
	
	
}
