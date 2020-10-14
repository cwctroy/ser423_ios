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
    private var address = [String]()
    private var elevation: Int
    private var lattitude: Double
    private var longitude: Double
    
    init?(name :String, description: String, category: String, addressTitle: String, address: [String], elevation: Int, lattitude: Double, longitude: Double)
    {
        self.name = name
        self.description = description
        self.category = category
        self.addressTitle = addressTitle
        self.address = address
        self.elevation = elevation
        self.lattitude = lattitude
        self.longitude = longitude
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
    
    func getaddress() -> [String] {
        return self.address
    }
    
    func getElevation() -> Int {
        return self.elevation
    }
    
    func getLattitude() -> Double {
        return self.lattitude
    }
    
    func getLotgitude() -> Double {
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
    
    func setAddress(address: [String]) {
        self.address = address
    }
    
    func setElevation(elevation: Int) {
        self.elevation = elevation
    }
    
    func setLattitude(lattitude: Double) {
        self.lattitude = lattitude
    }
    
    func setLongitude(longitude: Double) {
        self.longitude = longitude
    }
    
}
