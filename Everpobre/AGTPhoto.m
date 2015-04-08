#import "AGTPhoto.h"

@interface AGTPhoto ()

// Private interface goes here.

@end

@implementation AGTPhoto

-(UIImage *)image{
    // Convertir la NSData en UIImage
    UIImage * image = [UIImage imageWithData:self.photoData];
    return image;
}
-(void)setImage:(UIImage *)image{
    // Convertir la UIImage en un NSData
    NSData * data = UIImageJPEGRepresentation(image, 0.9);
    self.photoData = data;
}

@end
