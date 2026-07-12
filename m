Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B6534107D
	for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 15:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783871118; cv=none; b=fNwsUH00JGPG1Oc/1TsA5Mcs5ZB6JK8t7m9pk/qygtYo1YMoCxuLpJLlwgtZjqExDYf6U5rD2FhFETH41FmLq+fYjHnGEPcjKQeyLxbfkqxyIQhNLAOODWVN60Js7znOlei5yZRyKcxmikiOSdlJKzOPCTEe7SSlsAZq5qeiB7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783871118; c=relaxed/simple;
	bh=c2rTynvZmw41AyQtdN492V16tvCPLmmOtTp42guX71k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XyCl0h1D+zI4mL0w4kq5FFd5/qtbTGSVPGqNSqbn5Xoopqu6AbVefe71iHnHWBnXD0skxdhnk+ijHGzR7rPaRAz5zgBPU0MJSiQ1qL37NChwhRH/3LmEoRJXtBXRWV1U6kt6I8K0TKLhqwX3Sqcm2nRFUBChgb2YrRhT7KPefrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=GZsKluPo; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="GZsKluPo"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-92efc443c61so74032885a.2
        for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 08:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783871115; x=1784475915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/sA+zg3hun+tcy2tg/tGGOKyNNSW3ITFRulSJiyHuZ8=;
        b=GZsKluPoHfIYmscf8u2oycQ5nBzV2tq9Xr4H8lmZkPwwcdqM7JOyiUbURgduZ2QA6P
         DalgJziqQlgfUUBh7fBEIL/RzFaywHyhsY4AkXU201TPWr5Poh49yT5t1rT4NOvODYmR
         C/cztJVHBVPDiZEZVyOh1JUH6jNfO1DGYHFS7yS4mlQtK5yRUE/pL0JgUOunX1RjDuxg
         rBTbc6gj5RhW7ubcrYO/MRZRCMmu/QEJiiOKefHBMla1Am0edz+AWwL8UKIC3FVotvAo
         VTwJlu8nwSL7lWCH8ej5HgGlXoLGPffDruzq1LECGejx9Z0qNzoSl9JOBZwFD4Y+AI3t
         T0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783871115; x=1784475915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/sA+zg3hun+tcy2tg/tGGOKyNNSW3ITFRulSJiyHuZ8=;
        b=NmGJ0Q422CcXHD65zgVY/KvFL/NPM9HWrPl8rRWgfOsmjT26q8s7N4dHc6vUPpqrgn
         ZNj2h2fbq9+Jr+M2j8c/qkVRQvCD+02qyVvPaSMOyBeEsDPUL8Ufr9AxOYZtL/Ou0sUI
         wTtXL+/3abu5CRdmgdUKjasThH+c3rK5wiEbh6iJkxbForJSc8XHwJvnOsy1KhCYD4lM
         N9+tCT5HnRY4gVYPoJgCqP3iwsfVGroA9M3OIcGITb30VaDisOd92SU9yOetK/ovqsJc
         0Id1byIQX/rxmnHKg0tVH1AKWQyijI08TPdWhWzfM+Nz+P+mJjzJeY/o2sEFuXMutsMb
         S5bw==
X-Forwarded-Encrypted: i=1; AHgh+RrSPUBVV2OEYttUi80JnMSrYoP+iDyxhVv5UcJlOFOxNhGmzuelEKSn8OwiNCngnZtthhFEDm8JoTjEfZCodtc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrf52EaeFHFzyqtMjsgC9AprsEJwUxyJus0tgzoDKcmXUm+VfI
	VphEWRPmrd2hhq7vgv6uJ4rLHTtGREca2CmwGErk5KsJqoD7MjVmK3v4DNchMByQyB0=
X-Gm-Gg: AfdE7cl7Vd1AxYiLebako5wrAdv6MDkUviu8R11nUqkpsQ4p1ztE4hfj+rJCwZ4stVy
	adnJwUt6r4lZ8ENmQKfqLpfRk0Vdlo5LKdPTfDK8/YD2S6HzB8xbOTolYrFes3+J8jNwunFCu5M
	fbf6S3g1nOOj909WP6pNsLHVVcFlUKywOuWQzmWNY9r8hKIEc2PfsEI7apprdhKuvOIUdqNmv53
	D0i+hnCVm5CE7YQaB14CMiMnZVWhoaQ0I6I0YtWExXhqNWCTVv6dyBa2H0UjGXOe62E/ULLi67j
	cZ6lI1PhgAOJvB50Q1nooaVgKqMrwuBMWsDP+vfY59JuSuwRJW09xhtAhQ68RZmKuKoDly4pOGS
	A7weRPLBiKlxqeFP02kuke+fONs4h3/YAc3EPwIwQXMablbW8aqeithjaxL36WvBG6+brYeKILo
	M4rONqryCMTgEL1H69oCb+dr4gYFX91K8dPAOlgDvMz9kuKSovww1rTBRJa5vCmKC3vWdLJLLvB
	j6ec/7PeOEr
