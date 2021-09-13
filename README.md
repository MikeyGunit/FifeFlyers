# iOS deployment

## Mikey:
1. Use '[Apple Connect](https://appstoreconnect.apple.com)' to make a new iOS build somehow: hover over the blue '+' on the right.
## Martin:
2. Open '/Users/mjgroves/development/project/FifeFlyers/ios/Runner.xcodeproj' in XCode.
3. Select TARGETS > Runner > General and change Version and Build to match the Apple Connect values.
4. MAKE SURE the Bundle Identifier is 'com.fifeflyers' (lower case). Close XCode.
4. cd /Users/mjgroves/development/project/FifeFlyers/
5. flutter build ipa
6. Double click on '/Users/mjgroves/development/project/FifeFlyers/build/ios/archive/Runner.xcarchive' to open in XCode.
7. Click 'Validate App' and HOLD ON TO YOUR BUTTS!
8. Hammer 'Next' and pray.
9. Click 'Distribute'.
