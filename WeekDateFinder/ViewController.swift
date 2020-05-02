//
//  ViewController.swift
//  WeekDateFinder
//
//  Created by Никита Большаков on 02.05.2020.
//  Copyright © 2020 Bolshakov Nikita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func findDay(_ sender: UIButton) {
        
        // проверка
        guard let day = dateTextField.text, let month = monthTextField.text, let year = yearTextField.text else {
            return
        }
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        
        // Здесь неправильно извлечен опционал !! изменить строчки
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        //  Создаю дату со спец классом DateFormatter. Далее создаем формат даты http://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        
        //Изходя из текущей даты я хочу получить день недели, поэтому
        //#2
        let date = calendar.date(from: dateComponents)
        //#1
        let weekday = dateFormatter.string(from: date!)
        
        resultLabel.text = weekday
    }
    //Работа с клавиатурой ( переопределение функции touchesBegan)
    //Функция работает по нажатию на экран.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
