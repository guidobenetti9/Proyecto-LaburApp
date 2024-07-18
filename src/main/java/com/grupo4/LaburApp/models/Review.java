package com.grupo4.LaburApp.models;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "reviews")
public class Review {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Min(value = 1, message = "Debe ser mayor o igual a 1")
	@Max(value = 5, message = "Debe ser menor o igual a 5")
	private Long stars;
	
    @NotEmpty(message="Comment is required.")
    @Size(min=10, message="Comment needs at least 10 chars")
	private String comment;
    
	@Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;

	public Review() {
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private User senderReview;
	
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "post_id")
    private Post postReview;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getStars() {
		return stars;
	}

	public void setStars(Long stars) {
		this.stars = stars;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
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

	public User getSenderReview() {
		return senderReview;
	}

	public void setSenderReview(User senderReview) {
		this.senderReview = senderReview;
	}

	public Post getPostReview() {
		return postReview;
	}

	public void setPostReview(Post postReview) {
		this.postReview = postReview;
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
