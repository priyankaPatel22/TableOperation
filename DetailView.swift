import UIKit

protocol DetailViewDelegate:class
{
    func backDelegate(_ controler :DetailView) -> Void
}

class DetailView: UIViewController {

    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtCity: UITextField!
    
    var whichTask:Bool!
    var arrData:NSArray!
    
    var fierDelegate:DetailViewDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(DetailView.tap(_:)))
        view.addGestureRecognizer(tapGesture)
        
        if whichTask==true
        {
            txtName.text=arrData.object(at: 0) as? String
            txtCity.text=arrData.object(at: 1) as? String
        }
    }

    func tap(_ gesture: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //MARK : Button Tap Action
    
    @IBAction func btnSaveTap(_ sender: UIButton) {
        if(!(txtName.text?.isEmpty)! && !(txtCity.text?.isEmpty)!)
        {
            _ = self.navigationController?.popViewController(animated: true)
            fierDelegate.backDelegate(self)
            
        }
    }
}
