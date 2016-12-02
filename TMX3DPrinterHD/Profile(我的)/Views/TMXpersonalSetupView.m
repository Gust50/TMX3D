//
//  TMXpersonalSetupView.m
//  
//
//  Created by kobe on 16/11/4.
//
//

#import "TMXpersonalSetupView.h"
#define LeftTitleColor     [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0]
#define RightTitleColor    [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1.0]

@interface TMXpersonalSetupView()
@property(nonatomic,strong)UILabel *showLabel;
@property(nonatomic,strong)UIView *topView;
@property(nonatomic,strong)UIButton *backBtn;


@property(nonatomic,strong)UIView *iconView;
@property(nonatomic,strong)UIImageView *iconImageView;
@property(nonatomic,strong)UILabel *takePhoneLabel;
@property(nonatomic,strong)UIView *SingleLine;
@property(nonatomic,strong)UILabel *photoAlbumLabel;
@property(nonatomic,strong)UIButton *takePhoneBtn;
@property(nonatomic,strong)UIButton *openAlbumBtn;


@property(nonatomic,strong)UIView *nameView;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *rightNameLabel;
@property(nonatomic,strong)UIButton *openNameBtn;

@property(nonatomic,strong)UIView *sexView;
@property(nonatomic,strong)UILabel *sexLabel;
@property(nonatomic,strong)UILabel *rightSexLabel;
@property(nonatomic,strong)UIButton *openSexBtn;


@property(nonatomic,strong)UIView *birthDateView;
@property(nonatomic,strong)UILabel *birthDateLabel;
@property(nonatomic,strong)UILabel *rightBirthDateLabel;
@property(nonatomic,strong)UIButton *openBrithDateBtn;


@property(nonatomic,strong)UIView *personalSignView;
@property(nonatomic,strong)UILabel *personalSignLabel;
@property(nonatomic,strong)UILabel *rightPersonalSignLabel;
@property(nonatomic,strong)UIButton *openPersonalSignBtn;



@property(nonatomic,strong)UIView *phoneNumberView;
@property(nonatomic,strong)UILabel *myPhoneNumLabel;
@property(nonatomic,strong)UILabel *showMyNumLabel;


@property(nonatomic,strong)UIButton *loginOutBtn;

@property (nonatomic, strong) UIView *loginView;
@property (nonatomic, strong) UIButton *backgroundBtn;

@end
@implementation TMXpersonalSetupView

