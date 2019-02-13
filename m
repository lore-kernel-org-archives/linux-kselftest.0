From: tadeusz.struk@intel.com (Tadeusz Struk)
Date: Wed, 13 Feb 2019 08:39:28 -0800
Subject: [PATCH  v2] selftests/tpm2: Open tpm dev in unbuffered mode
Message-ID:
 <155007596864.18677.9373151400257566077.stgit@tstruk-mobl1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190213163928.00doTgrygWy_4lFZ8YhD3g87jJ9L5xrPMljWnkj5KAM@z>

In order to have control over how many bytes are read or written
the device needs to be opened in unbuffered mode.

Signed-off-by: Tadeusz Struk <tadeusz.struk at intel.com>
---

v2:
- Changed subject tags to selftests/tpm2:
---
 tools/testing/selftests/tpm2/tpm2.py |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/tpm2/tpm2.py b/tools/testing/selftests/tpm2/tpm2.py
index 40ea95ce2ead..c2b9f2b1a0ac 100644
--- a/tools/testing/selftests/tpm2/tpm2.py
+++ b/tools/testing/selftests/tpm2/tpm2.py
@@ -357,9 +357,9 @@ class Client:
         self.flags = flags
 
         if (self.flags & Client.FLAG_SPACE) == 0:
-            self.tpm = open('/dev/tpm0', 'r+b')
+            self.tpm = open('/dev/tpm0', 'r+b', buffering=0)
         else:
-            self.tpm = open('/dev/tpmrm0', 'r+b')
+            self.tpm = open('/dev/tpmrm0', 'r+b', buffering=0)
 
     def close(self):
         self.tpm.close()
