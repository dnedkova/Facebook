
//
//  ImageTransition.swift
//  Facebook
//
//  Created by Diana Nedkova on 3/6/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {
    
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
//        containerView.addSubview(toViewController.view)
//        toViewController.view.alpha = 0
//        UIView.animateWithDuration(0.4, animations: { () -> Void in
//            toViewController.view.alpha = 1
//            }) { (finished: Bool) -> Void in
//                self.transitionContext.completeTransition(true)        }
        
        
        let tabBarViewController = fromViewController as! UITabBarController
        
        let navigationController = tabBarViewController.selectedViewController as! UINavigationController
        let newsFeedViewController = navigationController.topViewController as! NewsFeedViewController
    
        let photoViewController = toViewController as! PhotoViewController
        
        let movingImageView = UIImageView()
        
        
//        movingImageView.frame = newsFeedViewController.selectedImageView.frame
        movingImageView.image = newsFeedViewController.selectedImageView.image
        movingImageView.clipsToBounds = newsFeedViewController.selectedImageView.clipsToBounds

        movingImageView.contentMode = newsFeedViewController.selectedImageView.contentMode
        
        
        photoViewController.imageView.addSubview(movingImageView)
        
//        newsFeedViewController.selectedImageView.alpha = 0
//        
//        photoViewController.imageView.alpha = 0
        toViewController.view.alpha = 0
        
        UIView.animateWithDuration(duration, animations: { () -> Void in
            toViewController.view.alpha = 1
            
            movingImageView.frame = photoViewController.imageView.frame
            movingImageView.frame.origin.y = 0
            
            }) { (Bool) -> Void in
                newsFeedViewController.selectedImageView.alpha = 1
                photoViewController.imageView.alpha = 1
                self.finish()
        }
        
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let tabBarViewController = toViewController as! UITabBarController
        
        let navigationController = tabBarViewController.selectedViewController as! UINavigationController
        let newsFeedViewController = navigationController.topViewController as! NewsFeedViewController
        
        let photoViewController = fromViewController as! PhotoViewController
        
        let movingImageView = UIImageView()
        
//        movingImageView.frame = photoViewController.imageView.frame
        movingImageView.image = photoViewController.imageView.image
        movingImageView.clipsToBounds = photoViewController.imageView.clipsToBounds
        
        movingImageView.contentMode = photoViewController.imageView.contentMode
        
        
        newsFeedViewController.selectedImageView.addSubview(movingImageView)
        fromViewController.view.alpha = 1
        
        UIView.animateWithDuration(0.9, animations: { () -> Void in
            fromViewController.view.alpha = 0
            photoViewController.imageView.alpha = 0
            movingImageView.frame = newsFeedViewController.selectedImageView.frame
            
            
            }) { (finished: Bool) -> Void in
                
//                newsFeedViewController.selectedImageView.alpha = 0
                
                self.transitionContext.completeTransition(true)
                fromViewController.view.removeFromSuperview()
                
        }
        
        

        

    }


}
