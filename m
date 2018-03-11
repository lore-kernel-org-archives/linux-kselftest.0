From: adobriyan at gmail.com (Alexey Dobriyan)
Date: Sun, 11 Mar 2018 17:13:58 +0300
Subject: [PATCH] selftests: prevent carpal tunnel
Message-ID: <20180311141358.GA22705@avx2>

Shuah, please do

	ln -s tools/testing/selftests test

It will save a lot of typing for everyone over the years.

Signed-off-by: Alexey Dobriyan <adobriyan at gmail.com>
---

 test |    1 +
 1 file changed, 1 insertion(+)

new file mode 120000
--- /dev/null
+++ b/test
@@ -0,0 +1 @@
+tools/testing/selftests
\ No newline at end of file
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
