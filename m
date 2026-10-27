Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116029;
	b=gMSidqO0sD0Es7uBtKrDgAQTlmN2F6xJJfXWnpHvDuS0Zeio7Vk7v3EULohUaEpUcVnL
	 +4TpRX7hLdQ6yPgQSGwr3x+2+CLT0OZfPTDAb/DpKnioLCIOmQ3g6zxdJkVtlOaOqgVDi
	 jzQJlAUMYKmashyE6JXc6U6zVknkqbeLHGOYzYbXnGIdARHRLwksh3xvUXKwVJF8zoGez
	 me9CY7f0v+Kgzba+JwuM49p2xiUzfJdA184aAdlYCcJjMHKcQIqdbRSDxgRb8duEwkztK
	 p0EGdZkFe3mbic+leGhupO8EH+VEm1D7+aZQ9AnX88xYUvvK07LNJxFGdF8S3ivC3Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I9tKrbL54EVqcIFPPtB7uxrxNAXJtibM80HAzpUcWLM=;
	b=cg2qtvrSlIDCJIG+fWtatL5ib9RtU4KIL6cUvdnqBetuk25pA0ogRII68MkTYiUmefE8
	 kteGicS8RLDwGJA5QPFIh3eNz7O2aSxf4Y/mgSToQC5fcEtCNFfvGPhcQkbA+tdJoj7r3
	 i6GDGADLVlochmdkmB22yfkdYQdLAJkvwTWvIBztzucmsFi1IMiMtZKse63hnEGdnjAWd
	 RTpKsvP3aXzzJWk836rPtkmAuR2r/iu2nPL3z+nXxze2uDFfdfSluFtm/NGSxysubaDqw
	 iJ6WWAI0+yax3sPxz7bOczi4fGK7G/pmZ/5U9QBrsKvv0dIZFCGtiChUBZDyjOD31LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yRmVMWZO;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B1460A2619
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 15:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13B1460A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yRmVMWZO
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so879579f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 08:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793116027; x=1793720827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I9tKrbL54EVqcIFPPtB7uxrxNAXJtibM80HAzpUcWLM=;
        b=yRmVMWZOSgYOouFJ3XXj5aw0KaSgckQYEvRlJmiAj5iMaleGe121rSWoqxNhtg5N14
         hX5jZ8iCw6nxxKWsfk/jfcRNcK4D5RPZtrs/ZHpXMxQdJwUxLv/D02GyG9ly0itjET0l
         QYJWU9CIDnW5SAScmWpFXXCYGxlIWaup/cyg16ZIu7O9e5Jaz34+seo9RmRvx9F/GpWp
         7s0vaOvPuzftBCOXtxey5t+MSQh2D/edaVW4fxD59EZn55DdlWfybRHvnQ7jdJCtNXnA
         aMKrIfeza+LyTAm3fNuJlj9oeBD8wLhxs5ehug6UvNlcUaWev8fOiNZ+aFqThE2FqT+j
         rlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116027; x=1793720827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I9tKrbL54EVqcIFPPtB7uxrxNAXJtibM80HAzpUcWLM=;
        b=lBHTOjHIR+fx9PXr6KhEm70fYCxV7Agew9bsmdMNMy79fhZ5HzY2/CnmQdvgmmquU2
         OUV8PF0l8dkelVgx8VDo6Y5J3CO4oBlrwk0uey9hWjVcenrxSZiv0uvCi/rNv0z4PuNT
         akPhjzFay6vTDixHUJVnzrmxIk7I0lUH0l+HIZhhNoEKxQLDoVhGzN7DjSr6IvJagJfp
         s410njxHOyxL/w1NJN3D+kJzB3FmOIjOx64dfvF2LAibvUkTy0m0rEymOFxh7J4oyeYR
         9jZhNsPnzsIpW/6aa4PzhDlGenJvePbFWVgjEpAviK5OPtMi3By8BaZ26MfxJ1lv4o+y
         ov4A==
