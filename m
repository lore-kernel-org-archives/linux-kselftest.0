Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B033535A385;
	Tue, 30 Jun 2026 07:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804862; cv=none; b=OYbRFlWRRmYF/bOQ6N4pdpW67OkN/oVS7vcdy6gNoVpAVce+GKdzoX0Y8N+I8xPS951TzIWzFs2tZqUry9y4nHKObMEjsf88r9LszLOGkDs4jculK3KyJwvhNeAyI2Xw4u6Ox+LJmHJW8Or9ym0g7Bs1u7FM21BXUp7/DAR9NR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804862; c=relaxed/simple;
	bh=n7SEmrNf7oYBmWM7AqdM+cz0amqbl0zRVVHo50J9kyY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dn+XXGAwpJSZuvwDxXOx3TbOEbhbjRHOKbWvBP+yJJkSYfTyTb3rZH+2ZICkydYgQmOON1ESA8PSRHUUMMIQWTBnwtymxn4NLAL3GEk75TvNsQ+i1cCW266ldN/YxMcCoWVITw6bMNy5jmgmbobGNxL5ggSSV3ON47zHnRziaOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 179ee70e745611f1aa26b74ffac11d73-20260630
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED
	SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS
	GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:04617b6e-cf63-45c2-81cf-32594c716f18,IP:10,
	URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-15
X-CID-INFO: VERSION:1.3.12,REQID:04617b6e-cf63-45c2-81cf-32594c716f18,IP:10,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-15
X-CID-META: VersionHash:e7bac3a,CLOUDID:92df87033c42f1984fbd1a7615302497,BulkI
	D:260629183422FGLNVMMC,BulkQuantity:1,Recheck:0,SF:10|38|66|78|81|82|102|1
	27|850|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,B
	ulk:41,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:
	0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 179ee70e745611f1aa26b74ffac11d73-20260630
X-User: lihongfu@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <lihongfu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 952539749; Tue, 30 Jun 2026 15:34:13 +0800
From: Hongfu Li <lihongfu@kylinos.cn>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	keith.lucas@oracle.com,
	kevin.brodsky@arm.com,
	maddy@linux.ibm.com,
	usama.anjum@collabora.com,
	yury.khrustalev@arm.com,
	jhubbard@nvidia.com,
	joey.gouly@arm.com,
	zwisler@google.com,
	hongfu.li@linux.dev,
	Hongfu Li <lihongfu@kylinos.cn>
Subject: [PATCH v8 2/5] selftests/mm: unify pkey sighandler selftest assertions and tracing
Date: Tue, 30 Jun 2026 15:32:32 +0800
Message-Id: <20260630073235.3802271-3-lihongfu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260630073235.3802271-1-lihongfu@kylinos.cn>
References: <20260630073235.3802271-1-lihongfu@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add per-test tracing to the pkey signal-handler selftest and use
pkey_assert() for error handling. Each test enables tracing at start
and disables it at end; on failure, pkey_assert() calls abort_hooks()
to turn tracing off so ftrace is not left enabled.

Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
---
 .../selftests/mm/pkey_sighandler_tests.c      | 69 ++++++++++---------
 1 file changed, 36 insertions(+), 33 deletions(-)

diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
index 302fef54049c..085e771227fb 100644
--- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
+++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
@@ -19,7 +19,6 @@
 #include <stdint.h>
 #include <stdbool.h>
 #include <signal.h>
-#include <assert.h>
 #include <stdlib.h>
 #include <sys/mman.h>
 #include <sys/types.h>
@@ -36,6 +35,10 @@ static pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
 static pthread_cond_t cond = PTHREAD_COND_INITIALIZER;
 static siginfo_t siginfo = {0};
 
+int iteration_nr = 1;
+int test_nr;
+int dprint_in_signal;
+
 /*
  * We need to use inline assembly instead of glibc's syscall because glibc's
  * syscall will attempt to access the PLT in order to call a library function
@@ -207,15 +210,14 @@ static void test_sigsegv_handler_with_pkey0_disabled(void)
 	struct sigaction sa;
 	pthread_attr_t attr;
 	pthread_t thr;
+	int ret;
 
 	sa.sa_flags = SA_SIGINFO;
 
 	sa.sa_sigaction = sigsegv_handler;
 	sigemptyset(&sa.sa_mask);
-	if (sigaction(SIGSEGV, &sa, NULL) == -1) {
-		perror("sigaction");
-		exit(EXIT_FAILURE);
-	}
+	ret = sigaction(SIGSEGV, &sa, NULL);
+	pkey_assert(ret == 0);
 
 	memset(&siginfo, 0, sizeof(siginfo));
 
@@ -247,15 +249,14 @@ static void test_sigsegv_handler_cannot_access_stack(void)
 	struct sigaction sa;
 	pthread_attr_t attr;
 	pthread_t thr;
+	int ret;
 
 	sa.sa_flags = SA_SIGINFO;
 
 	sa.sa_sigaction = sigsegv_handler;
 	sigemptyset(&sa.sa_mask);
-	if (sigaction(SIGSEGV, &sa, NULL) == -1) {
-		perror("sigaction");
-		exit(EXIT_FAILURE);
-	}
+	ret = sigaction(SIGSEGV, &sa, NULL);
+	pkey_assert(ret == 0);
 
 	memset(&siginfo, 0, sizeof(siginfo));
 
@@ -288,21 +289,20 @@ static void test_sigsegv_handler_with_different_pkey_for_stack(void)
 	int parent_pid = 0;
 	int child_pid = 0;
 	u64 pkey_reg;
+	long ret;
 
 	sa.sa_flags = SA_SIGINFO | SA_ONSTACK;
 
 	sa.sa_sigaction = sigsegv_handler;
 
 	sigemptyset(&sa.sa_mask);
-	if (sigaction(SIGSEGV, &sa, NULL) == -1) {
-		perror("sigaction");
-		exit(EXIT_FAILURE);
-	}
+	ret = sigaction(SIGSEGV, &sa, NULL);
+	pkey_assert(ret == 0);
 
 	stack = mmap(0, STACK_SIZE, PROT_READ | PROT_WRITE,
 		     MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
 
-	assert(stack != MAP_FAILED);
+	pkey_assert(stack != MAP_FAILED);
 
 	/* Allow access to MPK 0 and MPK 1 */
 	pkey_reg = pkey_reg_restrictive_default();
