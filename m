From: linuxram at us.ibm.com (Ram Pai)
Date: Tue, 17 Jul 2018 06:49:08 -0700
Subject: [PATCH v14 05/22] selftests/vm: Make gcc check arguments of
 sigsafe_printf()
In-Reply-To: <1531835365-32387-1-git-send-email-linuxram@us.ibm.com>
References: <1531835365-32387-1-git-send-email-linuxram@us.ibm.com>
Message-ID: <1531835365-32387-6-git-send-email-linuxram@us.ibm.com>

From: Thiago Jung Bauermann <bauerman at linux.ibm.com>

This will help us ensure we print pkey_reg_t values correctly in different
architectures.

Signed-off-by: Thiago Jung Bauermann <bauerman at linux.ibm.com>
---
 tools/testing/selftests/vm/pkey-helpers.h |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/tools/testing/selftests/vm/pkey-helpers.h b/tools/testing/selftests/vm/pkey-helpers.h
index 3ed2f02..7f18a82 100644
--- a/tools/testing/selftests/vm/pkey-helpers.h
+++ b/tools/testing/selftests/vm/pkey-helpers.h
@@ -27,6 +27,10 @@
 #define DPRINT_IN_SIGNAL_BUF_SIZE 4096
 extern int dprint_in_signal;
 extern char dprint_in_signal_buffer[DPRINT_IN_SIGNAL_BUF_SIZE];
+
+#ifdef __GNUC__
+__attribute__((format(printf, 1, 2)))
+#endif
 static inline void sigsafe_printf(const char *format, ...)
 {
 	va_list ap;
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
