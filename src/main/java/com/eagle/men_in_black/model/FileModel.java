package com.eagle.men_in_black.model;

import java.io.Serializable;
import org.springframework.web.multipart.MultipartFile;

public class FileModel implements Serializable {

	private static final long serialVersionUID = 272162165960508928L;
	private String attach_path; 
	private MultipartFile upload; 
	private String filename; 
	private String CKEditorFuncNum; 
	
	public String getAttach_path() { 
		return this.attach_path; } 
	public void setAttach_path(String attach_path) { 
		this.attach_path = attach_path; } 
	public MultipartFile getUpload() { 
		return upload; } 
	public void setUpload(MultipartFile upload) {
		this.upload = upload; } 
	public String getFilename() {
		return this.filename; } 
	public void setFilename(String filename) { 
		this.filename = filename; } 
	public String getCKEditorFuncNum() {
		return this.CKEditorFuncNum; } 
	public void setCKEditorFuncNum(String CKEditorFuncNum) { 
		this.CKEditorFuncNum = CKEditorFuncNum; } 

	
	
	
}
