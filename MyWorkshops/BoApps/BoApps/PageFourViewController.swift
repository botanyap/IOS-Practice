//
//  PageFourViewController.swift
//  BoApps
//
//  Created by Macbook Air on 3/30/2560 BE.
//  Copyright © 2560 Botanyap. All rights reserved.
//

import UIKit
import FMDB //ใช้สำหรับเรียก Database

//Add protocal (UITableViewDataSource and UITableViewDelegate)
//Implement protocal (numberOfSection, numberOfRowInsection , cellForRow)
// Set dummy row tcount to 1 and Set dummy row to 100
//go to storyboard and set tableview's delegate (datadource & delegate) to self icon

class PageFourViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    var mDatabase:FMDatabase!
    var mDataArray:[[String:String]] = []
    
    @IBOutlet weak var mTableView:UITableView!
    
    let mFlightDummyArray:[String] =
        ["07:00     TG102       BKK     A33",
         "16:30     BE731       LON     B01",
         "09:45     FR122       FRA     D23",
         "19:30     AA911       AME     F53",
         "01:20     CN099       CHA     G22",
         "12:10     TG233       DEN     A23",
         "17:40     KR122       LDN     J32",
         "13:30     JP291       JAN     C04",
         "20:20     KR001       KOR     D09",
         "21:10     LU022       SPN     E22",
         "22:40     TG110       URN     A18"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.openDB()
        self.query()
        
    }
    
   
    @IBAction func insert(){
        
        let randomIndex = Int(arc4random_uniform(11))//แปลงเป็น Int แล้วก็ให้มันแกว่งค่าตั้งแต่ 0...10 โดยใช้ ฟrc4random
        let dummyData = self.mFlightDummyArray[randomIndex]
        
        self.mDatabase.executeUpdate("INSERT INTO FIELDS (FIELD_DATA) VALUES (?)", withArgumentsIn:[dummyData])
        self.query()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let rowID = self.mDataArray[indexPath.row]["ROW"]
            self.remove(rowID)
            self.query()
        }
    }
    
    func remove(_ rowID:String?) {
        self.mDatabase.executeUpdate("DELETE FROM FIELDS WHERE ROW = ?", withArgumentsIn: [rowID!])
        self.query()
    }
    
    func query() {
        self.mDataArray.removeAll() //เคลียของเก่าออกก่อน
        if let rs = self.mDatabase.executeQuery("SELECT ROW, FIELD_DATA FROM FIELDS ORDER BY ROW DESC", withArgumentsIn: nil){
            
            while rs.next() {
                let rowID = rs.int(forColumn: "ROW")
                let rowData = rs.string(forColumn: "FIELD_DATA")
                
                let item:[String:String] = ["ROW":String(rowID),"FIELD_DATA":rowData!]
                self.mDataArray.append(item) //วนยัดข้อมูลจนหมด
            }
            self.mTableView.reloadData()
        }
        
        
    }
    
    func openDB() {
    
        let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .allDomainsMask, true)[0] + "/mydata.sqlite"
        print(dbPath)
        
        let fileManager = FileManager()
        if !fileManager.fileExists(atPath: dbPath){
            //Duplicate file into sandbox
            
            let dbPathBundle = Bundle.main.path(forResource: "mydata.sqlite", ofType: nil)
            do {
             try fileManager.copyItem(atPath: dbPathBundle!, toPath: dbPath)
            }catch {
                print(error.localizedDescription)
            }
        }
        self.mDatabase = FMDatabase(path: dbPath)
        self.mDatabase.open()
    }
    
    
    //เมดทอดนี้จะถูกเรียกตอนกดปุ่ม edit
    override func setEditing(_ editing: Bool, animated: Bool) {
        if self.navigationItem.rightBarButtonItem?.title == "Edit" {
            self.navigationItem.rightBarButtonItem?.title = "Done"
            self.mTableView.setEditing(true, animated: true)
        }else{
            self.mTableView.setEditing(false, animated: true)
            self.navigationItem.rightBarButtonItem?.title = "Edit"
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mDataArray.count
    }
    
    
    //ทำ overide mdthod
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let section = tableView.dequeueReusableCell(withIdentifier: "section")
        
        return section?.contentView //return เฉพาะcontentview
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //ต่อไปทำการแคลช ไปดูในคลิปวิดิโอของอาจารย์ได้ ชื่อว่า การทำ typing cast
        //แบบแรก Up cast : as garantee ว่า casting successful 100% 
            //- ต้องดูด้วยว่าเป็นการแคลชจากแม่ไปยังลูกหรือเปล่า ถ้าไม่ใช่จะ error
        //แบบสอง down cast : as (! or ?) - ungarantee casting
            //- optional down cast : as? - output of castion is optional
            //- forced down cast : as! - output od cast is non-optional
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? DBTableViewCell
        
        let item = self.mDataArray[indexPath.row]
        cell?.mFlightLabel.text = item["FIELD_DATA"]
        
        if indexPath.row % 2 == 1 {
            cell?.mFlightImage.image = UIImage(named: "landing_icon.png")
        }else{
            cell?.mFlightImage.image = UIImage(named: "takeoff_icon.png")
        }
        return cell!
        
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            let rowID = self.mDataArray[indexPath.row]["ROW"]
//            self.deleteRow(whichArg: rowID!)
//        }
//    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
