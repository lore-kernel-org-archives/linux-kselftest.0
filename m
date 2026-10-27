Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116032;
	b=g6l2sHCAvyMdx5m3HNAnd0sxltRfs15GxpAI/XJauoQMbmlH1L01IeP/xHPk10z1+nqd
	 d5Z/hvdSImUTkTcgipMJhWbVYrFzkx9xRNIhS9i/8/ZklMkopPNxwjK5BA8pGyw4gW6uW
	 pJSH2VjSqNJ0a/B7nOI5I1Ocrf1kdi8hqFnSiGS4UqK+McBD0JCFmXLX/MyL51ZxG6nB5
	 JGfKJDg5F7g/eGRi6qVp988StEeOKFeCXoa6IX6BTDzvUWQPgoNFeS2JDfJtb9Qcd4pMK
	 Iz4pxLI1iYm8aom6wA2Jz7AxCUwvFlagKgnZvC+VtwiMQK+t1Bmi9WGTHGBZUYqYVZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=d/rRV11tp+2yuBy0nAi8FWDuCnsXGLzbLZWeXfMh4bw=;
	b=guEwAp+5EtriLW3DhPeX21Lb1tFyQEu3/8koVfTtGlUOmiHt+bo+rB5mMo7/kleTo0wU
	 5K62jY50e/8owEQidKq6G0t02Rxbd2t2JAy9iwK3ZE8I7B+ZTf4Z2lxzxO5aNJpmZfkSQ
	 rtEpKmYmdXwO1iVw3ug63GScCU/IPaubSbB7tip92z2VH0RKYDps87gHvML4nhsipOTYg
	 Lt5yNlRI6k9UlPyU6BLf8JFg4RxoSRBzp5C/o+2kqlK/zuwHtrxzTXP9piHbu904tVo9w
	 TeaJKb4zrWQSXSHDyebi33vgyQl8QowwEUme/3QPnFpj0VFDjvM7QDw+rD64vXsaSKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jux9d5gu;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97B3606C80F
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 15:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B97B3606C80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jux9d5gu
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c4d870d54so2512637f8f.2
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 08:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793116030; x=1793720830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d/rRV11tp+2yuBy0nAi8FWDuCnsXGLzbLZWeXfMh4bw=;
        b=Jux9d5gu+U/JKK47BPRXW0VzMZt6ISSwhCuf2Lrv2ac1n5K2DdIMHseG8eKEkLPrFP
         YqOH99G62fCx+QN9/riTZkrcb5zOyeW08t088O6PjYqTtutR84YBwITNPrsinC38ZCUJ
         04MY6mWh2LNbjisoz6UhcNTn2UwJm+0HHNiuE8Vq2/JCzKie2yArQ/oYjOIPzDujVv9E
         2hDTKOLEoyI+gAWdA/mUgvvVl+kXhsTBi25wtBHIy5jDsRvfQZPVgBbXzMYMzlCq8lJO
         gsk8F10hj92llR7Bvd89wYyd3/068X8oX1bgmuBlBW5AGnaAhRgA9WaWdTVceTCqycFv
         gO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116030; x=1793720830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d/rRV11tp+2yuBy0nAi8FWDuCnsXGLzbLZWeXfMh4bw=;
        b=dxk8S0hS9YRqbXqzoX9hyNZD+CGKYFAgxJ7ZSvPf3n91T1T0y8p19IhYD02weg3Ko8
         t2OJCVUyJAi7IsjH5UvwTgHv8GKVPWBFs/+3qYp7vfpCH4eWvM4GdbxcEtpvbUJm+AAy
         2dZmVXz02MAbxaW5ehrTmZLsdrTD1dPf7mC5PCWZv6ALf9nma3QrDdhg7PlS00x3imx9
         awT/NIEWS77fkgukZMr0uv3U2Yj1nGdoVs+apHNaIrz4jDJwyO6Kh6zoZfz9Yn2jJhyt
         FeNCM3IXDnNqH+3MGhnzlWiTGeZmY8kRaiAb77igiNcaDABM45NkqeuS4SspYzGwzACa
         Kqhg==
