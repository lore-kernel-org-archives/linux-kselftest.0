Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A7E34C989
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 07:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771830298; cv=none; b=ZnmZ21YZAALzKSmxkUjM6+3ePyUAsaBsblDr9Xcg1qs/plEI9eWBvByv8KE6kPxxD7yJO36WaB2FbbSX54nta7p+t4xvFcAgifHL3JepjbOKk1TYdsED07rKV4gFDhcUlvvGhgTmZM1GeHN99uKDlOUYtsARtst9eG9k+0Zxhf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771830298; c=relaxed/simple;
	bh=5o3tmYQd6rVeF2e0eOelASFd7dC8E+r7apcrcv6Ycco=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=o72tcTA4KDtnRp2eNzjYZnw17dVaTdIgE8ppgJ/oGt7d3kyvwJitgO8d3FWe8W5gJH2bdrY73cGc0uS0DvU7VVZv622jy1CILxocJhGbNqfFZy8w/VNF3oKABv2rdv93DRhqdElcSrwTeSxdMtsfMbZ0BlPl+qYoB3QL9xAZPzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OzK77+qt; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OzK77+qt"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-354bf10ec2aso2879452a91.3
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Feb 2026 23:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771830296; x=1772435096; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9REamna2TtkXRPR+lDCH1E9Zwr056ciH8ECe5GsnKJE=;
        b=OzK77+qtkjMisRYbly1IqLdmr9vlA32zKEWHgLU9njIWKoTlNk0z50lRT7dQHpaqNm
         yKDW+vKi7ANS8qROZZB4A0uHpKFVjjhfFll512bst4RgytWpGeHOqADiQB61BJvpvhO6
         ZFP1AEzk3W9V2Z9p5DVCqah3VWqZ8BlT2W66ms+5rpXdo4ZbI6Gb0HXX14XxKss4WCPL
         Oa2na6+Cvg4Ta/ZYTs8SKA7Xy6b/npX6KWRgPs7ESr2yDKbTBohHw5gJ638SH1nYMz73
         pV5jxsMGa7k0WL+Va+b4ABCPwifcLCmuArd+TiGeFZ6UOREtemCyLTxWLvOZ+mXq4d44
         x9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771830296; x=1772435096;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9REamna2TtkXRPR+lDCH1E9Zwr056ciH8ECe5GsnKJE=;
        b=vOdiOn2FOa8VPHz3X4EMfNDSBYsHOi3GbcpHrSSGvIazyJF6o21Mp2biZ7vVJMOg8a
         BeAt2KxxwtLpCqoOQv6Na5ipOQYPe6LEKckp8X2cX7FhciVBVEnDBwngqeHDBjQuHxtr
         OaMz5Ptf4Blf7M1M+OtO0t0RTlowSvyqVOIpl78vFmERy4xITKStAbdUFz/5RJsJ6Yho
         PMk0W1t+vaknwwdCye9NOIrfWhVhFpYt8SUGYUYTRTPCpk4PorJZZeXB1QezZ1JSu+q3
         mPX9tr+HVknGcoIVetHU1IxPSLz0b4QvU7ov4CytM0j0+1FPh7jPBnI49EkUlqDfkUYx
         UAAw==
X-Forwarded-Encrypted: i=1; AJvYcCUoyDR+KIlBXvOt4XbMWXS4PaPkng/3pg/C4cpgmnIr6we5yMNYCxK4JyVgqUGB2ntH+rcUa6vED9ruUqRwRIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFJ0wiJddMUWjSgUsIOuobP+++E7mUt9jZfvqw0C5SIYnI9Z2L
	w50OKtGCerZZsWf0d1zV44ylHkFHYvwWr8Tw2Elwvwc8aQryDbirSCJJKV0rZM6cKSRsDn5yn19
	puTp+YUYaosToGWSkngGeYOq2ew==
X-Received: from pjst15.prod.google.com ([2002:a17:90b:18f:b0:34c:ab9b:76d2])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:56cb:b0:353:4f7:cc3a with SMTP id 98e67ed59e1d1-358ae6a20c3mr5721991a91.0.1771830296257;
 Sun, 22 Feb 2026 23:04:56 -0800 (PST)
Date: Mon, 23 Feb 2026 07:04:37 +0000
In-Reply-To: <cover.1771826352.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1771826352.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.53.0.345.g96ddfc5eaa-goog
Message-ID: <85a7e5a06f0fff049e5440daea079f0be4c47ff5.1771826352.git.ackerleytng@google.com>
Subject: [RFC PATCH v1 04/10] KVM: guest_memfd: Implement evict_inode for guest_memfd
From: Ackerley Tng <ackerleytng@google.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: akpm@linux-foundation.org, david@kernel.org, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, willy@infradead.org, pbonzini@redhat.com, shuah@kernel.org, 
	ackerleytng@google.com, seanjc@google.com, shivankg@amd.com, 
	rick.p.edgecombe@intel.com, yan.y.zhao@intel.com, rientjes@google.com, 
	fvdl@google.com, jthoughton@google.com, vannapurve@google.com, 
	pratyush@kernel.org, pasha.tatashin@soleen.com, kalyazin@amazon.com, 
	tabba@google.com, michael.roth@amd.com
Content-Type: text/plain; charset="UTF-8"

In a later patch, guest_memfd will be using a custom truncation
routine. This is a preparatory patch, which implements .evict_inode for
guest_memfd, but just performs exactly what would have been done if
.evict_inode were not implemented.

No functional change intended.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 virt/kvm/guest_memfd.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 2488d7b8f2b0d..57dec458bfa77 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -978,11 +978,23 @@ static void kvm_gmem_free_inode(struct inode *inode)
 	kmem_cache_free(kvm_gmem_inode_cachep, GMEM_I(inode));
 }
 
+static void kvm_gmem_evict_inode(struct inode *inode)
+{
+	struct address_space *mapping = inode->i_mapping;
+
+	truncate_inode_pages_final_prepare(mapping);
+
+	truncate_inode_pages_range(mapping, 0, inode->i_size);
+
+	clear_inode(inode);
+}
+
 static const struct super_operations kvm_gmem_super_operations = {
 	.statfs		= simple_statfs,
 	.alloc_inode	= kvm_gmem_alloc_inode,
 	.destroy_inode	= kvm_gmem_destroy_inode,
 	.free_inode	= kvm_gmem_free_inode,
+	.evict_inode	= kvm_gmem_evict_inode,
 };
 
 static int kvm_gmem_init_fs_context(struct fs_context *fc)
-- 
2.53.0.345.g96ddfc5eaa-goog

