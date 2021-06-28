//
//  ViewController.swift
//  DbgDemoUI
//
//  Created by Andreas Oetjen on 09.04.21.
//

import Cocoa

class ViewController: NSViewController {

    var pressCount = 0

    var checker:CheckerClass!

    let legacyObject = LegacyClass()
    @IBOutlet var nameField:NSTextField!

    @IBAction func stopItPressed(sender:NSButton) {
        raise(SIGINT)
    }
    
    @IBAction func checkNamePressed(sender:NSButton) {
        if checker == nil {
            checker = CheckerClass()
        }
        
        let result = checker.check(name:nameField.stringValue, minLength: 3)
        if (result) {
            nameField.layer?.borderWidth = 0.0
        } else {
            nameField.wantsLayer = true
            nameField.layer?.borderColor = NSColor.red.cgColor
            nameField.layer?.borderWidth = 2.0
        }
    }

    @IBAction func buttonPressed(sender:NSButton) {
        pressCount += 1
        let name = sender.title
        print ("\(name) button was pressed \(pressCount) times")
    }

    @IBAction func callObjcPressed(_ sender: Any) {
        let result = legacyObject.legacyMethod("Hello")
        print("result: \(result)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    override var description: String {
        return "In the ViewController: \(pressCount)"
    }

   override var debugDescription: String {
        return "In the debug ViewController: \(pressCount)"
    }

}

