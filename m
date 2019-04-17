From: skhan at linuxfoundation.org (Shuah Khan)
Date: Wed, 17 Apr 2019 17:34:03 -0600
Subject: [PATCH v2] doc: kselftest: Fix KBUILD_OUTPUT usage instructions
Message-ID: <20190417233403.29854-1-skhan@linuxfoundation.org>

Fix KBUILD_OUTPUT usage instructions. The current documentation is
incorrect. Update and fix outdated information about summary option.
Add a reference to kselftest wiki for additional information on the
framework and tips on writing new tests.

Signed-off-by: Shuah Khan <skhan at linuxfoundation.org>
---
Changes since v1:
-- Fixed the confusing language about output directory
-- Updated outdated instructions on summary option.
-- Regenerated patch with current email address.

 Documentation/dev-tools/kselftest.rst | 42 ++++++++++++++++++---------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
index c8c03388b9de..25604904fa6e 100644
--- a/Documentation/dev-tools/kselftest.rst
+++ b/Documentation/dev-tools/kselftest.rst
@@ -7,6 +7,11 @@ directory. These are intended to be small tests to exercise individual code
 paths in the kernel. Tests are intended to be run after building, installing
 and booting a kernel.
 
+You can find additional information on Kselftest framework, how to
+write new tests using the framework on Kselftest wiki:
+
+https://kselftest.wiki.kernel.org/
+
 On some systems, hot-plug tests could hang forever waiting for cpu and
 memory to be ready to be offlined. A special hot-plug target is created
 to run the full range of hot-plug tests. In default mode, hot-plug tests run
@@ -35,17 +40,32 @@ To build and run the tests with a single command, use::
 
 Note that some tests will require root privileges.
 
-Build and run from user specific object directory (make O=dir)::
+Kselftest supports saving output files in a separate directory and then
+running tests. To locate output files in a separate directory two syntaxes
+are supported. In both cases the working directory must be the root of the
+kernel src. This is applicable to "Running a subset of selftests" section
+below.
+
+To build, save output files in a separate directory with O= ::
 
   $ make O=/tmp/kselftest kselftest
 
-Build and run KBUILD_OUTPUT directory (make KBUILD_OUTPUT=)::
+To build, save output files in a separate directory with KBUILD_OUTPUT ::
+
+  $ export KBUILD_OUTPUT=/tmp/kselftest; make kselftest
 
-  $ make KBUILD_OUTPUT=/tmp/kselftest kselftest
+The O= assignment takes precedence over the KBUILD_OUTPUT environment
+variable.
 
-The above commands run the tests and print pass/fail summary to make it
-easier to understand the test results. Please find the detailed individual
-test results for each test in /tmp/testname file(s).
+The above commands by default run the tests and print full pass/fail report.
+Kselftest supports "summary" option to make it easier to understand the test
+results. Please find the detailed individual test results for each test in
+/tmp/testname file(s) when summary option is specified. This is applicable
+to "Running a subset of selftests" section below.
+
+To run kselftest with summary option enabled ::
+
+  $ make summary=1 kselftest
 
 Running a subset of selftests
 =============================
@@ -61,17 +81,13 @@ You can specify multiple tests to build and run::
 
   $  make TARGETS="size timers" kselftest
 
-Build and run from user specific object directory (make O=dir)::
+To build, save output files in a separate directory with O= ::
 
   $ make O=/tmp/kselftest TARGETS="size timers" kselftest
 
-Build and run KBUILD_OUTPUT directory (make KBUILD_OUTPUT=)::
-
-  $ make KBUILD_OUTPUT=/tmp/kselftest TARGETS="size timers" kselftest
+To build, save output files in a separate directory with KBUILD_OUTPUT ::
 
-The above commands run the tests and print pass/fail summary to make it
-easier to understand the test results. Please find the detailed individual
-test results for each test in /tmp/testname file(s).
+  $ export KBUILD_OUTPUT=/tmp/kselftest; make TARGETS="size timers" kselftest
 
 See the top-level tools/testing/selftests/Makefile for the list of all
 possible targets.
-- 
2.17.1
