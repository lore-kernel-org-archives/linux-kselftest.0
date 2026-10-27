Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116027;
	b=CR2e0WyxxsknsseFq1hByPQkPHlLWBMfiagmjx4c/Ku8wGo+Zh9IBE8NbKsFdx8XTlTZ
	 TdyNT27mK5UWNjjJ4bnhsm7Shxk99zMNEXinBOVIfXDo/UnUlQtgD+bFCCHnBZHZDLeFG
	 3MtMWE2CSl03lGSN+lPK5F+LbYT9I7gN+WedohzSueUdCQ3JuuAvsu44zaPXlofH5XNEL
	 sbUx5cN/b7x4rf4rreNYFH9PPrbsRF+hnODf6vEU/W3so5qkAYsxHv0h/I/kcY9Xl/cIS
	 r+K39YDEQ2sJGuFGX6GZlyEIKTXQQ480V7Ajsa6zA9KaB8TbtDMNogHGEiqYwGuvkHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XmHIaCziVnimE5Tmq06/pKlKxzGziqQCKkgGCcdE51k=;
	b=ibTMRKyeniV7OZJmVxKqHzrOr2Gkc5S1XPTZswzLoFQ72BF3OpgpES6GyhZc2EMeBwmH
	 6LDBrCUawxji2JtIH9r2woOqbL1FkYChZlICr39KZnZa9rmegVp6ZBNIaT+ZanTMIator
	 l5u3pHAWUdAuEyEHYrLkry1N2m8fP7htJmHRVpSQcrm+LdN4FwgnCwV8+/OR4MEqgCUaw
	 qndXQnHEaHkHO0D+509XGi/ZhAdcr/M144kFFNrj5+5KJ7oKcpgStPjMIaLl7NMoDTtZC
	 LvOQvMnGNoU0fCnPnUed06PtwEwZpYoBXlTHzoNHE6FdhelWs+c/aRmcEAlwmx3/kNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BWMnuKNw;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7E460A260E
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 15:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E7E460A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BWMnuKNw
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso2771575f8f.2
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 08:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793116025; x=1793720825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XmHIaCziVnimE5Tmq06/pKlKxzGziqQCKkgGCcdE51k=;
        b=BWMnuKNwkUIsg/xi7Dojw2DKA9HyTFm1rYfslZ1kWsUooYdXiev5uQe3fCIiRcLTJe
         BOt+ywUrGhA5gaTElmDmLyzvE3FNktKx+RideLJ6qrvGIOU7bZipQV7CC4uMnSdYDoEF
         T6O7uDOKqHgILyQ2QSTVfA4IvoOCT5UQm6VWb3vRs2Yi7xGhCszIzVKvR4nir0AzsOTU
         M0Cr+zJeJNo2MKoUBC5gL5GDordqHTiCXdmmF4oVqKvfc8zgkavkOtE6A/cr4ISkiJqz
         xcuDgYxeQX7N3KPl2llKKe2iAQdUM5amXjxxeZQJbKUl/0ERgRM9tDTltxLe7Nkg8ZQA
         EIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116025; x=1793720825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XmHIaCziVnimE5Tmq06/pKlKxzGziqQCKkgGCcdE51k=;
        b=0vpleyE74k20jwtGabqDbn5lv/EL4GLDjEHf+Yvbansx/TI+4Gd7LNvvR94XfokPbf
         zdLfVStJdyft5RBYlFf5xHHYwGh1wRnJue8hMfVAEpfUcyUbWPOHxcLrJowFBnTI4oKw
         kiv2TY1b0BUTu+es1VFpzzlj33Hkv5K5tDe9Te5pMvE+FBvkp5gVVC7OhlMo83H2x65x
         dTy5Wgq9g9rYGXIDnkD5YCi88K1FDKlBugqeHXx+BSlKNNSZdoPmxo/gis2b5phvh7Qf
         YkxKWholYofpDd7XP1jPcmzL0GGsCt/Ns8zHLcZ2IkVP1L7D8j4Xg4ca/dOpbMA9dp10
         oKCw==
