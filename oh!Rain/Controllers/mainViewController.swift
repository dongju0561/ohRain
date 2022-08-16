//
//  ViewController.swift
//  oh!Rain
//
//  Created by macbook on 2022/08/09.
//

import UIKit

class mainViewController: UIViewController {

    var city : City?
    var time : Time?
    var weatherManager = WeatherManager()
    let notificationController = ProspectsView()
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var rainProbability: UILabel!
    @IBOutlet weak var actionLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        let settingTime : String = "11:11"
        weatherManager.delegate = self
        weatherManager.fetchWheather(cityName: city!)
        timeLbl.text = settingTime
    }
    
    @IBAction func pressResettingButton(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true) //Go to rootViewController
    }
}

//MARK: - WeatherManagerDelegate

extension mainViewController: WeatherManagerDelegate{
    func didUpdateRainProbability(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async { [self] in
            let action = WeatherBrain.isItRain(pct: weather.getPct)
            self.actionLbl.text = action
            self.rainProbability.text = "\(weather.getPct)%"
            self.tempLbl.text = String(weather.tempString)
            self.notificationController.addNotification(weather, 23, 36)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}

