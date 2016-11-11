//
//  MyInf.swift
//  MyAppp
//
//  Created by mac-pc on 11/11/16.
//  Copyright © 2016 greenprint. All rights reserved.
//

import UIKit
import Photos

class PhotoModel: NSObject
{
    //Index to rotate loop for saving images into DB.
    var intGetLastInsertRowID : Int64 =  0
    
    //Get Current date.
    var dateAblumCreation = NSDate()
    
    //Index to rotate loop.
    var nindex : Int = 0
    
    //Array for get thumbnail image path from DB.
    var arrGalleryImagePathFromDBMediaTable:NSMutableArray=[]
    
    //Array for saving images from thumbnail url.
    var arrOriginalImages : NSMutableArray = []
    
    //Array for get Images id from DB (media table).
    var arrGetImagesIDFromDBMediaTable : NSMutableArray = []
    
    //Array for Saving ID
    var arrSaveIDOfSelectedImages : NSMutableArray = []
    
    //2D array, TODO
    //var imageAndID : NSMutableArray = [[]]
    
    //Array for Saving Selected Images in grid view.
    var arrSaveSelectedImages : NSMutableArray = []
    
    //Create Object of AppDelegate Class
    //let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    //Get device width.
    var getDeviceWidth = CGFloat()
    
    var getDeviceHeight = CGFloat()
    
    //Number of cells column.
    var numberOfCellsColumns = Int()
    
    //Get Device width.
    func getDeviceWidthInfo ()
    {
        //Get device screen width
        getDeviceWidth = UIScreen.mainScreen().bounds.width
        
        //Get device screen Height
        getDeviceHeight = UIScreen.mainScreen().bounds.height
        
        //If width is between 300 to 399.
        if(300 <= getDeviceWidth && 400 > getDeviceWidth )
        {
            //No. of columns of grid is 3.
            numberOfCellsColumns = 3
        }
            
            //If width is between 400 to 519.
        else if(400 <= getDeviceWidth && 520 > getDeviceWidth )
        {
            //No. of columns of grid is 4.
            numberOfCellsColumns = 4
        }
            
            //If width is between 520 to 649.
        else if(520 <= getDeviceWidth && 650 > getDeviceWidth )
        {
            //No. of columns of grid is 5.
            numberOfCellsColumns = 5
        }
            
        else
        {
            //No. of columns of grid is 6.
            numberOfCellsColumns = 6
        }
    }
}
