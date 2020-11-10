//
//  PlaceLibrary.swift
//  ser423
//
//  Created by Cameron Troy on 11/7/20.
//

import Foundation

class PlaceLibrary {
    
    var places:[String:PlaceDescription] = [String:PlaceDescription]()
    
    init(){
        if let path = Bundle.main.path(forResource: "places", ofType: "json"){
            do {
                let jsonStr:String = try String(contentsOfFile:path)
                let data:Data = jsonStr.data(using: String.Encoding.utf8)!
                let dict:[String:Any] = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String:Any]
                for pdName:String in dict.keys {
                    let aPlaceDescription:PlaceDescription = PlaceDescription(jsonString: dict[pdName] as! String)
                    self.places[pdName] = aPlaceDescription
                }
            } catch {
                print("contents of places.json could not be loaded")
                }
            }    }
    
    func add(pd:PlaceDescription) -> Bool {
        var status:Bool = false
        if places[pd.getName()] == nil {
            places[pd.getName()] = pd;
            status = true;
            print("Place: \(pd.getName()) added to list")
        }
        else {
            print("Place: \(pd.getName()) already exists in list")
        }
        return status
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
    
    
}
