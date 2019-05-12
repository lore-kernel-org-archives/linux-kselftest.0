From: skunberg.kelsey@gmail.com (Kelsey Skunberg)
Date: Sat, 11 May 2019 23:04:52 -0600
Subject: [PATCH] selftests: drivers: Create .gitignore to include
 /dma-buf/udmabuf
Message-ID: <20190512050452.4720-1-skunberg.kelsey@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190512050452.rxPuDfazy7fCI8tMA4iN6TRi6pqDBdtO7-I6R5_g1ek@z>

Create /selftests/drivers/.gitignore which holds the following file name
created after compiling:

	- /dma-buf/udmabuf

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 tools/testing/selftests/drivers/.gitignore | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 tools/testing/selftests/drivers/.gitignore

diff --git a/tools/testing/selftests/drivers/.gitignore b/tools/testing/selftests/drivers/.gitignore
new file mode 100644
index 000000000000..f6aebcc27b76
--- /dev/null
+++ b/tools/testing/selftests/drivers/.gitignore
@@ -0,0 +1 @@
+/dma-buf/udmabuf
--
2.20.1
