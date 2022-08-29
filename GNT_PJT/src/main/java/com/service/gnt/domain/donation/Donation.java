package com.service.gnt.domain.donation;


public class Donation {
	private int donationId; // PK
	private DonationCategory categoryId;
	private String title;
	private String organization;
	private String organizationDescript;
	private String imageUri;
	private String section1Title;
	private String section1;
	private String section2Title;
	private String section2;
	private String section3Title;
	private String section3;
	private String section4Title;
	private String section4;
	private String createTime; // 기부 시작일
	private String endTime; // 기부 종료일
	private int donationAmount;
	private int donationLimit;
	
	
	public Donation() {}


	public Donation(int donationId, DonationCategory categoryId, String title, String organization,
			String organizationDescript, String imageUri, String section1Title, String section1, String section2Title,
			String section2, String section3Title, String section3, String section4Title, String section4,
			String createTime, String endTime, int donationAmount, int donationLimit) {
		super();
		this.donationId = donationId;
		this.categoryId = categoryId;
		this.title = title;
		this.organization = organization;
		this.organizationDescript = organizationDescript;
		this.imageUri = imageUri;
		this.section1Title = section1Title;
		this.section1 = section1;
		this.section2Title = section2Title;
		this.section2 = section2;
		this.section3Title = section3Title;
		this.section3 = section3;
		this.section4Title = section4Title;
		this.section4 = section4;
		this.createTime = createTime;
		this.endTime = endTime;
		this.donationAmount = donationAmount;
		this.donationLimit = donationLimit;
	}


	public int getDonationId() {
		return donationId;
	}


	public void setDonationId(int donationId) {
		this.donationId = donationId;
	}


	public DonationCategory getCategoryId() {
		return categoryId;
	}


	public void setCategoryId(DonationCategory categoryId) {
		this.categoryId = categoryId;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getOrganization() {
		return organization;
	}


	public void setOrganization(String organization) {
		this.organization = organization;
	}


	public String getOrganizationDescript() {
		return organizationDescript;
	}


	public void setOrganizationDescript(String organizationDescript) {
		this.organizationDescript = organizationDescript;
	}


	public String getImageUri() {
		return imageUri;
	}


	public void setImageUri(String imageUri) {
		this.imageUri = imageUri;
	}


	public String getSection1Title() {
		return section1Title;
	}


	public void setSection1Title(String section1Title) {
		this.section1Title = section1Title;
	}


	public String getSection1() {
		return section1;
	}


	public void setSection1(String section1) {
		this.section1 = section1;
	}


	public String getSection2Title() {
		return section2Title;
	}


	public void setSection2Title(String section2Title) {
		this.section2Title = section2Title;
	}


	public String getSection2() {
		return section2;
	}


	public void setSection2(String section2) {
		this.section2 = section2;
	}


	public String getSection3Title() {
		return section3Title;
	}


	public void setSection3Title(String section3Title) {
		this.section3Title = section3Title;
	}


	public String getSection3() {
		return section3;
	}


	public void setSection3(String section3) {
		this.section3 = section3;
	}


	public String getSection4Title() {
		return section4Title;
	}


	public void setSection4Title(String section4Title) {
		this.section4Title = section4Title;
	}


	public String getSection4() {
		return section4;
	}


	public void setSection4(String section4) {
		this.section4 = section4;
	}


	public String getCreateTime() {
		return createTime;
	}


	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}


	public String getEndTime() {
		return endTime;
	}


	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}


	public int getDonationAmount() {
		return donationAmount;
	}


	public void setDonationAmount(int donationAmount) {
		this.donationAmount = donationAmount;
	}


	public int getDonationLimit() {
		return donationLimit;
	}


	public void setDonationLimit(int donationLimit) {
		this.donationLimit = donationLimit;
	}


	@Override
	public String toString() {
		return "donation [donationId=" + donationId + ", categoryId=" + categoryId + ", title=" + title
				+ ", organization=" + organization + ", organizationDescript=" + organizationDescript + ", imageUri="
				+ imageUri + ", section1Title=" + section1Title + ", section1=" + section1 + ", section2Title="
				+ section2Title + ", section2=" + section2 + ", section3Title=" + section3Title + ", section3="
				+ section3 + ", section4Title=" + section4Title + ", section4=" + section4 + ", createTime="
				+ createTime + ", endTime=" + endTime + ", donationAmount=" + donationAmount + ", donationLimit="
				+ donationLimit + "]";
	}
	
	
	

}