Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E04C377019;
	Mon, 11 May 2026 09:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778492089; cv=none; b=GQbk2kDeHC54zGc3esypCDUZpQ/wvNi3/WYfbx7V4Cf1T/gHGQEHtyfZXbIW07YLCQ1nfbjs0P1QwKfLq8uZoYRxcwD7WHPh4PGKQ+FXdrEWw/A4MzV9wyIu2b73Nvn3jvV2DnFu7fkCRRj2LYCkgZW36Ru1LMiG6aCRyL2AVE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778492089; c=relaxed/simple;
	bh=tiRVBMhI2CQwyqfiV3DQodODHuvGnw4TTTZ+ekju1eI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fE71hsHqqlXnB6pJd7eNKulqaOQDb4ZIJNqVSCGwI5azh2kUH559M1JcsXCjQzMKtlZIdv0z/ycHq7owqiKdoT0UmcXxpaPSdn6B6MD5tFPmSd/PuQ8F6bqbXtnRowFguoA93ZjgmA/NhgQZgAZD1J/uHYOCuHbzNtanWiV99jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: a1b290c84d1c11f1aa26b74ffac11d73-20260511
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_EXISTED, SN_EXISTED
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_GOOD, CIE_GOOD_SPF
	GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:0fc4e0f0-23eb-4d29-8ac2-b74e43484955,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:15
X-CID-INFO: VERSION:1.3.12,REQID:0fc4e0f0-23eb-4d29-8ac2-b74e43484955,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:15
X-CID-META: VersionHash:e7bac3a,CLOUDID:cc85dbbe211b15cd94e675c15e8cd947,BulkI
	D:260511173440PI1CYFO6,BulkQuantity:0,Recheck:0,SF:19|38|66|72|78|102|127|
	850|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil
	,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:
	0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a1b290c84d1c11f1aa26b74ffac11d73-20260511
X-User: husong@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <husong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 120949529; Mon, 11 May 2026 17:34:39 +0800
From: Hu Song <husong@kylinos.cn>
To: akpm@linux-foundation.org,
	david@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Cc: ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	Song Hu <husong@kylinos.cn>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/mm: handle fork() failure in migration tests
Date: Mon, 11 May 2026 17:34:32 +0800
Message-Id: <20260511093433.2372985-1-husong@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Song Hu <husong@kylinos.cn>

When fork() fails and returns -1, the code falls into the else branch
and stores -1 into self->pids[i]. Later, kill(-1, SIGTERM) is called
which sends SIGTERM to every process the user has permission to signal,
potentially killing the entire user session.

Add an explicit check for fork() returning -1 (pid < 0). On failure,
clean up any already-forked children before failing the test via
ASSERT_GE(pid, 0). This fix is applied to all three fork() call sites
in shared_anon, shared_anon_thp, and shared_anon_htlb tests.

Signed-off-by: Hu Song <husong@kylinos.cn>
---
 tools/testing/selftests/mm/migration.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
index 60e78bbfc0e3..f433e4f195ad 100644
--- a/tools/testing/selftests/mm/migration.c
+++ b/tools/testing/selftests/mm/migration.c
@@ -163,6 +163,11 @@ TEST_F_TIMEOUT(migration, shared_anon, 2*RUNTIME)
 	memset(ptr, 0xde, TWOMEG);
 	for (i = 0; i < self->nthreads - 1; i++) {
 		pid = fork();
+		if (pid < 0) {
+			while (--i >= 0)
+				kill(self->pids[i], SIGTERM);
+			ASSERT_GE(pid, 0);
+		}
 		if (!pid) {
 			prctl(PR_SET_PDEATHSIG, SIGHUP);
 			/* Parent may have died before prctl so check now. */
@@ -235,6 +240,11 @@ TEST_F_TIMEOUT(migration, shared_anon_thp, 2*RUNTIME)
 	memset(ptr, 0xde, TWOMEG);
 	for (i = 0; i < self->nthreads - 1; i++) {
 		pid = fork();
+		if (pid < 0) {
+			while (--i >= 0)
+				kill(self->pids[i], SIGTERM);
+			ASSERT_GE(pid, 0);
+		}
 		if (!pid) {
 			prctl(PR_SET_PDEATHSIG, SIGHUP);
 			/* Parent may have died before prctl so check now. */
@@ -295,6 +305,11 @@ TEST_F_TIMEOUT(migration, shared_anon_htlb, 2*RUNTIME)
 	memset(ptr, 0xde, TWOMEG);
 	for (i = 0; i < self->nthreads - 1; i++) {
 		pid = fork();
+		if (pid < 0) {
+			while (--i >= 0)
+				kill(self->pids[i], SIGTERM);
+			ASSERT_GE(pid, 0);
+		}
 		if (!pid) {
 			prctl(PR_SET_PDEATHSIG, SIGHUP);
 			/* Parent may have died before prctl so check now. */
-- 
2.25.1

