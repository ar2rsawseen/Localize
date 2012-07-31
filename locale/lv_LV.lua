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

local l = {}
l["This is a simple string"] = "Tas ir parasts teksts"
l["Hello, %s"] = "Sveiki, %s"
l["Multi - line string\nFor TextWrap object"] = "Multi - līniju teksts\nPriekš TextWrap objekta"
l["images/start_en.png"] = "images/start_lv.png"
return l