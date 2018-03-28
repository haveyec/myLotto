//
//  ViewController.swift
//  myLotto
//
//  Created by Havic on 3/28/18.
//  Copyright © 2018 Havic. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var myTableView: UITableView!
    
    var cellIdentifier = "cell"
    var numArr = [Int]()
    var lottoNumMax = 71
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let winningNums = numArr[indexPath.row]
        cell.textLabel?.text = String(winningNums)
        
        if indexPath.row == 6{
            cell.detailTextLabel?.text = "Bonus"
        }else{
            cell.detailTextLabel?.text = ""
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numArr.count
    }
    
    @IBAction func chooseNumbersBTN(_ sender: UIButton) {
        numArr = []
        runNumGen()
        myTableView.reloadData()
        
    }
    
    func numGen(){
       var n = Int(arc4random_uniform(71))
        
        guard n != 0 else{ n = Int(arc4random_uniform(71)); return }
        
        numArr.append(n)
        numArr = Array(Set(numArr))
        
    }
    
    func runNumGen(){
        
        repeat {
            numGen()
        }while numArr.count < 7
        
    }
    
}

