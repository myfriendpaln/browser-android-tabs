// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#import "ios/testing/earl_grey/matchers.h"

#if !defined(__has_feature) || !__has_feature(objc_arc)
#error "This file requires ARC support."
#endif

#if defined(CHROME_EARL_GREY_1)
#import <EarlGrey/EarlGrey.h>
#endif

#if defined(CHROME_EARL_GREY_2)
#import <AppFramework/EarlGreyApp.h>
#import <AppFramework/Matcher/GREYMatchersShorthand.h>
#endif

namespace testing {

id<GREYMatcher> ButtonWithAccessibilityLabel(NSString* label) {
  return grey_allOf(grey_accessibilityLabel(label),
                    grey_accessibilityTrait(UIAccessibilityTraitButton), nil);
}

id<GREYMatcher> ElementToDismissAlert(NSString* cancel_text) {
  UIUserInterfaceIdiom idiom = [[UIDevice currentDevice] userInterfaceIdiom];
  if (idiom == UIUserInterfaceIdiomPad) {
    // On iPad the context menu is dismissed by tapping on something
    // that isn't the popover. UIKit conveniently labels this element.
    return grey_accessibilityID(@"PopoverDismissRegion");
  } else {
    // On iPhone the context menu is dismissed by tapping on the "Cancel" item.
    return ButtonWithAccessibilityLabel(cancel_text);
  }
}

}  // namespace testing
