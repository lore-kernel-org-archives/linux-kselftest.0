Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5012771B;
	Fri, 29 May 2026 07:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780039015; cv=none; b=HULUIMWX7xq72WphxqVdrPwA2J5/m6u7M1+0Jb9U47OUkBw3AxQN72Yyaxya+tExjfbQEybtaHX8DJYj8CY7xoV4FnOcsDKlSmlXjpuwRy9bmdw0Z1lvmPW4aX9CvjANZGot+jjtqglIKPlJl5/1WSMffgNxqNwwN25ENcdYpx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780039015; c=relaxed/simple;
	bh=vHjB7wNXdkJExFnCvkFP8dAOA5s7DvwLkE+UXr+Eqog=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iSCpTeLcIjHqrlLR60hPktgqnNbLDehpl0jIkOEeSnPMqSD+aoK23sXIyUnq1Vm33k9tVDHMk1Q3ylEDISXqwQliLoPMOgKgQY9tqFq7vbdrXFsW5J0UYecWd/r9QZ6U9KONqmuRzdujO7U4V2SZ5blcg31xgZl+ylGqdwPZ6Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 5b4d164c5b2e11f1aa26b74ffac11d73-20260529
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
X-CID-O-INFO: VERSION:1.3.12,REQID:a49ada69-324a-441b-8965-40845cddc6a6,IP:10,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-INFO: VERSION:1.3.12,REQID:a49ada69-324a-441b-8965-40845cddc6a6,IP:10,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:5
X-CID-META: VersionHash:e7bac3a,CLOUDID:cdae462376a42f737d0b63fa83c056b3,BulkI
	D:260529151648UOJ642O5,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|81|82|10
	2|127|850|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,RT:ni
	l,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,
	BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5b4d164c5b2e11f1aa26b74ffac11d73-20260529
X-User: lihongfu@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <lihongfu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2049664791; Fri, 29 May 2026 15:16:48 +0800
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
	Hongfu Li <lihongfu@kylinos.cn>
Subject: [PATCH v4 3/4] selftests/mm: use pkey_assert on clone_raw failure in pkey test
Date: Fri, 29 May 2026 15:16:32 +0800
Message-Id: <20260529071633.2807814-4-lihongfu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260529071633.2807814-1-lihongfu@kylinos.cn>
References: <20260529071633.2807814-1-lihongfu@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use pkey_assert(0) instead of perror("clone") when clone_raw() fails.
The old path only printed an error and continued; the test now exits
via pkey_assert() on failure so it does not hang or proceed with an
invalid child.

Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
---
 tools/testing/selftests/mm/pkey_sighandler_tests.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
index 80b5b3dad86f..231dfb079075 100644
--- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
+++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
@@ -333,7 +333,7 @@ static void test_sigsegv_handler_with_different_pkey_for_stack(void)
 
 	if (child_pid < 0) {
 		errno = -child_pid;
-		perror("clone");
+		pkey_assert(0);
 	} else if (child_pid == 0) {
 		thread_segv_maperr_ptr(&sigstack);
 		syscall_raw(SYS_exit, 0, 0, 0, 0, 0, 0);
@@ -500,7 +500,7 @@ static void test_pkru_sigreturn(void)
 
 	if (child_pid < 0) {
 		errno = -child_pid;
-		perror("clone");
+		pkey_assert(0);
 	} else if (child_pid == 0) {
 		thread_sigusr2_self(&sigstack);
 		syscall_raw(SYS_exit, 0, 0, 0, 0, 0, 0);
-- 
2.50.1

