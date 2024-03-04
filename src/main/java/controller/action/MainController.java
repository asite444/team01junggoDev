package controller.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import annotation.RequestMapping;
import util.WeatherUtil;
import vo.WeatherVo;

public class MainController {

	/**
	 * 날씨정보
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/main.do")
	public String weatherList(HttpServletRequest request, HttpServletResponse response) {

		List<WeatherVo> weatherlist = null;
		try {
			weatherlist =WeatherUtil.search_weather_json();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("weatherlist", weatherlist);
		return "main.jsp";
	}
}
