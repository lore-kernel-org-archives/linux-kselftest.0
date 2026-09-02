Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D84626F2BF
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Sep 2026 19:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378436; cv=none; b=uJpLcZZl4yEpM/2z57BFA7D9ENKdxazYobu6NPlgjyIZipZtR9i70Q9CmmigwaxrgMeUVkYQfIvUT85Y5ROE4ExmA9ObYMFhnFBgjfYgRuVLwArsfkqWl+8oxB0h+KX67/mhtYyfMIeYcl5adBIQKBoGBaQAGcHmFLd+apQw238=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378436; c=relaxed/simple;
	bh=wOiGSHTvuaGU2hGJD2n9TN+YSN62eWKKXnnL46WXyRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tx5rxWmZTGi91lx1Q0On7cmJLBqKMKWVgCP53oIhuHpg35JypMn49sQtuM87DSLdSoS1hoRK9i2XVzKddIeDO/kU0FW74agYVRtwgUOBTFQPMo1ESNYHYNqD/eHzuf/Hlw1C23g+I8QU3kL19FbzfuDhgI3O60Isj84/gX5Q8sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=s8MQODSw; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="s8MQODSw"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-90ce3971a86so14630446d6.0
        for <linux-kselftest@vger.kernel.org>; Wed, 02 Sep 2026 12:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788378425; x=1788983225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VW5hThLcNiS9B9Y8k40LTfPGZJYf7iWoviGkGwyNijs=;
        b=s8MQODSwiIsHLLCO9+PpNJIFgO5tJcAbwCQfAbqpgzl2xRVSKXNOBkszcqGZxjDocv
         p3SJCFWItuWgYtdmridNHB32l7zFZOCuTII79MdyjT6Zxl3o7lrrGDGH74btjRDCPKKp
         r8y80TsVOL4sQ19qD4epMECR5oweBrzGe5zyoDboxVZSSM0dJbbVcP26CZC21IDw3BJ3
         yKWMIHM4kTtChQtL0yUtT4pwZ7FCDb5Wq2eX1zA3faVi978arRcSNgOxr3GwBw1bejVc
         VhNJJjXY1lvn2pSnWMjtajLI44lMaQyoIuC4ihMDz+eDNVanskxyz1Hug/m97WOCV5e7
         Dmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378425; x=1788983225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VW5hThLcNiS9B9Y8k40LTfPGZJYf7iWoviGkGwyNijs=;
        b=BwozjvjpNqrakKvJ7naUug0JqVlRwhzrjCwQHSOIsU4p5ZpvmaIEqxv99xz9rt3dkA
         h6pE3+b/EyFo0OXIcIzYnnxDBQW6uMZICFJsNppb6PqEPlhWu09cbtRM5+kF7zjPMZDJ
         +U+APUNsjGHJ0jWcp7DjSfeUsGOzwDLseL6/frVOnbhYvdm6J+hDZ6DYV55CfytAiAsf
         kAS8vfzRUr+8388pUj6dAbrrIoRwsKn7kJYNsm2jRWQskN81BEjeChM0dfJpLvTfpSno
         QjJz5ikNpdVVCpehvKf7MT2ZFZ4W73LDigQLqn3IxT7yvgg4FFc1sXkWEUzvMZFtNZwN
         9rGA==
X-Forwarded-Encrypted: i=1; AKwUvBxQ9BXXZIkSytKEp0YEF7RwuVJaEz710iVVP0zMFkhuCvMIWjzSgWbVok8eslIeFLjGdPpyKdMmLaHy/e7w0OE=@vger.kernel.org
X-Gm-Message-State: AFuF++mkrmR/cxjrvDHUJ6MTXpefw5erVoShtCkXN69TsT9EZ/s4h/XX
	KbO9fgvqek72/CLj7IkQB27KhbdqNfC4LblmSC3h7jGRUHTi05v/956iswSC32aJzmE=
X-Gm-Gg: AYBFou0Kf0sVeGMYwX5eoODdZnTlHXoWCPo5wL5rviMdpSadJH1c3+cRiSBDeZFHl/I
	jYITzUtfCMo44+fbUQXHhHsuDXAKz6qDBI9Amv5/3kbxML9CnTFRSSv+/AogFQEiUqRgS0cIN4K
	5DubVmWcbDWZy1wyflzNcUxiO6RYJ7V7PrThhZHxs2ZEws5Z/RmeEOtaeInjOXU5+64nbl/BfU5
	cXPtRde13oDEvC5Udm3ukRagHr+EwjntQNOitSVo7uaIIrA5jN+qN/J3bBRbv+p/ExpNl7h45gt
	zR/vXRpsezDta1NjuVvKK9oCLkiEnEQNazfXM++2/TJqjaAHnxOKlqzcXWqgG0IlBW9WSNwHu1S
	rIOiQH6AKe7yAZ1Jy+O/Hv0dcvZuuIxMpspiUzNhTJQrn9uw9IRfpQs3daAN0fiBVE+Nb+A3ZBH
	phr7M/8sRVny/GypM3Vw5SIt+LsdCXTRuv9ATX/GXa7+l5c+p9sSdclJ6JYSIwy9uyIqspO91Qw
	ulcypNN/c6Jz8rYskeSqiBOG5ULTMuZ9agus05ow6kiyKtLnQ==
X-Received: by 2002:a05:620a:a40f:20b0:939:191c:cac7 with SMTP id af79cd13be357-93960e19503mr738239685a.13.1788378423217;
        Wed, 02 Sep 2026 12:47:03 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f18801asm299300585a.16.2026.09.02.12.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:47:02 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	pbonzini@redhat.com,
	seanjc@google.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	shuah@kernel.org,
	Dave Jiang <dave.jiang@intel.com>
