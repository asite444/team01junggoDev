package util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import vo.WeatherVo;

public class WeatherUtil {
	
	static String Weather_API_KEY = "edb89f6379ad44fb41d9891674f5011b";
	static double x = 127.0249726;//경도
	static double y = 37.5012336;//위도
	
	public static List<WeatherVo> search_weather_json() throws Exception{
	
		List<WeatherVo> list = new ArrayList<WeatherVo>();
	String str_url = String.format("http://api.openweathermap.org/data/2.5/weather?lat=%f&lon=%f&appid=%s",y,x,Weather_API_KEY);
	
	URL url = new URL(str_url);
	
	HttpURLConnection urlConn = (HttpURLConnection) url.openConnection();
	//여기서 요청해더 설정(네이버/카카오 아이디/비밀설정)
	//urlConn.setRequestProperty("Authorization", Weather_API_KEY );
	urlConn.setRequestProperty("Content-Type", "application/json");
	
	urlConn.connect();
	
	InputStream is = urlConn.getInputStream();
	InputStreamReader isr = new InputStreamReader(is,"utf-8");
	BufferedReader  br = new BufferedReader(isr);
	//장점 빠른 성능 속도 성능향상  / 라인단위로 읽기가 가능
	
	StringBuffer sb = new StringBuffer();
	while(true) {
		
		String data = br.readLine(); //라인단위로 읽기
		if(data == null) break; 
		
		sb.append(data); // 라인단위 읽은 데이터 스트링버퍼에 넣는다
			
	}
	
	JSONObject json = new JSONObject(sb.toString());
	

	
	JSONArray weather = json.getJSONArray("weather");
	
	for(int i=0; i<weather.length(); i++) {
		
		JSONObject wea = weather.getJSONObject(i);
		
		String main = wea.getString("main");
		String description = wea.getString("description");
		String icon = wea.getString("icon");
		
	
	
	JSONObject mainObject = json.getJSONObject("main");
		double temp = mainObject.getDouble("temp");
		int      humidity = mainObject.getInt("humidity");
		temp = temp - 273.0;
		temp = Math.round(temp*10)/10;
		
		double latitude = y;
		double longitude = x;

	//KakaoLocalVo포장
	WeatherVo vo = new WeatherVo(main, description, icon, temp, humidity, latitude, longitude);
	list.add(vo);
	}

		
	
	return list;
	
	
	}
}
