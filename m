Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CB52EEE9B
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 21:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782854330; cv=none; b=SlywKC44DCRQdSNf420gz6HdfYw43vR0GVF8B8QYqlDXguN4FNmlt49pd4pAjOlHNBJK9hQH3zbILiBvYnAQTSu1K2AZlCUV3D1qJO4XO5Yh6aaSLp3XhFNj4gNhIGZbWDs368ls41RL1IEmURMgwU4KvRn/keYElVsxsjkNeow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782854330; c=relaxed/simple;
	bh=ZxDj2bIyTYA2VqEzR9BlPCz00cVKtf/fVVQwM0leMSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qIjHl1aWySHsTKEjjLrFR1hG7SUcfgFp7ZeXtoTMaomEXW+ChtEzizrc7PdNBUH4EjL1AxyWiMhLdGq0P0UkTK5KVsgzq7EnHGU5bOcWl+I30UZXJkXc3uf1K9nuTXwvjnNHAw6ti/3lM035ZW/gMGmlHqOTogyFHN9I0izPV88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ge15xg39; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="ge15xg39"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92e50a650a0so201175985a.1
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 14:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782854328; x=1783459128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=15soTVn10pZL1HzcUE7vkWAPLmAyPlWsN9L93RXfdBQ=;
        b=ge15xg39Ejjk7xuu9i78siBjD6WxsouzvIZQPFmnWY6K/usg39ci/H5R87WBIudlh0
         AqtOvIxqq6ISwx5tsJzQ1aiySUA+UM2xvVEafiVMlrbcmrrzaGONFP5kvhxIkGvolI+a
         Gcfo3uM7MwX7W6Fd+gB5mkuWnQmNEZGc5Uj0j/YQ5obur90P5kPeNh/RKJz7mRj9nHKW
         OmfPYdwGFnWmxbyUTPv3AI1oWfAbkugv4ZiT8rl9WZYgB6yrzXFtID3cz/My6wISK20O
         OTPZ1ThaYgKgwbhSIjzo4CvnHYBARq9EoZMleWRQK85AV4e9c5UxET+4RBd27Aimu+39
         pTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854328; x=1783459128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15soTVn10pZL1HzcUE7vkWAPLmAyPlWsN9L93RXfdBQ=;
        b=dkbaVxSvehYypOGOEZCzZiBrrV74O7P/5u2rFLpTcsCOQ0eS7xutEOqaHz9+pDMNva
         qM9wNyjx+GhnpVkAHRiOVwEXjVqcDIkJZPHiXgde+ZgCRTu3lbtQvN+aTxyzeMAMwn5N
         KNImTe3d+Vq8Bkvbk9xSlhpXj6PYNC6DDwYgm6zNLAkzy2E/UosVh9AdaugT8tmnVMta
         r7JybXEDbF4h/AEue10yy/sKeaHULQ0vaLOLauKQYAtTdjIqLz51gN5gdl08mLwhpKK3
         YLbdRqQphXSNUGtMiJULpBBEcYsgT6q16jqdyx2pdHh/7C7A0Q1EvwacHHOOI6+PqAi4
         Ltlg==
X-Forwarded-Encrypted: i=1; AFNElJ9hh7piux1uqdR9DYkTDb8HkxPm+XRdCOLGU+WApi+V9wtrBDFZ6eFKOsbDPOTyAHTItqYj1l1KKAW0ux5+1K0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwntGPbow5SDxjY+xzzEfgsli/+gsUrFFanniPmr0xPE6dOzbF8
	fEw2JwC/ox7G+wW/ERD19X6kPEbwjgSOiVjPL0WrcmCrNz6Nza86HAzSgS0tPnPNK/8=
X-Gm-Gg: AfdE7ckf8OD5XooKzHLcr3TPXfCdWUT8Ua5Ih1LBuXET8NKuNWjivYCS+SwoIpFeNZv
	3aMUYR1fwCbwk8Hp8C7bOqMNT0Htv2vkEIOR54WYFp4EPla4A9opGQr2nm+BNqQNqb2JICexeYO
	TbkQNZ7udl0xuRym1wn6cCCv4fPgU6AglQJ7hugFNg2NyW4VzlOf8/VSULtw098B9mrbALIkRcU
	evFHlGDqx0VLhCqu1I9qhP581+o8X3sHQumMcOrLvJBmAYi6nDCET6UQB3Et3sbDZUy9duwPI7z
	Eo8eu6dmm8iyF6ADVx17s9UCqk1pUxPc0eLZpVc2bbG8dmaqjnNeOhAk7hp/Mlcr0YuRHgjfrqN
	sZMnpy8n7F8JJps3D+pLpC+EMLdqSEsXJOoDTcPzO/nyuVhU8slGpbuwdG3+NUBRnTOQCZ0OV9S
	s8tJ0okk8nZ5TxCOYKHnqI7IPKs1XnPQunibuhqHQcjtyf2qFEfscJcXRtdaCIdqxiJ+d3zSwZW
	g==
