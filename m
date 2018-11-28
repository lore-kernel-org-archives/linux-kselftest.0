From: brendanhiggins@google.com (Brendan Higgins)
Date: Wed, 28 Nov 2018 11:36:29 -0800
Subject: [RFC v3 12/19] kunit: add KUnit wrapper script and simple output
 parser
In-Reply-To: <20181128193636.254378-1-brendanhiggins@google.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
Message-ID: <20181128193636.254378-13-brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181128193629.kEyJ1MY2aUSxhFdUYWHcoFXx8ObefxyvUNM65cf7Sfo@z>

The KUnit wrapper script interfaces with the two modules
(kunit_config.py and kunit_kernel.py) and provides a command line
interface for running KUnit tests. This interface allows the caller to
specify options like test timeouts. The script handles configuring,
building and running the kernel and tests.

The output parser (kunit_parser.py) simply strips out all the output
from the kernel that is outputted as part of it's initialization
sequence. This ensures that only the output from KUnit is displayed
on the screen.

A full version of the output is written to test.log, or can be seen by
passing --raw_output to the wrapper script.

Signed-off-by: Felix Guo <felixguoxiuping at gmail.com>
Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
---
 tools/testing/kunit/kunit.py        | 40 +++++++++++++++++++++++++++++
 tools/testing/kunit/kunit_kernel.py |  3 +--
 tools/testing/kunit/kunit_parser.py | 24 +++++++++++++++++
 3 files changed, 65 insertions(+), 2 deletions(-)
 create mode 100755 tools/testing/kunit/kunit.py
 create mode 100644 tools/testing/kunit/kunit_parser.py

diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
new file mode 100755
index 0000000000000..1356be404996b
--- /dev/null
+++ b/tools/testing/kunit/kunit.py
@@ -0,0 +1,40 @@
+#!/usr/bin/python3
+# SPDX-License-Identifier: GPL-2.0
+
+# A thin wrapper on top of the KUnit Kernel
+
+import argparse
+import sys
+import os
+
+import kunit_config
+import kunit_kernel
+import kunit_parser
+
+parser = argparse.ArgumentParser(description='Runs KUnit tests.')
+
+parser.add_argument('--raw_output', help='don\'t format output from kernel',
+		    action='store_true')
+
+parser.add_argument('--timeout', help='maximum number of seconds to allow for '
+		    'all tests to run. This does not include time taken to '
+		    'build the tests.', type=int, default=300,
+		    metavar='timeout')
+
+cli_args = parser.parse_args()
+linux = kunit_kernel.LinuxSourceTree()
+
+success = linux.build_reconfig()
+if not success:
+	quit()
+
+print('Building KUnit Kernel ...')
+success = linux.build_um_kernel()
+if not success:
+	quit()
+
+print('Starting KUnit Kernel ...')
+if cli_args.raw_output:
+	kunit_parser.raw_output(linux.run_kernel(timeout=cli_args.timeout))
+else:
+	kunit_parser.parse_run_tests(linux.run_kernel(timeout=cli_args.timeout))
diff --git a/tools/testing/kunit/kunit_kernel.py b/tools/testing/kunit/kunit_kernel.py
index bba7ea7ca1869..623f25b16f6c8 100644
--- a/tools/testing/kunit/kunit_kernel.py
+++ b/tools/testing/kunit/kunit_kernel.py
@@ -116,8 +116,7 @@ class LinuxSourceTree(object):
 			return False
 		return True
 
-	def run_kernel(self, args=[]):
-		timeout = None
+	def run_kernel(self, args=[], timeout=None):
 		args.extend(['mem=256M'])
 		process = self._ops.linux_bin(args, timeout)
 		with open('test.log', 'w') as f:
diff --git a/tools/testing/kunit/kunit_parser.py b/tools/testing/kunit/kunit_parser.py
new file mode 100644
index 0000000000000..1dff3adb73bd3
--- /dev/null
+++ b/tools/testing/kunit/kunit_parser.py
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: GPL-2.0
+
+import re
+
+kunit_start_re = re.compile('console .* enabled')
+kunit_end_re = re.compile('List of all partitions:')
+
+def isolate_kunit_output(kernel_output):
+	started = False
+	for line in kernel_output:
+		if kunit_start_re.match(line):
+			started = True
+		elif kunit_end_re.match(line):
+			break
+		elif started:
+			yield line
+
+def raw_output(kernel_output):
+	for line in kernel_output:
+		print(line)
+
+def parse_run_tests(kernel_output):
+	for output in isolate_kunit_output(kernel_output):
+		print(output)
-- 
2.20.0.rc0.387.gc7a69e6b6c-goog
