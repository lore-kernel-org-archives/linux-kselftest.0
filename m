Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6865932860B;
	Mon,  6 Jul 2026 08:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783325844; cv=none; b=GkhEfthlwqSvkPtUWFyYsS3e+d80aD9InmosIVd+M6UwF/VZzjx/Lb90K8jx58ZG1kalUzfbxNeSJJtQRDkRnF7F2tcBnyvtfgGyzsBz6MS8lbifAxpxrruJm+ZejRQxC3dcF7UYcLLopuCDeNZVLTfEorUnS0pN+q3MUNZxQPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783325844; c=relaxed/simple;
	bh=6RGK+ubWD5mQSyq2wqDk5fgMXmnVUzdXjt1+d8CFtsI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mSCfBtiFs+QcVAflrfompKEkbNjaRLEDlTfgD1V7RhBNOGZdpm1I825GJkOzx8gzOUZVdKZREnvI0I2ZIHmhP7uuN0r6MYAC2U8Yo2V+TO7sY9Kc8gb/JbCpli3bShfKKFN46WGvTudTK1A6ZrhFrn2JDYkn8rjTDF6tPF5iiT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 13ec4c8e791311f1aa26b74ffac11d73-20260706
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
X-CID-O-INFO: VERSION:1.3.12,REQID:78748e26-725a-41fe-9de9-edb58e991902,IP:10,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-INFO: VERSION:1.3.12,REQID:78748e26-725a-41fe-9de9-edb58e991902,IP:10,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:5
X-CID-META: VersionHash:e7bac3a,CLOUDID:0ef45d872de13baad6c0355bb7f05940,BulkI
	D:260702142437QFZCHOMQ,BulkQuantity:1,Recheck:0,SF:10|38|66|78|81|82|102|1
	27|136|850|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,RT:n
	il,Bulk:41,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,
	BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 13ec4c8e791311f1aa26b74ffac11d73-20260706
X-User: lihongfu@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <lihongfu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2025791223; Mon, 06 Jul 2026 16:17:07 +0800
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
Subject: [PATCH v10 3/6] selftests/mm: use pkey_assert on clone_raw failure in pkey test
Date: Mon,  6 Jul 2026 16:15:57 +0800
Message-Id: <20260706081600.3570203-4-lihongfu@kylinos.cn>
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

Use pkey_assert(0) instead of perror("clone") when clone_raw() fails.
The old path only printed an error and continued; the test now exits
via pkey_assert() on failure so it does not hang or proceed with an
invalid child.

Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: Liam R. Howlett (Oracle) <liam@infradead.org>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Tested-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 tools/testing/selftests/mm/pkey_sighandler_tests.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
index 8b3400379423..188513e94fc5 100644
--- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
+++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
@@ -329,7 +329,7 @@ static void test_sigsegv_handler_with_different_pkey_for_stack(void)
 
 	if (ret < 0) {
 		errno = -ret;
-		perror("clone");
+		pkey_assert(0);
 	} else if (ret == 0) {
 		thread_segv_maperr_ptr(&sigstack);
 		syscall_raw(SYS_exit, 0, 0, 0, 0, 0, 0);
@@ -502,7 +502,7 @@ static void test_pkru_sigreturn(void)
 
 	if (ret < 0) {
 		errno = -ret;
-		perror("clone");
+		pkey_assert(0);
 	}  else if (ret == 0) {
 		thread_sigusr2_self(&sigstack);
 		syscall_raw(SYS_exit, 0, 0, 0, 0, 0, 0);
-- 
2.25.1