X-Forwarded-Encrypted: i=1; AKwUvBy5Ph3mLn1e5eIeOwMvnV5fddsHYOknsqNQ3ELaXGBwfqPWdfv0NQsbcJi928ik5UQeLu+Plolq4RpnWx47V/o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLq7wDHxLeeW8NFoyy3PSnXnvdkJKasPTpYHQDe18WH4sgD06Z9
	CBaeqznoADwe2Am8qVn51UvA+yTyjRkkbvJlJRL0P5owY02ktHJwixqv
X-Gm-Gg: AYBFou1NKtpdeME1qe55JDCAhNG5ItWP0kghMvvnaRKQ5+cIrGfESjUTS4NowSoOEZE
	GXRwIsPX27MNRGFFi94oBxcCmDQGGrpiw/wIz6FjTXPnksuAK/q0nFnZUFrYKlah/VqJL1/VZ3/
	VrSVWxeq+ebkVa545t6pkZ+w5fAN00PcTADyDgQ4g/wCZRxgT1ExO0sVY5CZIPgCTsDB1f6QNJM
	hsoLEvIlpzRwn1VyII8nuZcZM7PkU7vA3nBs5Lf9K2ZPnD28c4jNS6GyCIj2kwmxnqShSfvQuKW
	LBmUuESTcfOVriI/XYRfj6RGvrGPNU2Y6G2sCivwEdV0/0Yc7mEab6EYdxmlk63Uxva0CPyColO
	gt5DTQ/j3NPgr5rInKtk7adjTSgGHthZigY0EldHwMkF69wcD9TLyqVpzsLKxemBfooLgKxYcoH
	MXm55H8TDIfQlkDK0f/mAcCuKv8b/pAISP3xwpyCnJqPC1iqgblpMQ5RlNDreaHg/+nbfQ7xI1f
	oyGmHyqZrD95nQkTREfE0qChfEDn1vXEZ+AUR5Fce1R7qlndNkzLBai5ViEVs787o502bPNrndD
	S3Up+xUMASRRHXCwR8Mt74ZWXlPYdnx+0xSqec4D+L5rdekZA1l/s444QJB48A+38W0z1ooKSqm
	dXY3WBUNrLzSdyAa2NTFc8la954etc9dZIX9Mpg==
X-Received: by 2002:adf:ebcd:0:b0:48e:4ad2:32e0 with SMTP id ffacd0b85a97d-48e55a5a8bemr4605062f8f.29.1793116027147;
        Tue, 27 Oct 2026 08:47:07 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb958sm23845574f8f.21.2026.10.27.08.47.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 08:47:06 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Ackerley Tng <ackerleytng@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: Alex Williamson <alex@shazbot.org>,
	Alexander Graf <graf@amazon.de>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Alexey Kardashevskiy <aik@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Baolu Lu <baolu.lu@linux.intel.com>,
	Bill Wendling <morbo@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Connor Williamson <connordw@amazon.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	David Hildenbrand <david@kernel.org>,
	David Rientjes <rientjes@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Erdem Aktas <erdemaktas@google.com>,
	Frank van der Linden <fvdl@google.com>,
	Gregory Price <gourry@gourry.net>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Hugh Dickins <hughd@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	James Houghton <jthoughton@google.com>,
	Jan Kara <jack@suse.cz>,
	Jianxiong Gao <jxgao@google.com>,
	Joerg Roedel <joro@8bytes.org>,
	Joey Gouly <joey.gouly@arm.com>,
	John Starks <John.Starks@microsoft.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Justin Stitt <justinstitt@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Michael Roth <michael.roth@amd.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Oliver Upton <oupton@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Tycho Andersen <tycho@kernel.org>,
	Vishal Annapurve <vannapurve@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Yan Zhao <yan.y.zhao@intel.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	x86@kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	iommu@lists.linux.dev
