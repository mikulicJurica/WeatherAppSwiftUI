import SwiftUI

struct MainView: View {
    
    let weatherData: WeatherModel
    let weatherIcons = WeatherIcons()
    
    var body: some View {
        
        VStack {
            HStack() {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Zagreb")
                        .bold()
                        .font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("\(weatherData.current.temp-273.15, specifier: "%.1f") °C")
                    .bold()
                    .font(.system(size: 35))
            }
            
            Spacer()
            
            VStack(spacing: 10) {
                Image(systemName: weatherIcons.weatherIcon(conditionId: weatherData.current.weather[0].id))
                    .font(.system(size: 250))
                
                Text("\(weatherData.current.weather[0].main)")
                    .font(.system(size: 50, weight: .bold))
            }
            .frame(maxWidth: .infinity, alignment: .center)
            
            Spacer()
            
            VStack(spacing: 10) {
                HStack(spacing: 5) {
                    Image(systemName: "sun.max.fill")
                        .font(.system(size: 30))
                    
                    Text("UV radiation: \(weatherData.current.uvi, specifier: "%.1f")")
                        .fontWeight(.light)
                        .font(.system(size: 20))
                }
                HStack(spacing: 5) {
                    Image(systemName: "drop")
                        .font(.system(size: 30))
                    
                    Text("Humidity: \(weatherData.current.humidity, specifier: "%.f") %")
                        .fontWeight(.light)
                        .font(.system(size: 20))
                }
                
                HStack(spacing: 5) {
                    Image(systemName: "thermometer")
                        .font(.system(size: 30))
                    
                    Text("Pressure: \(weatherData.current.pressure, specifier: "%.f") hPa")
                        .fontWeight(.light)
                        .font(.system(size: 20))
                }
            }
            
            Spacer()
            
        }
        .padding()
        .background(.blue)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView(weatherData: someDumyData????)
//    }
//}
