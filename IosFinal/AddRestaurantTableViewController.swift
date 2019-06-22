//
//  AddRestaurantTableViewController.swift
//  IosFinal
//
//  Created by User18 on 2019/6/15.
//  Copyright © 2019 ibob. All rights reserved.
//

import UIKit

class AddRestaurantTableViewController: UITableViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var restaurant: Restaurant?
    
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var latitude: UITextField!
    @IBOutlet weak var londitude: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var type: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var photobutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as? UIImage
        photobutton.setBackgroundImage(image, for: .normal)
        
        dismiss(animated: true, completion: nil)
    }
    // MARK: - Table view data source
    
    @IBAction func changePhoto(_ sender: Any) {
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        controller.allowsEditing = true
        controller.delegate = self
        present(controller, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let name1 = name.text ?? ""
        let type1 = type.text ?? ""
        let location1 = location.text ?? ""
        let longitude1 = Double(londitude.text!) ?? 0
        let latitude1 = Double(latitude.text!) ?? 0
        let phone1 = phone.text ?? ""
       
       
        let imageName = UUID().uuidString
        let imageData = photobutton.backgroundImage(for: .normal)?.jpegData(compressionQuality: 0.8)
        let url = Restaurant.documentsDirectory.appendingPathComponent(imageName).appendingPathExtension("jpg")
        try? imageData?.write(to: url)
        
        restaurant = Restaurant(name: name1, type: type1, location:location1, phone: phone1, image: imageName,
                                longitude:longitude1,latitude:latitude1)
    }
   

    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
