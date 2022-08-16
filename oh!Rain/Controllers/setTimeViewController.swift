//
//  setTimeViewController.swift
//  oh!Rain
//
//  Created by macbook on 2022/08/10.
//
import UIKit

class setTimeViewController: UIViewController  {
    
    var city : City?
    var time : Time?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changeTime(_ sender: UIDatePicker) {
        let now = sender.date // your date
        let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: now)
        time = Time(hour: dateComponents.hour!, min: dateComponents.minute!)
        
        print(time!.hour)
    }
    
    
    //MARK: - segue
    @IBAction func pressSettingButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: K.goToMain, sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.goToMain{
            let mainVC = segue.destination as! mainViewController
            mainVC.city = self.city
            mainVC.time = self.time
        }
    }
    
}
