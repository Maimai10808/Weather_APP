//
//  ContentView.swift
//  Weather-app1111111
//
//  Created by mac on 3/3/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather : ResponseBody?
    
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                // 异步任务中调用的函数会抛出错误，因此需要使用 do-catch 来捕获
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                print("Weather data fetched successfully: \(String(describing: weather))")  // 调试输出
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)  // Correctly passing environmentObject
                }
            }
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            WelcomeView()
                .environmentObject(locationManager)
            
        }
        
        .padding()
        .background(Color.pink)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
