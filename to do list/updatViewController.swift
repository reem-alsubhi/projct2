//
//  updatViewController.swift
//  to do list
//
//  Created by MAC on 27/03/1443 AH.
//

import UIKit

class updatViewController: UIViewController {
    var list : List!
    var selectedIndex : Int!
    
    @IBOutlet weak var updateTixtField: UITextField!
    
    
    
    @IBAction func update(_ sender: Any) {
        
        list.items[selectedIndex] = updateTixtField.text!
        navigationController?.popViewController(animated: true)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTixtField.text = list.items[selectedIndex]

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

//    In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         Get the new view controller using segue.destination.
//         Pass the selected object to the new view controller.
//    }
//

}
