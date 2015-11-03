//
//  UIView+ViewGuide.h
//  
//
//  Created by nero on 15/10/16.
//  Copyright © 2015年 nero. All rights reserved.
//

//#define  ViewGuideMarco 


#import <UIKit/UIKit.h>
#import "VGViewGuide.h"



IB_DESIGNABLE
@interface UIView (ViewGuide)
@property (nonatomic, strong) VGViewGuide *viewGuide;
- (void)updateDebug ;
@end

IB_DESIGNABLE
@interface UIViewController (ViewGuide)

@end
