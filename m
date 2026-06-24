Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13583D6CB0
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 14:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782313079; cv=none; b=ahnqKLBgpKhls77Rq58sJi70VTZMMm1ufpI7VgeskmJIVs++8T2NaCHeBvLpL9oGCLpUDSidZmRxA2p16Z7YnO/B1Fv7eWBcf8M9hDHbxfX8wlc23n1twfdqEUD6RF0RnFkqbk0oX9FUK9frJjp3Y1Z9ghb3tuqgFM1PVrhyPvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782313079; c=relaxed/simple;
	bh=OELpNeuF4o3uKPmDaZimCE09x9LRfZSE6ZhO3qoWDnE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L/hT95UEFj7vVsXrPOEergLyeoncV17UfvMm13RIMErA7lfJj2up75BEwnk/KaBGw5t3fIAfsl4r4/q30/aeR0KGeXboQqBHp6u1LAwJMkybp7mR6uS1lmf+Ha9cHTuKVEXqtyebad/fFoVrVtx3p/lpbwpS5YX59lz8PXI+h1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=X17iEpF+; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="X17iEpF+"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-517b1f2c6adso9593841cf.2
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 07:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782313076; x=1782917876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=342v7Y1wIc5Ucn3x8pxabI10RJuF4OR+Mw4ajKzQlTY=;
        b=X17iEpF+dly0f+2P4gQVF1jNdprEmscmq6StQGFf1bgqgIWZXsX9GCUety7UmYFLAh
         FiZQBMX/ux1x3qtRpW6Naadri+aGJJzZrDNZzRwnYTIyQCGo4aebGtbUb4bMdxxeRCRq
         ayrACRdSEjgyHa/cn5M5TszycIRcUTW5Rnw5/b/hLgLf/SMOv1Pu5Zr7jCkakel3xvlK
         Xd6zBR/+nBSspOm+E4GNOwGSSzEieMvKM5ZSw1ha980olmqyqEChvgxlGVAcfpn9lQkO
         8sGO7pmngrel/55AMMJ4ALReZqyp5Hyr58xN16kKyaE3vXoZ5HHh+AMqZQfNLzobFUPO
         cWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782313076; x=1782917876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=342v7Y1wIc5Ucn3x8pxabI10RJuF4OR+Mw4ajKzQlTY=;
        b=dTZdvGLdGbzrHLUa5tu8YcrGMvv8B8CDtZDZpHi/W6mRXXBS+sxkjVZ/PchJsEP99Z
         K1R3j1Sq1Kantms1vB0wCFhK9mHb+8C5hqiIEh/tNLfWnfaGc09tAVnPctpbAPt4/HNd
         /04SRSes2HYjapCqibg53OXbOQH1ZM0Fg32aIhwBbd2pmxV/cacfP839++Kz5Zk9fL3t
         nFVJA1LNxa3oOl6JIhROPAmvbioZCJYSNCkLj1PjyW+z+RzxuU3gujE/6ZP8GcWUysYg
         t3meH/XZM8+ghRUdLdjeGHI2N9tQTa/ThBi/USsID22MhW2KldQgGpehCD4rc1x4jZUQ
         tJHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8WOTKzf2jogDyS1sPkS5Kxop+WmfLmIWuzmAGXwUIZUHVOt0OjxG7SYhoAE8xoJr0hU4W0opW9ir+93dYhc74=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKf2/oolaCwHOB/wy7ZVCodLHgyeuTqIpLYZy4I+g11Q1VmfRR
	cn7KYLB5ftnl29CBWWJtEx3r4Wumq8qf99GNUyhx9oxriCtNiDyqKA5tbfBD+KWD9gI=
X-Gm-Gg: AfdE7cmi66XtP2y8CsibxNF0uLt7BvmCNK50tM1BgrZK9DwsE/lUn/filGFySqMh0BJ
	HpBBemCxPJAHujwR4cRzpr1zRrRMCdOxBEYv3nNdK77hOJSXU/Z+LRB3EC66RnXd4v9yDVtMjZP
	37kj6BQbPrg8dmzMn0sDmEfj13512x7Z2tGAk+I1TStZp3W69OqJnwBwdZsfUdcxLHBftaSi0fL
	tRPjsYSi6Znli1YWRL+SQJA5NR330FwxlnSrqkwcjJz6hv53riIxTHM26ZGPqg3p9nidBLrZ9Si
	4L019aERDXlqNxxkuZLkzGWCFzVLrqXMtwFOnmN6NzTTs8E85XQ4a9RVVz40FeewJmUe/EbHLwZ
	DplyXELf6y0uoPJJUvoFvKF2ALIt6JC7EMBSpQffVQaro7D8d0F2F3/WcUG4uRXllc1OvKH+OdA
	CeSxU+ovHWhPy312WuPKeJvsg8k5W4phiKTYPCt2lSH8EZqfMKtNbbqNwoCQ9PzUhIwN1MmX4tZ
	A==
