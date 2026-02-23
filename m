Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5B9346E64
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 07:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771830293; cv=none; b=FVRVUT+uIuMV5hPQPElWTAkblQ4RT9Cz/GXCsKNA1NhqI9AbOhCS3cqn2R/HGBKjOmBErYObYMhV2FSGYcRytV71YuWN0SRfj2hqaLZvMKtfb8mgcse2CdNoQ8qOiznsTsBKHQeRomPOd719qUkpvqjhjEDVf82eIFuKRjg4XFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771830293; c=relaxed/simple;
	bh=w37966m1o0RmX0vyIvS+1AaWr3RY1h7nrLYdurJIUkk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=S+pyYV2qd8YR/6vBW8dmN1MMpC4nw8hq5sCLqmNF2eb5pyFBRBwUcZtQxsfzrRCVwrbGum92mqSBydd4+L4OfbdhhPzg/TtwxREw2+DKLFOPikNCPaO3USEOMyvy0pRy0byuXJnMDhk/yYzSSJxmyqCS6/gVik5u6RlmrZKc5Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ssJgzKJf; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ssJgzKJf"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-35658758045so2873324a91.3
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Feb 2026 23:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771830292; x=1772435092; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5lJdfKFYNuLjR953Ng0mcH/dDhHLbnTZ2j5PCnoQPSQ=;
        b=ssJgzKJfjj3StHv2ZNgcIrJITDH1qRhsBjABDL1pZsmdjr89/dkTfFYKjERlzUkppJ
         GJv+STOgjzvG5GSB7S7NeOFh+fvwOevbtMNiqOacM/VA0pYCFFhnWy2PJpD0FmT6BNy/
         cA6bHCiBgelkvCwVs16xLJ443A1NVjgBUYC7HPP/iK4KcW+A0YbgvzLw4dezj0LOq8pD
         P990bWgdp3siKnitspKpEFtxfXnkKh66mK9c1xu1bn2MmHAFahcEvAR4HxBt+N37fOpI
         EVlfZd7auyZCn3vFY4FacY7wHhsb4zWrWktI1lgbTegYroNq/eMOJFJLTxeencdEWMHS
         jiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771830292; x=1772435092;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5lJdfKFYNuLjR953Ng0mcH/dDhHLbnTZ2j5PCnoQPSQ=;
        b=d1uDnvx/zjqEqCjlUfqy/8f/tFLK3ZqRl0MDJHFK2rpUeFAkp6Q7rFd+4KjCwC54NQ
         rY4poQVAOP170aoMUpQOw4X+aZ0h6IjFafLIJfD+6+0I32eAOWd/hzAuA/5N1yQENwdz
         pJ08PLSx6EL+LPFfwW0KWsn+GSo75HSEEhdobER89TFRORZMMhgyD8feV+f2vHGMibHQ
         2B+TYI2B74/fzdhUIvUbcfpAm3CBNlXW00JG9gxgyRfnDEwQi9/D254sgWZdecjcTiuY
         b/gBjwX6MBaBdKL5CSE4YWwQ2w6lx3B2DFqqP3OHxYCUPzpul/ijwO/OOzfbvbtkWgEC
         8cmw==
X-Forwarded-Encrypted: i=1; AJvYcCX0LMBUEClh0NQVEoKDp6lon45FFdZ8tjZFxhpOT1uLL+SgKfy4Ff6+74KXRl1XpeO/TYfgaB3/OnK3flFsUyo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY9KfhMfjIgUrkeTjxhlBbP1Ziea52QRYdEPW4tBXiDXMSc99q
	/C5YFyDYVRVZTn1/YmvIsYfS18249gvRlro1LyjCbhGqTN02z9Pj4BD77j8wb/27VRIdJOe1GRM
	aINQMXfE74e8Dhe6+s8vAR0Qn2A==
X-Received: from pjup4.prod.google.com ([2002:a17:90a:d304:b0:34c:2778:11c5])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3d46:b0:354:ad98:7d1c with SMTP id 98e67ed59e1d1-358ae7fd556mr7480246a91.11.1771830291734;
 Sun, 22 Feb 2026 23:04:51 -0800 (PST)
Date: Mon, 23 Feb 2026 07:04:34 +0000
In-Reply-To: <cover.1771826352.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1771826352.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.53.0.345.g96ddfc5eaa-goog
Message-ID: <108d4e27b72480a20e4490d839acadd0b0a2dcea.1771826352.git.ackerleytng@google.com>
Subject: [RFC PATCH v1 01/10] KVM: guest_memfd: Don't set FGP_ACCESSED when
 getting folios
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

guest_memfd folios don't care about accessed flags since the memory is
unevictable and there is no storage to write back to, hence, cleanup the
allocation path by not setting FGP_ACCESSED.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
Acked-by: Vlastimil Babka <vbabka@suse.cz>
Acked-by: David Hildenbrand (arm) <david@kernel.org>
---
 virt/kvm/guest_memfd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 923c51a3a5256..2df27b6443115 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -126,14 +126,13 @@ static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
 	 * Fast-path: See if folio is already present in mapping to avoid
 	 * policy_lookup.
 	 */
-	folio = __filemap_get_folio(inode->i_mapping, index,
-				    FGP_LOCK | FGP_ACCESSED, 0);
+	folio = filemap_lock_folio(inode->i_mapping, index);
 	if (!IS_ERR(folio))
 		return folio;
 
 	policy = mpol_shared_policy_lookup(&GMEM_I(inode)->policy, index);
 	folio = __filemap_get_folio_mpol(inode->i_mapping, index,
-					 FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
+					 FGP_LOCK | FGP_CREAT,
 					 mapping_gfp_mask(inode->i_mapping), policy);
 	mpol_cond_put(policy);
 
-- 
2.53.0.345.g96ddfc5eaa-goog

