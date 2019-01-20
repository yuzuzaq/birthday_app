//
//  TopViewController.swift
//  sampler1
//
//  Created by 森川彩音 on 2018/11/25.
//  Copyright © 2018年 森川彩音. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {
    
    let dateString = "2015/03/04 12:34:56 +09:00"

    @IBAction func start(_ sender: Any) {
        //        let storyboard: UIStoryboard = self.storyboard!
        //        let second = storyboard.instantiateViewController(withIdentifier: "first")
        //        self.present(second, animated: true, completion: nil)
        //        performSegue(withIdentifier: "first", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = DateUtils.dateFromString(string: dateString, format: "yyyy/MM/dd HH:mm:ss Z")
        print("type : \(type(of: date))")
        let resultDate = Date(timeInterval: -60*60*24 + 60*60*9, since: date as Date)
        print(resultDate)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


class DateUtils {
    class func dateFromString(string: String, format: String) -> Date {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.date(from: string)!
    }
    
    class func stringFromDate(date: Date, format: String) -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}

