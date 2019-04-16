From: shuah@kernel.org (Shuah Khan)
Date: Tue, 16 Apr 2019 08:26:51 -0600
Subject: [PATCH] doc: kselftest: Fix KBUILD_OUTPUT usage instructions
Message-ID: <20190416142651.7048-1-shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190416142651.-4kEpz0xAVWo5IKBl69bCBqHOIYX6MI9k_gQ827-3bo@z>

Fix KBUILD_OUTPUT usage instructions. The current documentation
is incorrect.

Signed-off-by: Shuah Khan <shuah at kernel.org>
---
 Documentation/dev-tools/kselftest.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
index c8c03388b9de..6c910ddaa9f9 100644
--- a/Documentation/dev-tools/kselftest.rst
+++ b/Documentation/dev-tools/kselftest.rst
@@ -39,9 +39,9 @@ Build and run from user specific object directory (make O=dir)::
 
   $ make O=/tmp/kselftest kselftest
 
-Build and run KBUILD_OUTPUT directory (make KBUILD_OUTPUT=)::
+Build and run from KBUILD_OUTPUT directory (make KBUILD_OUTPUT=)::
 
-  $ make KBUILD_OUTPUT=/tmp/kselftest kselftest
+  $ export KBUILD_OUTPUT=/tmp/kselftest; make kselftest
 
 The above commands run the tests and print pass/fail summary to make it
 easier to understand the test results. Please find the detailed individual
@@ -65,9 +65,9 @@ Build and run from user specific object directory (make O=dir)::
 
   $ make O=/tmp/kselftest TARGETS="size timers" kselftest
 
-Build and run KBUILD_OUTPUT directory (make KBUILD_OUTPUT=)::
+Build and run from KBUILD_OUTPUT directory (make KBUILD_OUTPUT=)::
 
-  $ make KBUILD_OUTPUT=/tmp/kselftest TARGETS="size timers" kselftest
+  $ export KBUILD_OUTPUT=/tmp/kselftest; make TARGETS="size timers" kselftest
 
 The above commands run the tests and print pass/fail summary to make it
 easier to understand the test results. Please find the detailed individual
-- 
2.17.1
