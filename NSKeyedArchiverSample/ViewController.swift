//
//  ViewController.swift
//  NSKeyedArchiverSample
//
//  Created by Kimisira on 2016/03/24.
//  Copyright © 2016年 Kimisira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //アーカイブボタン押下時
    @IBAction func respondToArchiveButton(sender: AnyObject) {
//        //ファイルパスの取得
//        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as Array<String>
//        
//        //保存してあるファイルの名前
//        let filePath = String(paths[0]) + "data.dat"
//        
//        //保存するデータ,氏名と住所
//        let array = ["山田太郎","104-0061","東京都","中央区","銀座一丁目"]
//        
//        let successful = NSKeyedArchiver.archiveRootObject(array, toFile: filePath)
//        if successful {
//            print("データの保存に成功しました")
//        }
        
        //自作クラスのオブジェくをアーカイブして保存する
        //山田太郎,花子オブジェクト,(住所が同じ夫婦という設定)
        let address1 = Address(zipCode:"104-0061",state: "東京都",city: "中央区",other: "銀座一丁目")
        let tariYamada = Person(name:"山田太郎",address:address1)
        let hanakoYamada = Person(name:"山田花子",address: address1)
        
        //田中次郎オブジェクト
        let address2 = Address(zipCode: "604-8126",state: "京都府",city: "京都市",other: "中央区")
        let jiroTanaka = Person(name: "田中次郎",address: address2)
        
        //保存するデータを配列にまとめる
        let people = [tariYamada,hanakoYamada,jiroTanaka]
        
        //保存するファイルの設定
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as [String]
        let filePath = String(paths[0]) + "data.dat"
        
        //アーカイブしてファイルの設定
        
        let successful = NSKeyedArchiver.archiveRootObject(people, toFile: filePath)
        if successful {
            print("データの保存に成功しました")
        }
        
    }
    
    //アンアーカイブボタン押下時
    @IBAction func respondToUnarchveButton(sender: AnyObject) {
//        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as Array<String>
//        
//        let  filePath = String(paths[0]) + "data.dat"
//        
//        if let array = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as? Array<String> {
//            for str in array {
//                print(str)
//            }
//        }else{
//            print("データがありません")
//        }
        
        //ファイルに保存された自作クラスのオブジェクトを復元する
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        
        let filePath = String(paths[0]) + "data.dat"
        
        let array = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as! Array<Person>
        for person in array {
            print(person.name)
            print(person.address.zipCode)
            print(person.address.state)
            print(person.address.city)
            print(person.address.other)
            
        }
        
        
    }
}

