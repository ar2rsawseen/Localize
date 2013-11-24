--[[
*************************************************************
 * This script is developed by Arturs Sosins aka ar2rsawseen, http://appcodingeasy.com
 * Feel free to distribute and modify code, but keep reference to its creator
 *
 * Gideros Localize class provides localization support for gideros, 
 * by loading string constants from specific files based on user locale.
 * This class also has function, that allows string formating printf style, 
 * and dynamic loading of language specific images (images with texts).
 *
 * For more information, examples and online documentation visit: 
 * http://appcodingeasy.com/Gideros-Mobile/Localization-in-Gideros
**************************************************************
]]--

--[[
	By default we use english text in our app
	if user has different locale and 
	there is a file available with that locale
	we will seamlessly use definitions from that file
]]

--we can set up some settings through public properties (optional)
Localize.path = "locales"
Localize.filetype = "lua"
Localize.changeLocale("ru_RU")

--overriding methods for non-native objects 
--(optional, if using non native objects)
--[[
	1st parameter - Object
	2nd parameter - method to override
	3rd parameter - index of method's parameter to check for localization
]]
Localize.load(TextWrap, "new", 1)


--all the rest is the default simple app
local font = TTFont.new("tahoma.ttf", 15, true)

--We can use simple text
local text = TextField.new(font, "This is a simple string")
text:setPosition(0,50)
stage:addChild(text)

--Or we can format string printf style
local text = TextField.new(font, string.format("Hello, %s", "Arturs"))
text:setPosition(0,20)
stage:addChild(text)

--We can also use non native objects, by overriding their constructors 
--as shown in the beginning of file
local text = TextWrap.new("Multi - line string\nFor TextWrap object", application:getContentWidth(), "center")
text:setFont(font)
text:setPosition(0,100)
stage:addChild(text)

AlertDialog.new("This is a simple string", "This is a simple string", "Cancel"):show()

--Same way we can use multiple language images
local button = Bitmap.new(Texture.new("images/start_en.png"))
button:setPosition(0, 150)
stage:addChild(button)


--it is also pretty easy to force other native or non native objects
--as sounds, urls and etc
--to use same localization option
--sounds
Localize.load(Sound, "new", 1)
--URLs
Localize.load(UrlLoader, "new", 1)
