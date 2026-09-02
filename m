Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A2B4A64C7
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Sep 2026 19:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378436; cv=none; b=FB1It/LbszJmPIruKYRPVWLnD0hcSe4THL+Nn1SB+xTotFy4aI7Zmweecz2oTJ1gZhnsHuMsJjvhg5S2dZL5PvOiLIiTLtHRvuLQeH/hgA2zmi83qyhKsrJb2hYbyg2Njq7GVE3AoQptD39rhaL79GvHN4F1Q30TUWRfY1H3xH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378436; c=relaxed/simple;
	bh=ygs5b/4pGa9bJCsjvEaGg9guWrDVzMHPo/gVLjTXl70=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s0pghyjgMieZQAokcnKw5Q1pO8tsQPgIPp1wcwiUAxudTKEmWBvzugndTja44EhKaVQhzk2zcQ2yd+BwwwIetnDAo+kHNxhbn7DDSKl3TeAHPBwwG34Aj1awc3v5KPPbK1GLnKn6+DjRc39dTLpkFJX/0AwF9aYDP9lCoAm/FlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=TyLxme58; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="TyLxme58"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-9387752a4d0so133992085a.2
        for <linux-kselftest@vger.kernel.org>; Wed, 02 Sep 2026 12:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788378420; x=1788983220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=043T58xMxK5U0+nF6j3a8AXR/ljZlHLZb140yWsthLI=;
        b=TyLxme58Qv0Ii9reFzSLtlTWKlXrBTmbXc0Cm05VwvrLo5Z2gn2AXnqy/3HjCBrLKD
         ZRvMgvXLB+dejUPByPJ16ijkiBZhysNjLflrtSihPnZWhi5TbyCkETdAiydABAwwJio4
         QS4ZksBVz8YhKXc/lvvpU0xQ20t+xKtyMmcXvzqLzNMIeHUstLrMYdP+ZVtujUTD6w9+
         3cH7f6M6ZfoQmaXbStfotCIeYs853eTyF2MC5+dICkikpoitkXq/oRHia5s3TUL2y1d4
         5R6QYmD1Xxpi0bQLdNfa2TXDMUDSonFyS0qr0q+VYiFoQ7xC190f+FAhwzSUzqt4vqdU
         jkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378420; x=1788983220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=043T58xMxK5U0+nF6j3a8AXR/ljZlHLZb140yWsthLI=;
        b=FpaoYIfYNOUXriqEa2XwGplCrXcx02ff56VFe0RXScl1Na6knKiosanGpcztmjkgpB
         fWd4Hj47hZDSbbluxKH0tpZs/vavbMgVtliLZ0+R4NIHCP40WMACjwDRo0+yosu+F5ez
         Z0zKxYfApphKL08Ey4o3inO/7xXoLKcJJ53YeYPZUbsavZNejgugu4tUh30Ou+48DF7R
         Roqg9sUYT0usBq4hz7C6H48axNv9OFwzD+7HPQZOU+yaeYZ0U4bLLiFMqxKgqQY1PqIn
         aUNyRphmNeQASjUJwzqemQqUpkC/GTJVtV4+8xxXX5aWVGw0TC1w6N9TNS1rRmmXxYLV
         +DQA==
X-Forwarded-Encrypted: i=1; AKwUvBzxO76UINPZ/txHr5FCgve5HZAWpl6Zxtn7BN0zT6qf9wVaXEnSGLxG+siCWUj0vKkRJ+NHdiUbvIdoWVLnZdU=@vger.kernel.org
X-Gm-Message-State: AFuF++mTEG054U9nUzETODwORJcER1uTL3HBVUE+xcoTVtpN346pkYlp
	TeLvRCMvWhP2Aenb8YYVRETivr7MGaypJ5b0oMZV4YTTC+7V5243YeJJA+9CISxxQSMW+UpokIp
	yS6NkbBk=
X-Gm-Gg: AYBFou1I2OcrehcWeMZuQ6AqMRYIu0uknQcqoOvl3hwuZQZXWi8BGyFHyc4/7xf3cKo
	ZrQdWCKR0v/P7Wa/hDU3OwusKMQJZFAUnt4sLBByARUHAR/lUP83x1yGPQAYI5ZvcMbbbbDw43j
	pCkqv138hbC+vpsGZwUK8z4vZVn4nDI4sl04QMvbTGemIRArzOnDf2dcGtRNVPIzrP4/CxMT+FS
	DoZEOnxMzXOoo1CkWsrgRSpDk5IA9w5+H6bHXFTyv/uFQSjrDEhSv/FZZvjPhyAZECHEdLfsIQw
	SDvbNAMR3km2Hb84aI9cfWsFIeRuO8KxM8wj3oUY/GwVGSaFjbgacuCGrIyopFNMbRfv7pFqhQw
	wYq7+T64pJmkTvb/qO10kDSQqtOkK4i0vE3CjJQxiQG34Vm+6tWnh20kvSJREIU4t5YkIOf8YhG
	Up8/Q7NDqGHb6SWWGn8KGdrc4M1zyjk9vQ2vVgUUUnqEeul0RNcUIMUxiqEQh1p1GDzDisJZMK0
	5vyjvj6e/q4Gdq3TT0s9ma4vBraMvqImYV8btES74hs87AkrpYTdV06gl1A
