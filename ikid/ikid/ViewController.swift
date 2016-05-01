//
//  ViewController.swift
//  ikid
//
//  Created by Evan on 4/30/16.
//  Copyright © 2016 Evan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var jokeViewController : JokeViewController!
    private var punchlineViewController : JokeViewController!
    private var data : Data!
    private var type : String!
    private var joke : [String] = ["test", "Test"]
    
    @IBOutlet weak var topToolbar: UIToolbar!
    
    @IBOutlet weak var chooseLabel: UILabel!
    
    @IBOutlet weak var toolbarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.data == nil {
            data = Data()
        }
        toolbarButton.enabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    @IBAction func createJoke(sender: UIBarButtonItem) {
        //do an if else to figure out what dict to choose
        self.type = sender.title!.lowercaseString
        self.joke = data.getArray(self.type)
        jokeViewController = nil
        switchViews()
        for item in self.topToolbar.items! {
            item.enabled = false
        }
    }
    
    
    @IBAction func switchViews() {
        jokeBuilder()
        punchlineBuilder()
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.EaseInOut)
        
        //to punchline
        if jokeViewController != nil &&
            jokeViewController?.view.superview != nil {
            UIView.setAnimationTransition(.FlipFromRight, forView: view, cache: true)
            punchlineViewController.view.frame = view.frame
            punchlineViewController.textLabel.text = joke[1]
            switchViewController(jokeViewController, to: punchlineViewController)
            self.chooseLabel.text = ""
            toolbarButton.title = "Done"
            
            
        //to blank
        } else if self.toolbarButton.title == "Done" {
            punchlineViewController.willMoveToParentViewController(nil)
            punchlineViewController.view.removeFromSuperview()
            punchlineViewController.removeFromParentViewController()
            self.chooseLabel.text = "Choose a type of joke!"
            self.toolbarButton.title = nil
            for item in self.topToolbar.items! {
                item.enabled = true
            }
            
        //to joke setup
        } else {
            UIView.setAnimationTransition(.FlipFromLeft, forView: view, cache: true)
            jokeViewController.view.frame = view.frame
            jokeViewController.textLabel.text = joke[0]
            switchViewController(punchlineViewController, to: jokeViewController)
            self.chooseLabel.text = ""
            toolbarButton.enabled = true
            toolbarButton.title = "Punchline"
        }
        
        UIView.commitAnimations()
    }

    private func jokeBuilder() {
        if jokeViewController == nil {
            jokeViewController = storyboard?.instantiateViewControllerWithIdentifier("Joke") as! JokeViewController
        }
    }
    
    private func punchlineBuilder() {
        if punchlineViewController == nil {
            punchlineViewController = storyboard?.instantiateViewControllerWithIdentifier("Punchline") as! JokeViewController
        }
    }
    private func switchViewController(from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMoveToParentViewController(nil)
            from!.view.removeFromSuperview()
            from!.removeFromParentViewController()
        }
        
        if to != nil {
            self.addChildViewController(to!)
            self.view.insertSubview(to!.view, atIndex: 0)
            to!.didMoveToParentViewController(self)
        }
    }
}

