//
//  main.m
//  pbpaste-image
//  cli app for extracting image from clipboard and sending it to stdout as binary data
// compile with: gcc main.m -o pbpaste-image -ObjC -framework AppKit
//
//  Created by Ramiro Araujo on 2/20/14.
//  Copyright (c) 2014 Ramiro Araujo. All rights reserved.
//

#import <AppKit/AppKit.h>

int main(int argc, const char *argv[]) {

    @autoreleasepool {

        NSPasteboard *pasteBoard = [NSPasteboard generalPasteboard];
        NSImage *image = [[NSImage alloc] initWithPasteboard:pasteBoard];
        NSData *data = [NSBitmapImageRep
                representationOfImageRepsInArray:[image representations]
                                       usingType:NSPNGFileType
                                      properties:nil];

        NSFileHandle *handler = [NSFileHandle fileHandleWithStandardOutput];
        [handler writeData:data];
    }

    return 0;
}