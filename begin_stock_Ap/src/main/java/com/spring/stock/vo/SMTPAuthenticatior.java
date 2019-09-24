package com.spring.stock.vo;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

 
public class SMTPAuthenticatior extends Authenticator{
 
    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("dlwo940305@gmail.com","ezstock123");
    }
}


