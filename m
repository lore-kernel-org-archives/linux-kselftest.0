Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883162;
	b=e88uJtwHCLvfKI8/qFmo7HR96SyC0gR4hmRVklLIwD/g3GElJ5AaVVlBsVaxXYpIX45l
	 1XIOCU5xojFaqyXqPj89/clY+Lf7p4MP1bAoLbBEDrpInjRUo5lxQsRWBv0GHkf4TgLrr
	 l0ycgcp14w/pbB/Amyacph37+3N+54ARJ3qIrAQuxI71wQM7RHQXqL3BSd1Sk1S2O4O3v
	 hiLo1W6GXZMh055KWnrMoxkuaF2hN3WhAbcwQPaVjQARIU/DRisrtvMNxtUd+ogz6/4WI
	 UwFq57r03w3RX6KoaUGDROY1qPObUqANT91nbvEX6LL79iFAELMOG8IbQxxz1zsmj8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883162;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=/S8nmBJYJf0PJEvSPvPjoWUsu1ImoW+EhQidFJg863g=;
	b=Dlz5n+XpApEQpskO/aOnow3eD2rUhsh1UGGmcuEkz64Dt0tNmHuxknx0E/eKnVeUYTpY
	 y14EbrQOw6WT/30a8GJdEo5SqyJykzTUlkiDwqwYudMKtu9ZTYJ2w5KtqqjC7YEZ7LHgL
	 mFcQFbTeBPxbuXrCsdm+JOQdmaceIfLQxcrsYornhGYnwH/YI59hRko7DmGt7fQJv7M6q
	 +MLF32jHpyynHqhZyRrXVHHe3Iw44WCbFBFGn8vqQW1TY0hgtFwiqn/YaMo8IZFew2O8l
	 RrAFcp+fXFa3H17saGksT1dHBFIEGMOg7iwd9Pk27wix+Rs1uW3hTmowHhIbZaBu8BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qekM4S4p;
	arc=none smtp.remote-ip=95.215.58.210
Received: from mta1.migadu.com (out-210.mta1.migadu.com [95.215.58.210])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB1B606A329
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 12:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CB1B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qekM4S4p
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cNkwqBsz8pJ04Hv17fnP9AR30asZBRa4qlasYCrXmFQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793883158; v=1; x=1794487958;
 b=qekM4S4p6TVCPfIGPve2MmFyhXTrLysxJtYoq1Tq3i0IrmdQg4si+eQM7HOmVSl3sgFOQ+T/
 qT7kQao6U39ztApGAwbmwjXImY6lSgWivmk6dnROW9kxdArLVkwFvskwfZITtkCHubcpyIawCiW
 NAsCsqczlEw0QWa7T7N3TKFU=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0c46c4d6252889c3;
	Thu, 05 Nov 2026 12:52:38 +0000
X-Mizu-Trace-ID: 0c46c4d6252889c3
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: Waiman Long <longman@redhat.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Ridong Chen <ridong.chen@linux.dev>,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	Guopeng Zhang <zhangguopeng@kylinos.cn>,
	Ridong Chen <chenridong@xiaomi.com>
Subject: [PATCH 0/4] cpuset: preparatory fixes and cleanups for partition rework
Date: Thu,  5 Nov 2026 20:52:11 +0800
Message-Id: <20261105125215.2205892-1-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
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

From: Ridong Chen <chenridong@xiaomi.com>

This is the first part of the cpuset local partition rework posted as
RFC v4 [1]. The rework is split into three parts to make it easier to
review and merge:

  1) fixes and preparatory cleanups (this series);
  2) introduce partition_enable/disable/update() and rework the local
     partition code on top of them;
  3) clean up the remaining partition state handling outside these
     helpers.

Patch 1 is a fix for an existing bug, found while looking into a review
comment on RFC v4: when cpuset.cpus.exclusive of an already invalid
partition root is cleared, its effective_xcpus is not reset, so its
former exclusive CPUs can't be claimed by a sibling. A test case is
added for it.

Patches 2-4 are the first three patches of RFC v4, rebased onto
next-20261104:

  2) add an early empty cpumask check in partition_xcpus_add/del(), so
     callers don't need to check it;
  3) settle the isolation state of CPUs given back to the parent in
     partition_xcpus_del(), so isolated_cpus_release() can be removed;
  4) generalize validate_partition() so it can be used for both local
     and remote partitions.

All patches build on their own, and test_cpuset_prs.sh passes with
this series applied.

[1] https://lore.kernel.org/all/20261101114206.2434398-1-ridong.chen@linux.dev/

Changes since RFC v4:
  - New patch 1 to fix the invalid partition effective_xcpus reset.
  - Patch 3: only settle the isolation state of the CPUs still owned by
    the parent when invalidating a child partition in
    compute_partition_effective_cpumask(), as the parent may be shrunk
    and not updated yet. This code is removed later in the rework.
  - Rebase onto next-20261104, which includes commit 362212853cd0
    ("cgroup/cpuset: Fix incorrect CPU accounting with parent's effective_xcpus expansion").

Chen Ridong (2):
  cpuset: add early empty cpumask check in partition_xcpus_add/del
  cpuset: generalize the validate_partition() interface

Ridong Chen (2):
  cgroup/cpuset: Reset partition data when an invalid partition stays
    invalid
  cpuset: settle isolation state when CPUs are given back to parent

 kernel/cgroup/cpuset.c                        | 211 +++++++-----------
 .../selftests/cgroup/test_cpuset_prs.sh       |   4 +
 2 files changed, 89 insertions(+), 126 deletions(-)


base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
-- 
2.34.1

