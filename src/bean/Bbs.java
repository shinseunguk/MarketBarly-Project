package bean;

public class Bbs {
	
	private int bbsID;
    private String bbsTitle;
	/* private String id_user; */
    private String bbsDate;
    private String bbsContent;
    private int bbsAvailable;
    
    public int getBbsID() {
		return bbsID;
	}
	public void setBbsID(int bbsID) {
		this.bbsID = bbsID;
	}
	public String getBbsTitle() {
		return bbsTitle;
	}
	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}
	
//	public String getId_user() {
//		return id_user;
//	}
//	public void setId_user(String id_user) {
//		this.id_user = id_user;
//	}
	public String getBbsDate() {
		return bbsDate;
	}
	public void setBbsDate(String bbsDate) {
		this.bbsDate = bbsDate;
	}
	public String getBbsContent() {
		return bbsContent;
	}
	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}
	public int getBbsAvailable() {
		return bbsAvailable;
	}
	public void setBbsAvailable(int bbsAvailable) {
		this.bbsAvailable = bbsAvailable;
	}

}
