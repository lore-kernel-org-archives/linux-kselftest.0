Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C234E3778;
	Mon,  6 Jul 2026 09:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328596; cv=none; b=XiS/gmWPRanwJFy+dxKtFcY5H/YCSs42Td6So52XPS1z5pk9s+u17d783aa69seMmb2aPtR3qVKkeeSg+ZDYAaNB0+WjsJbxkG99OFbKe2TLzi4DA1UF/vO1d1wfBGZ68ANGWuN+OsqV4NFe3eOtV/bwx6dRDH2jqpYmOZ+0pOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328596; c=relaxed/simple;
	bh=RSlTApPnCYFjngwFV7CuZ1LjnF7jqBsn+fiE9XTkjF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A3uzKe+svj+I5f6BlYqODNxKMowYiV4V43AMy1s7Wq1TeTBT116wxqo0AVnhr4e5c/1Dpa1otZy/idm8Teq/P27nzFD4d4kU1iLKX2IaSdXcTsSRQ2EtHOvmWBat7gjS4XM6xPfwB0JBMVW6nm4o3Gw2t8mMCSQRmFZcpX1+tHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 7b97f49a791911f1aa26b74ffac11d73-20260706
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:53180e8a-2afb-4a39-8645-e76fddcece14,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:d40aa3ff4981d99fb42134f80a741b4c,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7b97f49a791911f1aa26b74ffac11d73-20260706
X-User: yanlonglong@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yanlonglong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 861120726; Mon, 06 Jul 2026 17:02:57 +0800
From: longlong yan <yanlonglong@kylinos.cn>
To: kees@kernel.org,
	shuah@kernel.org
Cc: luto@amacapital.net,
	wad@chromium.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	longlong yan <yanlonglong@kylinos.cn>
Subject: [PATCH] selftests/harness: Check mmap return value in test_harness_run
Date: Mon,  6 Jul 2026 17:02:40 +0800
Message-ID: <20260706090240.209-1-yanlonglong@kylinos.cn>
X-Mailer: git-send-email 2.47.1.windows.2
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mmap() call in test_harness_run() has no error check. If mmap() fails,
it returns MAP_FAILED, not NULL, and the test harness continues executing
with an invalid pointer, leading to undefined behavior (e.g., writing to
invalid memory, calling munmap() on invalid address).

Add a check for MAP_FAILED after mmap() and return KSFT_FAIL on failure,
consistent with the function's other error exit paths.

Fixes: 0ef67a888375 ("selftests/harness: Report skip reason")
Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
---
 tools/testing/selftests/kselftest_harness.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
index 261e4df94d9d..30a818312190 100644
--- a/tools/testing/selftests/kselftest_harness.h
+++ b/tools/testing/selftests/kselftest_harness.h
@@ -1293,6 +1293,8 @@ static int test_harness_run(int argc, char **argv)
 
 	results = mmap(NULL, sizeof(*results), PROT_READ | PROT_WRITE,
 		       MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	if (results == MAP_FAILED)
+		return KSFT_FAIL;
 
 	ksft_print_header();
 	ksft_set_plan(test_count);
-- 
2.43.0

