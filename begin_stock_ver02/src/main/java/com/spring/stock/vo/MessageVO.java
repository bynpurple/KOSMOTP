package com.spring.stock.vo;

import java.sql.Timestamp;

public class MessageVO {
    private int message_id;
    private String username;
    private String receivename;
    private String message_subject;
    private String message_content;
    private Timestamp message_senddate;
    private Timestamp message_readdate;
    private char newable;
    private char readable;
    private char errored;
    
	public int getMessage_id() {
		return message_id;
	}
	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getReceivename() {
		return receivename;
	}
	public void setReceivename(String receivename) {
		this.receivename = receivename;
	}
	public String getMessage_subject() {
		return message_subject;
	}
	public void setMessage_subject(String message_subject) {
		this.message_subject = message_subject;
	}
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}
	public Timestamp getMessage_senddate() {
		return message_senddate;
	}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
	public void setMessage_senddate(Timestamp message_senddate) {
		this.message_senddate = message_senddate;
	}
	public Timestamp getMessage_readdate() {
		return message_readdate;
	}
	public void setMessage_readdate(Timestamp message_readdate) {
		this.message_readdate = message_readdate;
	}
	public char getNewable() {
		return newable;
	}
	public void setNewable(char newable) {
		this.newable = newable;
	}
	public char getReadable() {
		return readable;
	}
	public void setReadable(char readable) {
		this.readable = readable;
	}
	public char getErrored() {
		return errored;
	}
	public void setErrored(char errored) {
		this.errored = errored;
	}
}