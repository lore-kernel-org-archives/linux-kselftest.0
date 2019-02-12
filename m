From: tadeusz.struk at intel.com (Tadeusz Struk)
Date: Tue, 12 Feb 2019 15:42:05 -0800
Subject: [PATCH  v2 1/2] selftests/tpm2: Open tpm dev in unbuffered mode
Message-ID: <155001492513.13014.3572730050393346659.stgit@tstruk-mobl1.jf.intel.com>

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
