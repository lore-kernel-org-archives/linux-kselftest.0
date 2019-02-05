From: tadeusz.struk@intel.com (Tadeusz Struk)
Date: Tue, 05 Feb 2019 12:28:39 -0800
Subject: [PATCH 2/2] selftests: tpm2: Extend tests to cover partial reads
In-Reply-To: <154939851385.18477.481518864800562919.stgit@tstruk-mobl1.jf.intel.com>
References: <154939851385.18477.481518864800562919.stgit@tstruk-mobl1.jf.intel.com>
Message-ID:
 <154939851969.18477.13778157467131576825.stgit@tstruk-mobl1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190205202839.Di7uYm28WPEhi1CWKgqCt2ZJgtKuRBrKOSyUGjCWaFo@z>

Three new tests added:
1. Send get random cmd, read header in 1st read, read the rest in second
   read - expect success
2. Send get random cmd, read only part of the response, send another
   get random command, read the response - expect success
3. Send get random cmd followed by another get random cmd, without
   reading the first response - expect the second cmd to fail with -EBUSY

Signed-off-by: Tadeusz Struk <tadeusz.struk at intel.com>
---
 tools/testing/selftests/tpm2/tpm2.py       |    1 
 tools/testing/selftests/tpm2/tpm2_tests.py |   82 ++++++++++++++++++++++++++++
 2 files changed, 83 insertions(+)

diff --git a/tools/testing/selftests/tpm2/tpm2.py b/tools/testing/selftests/tpm2/tpm2.py
index c2b9f2b1a0ac..828c18584624 100644
--- a/tools/testing/selftests/tpm2/tpm2.py
+++ b/tools/testing/selftests/tpm2/tpm2.py
@@ -22,6 +22,7 @@ TPM2_CC_UNSEAL = 0x015E
 TPM2_CC_FLUSH_CONTEXT = 0x0165
 TPM2_CC_START_AUTH_SESSION = 0x0176
 TPM2_CC_GET_CAPABILITY	= 0x017A
+TPM2_CC_GET_RANDOM = 0x017B
 TPM2_CC_PCR_READ = 0x017E
 TPM2_CC_POLICY_PCR = 0x017F
 TPM2_CC_PCR_EXTEND = 0x0182
diff --git a/tools/testing/selftests/tpm2/tpm2_tests.py b/tools/testing/selftests/tpm2/tpm2_tests.py
index 3bb066fea4a0..3f6a65cbdd39 100644
--- a/tools/testing/selftests/tpm2/tpm2_tests.py
+++ b/tools/testing/selftests/tpm2/tpm2_tests.py
@@ -158,6 +158,88 @@ class SmokeTest(unittest.TestCase):
             pass
         self.assertEqual(rejected, True)
 
+    def test_read_partial_resp(self):
+        """Reads random in two subsequent reads"""
+        log = logging.getLogger(__name__)
+        try:
+            fmt = '>HIIH'
+            cmd = struct.pack(fmt,
+                              tpm2.TPM2_ST_NO_SESSIONS,
+                              struct.calcsize(fmt),
+                              tpm2.TPM2_CC_GET_RANDOM,
+                              0x20)
+            self.client.tpm.write(cmd)
+            hdr = self.client.tpm.read(10)
+            sz = struct.unpack('>I', hdr[2:6])[0]
+            rsp = self.client.tpm.read()
+            log.debug("header:")
+            log.debug(tpm2.hex_dump(hdr))
+            log.debug("resp:")
+            log.debug(tpm2.hex_dump(rsp))
+        except:
+            log.debug("Error:", sys.exc_info()[0])
+            raise
+
+        self.assertEqual(sz, 10 + 2 + 32)
+        self.assertEqual(len(rsp), 2 + 32)
+
+    def test_read_partial_overwrite(self):
+        """Reads only part of the response and issue a new cmd"""
+        log = logging.getLogger(__name__)
+        try:
+            fmt = '>HIIH'
+            cmd = struct.pack(fmt,
+                              tpm2.TPM2_ST_NO_SESSIONS,
+                              struct.calcsize(fmt),
+                              tpm2.TPM2_CC_GET_RANDOM,
+                              0x20)
+            self.client.tpm.write(cmd)
+            # Read part of the respone
+            rsp1 = self.client.tpm.read(15)
+            log.debug("rsp 1:")
+            log.debug(tpm2.hex_dump(rsp1))
+
+            # Send a new cmd
+            self.client.tpm.write(cmd)
+
+            # Read the whole respone
+            rsp2 = self.client.tpm.read()
+            log.debug("rsp 2:")
+            log.debug(tpm2.hex_dump(rsp2))
+
+        except:
+            log.debug("Error:", sys.exc_info()[0])
+            raise
+
+        self.assertEqual(len(rsp1), 15)
+        self.assertEqual(len(rsp2), 10 + 2 + 32)
+
+    def test_send_two_cmds(self):
+        """Send two cmds without reading a response"""
+        rejected = False
+        try:
+            fmt = '>HIIH'
+            cmd = struct.pack(fmt,
+                              tpm2.TPM2_ST_NO_SESSIONS,
+                              struct.calcsize(fmt),
+                              tpm2.TPM2_CC_GET_RANDOM,
+                              0x20)
+            self.client.tpm.write(cmd)
+
+            # expect the second one to raise -EBUSY error
+            self.client.tpm.write(cmd)
+            rsp = self.client.tpm.read()
+
+        except IOError, e:
+            # read the response
+            rsp = self.client.tpm.read()
+            rejected = True
+            pass
+        except:
+            raise
+
+        self.assertEqual(rejected, True)
+
 class SpaceTest(unittest.TestCase):
     def setUp(self):
         logging.basicConfig(filename='SpaceTest.log', level=logging.DEBUG)
