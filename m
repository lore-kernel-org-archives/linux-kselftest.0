Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F47374185;
	Tue, 14 Jul 2026 02:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783995413; cv=none; b=smKmZvtqgMSYIpvMepa7St5ZScdIslS3DEy+5OvPECs9tJtGWN6RxliyVo4QQJDlNnLRyidHGZeLgnGOTESWkJUteAZDG/iI/EELYqYRn2QupN/yS9pGH1mTViEA1nzzgQ9vSJKUbqCNgQ6Z7+WrSsj5CYKJRhyZk/0m0vV2dws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783995413; c=relaxed/simple;
	bh=zkuO7ZEWDL0sW8kyEi2wEELbhqezx5yo/X1JoGZKmcA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y72MEoBO0MnWXjtjPswhY9B5hCdb+tCx+hqvUXa3fg0Xw4IdAlnrP754rjYUAMMlZkGh0qjp8mSiJ2X9WcdZKEJqcXwL92hj9GWeE8J1QORszbN8ckJ09tB0pbpThDAHrzt+BLhEwFoJZBG7LspUOZUfXv+K4tzqVG+Y6awKzTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 0ea52a127f2a11f1aa26b74ffac11d73-20260714
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_EXISTED
	SN_UNTRUSTED, SN_LOWREP, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO
	GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:6061745b-ef00-428d-9615-cefe2838cb4f,IP:20,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:20
X-CID-INFO: VERSION:1.3.12,REQID:6061745b-ef00-428d-9615-cefe2838cb4f,IP:20,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:20
X-CID-META: VersionHash:e7bac3a,CLOUDID:9782d20a55bd8e8c50539e24beaf55c2,BulkI
	D:260714101644V8QQ3DJG,BulkQuantity:0,Recheck:0,SF:17|19|66|78|102|127|136
	|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:ni
	l,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE
	:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0ea52a127f2a11f1aa26b74ffac11d73-20260714
X-User: husong@kylinos.cn
Received: from ctao-book.. [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <husong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 165745200; Tue, 14 Jul 2026 10:16:43 +0800
From: Song Hu <husong@kylinos.cn>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Song Hu <husong@kylinos.cn>
Subject: [PATCH 2/2] selftests/mm: restore hidden hugetlb reservation scenarios
Date: Tue, 14 Jul 2026 10:16:30 +0800
Message-ID: <20260714021630.1063823-1-husong@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A stray 'continue' in the main loop of charge_reserved_hugetlb.sh made
the "more than reservation", "more than cgroup limit", and "multiple
cgroups" scenarios unreachable, so they never ran.

Remove it so the first two run again. The third,
run_multiple_cgroup_test(), is separately broken -- a backslash
line-continuation breaks its local declarations and its hugetlb
reservation accounting does not charge as expected -- and has never run
in CI; skip it explicitly with a comment until fixed. Also correct two
`[[ "$method" == 2"" ]]` typos (harmless empty-string concatenation)
to plain `2`.

Signed-off-by: Song Hu <husong@kylinos.cn>
---
 .../selftests/mm/charge_reserved_hugetlb.sh        | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mm/charge_reserved_hugetlb.sh b/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
index a1cfd3a349db..18b2f2060c61 100755
--- a/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
+++ b/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
@@ -439,11 +439,11 @@ for populate in "" "-o"; do
         fi
 
         # Skip populated shmem tests. Doesn't seem to be supported.
-        if [[ "$method" == 2"" ]] && [[ "$populate" == "-o" ]]; then
+        if [[ "$method" == 2 ]] && [[ "$populate" == "-o" ]]; then
           continue
         fi
 
-        if [[ "$method" == 2"" ]] && [[ "$reserve" == "-n" ]]; then
+        if [[ "$method" == 2 ]] && [[ "$reserve" == "-n" ]]; then
           continue
         fi
 
@@ -496,7 +496,6 @@ for populate in "" "-o"; do
         echo 'PASS'
 
         cleanup
-        continue
         echo
         echo
         echo
@@ -530,6 +529,15 @@ for populate in "" "-o"; do
 
         cleanup
 
+        # The "multiple cgroups" scenario (run_multiple_cgroup_test) is
+        # multiply broken and has never run in CI: a backslash
+        # line-continuation breaks its local declarations, it passes
+        # reservation sizes in bytes rather than pages (unlike
+        # run_test), and its assertions compare page counts to byte
+        # values. Skip it until properly rewritten; the two scenarios
+        # above are restored by this change.
+        continue
+
         echo
         echo
         echo
-- 
2.43.0

