import UIKit

// MARK: - Address(Model)
public struct Address {
    public var street: String
    public var city: String
    public var state: String
    public var zipCode: String
}


// MARK: - AddressView(View)
public final class AddressView: UIView {
    @IBOutlet public var streetTextField: UITextField!
    @IBOutlet public var cityTextField: UITextField!
    @IBOutlet public var stateTextField: UITextField!
    @IBOutlet public var zipCodeTextField: UITextField!
}

// MARK: - AddressViewController(Controller)
public final class AddressViewController: UIViewController {
    
    // MARK: Properties
    public var address: Address? {
        // when the Model being updates, Controller should also update the VIew.
        didSet {
            updateViewFromAddress()
        }
    }
    
    public var addressView: AddressView! {
        guard isViewLoaded else { return nil }
        return (view as! AddressView)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // Controller should update the View using the values from the Model.
        updateViewFromAddress()
    }
    
    // MARK: - Actions
    
    // allow the user to update the address from the View,
    // and then the Controller will update the Model.
    @IBAction public func updateAddressFromView(_ sender: AnyObject) {
        guard let street = addressView.streetTextField.text, street.count > 0,
              let city = addressView.cityTextField.text, city.count > 0,
              let state = addressView.stateTextField.text, state.count > 0,
              let zipCode = addressView.zipCodeTextField.text, zipCode.count > 0 else {
                  // TO-DO: display a message to handle the missing values.
                  return
              }
           address = Address(street: street, city: city, state: state, zipCode: zipCode)
    }
    
    /**
     updates the View reflecing the updated data from the Model.
     */
    private func updateViewFromAddress() {
        guard let addressView = addressView, let address = address else { return }
        addressView.streetTextField.text = address.street
        addressView.cityTextField.text = address.city
        addressView.stateTextField.text = address.state
        addressView.zipCodeTextField.text = address.zipCode
    }
}
