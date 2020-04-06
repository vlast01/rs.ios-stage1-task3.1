#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView * viewResultColor;
@property (nonatomic, strong) UITextField *textFieldRed;
@property (nonatomic, strong) UITextField *textFieldGreen;
@property (nonatomic, strong) UITextField *textFieldBlue;
@property (nonatomic, strong) UILabel *labelResultColor;
@property (nonatomic, strong) UILabel *labelRed;
@property (nonatomic, strong) UILabel *labelGreen;
@property (nonatomic, strong) UILabel *labelBlue;
@property (nonatomic, strong) UIButton *buttonProcess;

@end

@implementation ViewController


#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewResultColor = [[UIView alloc] initWithFrame:CGRectMake(130, 120, 240, 40)];
    // self.viewResultColor.layer.cornerRadius = 5.0;
    self.viewResultColor.layer.backgroundColor = UIColor.lightGrayColor.CGColor;
    [self.view addSubview:_viewResultColor];
    
    
    self.textFieldRed = [[UITextField alloc] initWithFrame:CGRectMake(100, 200, 270, 40)];
    [self.textFieldRed setPlaceholder:@"0..255"];
    self.textFieldRed.layer.borderWidth = 1.0;
    self.textFieldRed.layer.cornerRadius = 5.0;
    self.textFieldRed.layer.borderColor = UIColor.lightGrayColor.CGColor;
    
    
    self.textFieldGreen = [[UITextField alloc] initWithFrame:CGRectMake(100, 280, 270, 40)];
    [self.textFieldGreen setPlaceholder:@"0..255"];
    self.textFieldGreen.layer.borderWidth = 1.0;
    self.textFieldGreen.layer.cornerRadius = 5.0;
    self.textFieldGreen.layer.borderColor = UIColor.lightGrayColor.CGColor;
    
    
    self.textFieldBlue = [[UITextField alloc] initWithFrame:CGRectMake(100, 360, 270, 40)];
    [self.textFieldBlue setPlaceholder:@"0..255"];
    self.textFieldBlue.layer.borderWidth = 1.0;
    self.textFieldBlue.layer.cornerRadius = 5.0;
    self.textFieldBlue.layer.borderColor = UIColor.lightGrayColor.CGColor;
    
    
    UIView *paddingRedView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
    _textFieldRed.leftView = paddingRedView;
    _textFieldRed.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingGreenView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
    _textFieldGreen.leftView = paddingGreenView;
    _textFieldGreen.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingBlueView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
    _textFieldBlue.leftView = paddingBlueView;
    _textFieldBlue.leftViewMode = UITextFieldViewModeAlways;
    
    
    [self.view addSubview:self.textFieldRed];
    [self.view addSubview:self.textFieldGreen];
    [self.view addSubview:self.textFieldBlue];
    
    
    
    self.labelResultColor = [[UILabel alloc] initWithFrame:CGRectMake(20, 120, 110, 40)];
    // self.labelResultColor.backgroundColor = UIColor.blackColor;
    self.labelResultColor.text = @"Color";
    //  self.labelResultColor.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.labelResultColor];
    
    self.labelRed = [[UILabel alloc] initWithFrame:CGRectMake(20, 200, 60, 40)];
    // self.labelRed.backgroundColor = UIColor.redColor;
    self.labelRed.text = @"RED";
    
    [self.view addSubview:self.labelRed];
    
    self.labelGreen = [[UILabel alloc] initWithFrame:CGRectMake(20, 280, 60, 40)];
    // self.labelGreen.backgroundColor = UIColor.greenColor;
    self.labelGreen.text = @"GREEN";
    [self.view addSubview:self.labelGreen];
    
    self.labelBlue = [[UILabel alloc] initWithFrame:CGRectMake(20, 360, 60, 40)];
    // self.labelBlue.backgroundColor = UIColor.blueColor;
    self.labelBlue.text = @"BLUE";
    [self.view addSubview:self.labelBlue];
    
    self.buttonProcess = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-40, 430, 80, 40)];
    //   self.buttonProcess.backgroundColor = UIColor.blackColor;
    [self.buttonProcess setTitle:@"Process"
                        forState:UIControlStateNormal];
    [self.buttonProcess setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:self.buttonProcess];
    
    [self.buttonProcess addTarget:self action:@selector(buttonTyped) forControlEvents:UIControlEventTouchUpInside];
    
    self.view.accessibilityIdentifier = @"mainView";
    self.textFieldRed.accessibilityIdentifier = @"textFieldRed";
    self.textFieldGreen.accessibilityIdentifier = @"textFieldGreen";
    self.textFieldBlue.accessibilityIdentifier = @"textFieldBlue";
    self.buttonProcess.accessibilityIdentifier = @"buttonProcess";
    self.labelRed.accessibilityIdentifier = @"labelRed";
    self.labelGreen.accessibilityIdentifier = @"labelGreen";
    self.labelBlue.accessibilityIdentifier = @"labelBlue";
    self.labelResultColor.accessibilityIdentifier = @"labelResultColor";
    self.viewResultColor.accessibilityIdentifier = @"viewResultColor";
    
    
    [self.textFieldRed addTarget:self action:@selector(redFieldTouched) forControlEvents:UIControlEventTouchDown];
    [self.textFieldGreen addTarget:self action:@selector(greenFieldTouched) forControlEvents:UIControlEventTouchDown];
    [self.textFieldBlue addTarget:self action:@selector(blueFieldTouched) forControlEvents:UIControlEventTouchDown];
    
}

