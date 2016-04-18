package com.adobe {
	/**
	 * @author harbs
	 */
	public class CSInterface {
		
		
		//------------------------------ CSInterface ----------------------------------

/**
 * @class CSInterface
 * This is the entry point to the CEP extensibility infrastructure.
 * Instantiate this object and use it to:
 * <ul>
 * <li>Access information about the host application in which an extension is running</li>
 * <li>Launch an extension</li>
 * <li>Register interest in event notifications, and dispatch events</li>
 * </ul>
 *
 * @return A new \c CSInterface object
 */
function CSInterface()
{
}

/**
 * User can add this event listener to handle native application theme color changes.
 * Callback function gives extensions ability to fine-tune their theme color after the
 * global theme color has been changed.
 * The callback function should be like below:
 *
 * @example
 * // event is a CSEvent object, but user can ignore it.
 * function OnAppThemeColorChanged(event)
 * {
 *    // Should get a latest HostEnvironment object from application.
 *    var skinInfo = JSON.parse(window.__adobe_cep__.getHostEnvironment()).appSkinInfo;
 *    // Gets the style information such as color info from the skinInfo,
 *    // and redraw all UI controls of your extension according to the style info.
 * }
 */
static public const THEME_COLOR_CHANGED_EVENT:String = "com.adobe.csxs.events.ThemeColorChanged";

/** The host environment data object. */
public var hostEnvironment:HostEnvironment;

/** Retrieves information about the host environment in which the
 *  extension is currently running.
 *
 *   @return A \c #HostEnvironment object.
 */
public function getHostEnvironment():HostEnvironment{return null;}

/** Closes this extension. */
public function closeExtensionfunction():void{}

/**
 * Retrieves a path for which a constant is defined in the system.
 *
 * @param pathType The path-type constant defined in \c #SystemPath ,
 *
 * @return The platform-specific system path string.
 */
public function getSystemPath(pathType:String):String{return "";}

/**
 * Evaluates a JavaScript script, which can use the JavaScript DOM
 * of the host application.
 *
 * @param script    The JavaScript script.
 * @param callback  Optional. A callback function that receives the result of execution.
 *          If execution fails, the callback function receives the error message \c EvalScript_ErrMessage.
 */
public function evalScript(script:String, callback:Function=null):void{}

/**
 * Retrieves the unique identifier of the application.
 * in which the extension is currently running.
 *
 * @return The unique ID string.
 */
public function getApplicationID():String{return "";}

/**
 * Retrieves host capability information for the application
 * in which the extension is currently running.
 *
 * @return A \c #HostCapabilities object.
 */
public function getHostCapabilities():HostCapabilities{return null;}

/**
 * Triggers a CEP event programmatically. Yoy can use it to dispatch
 * an event of a predefined type, or of a type you have defined.
 *
 * @param event A \c CSEvent object.
 */
public function dispatchEvent(event:CSEvent):void{}

/**
 * Registers an interest in a CEP event of a particular type, and
 * assigns an event handler.
 * The event infrastructure notifies your extension when events of this type occur,
 * passing the event object to the registered handler function.
 *
 * @param type     The name of the event type of interest.
 * @param listener The JavaScript handler function or method.
 * @param obj      Optional, the object containing the handler method, if any.
 *         Default is null.
 */
public function addEventListener(type:String, listener:Function, obj:Object=null):void{}

/**
 * Removes a registered event listener.
 *
 * @param type      The name of the event type of interest.
 * @param listener  The JavaScript handler function or method that was registered.
 * @param obj       Optional, the object containing the handler method, if any.
 *          Default is null.
 */
public function removeEventListener(type:String, listener:Function, obj:Object=null):void{}

/**
 * Loads and launches another extension, or activates the extension if it is already loaded.
 *
 * @param extensionId       The extension's unique identifier.
 * @param startupParams     Not currently used, pass "".
 *
 * @example
 * To launch the extension "help" with ID "HLP" from this extension, call:
 * <code>requestOpenExtension("HLP", ""); </code>
 *
 */
public function requestOpenExtension(extensionId:String, params:String=""):void{}

/**
 * Retrieves the list of extensions currently loaded in the current host application.
 * The extension list is initialized once, and remains the same during the lifetime
 * of the CEP session.
 *
 * @param extensionIds  Optional, an array of unique identifiers for extensions of interest.
 *          If omitted, retrieves data for all extensions.
 *
 * @return Zero or more \c #Extension objects.
 */
public function getExtensions(extensionIds:Array=null):Array{return null;}

/**
 * Retrieves network-related preferences.
 *
 * @return A JavaScript object containing network preferences.
 */
public function getNetworkPreferences():NetworkPreferences{return null;}

/**
 * Initializes the resource bundle for this extension with property values
 * for the current application and locale.
 * To support multiple locales, you must define a property file for each locale,
 * containing keyed display-string values for that locale.
 * See localization documentation for Extension Builder and related products.
 *
 * Keys can be in the
 * form <code>key.value="localized string"</code>, for use in HTML text elements.
 * For example, in this input element, the localized \c key.value string is displayed
 * instead of the empty \c value string:
 *
 * <code><input type="submit" value="" data-locale="key"/></code>
 *
 * @return An object containing the resource bundle information.
 */
public function initResourceBundle():Object{return null;}

/**
 * Writes installation information to a file.
 *
 * @return The file path.
 */
public function dumpInstallationInfo():String{return "";}

/**
 * Retrieves version information for the current Operating System,
 * See http://www.useragentstring.com/pages/Chrome/ for Chrome \c navigator.userAgent values.
 *
 * @return A string containing the OS version, or "unknown Operation System".
 * If user customizes the User Agent by setting CEF command parameter "--user-agent", only
 * "Mac OS X" or "Windows" will be returned. 
 */
public function getOSInformation():String{return "";}

/**
 * Opens a page in the default system browser.
 *
 * Since 4.2.0
 *
 * @param url  The URL of the page/file to open, or the email address.
 * Must use HTTP/HTTPS/file/mailto protocol. For example:
 *   "http://www.adobe.com"
 *   "https://github.com"
 *   "file:///C:/log.txt"
 *   "mailto:test@adobe.com"
 *
 * @return One of these error codes:\n
 *      <ul>\n
 *          <li>NO_ERROR - 0</li>\n
 *          <li>ERR_UNKNOWN - 1</li>\n
 *          <li>ERR_INVALID_PARAMS - 2</li>\n
 *          <li>ERR_INVALID_URL - 201</li>\n
 *      </ul>\n
 */
public function openURLInDefaultBrowser(url:String):int{return 0;}

/**
 * Retrieves extension ID.
 *
 * Since 4.2.0
 *
 * @return extension ID.
 */
public function getExtensionID():String{return "";}

/**
 * Retrieves the scale factor of screen. 
 * On Windows platform, the value of scale factor might be different from operating system's scale factor,
 * since host application may use its self-defined scale factor.
 *
 * Since 4.2.0
 *
 * @return One of the following float number.
 *      <ul>\n
 *          <li> -1.0 when error occurs </li>\n
 *          <li> 1.0 means normal screen </li>\n
 *          <li> >1.0 means HiDPI screen </li>\n
 *      </ul>\n
 */
public function getScaleFactor():Number{return 0;}

/**
 * Set a handler to detect any changes of scale factor. This only works on Mac.
 *
 * Since 4.2.0
 *
 * @param handler   The function to be called when scale factor is changed.
 *
 */
public function setScaleFactorChangedHandler(handler:Function):void{}

/**
 * Retrieves current API version.
 *
 * Since 4.2.0
 *
 * @return ApiVersion object.
 *
 */
public function getCurrentApiVersion():ApiVersion{return null;}

/**
 * Set panel flyout menu by an XML.
 *
 * Since 5.2.0
 *
 * Register a callback function for "com.adobe.csxs.events.flyoutMenuClicked" to get notified when a 
 * menu item is clicked.
 * The "data" attribute of event is an object which contains "menuId" and "menuName" attributes. 
 *
 * Register callback functions for "com.adobe.csxs.events.flyoutMenuOpened" and "com.adobe.csxs.events.flyoutMenuClosed"
 * respectively to get notified when flyout menu is opened or closed.
 *
 * @param menu     A XML string which describes menu structure.
 * An example menu XML:
 * <Menu>
 *   <MenuItem Id="menuItemId1" Label="TestExample1" Enabled="true" Checked="false"/>
 *   <MenuItem Label="TestExample2">
 *     <MenuItem Label="TestExample2-1" >
 *       <MenuItem Label="TestExample2-1-1" Enabled="false" Checked="true"/>
 *     </MenuItem>
 *     <MenuItem Label="TestExample2-2" Enabled="true" Checked="true"/>
 *   </MenuItem>
 *   <MenuItem Label="---" />
 *   <MenuItem Label="TestExample3" Enabled="false" Checked="false"/>
 * </Menu>
 *
 */
public function setPanelFlyoutMenu(menu:String):void{}

/**
 * Updates a menu item in the extension window's flyout menu, by setting the enabled
 * and selection status.
 *  
 * Since 5.2.0
 *
 * @param menuItemLabel	The menu item label. 
 * @param enabled		True to enable the item, false to disable it (gray it out).
 * @param checked		True to select the item, false to deselect it.
 *
 * @return false when the host application does not support this functionality (HostCapabilities.EXTENDED_PANEL_MENU is false). 
 *         Fails silently if menu label is invalid.
 *
 * @see HostCapabilities.EXTENDED_PANEL_MENU
 */
public function updatePanelMenuItem(menuItemLabel:String, enabled:Boolean, checked:Boolean):void{}


/**
 * Set context menu by XML string.
 *
 * Since 5.2.0
 *
 * There are a number of conventions used to communicate what type of menu item to create and how it should be handled.
 * - an item without menu ID or menu name is disabled and is not shown.
 * - if the item name is "---" (three hyphens) then it is treated as a separator. The menu ID in this case will always be NULL.
 * - Checkable attribute takes precedence over Checked attribute.
 * - a PNG icon. For optimal display results please supply a 16 x 16px icon as larger dimensions will increase the size of the menu item. 
     The Chrome extension contextMenus API was taken as a reference. 
     https://developer.chrome.com/extensions/contextMenus
 * - the items with icons and checkable items cannot coexist on the same menu level. The former take precedences over the latter.
 *
 * @param menu      A XML string which describes menu structure.
 * @param callback  The callback function which is called when a menu item is clicked. The only parameter is the returned ID of clicked menu item.
 *
 * @description An example menu XML:
 * <Menu>
 *   <MenuItem Id="menuItemId1" Label="TestExample1" Enabled="true" Checkable="true" Checked="false" Icon="./image/small_16X16.png"/>
 *   <MenuItem Id="menuItemId2" Label="TestExample2">
 *     <MenuItem Id="menuItemId2-1" Label="TestExample2-1" >
 *       <MenuItem Id="menuItemId2-1-1" Label="TestExample2-1-1" Enabled="false" Checkable="true" Checked="true"/>
 *     </MenuItem>
 *     <MenuItem Id="menuItemId2-2" Label="TestExample2-2" Enabled="true" Checkable="true" Checked="true"/>
 *   </MenuItem>
 *   <MenuItem Label="---" />
 *   <MenuItem Id="menuItemId3" Label="TestExample3" Enabled="false" Checkable="true" Checked="false"/>
 * </Menu>
 */
public function setContextMenu(menu:String, callback:Function):void{}

/**
 * Set context menu by JSON string.
 *
 * Since 6.0.0
 *
 * There are a number of conventions used to communicate what type of menu item to create and how it should be handled.
 * - an item without menu ID or menu name is disabled and is not shown.
 * - if the item label is "---" (three hyphens) then it is treated as a separator. The menu ID in this case will always be NULL.
 * - Checkable attribute takes precedence over Checked attribute.
 * - a PNG icon. For optimal display results please supply a 16 x 16px icon as larger dimensions will increase the size of the menu item. 
     The Chrome extension contextMenus API was taken as a reference.
 * - the items with icons and checkable items cannot coexist on the same menu level. The former take precedences over the latter.
     https://developer.chrome.com/extensions/contextMenus
 *
 * @param menu      A JSON string which describes menu structure.
 * @param callback  The callback function which is called when a menu item is clicked. The only parameter is the returned ID of clicked menu item.
 *
 * @description An example menu JSON:
 *
 * { 
 *      "menu": [
 *          {
 *              "id": "menuItemId1",
 *              "label": "testExample1",
 *              "enabled": true,
 *              "checkable": true,
 *              "checked": false,
 *              "icon": "./image/small_16X16.png"
 *          },
 *          {
 *              "id": "menuItemId2",
 *              "label": "testExample2",
 *              "menu": [
 *                  {
 *                      "id": "menuItemId2-1",
 *                      "label": "testExample2-1",
 *                      "menu": [
 *                          {
 *                              "id": "menuItemId2-1-1",
 *                              "label": "testExample2-1-1",
 *                              "enabled": false,
 *                              "checkable": true,
 *                              "checked": true
 *                          }
 *                      ]
 *                  },
 *                  {
 *                      "id": "menuItemId2-2",
 *                      "label": "testExample2-2",
 *                      "enabled": true,
 *                      "checkable": true,
 *                      "checked": true
 *                  }
 *              ]
 *          },
 *          {
 *              "label": "---"
 *          },
 *          {
 *              "id": "menuItemId3",
 *              "label": "testExample3",
 *              "enabled": false,
 *              "checkable": true,
 *              "checked": false
 *          }
 *      ]
 *  }
 *
 */
public function setContextMenuByJSON(menu:String, callback:Function):void{}

/**
 * Updates a context menu item by setting the enabled and selection status.
 *  
 * Since 5.2.0
 *
 * @param menuItemID	The menu item ID. 
 * @param enabled		True to enable the item, false to disable it (gray it out).
 * @param checked		True to select the item, false to deselect it.
 */
public function updateContextMenuItem(menuItemID:String, enabled:Boolean, checked:Boolean):void{}

/**
 * Get the visibility status of an extension window. 
 *  
 * Since 6.0.0
 *
 * @return true if the extension window is visible; false if the extension window is hidden.
 */
public function isWindowVisible():Boolean{return true;}

/**
 * Resize extension's content to the specified dimensions.
 * 1. Works with modal and modeless extensions in all Adobe products.
 * 2. Extension's manifest min/max size constraints apply and take precedence. 
 * 3. For panel extensions
 *    3.1 This works in all Adobe products except:
 *        * Premiere Pro
 *        * Prelude
 *        * After Effects
 *    3.2 When the panel is in certain states (especially when being docked),
 *        it will not change to the desired dimensions even when the
 *        specified size satisfies min/max constraints.
 *
 * Since 6.0.0
 *
 * @param width  The new width
 * @param height The new height
 */
public function resizeContent(width:Number, height:Number):void{}

/**
 * Register the invalid certificate callback for an extension. 
 * This callback will be triggered when the extension tries to access the web site that contains the invalid certificate on the main frame.
 * But if the extension does not call this function and tries to access the web site containing the invalid certificate, a default error page will be shown.
 *  
 * Since 6.1.0
 *
 * @param callback the callback function
 */
public function registerInvalidCertificateCallback(callback:Function):void{}

/**
 * Register an interest in some key events to prevent them from being sent to the host application.
 *
 * This function works with modeless extensions and panel extensions. 
 * Generally all the key events will be sent to the host application for these two extensions if the current focused element
 * is not text input or dropdown,
 * If you want to intercept some key events and want them to be handled in the extension, please call this function
 * in advance to prevent them being sent to the host application.
 *
 * Since 6.1.0
 *
 * @param keyEventsInterest      A JSON string describing those key events you are interested in. A null object or
                                 an empty string will lead to removing the interest
 *
 * This JSON string should be an array, each object has following keys:
 *
 * keyCode:  [Required] represents an OS system dependent virtual key code identifying
 *           the unmodified value of the pressed key.
 * ctrlKey:  [optional] a Boolean that indicates if the control key was pressed (true) or not (false) when the event occurred.
 * altKey:   [optional] a Boolean that indicates if the alt key was pressed (true) or not (false) when the event occurred.
 * shiftKey: [optional] a Boolean that indicates if the shift key was pressed (true) or not (false) when the event occurred.
 * metaKey:  [optional] (Mac Only) a Boolean that indicates if the Meta key was pressed (true) or not (false) when the event occurred.
 *                      On Macintosh keyboards, this is the command key. To detect Windows key on Windows, please use keyCode instead.
 * An example JSON string:
 *
 * [
 *     {
 *         "keyCode": 48
 *     },
 *     {
 *         "keyCode": 123,
 *         "ctrlKey": true
 *     },
 *     {
 *         "keyCode": 123,
 *         "ctrlKey": true,
 *         "metaKey": true
 *     }
 * ]
 *
 */
public function registerKeyEventsInterest(keyEventsInterest:String):void{}

/**
 * Set the title of the extension window. 
 * This function works with modal and modeless extensions in all Adobe products, and panel extensions in Photoshop, InDesign, InCopy, Illustrator, Flash Pro and Dreamweaver.
 *
 * Since 6.1.0
 *
 * @param title The window title.
 */
public function setWindowTitle(title:String):void{}

/**
 * Get the title of the extension window. 
 * This function works with modal and modeless extensions in all Adobe products, and panel extensions in Photoshop, InDesign, InCopy, Illustrator, Flash Pro and Dreamweaver.
 *
 * Since 6.1.0
 *
 * @return The window title.
 */
public function getWindowTitle():String{return "";}

	}
}
