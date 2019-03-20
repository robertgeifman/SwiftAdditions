//
//  CTTextTabAdditions.swift
//  CoreTextAdditions
//
//  Created by C.W. Betts on 11/1/17.
//  Copyright © 2017 C.W. Betts. All rights reserved.
//

import Foundation
import CoreText.CTTextTab

extension CTTextTab {
	/// These constants specify text alignment.
	public typealias Alignment = CTTextAlignment
	
	/// Returns the Core Foundation type identifier for CoreText runs.
	///
	/// - returns: The identifier for the opaque type `CTTextTabRef`.
	public class var typeID: CFTypeID {
		return CTTextTabGetTypeID()
	}
	
	/// Creates and initializes a new text tab.
	/// - parameter alignment: The tab's alignment. This is used to determine the position
	/// of text inside the tab column. This parameter must be set to a valid
	/// `CTTextAlignment` value or this function will return `nil`.
	/// - parameter location: The tab's ruler location, relative to the back margin.
	/// - parameter options: Options to pass in when the tab is created. Currently, the
	/// only option available is `kCTTabColumnTerminatorsAttributeName`. This parameter is
	/// optional and can be set to `nil` if not needed.<br>
	/// Default is `nil`.
	/// - returns: The new CTTextTab.
	public static func create(alignment: Alignment, location: Double, options: [String: Any]? = nil) -> CTTextTab {
		return CTTextTabCreate(alignment, location, options as NSDictionary?)
	}
	
	/// The tab's text alignment value.
	public var alignment: Alignment {
		return CTTextTabGetAlignment(self)
	}
	
	/// The tab's ruler location relative to the back margin.
	public var location: Double {
		return CTTextTabGetLocation(self)
	}
	
	/// The dictionary of attributes associated with the tab or `nil` if
	/// no dictionary is present.
	public var options: [String: Any]? {
		return CTTextTabGetOptions(self) as NSDictionary? as? [String: Any]
	}
}
