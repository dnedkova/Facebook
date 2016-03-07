//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    
    var selectedImageView: UIImageView!
    
    var isPresenting: Bool = true
    var imageTransition: ImageTransition!
    var fadeTransition: FadeTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the content size of the scroll view
        scrollView.contentSize = CGSizeMake(320, feedImageView.image!.size.height)
        
        imageTransition = ImageTransition()
        fadeTransition = FadeTransition()
        
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let destinationVC = segue.destinationViewController as! PhotoViewController
        
//        var window = UIApplication.sharedApplication().keyWindow
//        var frame = window.convertRect(selectedImageView.frame, fromView: scrollView)
//        window.addSubview(selectedImageView.frame)
//        
        
        destinationVC.image = self.selectedImageView.image
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self.fadeTransition    }


    @IBAction func onTapGesture(sender: UITapGestureRecognizer) {
        
        
        selectedImageView = sender.view as! UIImageView
        performSegueWithIdentifier("toPhotoSegue", sender: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }
}
