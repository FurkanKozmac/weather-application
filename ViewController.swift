//
//  ViewController.swift
//  WeatherApplication
//
//  Created by Furkan Kozmaç on 29.07.2023.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    
    private var cityLabel: UILabel!
    private var dateLabel: UILabel!
    private var degreeLabel: UILabel!
    private var weatherImage: UIImageView!
    private var humidityLabel: UILabel!
    private var windspeedLabel: UILabel!
    private var tempMinLabel: UILabel!
    private var tempMaxLabel: UILabel!
    
    // MARK: Initializing bottomView
    
    func bottomView() {
        
        
        let bottomView = UIView()
        bottomView.backgroundColor = .white
        let cornerRadius: CGFloat = 12.0
        bottomView.layer.cornerRadius = cornerRadius
        bottomView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        let humidityImage: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(systemName: "humidity.fill")
            image.tintColor = .black
            return image
        }()
        
        let humidityTitleLabel: UILabel = {
            let label = UILabel()
            label.text = "Humidity"
            label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            label.textColor = .black
            return label
        }()
        
        
        humidityLabel = UILabel()
        humidityLabel.text = "Loading..."
        humidityLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        humidityLabel.textColor = .black
        
        
        
        let windspeedImage: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(systemName: "wind")
            image.tintColor = .black
            return image
        }()
        
        let windspeedTitleLabel: UILabel = {
            let label = UILabel()
            label.text = "Wind Speed"
            label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            label.textColor = .black
            return label
        }()
        
        windspeedLabel = UILabel()
        windspeedLabel.text = "Loading..."
        windspeedLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        windspeedLabel.textColor = .black
        
        
        let tempMinImage: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(systemName: "sun.max.fill")
            image.tintColor = .black
            return image
        }()
        
        let tempMinTitleLabel: UILabel = {
            let label = UILabel()
            label.text = "Feels Like"
            label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            label.textColor = .black
            return label
        }()
        
        
        tempMinLabel = UILabel()
        tempMinLabel.text = "Loading..."
        tempMinLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        tempMinLabel.textColor = .black
        
        
        let tempMaxImage: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(systemName: "eye.circle.fill")
            image.tintColor = .black
            return image
        }()
        
        let tempMaxTitleLabel: UILabel = {
            let label = UILabel()
            label.text = "Visibility"
            label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            label.textColor = .black
            return label
        }()
        
        
        tempMaxLabel = UILabel()
        tempMaxLabel.text = "Loading..."
        tempMaxLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        tempMaxLabel.textColor = .black
        
        
        // MARK: BottomView Adding Subwviews
        
        view.addSubview(bottomView)
        view.addSubview(humidityLabel)
        view.addSubview(humidityTitleLabel)
        view.addSubview(windspeedTitleLabel)
        view.addSubview(windspeedLabel)
        view.addSubview(humidityImage)
        view.addSubview(windspeedImage)
        view.addSubview(tempMinTitleLabel)
        view.addSubview(tempMinLabel)
        view.addSubview(tempMinImage)
        view.addSubview(tempMaxTitleLabel)
        view.addSubview(tempMaxLabel)
        view.addSubview(tempMaxImage)
        
        
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        humidityLabel.translatesAutoresizingMaskIntoConstraints = false
        humidityTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        windspeedTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        windspeedLabel.translatesAutoresizingMaskIntoConstraints = false
        humidityImage.translatesAutoresizingMaskIntoConstraints = false
        windspeedImage.translatesAutoresizingMaskIntoConstraints = false
        
        tempMaxImage.translatesAutoresizingMaskIntoConstraints = false
        tempMaxLabel.translatesAutoresizingMaskIntoConstraints = false
        tempMinImage.translatesAutoresizingMaskIntoConstraints = false
        tempMinLabel.translatesAutoresizingMaskIntoConstraints = false
        tempMaxTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        tempMinTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: BottomView Constraints
        
        NSLayoutConstraint.activate([
            
            bottomView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomView.widthAnchor.constraint(equalToConstant: view.bounds.width),
            bottomView.heightAnchor.constraint(equalToConstant: view.bounds.height / 3.5),
            
            humidityImage.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 20),
            humidityImage.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 30),
            humidityImage.widthAnchor.constraint(equalToConstant: 45 ),
            humidityImage.heightAnchor.constraint(equalToConstant: 45),
            
            humidityTitleLabel.leftAnchor.constraint(equalTo: humidityImage.rightAnchor, constant: 10),
            humidityTitleLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 30),
            
            humidityLabel.leftAnchor.constraint(equalTo: humidityImage.rightAnchor, constant: 10),
            humidityLabel.topAnchor.constraint(equalTo: humidityTitleLabel.bottomAnchor, constant: 3),
            
            windspeedImage.leftAnchor.constraint(equalTo: bottomView.centerXAnchor, constant: 10),
            windspeedImage.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 30),
            windspeedImage.widthAnchor.constraint(equalToConstant: 45 ),
            windspeedImage.heightAnchor.constraint(equalToConstant: 45),
            
            windspeedTitleLabel.rightAnchor.constraint(equalTo: bottomView.rightAnchor, constant: -30),
            windspeedTitleLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 30),
            
            windspeedLabel.leftAnchor.constraint(equalTo: windspeedImage.rightAnchor, constant: 10),
            windspeedLabel.topAnchor.constraint(equalTo: windspeedTitleLabel.bottomAnchor, constant: 3),
            
            tempMinImage.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 20),
            tempMinImage.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -30),
            tempMinImage.widthAnchor.constraint(equalToConstant: 45 ),
            tempMinImage.heightAnchor.constraint(equalToConstant: 45),
            
            tempMinTitleLabel.leftAnchor.constraint(equalTo: tempMinImage.rightAnchor, constant: 10),
            tempMinTitleLabel.bottomAnchor.constraint(equalTo: tempMinLabel.topAnchor, constant: -3),
            
            tempMinLabel.leftAnchor.constraint(equalTo: tempMinImage.rightAnchor, constant: 10),
            tempMinLabel.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -35),
            
            tempMaxImage.leftAnchor.constraint(equalTo: bottomView.centerXAnchor, constant: 10),
            tempMaxImage.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -30),
            tempMaxImage.widthAnchor.constraint(equalToConstant: 45 ),
            tempMaxImage.heightAnchor.constraint(equalToConstant: 45),
            
            tempMaxTitleLabel.leftAnchor.constraint(equalTo: tempMaxImage.rightAnchor, constant: 10),
            tempMaxTitleLabel.bottomAnchor.constraint(equalTo: tempMaxLabel.topAnchor, constant: -3),
            
            tempMaxLabel.leftAnchor.constraint(equalTo: tempMaxImage.rightAnchor, constant: 10),
            tempMaxLabel.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -35),
            
        ])
    }
    
    // MARK: Functions
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        weatherView()
        bottomView()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        
        let urlString = "https://api.weatherapi.com/v1/current.json?key=\(APIKEY)&q=\(location.latitude),\(location.longitude)&aqi=no"
        
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                guard let data = data, error == nil else {
                    print("Error fetching weather data: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let weatherResponse = try decoder.decode(WeatherResponse.self, from: data)
                    
                    // You can access weather data from the 'weatherResponse' object here
                    // For example:
                    let temperature = weatherResponse.current.temp_c
                    let humidity = weatherResponse.current.humidity
                    let windSpeed = weatherResponse.current.wind_kph
                    let city = weatherResponse.location.name
                    let feelsLike = weatherResponse.current.feelslike_c
                    let visibility = weatherResponse.current.vis_km
                    // ... (access other weather details as needed)
                    
                    
                    DispatchQueue.main.async {
                        // Update labels with fetched data
                        // Replace 'yourLabel' with the corresponding UILabel outlets from your code
                        self?.humidityLabel.text = "\(humidity)%"
                        self?.windspeedLabel.text = "\(windSpeed) km/h"
                        self?.degreeLabel.text = "\(temperature)°"
                        self?.cityLabel.text = "\(city)"
                        self?.tempMinLabel.text = "\(feelsLike)°"
                        self?.tempMaxLabel.text = "\(visibility) km"
                     
                    }
                } catch {
                    print("Error decoding weather data: \(error.localizedDescription)")
                }
            }
            task.resume()
        }
        
    }
    
    
    // MARK: Constraints
    
    func weatherView() {
        
        let currentDate = Date()

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy EEEE" // Tarih formatını belirleyin (örn: 03/08/2023)
        let dateString = dateFormatter.string(from: currentDate)
        
        view.backgroundColor = UIColor(red: 3, green: 4, blue: 94, alpha: 0.007)
        
        
        let weatherView = UIView()
        
        cityLabel = UILabel()
        cityLabel.text = "Loading..."
        cityLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        cityLabel.textColor = .white
        
        
        
        
        dateLabel = UILabel()
        dateLabel.text = dateString
        dateLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        dateLabel.textColor = .white
        
        
        
        
        degreeLabel = UILabel()
        degreeLabel.text = ""
        degreeLabel.font = UIFont.systemFont(ofSize: 64, weight: .bold)
        degreeLabel.textColor = .white
        
        
        weatherImage = UIImageView()
        weatherImage.image = UIImage(systemName: "thermometer.sun.circle.fill")
        weatherImage.tintColor = .white
        
        
        
        
        
        view.addSubview(cityLabel)
        view.addSubview(degreeLabel)
        view.addSubview(weatherImage)
        view.addSubview(weatherView)
        view.addSubview(dateLabel)
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        degreeLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        weatherView.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            weatherView.widthAnchor.constraint(equalToConstant: view.frame.width),
            weatherView.heightAnchor.constraint(equalToConstant: 150),
            weatherView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            
            weatherImage.topAnchor.constraint(equalTo: weatherView.topAnchor, constant: 30),
            weatherImage.leftAnchor.constraint(equalTo: weatherView.leftAnchor, constant: 20),
            weatherImage.widthAnchor.constraint(equalToConstant: 70),
            weatherImage.heightAnchor.constraint(equalToConstant: 70),
            
            degreeLabel.centerYAnchor.constraint(equalTo: weatherImage.centerYAnchor),
            degreeLabel.leftAnchor.constraint(equalTo: weatherView.centerXAnchor),
            
            
            cityLabel.bottomAnchor.constraint(equalTo: weatherView.topAnchor, constant: -10),
            cityLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            
            dateLabel.leftAnchor.constraint(equalTo: weatherView.leftAnchor, constant: 20),
            dateLabel.bottomAnchor.constraint(equalTo: cityLabel.topAnchor, constant: -5)
            
        ])
    }
    
}

struct WeatherResponse: Codable {
    let current: CurrentWeather
    let location: Location
}

struct CurrentWeather: Codable {
    let temp_c: Int
    let humidity: Int
    let wind_kph: Double
    let vis_km: Int
    let feelslike_c: Int
}

struct Location: Codable {
    let name: String
    let country: String
    let localtime: String
}