X-Received: by 2002:a05:620a:5bd3:b0:939:6de7:a623 with SMTP id af79cd13be357-9396de7ccf2mr158269885a.47.1788378420256;
        Wed, 02 Sep 2026 12:47:00 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f18801asm299300585a.16.2026.09.02.12.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:46:59 -0700 (PDT)
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
	shuah@kernel.org
Subject: [PATCH 0/5] KVM: guest_memfd: bind backing memory to a NUMA node
Date: Wed,  2 Sep 2026 15:46:52 -0400
Message-ID: <20260902194657.79075-1-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

guest_memfd allocates its folios through a per-inode shared mempolicy.

Today that policy can only be set after the fact, with mbind() on a host
mmap of the fd. That requires the fd to be mappable, and it cannot reach
folios that are only ever guest-faulted. Neither holds for a
non-mappable (confidential) guest_memfd.

Add GUEST_MEMFD_FLAG_BIND_NODE and a node field to struct
kvm_create_guest_memfd. When set, KVM builds an MPOL_BIND policy for the
requested node and installs it over the whole inode, so every folio is
allocated there with no userspace mbind().

  1-2  mm/mempolicy prep. mempolicy_create() builds a validated,
       cpuset-contextualised policy without installing it into the
       calling task. mpol_set_shared_policy_range() installs one over a
       pgoff range with no VMA.
  3    The KVM flag.
  4-5  Selftest harness support, and the test.


Why a single node and not a full mempolicy?

  The fd is the unit of guest NUMA topology. A multi-node guest is one
  guest_memfd per guest node - or one range per node, since
  kvm_gmem_bind() is offset-based and mpol_set_shared_policy_range() is
  already range-capable - each bound to a host node, with the guest
  placing memory on top. This is the shape QEMU already builds with one
  memory-backend per guest node.

  Interleaving a single fd across host nodes would model a guest node
  whose pages are scattered underneath it. That defeats every placement
  decision the guest makes: guest NUMA balancing, tiering and weighted
  interleave would all be reasoning about a topology that doesn't exist.

  This narrow implementation enables the only clear use case.


User-visible behaviour:

  mempolicy_create() constrains the request to the task's cpuset.
  A node outside mems_allowed fails the ioctl with -EINVAL - the same
  constraint mbind() carries. A task cannot grant a guest_memfd access
  to a node it cannot reach itself.

  Nothing rebinds an inode's shared policy on a later cpuset change:
  mpol_rebind_task() walks tsk->mempolicy and mpol_rebind_mm() walks
  vma->vm_policy, and neither reaches a struct shared_policy. The bind
  is fixed for the life of the fd. This matches shmem's implementation.


Testing

  guest_memfd_test under virtme-ng, nested KVM:

  - 2-node guest, test pinned to the CPUs of the node it is not binding
    to, with the task mempolicy aimed at that other node. Pages land on
    the bound node, so the placement cannot be explained by the fault
    being local. Stripping the flag from the harness puts them on the
    other node, confirming the check has teeth.

  - CONFIG_NUMA=n: the flag is not advertised and the tests skip.

  - Single node: create/mmap/fault coverage, no placement claim.

Gregory Price (5):
  mm/mempolicy: add mempolicy_create()
  mm/mempolicy: add mpol_set_shared_policy_range()
  KVM: guest_memfd: bind backing memory to a NUMA node at creation
  selftests: KVM: guest_memfd: let the gmem_test() harness bind a node
  selftests: KVM: guest_memfd: test GUEST_MEMFD_FLAG_BIND_NODE

 include/linux/kvm_host.h                      |   3 +
 include/linux/mempolicy.h                     |   5 +
 include/uapi/linux/kvm.h                      |   5 +-
 mm/mempolicy.c                                |  75 +++++++++-
 .../testing/selftests/kvm/guest_memfd_test.c  | 134 ++++++++++++++++--
 virt/kvm/guest_memfd.c                        |  44 +++++-
 6 files changed, 248 insertions(+), 18 deletions(-)

---

base-commit: da6c37ed8beb273e3308e42d4bca3ce11b4432fa

-- 
2.53.0-Meta

