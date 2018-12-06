//
//  ViewController.m
//  FakeForFun
//
//  Created by wudi on 2018/12/6.
//  Copyright © 2018 wudi. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Image.h"
#import <Photos/Photos.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *tfview;
@property (weak, nonatomic) IBOutlet UIView *cardView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)tfChanged:(id)sender {
    _label.text = _tfview.text;
}

- (IBAction)doneClicked:(id)sender {
    UIImage *img =  [self.cardView viewToImage];
    
    [self saveImage:img];

    
}


- (void)saveImage:(UIImage *)image {
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);

}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo;
{
    NSString *title = !error ? @"图片保存成功" : @"图片保存失败";
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:title preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
  
}



@end
