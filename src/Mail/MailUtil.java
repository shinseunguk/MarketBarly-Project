package Mail;

import org.apache.commons.mail.HtmlEmail;

public class MailUtil {
    public static void sendMail(String email, String subject, String content) throws Exception {
        // Mail Server 설정
        String charSet = "utf-8";  //메일 할글 설정
        String hostSMTP = "smtp.gmail.com";  // SMTP 서버명
        String hostSMTPid = "marketbarly";       // 아이디
        String hostSMTPpwd = "barly2020!";    // 비밀번호
        // 보내는 사람
        String fromEmail = "marketbarly@gmail.com"; //"보내는사람@메일.com"
        String fromName = "MarketBarly"; //"보내는사람 이름"
        // email 전송
        try {
            HtmlEmail mail = new HtmlEmail();
            mail.setDebug(true);
            mail.setCharset(charSet);
            mail.setSSLOnConnect(true);     // SSL 사용 (TLS가 없는 경우 SSL 사용)
            mail.setHostName(hostSMTP);
            mail.setSmtpPort(465);          // SMTP 포트 번호

            mail.setAuthentication(hostSMTPid, hostSMTPpwd);
            mail.setStartTLSEnabled(true);  // TLS 사용
            mail.addTo(email);
            mail.setFrom(fromEmail, fromName, charSet);
            mail.setSubject(subject);
            mail.setHtmlMsg(content);
            mail.send();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void sendPwMail(String email, String subject, String content, String msg) throws Exception {
        // Mail Server 설정
        String charSet = "utf-8";  //메일 한글 설정
        String hostSMTP = "smtp.gmail.com";  // SMTP 서버명
        String hostSMTPid = "marketbarly";       // 아이디
        String hostSMTPpwd = "barly2020!";    // 비밀번호
        // 보내는 사람
        String fromEmail = "marketbarly@gmail.com"; //"보내는사람@메일.com"
        String fromName = "MarketBarly"; //"보내는사람 이름"
        // email 전송
        try {
            HtmlEmail mail = new HtmlEmail();
            mail.setDebug(true);
            mail.setCharset(charSet);
            mail.setSSLOnConnect(true);     // SSL 사용 (TLS가 없는 경우 SSL 사용)
            mail.setHostName(hostSMTP);
            mail.setSmtpPort(465);          // SMTP 포트 번호

            mail.setAuthentication(hostSMTPid, hostSMTPpwd);
            mail.setStartTLSEnabled(true);  // TLS 사용
            mail.addTo(email);
            mail.setFrom(fromEmail, fromName, charSet);
            mail.setSubject(subject);
            mail.setHtmlMsg(content);
            mail.setHtmlMsg(msg);
            mail.send();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

