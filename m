From: keescook at chromium.org (Kees Cook)
Date: Tue, 2 Apr 2019 15:26:10 -0700
Subject: [PATCH v3.1] selftests: Clean up module testing shell script
Message-ID: <20190402222610.GA15100@beast>

This adjusts kselftest_module.sh to take an option "args" argument for
modprobe arguments, removes bash-isms (since some system's /bin/sh may
not be bash), and refactors the lib/ scripts into a shorter calling
convention.

Signed-off-by: Kees Cook <keescook at chromium.org>
---
This is my suggested clean-up for the module testing script for the
strscpy_pad() series...
---
 tools/testing/selftests/kselftest_module.sh  | 24 ++++++++++++--------
 tools/testing/selftests/lib/bitmap.sh        | 17 +-------------
 tools/testing/selftests/lib/prime_numbers.sh | 17 ++------------
 tools/testing/selftests/lib/printf.sh        | 16 +------------
 tools/testing/selftests/lib/strscpy.sh       | 17 ++------------
 5 files changed, 20 insertions(+), 71 deletions(-)

diff --git a/tools/testing/selftests/kselftest_module.sh b/tools/testing/selftests/kselftest_module.sh
index b5d446738614..20a897d21fde 100755
--- a/tools/testing/selftests/kselftest_module.sh
+++ b/tools/testing/selftests/kselftest_module.sh
@@ -2,19 +2,20 @@
 # SPDX-License-Identifier: GPL-2.0+
 
 #
-# Runs an individual test module.  kselftest expects a separate
-# executable for each test.  So test should each have an individial
+# Runs an individual test module. kselftest expects a separate
+# executable for each test. So test should each have an individial
 # script that can call this script.
 #
 
 # Individual test scrits should define these:
 module=""			# filename (without the .ko).
 desc=""				# Output prefix.
+args=""				# modprobe arguments
 
 modprobe="/sbin/modprobe"
 
 main() {
-    parse_args $@
+    parse_args "$@"
     assert_root
     assert_have_module
     run_module
@@ -23,17 +24,20 @@ main() {
 parse_args() {
     script=${0##*/}
 
-    if [[ ! $# -eq 2 ]]; then
-	echo "Usage: $script <module_name> <description> [FAIL]"
+    if [ $# -lt 2 ]; then
+	echo "Usage: $script <description> <module_name> [FAIL]"
 	exit 1
     fi
 
-    module=$1
-    desc=$2
+    desc="$1"
+    shift || true
+    module="$1"
+    shift || true
+    args="$@"
 }
 
 assert_root() {
-    if [[ $EUID -ne 0 ]]; then
+    if [ ! -w /dev ]; then
 	skip "please run as root"
     fi
 }
@@ -45,7 +49,7 @@ assert_have_module() {
 }
 
 run_module() {
-    if $modprobe -q $module; then
+    if $modprobe -q $module $args; then
 	$modprobe -q -r $module
 	say "ok"
     else
@@ -72,4 +76,4 @@ skip() {
 #
 # Main script
 #
-main $@
+main "$@"
diff --git a/tools/testing/selftests/lib/bitmap.sh b/tools/testing/selftests/lib/bitmap.sh
index ed4180ea0021..5511dddc5c2d 100755
--- a/tools/testing/selftests/lib/bitmap.sh
+++ b/tools/testing/selftests/lib/bitmap.sh
@@ -1,18 +1,3 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
-
-module=test_bitmap
-description="bitmap"
-
-#
-# Shouldn't need to edit anything below here.
-#
-
-file="kselftest_module.sh"
-path="../$file"
-if [[ ! $KBUILD_SRC == "" ]]; then
-    path="${KBUILD_SRC}/tools/testing/selftests/$file"
-fi
-
-$path $module $description
-
+$(dirname $0)/../kselftest_module.sh "bitmap" test_bitmap
diff --git a/tools/testing/selftests/lib/prime_numbers.sh b/tools/testing/selftests/lib/prime_numbers.sh
index 6f782386d897..2b6be0308a6d 100755
--- a/tools/testing/selftests/lib/prime_numbers.sh
+++ b/tools/testing/selftests/lib/prime_numbers.sh
@@ -1,18 +1,5 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
 # Checks fast/slow prime_number generation for inconsistencies
-
-module=prime_numbers
-description="prime_numbers"
-
-#
-# Shouldn't need to edit anything below here.
-#
-
-file="kselftest_module.sh"
-path="../$file"
-if [[ ! $KBUILD_SRC == "" ]]; then
-    path="${KBUILD_SRC}/tools/testing/selftests/$file"
-fi
-
-$path $module $description
+$(dirname $0)/../kselftest_module.sh "prime numbers" prime_numbers \
+					selftest=65536
diff --git a/tools/testing/selftests/lib/printf.sh b/tools/testing/selftests/lib/printf.sh
index 89717915d028..2ffa61da0296 100755
--- a/tools/testing/selftests/lib/printf.sh
+++ b/tools/testing/selftests/lib/printf.sh
@@ -1,18 +1,4 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
 # Tests the printf infrastructure using test_printf kernel module.
-
-module=test_printf
-description="printf"
-
-#
-# Shouldn't need to edit anything below here.
-#
-
-file="kselftest_module.sh"
-path="../$file"
-if [[ ! $KBUILD_SRC == "" ]]; then
-    path="${KBUILD_SRC}/tools/testing/selftests/$file"
-fi
-
-$path $module $description
+$(dirname $0)/../kselftest_module.sh "printf" test_printf
diff --git a/tools/testing/selftests/lib/strscpy.sh b/tools/testing/selftests/lib/strscpy.sh
index f3ba4b90e602..1f26dac74896 100755
--- a/tools/testing/selftests/lib/strscpy.sh
+++ b/tools/testing/selftests/lib/strscpy.sh
@@ -1,17 +1,4 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0+
-
-module=test_strscpy
-description="strscpy"
-
-#
-# Shouldn't need to edit anything below here.
-#
-
-file="kselftest_module.sh"
-path="../$file"
-if [[ ! $KBUILD_SRC == "" ]]; then
-    path="${KBUILD_SRC}/tools/testing/selftests/$file"
-fi
-
-$path $module $description
+# Test corner cases of the strscpy()-family of functions.
+$(dirname $0)/../kselftest_module.sh "strscpy" test_strscpy
-- 
2.17.1


-- 
Kees Cook
