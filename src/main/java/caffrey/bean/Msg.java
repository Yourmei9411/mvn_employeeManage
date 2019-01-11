package caffrey.bean;

import java.util.HashMap;
import java.util.Map;

public class Msg {

	//100-success 200-fail
	private int code;
	
	private String message;
	
	private Map<String, Object> extend = new HashMap<String, Object>();

	public static Msg success()
	{
		Msg msg = new Msg();
		msg.setMessage("处理成功");
		msg.setCode(100);
		return msg;
	}
	
	public static Msg fail()
	{
		Msg msg = new Msg();
		msg.setMessage("处理失败");
		msg.setCode(200);
		return msg;
	}
	
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Map<String, Object> getMap() {
		return extend;
	}

	public void setMap(Map<String, Object> map) {
		this.extend = map;
	}

	public Msg add(String key, Object value) {
		extend.put(key, value);
		
		return this;
	}
	
	
	
}
