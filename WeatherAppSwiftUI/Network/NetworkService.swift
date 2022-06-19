import Foundation

class NetworkService: NSObject, ObservableObject {
    
    let weatherURL = "https://api.openweathermap.org/data/3.0/onecall?exclude=minutely&appid=566031d788518c2392688fafaeb2caf3&lat=45.8131&lon=15.9775"
    
    func getCurrentWeather() async throws -> WeatherModel {
        let url = URL(string: weatherURL)!
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        let decodedData = try JSONDecoder().decode(WeatherModel.self, from: data)
        return decodedData
    }
}
