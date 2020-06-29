//
//  InfoDataViewController.swift
//  KoreaTourApp
//
//  Created by 정문기 on 2020/04/13.
//  Copyright © 2020 jmk. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher
import ImageSlideshow
import MapKit



extension String {
    // html 태그 제거 + html entity들 디코딩.
    var htmlEscaped: String {
        guard let encodedData = self.data(using: .utf8) else {
            return self
        }
        
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        do {
            let attributed = try NSAttributedString(data: encodedData,
                                                    options: options,
                                                    documentAttributes: nil)
            return attributed.string
        } catch {
            return self
        }
    }
}


class InfoDataViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var id : Int?

    @IBOutlet var photoUIView: ImageSlideshow!
    @IBOutlet var infoDataTableView: UITableView!
    let detailCall = DetailCallRequest ()

    override func viewDidLoad() {
        super.viewDidLoad()

        detailCall.detailCallReuqest(id: id!, tv: infoDataTableView, uv: photoUIView)
        
        self.infoDataTableView.estimatedRowHeight = 44.0
        self.infoDataTableView.rowHeight = UITableView.automaticDimension
        infoDataTableView.delegate = self
        infoDataTableView.dataSource = self

     
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(InfoDataViewController.didTap))
        
        photoUIView.addGestureRecognizer(gestureRecognizer)
        
        photoUIView.contentScaleMode = .scaleAspectFill
        photoUIView.slideshowInterval = 3
        
    }
    
    @objc func didTap() {
        photoUIView.presentFullScreenController(from: self)
    }



    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoDataTableViewCell", for: indexPath) as! InfoDataTableViewCell
        

        cell.titleLabel.text = detailCall.titleLableContents?.htmlEscaped
        cell.overviewLabel.text = detailCall.overviewLableContents?.htmlEscaped
        cell.homepageLabel.text = detailCall.homepageLableContents?.htmlEscaped
        cell.telLabel.text = detailCall.directionLableContents?.htmlEscaped
        cell.addressLabel.text = detailCall.addressLableContents?.htmlEscaped


        let annotation = MKPointAnnotation ()

        annotation.coordinate = CLLocationCoordinate2D (latitude: detailCall.mapY ?? 10.00, longitude: detailCall.mapX ?? 20.00)
        


        cell.mapView.addAnnotation(annotation)

        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 10, longitudinalMeters: 10)
        cell.mapView.setRegion(region, animated: true)
        
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }


    
}
    

