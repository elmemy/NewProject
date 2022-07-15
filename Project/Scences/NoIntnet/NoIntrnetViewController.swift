//
//  NoIntrnetViewController.swift
//  Project
//
//  Created by Ahmed Elmemy on 11/07/2022.
//

import UIKit

class NoIntrnetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func dismissAction(_ sender: Any) {
        let vc = Storyboard.Main.instantiate(MovieViewController.self)
        let nav = UINavigationController(rootViewController: vc)
        nav.navigationBar.isHidden = true
        let configurator = MovieConfiguratorImplementation()
        configurator.configure(MovieViewController: vc)
        self.view.window?.rootViewController = nav
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
