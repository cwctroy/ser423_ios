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
 
import UIKit

class ViewController: UIViewController {
    
    let jsonString = " { \"name\" : \"ASU-Poly\", \"description\" : \"Home of ASU's Software Engineering Programs\", \"category\" : \"School\", \"address-title\" : \"ASU Software Engineering\", \"address-street\" : \"7171 E Sonoran Arroyo Mall Peralta Hall 230 Mesa AZ 85212\", \"elevation\" : 1384.0, \"latitude\" : 33.306388, \"longitude\" : -111.679121 }"
    
    @IBOutlet weak var nameContent: UITextField!
    
    @IBOutlet weak var descriptionContent: UITextField!
    
    @IBOutlet weak var categoryContent: UITextField!
    
    @IBOutlet weak var addressTitleContent: UITextField!
    
    @IBOutlet weak var addressStreetContent: UITextField!
    
    @IBOutlet weak var elevationContent: UITextField!
    
    @IBOutlet weak var latitudeContent: UITextField!

    @IBOutlet weak var longitudeContent: UITextField!
    
    
    @IBAction func ClickMe(_ sender: Any) {
        let pd: PlaceDescription = PlaceDescription(jsonString: jsonString)
        
        nameContent.text=pd.getName()
        descriptionContent.text=pd.getDescription()
        categoryContent.text=pd.getCategory()
        addressTitleContent.text=pd.getAddresTitle()
        addressStreetContent.text=pd.getaddressStreet()
        elevationContent.text="\(pd.getElevation())"
        latitudeContent.text="\(pd.getLatitude())"
        longitudeContent.text="\(pd.getLongitude())"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


}

