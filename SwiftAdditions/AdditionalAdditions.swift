//
//  AdditionalAdditions.swift
//  SwiftAdditions
//
//  Created by C.W. Betts on 11/2/14.
//  Copyright (c) 2014 C.W. Betts. All rights reserved.
//

import Foundation

/// Best used for tuples of the same type, which Swift converts fixed-sized C arrays into.
/// Will crash if any type in the mirror doesn't match `X`.
public func getArrayFromMirror<X>(mirror: MirrorType) -> [X] {
	var anArray = [X]()
	for i in 0..<mirror.count {
		let aChar = mirror[i].1.value as! X
		anArray.append(aChar)
	}
	
	return anArray
}

/// Best used for a fixed-size C array that expects to be NULL-terminated, like a C string.
public func getArrayFromMirror<X>(mirror: MirrorType, appendLastObject lastObj: X) -> [X] {
	var anArray: [X] = getArrayFromMirror(mirror)
	anArray.append(lastObj)
	return anArray
}

///Useful to force a closure to run on the main thread, but you don't know if you *are* on the main thread.
///
///This assumes that `NSThread`'s main thread is the same as GCD's main queue.
public func runOnMainThreadSync(block: dispatch_block_t) {
	if NSThread.isMainThread() {
		block()
	} else {
		dispatch_sync(dispatch_get_main_queue(), block)
	}
}

///Runs the closure on the main thread immediately on the main thread if ran from the main thread, or queues it on the main Dispatch queue if on another thread.
///
///This assumes that `NSThread`'s main thread is the same as GCD's main queue.
public func runOnMainThreadAsync(block: dispatch_block_t) {
	if NSThread.isMainThread() {
		block()
	} else {
		dispatch_async(dispatch_get_main_queue(), block)
	}
}


// Code taken from http://stackoverflow.com/a/24052094/1975001
public func +=<K, V> (inout left: Dictionary<K, V>, right: Dictionary<K, V>) {
	for (k, v) in right {
		left.updateValue(v, forKey: k)
	}
}

///Adds two dictionaries together, returning the result.
///Any value in both `left` and `right`, the value in `right` is used.
public func + <K,V>(left: Dictionary<K,V>, right: Dictionary<K,V>)
	-> Dictionary<K,V>
{
	var map = Dictionary<K,V>()
	for (k, v) in left {
		map[k] = v
	}
	for (k, v) in right {
		map[k] = v
	}
	return map
}

// MARK: - Array additions

/// Removes objects in an array that are in the specified `NSIndexSet`.
/// Returns objects that were removed.
public func removeObjects<T>(inout inArray anArray: Array<T>, atIndexes indexes: NSIndexSet) -> [T] {
	return anArray.removeAtIndexes(indexes)
}

/// Removes objects in an array that are in the specified integer array.
/// Returns objects that were removed.
public func removeObjects<T>(inout inArray anArray: Array<T>, atIndexes indexes: [Int]) -> [T] {
	return anArray.removeAtIndexes(indexes)
}

/// Removes objects in an array that are in the specified integer set.
/// Returns objects that were removed.
public func removeObjects<T>(inout inArray anArray: Array<T>, atIndexes indexes: Set<Int>) -> [T] {
	return anArray.removeAtIndexes(indexes)
}

extension Array {
	// Code taken from http://stackoverflow.com/a/26174259/1975001
	mutating func removeAtIndexes(indexes: NSIndexSet) -> [T] {
		var toRet = [T]()
		for var i = indexes.lastIndex; i != NSNotFound; i = indexes.indexLessThanIndex(i) {
			toRet.append(self.removeAtIndex(i))
		}
		
		return toRet
	}
	
	///Internally creates an index set so there are no duplicates.
	mutating func removeAtIndexes(ixs:[Int]) -> [T] {
		var idxSet = NSMutableIndexSet()
		for i in ixs {
			idxSet.addIndex(i)
		}
		return removeAtIndexes(idxSet)
	}
	
	mutating func removeAtIndexes(ixs: Set<Int>) -> [T] {
		var idxSet = NSMutableIndexSet()
		for i in ixs {
			idxSet.addIndex(i)
		}
		return removeAtIndexes(idxSet)
	}
}

///Sort a Swift array using an array of `NSSortDescriptor`.
///
///This may be expensive, in both memory and computation!
public func sortedArray(anArray: [AnyObject], usingDescriptors descriptors: [NSSortDescriptor]) -> [AnyObject] {
	let sortedArray = (anArray as NSArray).sortedArrayUsingDescriptors(descriptors)
	
	return sortedArray
}
