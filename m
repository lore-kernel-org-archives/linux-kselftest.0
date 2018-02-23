From: shuahkh@osg.samsung.com (Shuah Khan)
Date: Fri, 23 Feb 2018 15:11:40 -0700
Subject: [PATCH 5/5] selftests: futex Makefile add top level TAP header echo
 to RUN_TESTS
In-Reply-To: <cover.1519423340.git.shuahkh@osg.samsung.com>
References: <cover.1519423340.git.shuahkh@osg.samsung.com>
Message-ID:
 <bec2e6c01cbf3b2f6dc49e022a2a7543fc7f3182.1519423341.git.shuahkh@osg.samsung.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180223221140.hCndkiUJUQf_pBz2sI8ws7UjlEWl9B2EbdBOnqPn7vA@z>

Add top level TAP header echo, testname and separator line to make
the output consistent with the common run_tests target.

Signed-off-by: Shuah Khan <shuahkh at osg.samsung.com>
---
 tools/testing/selftests/futex/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/futex/Makefile b/tools/testing/selftests/futex/Makefile
index cea4adcd42b8..3e9a9d7b4de1 100644
--- a/tools/testing/selftests/futex/Makefile
+++ b/tools/testing/selftests/futex/Makefile
@@ -18,6 +18,9 @@ all:
 	done
 
 override define RUN_TESTS
+	@echo "TAP version 13";
+	@echo "selftests: futex";
+	@echo "========================================";
 	@cd $(OUTPUT); ./run.sh
 endef
 
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
