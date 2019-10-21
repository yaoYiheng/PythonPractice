//
//  YYBasicViewController.m
//  NewVersionRuiAn
//
//  Created by 姚懿恒 on 2019/10/13.
//  Copyright © 2019 姚懿恒. All rights reserved.
//

#import "YYBasicViewController.h"
#import "MJExtension.h"
#import "YYClientInfo.h"
#define LAST_RUN_VERSION_KEY @"last_run_version_of_application"
//#import "YYSearchTableViewController.Swift.h"
#import "NewVersionRuiAn-Swift.h"
@interface YYBasicViewController ()

@property (nonatomic, strong) NSMutableArray *clientArr;
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSDictionary *> *clientDict;

//UI
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderPicker;
@property (weak, nonatomic) IBOutlet UISegmentedControl *locationPicker;
@property (weak, nonatomic) IBOutlet UITextView *descriptionsTextView;
@property (weak, nonatomic) IBOutlet UIDatePicker *visitDatePicker;

@end

@implementation YYBasicViewController

- (NSMutableArray *)clientArr
{
    if (!_clientArr) {
        _clientArr = [NSMutableArray array];
    }
    return _clientArr;
}
- (NSMutableDictionary *) clientDict
{
    if (!_clientDict) {
        _clientDict = [NSMutableDictionary dictionary];
    }
    return  _clientDict;
}
- (IBAction)submitClick
{
    //从UI输入并进行判断
    YYClientInfo *info = [[YYClientInfo alloc] initWithName:self.nameTextField.text andPhone:self.phoneTextField.text andGender:[NSString stringWithFormat:@"%ld", (long)self.genderPicker.selectedSegmentIndex] andLocation:[NSString stringWithFormat:@"%ld", self.locationPicker.selectedSegmentIndex] andVisitDate:self.visitDatePicker.date andDescriptions:self.descriptionsTextView.text];
    
    
    //将输入的数据加入到数组中.
    [self.clientArr addObject:info];
    
    //写入字典
    for (YYClientInfo *item in self.clientArr) {
        //需要将模型转成字典
        NSDictionary *dict = [item mj_keyValues];
        [self.clientDict setObject:dict forKey:item.phoneNumber];
        
    }
    
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [docDir stringByAppendingPathComponent:@"Test.plist"];
    NSLog(@"%@", filePath);
     
    BOOL isExistance = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
    if (!isExistance)
    {
//        NSMutableArray *dictplist = [[NSMutableArray alloc] init];
//        [dictplist insertObject:self.clientArr atIndex:0];
//
//        [dictplist writeToFile:filePath atomically:YES];
        
        [self.clientDict writeToFile:filePath atomically:YES];
//        NSLog(@"------1----- %@写入不成功",dictplist);
    } else {
//        NSMutableArray *array = [[NSMutableArray alloc] initWithArray:self.clientArr];
//        [array insertObject:self.clientArr atIndex:0];
        
        [self.clientDict writeToFile:filePath atomically:YES];
        NSLog(@"-------2----%@写入成功",self.clientDict);
    }

}
//是否第一次登录
- (BOOL) isFirstLoad{
NSString *currentVersion = [[[NSBundle mainBundle] infoDictionary]
objectForKey:@"CFBundleShortVersionString"];
  
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  
NSString *lastRunVersion = [defaults objectForKey:LAST_RUN_VERSION_KEY];
  
if (!lastRunVersion) {
[defaults setObject:currentVersion forKey:LAST_RUN_VERSION_KEY];
return YES;
}
else if (![lastRunVersion isEqualToString:currentVersion]) {
[defaults setObject:currentVersion forKey:LAST_RUN_VERSION_KEY];
return YES;
}
return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
//    [self createEditableCopyOfIfNeeded];
    [self loadDate];
    

}
//加载数据
- (void)loadDate
{
    
    if ([self isFirstLoad])
    {
        NSLog(@"第一次d登录");
        self.clientArr = [YYClientInfo mj_objectArrayWithFilename:@"Test.plist"];
    } else
    {
        NSLog(@"不是第一次登录");
        NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *filePath = [docDir stringByAppendingPathComponent:@"Test.plist"];
        self.clientDict = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
        NSMutableArray *temp = [NSMutableArray arrayWithArray:self.clientDict.allValues];
        
        for (NSDictionary *item in temp) {
            YYClientInfo *tempInfo = [YYClientInfo mj_objectWithKeyValues:item];
            [self.clientArr addObject:tempInfo];
        }
        
    }

    
    //确认每一个属性都被转了出来
//    NSLog(@"%lu", (unsigned long)self.clientArr.count);
//
//    for (YYClientInfo *item in self.clientArr) {
//        NSLog(@"%@", item.descriptions);
//    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation

*/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    YYSearchTableViewController *searchVC = segue.destinationViewController;
    searchVC.yYClientInfo = self.clientArr;
    
}
@end
