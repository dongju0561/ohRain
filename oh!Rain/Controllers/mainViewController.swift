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
    @IBOutlet weak var weatherCondition: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let safeTime = time{
            let selectedTime = Time.ChangeTimeToSting(t: safeTime)
            timeLbl.text = selectedTime
        }
        cityLbl.text = city?.en
        createSpinnerView() // Acitvity Indicator
        navigationItem.hidesBackButton = true // Remove back button
        weatherManager.delegate = self
        weatherManager.fetchWheather(cityName: city!)
    }
    
    @IBAction func pressResettingButton(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true) //Go to rootViewController
    }
    
    func createSpinnerView() {
        let child = SpinnerViewController()

        // add the spinner view controller
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)

        // wait two seconds to simulate some work happening
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // then remove the spinner view controller
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
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
            self.notificationController.addNotification(weather, time!.hour,time!.min)
            self.weatherCondition.image = weather.weatherImage
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}

