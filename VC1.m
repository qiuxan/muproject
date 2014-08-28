//
//  VC1.m
//  UsayedBeacon
//
//  Created by Tommy on 12/08/2014.
//  Copyright (c) 2014 UTAS. All rights reserved.
//

#import "VC1.h"
#import "ViewController.h"


@implementation VC1


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.beaconManager = [[ESTBeaconManager alloc] init];
    self.beaconManager.delegate = self;
    self.beaconManager.avoidUnknownStateBeacons = YES;
    
    
    // create sample region object (you can additionaly pass major / minor values)
    self.beaconRegion = [[ESTBeaconRegion alloc] initWithProximityUUID:self.beacon.proximityUUID
                                                                 major:[self.beacon.major unsignedIntValue]
                                                                 minor:[self.beacon.minor unsignedIntValue]
                                                            identifier:@"RegionIdentifier"];
    
    [self.beaconManager startRangingBeaconsInRegion:self.beaconRegion];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [self.beaconManager stopRangingBeaconsInRegion:self.beaconRegion];
    
    [super viewDidDisappear:animated];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)beaconManager:(ESTBeaconManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(ESTBeaconRegion *)region
{
    firstBeacon = [beacons firstObject];
    
    if ([(firstBeacon.major) intValue] != major1)
    {
        [self performSegueWithIdentifier:@"VC1Back" sender:self];
    }
    
    if ([(firstBeacon.major) intValue] == major1)
    {
        
        if (firstBeacon.proximity != CLProximityNear)
        {
                    [self performSegueWithIdentifier:@"VC1Back" sender:self];     
        }
        
        
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
