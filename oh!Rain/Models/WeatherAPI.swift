//
//  WeatherAPI.swift
//  oh!Rain
//
//  Created by macbook on 2022/08/13.


protocol WeatherManagerDelegate{
    func didUpdateRainProbability(_ weatherManager : WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

import Foundation

struct WeatherManager{
    var delegate : WeatherManagerDelegate?
    let weatherURL = "https://api.openweathermap.org/data/2.5/onecall?&exclude=current,minutely,hourly,alerts&appid=20b98424cb941d426fddca5261130820&units=metric"

    func fetchWheather(cityName: City){
        let urlString = "\(weatherURL)&lat=\(cityName.lat)&lon=\(cityName.lon)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString : String){
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                guard error == nil else {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateRainProbability(self, weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    //에러처리 때문에 optional 붙는 경우가 있다.
    func parseJSON(_ weatherData : Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let pop: Double = decodedData.daily[0].pop
            let weather: String = decodedData.daily[0].weather[0].main
            let temp: Double = decodedData.daily[0].temp.day
            let weatherModel = WeatherModel(pop: pop, temp: temp, weather: weather)
            return weatherModel
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