X-Forwarded-Encrypted: i=1; AKwUvBzGDR4HQltEluxGQjidIbcrKkJSWVPdJziWIE1bCgpnKesuoGL3wv5ONh9QPMWh2tkbLLfzf1UOs21qRQAKcD8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7gSrXVLhdmzx6PalxbjpMjKMTv/Pg1koFp8y+UGPa527mR+im
	CECPx8hF8pQFtQZhBrvjjxCtWyWUrXk/+79pxCvIjWy8DLlpyr11oxLT
X-Gm-Gg: AYBFou1OPrEO5anOrEhz4dd4SdP2OrDKWTjygnoY2zJGwbnaCjZXBvqtrW+XgSPtgDg
	HQApjuDo785SnreHyQvBMgFdB7y0Jri0LCXcarh4Tv5J+p45Sj1QhbFL8+K7D9FZWJ6bF9lriwf
	ZA3/pe53ERJDQ3qKMBgfsBEYTY5sDX5yqRFsAyDh7/3lLGDV4lHlLA4rhqiAX0ESIawJGphH5Nz
	aZqkZ5eEdAainOvkuzvlJlipVuMG27PgXIYrQwa9mo7W5m+QVh/dagWKDrCNasoaRncMRR3vgm6
	9UL5AsC5teMTX1GegpQb1jvY5KAUZ3aO1YNStgHE3lIk+6JTSh9ygLOBNWpCAaNrJFebtaBB8Ji
	zwPYUL5SNS5uUD3/Moo6q4wJyEQNqKiiyPLSLoFjDz2jIxrQYxTwS5LFSk+qhbh96vT484Zi5l3
	BE+NQVQH7cFiUQMIi5kjqYxKcyPnSbQ/6OUN93WLTJ533IOJY/Z9GeQ/KwrcH7Pdio20xeFOTiS
	RTS4HnoFGrxq9+fza3CmKMgwucVRYFEmWSYte3LSSu/8mixC+l5rovDemdD9JuLVW+FKZiX+O5Z
	td3I18rKI4BsgUZrW+BKKcMPpOR2Ps9XzDy6hmZK6vIDZmHkIzfI3S2kO3i8LwTM5mYzER84QRR
	8AEXkWu2NqXT+NlbwrkWt3Wnogt6mcfGNB5bRvg==
X-Received: by 2002:a5d:5f48:0:b0:48e:4835:de5f with SMTP id ffacd0b85a97d-48e4835de71mr16505478f8f.47.1793116024472;
        Tue, 27 Oct 2026 08:47:04 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb958sm23845574f8f.21.2026.10.27.08.47.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 08:47:04 -0700 (PDT)
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
Subject: [RFC PATCH 05/14] KVM: guest_memfd: Export PFN mode files
Date: Tue, 27 Oct 2026 15:46:40 +0000
Message-ID: <20261027154649.91571-6-griffoul@gmail.com>
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

PFN mode files cannot be attached yet, though a provider's frames are
the memory that most needs a device mapping that follows its revokes.

Allow them. A lookup asks the provider with lookup_pfn_range(), which
allocates nothing, then get_pfn() for the block and its attributes. A
revoke updates the exports before the frames are reclaimed. A punch hole
must remove the frames from the exports before the provider gets them
back, while the provider still backs them: lookups report the range as
holes until then, and the exports are updated again afterwards.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
---
 include/linux/guest_memfd.h |  20 ++++---
 virt/kvm/guest_memfd.c      | 111 ++++++++++++++++++++++++++++++------
 2 files changed, 105 insertions(+), 26 deletions(-)

