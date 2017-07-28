package com.eagle.men_in_black.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamSource;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.eagle.men_in_black.model.MainDto;
import com.eagle.men_in_black.repository.MainDao;

@Service
public class MainSvcImpl implements MainSvc {
	@Autowired
	private MainDao mainDao;
	
	// 이메일 인증 
	@Autowired
    private JavaMailSender javaMailSender;

	
	@Override
	public MainDto do_search_pw(String id) {
		// TODO Auto-generated method stub
		return mainDao.do_search_pw(id);
	}

	// 이메일 인증
	@Override
	public void sendEmail(String email, String authNum) {
		/*String host = "smtp.gmail.com"; 
		String subject = "이메일 인증 번호 ";
		String fromName = "영재";
		String from = "                  "; //보내는 메일
		
		
		String content = "인증번호 [ " + authNum + "]";
		
		try{
			Properties props = new Properties();
			
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "stmp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class",
					"javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "587");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");
			
			Session mailSession = Session.getInstance(props,
					new javax.mail.Authenticator(){
				protected PasswordAuthentication getPasswordAuthentication(){
					return new PasswordAuthentication("dudwo456@gmail.com", "dudjd1414145");
				}
				
			});
			
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date());
			msg.setContent(content, "text/html;charset=euc-kr");
		
			Transport.send(msg);
		}catch (MessagingException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}*/
		
		
		 MimeMessage message = javaMailSender.createMimeMessage();
	        try {
	            message.setSubject("[공지] 회원 가입 안내", "UTF-8");
	            String htmlContent = "<strong>안녕하세요</strong>, 반갑습니다." + authNum;
	            message.setText(htmlContent, "UTF-8", "html");
	            message.setFrom(new InternetAddress("dudwo456@gmail.com"));
	            message.addRecipient(RecipientType.TO, new InternetAddress(email));
	            javaMailSender.send(message);
	        } catch (MessagingException e) {
	            e.printStackTrace();
	            return;
	        } catch (MailException e) {
	            e.printStackTrace();
	            return;
	        } // try - catch


		
	}

	@Override
	public MainDto do_search_email(String email) {
		// TODO Auto-generated method stub
		return mainDao.do_search_email(email);
	}

	@Override
	public int do_join_MIB(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return mainDao.do_join_MIB(map);
	}

	@Override
	public List<MainDto> do_select_banner() {
		// TODO Auto-generated method stub
		return mainDao.do_select_banner();
	}

	@Override
	public List<MainDto> do_select_bestItem(String ITEM) {
		// TODO Auto-generated method stub
		return mainDao.do_select_bestItem(ITEM);
	}

	@Override
	public List<MainDto> do_select_subitemheader() {
		// TODO Auto-generated method stub
		return mainDao.do_select_subitemheader();
	}

	@Override
	public int do_insert_point(String USER_ID) {
		// TODO Auto-generated method stub
		return mainDao.do_insert_point(USER_ID);
	}

	@Override
	public int do_insert_coup(String USER_ID) {
		// TODO Auto-generated method stub
		return mainDao.do_insert_coup(USER_ID);
	}

	



}
