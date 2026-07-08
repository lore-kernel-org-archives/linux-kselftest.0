Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3613F7885
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 07:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783497579; cv=none; b=epV8qJ3R+jtSEKEopRSDVxtbYo2HAbq/PwBk4UlP9ca6+8wgLWNW4TfqBebgxtlVedjHMUyJvFPG1CKXfXRQOS1s0ur6lnHRF99LDPUZGKvy1QUAVrBDfBJ+Ulc05uP46tG4jMQnWEcIBerHKeWYGz3evKx/7Ygs6LJ1jD46xbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783497579; c=relaxed/simple;
	bh=eAaxKW5641lnQwnlVt3MsJyeBfX4X3Ntngj5R2NfprE=;
	h=References:To:Cc:From:Content-Type:Date:Message-Id:Mime-Version:
	 Subject:In-Reply-To; b=pOScnlRHU7s/WsM6ziGX/u+LeUZeME6XipqVKCVQLt1ifRc5Ri38aQB/TR2z3PW5JmiTrLVC9nWypjCPabMKH+nXhaYMz6txP6gHJC7pgLOcnLDgU4haynFW7bny3MLKkPea/PhC1W0XRax4EMJfy4Bn1YIVEWFeV0HQ+BB9fpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=eww7RN/E; arc=none smtp.client-ip=209.127.230.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="eww7RN/E"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1783497566; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=YVmVbtBX3HCj9Ijd0ts5x4Wm1TJDsoimgyijvblmLxM=;
 b=eww7RN/E12R5+K/Y8ZquyTUz+A6c907DGgISd7D/i7o9Tb+Fb3SRji/Z/2G6lw7i2s3Z5q
 7kX4thirQSA9GzuhdB7dTtW0STLFooBXgUOLBFYLBw7WVtWM0K/1dGuWeOR1ogqZ92cbm5
 7hyBMZ3sdZ6uOOUZw8KRw13aoRMw8zsZ6S+PVtl9ro7xxgC/wrVjS7P+I6dTNCwaB+Xv41
 uFTElYEEGBzfbntqHjMctESu8gK1twPGKjgDpZTLnQHbmus8Or9kaOoBDZcaqUtE/SV2ew
 /C8HIp+xNdjRFLSjZX8bUDjo0O/Jn9i8fhjgepHJpfwbQ19O1mN0Tit16CdL2A==
References: <20260707142314.a421d05c05da56260d1bf085@linux-foundation.org>
X-Original-From: wangyijia.yeah@bytedance.com
Content-Transfer-Encoding: 7bit
To: <shuah@kernel.org>
Cc: <akpm@linux-foundation.org>, <linux-kselftest@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, 
	<muchun.song@linux.dev>, "Yijia Wang" <wangyijia.yeah@bytedance.com>
From: =?utf-8?q?=E7=8E=8B=E7=BF=8A=E5=98=89?= <wangyijia.yeah@bytedance.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Date: Wed,  8 Jul 2026 15:59:19 +0800
Message-Id: <20260708075919.3324888-1-wangyijia.yeah@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Subject: [PATCH v4] selftests: mincore: count file-mmap readahead on both sides
In-Reply-To: <20260707142314.a421d05c05da56260d1bf085@linux-foundation.org>
X-Lms-Return-Path: <lba+26a4e035c+1dfc06+vger.kernel.org+wangyijia.yeah@bytedance.com>

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