X-Received: by 2002:a05:622a:191f:b0:517:79f0:ae3d with SMTP id d75a77b69052e-51a5473239fmr101461321cf.21.1782313074271;
        Wed, 24 Jun 2026 07:57:54 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a51ae8ee7sm49502301cf.24.2026.06.24.07.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:57:51 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org,
	nvdimm@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com,
	david@kernel.org,
	osalvador@suse.de,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	akpm@linux-foundation.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	gourry@gourry.net,
	alison.schofield@intel.com,
	Smita.KoralahalliChannabasappa@amd.com,
	ira.weiny@intel.com,
	apopple@nvidia.com
Subject: [PATCH v5 0/9] dax/kmem: atomic whole-device hotplug via sysfs
Date: Wed, 24 Jun 2026 10:57:35 -0400
Message-ID: <20260624145744.3532049-1-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dax kmem driver onlines memory during probe using the system
default policy, with no atomic control for the state of an entire
region at runtime - only by toggling individual memory blocks.

Offlining and removing a whole region therefore races with other
userland controllers that interfere between the offline and remove
steps. This was discussed in the LPC2025 device memory sessions [1].

This series adds a sysfs "state" attribute for atomic whole-device
hotplug control, plus the mm and dax plumbing to support it.

Transitions are atomic across every range of the device. The state
names mirror the per-block memoryX/state ABI with one modification:

  - "unplugged":      memory blocks are not present
  - "online":         online as system RAM, zone chosen by the kernel
  - "online_kernel":  online in ZONE_NORMAL
  - "online_movable": online in ZONE_MOVABLE

"offline" (blocks present but offline) is reportable for backward
compatibility but is not writable because it entices the race condition
we are trying to solve (offlining all the memory blocks in one atomic
and unplugging them in another atomic).

mm preparation:
  1. mm/memory: add memory_block_aligned_range() helper.
  2. mm/memory_hotplug: pass online_type to online_memory_block().
  3. mm/memory_hotplug: export mhp_get_default_online_type().
  4. mm/memory_hotplug: add __add_memory_driver_managed() so a driver can
     select the online policy.  The override is restricted to in-tree
     modules via EXPORT_SYMBOL_FOR_MODULES().
  5. mm/memory_hotplug: add offline_and_remove_memory_ranges() for atomic,
     all-or-nothing offline+remove of several ranges under a single
     lock_device_hotplug().

dax/kmem feature:
  6. Plumb online_type through the dax device creation path.
  7. Extract hotplug/hotremove into helper functions.
  8. Add the "hotplug" sysfs attribute.
  9. selftests/dax: regression test for the attribute.

DAX Kmem probe still creates the memory blocks by default, even when
the default policy is "offline" to preserve backwards compatibility.

Unplug (atomic offline+remove of the whole device) is the new
capability provided by the attribute.

I downgraded a BUG() to a WARN() when unbind is called while the device
is not unplugged.  The old per-block toggling pattern is still used by
userland tools and disconnects the 'hotplug' value from the real region
state; until per-block control is deprecated or restricted in some way,
WARN() flags that tools should move to the new atomic pattern.

Changes since v4:
  - renamed 'dax/hotplug' -> 'dax/state'
  - refactored the work into a shared offline_and_remove_memory_ranges
  - reworked MMOP_ helpers to re-use code
  - fixed cached system default online_type regression
  - nits

Gregory Price (9):
  mm/memory: add memory_block_aligned_range() helper
  mm/memory_hotplug: pass online_type to online_memory_block() via arg
  mm/memory_hotplug: export mhp_get_default_online_type
  mm/memory_hotplug: add __add_memory_driver_managed() with online_type
    arg
  mm/memory_hotplug: add offline_and_remove_memory_ranges()
  dax: plumb hotplug online_type through dax
  dax/kmem: extract hotplug/hotremove helper functions
  dax/kmem: add sysfs interface for atomic whole-device hotplug
  selftests/dax: add dax/kmem hotplug sysfs regression test

 Documentation/ABI/testing/sysfs-bus-dax       |  26 +
 drivers/base/memory.c                         |   9 +
 drivers/dax/bus.c                             |   3 +
 drivers/dax/bus.h                             |   9 +
 drivers/dax/cxl.c                             |   1 +
 drivers/dax/dax-private.h                     |   4 +
 drivers/dax/hmem/hmem.c                       |   1 +
 drivers/dax/kmem.c                            | 475 ++++++++++++++----
 drivers/dax/pmem.c                            |   1 +
 include/linux/memory.h                        |  22 +
 include/linux/memory_hotplug.h                |  13 +
 mm/memory_hotplug.c                           | 162 ++++--
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/dax/Makefile          |   6 +
 tools/testing/selftests/dax/config            |   4 +
 .../testing/selftests/dax/dax-kmem-hotplug.sh | 207 ++++++++
 tools/testing/selftests/dax/settings          |   1 +
 17 files changed, 806 insertions(+), 139 deletions(-)
 create mode 100644 tools/testing/selftests/dax/Makefile
 create mode 100644 tools/testing/selftests/dax/config
 create mode 100755 tools/testing/selftests/dax/dax-kmem-hotplug.sh
 create mode 100644 tools/testing/selftests/dax/settings

-- 
2.54.0

