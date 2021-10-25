//
//  TimeCheker.swift
//  SecundMer
//
//  Created by Преподаватель on 21.10.2021.
//

import Foundation


class TaimCheker{
    
    var time = 0.00
    var hour = 0
    var minute = 0
    var secund = 0
    static let main = TaimCheker()
    
    
    
    func chekTime(){
        if time >= 1{
            time = 0
            secund += 1
        }
        
        if secund >= 60{
            secund = 0
            minute += 1
        }
        
        if minute >= 60{
            minute = 0
            hour += 1
        }
        
    }
    
    func clear() {
        time = 0.00
        hour = 0
        minute = 0
        secund = 0
    }
    
    
}
