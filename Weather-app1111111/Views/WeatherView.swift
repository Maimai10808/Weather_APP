//
//  WeatherView.swift
//  Weather-app1111111
//
//  Created by mac on 3/4/25.
//

import SwiftUI

struct WeatherView: View {
    
    
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.bold)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            Text(weather.weather[0].main)
                                .frame(maxWidth: 150, alignment: .leading)
                            
                            Spacer()
                            
                            Text(weather.main.feelsLike.roundDouble() + "*")
                                .font(.system(size: 100))
                                .fontWeight(.bold)
                                .padding()
                            
                        }
                        
                        Spacer()
                            .frame(height: 80)
                        
                        AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 350)
                        } placeholder: {
                            ProgressView()
                        }
                        
                        Spacer()
                        
                        
                        
                        
                        
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Weather now")
                            .bold().padding(.bottom)
                        
                        HStack{
                            WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "*"))
                        }
                        
                        Spacer()
                        
                        HStack{
                            WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "*"))
                        }
                        
                        Spacer()
                        
                    
                        
                        Spacer()
                        
                        HStack{
                            WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                        }
                        
                        Spacer()
                        
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.bottom, 20)
                    .background(.white)
                    .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                        
                                     
                }
                
                
            }
            .edgesIgnoringSafeArea(.bottom)
            .background(Color.pink)
            .preferredColorScheme(.dark)
            
        }
    }
    
    
struct WeatherView_Previews: PreviewProvider {
        static var previews: some View {
            WeatherView(weather: previewWeather)
        }
    }
}
