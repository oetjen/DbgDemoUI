//
//  CheckerClass.swift
//  DbgDemoUI
//
//  Created by Andreas Oetjen on 14.04.21.
//  © 2021 belox software gmbh. All rights reserved.
//

import Foundation
import Dispatch

class CheckerClass {
    
    var lengthCounter = 0
    
    func check(name:String) -> Bool {
        lengthCounter += name.count
        return name.count > 0
    }
    
    func check(name:String, minLength:Int) -> Bool {
        lengthCounter += name.count
        return name.count >= minLength
    }
    
    func check(_ name:String) -> Bool {
        lengthCounter += name.count
        return name.count > 0
    }

    func check(_ name:String, minLength:Int) -> Bool {
        lengthCounter += name.count
        return name.count > 0
    }
    
    func runAsync() {
        let queue = DispatchQueue(label: "demoQueue", qos: .default, attributes: .concurrent, autoreleaseFrequency: .never, target: nil)
        var number:Int32 = 0
        for _ in 0...99 {
            queue.async {
                OSAtomicIncrement32(&number)
                //number = number + 1
                print ("running: \(number)")
            }
        }
        queue.sync(flags:.barrier) {
            print ("finished \(number)")
        }
    }
}
