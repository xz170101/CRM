package com.dyz.util;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
public class comm {//手机验证码！！
	public static int Phone(String phone)  {
    int i= (int)((Math.random()*9+1)*100000);
	HttpClient client = new HttpClient();
	PostMethod post = new PostMethod("http://gbk.api.smschinese.cn"); 
	post.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=gbk");//在头文件中设置转码
	NameValuePair[] data ={ new NameValuePair("Uid", "lmy12"),new NameValuePair("Key", "d41d8cd98f00b204e980"),new NameValuePair("smsMob",phone),new NameValuePair("smsText","验证码："+i)};
	post.setRequestBody(data);
	try {
		client.executeMethod(post);
		Header[] headers = post.getResponseHeaders();
		int statusCode = post.getStatusCode();
		System.out.println("statusCode:"+statusCode);
		for(Header h : headers)
		{
		System.out.println(h.toString());
		}
		String result = new String(post.getResponseBodyAsString().getBytes("gbk")); 
		System.out.println(result); //打印返回消息状态
		post.releaseConnection();
	
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return i;
	}
}