X-Received: by 2002:a05:620a:6f05:b0:920:4f78:3d7 with SMTP id af79cd13be357-92ef2b4b7e4mr642033485a.3.1783871115261;
        Sun, 12 Jul 2026 08:45:15 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d61facsm862186485a.42.2026.07.12.08.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 08:45:14 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev,
	nvdimm@lists.linux.dev,
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
	gourry@gourry.net
Subject: [PATCH v7 00/10] dax/kmem: atomic whole-device hotplug via sysfs
Date: Sun, 12 Jul 2026 11:44:54 -0400
Message-ID: <20260712154505.3564379-1-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
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
userland controllers that interfere between the two steps.

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
we are trying to solve (separate atomic steps for offline and unplug).

'unplugged' (atomic offline+remove of the whole device) is the new
capability provided by the new kmem sysfs attribute.

dax/kmem probe still creates the memory blocks by default when the
default policy is "offline", to preserve backwards compatibility.

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

dax/kmem:
  7. Resolve mhp default online type at probe time
  8. Extract hotplug/hotremove into helper functions (refactor).
  9. Add the "state" sysfs attribute.
  10. selftests/dax: regression test for the attribute.

---

v7 changes
- picked up tags
- dropped !data checks (Dan)
- re-defined 'DAX_KMEM_UNPLUGGED (-1)' (Dan)
- converted `state` to static ATTRIBUTE_GROUPS (Dan)
- dropped DEFAULT until later commit with per-driver settings (Dan)
- state_store now frees reservations on total hotplug failure (sashiko)
- kmalloc_array -> kmalloc_objs (Dan)
- unbind reworked to just remove_memory() (still never offlines, no deadlock)
- added memoryN/state and daxX.Y/state desync test
- gated destructive unbind tests behind DAX_KMEM_TEST_UNBIND
- added DAX_KMEM_TEST_DEV environment variable for target dax device
- added comment in offline_and_remove_memory_ranges for clarity
- minor spellcheck, whitespace, doc fixups

Gregory Price (10):
  mm/memory: add memory_block_aligned_range() helper
  mm/memory_hotplug: add mhp_online_type_to_str() and export string
    helpers
  mm/memory_hotplug: pass online_type to online_memory_block() via arg
  mm/memory_hotplug: export mhp_get_default_online_type
  mm/memory_hotplug: add __add_memory_driver_managed() with online_type
    arg
  mm/memory_hotplug: add offline_and_remove_memory_ranges()
  dax/kmem: resolve default online type at probe time
  dax/kmem: extract hotplug/hotremove helper functions
  dax/kmem: add sysfs interface for atomic whole-device hotplug
  selftests/dax: add dax/kmem hotplug sysfs regression test

 Documentation/ABI/testing/sysfs-bus-dax       |  24 +
 drivers/base/memory.c                         |   9 +
 drivers/dax/bus.h                             |   2 +
 drivers/dax/kmem.c                            | 500 ++++++++++++++----
 include/linux/memory.h                        |  27 +
 include/linux/memory_hotplug.h                |  14 +
 mm/memory_hotplug.c                           | 162 ++++--
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/dax/Makefile          |   6 +
 tools/testing/selftests/dax/config            |   4 +
 .../testing/selftests/dax/dax-kmem-hotplug.sh | 317 +++++++++++
 tools/testing/selftests/dax/settings          |   1 +
 12 files changed, 928 insertions(+), 139 deletions(-)
 create mode 100644 tools/testing/selftests/dax/Makefile
 create mode 100644 tools/testing/selftests/dax/config
 create mode 100755 tools/testing/selftests/dax/dax-kmem-hotplug.sh
 create mode 100644 tools/testing/selftests/dax/settings

-- 
2.53.0-Meta