X-Forwarded-Encrypted: i=1; AKwUvBwxnuZFxbaAre4+LgGeD9et/bP4rDZhj1WkAb8n2lRIfmDMJTeULB4CJGEsdCIqp1Cr7CJUZs4zuhmOViXiwpM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLw34JIz5LG+OcwQlZfqBt6WL+PYZ4y3XNhHM1SL+tXCWiBY+VQ
	U4iVfo2UPDUaRAFWK9LPE19jFUbCY3HvU3HlQm0+aTUFig9OwfXVezdo
X-Gm-Gg: AYBFou3ObxNd1/msR+fWpN8QyyJ1kgze+pzyustfsDJgYGeYvQM14G0qZC90sajX9c4
	sdT1wK9RZQFoeKbrfwcyY0fAsuJAXGni0p2h4cyZRUxSrc3GqqarJRFf/1x/tOPGBan1odg6f0i
	tHCgkqJc3TZiYnb9kt6MQ+WbiRHqBIvh5gMtYFYuzKm0brBoyCVBAj+4jDT803n+im0G6gZ3nsN
	PIbgjlZPJNulGSUvS9YuNycF2hhAl1Z4vqTE42n+eG7ApNnFKi/1s6DswH5uL9SKqLS2OYtZgwZ
	1tY+b7wv1Vu7JGTDKnU+GKPPYK8WN9yvaclNIXgivsRcRVb/Ap3XefTlneQeVQ7cpNLh41pT1BF
	dWtdqzkAEKEo3h49uq+pmZhNLYDsFqYwA1f5sQ5tljsY0mfBmHkYJuLL/bf1VqegfeB5akNDgE+
	Gj64rJu9aVq5s0ISd04k2a4LI18GC2ksd5c5cy31uSe5qlzVnS2id48RTstguV8LRltXDGydh4k
	zUKpo6X6qBxrqTZvk0Uao7tEy9kb+HvXURtImswuEHEv80W9GUkb/ejtYWZg9c65MOcy24yG5NX
	oa8UfpFbfmFL/2wSbg+Nn4hf+059he/nD4IOTAexQ7TwmcpNCBeQu/mcAJn6JiEhXkJd0iMbK/p
	ul+goZPX/qKsxMdC5
X-Received: by 2002:a05:6000:188b:b0:486:f9ea:796f with SMTP id ffacd0b85a97d-48e3eb9ed13mr20773527f8f.41.1793116029637;
        Tue, 27 Oct 2026 08:47:09 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb958sm23845574f8f.21.2026.10.27.08.47.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 08:47:09 -0700 (PDT)
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
Subject: [RFC PATCH 07/14] KVM: guest_memfd: Update exports when pages are allocated
Date: Tue, 27 Oct 2026 15:46:42 +0000
Message-ID: <20261027154649.91571-8-griffoul@gmail.com>
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

An export maps only the pages that have memory when it looks them up,
and a device cannot fault in the others, so guest_memfd must call
update() when a page gets memory.

Lookups treat a folio that was never zeroed as a hole. Zero folios in
one helper, under the invalidate lock, from the host fault, KVM's
get_pfn() and fallocate(), which did not zero at all, and update the
exports for each folio zeroed. Mark zeroed folios dirty: lookups hold no
reference, and memory-failure handling evicts clean folios that nothing
references.

In PFN mode, update the block that get_pfn() reports when it fills a
hole, since the provider may back all of it.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
---
 include/linux/guest_memfd.h | 26 ++++++------
 virt/kvm/guest_memfd.c      | 85 +++++++++++++++++++++++++++++++------
 2 files changed, 85 insertions(+), 26 deletions(-)

