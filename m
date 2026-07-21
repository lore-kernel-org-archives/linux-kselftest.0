Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D0410F1
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 02:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784599719; cv=none; b=Y7y6CNorko587jyN6d38wzWg+tuipHZMoQ+e+KwLbqgCr0WU11hbHEESoLSJFPjDwyKiE/py2gFoBU6qiItYAsvDRDjOdJchuWSawQoQVaLHdky+pX8oyH/Ah4Qus2kU/S4b+Y5jCVHkWuzm8/HmxlXmlqvYxlSyd0dpugVTVE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784599719; c=relaxed/simple;
	bh=s9xpTb2IRYVxbohy5lj5WDj9IEpJpBm3lB/kq52wW+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TN7PRQ1ITzR1PDAD65yz6aVVPeTh+rzATRuvkT8UPfdh1/69BEG77VhfotvTzfdhlkANGa7b1SwYh0cXGgpicCKSj/lfRq3eQq+wY/UBSsANdV+m85FIjgwVzsr6ubyzunbcgXMVTCvoYkGxHC06RZBdGqxezufJ6sY3w68ilNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 12bd338684a911f1aa26b74ffac11d73-20260721
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:5e35ac43-f7b3-4e78-9476-67e77b7af8f3,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:ac246b0b773940a5f7d9c269f39dc510,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 12bd338684a911f1aa26b74ffac11d73-20260721
X-User: yanlonglong@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yanlonglong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 8767453; Tue, 21 Jul 2026 10:08:32 +0800
From: longlong yan <yanlonglong@kylinos.cn>
To: cgroup@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	hannes@cmpxchg.org,
	yosry@kernel.org,
	tj@kernel.org
Cc: Nhat Pham <nphamcs@gmail.com>,
	longlong yan <yanlonglong@kylinos.cn>
Subject: [PATCH] selftests/cgroup: test_zswap: add missing NULL check after malloc()
Date: Tue, 21 Jul 2026 10:08:10 +0800
Message-ID: <20260721020810.282-1-yanlonglong@kylinos.cn>
X-Mailer: git-send-email 2.47.1.windows.2
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In test_per_memcg_writeback(), zw_allocation is allocated via
malloc() but its return value is not checked before being used in
the subsequent memset() loop. If malloc() fails, this leads to a
NULL pointer dereference.

Add the missing NULL check and jump to the existing error cleanup
path. This is consistent with the wb_allocation check two lines
below.

Fixes: a19b47492751 ("selftest/cgroup: fix zswap test_no_invasive_cgroup_shrink on large pagesize system")
Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
---
 tools/testing/selftests/cgroup/test_zswap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
index 49b36ee79160..9c2ff1b3c320 100644
--- a/tools/testing/selftests/cgroup/test_zswap.c
+++ b/tools/testing/selftests/cgroup/test_zswap.c
@@ -479,6 +479,8 @@ static int test_no_invasive_cgroup_shrink(const char *root)
 	if (cg_enter_current(zw_group))
 		goto out;
 	zw_allocation = malloc(allocation_size);
+	if (!zw_allocation)
+		goto out;
 	for (int i = 0; i < nr_pages; i++) {
 		off = (unsigned long)i * page_size;
 		memset(&zw_allocation[off], 0, page_size);
-- 
2.43.0

