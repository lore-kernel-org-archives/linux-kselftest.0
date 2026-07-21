Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D910221F2F;
	Tue, 21 Jul 2026 02:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784602704; cv=none; b=kU/iwCOeO9t2O8N4tj5LMTK8e3r0Tub6TDNkyjMdlAqHcaklWuHqdYSWqungXDe5YdcZamLo5W1ESJHbU/gjXhs6ux05oJmwTUT0xhUJBS3m1+XMIKiX2TxN4Esfe2hGBXGsKHT0g/UMLQMOjuBz86WRFCAMM9KGZMAxvCOPbhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784602704; c=relaxed/simple;
	bh=lc/jpThUKp/s6GpV1JmZODwJKgj+MDFrnLB3OXMGsFE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gdZ1jFKL05Z1Uohc/PBBDE3tZdsG9yctZcv6hzGWMvn8wZwKkyPZAvsvuBDdJODJ5XkpeWEQ2sQUCE0766kWXGw7QtKJL4SWh303eW8XaLQN7hOkAlggoN25/y4sSUwdU+Udj+v0C5VXFUODQe+mBZw4UvUE5BdHkzDT8LLVbvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 06611a6a84b011f1aa26b74ffac11d73-20260721
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:8cd05412-5523-4a0f-9612-8498efa31da6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:b55ad6e664a8891904fc79622e403fb5,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 06611a6a84b011f1aa26b74ffac11d73-20260721
X-User: yanlonglong@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yanlonglong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 912696944; Tue, 21 Jul 2026 10:58:18 +0800
From: longlong yan <yanlonglong@kylinos.cn>
To: sj@kernel.org,
	shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: longlong yan <yanlonglong@kylinos.cn>
Subject: [PATCH] selftests/damon: Add missing NULL checks after malloc()
Date: Tue, 21 Jul 2026 10:58:02 +0800
Message-ID: <20260721025802.298-1-yanlonglong@kylinos.cn>
X-Mailer: git-send-email 2.47.1.windows.2
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add NULL checks after each malloc() call, printing an error message
to stderr and returning -1 on failure.

Fixes: b5906f5f7359 ("selftests/damon: add a test for update_schemes_tried_regions sysfs command")
Fixes: c94df805c774 ("selftests/damon: implement a program for even-numbered memory regions access")
Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
---
 tools/testing/selftests/damon/access_memory.c      | 11 ++++++++++-
 tools/testing/selftests/damon/access_memory_even.c | 11 ++++++++++-
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/damon/access_memory.c b/tools/testing/selftests/damon/access_memory.c
index 567793b11107..e1a8e050dcd4 100644
--- a/tools/testing/selftests/damon/access_memory.c
+++ b/tools/testing/selftests/damon/access_memory.c
@@ -38,8 +38,17 @@ int main(int argc, char *argv[])
 		mode = ACCESS_MODE_REPEAT;
 
 	regions = malloc(sizeof(*regions) * nr_regions);
-	for (i = 0; i < nr_regions; i++)
+	if (!regions) {
+		fprintf(stderr, "Failed to allocate regions array\n");
+		return -1;
+	}
+	for (i = 0; i < nr_regions; i++) {
 		regions[i] = malloc(sz_region);
+		if (!regions[i]) {
+			fprintf(stderr, "Failed to allocate region %d\n", i);
+			return -1;
+		}
+	}
 
 	do {
 		for (i = 0; i < nr_regions; i++) {
diff --git a/tools/testing/selftests/damon/access_memory_even.c b/tools/testing/selftests/damon/access_memory_even.c
index 93f3a71bcfd4..a443835c119c 100644
--- a/tools/testing/selftests/damon/access_memory_even.c
+++ b/tools/testing/selftests/damon/access_memory_even.c
@@ -26,8 +26,17 @@ int main(int argc, char *argv[])
 	sz_region = atoi(argv[2]);
 
 	regions = malloc(sizeof(*regions) * nr_regions);
-	for (i = 0; i < nr_regions; i++)
+	if (!regions) {
+		fprintf(stderr, "Failed to allocate regions array\n");
+		return -1;
+	}
+	for (i = 0; i < nr_regions; i++) {
 		regions[i] = malloc(sz_region);
+		if (!regions[i]) {
+			fprintf(stderr, "Failed to allocate region %d\n", i);
+			return -1;
+		}
+	}
 
 	while (1) {
 		for (i = 0; i < nr_regions; i++) {
-- 
2.43.0

