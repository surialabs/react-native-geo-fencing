#import "SLRNGeoFencing.h"
#import <GoogleMaps/GMSGeometryUtils.h>
#import <GoogleMaps/GMSMutablePath.h>

@implementation SLRNGeoFencing

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(
  containsLocation:(NSDictionary *)point
  polygon:(NSArray *)polygon
  callback:(RCTResponseSenderBlock)callback)
{

  CLLocationCoordinate2D locationPoint = CLLocationCoordinate2DMake(
    [[point objectForKey:@"lat"] doubleValue],
    [[point objectForKey:@"lng"] doubleValue]
  );

  GMSMutablePath *polygonPath  = [GMSMutablePath path];

  for(int i = 0; i < [polygon count]; i++) {
    [polygonPath addCoordinate:CLLocationCoordinate2DMake(
      [[polygon[i] objectForKey:@"lat"] doubleValue],
      [[polygon[i] objectForKey:@"lng"] doubleValue]
    )];
  }


  if (GMSGeometryContainsLocation(locationPoint, (GMSPath *)polygonPath, NO)) {
    // locationPoint is in polygonPath
    callback(@[@YES]);
  } else {
    // locationPoint is NOT in polygonPath.
    callback(@[@NO]);
  }
}
@end