diff --git a/include/linux/guest_memfd.h b/include/linux/guest_memfd.h
index ba3eebb1ed1a..937693ae9573 100644
--- a/include/linux/guest_memfd.h
+++ b/include/linux/guest_memfd.h
@@ -90,13 +90,13 @@ static inline int kvm_gmem_revoke(struct inode *inode, pgoff_t start, size_t nr_
  * nor fault them.  It attaches to the file, looks up the frame behind each
  * shared page without taking a reference, and guest_memfd calls its update()
  * whenever what a lookup returns for a range may have changed: conversions,
- * punch holes and memory failure.  update() makes the consumer's mappings of
- * the range match what a lookup returns now: a frame, or a hole for a private
- * page or a page without a frame.  It may be called for pages that did not
- * change, and for ranges that do not follow the blocks that lookups report:
- * the consumer may then remap whole blocks, also outside the range, e.g. to
- * merge them into larger mappings.  A consumer that can fault may instead only
- * remove its mappings of the range.
+ * punch holes, memory failure and a provider's kvm_gmem_revoke().  update()
+ * makes the consumer's mappings of the range match what a lookup returns now:
+ * a frame, or a hole for a private page or a page without a frame.  It may be
+ * called for pages that did not change, and for ranges that do not follow the
+ * blocks that lookups report: the consumer may then remap whole blocks, also
+ * outside the range, e.g. to merge them into larger mappings.  A consumer that
+ * can fault may instead only remove its mappings of the range.
  *
  * Until update() returns, the frames it replaces stay valid, so a consumer
  * may switch each mapping to its new target in one step; once it returns,
@@ -111,8 +111,10 @@ static inline int kvm_gmem_revoke(struct inode *inode, pgoff_t start, size_t nr_
  * same time, also for overlapping ranges.  The consumer holds a lock across a
  * lookup and the mapping it installs, which update() also takes.  Lock order:
  *
- *   guest_memfd invalidate lock
- *     consumer lock
+ *   PFN mode provider lock (across kvm_gmem_revoke())
+ *     guest_memfd invalidate lock
+ *       consumer lock
+ *         provider leaf lock (get_pfn(), lookup_pfn_range())
  *
  * A consumer attaches and detaches outside its lock.  KVM may be a module
  * while the consumer is built in: consumers reach these with symbol_get().
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 65a951fa49c2..015f6657c386 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -40,6 +40,12 @@ struct gmem_inode {
 	const struct guest_memfd_provider_operations *provider_ops;
 	/* Subsystems that map the file, see include/linux/guest_memfd.h. */
 	struct list_head exports;
+	/*
+	 * A PFN mode punch hole in progress: lookups find holes in
+	 * [punch_start, punch_end) until the provider has the frames back.
+	 * Written under the invalidate lock, read without it.
+	 */
+	pgoff_t punch_start, punch_end;
 
 	u64 flags;
 	/*
@@ -515,15 +521,32 @@ static int __kvm_gmem_revoke(struct inode *inode, pgoff_t start,
 	kvm_gmem_invalidate_start(inode, start, end, filter);
 
 	if (kvm_gmem_is_pfn_mode(GMEM_I(inode))) {
+		struct gmem_inode *gi = GMEM_I(inode);
+
 		unmap_mapping_range(inode->i_mapping, offset, len, 0);
+		/*
+		 * A punch hole gives the frames back only after the reclaim:
+		 * until then, lookups find holes.  Afterwards, the exports map
+		 * what the provider backs the range with.
+		 */
+		if (put_pfn_range) {
+			WRITE_ONCE(gi->punch_start, start);
+			/* Pairs with the smp_rmb() in kvm_gmem_export_pfn(). */
+			smp_wmb();
+			WRITE_ONCE(gi->punch_end, end);
+		}
+		kvm_gmem_update_exports(inode, start, end);
 #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_RECLAIM
 		if (pfn)
 			kvm_arch_gmem_reclaim(*pfn, nr_pages);
 		else
-			kvm_gmem_pfn_reclaim(GMEM_I(inode), start, end);
+			kvm_gmem_pfn_reclaim(gi, start, end);
 #endif
-		if (put_pfn_range)
-			gmem_provider_put_pfn_range(GMEM_I(inode), start, nr_pages);
+		if (put_pfn_range) {
+			gmem_provider_put_pfn_range(gi, start, nr_pages);
+			WRITE_ONCE(gi->punch_end, 0);
+			kvm_gmem_update_exports(inode, start, end);
+		}
 	} else {
 		kvm_gmem_truncate(inode, start, end);
 	}
@@ -1258,8 +1281,7 @@ static struct file_operations kvm_gmem_fops = {
  * guest_memfd calls @e->ops->update() from now on, and holds a reference to
  * @file until kvm_gmem_export_detach().  May sleep.
  *
- * Return: 0, -ENODEV if @file is not a guest_memfd file, or -EOPNOTSUPP in
- * PFN mode.
+ * Return: 0, or -ENODEV if @file is not a guest_memfd file.
  */
 int kvm_gmem_export_attach(struct file *file, struct guest_memfd_export *e)
 {
@@ -1267,8 +1289,6 @@ int kvm_gmem_export_attach(struct file *file, struct guest_memfd_export *e)
 
 	if (file->f_op != &kvm_gmem_fops)
 		return -ENODEV;
-	if (kvm_gmem_is_pfn_mode(GMEM_I(inode)))
-		return -EOPNOTSUPP;
 
 	e->file = get_file(file);
 	filemap_invalidate_lock(inode->i_mapping);
@@ -1310,28 +1330,83 @@ static bool kvm_gmem_range_is_shared(struct inode *inode, pgoff_t index,
 	return true;
 }
 
+/*
+ * PFN mode: lookup_pfn_range() first, so that nothing is allocated, then
+ * get_pfn() for the order and attributes.
+ */
+static int kvm_gmem_export_pfn(struct gmem_inode *gi, pgoff_t index,
+			       unsigned long *pfn, int *max_order, u32 *attrs)
+{
+	pgoff_t punch_start, punch_end;
+	int order = *max_order, block;
+	unsigned long raw_pfn;
+	size_t nr_pages;
+	kvm_pfn_t frame;
+	int r;
+
+	/*
+	 * The end first: a new end comes with its start, and an old end of 0
+	 * makes the window empty.
+	 */
+	punch_end = READ_ONCE(gi->punch_end);
+	/* Pairs with the smp_wmb() in __kvm_gmem_revoke(). */
+	smp_rmb();
+	punch_start = READ_ONCE(gi->punch_start);
+	if (index >= punch_start && index < punch_end)
+		return -ENOENT;
+
+	r = gi->provider_ops->lookup_pfn_range(gi->provider, index, &raw_pfn,
+					       &nr_pages);
+	if (r)
+		return r;
+
+	r = gmem_provider_get_pfn(gi, index, &frame, &block, attrs);
+	if (r)
+		return r == -EFAULT ? -ENOENT : r;
+
+	order = min(order, block);
+	if (frame ^ index)
+		order = min_t(int, order, __ffs64(frame ^ index));
+	/* Nor may the block reach into a punch hole. */
+	while (order &&
+	       round_down(index, 1UL << order) < punch_end &&
+	       round_up(index + 1, 1UL << order) > punch_start)
+		order--;
+	*pfn = frame;
+	*max_order = order;
+	return 0;
+}
+
 /* What kvm_gmem_export_lookup_pfn() returns for a page inside the file. */
 static int __kvm_gmem_export_lookup(struct inode *inode, pgoff_t index,
 				    unsigned long *pfn, int *max_order,
 				    u32 *attrs)
 {
+	struct gmem_inode *gi = GMEM_I(inode);
 	struct folio *folio;
+	int r;
 
 	if (!kvm_gmem_range_is_shared(inode, index, 1))
 		return -ENOENT;
 
-	/* A folio that was never zeroed is a hole. */
-	folio = filemap_get_folio(inode->i_mapping, index);
-	if (IS_ERR(folio))
-		return -ENOENT;
-	if (folio_test_hwpoison(folio) || !folio_test_uptodate(folio)) {
+	if (kvm_gmem_is_pfn_mode(gi)) {
+		r = kvm_gmem_export_pfn(gi, index, pfn, max_order, attrs);
+		if (r)
+			return r;
+	} else {
+		/* A folio that was never zeroed is a hole. */
+		folio = filemap_get_folio(inode->i_mapping, index);
+		if (IS_ERR(folio))
+			return -ENOENT;
+		if (folio_test_hwpoison(folio) || !folio_test_uptodate(folio)) {
+			folio_put(folio);
+			return -ENOENT;
+		}
+		*pfn = folio_file_pfn(folio, index);
+		*max_order = 0;
+		*attrs = 0;
 		folio_put(folio);
-		return -ENOENT;
 	}
-	*pfn = folio_file_pfn(folio, index);
-	*max_order = 0;
-	*attrs = 0;
-	folio_put(folio);
 
 	/* Nor may the block hold a private page. */
 	while (*max_order &&
@@ -2042,6 +2117,8 @@ static struct inode *kvm_gmem_alloc_inode(struct super_block *sb)
 	gi->provider_ops = NULL;
 	INIT_LIST_HEAD(&gi->gmem_file_list);
 	INIT_LIST_HEAD(&gi->exports);
+	gi->punch_start = 0;
+	gi->punch_end = 0;
 	return &gi->vfs_inode;
 }
 
-- 
2.47.3