X-Received: by 2002:a05:620a:29d5:b0:92b:67e6:8ac0 with SMTP id af79cd13be357-92e6284f33dmr789795885a.74.1782854328078;
        Tue, 30 Jun 2026 14:18:48 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e62366303sm335924285a.40.2026.06.30.14.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:18:47 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
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
	alison.schofield@intel.com,
	akpm@linux-foundation.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	gourry@gourry.net,
	iweiny@kernel.org,
	Smita.KoralahalliChannabasappa@amd.com,
	apopple@nvidia.com
Subject: [PATCH v6 00/10] dax/kmem: atomic whole-device hotplug via sysfs
Date: Tue, 30 Jun 2026 17:18:32 -0400
Message-ID: <20260630211842.2252800-1-gourry@gourry.net>
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
steps. This was discussed in the LPC2025 device memory sessions.

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
  2. mm/memory_hotplug: add mhp_online_type_to_str() and export the
     online-type string helpers.
  3. mm/memory_hotplug: pass online_type to online_memory_block().
  4. mm/memory_hotplug: export mhp_get_default_online_type().
  5. mm/memory_hotplug: add __add_memory_driver_managed() so a driver can
     select the online policy.  The override is restricted to in-tree
     modules via EXPORT_SYMBOL_FOR_MODULES().
  6. mm/memory_hotplug: add offline_and_remove_memory_ranges() for atomic,
     all-or-nothing offline+remove of several ranges under a single
     lock_device_hotplug().

dax/kmem feature:
  7. Plumb online_type through the dax device creation path.
  8. Extract hotplug/hotremove into helper functions.
  9. Add the "state" sysfs attribute.
  10. selftests/dax: regression test for the attribute.

DAX Kmem probe still creates the memory blocks by default, even when
the default policy is "offline" to preserve backwards compatibility.

Unplug (atomic offline+remove of the whole device) is the new
capability provided by the attribute.

I downgraded a BUG() to a WARN() when unbind is called while the device
is not unplugged.  The old per-block toggling pattern is still used by
userland tools and disconnects the 'state' attribute from the real region
state; until per-block control is deprecated or restricted in some way,
WARN() flags that tools should move to the new atomic pattern.

Changes since v5:
  - mm/memory_hotplug helper into own patch (david)
  - offline_and_remove_memory_ranges - nits (david)
  - offline_and_remove_memory_ranges - warn and continue (david)
  - memory_block_aligned_range(): end-address underflow (sashiko)
  - dax: store the online_type sentinel as int (sashiko)
  - dax/kmem: skip ranges that failed reservation on hotplug (sashiko)
  - dax/kmem: on unbind fallback to legacy if still online (sashiko)
  - selftests/dax: avoid cascading skips, clobbered state (sashiko)

Gregory Price (10):
  mm/memory: add memory_block_aligned_range() helper
  mm/memory_hotplug: add mhp_online_type_to_str() and export string
    helpers
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
 drivers/dax/kmem.c                            | 516 ++++++++++++++----
 drivers/dax/pmem.c                            |   1 +
 include/linux/memory.h                        |  27 +
 include/linux/memory_hotplug.h                |  14 +
 mm/memory_hotplug.c                           | 161 ++++--
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/dax/Makefile          |   6 +
 tools/testing/selftests/dax/config            |   4 +
 .../testing/selftests/dax/dax-kmem-hotplug.sh | 190 +++++++
 tools/testing/selftests/dax/settings          |   1 +
 17 files changed, 836 insertions(+), 138 deletions(-)
 create mode 100644 tools/testing/selftests/dax/Makefile
 create mode 100644 tools/testing/selftests/dax/config
 create mode 100755 tools/testing/selftests/dax/dax-kmem-hotplug.sh
 create mode 100644 tools/testing/selftests/dax/settings

-- 
2.53.0-Meta

