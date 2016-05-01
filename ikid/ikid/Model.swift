//
//  Model.swift
//  ikid
//
//  Created by Evan on 4/30/16.
//  Copyright © 2016 Evan. All rights reserved.
//

import Foundation

public class Data {
    
    public var jokes : NSDictionary = Dictionary<String, Array<Array<String>>>()
    private var puns : [[String]]!
    private var dad : [[String]]!
    private var geeky : [[String]]!
    
    public init() {
        puns = [["You can't run through a camp ground", "You can only ran, because its past tents"]]
        dad = [["Whats the difference between a tuna and a piano?", "You can tuna piano, but you can't piano a tuna!"]]
        geeky = [["Oxygen and Potassium went out on a date.", "It went OK"], ["Yo mamma's so fat that...", "That when she sat on a binary tree, she turned it into a linked list in O(n) time"], ["How many programmers does it take to change a lightbulb?", "None, thats a hardware problem"], ["To understand recursion..", "You must first understand recursion"]]
        jokes = [
            "puns" : puns,
            "dad" : dad,
            "geeky" : geeky
        ]
        
    }
    
    public func getArray(index : String) -> [String] {
        let holder = self.jokes["geeky"]
        let num = Int(arc4random_uniform(UInt32(holder!.count)))
        let ret = holder![num]
        return ret as! [String]
    }
    
    
    
    
}