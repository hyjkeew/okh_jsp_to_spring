package kh.com.okh.model;

public class BbsParam {		//view에서 controller로보낼때쓰는dto

	private int seq;
	private String id;
	
	private String title;
	private String content;
	private String wdate;
	private int bbsseq;	// 부모글
	
	private int del;	// 삭제
	private int readcount;
	private int likecount;
	private int commentcount;
	private int bbstype;
	
	//serch
	private String s_category;
	private String s_keyword;
	//paging
	private int recordCountPerPage=10;
	private int pageNumber=0;
	private int start=1;
	private int end=10;
	//sorting
	private String whatthings;
	public BbsParam() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "BbsParam [seq=" + seq + ", id=" + id + ", title=" + title + ", content=" + content + ", wdate=" + wdate
				+ ", bbsseq=" + bbsseq + ", del=" + del + ", readcount=" + readcount + ", likecount=" + likecount
				+ ", commentcount=" + commentcount + ", bbstype=" + bbstype + ", s_category=" + s_category
				+ ", s_keyword=" + s_keyword + ", recordCountPerPage=" + recordCountPerPage + ", pageNumber="
				+ pageNumber + ", start=" + start + ", end=" + end + ", whatthings=" + whatthings + "]";
	}
	public int getBbsseq() {
		return bbsseq;
	}
	public void setBbsseq(int bbsseq) {
		this.bbsseq = bbsseq;
	}
	public int getLikecount() {
		return likecount;
	}
	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}
	public int getCommentcount() {
		return commentcount;
	}
	public void setCommentcount(int commentcount) {
		this.commentcount = commentcount;
	}
	public int getBbstype() {
		return bbstype;
	}
	public void setBbstype(int bbstype) {
		this.bbstype = bbstype;
	}
	public String getWhatthings() {
		return whatthings;
	}
	public void setWhatthings(String whatthings) {
		this.whatthings = whatthings;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getS_category() {
		return s_category;
	}
	public void setS_category(String s_category) {
		this.s_category = s_category;
	}
	public String getS_keyword() {
		return s_keyword;
	}
	public void setS_keyword(String s_keyword) {
		this.s_keyword = s_keyword;
	}
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}
	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}
	public int getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	
	
	
}
