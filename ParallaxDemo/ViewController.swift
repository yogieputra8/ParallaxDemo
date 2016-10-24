//
//  ViewController.swift
//  ParallaxDemo
//
//  Created by Yogie Putra on 10/23/16.
//  Copyright © 2016 Yogie Putra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var titles = ["Image 1", "Image 2", "Image 3", "Image 4", "Image 5", "Image 6", "Image 7", "Image 8"]
    var images: [UIImage] = [
        UIImage(named: "image-1")!,
        UIImage(named: "image-2")!,
        UIImage(named: "image-3")!,
        UIImage(named: "image-4")!,
        UIImage(named: "image-5")!,
        UIImage(named: "image-6")!,
        UIImage(named: "image-7")!,
        UIImage(named: "image-8")!
    ]
    
    var parallaxOffsetSpeed:CGFloat = 50
    var cellHeight:CGFloat = 250
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var parallaxImageHeight: CGFloat {
        let maxOffset = (sqrt(pow(cellHeight, 2) + 4 * parallaxOffsetSpeed * self.tableView.frame.height) - cellHeight) / 2
        
        return maxOffset + self.cellHeight
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell") as? ImageCell {
            cell.configureCell(title: titles[indexPath.row], image: images[indexPath.row])
            cell.parallaxImageHeight.constant = self.parallaxImageHeight
            cell.parallaxTopConstraint.constant = parallaxOffset(newOffsetY: tableView.contentOffset.y, cell: cell)
            
            return cell
        } else {
            return ImageCell()
        }
    }
    
    func parallaxOffset(newOffsetY: CGFloat, cell: UITableViewCell) -> CGFloat {
        return (newOffsetY - cell.frame.origin.y) / parallaxImageHeight * parallaxOffsetSpeed
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = tableView.contentOffset.y
        for cell in tableView.visibleCells as! [ImageCell] {
            cell.parallaxTopConstraint.constant = parallaxOffset(newOffsetY: tableView.contentOffset.y, cell: cell)
        }
    }


}

