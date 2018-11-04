From: rdunlap@infradead.org (Randy Dunlap)
Date: Sun, 4 Nov 2018 14:06:23 -0800
Subject: [PATCH resend] Documentation/dev-tools: clean up kselftest.rst
Message-ID: <67201746-13c6-2b05-7f3d-2b200e4d9af0@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181104220623.3FghBxnLsEHvl8bZuAmubVlHw2-peI8fxbH2V5f5dAo@z>

From: Randy Dunlap <rdunlap@infradead.org>

This is a small cleanup to kselftest.rst:

- Fix some language typos in the usage instructions.
- Change one non-ASCII space to an ASCII space.

Signed-off-by: Randy Dunlap <rdunlap at infradead.org>
Cc: Shuah Khan <shuah at kernel.org>
Cc: Jonathan Corbet <corbet at lwn.net>
Cc: linux-kselftest at vger.kernel.org
Cc: linux-doc at vger.kernel.org
---
 Documentation/dev-tools/kselftest.rst |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

--- linux-next-20181101.orig/Documentation/dev-tools/kselftest.rst
+++ linux-next-20181101/Documentation/dev-tools/kselftest.rst
@@ -9,7 +9,7 @@ and booting a kernel.
 
 On some systems, hot-plug tests could hang forever waiting for cpu and
 memory to be ready to be offlined. A special hot-plug target is created
-to run full range of hot-plug tests. In default mode, hot-plug tests run
+to run the full range of hot-plug tests. In default mode, hot-plug tests run
 in safe mode with a limited scope. In limited mode, cpu-hotplug test is
 run on a single cpu as opposed to all hotplug capable cpus, and memory
 hotplug test is run on 2% of hotplug capable memory instead of 10%.
@@ -89,9 +89,9 @@ Note that some tests will require root p
 Install selftests
 =================
 
-You can use kselftest_install.sh tool installs selftests in default
-location which is tools/testing/selftests/kselftest or a user specified
-location.
+You can use the kselftest_install.sh tool to install selftests in the
+default location, which is tools/testing/selftests/kselftest, or in a
+user specified location.
 
 To install selftests in default location::
 
@@ -109,7 +109,7 @@ Running installed selftests
 Kselftest install as well as the Kselftest tarball provide a script
 named "run_kselftest.sh" to run the tests.
 
-You can simply do the following to run the installed Kselftests. Please
+You can simply do the following to run the installed Kselftests. Please
 note some tests will require root privileges::
 
    $ cd kselftest
@@ -139,7 +139,7 @@ Contributing new tests (details)
    default.
 
    TEST_CUSTOM_PROGS should be used by tests that require custom build
-   rule and prevent common build rule use.
+   rules and prevent common build rule use.
 
    TEST_PROGS are for test shell scripts. Please ensure shell script has
    its exec bit set. Otherwise, lib.mk run_tests will generate a warning.
