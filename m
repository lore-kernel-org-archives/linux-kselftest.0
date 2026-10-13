Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DA0B4D9F96;
	Tue, 13 Oct 2026 09:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884792; cv=none; b=dJdh/QfJ5VTSugRc2XEqqMUjT3bNVCwuHgbWJ70JTTsApdO2472wGejpsR2sssuCQzOhXE1tWCv6PybJSbbJv1Vdjpte/M7IqXLhl8Nk4RyYqYKxwpifM5hGdMPzu/rBtbOQTV/pGXB2TGwYsWhTzK1wZfLdYXwKBuM36Qo7AVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884792; c=relaxed/simple;
	bh=Rk5F+YgXDtLeCJh1Tw15hbS1luettNZ6/VQSYJ/YyaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FBMjPfwyaLZHXWsJTveGXuv1kep6zaZA11EubDvV5bAV2CzHes2ma7atGxDGqBfaN7eXLX3rUYh4dVlvpeyeLM12CymtW3O1Ql4lGle93kHIBXrdtIQRsXY/SOn/md29O0YdqFrmRgw94FrSgExZ6NgZlVJn/tzqr4sGxJ2kAjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Zzu6nG7s; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Zzu6nG7s"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4638F2934;
	Tue, 13 Oct 2026 02:46:27 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 04E983F7B4;
	Tue, 13 Oct 2026 02:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791884790; bh=Rk5F+YgXDtLeCJh1Tw15hbS1luettNZ6/VQSYJ/YyaA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Zzu6nG7sEEU3wq7e8YLpxUuKNz7L/c63u5rqI106GFvaosyQWRcwezEQXe1K3q/vI
	 YGEBPaYtRtcvlW+7g6rjOedPJrEFHKniD55pmEOIoxlPuc06nTV003DfmQfgIaRXIo
	 F5iCF6UIdMYcGWNbd9sCPj8Dcjbi1F8SL7zacVUs=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Tue, 13 Oct 2026 10:46:06 +0100
Subject: [PATCH v6 3/3] kselftest: mm: introduce size_to_shift() helper
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-fix_hpage_macro-v6-3-2c52d0484de3@arm.com>
References: <20261013-fix_hpage_macro-v6-0-2c52d0484de3@arm.com>
In-Reply-To: <20261013-fix_hpage_macro-v6-0-2c52d0484de3@arm.com>
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
 h=from:subject:message-id; bh=Rk5F+YgXDtLeCJh1Tw15hbS1luettNZ6/VQSYJ/YyaA=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqzf3mXDurSPW14xWa1Yg53Yew0NcF722uPAkgr
 fWCFRdvgNaJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCas395gAKCRBt1cPRWsUx
 M1FQC/4vx32QNecL5GVdpG4R/rcnuylGSMdFDpzHdGPZbebIYCcuYvdcrQUx8rcVf9DbuIlzuHB
 SVP38VmBOdkOstbS8JU5NcxKDuiH/zCGVt1Gmuypzt2hhfA0iXhWOCnAn1uu0fzQdF6vDP1tbof
 8QpZNGWPeL7vYLPw0vLZV9YuW/NY5+bBbK4xtKwSofXcFOI7oVrJD2s7ctsPjiqsyLbfdxezzv4
 znpkhv6JwYHCfWrN47/rB24a8bEG1eBCoeH8WdCl1AYH6f/YxdY6OD9292CysqK3URfbVR4WkQu
 wYGcjFDCY3goQ+cJ5nxwP5kM+C5KZ/Xmn3Y/f/X+i/3mxb2EGdG0PQjMpKcZyUK80GnMDV61cLd
 xObOA20X0QRx/ieiaVlB9qn0w34wEjRCY/pKY91cC/ew21cG3FrNAlgTDzO9terWydXot3ex/fE
 4Tpjsk4XUw0T96DCX2C2OgS+9p1w1RY/Kz1tCcxeFuHuMtYeuxTx7OqyLm3f9PVzoLpyE=
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

