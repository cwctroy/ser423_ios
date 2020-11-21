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
  * @version October 2020
  */
import Foundation

class PlaceDescription {
    private var  name: String
    private var description: String
    private var category: String
    private var addressTitle: String
    private var addressStreet: String
    private var elevation: Int
    private var latitude: Double
    private var longitude: Double
    
    private var defaultString: String = "unknown"
    
    init() {
        self.name = defaultString
        self.description = defaultString
        self.category = defaultString
        self.addressTitle = defaultString
        self.addressStreet = defaultString
        self.elevation = 0
        self.latitude = 0.0
        self.longitude = 0.0
    }
    
    init?(name :String, description: String, category: String, addressTitle: String, addressStreet: String, elevation: Int, latitude: Double, longitude: Double)
    {
        self.name = name
        self.description = description
        self.category = category
        self.addressTitle = addressTitle
        self.addressStreet = addressStreet
        self.elevation = elevation
        self.latitude = latitude
        self.longitude = longitude
    }
    
    init (jsonString: String) {
        self.name = ""
        self.description = ""
        self.category = ""
        self.addressTitle = ""
        self.addressStreet = ""
        self.elevation = 0
        self.latitude = 0.0
        self.longitude = 0.0
        if let data: Data = jsonString.data(using: String.Encoding.utf8){
            do {
                let dict = try JSONSerialization.jsonObject(with: data, options:.mutableContainers) as?[String:Any]
                self.name = (dict!["name"] as? String)!
                self.description = (dict!["description"] as? String)!
                self.category = (dict!["category"] as? String)!
                self.addressTitle = (dict!["address-title"] as? String)!
                self.addressStreet = (dict!["address-street"] as? String)!
                self.elevation = (dict!["elevation"] as? Int)!
                self.latitude = (dict!["latitude"] as? Double)!
                self.longitude = (dict!["longitude"] as? Double)!
            } catch {
                print ("unable to convert dictionary")
            }
        }
    }
    
    public init(dict:[String:Any]) {
        self.name = dict["name"] == nil ? "unknown" : dict["name"] as! String
        self.description = dict["description"] == nil ? "unknown" : dict["description"] as! String
        self.category = dict["category"] == nil ? "unknown" : dict["category"] as! String
        self.addressTitle = dict["address-title"] == nil ? "unknown" : dict["address-title"] as! String
        self.addressStreet = dict["address-street"] == nil ? "unknown" : dict["address-street"] as! String
        self.elevation = dict["elevation"] == nil ? 0 : dict["elevation"] as! Int
        self.latitude = dict["latitude"] == nil ? 0.0 : dict["elevation"] as! Double
        self.longitude = dict["longitude"] == nil ? 0.0 : dict["longitude"] as! Double
    }
    
    //GETTERS
    func getName() -> String {
        return self.name
    }
    
    func getDescription() -> String {
        return self.description
    }
    
    func getCategory() -> String {
        return self.category
    }
    
    func getAddresTitle() -> String{
        return self.addressTitle
    }
    
    func getaddressStreet() -> String {
        return self.addressStreet
    }
    
    func getElevation() -> Int {
        return self.elevation
    }
    
    func getLatitude() -> Double {
        return self.latitude
    }
    
    func getLongitude() -> Double {
        return self.longitude
    }
    
    //SETTERS
    func setName(name: String) {
        self.name = name
    }
    
    func setCategory(category: String) {
        self.category = category
    }
    
    func setAddressTitle(addressTitle: String) {
        self.addressTitle = addressTitle
    }
    
    func setAddress(addressStreet: String) {
        self.addressStreet = addressStreet
    }
    
    func setElevation(elevation: Int) {
        self.elevation = elevation
    }
    
    func setLattitude(latitude: Double) {
        self.latitude = latitude
    }
    
    func setLongitude(longitude: Double) {
        self.longitude = longitude
    }
    
    func toJsonString() -> String {
        var jsonString = ""
        let dict:[String:Any] = ["name": self.name, "description": self.description, "category": self.category, "address-title": self.addressTitle, "address-street": self.addressStreet, "elevation": self.elevation, "latitude": self.latitude, "longitude": self.longitude] as [String : Any]
        do {
            let jsonData:Data = try JSONSerialization.data(withJSONObject: dict, options: JSONSerialization.WritingOptions.prettyPrinted)
            jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
        } catch let error as NSError {
            print(error)
            
        }
        return jsonString
    }
    
    func toString() -> String {
        var ret = ""
        
        ret += "Name: \(self.name)\n"
        ret += "Description: \(self.description)\n"
        ret += "Category: \(self.category)\n"
        ret += "Address Title: \(self.addressTitle)\n"
        ret += "Address Street \(self.addressStreet)\n"
        ret += "Elevation: \(self.elevation)\n"
        ret += "Latitude: \(self.latitude)\n"
        ret += "Longitude: \(self.longitude)\n"
        
        return ret
    }
}
