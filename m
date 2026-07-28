Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A938C42FCBE
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 12:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240714; cv=none; b=DN7xWcFjmoRNnrcQea3rymL8O8t07JF1cYxEGtXBgrhRaUaGYeMutSSEDhdl3QdzbwwPG4oHxrOqeqMy/voIeHg0gqtMumY1arY44q0rZxtFrjqldQlX6+ERJU1MEcXxdWimRw1Cvi9lzZwxBPc1CUY3G6ZKCYWdDDEqpnUFEHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240714; c=relaxed/simple;
	bh=w2RQJgtEMbTdKnmSkuMim/MJcZpaheS4b363Ephf/ew=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BqCAjFO8tPAYvwQubkbUa3Kc5Vx4zPD7UGwqDv6pV37cv+LsMK+GK+E2ZGTO+SmckaHJ9/rSuSMiqSphKXjad5obGuYRclHef2VJOM5naAuoQl6lxPbfmE0ejj2Khe4IL6njfzzqO9GuDr8+JcVVisdho5eM7Bu/k7ukgbqWb9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wQWPZESl; arc=none smtp.client-ip=209.85.218.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wQWPZESl"
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c15ff68c858so423905866b.0
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 05:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785240709; x=1785845509; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V9fXM6lRs795AVXt0xgZm237lDVZT/43F4+i2ayf4wM=;
        b=wQWPZESlSp5XuOl35vVnsJcLjvZ8XFaS6yHZiJNfwT+b3Ej5W67w/8/IptGl5SLX0b
         rXJK3MjB1zA+tFP57sWuIeHZC9c+ITfeKhSvKfuTTt0KItjmWQgbHa3UxDd7GXAepMQq
         V6Xfd6tK0lZuVlFl/aMw7lsIs+jW15mOcCoUuWJ2yul7nIQBuzMPH7Ie6++h7r2Fjxp4
         YZI5W+dKfc4YZskynw5rXBIaHGhk01dsli2SB/4GKPueLVgiDzGGgw63ahTsUDgE/th5
         rI3XthqKX5FC4aUszghc0lijmIrOLuB9UJQN7f2mnBZl5oyBBVPrZj7PTAzacyR6TAWR
         MDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785240709; x=1785845509;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V9fXM6lRs795AVXt0xgZm237lDVZT/43F4+i2ayf4wM=;
        b=D14Oyb/JLYvjRneZl8ICK8gL6sQEUZcdA4kRC8EielfIDuwQ6ig54LGbswQ/ZFs2TY
         WUuXk/C4iTGFbgVWv7mlkKOHiQnfi4oF/XZao7Qv+G2qDBm8eSeZtCGFqQX37rTIbaVz
         dDbBxFjMNA4PblF9CzoSZBApi6CbpjemEBUpOm/57IvFzy4Xic5yLyrTlShfKw7hlmYe
         1e/BJj61lyU0EkvEiTnrCAGWoaEVpIYjT4NflBVFNXxBQzRe2gvXsuUm3oySNxGlMiZ/
         6iv/25v5/pa/YbXlTs6GS/x9EQzwRHmQQCjPRPepNNfjbM65+QLNJay1otdRyeV+KJyF
         40TA==
X-Gm-Message-State: AOJu0Yzk5FtDNhcVJvt4vbTTo/n4z8Nvsdsx/L1C4U4J7PnRpyp6EpGn
	N6rqdINvpWs5qrYAbT9/DfFBzlj3I//TZofbXosZGtSw/bUuVZFDJpwT+QLF54afP2+2aX7sAGE
	hlAmIqNCzDfSgd/QBQw==
X-Received: from ejdr26.prod.google.com ([2002:a17:906:38da:b0:c12:9b2c:ffb1])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:c1e:b0:c19:45e3:2f57 with SMTP id a640c23a62f3a-c1f71d2cc6bmr102851666b.9.1785240709110;
 Tue, 28 Jul 2026 05:11:49 -0700 (PDT)
Date: Tue, 28 Jul 2026 12:11:34 +0000
In-Reply-To: <20260728121138.1103610-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260728121138.1103610-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260728121138.1103610-8-tarunsahu@google.com>
Subject: [PATCH v4 07/11] KVM: guest_memfd: Add support for freezing mappings
From: Tarun Sahu <tarunsahu@google.com>
To: ackerleytng@google.com, fuad.tabba@linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, seanjc@google.com, dmatlack@google.com, 
	Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, david@redhat.com, 
	Tarun Sahu <tarunsahu@google.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, sagis@google.com, Paolo Bonzini <pbonzini@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, Alexander Graf <graf@amazon.com>
