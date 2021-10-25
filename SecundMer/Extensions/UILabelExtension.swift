//
//  UILabelExtension.swift
//  SecundMer
//
//  Created by Преподаватель on 21.10.2021.
//

import Foundation
import UIKit


extension UILabel{
    
    func setTextSize(){
        let textSize = frame.width - 30
        
        print(textSize)
        if textSize < 0{
            font = font.withSize(textSize)
        }
    }
    
    func getTextSizeForScreen(){
        let textSize = frame.width / 5
        
        if textSize > 0{
            font = font.withSize(textSize)
        }else{
            font = font.withSize(0)
        }
    }
}
