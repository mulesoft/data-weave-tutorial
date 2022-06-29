//This script transforms the data into the format the tutorial ui needs.

%dw 2.0
import * from dw::io::file::FileSystem
import * from dw::core::Strings
import * from dw::core::Arrays
import * from dw::core::URL

import dataFormatsDescriptor from dw::Runtime

output application/json

fun runtimeMediaTypeExtensions() = dataFormatsDescriptor() flatMap ((dfd) -> dfd.extensions)

var tutorialSpecificFiles = [ ".md", "hints", "inputs" ]
var acceptedFileTypes =  runtimeMediaTypeExtensions() ++ tutorialSpecificFiles
var root = wd() ++ "/src/main/docs"

fun isAccepted(str) = acceptedFileTypes some (str endsWith $)

fun isTitle(path) = path substringAfter root matches /(\/[\d\.]+\s+-\s+[^\/]+)+/

fun getFileName(str) = str substringAfterLast("/")

fun readFile(path) = trim(contentOf(path) as String {encoding: "UTF-8"})

fun getTutorials(path) = do {
	ls(path)
		filter isTitle($)
		orderBy $
		map do {
		    var path = $ substringAfter root
		    ---
    		{
                path: path,
                name: ($ splitBy "/")[-1],
                url: "https://github.com/mulesoft-labs/data-weave-tutorial/blob/master/src/main/docs"
                    ++ encodeURIComponent(path) ++ "/description.md",
                (getTutorialContent($)),
                children: getTutorials($)

		    }
		}
}

/**
  * Get the tutorial content in the directory (exclude files with the format "1.2.3 - Name")
  */
fun getTutorialContent(path) = do {
	var files = ls(path) filter (!isTitle($) and isAccepted($)) orderBy $
	---
	files reduce ((file, acc = {}) ->
		kindOf(file) match {
			case "File"   -> {(acc), (getFileName(file)): readFile(file)}
			case "Folder" -> {(acc), (getFileName(file)): getTutorialContent(file)}
		}
	) mapObject (value, key) -> {
		(key match {
			case "initial.dwl"              -> "initial"
			case "transform.dwl"            -> "transform"
			case "answer.md"                -> "answer"
			case "description.md"           -> "description"
			case x if (x startsWith "out.") -> "output"
			else                            -> key
		}): value
	}
}

---
getTutorials(root)