diff --git a/include/linux/guest_memfd.h b/include/linux/guest_memfd.h
index 937693ae9573..f8e89723dd68 100644
--- a/include/linux/guest_memfd.h
+++ b/include/linux/guest_memfd.h
@@ -90,13 +90,14 @@ static inline int kvm_gmem_revoke(struct inode *inode, pgoff_t start, size_t nr_
  * nor fault them.  It attaches to the file, looks up the frame behind each
  * shared page without taking a reference, and guest_memfd calls its update()
  * whenever what a lookup returns for a range may have changed: conversions,
- * punch holes, memory failure and a provider's kvm_gmem_revoke().  update()
- * makes the consumer's mappings of the range match what a lookup returns now:
- * a frame, or a hole for a private page or a page without a frame.  It may be
- * called for pages that did not change, and for ranges that do not follow the
- * blocks that lookups report: the consumer may then remap whole blocks, also
- * outside the range, e.g. to merge them into larger mappings.  A consumer that
- * can fault may instead only remove its mappings of the range.
+ * punch holes, memory failure, a provider's kvm_gmem_revoke(), fallocate() and
+ * pages getting their first frame.  update() makes the consumer's mappings of
+ * the range match what a lookup returns now: a frame, or a hole for a private
+ * page or a page without a frame.  It may be called for pages that did not
+ * change, and for ranges that do not follow the blocks that lookups report:
+ * the consumer may then remap whole blocks, also outside the range, e.g. to
+ * merge them into larger mappings.  A consumer that can fault may instead only
+ * remove its mappings of the range.
  *
  * Until update() returns, the frames it replaces stay valid, so a consumer
  * may switch each mapping to its new target in one step; once it returns,
@@ -105,11 +106,12 @@ static inline int kvm_gmem_revoke(struct inode *inode, pgoff_t start, size_t nr_
  * beforehand.
  *
  * guest_memfd calls update() with its invalidate lock held, exclusive when it
- * takes frames away or pages convert and shared on memory failure, possibly
- * with a folio of the file locked; so update() may only call
- * kvm_gmem_export_lookup_pfn().  Under the shared lock, updates may run at the
- * same time, also for overlapping ranges.  The consumer holds a lock across a
- * lookup and the mapping it installs, which update() also takes.  Lock order:
+ * takes frames away or pages convert, and shared when pages only gain frames
+ * and on memory failure, possibly with a folio of the file locked; so update()
+ * may only call kvm_gmem_export_lookup_pfn().  Under the shared lock, updates
+ * may run at the same time, also for overlapping ranges.  The consumer holds a
+ * lock across a lookup and the mapping it installs, which update() also takes.
+ * Lock order:
  *
  *   PFN mode provider lock (across kvm_gmem_revoke())
  *     guest_memfd invalidate lock
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 1c5826c5384e..42bb5f263e23 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -286,7 +286,8 @@ static bool kvm_gmem_range_has_attributes(struct inode *inode,
  * There is no backing storage for the memory, so the folio will remain
  * up-to-date until it's removed.
  *
- * Ignore accessed, referenced, and dirty flags.  The memory is
+ * Ignore accessed and referenced flags; the dirty flag only keeps a zeroed
+ * folio in the page cache, see kvm_gmem_folio_zero().  The memory is
  * unevictable and there is no storage to write back to.
  */
 static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
@@ -430,7 +431,8 @@ static void kvm_gmem_invalidate_end(struct inode *inode, pgoff_t start,
 
 /*
  * What a lookup returns for [start, end) may have changed: exclusive lock when
- * frames were taken away or pages converted, at least shared on memory failure.
+ * frames were taken away or pages converted, at least shared when pages only
+ * gained frames and on memory failure.
  */
 static void kvm_gmem_update_exports(struct inode *inode, pgoff_t start,
 				    pgoff_t end)
@@ -590,6 +592,64 @@ int kvm_gmem_revoke(struct inode *inode, pgoff_t start, size_t nr_pages,
 }
 EXPORT_SYMBOL_GPL(kvm_gmem_revoke);
 
+/*
+ * Zero a folio on its first use.  Lookups find it from then on, with no
+ * reference held, so mark it dirty: memory-failure handling drops clean
+ * folios that nothing references from the page cache (mapping_evict_folio()).
+ * Called with the folio locked.  Returns true if the folio was zeroed.
+ */
+static bool kvm_gmem_folio_zero(struct folio *folio)
+{
+	if (folio_test_uptodate(folio))
+		return false;
+
+	folio_zero_range(folio, 0, folio_size(folio));
+	folio_mark_uptodate(folio);
+	folio_mark_dirty(folio);
+	return true;
+}
+
+/* Zero a folio on its first use, and tell the exports.  Under the lock. */
+static void kvm_gmem_folio_clear(struct inode *inode, struct folio *folio)
+{
+	if (kvm_gmem_folio_zero(folio))
+		kvm_gmem_update_exports(inode, folio->index, folio_next_index(folio));
+}
+
+/*
+ * get_pfn() in PFN mode, which may back a hole: then tell the exports about
+ * the whole block that get_pfn() reports, as the provider may have backed all
+ * of it.  Called with the invalidate lock held.
+ */
+static int kvm_gmem_pfn_get(struct inode *inode, pgoff_t index,
+			    kvm_pfn_t *pfn, int *max_order, u32 *attrs)
+{
+	pgoff_t npages = i_size_read(inode) >> PAGE_SHIFT;
+	struct gmem_inode *gi = GMEM_I(inode);
+	bool hole = false;
+	unsigned long raw;
+	pgoff_t first;
+	int order, r;
+	size_t nr;
+
+	if (!list_empty(&gi->exports))
+		hole = gi->provider_ops->lookup_pfn_range(gi->provider, index,
+							  &raw, &nr) == -ENOENT;
+
+	r = gmem_provider_get_pfn(gi, index, pfn, &order, attrs);
+	if (r)
+		return r;
+
+	if (hole) {
+		first = round_down(index, 1UL << order);
+		kvm_gmem_update_exports(inode, first,
+					min(first + (1UL << order), npages));
+	}
+	if (max_order)
+		*max_order = order;
+	return 0;
+}
+
 static long kvm_gmem_allocate(struct inode *inode, loff_t offset, loff_t len)
 {
 	struct address_space *mapping = inode->i_mapping;
@@ -619,7 +679,7 @@ static long kvm_gmem_allocate(struct inode *inode, loff_t offset, loff_t len)
 				break;
 			}
 
-			r = gmem_provider_get_pfn(gi, index, &pfn, &max_order, NULL);
+			r = kvm_gmem_pfn_get(inode, index, &pfn, &max_order, NULL);
 			if (r)
 				break;
 
@@ -647,6 +707,8 @@ static long kvm_gmem_allocate(struct inode *inode, loff_t offset, loff_t len)
 
 		index = folio_next_index(folio);
 
+		/* Zeroed now, so that a device can map it before first use. */
+		kvm_gmem_folio_clear(inode, folio);
 		folio_unlock(folio);
 		folio_put(folio);
 
@@ -819,7 +881,7 @@ static vm_fault_t kvm_gmem_pfn_fault(struct vm_fault *vmf)
 	u32 attrs;
 	int r;
 
-	r = gmem_provider_get_pfn(GMEM_I(inode), vmf->pgoff, &pfn, NULL, &attrs);
+	r = kvm_gmem_pfn_get(inode, vmf->pgoff, &pfn, NULL, &attrs);
 	if (r)
 		return vmf_error(r);
 
@@ -873,6 +935,8 @@ static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
 		folio = kvm_gmem_get_folio(inode, vmf->pgoff);
 		if (IS_ERR(folio))
 			r = PTR_ERR(folio);
+		else if (!folio_test_large(folio))
+			kvm_gmem_folio_clear(inode, folio);
 	}
 	filemap_invalidate_unlock_shared(inode->i_mapping);
 
@@ -891,11 +955,6 @@ static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
 		goto out_folio;
 	}
 
-	if (!folio_test_uptodate(folio)) {
-		clear_highpage(folio_page(folio, 0));
-		folio_mark_uptodate(folio);
-	}
-
 	vmf->page = folio_file_page(folio, vmf->pgoff);
 
 out_folio:
@@ -1887,7 +1946,8 @@ static struct folio *__kvm_gmem_get_pfn(struct file *file,
 	}
 
 	if (kvm_gmem_is_pfn_mode(gi)) {
-		r = gmem_provider_get_pfn(gi, index, pfn, max_order, attrs);
+		r = kvm_gmem_pfn_get(file_inode(file), index, pfn, max_order,
+				     attrs);
 		if (r)
 			return ERR_PTR(r);
 		return NULL;
@@ -1903,10 +1963,7 @@ static struct folio *__kvm_gmem_get_pfn(struct file *file,
 		return ERR_PTR(-EHWPOISON);
 	}
 
-	if (!folio_test_uptodate(folio)) {
-		clear_highpage(folio_page(folio, 0));
-		folio_mark_uptodate(folio);
-	}
+	kvm_gmem_folio_clear(file_inode(file), folio);
 
 	*pfn = folio_file_pfn(folio, index);
 	if (max_order)
-- 
2.47.3

