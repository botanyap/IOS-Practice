//
//  PageThreeViewController.swift
//  BoApps
//
//  Created by Macbook Air on 3/30/2560 BE.
//  Copyright © 2560 Botanyap. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire
import XCDYouTubeKit


class PageThreeViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var mTableView:UITableView!
    var mDataArray:[[String:String]] = []
    var mBlurView:DKLiveBlurView! //ใส่เครื่องหมายตกใจ เพื่อบอกว่ามีค่าแน่นอน ไม่ใช่ optional
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
        
        self.mTableView.estimatedRowHeight = 400
        //self.mTableView.rowHeight = UITableViewAutomaticDimension
        
        // Add HeaderView
        let headerView = UIView()
        headerView.frame = CGRect(x: 0, y: 0, width: 0, height: 270)
        headerView.backgroundColor = UIColor.clear
        self.mTableView.tableHeaderView = headerView
        
        //setup Blur View
        self.mBlurView = DKLiveBlurView()
        self.mBlurView.frame = self.view.bounds //ทำให้มันกระจายเต็มหน้าจอ
        self.mBlurView.originalImage = UIImage(named: "listview_iphone.png")
        self.mTableView.backgroundView = self.mBlurView
        self.mBlurView.scrollView = self.mTableView //ทำการมอบ object ของ mBlurView ผ่าน scrollView ไปให้กับ mTableView เพื่อให้มันกะค่าในการ scroll
    }
    
    //func ที่ใช้ในการว่า หน้าจอเราจะปรากฏเท่าไหร่
    override func viewWillAppear(_ animated: Bool) {
        //สภาวะ still นิ่งๆ
        self.mBlurView.scrollView = self.mTableView
    }
   //func ที่ใช้ในการล่อว่า หน้าจอเราปรากฏแล้วเท่าไหร่
    override func viewDidAppear(_ animated: Bool) {
        //already appeared เสร็จแล้ว
    }
    //func ที่ใช้ในการว่า หน้าจอเราจะdisappearเมื่อไหร่
    override func viewWillDisappear(_ animated: Bool) {
        //gonna disappear
        self.mBlurView.scrollView = nil 
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //already disappear
    }
    
    
    
    func loadData() {
        let params:[String:String] = ["username":"admin","password":"password","type":"foods"]
        Alamofire.request("http://www.codemobiles.com/adhoc/youtubes/index_new.php", method:.post, parameters: params).responseJSON { (response) in
            switch response.result {
            case .success:
                let result = response.result.value as! [String:Any]
                self.mDataArray = result["youtubes"] as! [[String:String]] //ทำการแคชข้อมูลที่เป็นอาเรย์
                self.mTableView.reloadData()
                print(self.mDataArray[0]["title"]!)
                break
            default:
                break
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = self.mDataArray[indexPath.row]
        let youtubeID = item["id"]
        
        let youtubeVC = XCDYouTubeVideoPlayerViewController(videoIdentifier:youtubeID)
        self.present(youtubeVC, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mDataArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomTableViewCell
        let item = self.mDataArray[indexPath.row]
        
        cell?.mTitleLabel.text = item["title"]
        cell?.mSubTitleLabel.text = item["subtitle"]
        
//        let url = URL(string: "http://www.moohundesign.com/wp-content/uploads/2017/01/C2lkgW8UAAMYcu-.jpg")
        cell?.mYoutubeImage.af_setImage(withURL: item["youtube_image"]!.url())
        cell?.mAvatarImage.af_setImage(withURL: item["avatar_image"]!.url())
        
        return cell!
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
