package com.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class Cookies {   
   
   //          키:쿠키이름   값:쿠키객체
   public Map<String, Cookie> cookieMap = new HashMap<>();
   
   // 디폴트 생성자
   public Cookies( HttpServletRequest request ) {
      Cookie []  cookies = request.getCookies();
      if( cookies != null ) {
         for (Cookie cookie : cookies) {
            String cookieName =  cookie.getName();
            cookieMap.put(cookieName, cookie);
         } // for
      } // if
   }
   
   public Cookie getCookie( String cookieName ) {
      return this.cookieMap.get(cookieName);
   }
   
   public boolean exists( String cookieName ) {
      return this.cookieMap.get(cookieName)  != null ;  // true, false
   }
   
   public static Cookie createCookie(String cookieName, String cookieValue) throws UnsupportedEncodingException {
      Cookie c = new Cookie( cookieName, URLEncoder.encode(cookieValue, "UTF-8"));
      return c;
   }
   
   public static Cookie createCookie(String cookieName, String cookieValue, String path, int expiry) throws UnsupportedEncodingException {
      Cookie c = new Cookie( cookieName, URLEncoder.encode(cookieValue, "UTF-8"));
      c.setPath(path);
      c.setMaxAge(expiry);
      return c;
   }
   
   public static Cookie createCookie(String cookieName, String cookieValue, String domain, String path, int expiry) throws UnsupportedEncodingException {
      Cookie c = new Cookie( cookieName, URLEncoder.encode(cookieValue, "UTF-8"));
      c.setDomain(domain);
      c.setPath(path);
      c.setMaxAge(expiry);
      return c;
   }
   
   public String getValue( String cookieName) throws UnsupportedEncodingException {
      String cookieValue = null; 
      Cookie c =  this.cookieMap.get(cookieName);
      if( c != null ) {
          cookieValue = URLDecoder.decode(c.getValue(), "UTF-8");
      } 
      return cookieValue;
   }

}

