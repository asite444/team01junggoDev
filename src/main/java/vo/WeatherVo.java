package vo;

public class WeatherVo {

	String main;
	String description;
	String icon;
	double temp;
	int humidity;
	double latitude;
	double longitude;
	
	public WeatherVo() {
		// TODO Auto-generated constructor stub
	}

	public WeatherVo(String main, String description, String icon, double temp, int humidity, double latitude,
			double longitude) {
		super();
		this.main = main;
		this.description = description;
		this.icon = icon;
		this.temp = temp;
		this.humidity = humidity;
		this.latitude = latitude;
		this.longitude = longitude;
	}

	public String getMain() {
		return main;
	}

	public void setMain(String main) {
		this.main = main;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public double getTemp() {
		return temp;
	}

	public void setTemp(double temp) {
		this.temp = temp;
	}

	public int getHumidity() {
		return humidity;
	}

	public void setHumidity(int humidity) {
		this.humidity = humidity;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	
	

	
}
