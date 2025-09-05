#!/bin/bash
set -e

echo ">>> Install Flutter SDK"
git clone https://github.com/flutter/flutter.git -b stable --depth 1 $HOME/flutter
export PATH="$HOME/flutter/bin:$PATH"

flutter --version
flutter pub get
flutter build web --release

echo "/* /index.html 200" > build/web/_redirects
