Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A726C4B95A3;
	Tue, 13 Oct 2026 10:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887844; cv=none; b=kqxiEWWtY7HxSjh63rMFQDGg3WtzTz9zqmG+OLBvjw7tL22mkSXnUfEK7vrqzztploXse/GkXSK+XK/eHDmlPniIioEwtYsUFEz7KaSwJq0PV/L6XmEL/SSB7FQkYkFtGwKiMLowZPC8spQTXqVJyUAQks5oyIigM/z2dzHx1Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887844; c=relaxed/simple;
	bh=zlm0jggjoGcBtjF+7NJSkqsks8KqRwYRxYBdaXI2m88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z3BknPT8MIgHM9fNTVCcibOssWHI1xYEQULCljPKckJNl2QNDBdiL94YrXVagES7UhADtVar444fVSoqnUPInldeS26ZL85DNlVmkEovJfKnoB4jsdQYRXp82OzeUbjqDbXGhHfhvIljoQsL4RP0H+Z6q32FjADpeOXmJtMWrQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=O7lRj9VX; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="O7lRj9VX"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F40C169C;
	Tue, 13 Oct 2026 03:37:18 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA5DB3F7B4;
	Tue, 13 Oct 2026 03:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791887841; bh=zlm0jggjoGcBtjF+7NJSkqsks8KqRwYRxYBdaXI2m88=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O7lRj9VXE8HhrWghHpCesoTCpOa3V7aRgApIrDvh+G4vpyN9kUBHcyI1lhxEtlw94
	 YUPHx70ypb3+oZ3nDuN/z5PzeGIa7O99Yd+lDTkwjvJYuAoecmMhhrDMAqriWnlMcO
	 cb1EBGw0sasp4JyHpGH461ycQ4qUAKK37LhSSLrA=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Tue, 13 Oct 2026 11:37:05 +0100
Subject: [PATCH v7 3/3] kselftest: mm: introduce size_to_shift() helper
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-fix_hpage_macro-v7-3-3d77129e0557@arm.com>
References: <20261013-fix_hpage_macro-v7-0-3d77129e0557@arm.com>
In-Reply-To: <20261013-fix_hpage_macro-v7-0-3d77129e0557@arm.com>
To: Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Kiryl Shutsemau <kas@kernel.org>, Peter Xu <peterx@redhat.com>, 
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
 Sarthak Sharma <sarthak.sharma@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1845; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=zlm0jggjoGcBtjF+7NJSkqsks8KqRwYRxYBdaXI2m88=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqzgnUGsz8VkHf3mY2KQbmGhgbZWDJCNsolUO8H
 01cPlR84VSJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCas4J1AAKCRBt1cPRWsUx
 M1/MDACQ/yPt492mMgEomDBdxPrbfqQ8emxOnCQeHS79ptrnJWB8D6IXBWsMkDP0lKCYRTT/L07
 S5bPI/4B1oGOnQceTWPNgKijv32hLXOHE41QxS6HAx3oYYygOg76qW+uO/1pbAkPtqUAxj+7o+T
 yLY75ASTUOQP6MEl3McNffBU8TC9SSxfYYgQ0IO/u0fEqLx2StFMzW98W1nYqf0FlnOTtBV0Up1
 oE2dG2DXcM7RZe1jKWhV3Vp7l0Ar3GasLmWro80gjUQisxsUt3vlIhITqZSB47GNd5ZrnTR4M05
 +GqBhtoa6l/kd2OT1CwBWxyyJ27coDJXxXsT6apbS6ftJQcFjmrA8eLY/0XFCMT6FLTWbmeRVU2
 wnoo25/qOJWZK7U/lkkkarU5JKgkkNOTzR3EB97SZq9I9my7tWxx7Gz7XFEn2IhwTPAAz2cBS8l
 SLO0CfhTgIgiRnxYEoblMZ4q9Cm9J40+T2+/Ik6jYuA2g5TMnMeNhzk+vr2n4RjZ2Wlnk=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

Introduce size_to_shift() for future users that need to
obtain shift of a huge-page which is other than pmd_psize().

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 tools/testing/selftests/mm/vm_util.c |  2 +-
 tools/testing/selftests/mm/vm_util.h | 12 ++++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 3b42cbdec7a2f..8ef226107d788 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -194,7 +194,7 @@ uint64_t pmd_pshift(void)
 	if (__pmd_psize == -1ull)
 		__pmd_psize = pmd_psize();
 
-	__pmd_pshift = (__pmd_psize > 0) ? ffsl(__pmd_psize) - 1 : 0;
+	__pmd_pshift = size_to_shift(__pmd_psize);
 
 	return __pmd_pshift;
 }
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index ff51c61636505..67ff4bba5707a 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -159,6 +159,18 @@ static inline int sz2ord(size_t size, size_t pagesize)
 	return __builtin_ctzll(size / pagesize);
 }
 
+static inline uint64_t size_to_shift(uint64_t size)
+{
+	/*
+	 * The function returns the corresponding shift only when the size
+	 * is a power of two; otherwise, it returns 0.
+	 */
+	if (!size || (size & (size - 1)))
+		return 0;
+
+	return ffsl(size) - 1;
+}
+
 void *sys_mremap(void *old_address, unsigned long old_size,
 		 unsigned long new_size, int flags, void *new_address);
 

-- 
2.43.0