Subject: [PATCH 2/5] mm/mempolicy: add mpol_set_shared_policy_range()
Date: Wed,  2 Sep 2026 15:46:54 -0400
Message-ID: <20260902194657.79075-3-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194657.79075-1-gourry@gourry.net>
References: <20260902194657.79075-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mpol_set_shared_policy() installs a policy over a VMA's page-offset
range, which is the only programmatic way to populate an inode's
shared policy after init.

Two limitations make it unusable for binding an entire backing inode
from in-kernel code:

- It requires a VMA, so it cannot cover unmapped offsets.
  (e.g. unmapped file folios faulted by pagecache)

- mpol_shared_policy_init(), the only no-VMA installer, reconstructs
  the policy from mpol->w.user_nodemask.  That field is only populated
  for static/relative or mount-string policies.

  a policy built programmatically (e.g. by mempolicy_create()) leaves it
  empty and stores w.cpuset_mems_allowed instead and _init mangles it.

Both matter to a caller that wants a whole inode bound at creation.
guest_memfd is one: it has no VMA at that point and may never gain one
for a given offset, and it builds its policy in-kernel rather than from
a mount string, so neither existing installer can express it.

Add mpol_set_shared_policy_range(), which installs an already-built,
fully contextualised policy verbatim over an arbitrary [start, end)
page range with no VMA.

Reimplement mpol_set_shared_policy() as a thin wrapper that derives
the range from the VMA, so both share a single underlying path.

Suggested-by: Dave Jiang <dave.jiang@intel.com>
Co-developed-by: Dave Jiang <dave.jiang@intel.com>
Signed-off-by: Dave Jiang <dave.jiang@intel.com>
Signed-off-by: Gregory Price <gourry@gourry.net>
Assisted-by: Claude:claude-opus-4-8
---
 include/linux/mempolicy.h |  2 ++
 mm/mempolicy.c            | 35 +++++++++++++++++++++++++++++------
 2 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/include/linux/mempolicy.h b/include/linux/mempolicy.h
index aef018ad92317..398318175cec7 100644
--- a/include/linux/mempolicy.h
+++ b/include/linux/mempolicy.h
@@ -124,6 +124,8 @@ int vma_dup_policy(struct vm_area_struct *src, struct vm_area_struct *dst);
 void mpol_shared_policy_init(struct shared_policy *sp, struct mempolicy *mpol);
 int mpol_set_shared_policy(struct shared_policy *sp,
 			   struct vm_area_struct *vma, struct mempolicy *mpol);
+int mpol_set_shared_policy_range(struct shared_policy *sp, pgoff_t start,
+				 pgoff_t end, struct mempolicy *mpol);
 void mpol_free_shared_policy(struct shared_policy *sp);
 struct mempolicy *mpol_shared_policy_lookup(struct shared_policy *sp,
 					    pgoff_t idx);
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index da133ffe0b1c8..ce10ce4374643 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -3312,24 +3312,47 @@ void mpol_shared_policy_init(struct shared_policy *sp, struct mempolicy *mpol)
 }
 EXPORT_SYMBOL_FOR_MODULES(mpol_shared_policy_init, "kvm");
 
-int mpol_set_shared_policy(struct shared_policy *sp,
-			struct vm_area_struct *vma, struct mempolicy *pol)
+/**
+ * mpol_set_shared_policy_range - install @pol over [@start, @end) of @sp
+ * @sp:    the shared policy tree
+ * @start: first page offset (inclusive)
+ * @end:   last page offset (exclusive)
+ * @pol:   a fully-built, validated policy, or NULL to clear the range
+ *
+ * Installs @pol over the given range, replacing any overlapping policy.
+ * @sp takes its own reference, the caller retains its reference on @pol.
+ *
+ * The policy is not reconstructed, so the policy is preserved exactly.
+ *
+ * Unlike mpol_set_shared_policy(), no VMA is required, so a range that
+ * is never mapped into a VMA can be covered, including the whole file.
+ *
+ * Return: 0 on success, -ENOMEM on allocation failure.
+ */
+int mpol_set_shared_policy_range(struct shared_policy *sp, pgoff_t start,
+				 pgoff_t end, struct mempolicy *pol)
 {
-	const pgoff_t pgoff = vma_start_pgoff(vma);
-	const pgoff_t pgoff_end = vma_end_pgoff(vma);
 	struct sp_node *new = NULL;
 	int err;
 
 	if (pol) {
-		new = sp_alloc(pgoff, pgoff_end, pol);
+		new = sp_alloc(start, end, pol);
 		if (!new)
 			return -ENOMEM;
 	}
-	err = shared_policy_replace(sp, pgoff, pgoff_end, new);
+	err = shared_policy_replace(sp, start, end, new);
 	if (err && new)
 		sp_free(new);
 	return err;
 }
+EXPORT_SYMBOL_FOR_MODULES(mpol_set_shared_policy_range, "kvm");
+
+int mpol_set_shared_policy(struct shared_policy *sp,
+			struct vm_area_struct *vma, struct mempolicy *pol)
+{
+	return mpol_set_shared_policy_range(sp, vma->vm_pgoff,
+					   vma->vm_pgoff + vma_pages(vma), pol);
+}
 EXPORT_SYMBOL_FOR_MODULES(mpol_set_shared_policy, "kvm");
 
 /* Free a backing policy store on inode delete. */
-- 
2.53.0-Meta

