//
//  AppDelegate.swift
//  sampler1
//
//  Created by 森川彩音 on 2018/09/16.
//  Copyright © 2018年 森川彩音. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications
import RealmSwift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate {
    
    var window: UIWindow?
    let realm = try! Realm()
    //realmオブジェクト
var contentsArray = [dateData]()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 10.0, *) {
            // iOS 10
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.badge, .sound, .alert], completionHandler: { (granted, error) in
                if error != nil {
                    return
                }
                
                if granted {
                    print("通知許可")
                    
                    let center = UNUserNotificationCenter.current()
                    center.delegate = self
                    
                } else {
                    print("通知拒否")
                }
            })
            
        } else {
            // iOS 9以下
            let settings = UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil)
            UIApplication.shared.registerUserNotificationSettings(settings)
        }
        // Override point for customization after application launch.
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("きてるよ")
        //アプリがになった時に呼ばれる
        var trigger: UNNotificationTrigger
        let content = UNMutableNotificationContent()
        var notificationTime = DateComponents()
        contentsArray = [dateData]()
        //realmから登録した全てのオブジェクトから取り出す
        let data = realm.objects(AlertData.self)
        // ここで全てを一つずつ取り出しcontentsArrayに追加
        data.forEach { (diff) in
            contentsArray.append(dateData(title: diff.title, contents: diff.contents, month: diff.month, day: diff.day))
        }
        var num = 0
        //        contentsArrayを一つずつ取り出し通知のトリガーを登録
        for contents in contentsArray{
            print(contents.month)
            print(contents.day)
            notificationTime.day = Int(contents.month)
            notificationTime.month = Int(contents.day)
            
            notificationTime.hour = 10
            notificationTime.minute = 33
            trigger = UNCalendarNotificationTrigger(dateMatching: notificationTime, repeats: true)
            
            // 通知内容の設定
            content.title = contents.title
            content.body = ("Happy Birthday!")
            content.sound = UNNotificationSound.default()
            
            // 通知スタイルを指定
            let request = UNNotificationRequest(identifier: "uuid\(num)", content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            print(num)
            num += 1
        }
        
        for contents in contentsArray{
            print(contents.month)
            print(contents.day)
            if contents.month == 1 {
                if contents.day == 1 {
                    if contents.month == 1{
                        notificationTime.day == 31
                        notificationTime.month = 1
                    } else {
                    notificationTime.day == 31
                    notificationTime.month = Int(contents.day)
                }
                }
                if contents.day == 2 {
                    notificationTime.day == 31
                }
                if contents.day == 3 {
                    
                    notificationTime.day == 28
                }
                if contents.day == 4 {
                    notificationTime.day == 31
                }
                if contents.day == 5 {
                    notificationTime.day == 30
                }
                if contents.day == 6 {
                    notificationTime.day == 31
                }
                if contents.day == 7 {
                    notificationTime.day == 30
                }
                if contents.day == 8 {
                    notificationTime.day == 31
                }
                if contents.day == 9 {
                    notificationTime.day == 31
                }
                if contents.day == 10 {
                    notificationTime.day == 30
                }
                if contents.day == 11 {
                    notificationTime.day == 31
                }
                if contents.day == 12 {
                    
                    notificationTime.day == 30
                }
            }else{
                notificationTime.day = Int(contents.month)
                notificationTime.month = Int(contents.day)
            }
            
        notificationTime.month = Int(contents.day)
        
        notificationTime.hour = 12
        notificationTime.minute = 18
        trigger = UNCalendarNotificationTrigger(dateMatching: notificationTime, repeats: true)
    
        // 通知内容の設定
        content.title = ("明日は" + content.title + "の誕生日！" )
        content.body = (contents.contents + "がプレゼントにオススメ！")
        content.sound = UNNotificationSound.default()
        
        // 通知スタイルを指定
        let request = UNNotificationRequest(identifier: "uuid\(num)", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        print(num)
        num += 1
    }
        
    
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

//    func applicationWillTerminate(_ application: UIApplication) {
//        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
//        // Saves changes in the application's managed objectcontext before the application terminates.
//        self.saveContext()
//    }

// MARK: - Core Data stack

}
