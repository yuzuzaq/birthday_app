//
//  ViewController.swift
//  sampler1
//
//  Created by 森川彩音 on 2018/09/16.
//  Copyright © 2018年 森川彩音. All rights reserved.
//

import UIKit
import RealmSwift
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let realm = try! Realm()
    var contentsArray = [dateData]()
    //    var todoItem: Results<dateData>!
    @IBOutlet weak var table1: UITableView!

    var data = [AlertData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        table1.delegate = self
        table1.dataSource = self

        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        contentsArray = [dateData]()
//        let realm = try! Realm()
//        
//        if let firstPerson = realm.objects(AlertData.self).first {
//            try! realm.write() {
//                realm.delete(firstPerson)
//            }
//        }
        //realmデータを全て取り出し
        let data = realm.objects(AlertData.self)
        //realmデータを一つずつ取り出しcontentsArrayに追加
        data.forEach { (diff) in
            contentsArray.append(dateData(title: diff.title, contents: diff.contents, month: diff.month, day: diff.day))
        }
        print(contentsArray)
        table1.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = contentsArray[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contentsArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            print(indexPath.row)
//            let realm = try! Realm()
            let targettitles = self.realm.objects(AlertData.self).filter("title == %@", contentsArray[indexPath.row].title)
            targettitles.forEach{
                deletetitle in
                try! self.realm.write() {
                    self.realm.delete(deletetitle)
                }
            }
            
        }
    }

}

class dateData {
    var title:String!
    var contents:String!
    var month:Int!
    var day:Int!
    init(title:String,contents:String,month:Int,day:Int) {
        self.title = title
        self.contents = contents
        self.month = month
        self.day = day
    }
}


//realmオブジェクトを設定




