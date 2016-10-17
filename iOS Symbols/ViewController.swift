//
//  ViewController.swift
//  iOSsymbols
//
//  Created by gunjan deepak raheja on 10/12/16.
//  Copyright © 2016 gunjan deepak raheja. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //TableView Required Methods  // Called with TableView Loads
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return hungryEmoji.count
            
        } else if section == 1 {
            return starEmoji.count
        } else if section == 2 {
            return travelEmoji.count
        } else if section == 3 {
            return heartEmoji.count
        } else if section == 4 {
            return gandhiEmoji.count
        } else if section == 5 {
            return nerdyEmoji.count
        } else if section == 6 {
            return sportEmoji.count
        } else if section == 7 {
            return starEmoji.count
            
            
            
        } else{
            return travelEmoji.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // return a UITableViewCell
        // work with the indexPath, to get section & row. [for the array element].
        if indexPath.section == 0{
            let myCell = tableView.dequeueReusableCell(withIdentifier:"myCell")
            myCell?.textLabel?.text = hungryEmoji[indexPath.row]
            myCell?.detailTextLabel?.text =  "Hungry?"
            return myCell!
        }
        else if indexPath.section == 1{
            let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell2")
            myCell?.textLabel?.text = starEmoji[indexPath.row]
            myCell?.detailTextLabel?.text = "Shine"
            return myCell!
            
            
        }
        else if indexPath.section == 2{
            let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell3")
            myCell?.textLabel?.text = travelEmoji[indexPath.row]
            myCell?.detailTextLabel?.text = "travel"
            return myCell!
            
        }
            
        else if indexPath.section == 3{
            let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell4")
            myCell?.textLabel?.text = heartEmoji[indexPath.row]
            myCell?.detailTextLabel?.text = "Love"
            return myCell!
            
        }
            
        else if indexPath.section == 4{
            let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell5")
            myCell?.textLabel?.text = gandhiEmoji[indexPath.row]
            myCell?.detailTextLabel?.text = "gandhi"
            return myCell!
            
        }
            
        else if indexPath.section == 5{
            let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell6")
            myCell?.textLabel?.text = nerdyEmoji[indexPath.row]
            myCell?.detailTextLabel?.text = "nerdy"
            return myCell!
            
        }
            
        else if indexPath.section == 6{
            let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell7")
            myCell?.textLabel?.text = sportEmoji[indexPath.row]
            myCell?.detailTextLabel?.text = "Sports Emoji"
            return myCell!
            
        }
            
            
        else if indexPath.section == 7{
            let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell3")
            myCell?.textLabel?.text = starEmoji[indexPath.row]
            myCell?.detailTextLabel?.text = "stars"
            return myCell!
            
        }
        else{
            let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell4")
            myCell?.textLabel?.text = nerdyEmoji[indexPath.row]
            myCell?.detailTextLabel?.text = "nerdy stuff"
            return myCell!
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        let myCGFloat = CGFloat(30)
        return myCGFloat
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let myCGFloat = CGFloat(70)
        return myCGFloat
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0{
            return "HUNGRY?"
        } else if section  == 1{
            return "STAR LIGHT"
        } else if section  == 2{
            return "Going Somewhere?"
        } else if section  == 3{
            return "Love.. <3"
        }  else if section  == 4{
            return "Gandhi's principles"
           }  else if section  == 5{
         return "Nerdy much?"
           }
      else if section  == 6{
    return "Sports"
    }
        else if section  == 7{
            return "Stars"
        }
            

    
    
    
        else{
            return "Mystery Section"
        }
    }
    
    
    
    let hungryEmoji = ["🍜", "🍟", "🍳", "🍔", "🧀 ", "🍫", "☕️"]   //created array
    
       let starEmoji = ["⭐️", "🌟", "💫", "✨"]
    
    let travelEmoji = [ "🚕",  "🚌",   "🏎",  "🚓", "🚛",  "🚜"]
    
    let heartEmoji = ["❤️", "💛", "💙", "💜"]
   
    let gandhiEmoji = ["🙈","🙉","🙊"]
    
    let foodEmoji = ["🍎","🍏","🍐","🍑","🍒","🍓","🍔","🍕","🍖","🍗","🍘","🍙","🍚","🍛","🍜","🍝","🍞","🍟","🍡","🍢","🍣","🍤","🍥","🍦","🍧","🍨","🍩","🍪","🍫"]
    
    
    let nerdyEmoji = ["👓","👒","👞","👟","👕","👔", "🔬","🔭","🔮"]
    
    let sportEmoji = ["⚽️",  "🏀",  "🏈",  "⚾️", "🎾",  "🏐"]
    
    
  
    
    

    
    
}
