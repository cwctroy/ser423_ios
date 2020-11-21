//
//  PlaceLibrary.swift
//  ser423
//
//  Created by Cameron Troy on 11/7/20.
//

import Foundation

class PlaceLibrary {
    
    var places:[String:PlaceDescription] = [String:PlaceDescription]()
    
    init(){}
    
    
    func add(pd:PlaceDescription) {
        if places[pd.getName()] == nil {
            places[pd.getName()] = pd;
            print("Place: \(pd.getName()) added to list")
        }
        else {
            print("Place: \(pd.getName()) already exists in list")
        }
    }
    
    func remove(pdName:String) -> Bool {
        var status:Bool = false
        if places[pdName] == nil {
            print("Place: \(pdName) does not exist in list")
        }
        else {
            places[pdName] = nil
            status = true
        }
        return status
    }
    
    func count() -> Int {
        return places.count
    }
    
    func get(pdName:String) -> PlaceDescription {
        var ret:PlaceDescription = PlaceDescription()
        
        if places[pdName] != nil {
            ret = places[pdName]!
        }
        
        return ret
    }
    
    func getKeys() -> Dictionary<String, PlaceDescription>.Keys {
        return places.keys;
    }
    
}
