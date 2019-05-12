From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Sat, 11 May 2019 22:57:11 -0600
Subject: [PATCH] selftests: pidfd: Create .gitignore to include pidfd_test
Message-ID: <20190512045711.4507-1-skunberg.kelsey@gmail.com>

Create /selftests/pidfd/.gitignore which holds the following file name
created after compiling:

	- pidfd_test

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 tools/testing/selftests/pidfd/.gitignore | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 tools/testing/selftests/pidfd/.gitignore

diff --git a/tools/testing/selftests/pidfd/.gitignore b/tools/testing/selftests/pidfd/.gitignore
new file mode 100644
index 000000000000..822a1e63d045
--- /dev/null
+++ b/tools/testing/selftests/pidfd/.gitignore
@@ -0,0 +1 @@
+pidfd_test
--
2.20.1