-(void)buttonTyped{
    
    [self.view endEditing:YES];
    int red = [self.textFieldRed.text intValue];
    int green = [self.textFieldGreen.text intValue];
    int blue = [self.textFieldBlue.text intValue];
    
    if (self.textFieldRed.text.length == 0 || self.textFieldGreen.text.length == 0 || self.textFieldBlue.text.length == 0) {
        self.labelResultColor.text = @"Error";
        self.textFieldRed.text = @"";
        self.textFieldGreen.text = @"";
        self.textFieldBlue.text = @"";
        
        return;
    }
    
    
    for (int i = 0; i < self.textFieldRed.text.length; i++) {
        if ([self.textFieldRed.text characterAtIndex:i]>57 || [self.textFieldRed.text characterAtIndex:i]<48) {
            self.labelResultColor.text = @"Error";
            
            self.textFieldRed.text = @"";
            self.textFieldGreen.text = @"";
            self.textFieldBlue.text = @"";
            
            return;
        }
    }
    for (int i = 0; i < self.textFieldGreen.text.length; i++) {
        if ([self.textFieldGreen.text characterAtIndex:i]>57 || [self.textFieldGreen.text characterAtIndex:i]<48) {
            self.labelResultColor.text = @"Error";
            
            self.textFieldRed.text = @"";
            self.textFieldGreen.text = @"";
            self.textFieldBlue.text = @"";
            
            return;
        }
    }
    for (int i = 0; i < self.textFieldBlue.text.length; i++) {
        if ([self.textFieldBlue.text characterAtIndex:i]>57 || [self.textFieldBlue.text characterAtIndex:i]<48) {
            self.labelResultColor.text = @"Error";
            
            self.textFieldRed.text = @"";
            self.textFieldGreen.text = @"";
            self.textFieldBlue.text = @"";
            
            return;
        }
    }
    
    self.textFieldRed.text = @"";
    self.textFieldGreen.text = @"";
    self.textFieldBlue.text = @"";
    
    
    if (red<=255 && red>=0 && green<=255 && green>=0 && blue<=255 && blue>=0) {
        
        UIColor *color = [UIColor colorWithRed:red/255.f green:green/255.f blue:blue/255.f alpha:1];
        self.viewResultColor.backgroundColor = color;
        
        const CGFloat *components = CGColorGetComponents(color.CGColor);
        
        CGFloat r = components[0];
        CGFloat g = components[1];
        CGFloat b = components[2];
        
        NSString *resultColor =  [NSString stringWithFormat:@"%02lX%02lX%02lX",
                                  lroundf(r * 255),
                                  lroundf(g * 255),
                                  lroundf(b * 255)];
        NSString *resultString = [NSString stringWithFormat:@"0x%@", resultColor ];
        
        self.labelResultColor.text = resultString;
    }
    
    else
        self.labelResultColor.text = @"Error";
    
    
}

-(void)redFieldTouched{
    if (!([self.labelResultColor.text  isEqual: @"Color"])) {
        self.labelResultColor.text = @"Color";
    }
    NSLog(@"%@", self.labelResultColor.text);
    
    if ([self.labelResultColor.text isEqualToString:@"Color"]) {
        NSLog(@"BBBBBB");
    }
}

-(void)greenFieldTouched{
    if (!([self.labelResultColor.text  isEqual: @"Color"])) {
        self.labelResultColor.text = @"Color";
    }
}

-(void)blueFieldTouched{
    if (!([self.labelResultColor.text  isEqual: @"Color"])) {
        self.labelResultColor.text = @"Color";
    }
}

@end
