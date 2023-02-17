package com.topia.phj.vo;

public class Paging {
	private int totalCount;
	private int displayPageNum = 5;
	
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private Criteria criteria; 
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		pagigData();
	}
	
	private void pagigData() {
		endPage = (int)(Math.ceil(criteria.getPage()/(double) displayPageNum)*displayPageNum);
		
		startPage = (endPage-displayPageNum) + 1;
		
		int tempEndPage = (int)(Math.ceil(totalCount/(double)criteria.getPerPageNum()));
		if(endPage > tempEndPage){
			endPage = tempEndPage;
		}
		
		prev = startPage ==1 ? false : true;
		
		next = endPage*criteria.getPerPageNum() >= totalCount ? false : true;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public Criteria getcriteria() {
		return criteria;
	}

	public void setCriteria(Criteria criteria) {
		this.criteria = criteria;
	}

	@Override
	public String toString() {
		return "Paging [totalCount=" + totalCount + ", displayPageNum=" + displayPageNum + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + ", criteria=" + criteria + "]";
	}

	
	
	

	

}