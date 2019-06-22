//
//  RestaurantTableViewController.swift
//  IosFinal
//
//  Created by User10 on 2019/6/13.
//  Copyright © 2019 ibob. All rights reserved.
//

import UIKit
import FirebaseDatabase
import CoreData

class RestaurantTableViewController: UITableViewController {
    
    var restaurants =  [Restaurant]()
    
    //var ref = Database.database().reference(withPath: "Restaurant")
    /*var restaurants:[Restaurant] = [
        Restaurant(name: "義大皇家酒店星亞自助餐", type: "餐廳", location: "840高雄市大樹區學城路1段153號義大皇家酒店LB大廳樓層", phone: "07-6568166#21205", image: "restaurant1.jpg", longitude:23.0,latitude:15.0),
        Restaurant(name: "義大皇家酒店皇樓", type: "港式飲茶餐廳", location: "840高雄市大樹區學城路1段153號義大皇家酒店LB大廳樓層", phone: "07-6568166#21402", image: "restaurant2.jpg", longitude:23.0,latitude:15.0),
    ]*/
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = fa１２lse

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        if let restaurants = Restaurant.readLoversFromFile() {
            self.restaurants = restaurants
        }
    }
    @IBAction func unwindToRestaurantTableView(segue: UIStoryboardSegue) {
        
        if let controller = segue.source as? AddRestaurantTableViewController, let restaurant = controller.restaurant {
            restaurants.insert(restaurant, at: 0)
            
            Restaurant.saveToFile(restaurants: restaurants)
            
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! RestaurantDetailsViewController
                destinationController.restaurant = restaurants[indexPath.row]
            }
        }
    }
    // Swipe-to-delete
    /*override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            restaurants.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }*/
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .default, title: "刪除", handler: { (action, indexPath) -> Void in
            // Delete the row from the data source
            self.restaurants.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        })
        deleteAction.backgroundColor = UIColor.darkGray
        // 上傳
        let uploadAction = UITableViewRowAction(style: .default, title: "上傳") { (action, indexPath) in
            let restaurant = self.restaurants[indexPath.row]
            //self.uploadDataToFirebase(values: restaurant)
        }
        uploadAction.backgroundColor = UIColor.red
        
        return [uploadAction, deleteAction]
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RestaurantTableViewCell
        // Configure the cell...
         let restaurant = restaurants[indexPath.row]
        cell.nameLabel.text = restaurants[indexPath.row].name
        cell.locationLabel.text = restaurants[indexPath.row].location
        cell.phoneLabel.text = restaurants[indexPath.row].phone
        let url = Restaurant.documentsDirectory.appendingPathComponent(restaurant.image).appendingPathExtension("jpg")
        cell.thumnailImageView.image = UIImage(contentsOfFile: url.path)
        
        return cell
    }
    
    @IBAction func unwindToHomeScreen(segue:UIStoryboardSegue) {
    }
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

