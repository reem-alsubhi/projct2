//
//  ViewController.swift
//  to do list
//
//  Created by MAC on 26/03/1443 AH.
//

import UIKit



class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    var OurList:[String] = []
    
    @IBOutlet weak var todotextFild: UITextField!
    @IBOutlet weak var ourtableview: UITableView!
   
    @IBOutlet weak var day: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any additional setup after loading the view.
        todotextFild.text = UserDefaults.standard.string(forKey: "Item")
    }
    
    
    @IBAction func add(_ sender: Any){
        OurList.append(todotextFild.text!)
        ourtableview.reloadData()
        UserDefaults.standard.set(todotextFild.text, forKey: "Item")
        
    }
    
    @IBAction func deleteAll(_ sender: Any) {
        OurList.removeAll()
        ourtableview.reloadData()
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OurList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")as!listTableViewCell
        
        cell.todolebal?.text = OurList[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
          // Delete the row from the data source
        OurList.remove(at: indexPath.row)
          tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
          // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
//   
            //           tableView.deleteRows(at: [indxpath], with : .fade )
            //       }else if editingStaly == .insert {
        }
    }
    


