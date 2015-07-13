//
//  CustomMapAnnotation.m
//  PortableMap
//
//  Created by fanzhenhua on 15/5/22.
//  Copyright (c) 2015年 zhujianqi. All rights reserved.
//

#import "CustomMapAnnotation.h"

@implementation CustomMapAnnotation

-(id) initWithCoordinate:(CLLocationCoordinate2D) coords
{
    if (self = [super init])
    {
        _coordinate = coords;
        _radius=0;
    }
    return self;
}
//-(void)setCoordinate:(CLLocationCoordinate2D)coordNew
//{
//    _coordinate=coordNew;
//}
///////////////////////////////////////////////////////////////////
////////////////    NSCoding       ///////////////////
///////////////////////////////////////////////////////////////////

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.subtitle= [aDecoder decodeObjectForKey:@"subtitle"];
        
        _type=[aDecoder decodeIntForKey:@"type"];
        self.imgName=[aDecoder decodeObjectForKey:@"imgName"];
        self.desc=[aDecoder decodeObjectForKey:@"desc"];
        
        double latitude=[aDecoder decodeDoubleForKey:@"latitude"];
        double longitude=[aDecoder decodeDoubleForKey:@"longitude"];
        _coordinate=CLLocationCoordinate2DMake(latitude, longitude);
        
        _radius=[aDecoder decodeDoubleForKey:@"radius"];
        
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    NSString *title1=[_title length]>0?_title:@"";
    [aCoder encodeObject:title1 forKey:@"title"];
    
    NSString *subtitle1=[_subtitle length]>0?_subtitle:@"";
    [aCoder encodeObject:subtitle1 forKey:@"subtitle"];
    
    [aCoder encodeInt:_type forKey:@"type"];
    
    NSString *imgName1=[_imgName length]>0?_imgName:@"";
    [aCoder encodeObject:imgName1 forKey:@"imgName"];
    
    NSString *desc1=[_desc length]>0?_desc:@"";
    [aCoder encodeObject:desc1 forKey:@"desc"];
    
    [aCoder encodeDouble:_coordinate.latitude forKey:@"latitude"];
    [aCoder encodeDouble:_coordinate.longitude forKey:@"longitude"];
    
    [aCoder encodeDouble:_radius forKey:@"radius"];
}
///////////////////////////////////////////////////////////////////
////////////////          ///////////////////
///////////////////////////////////////////////////////////////////
@end
