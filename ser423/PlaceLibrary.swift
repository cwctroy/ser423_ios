 /* Copyright 2020
  * Cameron W.C. Troy,
  *
  * This software is the intellectual property of the author, and can not be distributed, used, copied, or
  * reproduced, in whole or in part, for any purpose, commercial or otherwise. The author grants the ASU
  * Software Engineering program the right to copy, execute, and evaluate this work for the purpose of
  * determining performance of the author in coursework, and for Software Engineering program evaluation,
  * so long as this copyright and right-to-use statement is kept in-tact in such use.
  * All other uses are prohibited and reserved to the author
  *
  * @author Cameron Troy cwtroy@asu.edu
  * @version November 2020
  */

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
