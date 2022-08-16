//
//  setCityViewController.swift
//  oh!Rain
//
//  Created by macbook on 2022/08/10.
//
import UIKit

class setCityViewController: UIViewController {
    
    let cityBrain = CityBrain()
    var selectedCity : City?
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedCity = cityBrain.city[0]
    }
    
    @IBAction func pressSettingButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: K.goToTime, sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.goToTime{
            let timeVC = segue.destination as! setTimeViewController
            timeVC.city = self.selectedCity
        }
    }
}

//MARK: - UIPickerViewDelegate

extension setCityViewController : UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let cityBrain = CityBrain()
        let currentCity = cityBrain.city[row]
        let cityRow : String = currentCity.kr
        return cityRow
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let cityBrain = CityBrain()
        let currentCity = cityBrain.city[row]
        selectedCity = currentCity
    }
    
}

//MARK: - UIPickerViewDataSource

extension setCityViewController : UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int { // pickerView의 갯수
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { //pickerView 안 row의 갯수
        let cityBrain = CityBrain()
        let cityList = cityBrain.city
        return cityList.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = (view as? UILabel) ?? UILabel()
        let cityBrain = CityBrain()
        let currentCity = cityBrain.city[row]

        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)

        label.text = currentCity.kr

        return label
      }
}
    


