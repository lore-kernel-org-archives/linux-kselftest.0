Received: from mail-dl2-f32.google.com (mail-dl2-f32.google.com [74.125.229.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43559374A08
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 04:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790398532; cv=none; b=NZzfhj4RjGxaKuVdPwjBx/+eCv36FnMcTdhKcP0POg1BLjWKrCiob3NI40xCBRiRgKB1a5A9cwsz2A/vlcH7NUDYeNFMo7Dy2EGg9JvNILX9u1tImEyaEQHWw//oP9EC+sW3eOLEmVH16WN/+ny+xkkN/SQbL01+bZM2uvRaebs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790398532; c=relaxed/simple;
	bh=VJt+X1k/ydRjcIAibigZ3Pxk4kxu4GwSuJxbtbPx6e0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b/MpYyZ0Y0hkXzZi/TD7HJS1QKVcqoM0g+36asnO+0m2GRoVlLInhaVAqfSDjAfeAHJOPx2VQFCXkwbWstZTCxtvTF2cK/dkEF43C67Hma9bIBqSih8yelUXOFaBA4O0QWdJZbbBTx9VLtufGPMXx3kwIRIFGVShmZ85rjuD+Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7s1KCd1; arc=none smtp.client-ip=74.125.229.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7s1KCd1"
Received: by mail-dl2-f32.google.com with SMTP id a92af1059eb24-1437b77c274so798820c88.3
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 21:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790398529; x=1791003329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lez8Lh9LK2IJV3Lg+4+qOHMKMvDRPEZgp+OMdBxRRpI=;
        b=b7s1KCd1Fc3xk7Px/PBFexs1HShEbmxEi3Q/iJYAj5PgTXH9qm5E/gmCE1R0dPRlbD
         2qQezhrQiSfuQxXSg5DmYbvvtXPVuM3erE53zeONQJlGk7S5Ekh0+o2VWqM+0950t7rS
         QP8zY6BIytqUO2w4L/tROUegVB/hV7x5/050miymXwwzjtSepoRxWBEdCHLUSwS1KPwA
         PCIeOfTm0v/uSuCVk5NWm9dMICd8VhGbXRMni37lFvhEl/BEJvBy6mJNyMj9KS2mkQNX
         g40MyqggOsyDLyAfHsNB+wKwufepyQCd+AhSGrsUZsQLyEv0F1eR1TUd2ox+0/YL6NdR
         9WXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790398529; x=1791003329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lez8Lh9LK2IJV3Lg+4+qOHMKMvDRPEZgp+OMdBxRRpI=;
        b=MDCJ1QTKOppwPBxRIRCDlN5PRQroiaeQSZ2EATgzuSdslmkojo3jeEMe/0YdBcnnQ/
         CFBy85evPuucv1IBtNBSEpOHZShIs6aicAUNDpGX0fNCO/uKM+VHmZqeSrbZjkCmG370
         CREKTkDoSHy4eBqySJZAMcxBRaWRsq1DeWJ399k3rxl0KCAG8iKGqxgr9M5JNsQhArv5
         iXho63G/PrZhdM/2L6vxtTpkCVIU0DWV1h4D5BneQ80TMhkPG4cTLhXjYOE81nBy5YfF
         PYToynTDMn530hPWNMG87hd4vE2ZC0y2lJHGwXTSQZJPBhmhLnRfS16DoJebxXSNhDd8
         8uTQ==
X-Forwarded-Encrypted: i=1; AKwUvByM1PFQ7v7AC2hbiB+yKmG2tIBboq8iM55BO91/vWeIQgW+1eJjMsUMPrnuQvYAPOM2mmAI+TCD3oJjbRn33q0=@vger.kernel.org
X-Gm-Message-State: AFuF++lzK1uUT3iirgxemPLKmSKnR5sJGyKhe79dicK43oVNS5bpyRF+
	CW7KYF0FfRccax0nApKvZe410Ce2VzoyXsxWTnZ3aoz8yHSfaCmdajBJ
X-Gm-Gg: AYBFou1qZtovloGVLTRwEcTEd2bH1WAzXBIOq0CrNzC8p6z3GnfNELxdjOqmD1fRdOY
	TSp4JDDf2dARG4aD3bHwggeTIKkVMQ7bkkJX21sqyE63zvxer+7AonKKHOeDMCMZVCPTu1uQYoN
	UAbwPbT6uLqbPQpbOl8QQxKlLIjRFSnfAf6+5bmsC9Lsd6vXvLliUKbpt0pPEZGdFk4g2EYIfda
	/3Zx2iMdLrYLNqo+Rz0PrHymYhkBWxlTx6Fdks3tT5/qGIGROS176nKqYiyrGOPtEUuVf0ul/tq
	KSg/FdoXvX5NhV8HL1RyyjZmOpBlFxaOnmPxLAvi1E1M2R+P2JO/pp8t2TZo6Wtx8780bFxDv/l
	oMLjpLH9EcvuxBjMGELpYe8LzGaVmFle0k2Qdy39Lz5KDYmtwF7b5O3Bk6E7B6nNfwMeRfHzYhJ
	s7CCHRwWFT/evShatETgPmnuCIo/QDyKhURuE3f/BWlzndu/Dv0gGB9eW88swC/Zmd9Mwc5eq/F
	o5kviYhNtlQ1xhxVU3T+kniTPFdOeeDPummJOutBn862OXkGzBfu/ExM36O+A/FcGlr2pB4Cn90
	e5jX6+gizPGZpr6rmBMi289JrRxesh65U0nDxEnbU8RqO31fmVleziHBlkA=
X-Received: by 2002:a05:701b:4354:b0:143:8865:cca with SMTP id a92af1059eb24-146cfdcf390mr1703579c88.22.1790398527862;
        Fri, 25 Sep 2026 21:55:27 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145adcc5b00sm9334211c88.15.2026.09.25.21.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 21:55:27 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthias Goergens <matthias.goergens@gmail.com>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-api@vger.kernel.org,
	Alejandro Colomar <alx@kernel.org>,
	linux-man@vger.kernel.org,
	Karel Zak <kzak@redhat.com>,
	util-linux@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH v2 0/4] mm/swap: reserve swap areas for deliberate offload
Date: Sat, 26 Sep 2026 12:55:13 +0800
Message-ID: <20260926045517.3458413-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This RFC adds offload-only swap areas for deliberate cold-page offload to
backends unsuitable for pressure reclaim. ZFS zvol swap has documented
deadlocks under memory pressure [3]; compressed swap is another target
because writes may need memory despite free logical slots.

Explicit proactive reclaim can use these areas alongside conventional
swap, ordered by priority. Ordinary reclaim cannot initiate non-zero
writes to them, including through retained swap entries. Conventional
capacity is not reserved for emergencies. Operators choose the policy;
the kernel does not measure headroom or make an allocating backend safe.

TMO/Senpai [4] and DAMON_RECLAIM [5] are related cold-page reclaim
approaches. This RFC admits offload-only swap through memory.reclaim and
per-node reclaim, but not DAMON. Other related work includes per-cgroup
zswap writeback control [6], Virtual Swap Space v4 [1] and swap tiers v10
[2].

The util-linux companion [8] proposes swapon --offload-only and an fstab
option. Older swapon silently ignores the fstab token, so persistent
activation needs discussion. Apply the separate i915 fix [9] first to avoid
a pre-existing folio-lock leak when shmem writeback is skipped.

The series fixes zram selftest device tracking and error reporting, adds
the swap policy with DRM eligibility checks, and tests routing, workingset
activation and retained-entry write refusal. It is based on mm-new at
995829088503.

Feedback is particularly welcome on:

- Activation-time eligibility versus backend placement or migration:
  is retained-entry refusal, with possible reclaim churn or OOM,
  acceptable without migration?
- Eligible-capacity accounting, including overcommit limits and OOM
  scoring; cache recovery, cluster invalidation and workingset activation.
- Persistent activation and visibility: current swap listings do not
  expose the policy.

Validation includes x86 builds, affected arm64 MTE objects and builds
without swap or memory cgroups. QEMU tests covered routing, retained-entry
recovery, data integrity and cleanup, with negative controls for write
refusal and teardown failure.

I have also been using this policy on my own machine with experimental
bcachefs swap support, with no problems observed so far. Deliberate stress
testing is confined to VMs; I do not deliberately stress-test this machine.

Changes since v1, incorporating Sashiko's public review [7]:

- Improve selftest isolation, retained-swap measurement and memlock skips.
- Track allocated zram devices, wait for udev probes and report cleanup
  errors without deleting data through a mount that could not be released.
- Clarify activation, capacity reporting and conventional fallback limits.

[1] https://patchew.org/linux/20260825153238.2695446-1-nphamcs@gmail.com/
[2] https://patchew.org/linux/20260713025644.170839-1-youngjun.park@lge.com/
[3] https://openzfs.github.io/openzfs-docs/Project%20and%20Community/FAQ.html#using-a-zvol-for-a-swap-device-on-linux
[4] https://engineering.fb.com/2022/06/20/data-infrastructure/transparent-memory-offloading-more-memory-at-a-fraction-of-the-cost-and-power/
[5] https://www.kernel.org/doc/html/latest/admin-guide/mm/damon/reclaim.html
[6] https://www.kernel.org/doc/html/latest/admin-guide/mm/zswap.html
[7] https://sashiko.dev/#/patchset/20260914104501.3960616-1-matthias.goergens@gmail.com
[8] https://github.com/util-linux/util-linux/pull/4633
[9] https://lore.kernel.org/all/20260914105606.3997649-1-matthias.goergens@gmail.com/

v1: https://lore.kernel.org/all/20260914104501.3960616-1-matthias.goergens@gmail.com/

Matthias Goergens (4):
  selftests: zram: track owned devices and report cleanup failures
  mm: restrict offload-only swap to proactive reclaim
  selftests: zram: cover offload-only swap policy
  selftests: zram: cover retained offload-only entries

 Documentation/mm/swap.rst                     | 105 ++++
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |   2 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |   6 +-
 drivers/gpu/drm/msm/msm_gem_shrinker.c        |   2 +-
 drivers/gpu/drm/panthor/panthor_gem.c         |   2 +-
 drivers/gpu/drm/ttm/ttm_backup.c              |   2 +-
 drivers/gpu/drm/xe/tests/xe_bo.c              |   2 +-
 include/linux/swap.h                          |  29 +-
 include/linux/vm_event_item.h                 |   1 +
 mm/memcontrol.c                               |  20 +-
 mm/page_io.c                                  |  24 +-
 mm/swapfile.c                                 | 123 ++++-
 mm/vmscan.c                                   |  31 +-
 mm/vmstat.c                                   |   1 +
 tools/testing/selftests/zram/.gitignore       |   2 +
 tools/testing/selftests/zram/Makefile         |   4 +-
 tools/testing/selftests/zram/README           |  20 +-
 tools/testing/selftests/zram/config           |  10 +-
 tools/testing/selftests/zram/settings         |   1 +
 tools/testing/selftests/zram/swap_offload.c   | 425 +++++++++++++++++
 .../selftests/zram/workingset_offload.c       | 207 ++++++++
 tools/testing/selftests/zram/zram.sh          |   9 +
 tools/testing/selftests/zram/zram01.sh        |   9 +-
 tools/testing/selftests/zram/zram02.sh        |   9 +-
 tools/testing/selftests/zram/zram03.sh        | 174 +++++++
 tools/testing/selftests/zram/zram04.sh        | 164 +++++++
 tools/testing/selftests/zram/zram05.sh        | 447 ++++++++++++++++++
 tools/testing/selftests/zram/zram_lib.sh      | 189 ++++++--
 28 files changed, 1926 insertions(+), 94 deletions(-)
 create mode 100644 tools/testing/selftests/zram/settings
 create mode 100644 tools/testing/selftests/zram/swap_offload.c
 create mode 100644 tools/testing/selftests/zram/workingset_offload.c
 create mode 100755 tools/testing/selftests/zram/zram03.sh
 create mode 100755 tools/testing/selftests/zram/zram04.sh
 create mode 100755 tools/testing/selftests/zram/zram05.sh

-- 
2.55.0

