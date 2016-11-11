import UIKit

class PickSomeViewController: UIViewController,UICollectionViewDataSource,
    UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITabBarDelegate,
    UITabBarControllerDelegate
{
    //Create object of view controller model class.
    let modelObject = PhotoModel()
    
    //Select All
    //var isSelectAll = false
    
    //Object of Hex color class
    let objColorHex = ColorWithHex()
    //ghjghjghjghj
    //Cell identifier in the storyboard
    let reuseIdentifier = "pickSomecell"
    
    //Array ( get all Images)
    var arrAllOriginalImages = NSMutableArray()
    
    //Array  (get all  ID)
    var arrAllOriginalID = NSMutableArray()
    
    //Tag for pick some and pick all.
    var tag : Int = 0
    
    //layout of collection view for set cell size in grid view.
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    //Outlet of Collection view
    @IBOutlet var collectionView: UICollectionView!
    
    //View Did Load Method
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Set layout for Collection view.
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        layout.scrollDirection = .Vertical
        collectionView.collectionViewLayout = layout
        collectionView.allowsMultipleSelection = true
        
        //Pick Some
        if  1 == tag
        {
            //Collection view Margin set
            self.collectionView.contentInset = UIEdgeInsets.init(
                top: 25, left: 0, bottom: 0, right: 0)
            
            //Navigation title.
            self.navigationItem.title = "Select photos"
            
            //Create right button on Navigation bar.
            let RightButton : UIBarButtonItem = UIBarButtonItem(
                title: "Select All", style: UIBarButtonItemStyle.Plain,
                target: self, action: #selector(
                    PickSomeViewController.SelectAllMethod))
            //Navigation Item
            self.navigationItem.rightBarButtonItem = RightButton
            
            //Colour of rightBarButtonItem.
            self.navigationItem.rightBarButtonItem?.tintColor =
                objColorHex.colorWithHexString("#3764E6")
        }
        
        // Pick All
        if 2 == tag
        {
            //Navigation title
            self.navigationItem.title =  " \(self.arrAllOriginalImages.count)"
                + " Selected"
            
            //Create right button on Navigation bar.
            let RightButton : UIBarButtonItem = UIBarButtonItem(
                title: "Next",style: UIBarButtonItemStyle.Plain,
                target: self, action: #selector(
                    PickSomeViewController.btnNext))
            
            //Navigation Item
            self.navigationItem.rightBarButtonItem = RightButton
            
            //Colour of rightBarButtonItem.
            self.navigationItem.rightBarButtonItem?.tintColor =
                objColorHex.colorWithHexString("#3764E6")
            
            //Copy all original image array to in arrSaveSelectedImages array
            self.modelObject.arrSaveSelectedImages =
                self.arrAllOriginalImages.mutableCopy() as! NSMutableArray
            
            //Copy all original ID array to in arrSaveSelectedImages array
            self.modelObject.arrSaveIDOfSelectedImages =
                self.arrAllOriginalID.mutableCopy() as! NSMutableArray
        }
    }
    
    //Unselect all images
    func btnNext()
    {
        /*
         //Storyboard identifies ResetPasswordView
         let goToAlbumViewController =
         self.storyboard?.instantiateViewControllerWithIdentifier(
         "AlbumViewController") as! AlbumViewController
         
         //Pass Selected images
         goToAlbumViewController.arrGetSelectedImages  =
         self.modelObject.arrSaveSelectedImages
         
         //Pass Selected ID
         goToAlbumViewController.arrGetIDOfSelectedImages =
         self.modelObject.arrSaveIDOfSelectedImages
         
         //Redirect to resetPassword view.
         self.navigationController?.pushViewController(
         goToAlbumViewController, animated: true)*/
        
        //TODO
        //Storyboard identifies ResetPasswordView
        let goToAlbumViewController =
            self.storyboard?.instantiateViewControllerWithIdentifier(
                "sampleAlbum") as! sampleAlbum
        
        //Redirect to resetPassword view.
        self.navigationController?.pushViewController(
            goToAlbumViewController, animated: true)
    }
    
    
    //reset the image count
    func refreshImageCount()
    {
        self.arrAllOriginalImages.removeAllObjects()
    }
    
    
    
    func UNSelectAllMethod()
    {
        //
        self.tag = 1
        
        //refreshImageCount()
        
        self.collectionView.reloadData()
        
        //Create right button on Navigation bar.
        let RightButton : UIBarButtonItem = UIBarButtonItem(
            title: "Select All", style: UIBarButtonItemStyle.Plain,
            target: self, action: #selector(
                PickSomeViewController.SelectAllMethod))
        //Navigation title
        self.navigationItem.title =  "Select Photos"
        //Navigation Item
        self.navigationItem.rightBarButtonItem = RightButton
        
        //Colour of rightBarButtonItem.
        self.navigationItem.rightBarButtonItem?.tintColor =
            objColorHex.colorWithHexString("#3764E6")
    }
    
    //Select all images method.
    func SelectAllMethod()
    {
        /*//TODO */
        self.tag = 2
        
        //Copy all original image array to in arrSaveSelectedImages array
        self.modelObject.arrSaveSelectedImages =
            self.arrAllOriginalImages.mutableCopy() as! NSMutableArray
        
        //Copy all original ID array to in arrSaveSelectedImages array
        self.modelObject.arrSaveIDOfSelectedImages =
            self.arrAllOriginalID.mutableCopy() as! NSMutableArray
        //Navigation title
        
        self.navigationItem.title =  " \(self.arrAllOriginalImages.count)"
            + " Selected"
        
        self.collectionView.reloadData()
        
        //Create right button on Navigation bar.
        let RightButton : UIBarButtonItem = UIBarButtonItem(
            title: "Unselect All", style: UIBarButtonItemStyle.Plain,
            target: self, action: #selector(
                PickSomeViewController.UNSelectAllMethod))
        //Navigation Item
        self.navigationItem.rightBarButtonItem = RightButton
        
        //Colour of rightBarButtonItem.
        self.navigationItem.rightBarButtonItem?.tintColor =
            objColorHex.colorWithHexString("#3764E6")
    }
    
    //Number of sections.
    func numberOfSectionsInCollectionView(
        collectionView: UICollectionView) -> Int
    {
        //Return Number of sections
        return 1
    }
    
    //Number of items in sections.
    func collectionView(collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int
    {
        //Count
        var count : Int = 0
        
        //If images are not equal to 0
        if 0 != self.arrAllOriginalImages.count
        {
            count = self.arrAllOriginalImages.count
        }
        
        //Return number of gallery images count.
        return count
    }
    
    //Delegate Method cellForItemAtIndexPath
    func collectionView(collectionView: UICollectionView,
                        cellForItemAtIndexPath indexPath: NSIndexPath) ->
        UICollectionViewCell
    {
        //Get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(
            "pickSomecell",
            forIndexPath: indexPath) as! pickSomeGridViewController
        
        //Show Images in grid view
        cell.cellImage.image = self.arrAllOriginalImages[indexPath.row]
            as? UIImage
        
        //Pick All.
        if 2 == self.tag
        {
            //Set tagIcon
            cell.tagIcon = 2
            
            //Check Mark toggle.
            cell.toggleSelected(cell)
        }
            
            //Pick some
        else
        {
            cell.tagIcon = 1
            //Check Mark toggle
            cell.toggleSelected(cell)
        }
        
        return cell
    }
    
    //Delegate Method sizeForItemAtIndexPath for number of cell to a row.
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        if UIInterfaceOrientationIsLandscape(
            UIApplication.sharedApplication().statusBarOrientation)
        {
            //  print("Landscape mode called")
            if UI_USER_INTERFACE_IDIOM() == .Pad
            {
                let numberOfColumns: CGFloat = 8
                let itemWidth = (CGRectGetWidth(self.collectionView!.frame) -
                    (numberOfColumns - 1)) / numberOfColumns
                return CGSizeMake(itemWidth, itemWidth)
            }
            else
            {
                //  print("Landscape mode in Iphone ")
                let numberOfColumns: CGFloat = 5
                let itemWidth = (CGRectGetWidth(self.collectionView!.frame) -
                    (numberOfColumns - 1)) / numberOfColumns
                return CGSizeMake(itemWidth, itemWidth)
            }
        }
            
            //Portrait mode
        else
        {
            // ("Portrait mode called")
            if UI_USER_INTERFACE_IDIOM() == .Pad
            {
                //Assign number of columns for grid according to device width.
                let numberOfColumns: CGFloat = 6 //CGFloat(
                // self.modelObject.numberOfCellsColumns)
                
                //Width of cells according to device width.
                let itemWidth = (CGRectGetWidth(self.collectionView!.frame) -
                    (numberOfColumns - 1)) / numberOfColumns
                
                //Return cell size.
                return  CGSizeMake(itemWidth, itemWidth)
            }
                
                // print("Portrait mode called in iphone")
            else
            {
                //Assign number of columns for grid according to device width.
                let numberOfColumns: CGFloat = 3 //CGFloat(
                // self.modelObject.numberOfCellsColumns)
                
                //Width of cells according to device width.
                let itemWidth = (CGRectGetWidth(self.collectionView!.frame) -
                    (numberOfColumns - 1)) / numberOfColumns
                
                //Return cell size.
                return  CGSizeMake(itemWidth, itemWidth)
            }
        }
    }
    
    //Delegate Method didSelectItemAtIndexPath (method : select images)
    func collectionView(collectionView: UICollectionView,
                        didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        //Get a reference to our storyboard cell
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
            as! pickSomeGridViewController
        
        //If Pick All is called
        if 2 == tag
        {
            //Set tagIcon
            cell.tagIcon = 2
            
            //Check Mark image toggle on select.
            cell.toggleSelected(cell)
            
            //Save selected images into an array.
            self.modelObject.arrSaveSelectedImages.removeObject(
                (self.arrAllOriginalImages[indexPath.row] as? UIImage)!)
            
            //Save ID of images ,which we select.
            self.modelObject.arrSaveIDOfSelectedImages.removeObject(
                self.arrAllOriginalID[indexPath.row ])
            
            //Navigation item title (selected images)
            self.navigationItem.title =
                "\(self.modelObject.arrSaveSelectedImages.count)" +
            " Selected"
            
            //If Images count is zero
            if 0 == self.modelObject.arrSaveSelectedImages.count
            {
                //Navigation title
                self.navigationItem.title = "Select photos"
            }
        }
            
            //Pick Some
        else
        {
            //Check Mark image toggle on select.
            cell.toggleSelected(cell)
            
            //Save selected images into an array.
            self.modelObject.arrSaveSelectedImages.addObject(
                (self.arrAllOriginalImages[indexPath.row] as? UIImage)!)
            
            //Save ID of images ,which we select.
            self.modelObject.arrSaveIDOfSelectedImages.addObject(
                self.arrAllOriginalID[indexPath.row])
            
            //Navigation item title (selected images)
            self.navigationItem.title =
                "\(self.modelObject.arrSaveIDOfSelectedImages.count)" +
            " Selected"
        }
    }
    
    //Delegate Method didDeselectItemAtIndexPath (Deselect images)
    func collectionView(collectionView: UICollectionView,
                        didDeselectItemAtIndexPath indexPath: NSIndexPath)
    {
        //Get a reference to our storyboard cell
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
            as! pickSomeGridViewController
        
        //If Pick All is called
        if 2 == tag
        {
            //Set tagIcon
            cell.tagIcon = 2
            
            //Toggle of selected images.
            cell.toggleSelected(cell)
            
            //Save selected images into an array.
            self.modelObject.arrSaveSelectedImages.addObject(
                (self.arrAllOriginalImages[indexPath.row] as? UIImage)!)
            
            //Save ID of images ,which we select.
            self.modelObject.arrSaveIDOfSelectedImages.addObject(
                self.arrAllOriginalID[indexPath.row])
            
            //Navigation item title (selected images)
            self.navigationItem.title =
                "\(self.modelObject.arrSaveSelectedImages.count)" +
            " Selected"
            
            // Images count is zero
            if 0 == self.modelObject.arrSaveSelectedImages.count
            {
                //Navigation title.
                self.navigationItem.title = "Select photos"
            }
        }
            
            //Pick Some
        else
        {
            //Toggle of selected images.
            cell.toggleSelected(cell)
            
            //Remove Deselect images from array.
            self.modelObject.arrSaveSelectedImages.removeObject(
                (self.arrAllOriginalImages[indexPath.row] as? UIImage)!)
            
            //Remove ID of images ,which we select.
            self.modelObject.arrSaveIDOfSelectedImages.removeObject(
                self.arrAllOriginalID[indexPath.row])
            
            
            //Navigation item title (selected images)
            self.navigationItem.title =
                "\(self.modelObject.arrSaveIDOfSelectedImages.count)" +
            " Selected"
            
            // Images count is zero
            if 0 == self.modelObject.arrSaveIDOfSelectedImages.count
            {
                //Navigation title
                self.navigationItem.title = "Select photos"
            }
        }
    }
    
    //Function didReceiveMemoryWarning
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    //Collection view layout.
    override func willRotateToInterfaceOrientation(toInterfaceOrientation:
        UIInterfaceOrientation, duration: NSTimeInterval)
    {
        self.collectionView.collectionViewLayout.invalidateLayout()
    }
    
    //View will appear.
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        //Change back button title
        //self.navigationController!.navigationBar.topItem!.title = "Back"
        
        //If images count are not zero.
        if (0 != self.modelObject.arrSaveIDOfSelectedImages.count)
        {
            //Navigation item title (selected images)
            self.navigationItem.title =
                "\(self.modelObject.arrSaveIDOfSelectedImages.count)" +
            " Selected"
        }
        
        // Images count is zero
        if 0 == self.modelObject.arrSaveIDOfSelectedImages.count
        {
            self.navigationItem.title = "Select photos"
        }
        
        //Change navigation bar title text colour.
        let titleDict: NSDictionary = [NSForegroundColorAttributeName:
            objColorHex.colorWithHexString("#1C57E1")]//UIColor.blueColor()]
        
        self.navigationController!.navigationBar.titleTextAttributes =
            titleDict as? [String : AnyObject]
        
        self.navigationController!.navigationBar.tintColor =
            objColorHex.colorWithHexString("#3764E6")
    }
    
    //Button btnAlbumPageView action
    @IBAction func btnAlbumPageView(sender: AnyObject)
    {
        
    }
}