Cc: linux-kselftest@vger.kernel.org, andre.przywara@arm.com, 
	michael.roth@amd.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	will@kernel.org, vannapurve@google.com, maz@kernel.org, fvdl@google.com, 
	kvm@vger.kernel.org, oliver.upton@linux.dev, kvmarm@lists.linux.dev, 
	alexandru.elisei@arm.com, skhawaja@google.com, aneesh.kumar@kernel.org, 
	linux-doc@vger.kernel.org, David Hildenbrand <david@kernel.org>, yan.y.zhao@intel.com, 
	kexec@lists.infradead.org, suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"

Introduce kvm_gmem_freeze() to freeze a guest_memfd inode's mapping,
which prevents fallocate() operations and new page fault allocations
during preservation.

Use a global SRCU (`kvm_gmem_freeze_srcu`) to synchronize freeze state
checkers without incurring per-fault locking overhead or risking per-CPU
memory exhaustion (as per-CPU structure not counted in cgroup) from
per-inode SRCU structures by faulty/compromised VMM.

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
---
 virt/kvm/guest_memfd.c | 117 +++++++++++++++++++++++++++++++++++++----
 virt/kvm/guest_memfd.h |   5 ++
 2 files changed, 111 insertions(+), 11 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index dd84bba8974b..d522cc34f476 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -7,11 +7,13 @@
 #include <linux/mempolicy.h>
 #include <linux/pseudo_fs.h>
 #include <linux/pagemap.h>
+#include <linux/srcu.h>
 #include "guest_memfd.h"
 
 #include "kvm_mm.h"
 
 static struct vfsmount *kvm_gmem_mnt;
+static struct srcu_struct kvm_gmem_freeze_srcu;
 
 
 #define kvm_gmem_for_each_file(f, inode) \
@@ -96,6 +98,7 @@ static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
 	/* TODO: Support huge pages. */
 	struct mempolicy *policy;
 	struct folio *folio;
