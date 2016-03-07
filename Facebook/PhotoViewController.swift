//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Diana Nedkova on 3/5/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage!
    var initialCenter: CGPoint!
    
    @IBOutlet weak var doneButtonImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = image
//        scrollView.contentSize = CGSizeMake(320, imageView.image!.size.height * 1.5)
        scrollView.contentSize = CGSizeMake(320, 800)
        
        scrollView.delegate = self
        initialCenter = imageView.center
        scrollView.backgroundColor = UIColor(white: 0, alpha: 1)
        doneButtonImage.alpha = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapDone(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        // This method is called as the user scrolls
       
        UIScrollView.animateWithDuration(0.4) { () -> Void in
            self.doneButtonImage.alpha = 0
            self.scrollView.backgroundColor = UIColor(white: 0.2, alpha: 0.8)

        }
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView!) {
        
        
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
            // This method is called right as the user lifts their finger
            
            let offset = CGFloat(scrollView.contentOffset.y)
            
            if offset < -120 {
                dismissViewControllerAnimated(true, completion: nil)
            }
            
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // This method is called when the scrollview finally stops scrolling.
        
        
        UIScrollView.animateWithDuration(0.1) { () -> Void in
            self.doneButtonImage.alpha = 1
            self.scrollView.backgroundColor = UIColor(white: 0, alpha: 1)
                

        }
       
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
