/**
* This runner executes all the DataWeave Integration Test under a given folder
*/
%dw 2.0

import path, toUrl, wd from dw::io::file::FileSystem
import createTestCases from dw::test::internal::DWITUtils
import * from dw::test::Tests
var directory = dw::Runtime::prop("landingDir") default path(wd() , "src/main/landing")

---
describedBy("Validate landing examples test",
    createTestCases(
        directory,
        (mappingDir: String, testCase: String) -> do {
            var url = toUrl(path(mappingDir, testCase , "transform.dwl"))
            ---
            {
                content: readUrl(url, "text") as String,
                url: url
            }
      }
    )
)