//
//  PhotoAnnotation.swift
//  Photo Map
//
//  Created by Gunjan Deepak Raheja on 12/23/16.
//  Copyright © 2016 Gunjan D Raheja. All rights reserved.
//

import UIKit

@objc protocol LocationsViewControllerDelegate {
  @objc func locationsPickedLocation(_ controller: LocationsViewController, latitude: NSNumber, longitude: NSNumber)
}

class LocationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

  // TODO: Fill in actual CLIENT_ID and CLIENT_SECRET
  let CLIENT_ID = "ZHM2MPG0Q0KX1XULV2NGXCKDP1CIW22DSD4CAOHMXOUKX3LA"
  let CLIENT_SECRET = "1D0DJFUVK5LJAOFTT2XFNWAIWOUHYSJPECMMEXMY13OURRXF"

  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var searchBar: UISearchBar!

  var results: NSArray = []

  weak var delegate: LocationsViewControllerDelegate?

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.dataSource = self
    tableView.delegate = self
    searchBar.delegate = self
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return results.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell") as! LocationCell

    cell.location = results[(indexPath as NSIndexPath).row] as! NSDictionary

    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // This is the selected venue
    let venue = results[(indexPath as NSIndexPath).row] as! NSDictionary

    let lat = venue.value(forKeyPath: "location.lat") as! NSNumber
    let lng = venue.value(forKeyPath: "location.lng") as! NSNumber

    let latString = "\(lat)"
    let lngString = "\(lng)"

    print(latString + " " + lngString)

    delegate?.locationsPickedLocation(self, latitude: lat, longitude: lng)
    navigationController?.popViewController(animated: true)
  }

  func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    let newText = NSString(string: searchBar.text!).replacingCharacters(in: range, with: text)
    fetchLocations(newText)

    return true
  }

  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    fetchLocations(searchBar.text!)
  }

  func fetchLocations(_ query: String, near: String = "New York City") {
 
    let baseUrlString = "https://api.foursquare.com/v2/venues/search?"
   
    let queryString = "client_id=\(CLIENT_ID)&client_secret=\(CLIENT_SECRET)&v=20141020&near=\(near),CA&query=\(query)"
    

    let url = URL(string: baseUrlString + queryString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)!
    let request = URLRequest(url: url)

    let session = URLSession(
      configuration: URLSessionConfiguration.default,
      delegate:nil,
      delegateQueue:OperationQueue.main
    )

    let task : URLSessionDataTask = session.dataTask(with: request, completionHandler: { (dataOrNil, response, error) in
      if let data = dataOrNil {
        if let responseDictionary = try! JSONSerialization.jsonObject(
          with: data, options:[]) as? NSDictionary {
          NSLog("response: \(responseDictionary)")
          self.results = responseDictionary.value(forKeyPath: "response.venues") as! NSArray
          self.tableView.reloadData()

        }
      }
    })
    task.resume()
  }

}
