//
//  TMXFixPrinterVC.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/8.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXFixPrinterVC.h"
#import "TMXFixPrinterView.h"
#import "TMXBgFixPrinterVC.h"
#import "TMXAccountPrinterCommandModel.h"

@interface TMXFixPrinterVC ()<TMXFixPrinterViewDelegate>
{
    TMXAccountPrinterCommandModel *cmdModel;
    NSMutableDictionary *params;
    CGFloat length;
}
@property (nonatomic, strong) TMXFixPrinterView *fixPrinterView;
@end

@implementation TMXFixPrinterVC


-(TMXFixPrinterView *)fixPrinterView{
    if (!_fixPrinterView) {
        _fixPrinterView=[TMXFixPrinterView new];
         _fixPrinterView.delegate=self;
        _fixPrinterView.imageName = @"printerInit";
    }
    return _fixPrinterView;
}


-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    [self updateViewConstraints];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    _fixPrinterView.isUpdateUI=YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    params=[NSMutableDictionary dictionary];
    cmdModel=[[TMXAccountPrinterCommandModel alloc]init];
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.fixPrinterView];
    _fixPrinterView.isHide =_isHide;
    _fixPrinterView.imageName=_imageName;
}

-(void)clickNextBtn{
    
    if (_isHide) {
        params[@"command"]=@(11);
    }else{
        if (_nextTrail) {
            params[@"command"]=@(12);
        }
        if (_nextRight) {
            params[@"command"]=@(12);
        }
        if (_nextLeft) {
            params[@"command"]=@(12);
        }
        if (_nextCenter) {
            params[@"command"]=@(12);
        }
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0)*NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self sendCmd];
    });
   
}

-(void)sendFixCmd{
    params[@"printerId"]=_printerId;
    [cmdModel FetchTMXAccountPrinterCommandData:params callBack:^(BOOL isSuccess, id result) {
        if (isSuccess) {
            
            [MBProgressHUD showSuccess:@"success"];
            
        }else{
            [MBProgressHUD showError:result];
        }
        
    }];
}


//打印机指令
-(void)sendCmd{
    
        params[@"printerId"]=_printerId;
        NSLog(@">>>>>打印机参数>>>>>%@",params);
    
        WS(weakSelf);
        [cmdModel FetchTMXAccountPrinterCommandData:params callBack:^(BOOL isSuccess, id result) {
    
            if (isSuccess)
            {
                [MBProgressHUD showSuccess:@"success"];
    
    WS(weakSelf);
    if (_isHide) {
        
        TMXFixPrinterVC *tMXMovePaperLocationVC=[[TMXFixPrinterVC alloc]init];
        tMXMovePaperLocationVC.nextCenter=YES;
        tMXMovePaperLocationVC.printerId=_printerId;
        tMXMovePaperLocationVC.imageName=@"printerCenter";
        [weakSelf.navigationController pushViewController:tMXMovePaperLocationVC animated:YES];
        
    }else {
        if (_nextCenter){
            
            TMXFixPrinterVC *tMXMovePaperLocationVC=[[TMXFixPrinterVC alloc]init];
            tMXMovePaperLocationVC.nextLeft=YES;
            tMXMovePaperLocationVC.printerId=_printerId;
            tMXMovePaperLocationVC.imageName=@"printerLeft";
            [weakSelf.navigationController pushViewController:tMXMovePaperLocationVC animated:YES];
            
        }else if (_nextLeft){
            
            TMXFixPrinterVC *tMXMovePaperLocationVC=[[TMXFixPrinterVC alloc]init];
            tMXMovePaperLocationVC.nextRight=YES;
            tMXMovePaperLocationVC.printerId=_printerId;
            tMXMovePaperLocationVC.imageName=@"printerRight";
            [weakSelf.navigationController pushViewController:tMXMovePaperLocationVC animated:YES];
            
        }else if (_nextRight){
            
            TMXFixPrinterVC *tMXMovePaperLocationVC=[[TMXFixPrinterVC alloc]init];
            tMXMovePaperLocationVC.nextTrail=YES;
            tMXMovePaperLocationVC.printerId=_printerId;
            tMXMovePaperLocationVC.imageName=@"printerTrail";
            [weakSelf.navigationController pushViewController:tMXMovePaperLocationVC animated:YES];
            
        }else if (_nextTrail){
            
            [weakSelf.navigationController popToRootViewControllerAnimated:YES];
            
            [[NSNotificationCenter defaultCenter]postNotificationName:@"FixCompletion" object:nil userInfo:nil];
            
        }
    }
            }else
            {
                [MBProgressHUD showError:result];
            }
        }];
}

-(void)updateViewConstraints{
    [super updateViewConstraints];
    
    [_fixPrinterView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}


#pragma  mark <TMXFixPrinterViewDelegate>
-(void)clickFixBtn:(UIButton *)fixBtn{
    
    params[@"command"]=@(7);
    
    //z-
    if (fixBtn.tag==101) {
        params[@"length"]=@(-.1);
        
    }else if (fixBtn.tag==102){
        params[@"length"]=@(.1);
        
    }else if (fixBtn.tag==103){
        params[@"length"]=@(-1);
        
    }else if (fixBtn.tag==104){
        params[@"length"]=@(1);
    }
    
    [self sendFixCmd];
}

#pragma mark - setter getter
-(void)setIsHide:(BOOL)isHide
{
    _isHide = isHide;
}

-(void)setImageName:(NSString *)imageName{
    _imageName=imageName;
}

-(void)setPrinterId:(NSString *)printerId{
    _printerId=printerId;
}

@end
