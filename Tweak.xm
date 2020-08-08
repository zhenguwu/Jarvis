@interface SiriActivationService
+ (SiriActivationService *)service;
- (void)activationRequestFromSimpleActivation:(long long)arg1;
@end
 

@interface PLExpandedPlatterPresentationView : UIView
//@property (nonatomic,assign) BOOL isJarvis;
//@property (assign,nonatomic) id delegate;
//- (void)setDelegate:(id)arg1;
//- (void)_handleDismissButton:(id)arg1 ;
//-(void)_configureExpandedPlatterViewIfNecessary;
- (void)_dismissExpandedPlatterWithTrigger:(long long)arg1;
@end

@interface PLExpandedPlatterView : UIView
@property (nonatomic,assign) BOOL isJarvis;
- (void)setTitle:(NSString *)arg1;
@end

%hook PLExpandedPlatterView
%property (nonatomic,assign) BOOL isJarvis;
-(void)setTitle:(NSString *)arg1 {
	if ([arg1 isEqualToString:@"SETTINGS"]) {
		[[%c(SiriActivationService) service] activationRequestFromSimpleActivation:0];
		self.isJarvis = YES;
	} else {
		self.isJarvis = NO;
	}
	%orig;
}
-(void)layoutSubviews {
	if (self.isJarvis) {
		UIView *window = self.superview.superview.superview.superview;
		if (window && !window.hidden) {
			window.hidden = YES;
		}
	}
	//for (UIView *subview in self.superview.superview.superview.superview.subviews) {
		//subview.alpha = 0;
		//subview.userInteractionEnabled = YES;
	//}
	
	PLExpandedPlatterPresentationView *presView = (PLExpandedPlatterPresentationView *)self.superview.superview;
	if (presView) {
		RLog(@"removing");
		[presView _dismissExpandedPlatterWithTrigger:4];
	}
	/*
	if (self.superview.superview.superview.superview.userInteractionEnabled) {
		RLog(@"enabled");
	} else {
		self.superview.superview.superview.superview.userInteractionEnabled = YES;
		RLog(@"disabled");
	}*/
	//self.superview.superview.superview.alpha = 0;
	//self.superview.superview.superview.userInteractionEnabled = NO;
	%orig;
}

%end