@@ -323,7 +323,7 @@ static void test_sigsegv_handler_with_different_pkey_for_stack(void)
 	memset(&siginfo, 0, sizeof(siginfo));
 
 	/* Use clone to avoid newer glibcs using rseq on new threads */
-	long ret = clone_raw(CLONE_VM | CLONE_FS | CLONE_FILES |
+	ret = clone_raw(CLONE_VM | CLONE_FS | CLONE_FILES |
 			     CLONE_SIGHAND | CLONE_THREAD | CLONE_SYSVSEM |
 			     CLONE_PARENT_SETTID | CLONE_CHILD_CLEARTID |
 			     CLONE_DETACHED,
@@ -358,6 +358,7 @@ static void test_pkru_preserved_after_sigusr1(void)
 {
 	struct sigaction sa;
 	u64 pkey_reg;
+	int ret;
 
 	/* Allow access to MPK 0 and an arbitrary set of keys */
 	pkey_reg = pkey_reg_restrictive_default();
@@ -369,10 +370,8 @@ static void test_pkru_preserved_after_sigusr1(void)
 
 	sa.sa_sigaction = sigusr1_handler;
 	sigemptyset(&sa.sa_mask);
-	if (sigaction(SIGUSR1, &sa, NULL) == -1) {
-		perror("sigaction");
-		exit(EXIT_FAILURE);
-	}
+	ret = sigaction(SIGUSR1, &sa, NULL);
+	pkey_assert(ret == 0);
 
 	memset(&siginfo, 0, sizeof(siginfo));
 
@@ -444,6 +443,13 @@ static void test_pkru_sigreturn(void)
 	int parent_pid = 0;
 	int child_pid = 0;
 	u64 pkey_reg;
+	long ret;
+
+	/*
+	 * SIGSEGV handler is reset to SIG_DFL below; turn tracing off first
+	 * so a crash does not leave ftrace enabled.
+	 */
+	tracing_off();
 
 	sa.sa_handler = SIG_DFL;
 	sa.sa_flags = 0;
@@ -453,24 +459,20 @@ static void test_pkru_sigreturn(void)
 	 * For this testcase, we do not want to handle SIGSEGV. Reset handler
 	 * to default so that the application can crash if it receives SIGSEGV.
 	 */
-	if (sigaction(SIGSEGV, &sa, NULL) == -1) {
-		perror("sigaction");
-		exit(EXIT_FAILURE);
-	}
+	ret = sigaction(SIGSEGV, &sa, NULL);
+	pkey_assert(ret == 0);
 
 	sa.sa_flags = SA_SIGINFO | SA_ONSTACK;
 	sa.sa_sigaction = sigusr2_handler;
 	sigemptyset(&sa.sa_mask);
 
-	if (sigaction(SIGUSR2, &sa, NULL) == -1) {
-		perror("sigaction");
-		exit(EXIT_FAILURE);
-	}
+	ret = sigaction(SIGUSR2, &sa, NULL);
+	pkey_assert(ret == 0);
 
 	stack = mmap(0, STACK_SIZE, PROT_READ | PROT_WRITE,
 		     MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
 
-	assert(stack != MAP_FAILED);
+	pkey_assert(stack != MAP_FAILED);
 
 	/*
 	 * Allow access to MPK 0 and MPK 2. The child thread (to be created
@@ -494,7 +496,7 @@ static void test_pkru_sigreturn(void)
 	sigstack.ss_size = STACK_SIZE;
 
 	/* Use clone to avoid newer glibcs using rseq on new threads */
-	long ret = clone_raw(CLONE_VM | CLONE_FS | CLONE_FILES |
+	ret = clone_raw(CLONE_VM | CLONE_FS | CLONE_FILES |
 			     CLONE_SIGHAND | CLONE_THREAD | CLONE_SYSVSEM |
 			     CLONE_PARENT_SETTID | CLONE_CHILD_CLEARTID |
 			     CLONE_DETACHED,
@@ -530,16 +532,17 @@ static void (*pkey_tests[])(void) = {
 
 int main(int argc, char *argv[])
 {
-	int i;
-
 	ksft_print_header();
 	ksft_set_plan(ARRAY_SIZE(pkey_tests));
 
 	if (!is_pkeys_supported())
 		ksft_exit_skip("pkeys not supported\n");
 
-	for (i = 0; i < ARRAY_SIZE(pkey_tests); i++)
-		(*pkey_tests[i])();
+	for (test_nr = 0; test_nr < ARRAY_SIZE(pkey_tests); test_nr++) {
+		tracing_on();
+		(*pkey_tests[test_nr])();
+		tracing_off();
+	}
 
 	ksft_finished();
 	return 0;
-- 
2.25.1

