Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F0F3939C2;
	Mon,  6 Jul 2026 08:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783325854; cv=none; b=LmcLNd5aOomD/eP9RYYUieT3gDuNnJFpoMwRiYwHYHRIkVFlcTTbU1vPrY/lTBvrQW5rXB08CSFQDN70BNIsD6743x22UbHaWVahh48t+QVuPnBJZwaHOmZBHgrFsdax8w/Nkn48LxTqdDnrfskD794FibZpkEidoL3a9XvXrLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783325854; c=relaxed/simple;
	bh=dGQu2iAcosE8etPq7PFmGvo6MHWyhaZCtahWnN5J1DM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nu39/1TGy5p9hyDPXyYKmBR1pmuigCuODb4ibFricDO1YDt1y+fofd3fgZEcGGP2YM390EjfKp9wu59zCMnPl/ySBvtmMgVA9I/arjfjY0dpTaDprPAB7dFdR64OV5xC0Fjw4zdspLh6ccutIfsNo1xh0RFmu7fMad6ibfGH5ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1ac5166c791311f1aa26b74ffac11d73-20260706
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
X-CID-O-INFO: VERSION:1.3.12,REQID:3909b2f1-67d8-4ad4-a0e5-71db74f0385e,IP:10,
	URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-15
X-CID-INFO: VERSION:1.3.12,REQID:3909b2f1-67d8-4ad4-a0e5-71db74f0385e,IP:10,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-15
X-CID-META: VersionHash:e7bac3a,CLOUDID:db9c22fdfce9175bff763b21ab82e015,BulkI
	D:26070616172085EONZK9,BulkQuantity:0,Recheck:0,SF:10|38|66|78|81|82|102|1
	27|850|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,B
	ulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR
	:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1ac5166c791311f1aa26b74ffac11d73-20260706
X-User: lihongfu@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <lihongfu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 980413701; Mon, 06 Jul 2026 16:17:18 +0800
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
Cc: jhubbard@nvidia.com,
	joey.gouly@arm.com,
	keith.lucas@oracle.com,
	kevin.brodsky@arm.com,
	usama.anjum@collabora.com,
	yury.khrustalev@arm.com,
	zwisler@google.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hongfu.li@linux.dev,
	Hongfu Li <lihongfu@kylinos.cn>
Subject: [PATCH v10 6/6] selftests/mm: fix clone cleartid race in pkey sighandler tests
Date: Mon,  6 Jul 2026 16:16:00 +0800
Message-Id: <20260706081600.3570203-7-lihongfu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260706081600.3570203-1-lihongfu@kylinos.cn>
References: <20260706081600.3570203-1-lihongfu@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Passing a stack-local child_pid to clone() with CLONE_CHILD_CLEARTID is
unsafe: the kernel clears that address when the child exits, which may
happen after the test function has returned and the stack slot has been
reused.

Neither testcase uses the settid/cleartid pointers for synchronization.

Drop CLONE_PARENT_SETTID and CLONE_CHILD_CLEARTID and pass NULL for the
clone tid arguments. Wait for the clone child to exit via tkill in
test_sigsegv_handler_with_different_pkey_for_stack(), matching
test_pkru_sigreturn(), so the detached thread cannot overlap with the
next testcase.

Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
---
 .../selftests/mm/pkey_sighandler_tests.c      | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
index cbc24d6cf770..c218d0510a2a 100644
--- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
+++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
@@ -290,7 +290,6 @@ static void test_sigsegv_handler_with_different_pkey_for_stack(void)
 	static stack_t sigstack;
 	void *stack;
 	int pkey;
-	int parent_pid = 0;
 	int child_pid = 0;
 	u64 pkey_reg;
 	long ret;
@@ -330,11 +329,10 @@ static void test_sigsegv_handler_with_different_pkey_for_stack(void)
 	/* Use clone to avoid newer glibcs using rseq on new threads */
 	ret = clone_raw(CLONE_VM | CLONE_FS | CLONE_FILES |
 			CLONE_SIGHAND | CLONE_THREAD | CLONE_SYSVSEM |
-			CLONE_PARENT_SETTID | CLONE_CHILD_CLEARTID |
 			CLONE_DETACHED,
 			stack + STACK_SIZE,
-			&parent_pid,
-			&child_pid);
+			NULL,
+			NULL);
 
 	if (ret < 0) {
 		errno = -ret;
@@ -344,11 +342,19 @@ static void test_sigsegv_handler_with_different_pkey_for_stack(void)
 		syscall_raw(SYS_exit, 0, 0, 0, 0, 0, 0);
 	}
 
+	child_pid = ret;
+
 	pthread_mutex_lock(&mutex);
 	while (siginfo.si_signo == 0)
 		pthread_cond_wait(&cond, &mutex);
 	pthread_mutex_unlock(&mutex);
 
+	/* Wait for child to exit before returning */
+	do {
+		sched_yield();
+		ret = syscall_raw(SYS_tkill, child_pid, 0, 0, 0, 0, 0);
+	} while (ret != -ESRCH && ret != -EINVAL);
+
 	ksft_test_result(siginfo.si_signo == SIGSEGV &&
 			 siginfo.si_code == SEGV_MAPERR &&
 			 siginfo.si_addr == NULL,
@@ -445,7 +451,6 @@ static void test_pkru_sigreturn(void)
 	static stack_t sigstack;
 	void *stack;
 	int pkey;
-	int parent_pid = 0;
 	int child_pid = 0;
 	u64 pkey_reg;
 	long ret;
@@ -504,11 +509,10 @@ static void test_pkru_sigreturn(void)
 	/* Use clone to avoid newer glibcs using rseq on new threads */
 	ret = clone_raw(CLONE_VM | CLONE_FS | CLONE_FILES |
 			CLONE_SIGHAND | CLONE_THREAD | CLONE_SYSVSEM |
-			CLONE_PARENT_SETTID | CLONE_CHILD_CLEARTID |
 			CLONE_DETACHED,
 			stack + STACK_SIZE,
-			&parent_pid,
-			&child_pid);
+			NULL,
+			NULL);
 
 	if (ret < 0) {
 		errno = -ret;
-- 
2.25.1

