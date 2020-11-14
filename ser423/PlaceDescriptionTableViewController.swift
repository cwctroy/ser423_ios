//
//  PlaceDescriptionTableViewController.swift
//  ser423
//
//  Created by Cameron Troy on 11/7/20.
//

import UIKit

class PlaceDescriptionTableViewController: UITableViewController {
    
    //TODO: Load this array from json in onCreate
    var placeDescriptionCollection:PlaceLibrary = PlaceLibrary()
    var names:[String] = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("viewDidLoad")
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        let addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(PlaceDescriptionTableViewController.addPlaceDescription))
        
        self.navigationItem.rightBarButtonItem = addButton
        
        if let path = Bundle.main.path(forResource: "places", ofType: "json") {
            do {
                let jsonStr:String = try String(contentsOfFile:path)
                let data:Data = jsonStr.data(using: String.Encoding.utf8)!
                let dict:[String:Any] = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String:Any]
                for aPlaceDescriptionName:String in dict.keys {
                    let aPlaceDescription:PlaceDescription = PlaceDescription(jsonString: dict[aPlaceDescriptionName] as! String)
                    self.placeDescriptionCollection.add(pd: aPlaceDescription)
                }
            } catch {
                print("contents of places.json could not be loaded")
            }
        }
        self.title = "Place Description List"
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print("tableView editing row at: \(indexPath.row)")
        if editingStyle == .delete {
            let selectedPlaceDescription:PlaceDescription = placeDescriptionCollection.get(pdName: names[indexPath.row])
            print("deleting place description \(selectedPlaceDescription.getName())")
            placeDescriptionCollection.remove(pdName: selectedPlaceDescription.getName())
            names = Array(placeDescriptionCollection.getKeys())
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeDescriptionCollection.count()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let aPlaceDescription = placeDescriptionCollection.get(pdName: names[indexPath.row]) as PlaceDescription
        cell.textLabel?.text = aPlaceDescription.getName();
        cell.detailTextLabel?.text = aPlaceDescription.getDescription();

        return cell
    }

    @objc func addPlaceDescription() {
        print("add PlaceDescription button clicked")
        
        let promptND = UIAlertController(title: "New PlaceDescription", message: "Enter details", preferredStyle: UIAlertController.Style.alert)
        promptND.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
        promptND.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) -> Void in
            let newName:String = (promptND.textFields?[0].text == "") ? "unknown" : (promptND.textFields?[0].text)!
            
            let newDescription:String = (promptND.textFields?[1].text == "") ? "unknown" : (promptND.textFields?[1].text)!
            
            let newCategory:String = (promptND.textFields?[2].text == "") ? "unknown" : (promptND.textFields?[2].text)!
            
            let newAddressTitle:String = (promptND.textFields?[3].text == "") ? "unknown" : (promptND.textFields?[3].text)!
            
            let newAddressStreet:String = (promptND.textFields?[4].text == "") ? "unknown" : (promptND.textFields?[4].text)!
            
            let newElevation:Int = (promptND.textFields?[5].text == "") ? 0 : Int((promptND.textFields?[5].text)!)!
            
            let newLatitude:Double = (promptND.textFields?[6].text == "") ? 0 : Double((promptND.textFields?[6].text)!)!
            
            let newLongitude:Double = (promptND.textFields?[7].text == "") ? 0 : Double((promptND.textFields?[7].text)!)!
            
            let aPlaceDescription:PlaceDescription = PlaceDescription(name: newName, description: newDescription, category: newCategory, addressTitle: newAddressTitle, addressStreet: newAddressStreet, elevation: newElevation, latitude: newLatitude, longitude: newLongitude)!
            
            self.placeDescriptionCollection.add(pd: aPlaceDescription)
            
            self.tableView.reloadData()
        }))
        promptND.addTextField(configurationHandler: {(textField: UITextField!) in textField.placeholder = "Name"
        })
        promptND.addTextField(configurationHandler: {(textField: UITextField!) in textField.placeholder = "Description"
        })
        promptND.addTextField(configurationHandler: {(textField: UITextField!) in textField.placeholder = "Category"
        })
        promptND.addTextField(configurationHandler: {(textField: UITextField!) in textField.placeholder = "Address Title"
        })
        promptND.addTextField(configurationHandler: {(textField: UITextField!) in textField.placeholder = "Address Street"
        })
        promptND.addTextField(configurationHandler: {(textField: UITextField!) in textField.placeholder = "Elevation"
        })
        promptND.addTextField(configurationHandler: {(textField: UITextField!) in textField.placeholder = "Latitude"
        })
        promptND.addTextField(configurationHandler: {(textField: UITextField!) in textField.placeholder = "Longitude"
        })
        present(promptND, animated: true, completion: nil)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        NSLog("segue indetifier is \(segue.identifier ?? "unknown")")
        
        if segue.identifier == "PlaceDescriptionDetail" {
            let viewController:PlaceDescriptionDetailView = segue.destination as! PlaceDescriptionDetailView
            let indexPath = self.tableView.indexPathForSelectedRow!
            viewController.selectedPlaceDescription = placeDescriptionCollection.get(pdName: names[indexPath.row]);
        }
        
    }
    

}
