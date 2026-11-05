Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883840;
	b=nZepsMkk9+YJrM9XbMh8XDEpWjqyU3qCGzsfM7QFeVd0K+Dq/Gyeqpy/e5TKctJ2inAB
	 NKCS+FKcifdtnS8WNWYzAU1vW2F9DyCYZN63VuTXzVgOKESbSig72pFi42gjK0aLY9AzP
	 7+a/ZoXSKRlYF3eMjxMvNTEzpZGeVwvp4vg+L4c+pvFNtRE7E6rhjr5A+4TpUvuVdfkR4
	 mAcb0g2jEUo5df37lyCYAJ9RZ2MKLlJN12NSb0tlQMLUSAOG2Yq0pcNQ7bX/Ic2eMgTk8
	 22QpvDC/XetDGfR7PqwZnsbYCuIkDillA/rCMW43E2pwxmfmY+0I+QWVe4OrKHtmVGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883840;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Ow3hYsokloz6dGsTIFWuZiX4Z7MaaZQBVMCHUvEpQcs=;
	b=BA+cT9O4K0rfN+J7iVacTHXKuCH6Ia4g6PY5L84qVp9dyq9LyWWGMYtpP6OYgtSZqeiY
	 A1amUQ0kqbAh6NVmzyESTZC4TWtUntN76KF++zi2PeS8+S4EtjJyfXU33ewq2RT2Hkop5
	 Q9Zt3JK2mEMYb4DWuZXxXeLkTctT14lho2rJPTNvXK40ar4pKvfmXBtI+bKLkNvzSMrfi
	 MvCGbQUSMhy1F7McCwGU65inDWmYdlO7J3V7oZ5CnSBOhWsOo+ZIXulv9VZ8gM+DtElUB
	 +s1D0mWwKEQLTavCFEYtPd1XrURFT82wFSz49pIl91o7cNaL4ToT6d754LR4xl4TWOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LjU3DOYK;
	arc=none smtp.remote-ip=95.215.58.20
Received: from mta1.migadu.com (out-20.mta1.migadu.com [95.215.58.20])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9AD606A329
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 13:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A9AD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LjU3DOYK
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yjmLzbvOob+0DqNmhGg+eJW8ryTKkW21nhtP6VxEd2c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793883837; v=1; x=1794488637;
 b=LjU3DOYKC0o+GDgMmYz2VEdORFRrDkDHtGQ5qKHrKI1imh0QpPPrX6T6cntRUCPA6CdSDaEt
 +nZ+2eNKmaObL+p/SOlYM9LEJdf6kCj5KjTARWWkvmmfBqzrdmcPnLsSXMOaa/MyS/NSJENSvmD
 PUao0lD4ZTBJxqP3mDJT4Eao=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id aadead35cd8216c4;
	Thu, 05 Nov 2026 13:03:57 +0000
X-Mizu-Trace-ID: aadead35cd8216c4
X-Migadu-Flow: FLOW_OUT
From: Guopeng Zhang <guopeng.zhang@linux.dev>
To: longman@redhat.com,
	tj@kernel.org,
	ridong.chen@linux.dev
Cc: guopeng.zhang@linux.dev,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	shuah@kernel.org,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Guopeng Zhang <zhangguopeng@kylinos.cn>
Subject: [PATCH v2 0/3] cgroup/cpuset: Keep the top scheduling domain populated
Date: Thu,  5 Nov 2026 21:03:41 +0800
Message-ID: <20261105130344.664336-1-guopeng.zhang@linux.dev>
X-Mailer: git-send-email 2.43.0
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

From: Guopeng Zhang <zhangguopeng@kylinos.cn>

Boot-isolated CPUs stay in top_cpuset.effective_cpus, but are excluded
from its scheduling domain. Allocating all boot domain housekeeping CPUs
to partitions can therefore leave the top scheduling domain empty even
though effective_cpus is nonempty, leading to warnings and an OOPS in
build_perf_domains(). CPU hotplug can reach the same state.

The patches are ordered as follows:

  1. Check local and remote partition creation and CPU mask updates.
  2. Check the hotplug paths without crediting CPUs that remain allocated
     to child partitions, and invalidate local or remote partitions as
     needed to restore an active boot domain housekeeping CPU.
  3. Release an isolated child's CPUs when its parent is already invalid.

Changes since v1:
  Rework the fix following Ridong's suggestion and add test cases.
  Add patch 2 for CPU hotplug and patch 3 for isolated CPU cleanup
  when the parent partition becomes invalid.

  v1: https://lore.kernel.org/all/20261104071600.474587-1-guopeng.zhang@linux.dev/

Guopeng Zhang (3):
  cgroup/cpuset: Reject updates that empty the top sched domain
  cgroup/cpuset: Keep the top sched domain non-empty on CPU hotplug
  cgroup/cpuset: Release isolated CPUs when the parent is invalid

 kernel/cgroup/cpuset.c                        | 59 ++++++++++++++++++-
 .../selftests/cgroup/test_cpuset_prs.sh       | 55 +++++++++++++++++
 2 files changed, 111 insertions(+), 3 deletions(-)

-- 
2.43.0

