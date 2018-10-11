//
//  SAMacError.swift
//  SwiftAdditions
//
//  Created by C.W. Betts on 10/10/18.
//  Copyright © 2018 C.W. Betts. All rights reserved.
//

import Foundation

#if SWIFT_PACKAGE

/// Common Carbon error codes
///
/// This list is in no way, shape, or form exhaustive! A lot of the other
/// errors make no sense under Mac OS X but were needed for pre-OS X systems.
public struct SAMacError: _BridgedStoredNSError {
	public let _nsError: NSError

	public init(_nsError: NSError) {
		self._nsError = _nsError
	}
	
	public static var errorDomain: String { return NSOSStatusErrorDomain }
	
	/// Common Carbon error codes
	///
	/// This list is in no way, shape, or form exhaustive! A lot of the other
	/// errors make no sense under Mac OS X but were needed for pre-OS X systems.
	public enum Code: RawRepresentable, _ErrorCodeProtocol {
		public typealias _ErrorType = SAMacError
		
		/*! error in user parameter list */
		case parameter = -50
		
		/*! unimplemented core routine */
		case unimplemented = -4
		
		/*! File not found */
		case fileNotFound = -43
		
		/*! permissions error (on file open) */
		case filePermission = -54
		
		/*! too many files open */
		case tooManyFilesOpen = -42
		
		/*! Not enough room in heap zone */
		case memoryFull = -108
		
		/*! File not open */
		case fileNotOpen = -38
		
		/*! End of file */
		case endOfFile = -39
		
		/*! tried to position to before start of file (r/w) */
		case filePosition = -40
	}
	
	/*! error in user parameter list */
	public static var parameter: SAMacError.Code { return .parameter }
	
	/*! unimplemented core routine */
	public static var unimplemented: SAMacError.Code { return .unimplemented }
	
	/*! File not found */
	public static var fileNotFound: SAMacError.Code { return .fileNotFound }
	
	/*! permissions error (on file open) */
	public static var filePermission: SAMacError.Code { return .filePermission }
	
	/*! too many files open */
	public static var tooManyFilesOpen: SAMacError.Code { return .tooManyFilesOpen }
	
	/*! Not enough room in heap zone */
	public static var memoryFull: SAMacError.Code { return .memoryFull }
	
	/*! File not open */
	public static var fileNotOpen: SAMacError.Code { return .fileNotOpen }
	
	/*! End of file */
	public static var endOfFile: SAMacError.Code { return .endOfFile }
	
	/*! tried to position to before start of file (r/w) */
	public static var filePosition: SAMacError.Code { return .filePosition }
}
#endif