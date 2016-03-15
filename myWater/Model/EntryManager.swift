//
//  EntryManager.swift
//  myWater
//
//  Created by Marc Felden on 15.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import Foundation

class EntryManager {
    
    private var entries = [Entry]()
    
    func addEntry(entry: Entry) {
        entries.append(entry)
    }
    
    func entriesCount() -> Int {
        return entries.count
    }
    
    func entriesWithDate(date:NSDate) -> [Entry] {

        return entries.filter( { return $0.date.isSameDayAs(date)} )
    }
}


