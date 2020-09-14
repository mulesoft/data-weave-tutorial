/**
* This runner executes all the DataWeave Integration Test under a given folder
*/
%dw 2.0

import ls, nameOf, contentOf, mimeTypeOf, baseNameOf, path,toUrl, kindOf, wd from dw::io::file::FileSystem
import createTestCases from dw::test::internal::DWITUtils
import * from dw::test::Tests
var directory = dw::Runtime::prop("docsDir") default path(wd() , "src/main/docs")

fun createTutorialTests(docsDirectory:String) = do {
  ls(docsDirectory)
        orderBy ((chapter, index) -> nameOf(chapter))
        flatMap ((chapter, index) -> do {
          createTestCases(
              chapter,
              (mappingDir: String, testCase: String) -> do {
                toUrl(path(mappingDir, testCase , "transform.dwl"))
              }
          )
  })
}
---
describedBy("Validate tutorial test",
        createTutorialTests(directory)
)

