
//  ViewController.swift
//  to do list
//
//  Created by MAC on 26/03/1443 AH.


import UIKit

class List {
    var items: [String] = []
}
class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    var OurList = List()
    var selectedCellIndex : Int!
    @IBOutlet weak var todotextFild: UITextField!
    @IBOutlet weak var ourtableview: UITableView!
   
    override func viewWillAppear(_ animated: Bool) {
        ourtableview.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any additional setup after loading the view.
        ourtableview.register(UINib(nibName: "listTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        todotextFild.text = UserDefaults.standard.string(forKey: "Item")
        
    }
    
    
    @IBAction func add(_ sender: Any){
        OurList.items.append(todotextFild.text!)
        ourtableview.reloadData()
//        UserDefaults.standard.set(OurList, forKey: "Item")
        
        // Save array to userdefaults
//        UserDefaults.standard.set(OurList, forKey: "Item")
        
    }
    
    @IBAction func deleteAll(_ sender: Any) {
        OurList.items.removeAll()
        ourtableview.reloadData()
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OurList.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! listTableViewCell
        
        cell.todolebal?.text = OurList.items[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
          // Delete the row from the data source
            OurList.items.remove(at: indexPath.row)
          tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
          // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        
//   
            //           tableView.deleteRows(at: [indxpath], with : .fade )
            //       }else if editingStaly == .insert {
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("User select cell: \(indexPath.row)")
        selectedCellIndex = indexPath.row
        performSegue(withIdentifier: "editSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let updateVC = segue.destination as! updatViewController
        updateVC.list = OurList
        updateVC.selectedIndex = selectedCellIndex
    }
    
    
}

    
