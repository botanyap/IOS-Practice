//
//  PageFiveViewController.swift
//  BoApps
//
//  Created by Macbook Air on 3/30/2560 BE.
//  Copyright © 2560 Botanyap. All rights reserved.
//

import UIKit
import Alamofire

class PageFiveViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var mImageView:UIImageView!
    var mImagePickerController:UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mImagePickerController = UIImagePickerController()
        self.mImagePickerController.sourceType = .camera
        self.mImagePickerController.delegate = self
        
        //make circle Image
        self.mImageView.layer.masksToBounds = true
        self.mImageView.layer.cornerRadius = (self.mImageView.bounds.height)/2
        
    }

    
    @IBAction func onClickCamera(){
        self.present(self.mImagePickerController, animated: true, completion: nil)//คำสั่งในการสั่งเปิด
    }
    
    @IBAction func onClickUpload(){
        let imageData = UIImageJPEGRepresentation(self.mImageView.image!, 0.5)//ใช้ในการบีบอัดรูปภาพ
        let imageName = String(arc4random()) + ".jpeg"
        self.uploadFile(url: "http://192.168.1.44/uploads/up.php", data: imageData!, fileName: imageName)
    }
    
    func uploadFile(url:String, data:Data, fileName:String){
        
        let parameter = ["username":"admin", "password":"1234"]
        Alamofire.upload(multipartFormData: { MultipartFormData in
            MultipartFormData.append(data, withName: "userfile", fileName: fileName, mimeType: "image/jpg") //fileTypeที่ต้องการอัพโหลด
            for(key,value) in parameter{
                MultipartFormData.append(value.data(using: .utf8)!, withName: key)
            }
        }, to: url, method: .post) { encodingResult in
            switch encodingResult{
            case .success(let upload, _, _):
                upload.responseString(completionHandler: { (response) in
                    switch response.result {
                    case .success:
//                        self.showAlert(responseMsg: response.result.value!) //เรียกเข้า func showAlert ซึ่งมีหลาย ฟังชั่น
                        self.showAlertWithCloseOutSideEnable(responseMsg: response.result.value!)
                        break
                    case .failure:
                        print("failure")
                        break
                    }
                })
                break
            case .failure:
                print("failure")
                break
            }
        }
    }
    
    func showAlert(responseMsg:String){
        let alertVC = UIAlertController(title: "Response", message: responseMsg, preferredStyle: .actionSheet)
        alertVC.addAction(UIAlertAction(title: "CLOSE", style: .cancel, handler: nil))
        alertVC.addAction(UIAlertAction(title: "RE-TRY", style: .default, handler: { (alert) in
            self.onClickUpload()
        }))
        
        let completionObj = {print("Shown")}
        self.present(alertVC, animated: true, completion: completionObj)
        
        
    }
    
    func showAlertWithCloseOutSideEnable(responseMsg:String) {
        let alertVC = UIAlertController(title:"Response",message:responseMsg, preferredStyle: .alert)
        self.present(alertVC, animated: true) {
            let tapGesture = UITapGestureRecognizer(target:self, action: #selector(self.closeAlert))
            alertVC.view.superview?.addGestureRecognizer(tapGesture) //กดoutside Alert แล้วให้ popup alert close
        }
    }
    
    func closeAlert()  {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.mImageView.image = image
        self.dismiss(animated: true, completion: nil) //completion มีไว้ในการดัก alert
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
