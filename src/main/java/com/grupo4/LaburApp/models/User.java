package com.grupo4.LaburApp.models;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinTable;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="users")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message="First name is required.")
	@Size(min=2, message="Fist name needs at least 2 chars")
	private String firstName;
	
	@NotEmpty(message="last name is required.")
	@Size(min=2, message="last name needs at least 2 chars")
	private String lastName;
	
	@NotEmpty(message="Email is required.")
	@Email(message="Email  needs at least 2 chars")
	private String email;
	
	@NotEmpty(message="Password is required.")
	@Size(min=8, message="Password needs at least 6 chars")
	private String password;
	
	@Transient//no se guarda en la db
	@NotEmpty(message="Confirmation is required.")
	@Size(min=8, message="Confirmation needs at least 6 chars")
	private String confirm;
	
	@DateTimeFormat(pattern="dd-MM-yyyy")
	private Date birthDate;
	
	@NotNull(message="nationality is required.")
	private String nationality;
	
	@NotNull
	private Boolean esAdmin;
	
	@NotNull(message="province is required.")
	private String province;
	
	@NotNull(message="city is required.")
	private String city;
	
	@NotNull
	private String profilePicture;
	
	@NotNull(message="phone is required.")
	private String phone;
	
	@NotNull
	private String alternativePhone;
	
	@Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;

	public User() {
	}
	
	@OneToMany(mappedBy = "senderMessage", fetch = FetchType.LAZY)
	private List<Message> sentMessages;	
	
	@OneToMany(mappedBy = "creatorPost",fetch = FetchType.LAZY)
	private List<Post> listPost;
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
			name="user_has_favorite_post",
			joinColumns=@JoinColumn(name="user_id"),
			inverseJoinColumns=@JoinColumn(name="post_id")
			)
	private List<Post> favoritePosts;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getProfilePicture() {
		return profilePicture;
	}

	public void setProfilePicture(String profilePicture) {
		this.profilePicture = profilePicture;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAlternativePhone() {
		return alternativePhone;
	}

	public void setAlternativePhone(String alternativePhone) {
		this.alternativePhone = alternativePhone;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public List<Message> getSentMessages() {
		return sentMessages;
	}

	public void setSentMessages(List<Message> sentMessages) {
		this.sentMessages = sentMessages;
	}

	public List<Post> getFavoritePosts() {
		return favoritePosts;
	}

	public void setFavoritePosts(List<Post> favoritePosts) {
		this.favoritePosts = favoritePosts;
	}

	public Boolean getEsAdmin() {
		return esAdmin;
	}

	public void setEsAdmin(Boolean esAdmin) {
		this.esAdmin = esAdmin;
	}

	public List<Post> getListPost() {
		return listPost;
	}

	public void setListPost(List<Post> listPost) {
		this.listPost = listPost;
	}
	
}