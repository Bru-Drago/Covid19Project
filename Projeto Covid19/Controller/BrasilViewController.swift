//
//  BrasilViewController.swift
//  Projeto Covid19
//
//  Created by Bruna Fernanda Drago on 20/07/20.
//  Copyright © 2020 Bruna Fernanda Drago. All rights reserved.
//

import UIKit

class BrasilViewController: UIViewController {

    //Outlets
    @IBOutlet weak var brasilTableView: UITableView!
    
    //Properties
    var states = [States]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        brasilTableView.delegate = self
        brasilTableView.dataSource = self

        NetworkService.instance.getBrasilCovidData { (states) in
            self.states = states
            DispatchQueue.main.async {
                self.brasilTableView.reloadData()
            }
        }
    }

}
extension BrasilViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(states.count)
        return states.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = brasilTableView.dequeueReusableCell(withIdentifier: "brasilCell", for: indexPath)as! BrasilTableViewCell
        cell.estateNameLbl.text = states[indexPath.row].state
        
        let caseConfirmed = states[indexPath.row].cases
        cell.casesConfirmedLbl.text = caseConfirmed?.numberFormat
        
        let deathConfirmed = states[indexPath.row].deaths
        cell.deathConfirmedLbl.text = deathConfirmed?.numberFormat
        return cell
    }
    
    
}
extension BrasilViewController:UITableViewDelegate{
    
}
