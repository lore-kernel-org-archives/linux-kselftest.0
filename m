From: brendanhiggins@google.com (Brendan Higgins)
Date: Wed,  1 May 2019 16:01:22 -0700
Subject: [PATCH v2 13/17] kunit: defconfig: add defconfigs for building KUnit
 tests
In-Reply-To: <20190501230126.229218-1-brendanhiggins@google.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
Message-ID: <20190501230126.229218-14-brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190501230122.7S-qXH12jb6QWeca30AB0fqkw97mRGDga_Pnnz-_Af4@z>

Add defconfig for UML and a fragment that can be used to configure other
architectures for building KUnit tests. Add option to kunit_tool to use
a defconfig to create the kunitconfig.

Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
---
 arch/um/configs/kunit_defconfig              |  8 ++++++++
 tools/testing/kunit/configs/all_tests.config |  8 ++++++++
 tools/testing/kunit/kunit.py                 | 17 +++++++++++++++--
 tools/testing/kunit/kunit_kernel.py          |  3 ++-
 4 files changed, 33 insertions(+), 3 deletions(-)
 create mode 100644 arch/um/configs/kunit_defconfig
 create mode 100644 tools/testing/kunit/configs/all_tests.config

diff --git a/arch/um/configs/kunit_defconfig b/arch/um/configs/kunit_defconfig
new file mode 100644
index 0000000000000..bfe49689038f1
--- /dev/null
+++ b/arch/um/configs/kunit_defconfig
@@ -0,0 +1,8 @@
+CONFIG_OF=y
+CONFIG_OF_UNITTEST=y
+CONFIG_OF_OVERLAY=y
+CONFIG_I2C=y
+CONFIG_I2C_MUX=y
+CONFIG_KUNIT=y
+CONFIG_KUNIT_TEST=y
+CONFIG_KUNIT_EXAMPLE_TEST=y
diff --git a/tools/testing/kunit/configs/all_tests.config b/tools/testing/kunit/configs/all_tests.config
new file mode 100644
index 0000000000000..bfe49689038f1
--- /dev/null
+++ b/tools/testing/kunit/configs/all_tests.config
@@ -0,0 +1,8 @@
+CONFIG_OF=y
+CONFIG_OF_UNITTEST=y
+CONFIG_OF_OVERLAY=y
+CONFIG_I2C=y
+CONFIG_I2C_MUX=y
+CONFIG_KUNIT=y
+CONFIG_KUNIT_TEST=y
+CONFIG_KUNIT_EXAMPLE_TEST=y
diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
index 7413ec7351a20..63e9fb3b60200 100755
--- a/tools/testing/kunit/kunit.py
+++ b/tools/testing/kunit/kunit.py
@@ -11,6 +11,7 @@ import argparse
 import sys
 import os
 import time
+import shutil
 
 import kunit_config
 import kunit_kernel
@@ -36,14 +37,26 @@ parser.add_argument('--build_dir',
 		    'directory.',
 		    type=str, default=None, metavar='build_dir')
 
-cli_args = parser.parse_args()
+parser.add_argument('--defconfig',
+		    help='Uses a default kunitconfig.',
+		    action='store_true')
 
-linux = kunit_kernel.LinuxSourceTree()
+def create_default_kunitconfig():
+	if not os.path.exists(kunit_kernel.KUNITCONFIG_PATH):
+		shutil.copyfile('arch/um/configs/kunit_defconfig',
+				kunit_kernel.KUNITCONFIG_PATH)
+
+cli_args = parser.parse_args()
 
 build_dir = None
 if cli_args.build_dir:
 	build_dir = cli_args.build_dir
 
+if cli_args.defconfig:
+	create_default_kunitconfig()
+
+linux = kunit_kernel.LinuxSourceTree()
+
 config_start = time.time()
 success = linux.build_reconfig(build_dir)
 config_end = time.time()
diff --git a/tools/testing/kunit/kunit_kernel.py b/tools/testing/kunit/kunit_kernel.py
index 07c0abf2f47df..bf38768353313 100644
--- a/tools/testing/kunit/kunit_kernel.py
+++ b/tools/testing/kunit/kunit_kernel.py
@@ -14,6 +14,7 @@ import os
 import kunit_config
 
 KCONFIG_PATH = '.config'
+KUNITCONFIG_PATH = 'kunitconfig'
 
 class ConfigError(Exception):
 	"""Represents an error trying to configure the Linux kernel."""
@@ -81,7 +82,7 @@ class LinuxSourceTree(object):
 
 	def __init__(self):
 		self._kconfig = kunit_config.Kconfig()
-		self._kconfig.read_from_file('kunitconfig')
+		self._kconfig.read_from_file(KUNITCONFIG_PATH)
 		self._ops = LinuxSourceTreeOperations()
 
 	def clean(self):
-- 
2.21.0.593.g511ec345e18-goog
