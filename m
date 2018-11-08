From: joel@joelfernandes.org (Joel Fernandes (Google))
Date: Wed,  7 Nov 2018 20:15:37 -0800
Subject: [PATCH v3 resend 2/2] selftests/memfd: Add tests for
 F_SEAL_FUTURE_WRITE seal
In-Reply-To: <20181108041537.39694-1-joel@joelfernandes.org>
References: <20181108041537.39694-1-joel@joelfernandes.org>
Message-ID: <20181108041537.39694-2-joel@joelfernandes.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181108041537.QM_gLALwQkcKihp_jLP_L8-0UbBlbNBdLlfab2_lusU@z>

Add tests to verify sealing memfds with the F_SEAL_FUTURE_WRITE works as
expected.

Cc: dancol at google.com
Cc: minchan at kernel.org
Reviewed-by: John Stultz <john.stultz at linaro.org>
Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
---
 tools/testing/selftests/memfd/memfd_test.c | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/tools/testing/selftests/memfd/memfd_test.c b/tools/testing/selftests/memfd/memfd_test.c
index 10baa1652fc2..32b207ca7372 100644
--- a/tools/testing/selftests/memfd/memfd_test.c
+++ b/tools/testing/selftests/memfd/memfd_test.c
@@ -692,6 +692,79 @@ static void test_seal_write(void)
 	close(fd);
 }
 
+/*
+ * Test SEAL_FUTURE_WRITE
+ * Test whether SEAL_FUTURE_WRITE actually prevents modifications.
+ */
+static void test_seal_future_write(void)
+{
+	int fd;
+	void *p;
+
+	printf("%s SEAL-FUTURE-WRITE\n", memfd_str);
+
+	fd = mfd_assert_new("kern_memfd_seal_future_write",
+			    mfd_def_size,
+			    MFD_CLOEXEC | MFD_ALLOW_SEALING);
+
+	p = mfd_assert_mmap_shared(fd);
+
+	mfd_assert_has_seals(fd, 0);
+	/* Not adding grow/shrink seals makes the future write
+	 * seal fail to get added
+	 */
+	mfd_fail_add_seals(fd, F_SEAL_FUTURE_WRITE);
+
+	mfd_assert_add_seals(fd, F_SEAL_GROW);
+	mfd_assert_has_seals(fd, F_SEAL_GROW);
+
+	/* Should still fail since shrink seal has
+	 * not yet been added
+	 */
+	mfd_fail_add_seals(fd, F_SEAL_FUTURE_WRITE);
+
+	mfd_assert_add_seals(fd, F_SEAL_SHRINK);
+	mfd_assert_has_seals(fd, F_SEAL_GROW |
+				 F_SEAL_SHRINK);
+
+	/* Now should succeed, also verifies that the seal
+	 * could be added with an existing writable mmap
+	 */
+	mfd_assert_add_seals(fd, F_SEAL_FUTURE_WRITE);
+	mfd_assert_has_seals(fd, F_SEAL_SHRINK |
+				 F_SEAL_GROW |
+				 F_SEAL_FUTURE_WRITE);
+
+	/* read should pass, writes should fail */
+	mfd_assert_read(fd);
+	mfd_fail_write(fd);
+
+	munmap(p, mfd_def_size);
+	close(fd);
+
+	/* Test adding all seals (grow, shrink, future write) at once */
+	fd = mfd_assert_new("kern_memfd_seal_future_write2",
+			    mfd_def_size,
+			    MFD_CLOEXEC | MFD_ALLOW_SEALING);
+
+	p = mfd_assert_mmap_shared(fd);
+
+	mfd_assert_has_seals(fd, 0);
+	mfd_assert_add_seals(fd, F_SEAL_SHRINK |
+				 F_SEAL_GROW |
+				 F_SEAL_FUTURE_WRITE);
+	mfd_assert_has_seals(fd, F_SEAL_SHRINK |
+				 F_SEAL_GROW |
+				 F_SEAL_FUTURE_WRITE);
+
+	/* read should pass, writes should fail */
+	mfd_assert_read(fd);
+	mfd_fail_write(fd);
+
+	munmap(p, mfd_def_size);
+	close(fd);
+}
+
 /*
  * Test SEAL_SHRINK
  * Test whether SEAL_SHRINK actually prevents shrinking
@@ -945,6 +1018,7 @@ int main(int argc, char **argv)
 	test_basic();
 
 	test_seal_write();
+	test_seal_future_write();
 	test_seal_shrink();
 	test_seal_grow();
 	test_seal_resize();
-- 
2.19.1.930.g4563a0d9d0-goog
