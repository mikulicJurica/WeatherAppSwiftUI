import SwiftUI

struct ContentView: View {
    
    var networkService = NetworkService()
    @State var weatherModel: WeatherModel?
    
    var body: some View {
        
        if let weatherModel = weatherModel {
            MainView(weatherData: weatherModel)
        }
        
        else {
            Text("Loading...")
                .task {
                    do {
                        weatherModel = try await networkService.getCurrentWeather()
                    } catch {
                        print("Error getting weather: \(error)")
                    }
                }
                .font(.system(size: 30, weight: .bold))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
