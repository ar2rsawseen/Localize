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

module("Localize", package.seeall)

--public properties
path = "locales"
filetype = "lua"

--local properties
local locale = application:getLocale()
local file
local data = {}

--initialziation
if filetype == "lua" then
	file = loadfile(path.."/"..locale.."."..filetype)
	if file then
		data = assert(file)()
	end
elseif filetype == "json" then
	file = io.open(path.."/"..locale.."."..filetype, "r")
	if file then
		data = Json.Decode(file:read( "*a" ))
	end
end

--public method for overriding methods
function load(object, func, indeces)
	if object ~= nil and object[func] ~= nil and object.__LCfunc == nil then
		object.__LCfunc = object[func]
		object[func] = function(...)
			local index
			if type(indeces) == "table" then
				for i = 1, #indeces do
					local index = indeces[i]
					arg[index] = data[arg[index]] or arg[index]
				end
			else
				arg[indeces] = data[arg[indeces]] or arg[indeces]
			end
			return object.__LCfunc(unpack(arg))
		end
	end
end

--overriding native objects
load(string, "format", 1)
load(TextField, "__new", 2)
load(Texture, "__new", 1)
load(AlertDialog, "__new", {1, 2, 3, 4, 5})
load(TextInputDialog, "__new", {1, 2, 3, 4, 5, 6})