package com.scit.flee2.vo;

public class Member {
	private String id;
	private String pw;
	private String name;
	private String nickname;
	private String phone;
	private String email;
	private String birthdate;
	private String gender;
	private String address1;
	private String address2;
	private String membertype;

	public Member(String id, String pw, String name, String nickname, String phone, String email, String birthdate,
			String gender, String address1, String address2, String membertype) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickname = nickname;
		this.phone = phone;
		this.email = email;
		this.birthdate = birthdate;
		this.gender = gender;
		this.address1 = address1;
		this.address2 = address2;
		this.membertype = membertype;
	}

	public Member() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getMembertype() {
		return membertype;
	}

	public void setMembertype(String membertype) {
		this.membertype = membertype;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pw=" + pw + ", name=" + name + ", nickname=" + nickname + ", phone=" + phone
				+ ", email=" + email + ", birthdate=" + birthdate + ", gender=" + gender + ", address1=" + address1
				+ ", address2=" + address2 + ", membertype=" + membertype + "]";
	}

}
