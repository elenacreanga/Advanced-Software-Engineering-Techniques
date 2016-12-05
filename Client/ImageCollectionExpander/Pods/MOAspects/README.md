# MOAspects

MOAspects is AOP library for iOS.

## Version

### 1.0.0

Stable version for Objective-C language.

### 2.x.x

Development version

## How To Get Started

### Podfile

```
pod 'MOAspects'
```

## Interface

### MOAspect.h

```objc
// hook instance method
+ (BOOL)hookInstanceMethodForClass:(Class)clazz
                          selector:(SEL)selector
                   aspectsPosition:(MOAspectsPosition)aspectsPosition
                        usingBlock:(id)block;

// hook class method
+ (BOOL)hookClassMethodForClass:(Class)clazz
                       selector:(SEL)selector
                aspectsPosition:(MOAspectsPosition)aspectsPosition
                     usingBlock:(id)block;
```

## How to use

### Hook class method example

```objc
[MOAspects hookClassMethodForClass:[NSNumber class]
                          selector:@selector(numberWithInt:)
                   aspectsPosition:MOAspectsPositionBefore
                        usingBlock:^(id class, int intVar){
                            NSLog(@"hooked %d number!", intVar);
                        }];

[NSNumber numberWithInt:10]; // -> hooked 10 number!
```

### Hook instance method example

```objc
[MOAspects hookInstanceMethodForClass:[NSString class]
                             selector:@selector(length)
                      aspectsPosition:MOAspectsPositionBefore
                           usingBlock:^(NSString *string){
                               NSLog(@"hooked %@!", string);
                           }];

[@"abcde" length]; // -> hooked abcde!
```

## Spec table

|**32bit**|**64bit**|**Can Hook<br>Method Type**|**Class<br>Hierarchy Hook**|**Hook<br>Return Value**|**Natural<br>Swift Method**|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| ○ | ○ | Instance / Class | Supported | Not supported | Not supported |
