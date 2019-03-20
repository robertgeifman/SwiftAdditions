//
//  CTFontCollectionAdditions.swift
//  SSAMacRendering
//
//  Created by C.W. Betts on 10/19/17.
//  Copyright © 2017 C.W. Betts. All rights reserved.
//

import Foundation
import CoreText.CTFontCollection

// Nothing to do here, move along

extension CTFontCollection {
	/// Returns the Core Foundation type identifier for CoreText font collections.
	///
	/// - returns: The identifier for the opaque type `CTFontCollectionRef`.
	public class var typeID: CFTypeID {
		return CTFontCollectionGetTypeID()
	}
}

//extension CTMutableFontCollection {
//
//}
