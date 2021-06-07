import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    // MARK: - Properties
    private var windowInterfaceOrientation: UIInterfaceOrientation? {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.windows.first?.windowScene?.interfaceOrientation
        } else {
            return UIApplication.shared.statusBarOrientation
        }
    }

    var swipeGestureRecognizer = UISwipeGestureRecognizer()

    var selectedImageViewButton = 0

    @IBOutlet weak var swipeLabelConstraint: NSLayoutConstraint!

    @IBOutlet weak var swipeArrowImageView: UIImageView!

    @IBOutlet weak var swipeLabel: UILabel!

    @IBOutlet weak var centralView: UIView!

    @IBOutlet weak var topStackView: UIStackView!

    @IBOutlet weak var bottomStackView: UIStackView!

    @IBOutlet var presentationButtons: [UIButton]!

    @IBOutlet var imageViewButtons: [UIButton]!

    // MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presentationButtons[1].isSelected = true
        imageViewButtons[3].isHidden = true

        imageViewButtons.forEach { button in
            button.imageView?.contentMode = .scaleAspectFill
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        print("View will appear")
        swipeGestureUpdate()
    }
    // MARK: Keep track of the device orientation
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)

        coordinator.animate(alongsideTransition: { _ in
            guard let windowInterfaceOrientation = self.windowInterfaceOrientation else { return }
            if windowInterfaceOrientation.isPortrait {
                self.swipeGestureRecognizer.direction.subtract([.left])
            } else {
                self.swipeGestureRecognizer.direction.subtract([.up])
            }
            self.swipeGestureUpdate()
        }, completion: nil)
    }

    // MARK: Set centralView layout methods

    @IBAction func presentationButtonsTapped(_ sender: UIButton) {

        if sender.isSelected {
            return
        }
        presentationButtons.forEach { button in
            button.isSelected = false
        }
        sender.isSelected = true
        setCentralView(sender: sender)
    }

    private func setCentralView(sender: UIButton) {
        switch sender.tag {
        case 1:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: [], animations: {
                self.imageViewButtons.forEach { button in
                    if button.tag == 1 {
                        button.isHidden = true
                    } else {
                        button.isHidden = false
                    }
                }
            }, completion: nil)

        case 2:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: [], animations: {
                self.imageViewButtons.forEach { button in
                    if button.tag == 2 {
                        button.isHidden = true
                    } else {
                        button.isHidden = false
                    }
                }
            }, completion: nil)

        case 3:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: [], animations: {
                self.imageViewButtons.forEach { button in
                    button.isHidden = false
                }
            }, completion: nil)
        default:
            return
        }
    }

    // MARK: Set Images of the centralView
    // change the layout of the centralView
    @IBAction func imageViewButtonTapped(_ sender: UIButton) {
        selectedImageViewButton = sender.tag
        setPicker()
    }

    // create ImagePickerController
    private func setPicker() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        self.setImage(selectedButton: self.selectedImageViewButton, image: image)
        dismiss(animated: true, completion: nil)
    }

    // set the image of the button selected
    private func setImage(selectedButton: Int, image: UIImage) {
        self.imageViewButtons[selectedButton].setImage(image, for: .normal)
    }

    // MARK: Swipe gesture methods
    private func swipeGestureUpdate() {
        swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))

        // update the direction and views based on the orientation
        if let orientation = windowInterfaceOrientation {
            if orientation.isPortrait {
                // remove the swipe direction already added
                swipeGestureRecognizer.direction = .up
                // set the image and the label
                swipeArrowImageView.image = UIImage(named: "Arrow Up-1")
                swipeLabel.text = "Swipe up to share"
            } else if orientation.isLandscape {
                swipeGestureRecognizer.direction = .left
                swipeArrowImageView.image = UIImage(named: "Arrow Left-1")
                swipeLabel.text = "Swipe left to share"
            }
        }
        // add swipeGesture to central view
        centralView.addGestureRecognizer(swipeGestureRecognizer)
    }

    // func call when the user swipe the view
    @objc func didSwipe(_ sender: UISwipeGestureRecognizer) {
        // get the actual frame of the view
        let screenWidth = view.bounds.width
        let screenHeight = view.bounds.height

        UIView.animate(withDuration: 0.3) {
            if self.swipeGestureRecognizer.direction == .left {
                self.centralView.transform = CGAffineTransform.init(translationX: -screenWidth, y: 0)
            } else if self.swipeGestureRecognizer.direction == .up {
                self.centralView.transform = CGAffineTransform.init(translationX: 0, y: -screenHeight)
            }
        } completion: { _ in
            self.shareImage()
        }
    }
    // MARK: Share image methods

    // get a snapshot of the centralView
    private func getImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: centralView.bounds.size)
        let image = renderer.image { _ in
            centralView.drawHierarchy(in: centralView.bounds, afterScreenUpdates: true)
        }
        return image
    }
    // share the snapshot of the centralView
    private func shareImage() {
        let image = getImage()
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: [])
        self.present(activityController, animated: true, completion: nil)
        activityController.completionWithItemsHandler = { _, _, _, _ in
            self.centralView.alpha = 0
            UIView.animate(withDuration: 0.2, animations: {
                self.centralView.transform = .identity
                self.centralView.alpha = 1
            }, completion: nil)
        }
    }

}
