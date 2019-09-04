//
//  ViewController.swift
//  xiaoying_ios
//
//  Created by PeiYu Wang on 2019/8/31.
//  Copyright © 2019 PeiYu Wang. All rights reserved.
//

import UIKit
import CryptoSwift
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        do {
            let str = "欢迎访问 hangge.com"
            print("原始字符串：\(str)")
            
            let key = "hangge.com123456"
            print("key密钥：\(key)")
            
            let iv = "1234567890123456"
            print("密钥偏移量：\(iv)")
            
            //使用AES-128-CBC加密模式
            let aes = try AES(key: key.bytes, blockMode: CBC(iv: iv.bytes))
            
            //开始加密
            let encrypted = try aes.encrypt(str.bytes)
            print("加密结果(base64)：\(encrypted.toBase64()!)")
            
            //开始解密
            let decrypted = try aes.decrypt(encrypted)
            print("解密结果：\(String(data: Data(decrypted), encoding: .utf8)!)")
            print("md结果：\(String(data: Data(decrypted), encoding: .utf8)!.md5())")
        } catch { }
    }


}