-(UIButton *)backgroundBtn{
    if (!_backgroundBtn) {
        _backgroundBtn=[UIButton buttonWithType:0];
        _backgroundBtn.alpha=.6;
        _backgroundBtn.backgroundColor=[UIColor blackColor];
        [_backgroundBtn addTarget:self action:@selector(removeBgBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backgroundBtn;
}

-(UIView *)loginView{
    if (!_loginView) {
        _loginView=[UIView new];
        _loginView.backgroundColor= [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0];
    }
    return _loginView;
}



- (UIView *)topView{
    if (!_topView) {
        _topView = [UIView new];
//        _topView.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0];
    }
    return _topView;
}
- (UILabel *)showLabel{
    if (!_showLabel) {
        _showLabel = [[UILabel alloc] init];
        _showLabel.text = @"个人设置";
        _showLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _showLabel;
}
- (UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setImage:[UIImage imageNamed:@"CancelIcon"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(backAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}
- (void)backAC{
    if (self.backblock) {
        self.backblock();
    }
}
- (UIView *)iconView{
    if (!_iconView) {
        _iconView = [UIView new];
        _iconView.backgroundColor = [UIColor whiteColor];
    }
    return _iconView;
}
- (UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [UIImageView new];
//        _iconImageView.backgroundColor = [UIColor cyanColor];
        _iconImageView.image = [UIImage imageNamed:@"ReplaceIcon"];
       _iconImageView.layer.cornerRadius = 40*APPScale;
    }
    return _iconImageView;
}
- (UILabel *)takePhoneLabel{
    if (!_takePhoneLabel) {
        _takePhoneLabel = [UILabel new];
        _takePhoneLabel.text = @"拍照";
        _takePhoneLabel.textColor = RightTitleColor;
        _takePhoneLabel.textAlignment = NSTextAlignmentRight;
    }
    return _takePhoneLabel;
}
- (UIView *)SingleLine{
    if (!_SingleLine) {
        _SingleLine  = [UIView new];
        
        _SingleLine.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
    }
    return _SingleLine;
}
- (UILabel *)photoAlbumLabel{
    if (!_photoAlbumLabel) {
        _photoAlbumLabel = [UILabel new];
        _photoAlbumLabel.text = @"本地相册";
        _photoAlbumLabel.textColor = RightTitleColor;
        _photoAlbumLabel.textAlignment = NSTextAlignmentRight;
    }
    return _photoAlbumLabel;
}
- (UIButton *)takePhoneBtn{
    if (!_takePhoneBtn) {
        _takePhoneBtn = [UIButton new];
        [_takePhoneBtn setImage:[UIImage imageNamed:@"DetailArow"] forState:UIControlStateNormal];
        [_takePhoneBtn addTarget:self action:@selector(takePhonoBtnAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _takePhoneBtn;
}
- (void)takePhonoBtnAC{
    if (self.takePhotoblock) {
        self.takePhotoblock();
    }
}
- (UIButton *)openAlbumBtn{
    if (!_openAlbumBtn) {
        _openAlbumBtn = [UIButton new];
        [_openAlbumBtn setImage:[UIImage imageNamed:@"DetailArow"] forState:UIControlStateNormal];
        [_openAlbumBtn addTarget:self action:@selector(openAlbumBtnAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _openAlbumBtn;
}
- (void)openAlbumBtnAC{
    if (self.locolAlbumblock) {
        self.locolAlbumblock();
    }
}
- (UIView *)nameView{
    if (!_nameView) {
        _nameView = [UIView new];
        _nameView.backgroundColor = [UIColor whiteColor];
    }
    return _nameView;
}
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.text = @"昵称";
        _nameLabel.textColor = LeftTitleColor;

    }
    return _nameLabel;
}
- (UILabel *)rightNameLabel{
    if (!_rightNameLabel) {
        _rightNameLabel = [UILabel new];
        _rightNameLabel.text = @"大漠飞鹰";
        _rightNameLabel.textColor = RightTitleColor;
        _rightNameLabel.textAlignment = NSTextAlignmentRight;
    }
    return _rightNameLabel;
}
- (UIButton *)openNameBtn{
    if (!_openNameBtn) {
        _openNameBtn = [UIButton new];
        [_openNameBtn setImage:[UIImage imageNamed:@"DetailArow"] forState:UIControlStateNormal];
        [_openNameBtn addTarget:self action:@selector(openNameBtnAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _openNameBtn;
}
- (void)openNameBtnAC{
    if (self.openNameblock) {
        self.openNameblock();
    }
}
- (UIView *)sexView{
    if (!_sexView) {
        _sexView = [UIView new];
        _sexView.backgroundColor = [UIColor whiteColor];
    }
    return _sexView;
}
- (UILabel *)sexLabel{
    if (!_sexLabel) {
        _sexLabel = [UILabel new];
        _sexLabel.text = @"性别";
        _sexLabel.textColor = LeftTitleColor;
    }
    return _sexLabel;
}
- (UILabel *)rightSexLabel{
    if (!_rightSexLabel) {
        _rightSexLabel = [UILabel new];
        _rightSexLabel.text = @"保密";
        _rightSexLabel.textAlignment = NSTextAlignmentRight;
        _rightSexLabel.textColor = RightTitleColor;
    }
    return _rightSexLabel;
}
- (UIButton *)openSexBtn{
    if (!_openSexBtn) {
        _openSexBtn = [UIButton new];
        [_openSexBtn setImage:[UIImage imageNamed:@"SurroundIcon"] forState:UIControlStateNormal];
        [_openSexBtn addTarget:self action:@selector(openSexBtnAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _openSexBtn;
}
- (void)openSexBtnAC{
    if (self.openSexblock) {
        self.openSexblock();
    }
}


- (UIView *)birthDateView{
    if (!_birthDateView) {
        _birthDateView = [UIView new];
        _birthDateView.backgroundColor = [UIColor whiteColor];
    }
    return _birthDateView;
}
- (UILabel *)birthDateLabel{
    if (!_birthDateLabel) {
        _birthDateLabel = [UILabel new];
        _birthDateLabel.text = @"出生日期";
        _birthDateLabel.textColor = LeftTitleColor;
    }
    return _birthDateLabel;
}
- (UILabel *)rightBirthDateLabel{
    if (!_rightBirthDateLabel) {
        _rightBirthDateLabel = [UILabel new];
        _rightBirthDateLabel.text = @"2020-08-25";
        _rightBirthDateLabel.textColor = RightTitleColor;
        _rightBirthDateLabel.textAlignment = NSTextAlignmentRight;
    }
    return _rightBirthDateLabel;
}
- (UIButton *)openBrithDateBtn{
    if (!_openBrithDateBtn) {
        _openBrithDateBtn = [UIButton new];
        [_openBrithDateBtn setImage:[UIImage imageNamed:@"DetailArow"] forState:UIControlStateNormal];
        [_openBrithDateBtn addTarget:self action:@selector(openBrithDateBtnAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _openBrithDateBtn;
}
- (void)openBrithDateBtnAC{
    if (self.openBirthblock) {
        self.openBirthblock();
    }
}

- (UIView *)personalSignView{
    if (!_personalSignView) {
        _personalSignView = [UIView new];
        _personalSignView.backgroundColor = [UIColor whiteColor];
    }
    return _personalSignView;
}
- (UILabel *)personalSignLabel{
    if (!_personalSignLabel) {
        _personalSignLabel = [UILabel new];
        _personalSignLabel.text = @"我的签名";
        _personalSignLabel.textColor = LeftTitleColor;
    }
    return _personalSignLabel;
}
- (UILabel *)rightPersonalSignLabel{
    if (!_rightPersonalSignLabel) {
        _rightPersonalSignLabel = [UILabel new];
        _rightPersonalSignLabel.text = @"忍一时风平浪静，退一步海阔天空";
        _rightPersonalSignLabel.textColor = RightTitleColor;
        _rightPersonalSignLabel.textAlignment = NSTextAlignmentRight;
    }
    return _rightPersonalSignLabel;
}
- (UIButton *)openPersonalSignBtn{
    if (!_openPersonalSignBtn) {
        _openPersonalSignBtn = [UIButton new];
        [_openPersonalSignBtn setImage:[UIImage imageNamed:@"DetailArow"] forState:UIControlStateNormal];
        [_openPersonalSignBtn addTarget:self action:@selector(openPersonalSignBtnAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _openPersonalSignBtn;
}
- (void)openPersonalSignBtnAC{
    if (self.openSignblock) {
        self.openSignblock();
    }
}
- (UIView *)phoneNumberView{
    if (!_phoneNumberView) {
        _phoneNumberView  = [UIView new];
        _phoneNumberView.backgroundColor = [UIColor whiteColor];
    }
    return _phoneNumberView;
}
- (UILabel *)myPhoneNumLabel{
    if (!_myPhoneNumLabel) {
        _myPhoneNumLabel = [UILabel new];
        _myPhoneNumLabel.text = @"我的手机号";
        _myPhoneNumLabel.textColor = LeftTitleColor;
    }
    return _myPhoneNumLabel;
}
- (UILabel *)showMyNumLabel{
    if (!_showMyNumLabel) {
        _showMyNumLabel = [UILabel new];
        _showMyNumLabel.text = @"15919948521";
        _showMyNumLabel.textAlignment = NSTextAlignmentRight;
        _showMyNumLabel.textColor = RightTitleColor;
    }
    return _showMyNumLabel;
}

- (UIButton *)loginOutBtn{
    if (!_loginOutBtn) {
        _loginOutBtn = [UIButton new];
        [_loginOutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        [_loginOutBtn setBackgroundColor:[UIColor orangeColor]];
        _loginOutBtn.layer.cornerRadius = 10;
        [_loginOutBtn addTarget:self action:@selector(loginOutAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginOutBtn;
}
- (void)loginOutAC{
    if (self.loginOutblock) {
        self.loginOutblock();
    }
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    [self addSubview:self.backgroundBtn];
    [self addSubview:self.loginView];
    
    [_loginView addSubview:self.topView];
    [_topView addSubview:self.showLabel];
    [_topView addSubview:self.backBtn];
    
    [_loginView addSubview:self.iconView];
    [_iconView addSubview:self.iconImageView];
    [_iconView addSubview:self.takePhoneBtn];
    [_iconView addSubview:self.openAlbumBtn];
    [_iconView addSubview:self.takePhoneLabel];
    [_iconView addSubview:self.SingleLine];
    [_iconView addSubview:self.photoAlbumLabel];

    [_loginView addSubview:self.nameView];
    [_nameView addSubview:self.nameLabel];
    [_nameView addSubview:self.openNameBtn];
    [_nameView addSubview:self.rightNameLabel];
    
    
    [_loginView addSubview:self.sexView];
    [_sexView addSubview:self.sexLabel];
    [_sexView addSubview:self.openSexBtn];
    [_sexView addSubview:self.rightSexLabel];
    
    
    [_loginView addSubview:self.birthDateView];
    [_birthDateView addSubview:self.birthDateLabel];
    [_birthDateLabel addSubview:self.openBrithDateBtn];
    [_birthDateLabel addSubview:self.rightBirthDateLabel];
   
    
    [_loginView addSubview:self.personalSignView];
    [_personalSignView addSubview:self.personalSignLabel];
    [_personalSignView addSubview:self.openPersonalSignBtn];
    [_personalSignView addSubview:self.rightPersonalSignLabel];
    
    
    [_loginView addSubview:self.phoneNumberView];
    [_phoneNumberView addSubview:self.myPhoneNumLabel];
    [_phoneNumberView addSubview:self.showMyNumLabel];
    
    [_loginView addSubview:self.loginOutBtn];
    [self updateConstraints];
}

-(void)setIsUpdateUI:(BOOL)isUpdateUI{
    
    if (isUpdateUI) {
        [self setNeedsUpdateConstraints];
    }
}

-(void)removeBgBtn:(UIButton *)btn{
    if (self.backblock) {
        self.backblock();
    }
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    CGFloat BagHeight = [UIScreen mainScreen].bounds.size.height;
    CGFloat BagWidth = [UIScreen mainScreen].bounds.size.width;
    
    [_backgroundBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.right.equalTo(weakSelf);
    }];
    
    if (Lanscape) {
        [_loginView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(weakSelf.mas_centerX);
            make.centerY.equalTo(weakSelf.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(BagWidth/2, BagHeight/1.5));
        }];
        
        [_loginOutBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_loginView.mas_centerX);
            make.width.mas_equalTo(@(BagWidth/3));
            make.bottom.equalTo(_loginView.mas_bottom).offset(-20);
            make.height.equalTo(@40);
        }];
        
    }else{
        [_loginView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(weakSelf.mas_centerX);
            make.centerY.equalTo(weakSelf.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(BagWidth/1.5, BagHeight/2));
        }];
        
        [_loginOutBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_loginView.mas_centerX);
            make.width.mas_equalTo(@(BagWidth/2.25));
            make.bottom.equalTo(_loginView.mas_bottom).offset(-20);
            make.height.equalTo(@40);
        }];
    }

    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_loginView.mas_left);
        make.top.equalTo(_loginView.mas_top);
        make.width.equalTo(_loginView.mas_width);
        make.height.mas_equalTo(@(60));
        
    }];
    [_showLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_topView.mas_centerX);
        make.width.equalTo(@(80));
        make.centerY.equalTo(_topView.mas_centerY);
        make.height.equalTo(@(40));
        
    }];
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_loginView.mas_right).offset(-10);
        make.width.mas_equalTo(@(30));
        make.centerY.equalTo(_showLabel.mas_centerY);
        make.height.mas_equalTo(@(30));
    }];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topView.mas_bottom);
        make.width.equalTo(_loginView.mas_width);
        make.left.equalTo(_loginView.mas_left);
        make.height.mas_equalTo(@(120));
    }];

    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconView.mas_left).offset(20*APPScale);
        make.centerY.equalTo(_iconView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    [_SingleLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(2));
        make.right.equalTo(_iconView.mas_right);
        make.left.equalTo(_iconImageView.mas_right).offset(20);
        make.centerY.equalTo(_iconView.mas_centerY);
    }];
    
    [_takePhoneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_loginView.mas_right).offset(-20);
        make.size.mas_equalTo(CGSizeMake(10, 20));
        make.centerY.equalTo(_iconView.mas_centerY).offset(-30);
    }];
    [_openAlbumBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_loginView.mas_right).offset(-20);
        make.size.mas_equalTo(CGSizeMake(10, 40));
        make.centerY.equalTo(_iconView.mas_centerY).offset(30);
    }];

    
    [_takePhoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_takePhoneBtn.mas_left).offset(-10);
        make.size.mas_equalTo(CGSizeMake(60, 40));
        make.centerY.equalTo(_takePhoneBtn.mas_centerY);
    }];
    [_photoAlbumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_openAlbumBtn.mas_left).offset(-10);
        make.size.mas_equalTo(CGSizeMake(100, 40));
        make.centerY.equalTo(_openAlbumBtn.mas_centerY);
    }];
    [_nameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_iconView.mas_bottom).offset(10);
        make.width.equalTo(_loginView.mas_width);
        make.left.equalTo(_loginView.mas_left);
        make.height.mas_equalTo(@(60));
    }];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconImageView.mas_left);
        make.centerY.equalTo(_nameView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(60, 40));
    }];
    [_openNameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_loginView.mas_right).offset(-20);
        make.size.mas_equalTo(CGSizeMake(10, 40));
        make.centerY.equalTo(_nameView.mas_centerY);
    }];
    [_rightNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel.mas_right);
        make.right.equalTo(_openNameBtn.mas_left).offset(-15);
        make.height.equalTo(@(40));
        make.centerY.equalTo(_openNameBtn.mas_centerY);
    }];
    
    [_sexView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nameView.mas_bottom).offset(2);
        make.width.equalTo(_loginView.mas_width);
        make.left.equalTo(_loginView.mas_left);
        make.height.mas_equalTo(@(60));
    }];
    [_sexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconImageView.mas_left);
        make.centerY.equalTo(_sexView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(60, 40));
    }];
    [_openSexBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_loginView.mas_right).offset(-20);
        make.size.mas_equalTo(CGSizeMake(10, 40));
        make.centerY.equalTo(_sexView.mas_centerY);
    }];
    [_rightSexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_sexLabel.mas_right);
        make.right.equalTo(_openSexBtn.mas_left).offset(-15);
        make.height.equalTo(@(40));
        make.centerY.equalTo(_sexView.mas_centerY);
    }];

    
    
    [_birthDateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_sexView.mas_bottom).offset(2);
        make.width.equalTo(_loginView.mas_width);
        make.left.equalTo(_loginView.mas_left);
      ;
        make.height.mas_equalTo(@(60));
    }];
    [_birthDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconImageView.mas_left);
        make.centerY.equalTo(_birthDateView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
    [_openBrithDateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_loginView.mas_right).offset(-20);
        make.size.mas_equalTo(CGSizeMake(10, 40));
        make.centerY.equalTo(_birthDateView.mas_centerY);
    }];
    [_rightBirthDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_birthDateLabel.mas_right);
        make.right.equalTo(_openBrithDateBtn.mas_left).offset(-15);
        make.height.equalTo(@(40));
        make.centerY.equalTo(_birthDateView.mas_centerY);
    }];

    [_personalSignView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_birthDateView.mas_bottom).offset(2);
        make.width.equalTo(_loginView.mas_width);
        make.left.equalTo(_loginView.mas_left);
        make.height.mas_equalTo(@(60));
    }];
    [_personalSignLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconImageView.mas_left);
        make.centerY.equalTo(_personalSignView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
    [_openPersonalSignBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_loginView.mas_right).offset(-20);
        make.size.mas_equalTo(CGSizeMake(10, 40));
        make.centerY.equalTo(_personalSignView.mas_centerY);
    }];
    [_rightPersonalSignLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_personalSignLabel.mas_right);
        make.right.equalTo(_openPersonalSignBtn.mas_left).offset(-15);
        make.height.equalTo(@(40));
        make.centerY.equalTo(_personalSignView.mas_centerY);
    }];
    
    [_phoneNumberView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_personalSignView.mas_bottom).offset(10);
        make.width.equalTo(_loginView.mas_width);
        make.left.equalTo(_loginView.mas_left);
        make.height.mas_equalTo(@(60));
    }];
    [_myPhoneNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconImageView.mas_left);
        make.centerY.equalTo(_phoneNumberView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(120, 40));
    }];
    [_showMyNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_myPhoneNumLabel.mas_right);
        make.right.equalTo(_rightPersonalSignLabel.mas_right);
        make.height.equalTo(@(40));
        make.centerY.equalTo(_phoneNumberView.mas_centerY);
    }];
    
  
}

@end
