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
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="posts")
public class Post {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message="post tittle is required.")
	private String postTittle;
	
	@NotEmpty(message="post description is required.")
	@Size(min=10, message="comment needs at least 10 chars")
	private String postDescription;
	
	@NotEmpty(message="Available days is required.")
	private String availableDays;
	
	@NotEmpty(message="Available hours is required.")
	private String availableHours;
	
	@NotEmpty(message="province is required.")
	private String province;
	
	@NotEmpty(message="city is required.")
	private String city;
	
	@Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;

	public Post() {
	}
	
	@OneToMany(mappedBy = "postMessage", fetch = FetchType.LAZY)
	private List<Message> postMessages;
	
	/*@OneToOne(mappedBy = "post", fetch = FetchType.LAZY)
	private User userAssigned;*/
	
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
}
