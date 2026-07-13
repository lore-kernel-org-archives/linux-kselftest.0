Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868CF3E2AC9
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 09:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783935822; cv=none; b=HzCBfJ6IIacTut1FDHx/kgprMtAMrKRswZo1Auq700kuuEjN9X5CglZeLANss7AGV+UghGrz4UDtYRjiUZ9O7tyG0Bx+VT1+kpOfMNczZWuZhiPk7Tb8B8lX8RNxQ+7umiNuEOoYw1bksxxqzfC3FzG/fSYOxtxxWEsI3pFBZrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783935822; c=relaxed/simple;
	bh=eAaxKW5641lnQwnlVt3MsJyeBfX4X3Ntngj5R2NfprE=;
	h=Subject:Date:Cc:From:Mime-Version:Content-Type:To:Message-Id; b=t/8w/S9Xsska70yTc91bxhmEs1e90Ed3Pp8FbiCawHCdVMqFr1snr7aqz3gFVlacAInzshIQPu9cMlu2YF3kmzXGy6olCRLuqe0TkipqILM1Z0NtlFRGk5Wge+9XjWc7j2IpCB20zKakEEfudBYWYfbDBB0mRaZ4Ldj32FS54U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Vpd08eG5; arc=none smtp.client-ip=209.127.230.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Vpd08eG5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1783935807; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=YVmVbtBX3HCj9Ijd0ts5x4Wm1TJDsoimgyijvblmLxM=;
 b=Vpd08eG5mYOeAXAMCR/jYa2ZDQrFEU4NmYK1Ty0KaLkUctzIVecmT1z/WSJGRLfqaJ5tFb
 EwV+5ft8pE8RJ+MbKuDzg9lkJZbHhkYOAv1P+t4KTcGJSG3ORTj1twt710VwuWnqWkSngL
 42TKTCFo1BSyyuXzn3Uk9BEk13sIgBePePJhUVx1Ba45Q6opSKX90tFuv5CUOPjisaeweN
 tZfB3BSSskoneXw7nkthA0vZfychvTObwC2t4QA82eRjfNFTG5nEhsi0KNrNIBB/TUxFaE
 JJgMpvBPQsuT8+vP59Tsr/NbML+3/V4T25MvXes76ku6rHdOzFL4ceGUBsCBoQ==
Subject: [PATCH RESEND v4] selftests: mincore: count file-mmap readahead on both sides
Date: Mon, 13 Jul 2026 17:43:19 +0800
X-Lms-Return-Path: <lba+26a54b33d+6f7f78+vger.kernel.org+wangyijia.yeah@bytedance.com>
X-Mailer: git-send-email 2.43.0
Cc: <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>, <muchun.song@linux.dev>, 
	"Yijia Wang" <wangyijia.yeah@bytedance.com>
From: =?utf-8?q?=E7=8E=8B=E7=BF=8A=E5=98=89?= <wangyijia.yeah@bytedance.com>
X-Original-From: wangyijia.yeah@bytedance.com
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
To: <akpm@linux-foundation.org>, <shuah@kernel.org>
Message-Id: <20260713094319.771550-1-wangyijia.yeah@bytedance.com>

From: Yijia Wang <wangyijia.yeah@bytedance.com>

check_file_mmap() faults a page in the middle of a file mapping and
expects the mmap read-around path to make neighbouring pages resident.
The test currently counts only pages after the faulted page.

That misses valid read-around on systems with large base page sizes. On
arm64 with 64K pages and the default 128K readahead setting, the
read-around window is two pages wide and centred on the faulting page.
Faulting page 32 makes pages 31 and 32 resident, so the forward-only
scan from page 33 reports ra_pages == 0 even though a neighbouring page
was brought in.

Keep the existing readahead assertion, but count resident neighbouring
pages on both sides of the faulted page. This fixes the 64K-page false
failure without teaching the selftest to compute the expected readahead
window from sysfs or other implementation details.

Signed-off-by: Yijia Wang <wangyijia.yeah@bytedance.com>
---
Changes in v4:
- Drop the sysfs read_ahead_kb helper and skip logic from v3.
- Keep the existing ra_pages assertion and count resident readahead
  pages on both sides of the faulted page.

 tools/testing/selftests/mincore/mincore_selftest.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mincore/mincore_selftest.c b/tools/testing/selftests/mincore/mincore_selftest.c
index 3182043..ebf2b06 100644
--- a/tools/testing/selftests/mincore/mincore_selftest.c
+++ b/tools/testing/selftests/mincore/mincore_selftest.c
@@ -243,8 +243,10 @@ TEST(check_file_mmap)
 	}
 
 	/*
-	 * Touch a page in the middle of the mapping. We expect the next
-	 * few pages (the readahead window) to be populated too.
+	 * Touch a page in the middle of the mapping. We expect some
+	 * surrounding pages (the readahead window) to be populated too.
+	 * Depending on the page size and readahead setting, the pages may
+	 * land before the faulted page rather than after it.
 	 */
 	addr[FILE_SIZE / 2] = 1;
 	retval = mincore(addr, FILE_SIZE, vec);
@@ -253,6 +255,12 @@ TEST(check_file_mmap)
 		TH_LOG("Page not found in memory after use");
 	}
 
+	i = FILE_SIZE / 2 / page_size - 1;
+	while (i >= 0 && vec[i]) {
+		ra_pages++;
+		i--;
+	}
+
 	i = FILE_SIZE / 2 / page_size + 1;
 	while (i < vec_size && vec[i]) {
 		ra_pages++;
-- 
2.43.0
