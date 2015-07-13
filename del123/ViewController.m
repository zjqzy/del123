//
//  ViewController.m
//  del123
//
//  Created by fanzhenhua on 15/5/25.
//  Copyright (c) 2015年 zhujianqi. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

#import "CustomMapAnnotation.h"
#import "ViewController.h"

@interface ViewController ()<MKMapViewDelegate,CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (strong,nonatomic) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _mapView.delegate=self;
    
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    
    //The desired location accuracy.
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    //Specifies the minimum update distance in meters.
    //_locationManager.distanceFilter = kCLDistanceFilterNone;  //ok
    _locationManager.distanceFilter=10; //单位  米
    
    //_locationManager.purpose = @"To provide functionality based on user's current location.";
    if([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [_locationManager requestWhenInUseAuthorization];
    }
    
    //
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(39.915352,116.397105);
    
    CustomMapAnnotation *annotationNew = [[CustomMapAnnotation alloc] initWithCoordinate:coord];
    annotationNew.title =@"111";
    annotationNew.subtitle =@"222";
    annotationNew.type=11;
    
    [_mapView addAnnotation:annotationNew];

    MKCoordinateSpan span;
    span.latitudeDelta=0.02;   //单位是 “经纬度” 范围 纬度[0-180度], 经度[0-360度]
    span.longitudeDelta=0.02;
    
    MKCoordinateRegion region;
    region.span=span;
    region.center=coord;
    //MKCoordinateRegion region=MKCoordinateRegionMakeWithDistance([userLocation coordinate], 1000, 1000);
    
    //地图放大详细显示
    [_mapView setRegion:[_mapView regionThatFits:region] animated:YES];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    
    MKPinAnnotationView *regionView= [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"1111"];
    regionView.draggable=YES;
    regionView.canShowCallout=YES;
    regionView.animatesDrop = YES;
    
    
    return regionView;
    
}
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)annotationView didChangeDragState:(MKAnnotationViewDragState)newState fromOldState:(MKAnnotationViewDragState)oldState {
    
    NSLog(@"111");
    
}

@end