Subject: [RFC PATCH 06/14] KVM: guest_memfd: Report the size of holes in export lookups
Date: Tue, 27 Oct 2026 15:46:41 +0000
Message-ID: <20261027154649.91571-7-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027154649.91571-1-griffoul@gmail.com>
References: <20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com>
 <20261027154649.91571-1-griffoul@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fred Griffoul <fgriffo@amazon.co.uk>

A lookup reports a hole as a single page, so a consumer walks a large
private or unbacked range one page at a time, and cannot map a large
hole with one entry, e.g. to a scratch page.

Report the largest aligned hole around the page, up to the order the
caller asks for. The search checks one half-block at a time, so it
costs about one lookup per page of the hole it finds.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
---
 virt/kvm/guest_memfd.c | 48 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 015f6657c386..1c5826c5384e 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -1417,6 +1417,48 @@ static int __kvm_gmem_export_lookup(struct inode *inode, pgoff_t index,
 	return 0;
 }
 
+/* Does no page of [start, start + nr) have a frame to map? */
+static bool kvm_gmem_export_is_hole(struct inode *inode, pgoff_t start,
+				    pgoff_t nr)
+{
+	unsigned long pfn;
+	pgoff_t index;
+	u32 attrs;
+	int order;
+
+	for (index = start; index < start + nr; index++) {
+		order = 0;
+		if (__kvm_gmem_export_lookup(inode, index, &pfn, &order,
+					     &attrs) != -ENOENT)
+			return false;
+		cond_resched();
+	}
+	return true;
+}
+
+/*
+ * The order, up to @max_order, of the largest naturally aligned block around
+ * @index that lies inside the file and has no frame to map.  Each step checks
+ * only the half of the larger block that does not hold @index.
+ */
+static int kvm_gmem_export_hole_order(struct inode *inode, pgoff_t index,
+				      int max_order)
+{
+	pgoff_t npages = i_size_read(inode) >> PAGE_SHIFT;
+	int order;
+
+	for (order = 0; order < max_order; order++) {
+		pgoff_t n = 1UL << order;
+		pgoff_t first = round_down(index, 2 * n);
+
+		if (first + 2 * n > npages ||
+		    !kvm_gmem_export_is_hole(inode, index & n ? first : first + n,
+					     n))
+			break;
+	}
+	return order;
+}
+
 /**
  * kvm_gmem_export_lookup_pfn - The frame behind a shared page.
  * @e:         The export.
@@ -1424,7 +1466,8 @@ static int __kvm_gmem_export_lookup(struct inode *inode, pgoff_t index,
  * @pfn:       The frame.
  * @max_order: In: the largest order the caller can map.  Out: the order of
  *             the naturally aligned block around @index that is contiguous,
- *             shared and of the same @attrs; 0 for -ENOENT.
+ *             shared and of the same @attrs or, for -ENOENT, that has no
+ *             frame to map at all.
  * @attrs:     The GUEST_MEMFD_PFN_* attributes of the block.
  *
  * Takes no reference and allocates nothing, and may be called from the
@@ -1438,6 +1481,7 @@ int kvm_gmem_export_lookup_pfn(struct guest_memfd_export *e, pgoff_t index,
 			       unsigned long *pfn, int *max_order, u32 *attrs)
 {
 	struct inode *inode = file_inode(e->file);
+	int order = *max_order;
 	int r;
 
 	if (index >= i_size_read(inode) >> PAGE_SHIFT)
@@ -1445,7 +1489,7 @@ int kvm_gmem_export_lookup_pfn(struct guest_memfd_export *e, pgoff_t index,
 
 	r = __kvm_gmem_export_lookup(inode, index, pfn, max_order, attrs);
 	if (r == -ENOENT)
-		*max_order = 0;
+		*max_order = kvm_gmem_export_hole_order(inode, index, order);
 	return r;
 }
 EXPORT_SYMBOL_GPL(kvm_gmem_export_lookup_pfn);
-- 
2.47.3

