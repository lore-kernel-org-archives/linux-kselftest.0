Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCBA93BBFD3;
	Mon, 21 Sep 2026 10:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987024; cv=none; b=azrvo4Dac+ZkKEUfa2rxhClapjzxa98N21Qx3BcKmxkDjFjCgf1/te0XXXJtzeZpqFjsga5UizKvbb0Uqf8ECmE++NvIrdgp+8mXSuad1PGI+OwexFnv7FJnXVA4MzSqmm9VXj56Vmv5+p603eU/MUUFXODISb+oBr4EVhWmcgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987024; c=relaxed/simple;
	bh=z6zKDPWdrXtG9iLWi9rtRD0L5GkOLNqFKE7DfB+aIRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rj7ECqxTNEOFWD6QbahHnnoxeXSPURMMZ0UEz0KCMW2HJFbU0OzUGjD5EwkcAjHBbtGyCbfi+MoGpbzYCyNHtYdTdWZGYi6+qReYPqGdrAtNpE0wpIrobb13MTeEbzUQQEczSvdP8XJcThEm9la8Eg9bBChu+foO5ELtquPsny0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Sm+COEAh; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Sm+COEAh"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2235D143D;
	Mon, 21 Sep 2026 03:36:58 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D96A3F86C;
	Mon, 21 Sep 2026 03:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789987021; bh=z6zKDPWdrXtG9iLWi9rtRD0L5GkOLNqFKE7DfB+aIRQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Sm+COEAhvJbXTSdK1abZne3xFxB6pXb9NGTM8dWI3ctOJqcjdGKW4iQgJS2OopPZ8
	 qBYUaMzOpghOMjBzAKhdtOMIMsfnFH31FMGPVCGhR+dlJ1AwUQg85wxnWzdrAzz9bi
	 o49yIVomAqB13hDOwWi5bsI05PROktlr9/a87Uo4=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 21 Sep 2026 11:36:40 +0100
Subject: [PATCH v4 3/3] kselftest: mm: introduce size_to_shift() helper
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-fix_hpage_macro-v4-3-cdea4fc6ce3f@arm.com>
References: <20260921-fix_hpage_macro-v4-0-cdea4fc6ce3f@arm.com>
In-Reply-To: <20260921-fix_hpage_macro-v4-0-cdea4fc6ce3f@arm.com>
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
 h=from:subject:message-id; bh=z6zKDPWdrXtG9iLWi9rtRD0L5GkOLNqFKE7DfB+aIRQ=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqsQi9VlnrICVKSmEAUcfLz+X3SNTnPnmmVJx4T
 PUKUnuuRKmJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarEIvQAKCRBt1cPRWsUx
 My8ZC/9Q9H8MVJ1jK7QQreGRH10Hzcsa3P2Hyz86kIi5/jIeguUvGUmUfWV7D+4Dq20FpNDL2z4
 ub+riKgocduYQDaixCZAwW06zIzSDCdAOoBp2H+2el3O+IAOA047HBlae/74X9sSKf8zUFNqrIo
 kBXhwpONsZWj9vdxpsh40ASMPdytSthFe9AAbYOmNc0Mh04BNg6jtifRdVQbSeHwz/+o3oBXiR0
 o0sKMi6IvpMZAU3zyUJF0Sq7ZqogFjEv8gHl554UPQG7YB8ZwhEojuHw8Oqz0Kc/NEJBiSVBwc4
 T3n7VbgQmCBXaXuoCampv/myhHndZvfcRQj0DzldVPtXtTdcKUhU8F6XwXdWrCQR3OTv7USxsk7
 KW9HvBmr73grKKE8CGQklYYQyuwvCbd6Mu54ezU6S71z+OJCDxXUVteRnVSXHTtkynKuqOuAxyV
 DowvbkpDAHxqDZmRXcMxQTM4YzxQUeqyGDy93DKvTRXV7hnInJGpBCGWpvXwxHJq1sLJk=
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
index 8f80e73dc22a5..970671058397d 100644
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
index 71af4804f8f24..6e37c90f3c3a5 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -148,6 +148,18 @@ static inline int sz2ord(size_t size, size_t pagesize)
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

