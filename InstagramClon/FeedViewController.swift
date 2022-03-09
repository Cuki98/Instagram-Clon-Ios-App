//
//  FeedViewController.swift
//  InstagramClon
//
//  Created by Rogelio Lopez on 3/8/22.
//

import UIKit
import Parse

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var feedTableView: UITableView!
    var posts = [PFObject]()

    override func viewDidLoad() {
        super.viewDidLoad()

        feedTableView.delegate = self
        feedTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "Posts")
        query.includeKey("User")
        query.limit = 20
        
        query.findObjectsInBackground { posts, error in
            if posts != nil{
                self.posts = posts!
                self.feedTableView.reloadData()
            }
                
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = feedTableView.dequeueReusableCell(withIdentifier: "FeedCell") as! FeedCell
        let post = posts[indexPath.row]
        
        
        let user = post["User"] as! PFUser
        cell.cellUsername.text =  user.username! + ":"
        
        cell.cellCaption.text = (post["Caption"] as! String)
        
        let imageFile = post["Image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        
        cell.cellPhotoView.af.setImage(withURL: url)
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
