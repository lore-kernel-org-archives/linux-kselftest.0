Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771403BB69A;
	Fri, 26 Jun 2026 09:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782467268; cv=none; b=tc81PtUYBcLHmoyP00r3uds7MMk+e1ifGbiSR20SViLwBTX1T9e3nSRFj9eq/pPT6ByJj8tgtVJ025Lnfehva/VwMbogO/T/mnk9yxs0rp2h2nxPJmfxepH8s5CdZE0VLqFLlGnySm7v5Izd2/HhDjq74kmg51zgMy326yIEdWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782467268; c=relaxed/simple;
	bh=0mhYnyg+0JPmvyEUyS5OvYxpZv6hvlX397IzjfRMhTQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WIMAg6wXhUjSzU2D08W+LP4tiJ2n6x4UtvhBorCcxoFa9Tuu2CVn7LmvugaA+XvEJsDJvyIKpXaywyI7rlWisdnTAq5pZOhypdtiSfG7KBWTte0Mp3TYcznROroADJBT1tNSHRiQa7JO9Sv8uOTK9LIYgZBMZPQcXo7kYXom98M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1178a76c714411f1aa26b74ffac11d73-20260626
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:37d76220-f38b-4d85-9ab6-e66f05df8b85,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:fe111c0091b56639a03214fb05e9fb12,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1178a76c714411f1aa26b74ffac11d73-20260626
X-User: lihongfu@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lihongfu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1098772181; Fri, 26 Jun 2026 17:47:39 +0800
From: Hongfu Li <lihongfu@kylinos.cn>
To: tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	shuah@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	hongfu.li@linux.dev,
	Hongfu Li <lihongfu@kylinos.cn>
Subject: [PATCH] selftests/x86/fsgsbase: Check mmap() return value
Date: Fri, 26 Jun 2026 17:46:46 +0800
Message-Id: <20260626094646.1292754-1-lihongfu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both mmap() calls could fail without being checked, leading to
undefined behavior on memcpy or dereference. Use err() on failure,
consistent with the rest of the test.

Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
---
 tools/testing/selftests/x86/fsgsbase.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/x86/fsgsbase.c b/tools/testing/selftests/x86/fsgsbase.c
index 0a75252d31b6..5ff54d12d40e 100644
--- a/tools/testing/selftests/x86/fsgsbase.c
+++ b/tools/testing/selftests/x86/fsgsbase.c
@@ -252,6 +252,10 @@ static unsigned short load_gs(void)
 			NULL, sizeof(desc),
 			PROT_READ | PROT_WRITE,
 			MAP_PRIVATE | MAP_ANONYMOUS | MAP_32BIT, -1, 0);
+
+		if (low_desc == MAP_FAILED)
+			err(1, "mmap");
+
 		memcpy(low_desc, &desc, sizeof(desc));
 
 		low_desc->entry_number = set_thread_area_entry_number;
@@ -572,6 +576,8 @@ int main()
 
 	shared_scratch = mmap(NULL, 4096, PROT_READ | PROT_WRITE,
 			      MAP_ANONYMOUS | MAP_SHARED, -1, 0);
+	if (shared_scratch == MAP_FAILED)
+		err(1, "mmap");
 
 	/* Do these tests before we have an LDT. */
 	test_ptrace_write_gs_read_base();
-- 
2.54.0

