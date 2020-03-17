//
//  ViewController.swift
//  TestApplication
//
//  Created by WYH_MAC001 on 17/03/20.
//  Copyright © 2020 prashant. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    @IBAction func loginClicked(_ sender: UIButton) {
        let headers = [
          "Content-Type": "application/x-www-form-urlencoded",
        ]

        let postData = NSMutableData(data: "email=\(self.txtEmail.text ?? "")".data(using: String.Encoding.utf8)!)
        postData.append("&password=\(self.txtPassword.text ?? "")".data(using: String.Encoding.utf8)!)

        let request = NSMutableURLRequest(url: NSURL(string: "https://reqres.in/api/login")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            if let data = data{
                do {
                    let json = try JSONSerialization.jsonObject(with: data) as! Dictionary<String, AnyObject>
                    let loginToken = json["token"] as! String
                    PreferenceManager.shared.writeString(key: PreferenceManager.KEY_LOGIN_TOKEN, value: loginToken)
                    DispatchQueue.main.async {
                        self.appDelegate.showHome()
                    }
                } catch {
                    print("error")
                }
            }
        })
        dataTask.resume()
    }
}

