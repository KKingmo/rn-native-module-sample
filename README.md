# React Native & Native Module

RN에서 Native Module 만들어 쓰는 sample

---

- https://reactnative.dev/docs/native-modules-intro
  
- Android 네이티브에 모듈 만들어 쓰기
  - https://reactnative.dev/docs/native-modules-android
  - app 수준 `build.gradle`에 dependency 추가
    - `classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:${project.ext.kotlinVersion}")`
  - `android/app/src/main/java/[...]`에서 모듈생성
    - `ReactContextBaseJavaModule`을 상속받는 클래스 정의
    - `@ReactMethod` 어노테이션이 있는 메서드를 생성해 Js에서 호출 가능하게 한다.
  - `android/app/src/main/java/[...]`에서 패키지 생성
    - `ReactPackage`를 구현하는 클래스 생성
  - `android/app/src/main/java/[...]/MainApplication.java`에서 패키지 추가
    - `List<ReactPackage> packages = new PackageList(this).getPackages();`에서  
    `packages.add(new AwesomePackage())`

- iOS 네이티브에 모듈 만들어 쓰기
  - https://reactnative.dev/docs/native-modules-ios
  - iOS app 수준 root 경로에 `Module` swift 파일과 `Module-Bridging-Header` 파일 생성
  - `ios/RnSample1-Bridging-Header.h`
    ```h
    //
    //  Use this file to import your target's public headers that you would like to expose to Swift.
    //

    #import <React/RCTBridgeModule.h>
    ```
  - `ios/CalculatorModule.swift`에서 함수 구현
    ```swift
    import Foundation

    @objc(CalculatorModule)
    class CalculatorModule:NSObject {
        @objc(executeCalc:numberA:numberB:resolver:rejector:)
        public func executaeCalc() -> Void{}
    }
    ```
  - `ios/CalculatorModuleBridge.m` swift 파일 컨버팅 위한 objectiv-c 파일 생성
    ```objc
    //
    //  CalculatorModuleBridge.m
    //  RnSample1
    //
    //  Created by GoodBlock on 2023/10/31.
    //

    #import <React/RCTBridgeModule.h>

    @interface RCT_EXTERN_MODULE(CalculatorModule, NSObject)

    RCT_EXTERN_METHOD(executeCalc: (NSString *) action
        numberA: (int) numberA
        numberB: (int) numberB
        resolver: (RCTPromiseResolveBlock) resolve
        rejector: (RCTPromiseRejectBlock) reject)
    @end
    ```
- rn에서 가져다 쓰기
  - [NativeFunctionUtil](./utils/NativeCalculatorUtils.ts)
    
  - [Using](./App.tsx)
