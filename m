Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB19F31B83B;
	Fri,  9 Oct 2026 01:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791509275; cv=none; b=n1KIbd6fgKzg1+Nmcqf5GJ0sbmxsKyuB6mNH7Y6UxXVZUtRHkRHkrwmKy6dU7QYRhukfC93Y5XT4bPGZ27EhQrR0XiuttcWk3EGxE9VUoW5OFrABqhdxqhkcbdBgt7iRcB92sygESH5Mx1q9JX897XLifX0pMNJSTLT/aKVR4Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791509275; c=relaxed/simple;
	bh=BW4kltP6qsGC0wjesYshCGa9/T+akVq8hlsP2xOsRGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZNYQjaIQ+vUU3fqnTpqPaTJ0sxswxH1Tc8tdxoLK9/BBKl9WuTbMjlVwWUK+f2Qk3Q/h7mucEGeNXI0yzgJ3pHQQJyWoGmrGn9T8FpQKQq58dcHaLVpF0ZOVibzVds4Q7RPrOnK2Pmax/8lrbmr/0Out1QVxmlRZ5g3LKa406+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ncdaZH26; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ncdaZH26"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5792175D;
	Thu,  8 Oct 2026 18:27:49 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90BB43F8C6;
	Thu,  8 Oct 2026 18:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791509273; bh=BW4kltP6qsGC0wjesYshCGa9/T+akVq8hlsP2xOsRGI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ncdaZH263eQQpKoPp+9vY77MP1zD6+8LZnmJQSva/40XRIR0Z3+m5zmPTBRyJNJrr
	 +S933lE/Uh743ldsoDN3KIMzQY5f1a/xBv9jI94BLBZrDBzat2Px/HjKIbQN2uqML4
	 iHZk7QVbpt3w4KhaD4p31/lid8nL3ONyyBvgBUlw=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Fri, 09 Oct 2026 02:27:34 +0100
Subject: [PATCH v5 3/3] kselftest: mm: introduce size_to_shift() helper
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-fix_hpage_macro-v5-3-54378ae45add@arm.com>
References: <20261009-fix_hpage_macro-v5-0-54378ae45add@arm.com>
In-Reply-To: <20261009-fix_hpage_macro-v5-0-54378ae45add@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1684; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=BW4kltP6qsGC0wjesYshCGa9/T+akVq8hlsP2xOsRGI=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqyEMJkxuAyamllnil5Dcw8F4xoHUrxiEbWhjSc
 O38qC/mMyOJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCashDCQAKCRBt1cPRWsUx
 M8bmC/9KLjWP7sj7aB73kK9gXumDcMHmbkTe4jg10tXLQdfS4O4oZKH5hZDix5sKKY8o3NmB0DF
 zL/p5ZuiBX6Irad0kSqZax6XfhaIX0bDE5qs1oIYnOJWUEt/zL1m4i17msMeRk68z8AcsIY8QHa
 AHQMzhtvGIWfJ3i+QwuF7SZMkQo/ss4d4ENXEJpsi38cmB0Rm2DBWQ5wfbHLyZLLzQcrj0hUicC
 QUSH4ZJ1Np3HK/NUjZjn4mMSccb7PW6REjLxq+p31F7CyIsA1384J61uOc0w8ERqncCzEvWAz6f
 O4YRoyNPBTf7I/HeQP+7OoLAg0rQBnCbUo/SUzGN92ptt5ypzH4ZlaW68538/H/+O8Osc6bWXd0
 a3IBnn295tkzDEvmJZQ6bm0euzUc3WzKnxmhVBnSFj/DwL4pVmbjNhSqksUsXGIUWwZskylcYlX
 ZKWqW2LDZ1ynxcF1qPYHx74HhNZ9Uczm1ak4e9TS0CVKuSTaGjX1SNwomvGPOx3XkQkFk=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

Introduce size_to_shift() for future users that need to
obtain shift of a huge-page which is other than pmd_psize().

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 tools/testing/selftests/mm/vm_util.c |  2 +-
 tools/testing/selftests/mm/vm_util.h | 12 ++++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index efd99298be135..7175ac8bfdaa3 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -194,7 +194,7 @@ uint64_t pmd_pshift(void)
 	if (__pmd_psize != -1ull)
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

