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

class PlaceDescriptionDetailView: UIViewController {
    
    var selectedPlaceDescription:PlaceDescription = PlaceDescription()

    
    @IBOutlet weak var nameContent: UITextField!
    
    @IBOutlet weak var descriptionContent: UITextField!
    
    @IBOutlet weak var categoryContent: UITextField!
    
    @IBOutlet weak var addressTitleContent: UITextField!
    
    @IBOutlet weak var addressStreetContent: UITextField!
    
    @IBOutlet weak var elevationContent: UITextField!
    
    @IBOutlet weak var latitudeContent: UITextField!

    @IBOutlet weak var longitudeContent: UITextField!
    
    
    @IBAction func ClickMe(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameContent.text = self.selectedPlaceDescription.getName()
        categoryContent.text = self.selectedPlaceDescription.getCategory()
        addressTitleContent.text = self.selectedPlaceDescription.getAddresTitle()
        addressStreetContent.text = self.selectedPlaceDescription.getaddressStreet()
        elevationContent.text = String(self.selectedPlaceDescription.getElevation())
        latitudeContent.text = String(self.selectedPlaceDescription.getLatitude())
        
    }

}

