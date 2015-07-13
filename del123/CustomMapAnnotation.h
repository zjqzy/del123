//
//  CustomMapAnnotation.h
//  PortableMap
//
//  Created by fanzhenhua on 15/5/22.
//  Copyright (c) 2015年 zhujianqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>  

@interface CustomMapAnnotation : NSObject<MKAnnotation,NSCoding>

//@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *subtitle;
@property (nonatomic) int type; //类型
@property (copy,nonatomic) NSString *imgName;//
@property (copy, nonatomic) NSString *desc;
@property (nonatomic) double radius;    //辐射半径

-(id)initWithCoordinate:(CLLocationCoordinate2D) coords;

//-(void)setCoordinate:(CLLocationCoordinate2D)coordNew;


@end
