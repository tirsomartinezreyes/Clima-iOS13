//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

//IB Outlets
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
//Variables
    var appModel = AppModel()
    var weatherRequester = WeatherRequester()
    
//Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
    }

//IB Actions
    @IBAction func searchPressed(_ sender: UIButton) {
        print("on searchPressed")
        let city = searchTextField.text ?? ""
        if city != "" {
            appModel.setCity(city: city)
            appModel.debug()
            hideKeyboard()
            weatherRequester.fetchWeather(cityName: appModel.getCity())
        }else{
            //Nothing to search
        }
    }
    
    //Delegate Functions
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("on textfieldShouldReturn")
        var output = false;
        if (searchTextField.text ?? "") != "" {
            searchPressed(searchButton)
            output = true
        }
        print(output)
        return output
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("on textFieldShouldEndEditing")
        if searchTextField.text == "" {
            return false
        }
        else {
            return true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("on textFieldDidEndEditing")
        searchTextField.text = ""
    }
    
    //Functions
    func hideKeyboard(){
        print("on hideKeyboard")
        searchTextField.endEditing(true)
    }
    
}
