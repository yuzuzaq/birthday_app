//
//  ImageViewController.swift
//  sampler1
//
//  Created by tatsumi kentaro on 2019/01/19.
//  Copyright © 2019 森川彩音. All rights reserved.
//

import UIKit
import Photos
import AssetsLibrary
import RealmSwift
class ImageViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UILabel!
    let realm = try! Realm()
    override func viewDidLoad() {
        super.viewDidLoad()
        //realmの一番最初のデータを取得
        if let first_data = realm.objects(Person_image.self).first{
            print("type => \(type(of: first_data.data))")
//           NSData -> UIImageに変換
            let image1: UIImage? = UIImage(data: first_data.data as Data)
//            画像を表示
            imageView.image = image1
            
        }
        
    }
    
    // Do any additional setup after loading the view.
    
    
    @IBAction func library_push(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            picker.allowsEditing = true
            present(picker, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        //UIImage -> NSData 変換
        if let data1 = UIImagePNGRepresentation(info[UIImagePickerControllerOriginalImage] as! UIImage){
            //NSDataでrealmnに保存
            let person_image = Person_image()
            person_image.data = data1 as NSData
            try! realm.write() {
                realm.add(person_image)
                print("good")
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
}

class Person_image: Object {
    @objc dynamic var data = NSData()
}



