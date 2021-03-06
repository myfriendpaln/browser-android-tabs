// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef UI_KEYBOARD_TEST_TEST_KEYBOARD_LAYOUT_DELEGATE_H_
#define UI_KEYBOARD_TEST_TEST_KEYBOARD_LAYOUT_DELEGATE_H_

#include "base/macros.h"
#include "ui/keyboard/keyboard_layout_delegate.h"

namespace aura {
class Window;
};

namespace keyboard {

class TestKeyboardLayoutDelegate : public KeyboardLayoutDelegate {
 public:
  // |root_window| is the window that is always returned by the
  // KeyboardLayoutDelegate methods.
  explicit TestKeyboardLayoutDelegate(aura::Window* root_window);
  ~TestKeyboardLayoutDelegate() override = default;

  // Overridden from keyboard::KeyboardLayoutDelegate
  aura::Window* GetContainerForDefaultDisplay() override;
  aura::Window* GetContainerForDisplay(
      const display::Display& display) override;

 private:
  aura::Window* root_window_;

  DISALLOW_COPY_AND_ASSIGN(TestKeyboardLayoutDelegate);
};

}  // namespace keyboard

#endif  // UI_KEYBOARD_TEST_TEST_KEYBOARD_LAYOUT_DELEGATE_H_
