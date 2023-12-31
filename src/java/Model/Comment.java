/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author dell
 */
public class Comment {
    private int commentId;
    private Post post;
    private User user;
    private String commentValue;
    private Date createdDate;
    private boolean status;
    private boolean isParent;
    private int parentId;
    private ArrayList<Comment> childrens;

    public Comment() {
    }

    public Comment(int commentId, Post post, User user, String commentValue, boolean status) {
        this.commentId = commentId;
        this.post = post;
        this.user = user;
        this.commentValue = commentValue;
        this.status = status;
    }

    public Comment(int commentId, Post post, User user, String commentValue, Date createdDate, boolean status) {
        this.commentId = commentId;
        this.post = post;
        this.user = user;
        this.commentValue = commentValue;
        this.createdDate = createdDate;
        this.status = status;
    }

    public Comment(int commentId, Post post, User user, String commentValue, Date createdDate, boolean status, boolean isParent, int parentId) {
        this.commentId = commentId;
        this.post = post;
        this.user = user;
        this.commentValue = commentValue;
        this.createdDate = createdDate;
        this.status = status;
        this.isParent = isParent;
        this.parentId = parentId;
    }
    
    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getCommentValue() {
        return commentValue;
    }

    public void setCommentValue(String commentValue) {
        this.commentValue = commentValue;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public boolean isIsParent() {
        return isParent;
    }

    public void setIsParent(boolean isParent) {
        this.isParent = isParent;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }


    public ArrayList<Comment> getChildrens() {
        return childrens;
    }

    public void setChildrens(ArrayList<Comment> childrens) {
        this.childrens = childrens;
    }
    
    
}