+	int idx;
 
 	/*
 	 * Fast-path: See if folio is already present in mapping to avoid
@@ -105,12 +108,20 @@ static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
 	if (!IS_ERR(folio))
 		return folio;
 
+	idx = srcu_read_lock(&kvm_gmem_freeze_srcu);
+	if (kvm_gmem_is_frozen(inode)) {
+		srcu_read_unlock(&kvm_gmem_freeze_srcu, idx);
+		return ERR_PTR(-EPERM);
+	}
+
 	policy = mpol_shared_policy_lookup(&GMEM_I(inode)->policy, index);
 	folio = __filemap_get_folio_mpol(inode->i_mapping, index,
 					 FGP_LOCK | FGP_CREAT,
 					 mapping_gfp_mask(inode->i_mapping), policy);
 	mpol_cond_put(policy);
 
+	srcu_read_unlock(&kvm_gmem_freeze_srcu, idx);
+
 	/*
 	 * External interfaces like kvm_gmem_get_pfn() support dealing
 	 * with hugepages to a degree, but internally, guest_memfd currently
@@ -273,16 +284,30 @@ static long kvm_gmem_allocate(struct inode *inode, loff_t offset, loff_t len)
 static long kvm_gmem_fallocate(struct file *file, int mode, loff_t offset,
 			       loff_t len)
 {
+	struct inode *inode = file_inode(file);
 	int ret;
+	int idx;
 
-	if (!(mode & FALLOC_FL_KEEP_SIZE))
-		return -EOPNOTSUPP;
+	idx = srcu_read_lock(&kvm_gmem_freeze_srcu);
+	if (kvm_gmem_is_frozen(inode)) {
+		srcu_read_unlock(&kvm_gmem_freeze_srcu, idx);
+		return -EPERM;
+	}
 
-	if (mode & ~(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE))
-		return -EOPNOTSUPP;
+	if (!(mode & FALLOC_FL_KEEP_SIZE)) {
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
 
-	if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))
-		return -EINVAL;
+	if (mode & ~(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE)) {
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
+
+	if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len)) {
+		ret = -EINVAL;
+		goto out;
+	}
 
 	if (mode & FALLOC_FL_PUNCH_HOLE)
 		ret = kvm_gmem_punch_hole(file_inode(file), offset, len);
@@ -291,6 +316,9 @@ static long kvm_gmem_fallocate(struct file *file, int mode, loff_t offset,
 
 	if (!ret)
 		file_modified(file);
+
+out:
+	srcu_read_unlock(&kvm_gmem_freeze_srcu, idx);
 	return ret;
 }
 
@@ -948,7 +976,9 @@ static void kvm_gmem_destroy_inode(struct inode *inode)
 
 static void kvm_gmem_free_inode(struct inode *inode)
 {
-	kmem_cache_free(kvm_gmem_inode_cachep, GMEM_I(inode));
+	struct gmem_inode *gi = GMEM_I(inode);
+
+	kmem_cache_free(kvm_gmem_inode_cachep, gi);
 }
 
 static const struct super_operations kvm_gmem_super_operations = {
@@ -1003,12 +1033,21 @@ int kvm_gmem_init(struct module *module)
 	if (!kvm_gmem_inode_cachep)
 		return -ENOMEM;
 
+	ret = init_srcu_struct(&kvm_gmem_freeze_srcu);
+	if (ret)
+		goto err_cache;
+
 	ret = kvm_gmem_init_mount();
-	if (ret) {
-		kmem_cache_destroy(kvm_gmem_inode_cachep);
-		return ret;
-	}
+	if (ret)
+		goto err_srcu;
+
 	return 0;
+
+err_srcu:
+	cleanup_srcu_struct(&kvm_gmem_freeze_srcu);
+err_cache:
+	kmem_cache_destroy(kvm_gmem_inode_cachep);
+	return ret;
 }
 
 void kvm_gmem_exit(void)
@@ -1016,5 +1055,61 @@ void kvm_gmem_exit(void)
 	kern_unmount(kvm_gmem_mnt);
 	kvm_gmem_mnt = NULL;
 	rcu_barrier();
+	cleanup_srcu_struct(&kvm_gmem_freeze_srcu);
 	kmem_cache_destroy(kvm_gmem_inode_cachep);
 }
+
+/**
+ * kvm_gmem_freeze - Freeze or unfreeze a guest_memfd inode mapping.
+ * @inode: The guest_memfd inode.
+ * @freeze: True to freeze, false to unfreeze.
+ *
+ * This API is used strictly during the live update / preservation transition
+ * window to prevent host userspace and guest-side faults from making any
+ * mapping modifications (such as fallocate or page fault allocation)
+ * to the guest_memfd page cache.
+ *
+ * Synchronization Strategy (Sleepable RCU):
+ * To avoid high-contention VFS locks (like inode_lock or
+ * filemap_invalidate_lock) on the vCPU page fault hot paths, this subsystem
+ * implements a lightweight, system-wide Sleepable RCU (SRCU) mechanism
+ * (`kvm_gmem_freeze_srcu`):
+ *
+ * Global vs. Per-Inode SRCU
+ * ======================
+ * A single system-wide global static `srcu_struct` is used instead of a
+ * per-inode SRCU structure to completely prevent unprivileged users from
+ * exhausting the host's per-CPU memory allocator. Because
+ * `init_srcu_struct()` allocates per-CPU memory via `alloc_percpu()`, which
+ * is not accounted by memory cgroups (memcg),
+ * a per-inode SRCU structure would allow a tenant to bypass cgroup limits and
+ * trigger a system-wide Out-of-Memory (OOM) crash simply by spawning a large
+ * number of guest_memfd file descriptors (bounded only by RLIMIT_NOFILE).
+ *
+ * Flag Modification Note:
+ * Since `GUEST_MEMFD_F_MAPPING_FROZEN` is the ONLY flag in
+ * `GMEM_I(inode)->flags` that is mutated dynamically at runtime (all other
+ * flags are creation-time flags which remain strictly read-only), there is
+ * no possibility of concurrent bit-modification races. Therefore, a standard
+ * `WRITE_ONCE` is fully safe and does not require complex `cmpxchg`
+ * synchronization loops.
+ */
+void kvm_gmem_freeze(struct inode *inode, bool freeze)
+{
+	u64 flags = READ_ONCE(GMEM_I(inode)->flags);
+
+	if (freeze)
+		flags |= GUEST_MEMFD_F_MAPPING_FROZEN;
+	else
+		flags &= ~GUEST_MEMFD_F_MAPPING_FROZEN;
+
+	WRITE_ONCE(GMEM_I(inode)->flags, flags);
+
+	if (freeze)
+		synchronize_srcu(&kvm_gmem_freeze_srcu);
+}
+
+bool kvm_gmem_is_frozen(struct inode *inode)
+{
+	return READ_ONCE(GMEM_I(inode)->flags) & GUEST_MEMFD_F_MAPPING_FROZEN;
+}
diff --git a/virt/kvm/guest_memfd.h b/virt/kvm/guest_memfd.h
index c528b046dd69..028c348a1023 100644
--- a/virt/kvm/guest_memfd.h
+++ b/virt/kvm/guest_memfd.h
@@ -29,11 +29,16 @@ struct gmem_inode {
 	u64 flags;
 };
 
+/* Internal kernel-only flags (must not overlap with UAPI flags) */
+#define GUEST_MEMFD_F_MAPPING_FROZEN	(1ULL << 63)
+
 static inline struct gmem_inode *GMEM_I(struct inode *inode)
 {
 	return container_of(inode, struct gmem_inode, vfs_inode);
 }
 
 struct file *__kvm_gmem_create_file(struct kvm *kvm, loff_t size, u64 flags);
+void kvm_gmem_freeze(struct inode *inode, bool freeze);
+bool kvm_gmem_is_frozen(struct inode *inode);
 
 #endif /* __KVM_GUEST_MEMFD_H__ */
-- 
2.55.0.229.g6434b31f56-goog

