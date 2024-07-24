package com.grupo4.LaburApp.models;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

//a
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="posts")
public class Post {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message="se necesita un titulo")
	private String postTittle;
	
	@NotEmpty(message="se necesita una descripción")
	@Size(min=2, message="la descripción debe tener al menos 10 caracteres")
	private String postDescription;
	
	@NotEmpty(message="debes ingresar tus dias disponibles")
	private String availableDays;
	
	@NotEmpty(message="debes ingresar tu horario disponible")
	private String availableHours;
	
	@NotEmpty(message="province is required.")
	private String province;
	
	@NotEmpty(message="se necesita una ciudad")
	private String city;
	
	@NotEmpty(message="se necesita un tipo")
	private String typePost
	;
	
	@Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;

	public Post() {
	}
	
	@OneToMany(mappedBy = "postMessage", fetch = FetchType.LAZY)
	private List<Message> postMessages;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User creatorPost;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="jobs_id")
	private Jobs jobsInPost;
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
			name="user_has_favorite_post",
			joinColumns=@JoinColumn(name="post_id"),
			inverseJoinColumns=@JoinColumn(name="user_id")
			)
	private List<User> favoriteUsers;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public List<Message> getPostMessages() {
		return postMessages;
	}

	public void setPostMessages(List<Message> postMessages) {
		this.postMessages = postMessages;
	}

	public List<User> getFavoriteUsers() {
		return favoriteUsers;
	}

	public void setFavoriteUsers(List<User> favoriteUsers) {
		this.favoriteUsers = favoriteUsers;
	}

	public String getPostTittle() {
		return postTittle;
	}

	public void setPostTittle(String postTittle) {
		this.postTittle = postTittle;
	}

	public String getPostDescription() {
		return postDescription;
	}

	public void setPostDescription(String postDescription) {
		this.postDescription = postDescription;
	}

	public String getAvailableDays() {
		return availableDays;
	}

	public void setAvailableDays(String availableDays) {
		this.availableDays = availableDays;
	}

	public String getAvailableHours() {
		return availableHours;
	}

	public void setAvailableHours(String availableHours) {
		this.availableHours = availableHours;
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
	
	public String getTypePost() {
		return typePost;
	}

	public void setTypePost(String typePost) {
		this.typePost = typePost;
	}

	public User getCreatorPost() {
		return creatorPost;
	}

	public void setCreatorPost(User creatorPost) {
		this.creatorPost = creatorPost;
	}

	public Jobs getJobsInPost() {
		return jobsInPost;
	}

	public void setJobsInPost(Jobs jobsInPost) {
		this.jobsInPost = jobsInPost;
	}
	//automatization
	@PrePersist //Before creating a user
		protected void onCreate() {
			this.createdAt = new Date(); //Default current_timestamp
		}
		
		
	@PreUpdate //before update
		protected void onUpdate() {
			this.updatedAt = new Date(); //default current_timestamp on update current_timestamp
		}
	
}
