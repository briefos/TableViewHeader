//
//  ViewController.swift
//  TableViewPractice
//
//  Created by BriefOS on 2/3/2560 BE.
//  Copyright © 2560 BriefOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let houseData = [
        ["Arryn", "Baratheon"],
        ["Greyjoy", "Lannister", "Martell", "Stark"],
        ["Targaryen", "Tully", "Tyrell"]
    ]

        
    let wordsData = [
        ["As high as honor", "Ours is the fury"],
        ["We do not sow", "Hear me roar", "Unbowed, unbent, unbroken", "Winter is coming"],
        ["fire and blood", "Family, duty, honor", "Growing strong"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "UITableView"
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let nibName = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "tableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows: Int!
        switch section {
        case 0:
            rows = 2
            break
        case 1:
            rows = 4
            break
        case 2:
            rows = 3
            break
        default:
            break
        }
        
        return rows
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var headerLabel: String!
        switch section {
        case 0:
            headerLabel = "Header 1"
            break
        case 1:
            headerLabel = "Header 2"
            break
        case 2:
            headerLabel = "Header 3"
            break
        default:
            break
        }
        
        return headerLabel
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        cell.commonInit("got_\(indexPath.section)_\(indexPath.item)", title: houseData[indexPath.section][indexPath.item], sub: wordsData[indexPath.section][indexPath.item])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailVC()
        vc.commonInit("got_bg_\(indexPath.section)_\(indexPath.item)", title: houseData[indexPath.section][indexPath.item])
        self.navigationController?.pushViewController(vc, animated: true)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

