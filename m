Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404595;
	b=OsTv4E9B/YbkwI9TwbJMst5DB24bpHKDHgL7zxfn83ckN5yB0F9s/hh3yXQRFLZ0Hxox
	 aig2hT0U5d9DyDaBapQmtfWb6s+Sf9KhnmNBM/SlwUxMFprabXaHrLwdVsmtmr8kTtw8i
	 54QJKJIHAqBfm0rtA0Cst6qxc26JFrSfVxIAgxz23EwMSPyR1X80hMcE9Bn7Zw8yUBWOD
	 8cuF6BtTqFMygzVLBY6jYDsrbh0xMetSRjvw+HXGQGeHT2869iN63JmdckjPlch2XL8PT
	 yxW+uie6rA0bJrB1xpiiYykVoU0cifdvW+ABQCxd3gmdSj8J4Mtm7VSpOaf3EfXp0iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404595;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=yPXyR85ZGjl8cLhK0+9qJ60mEpjll9ZfGxDyPNzKK24=;
	b=MaMfPFWV2XGG5DitOjsEZz4iKDlAXeHDoX4aTa/ZtXo0MCQPQEiaxhK5CbrBRay7Ty0O
	 M95Kl7uH8zhco0k3RGhA3wR80erpgJ+vqkbaEWzFqLwMhaN3yU0uEkIlkUg84CXzNuWg1
	 XmyVj2Rb1SUc05QTmemjz2uQIoaEmIiMATRfwf+9LV6laHVUvk5rMbIRoQC0lUjK2FShs
	 H1wswNsOPdb9WzkwNuq4YWNplBV567QfZd17b5Emq5Ix4W+ehXoWhy01SBWID0BpeWFo1
	 Cd4jKui3iIplWMOkRCT5/mGEeRDmky9HzE6M6ygy+PJoLVej+1UJLYY2aEmaXHxUncQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CijKrmOB;
	arc=none smtp.remote-ip=91.218.175.132
Received: from mta0.migadu.com (out-132.mta0.migadu.com [91.218.175.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA06606A886
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 13:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CA06606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CijKrmOB
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PSpT5Sc3wmThmMLvMIuwKVFzFZKXPyJVwlLny2D+v7E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794404588; v=1; x=1795009388;
 b=CijKrmOBAy11S0P86lN56+jMkoSZ2eEinIhrMrJnD0B2obFCrmqdLNTkanSjXs1gQsXnDFOb
 FHqg6lcIGsGkTKOoPG2q1E7Mw9YBgzyn7FNf03iQ/O+8yFVu5PxTVBoQeSMZiUz6CSQPz4J8TJ7
 oFnpj+aqTK27XEr9PfooGGTw=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0a1a212ccf97d6c5;
	Wed, 11 Nov 2026 13:43:08 +0000
X-Mizu-Trace-ID: 0a1a212ccf97d6c5
X-Migadu-Flow: FLOW_OUT
From: Guopeng Zhang <guopeng.zhang@linux.dev>
To: longman@redhat.com,
	ridong.chen@linux.dev
Cc: cgroups@vger.kernel.org,
	tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	shuah@kernel.org,
	mathieu.desnoyers@efficios.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Guopeng Zhang <zhangguopeng@kylinos.cn>
Subject: [PATCH v4 0/2] cgroup/cpuset: Keep the top scheduling domain populated
Date: Wed, 11 Nov 2026 21:42:48 +0800
Message-ID: <20261111134250.16852-1-guopeng.zhang@linux.dev>
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
to partitions can therefore leave the top scheduling domain empty,
leading to warnings and an OOPS in build_perf_domains(). CPU hotplug can
reach the same state.

Following Ridong's review, use one tasks_nocpu_error() check for all
parents, with an explicit mask of CPUs returned by the update. This also
allows CPU replacements under populated local parents. Hotplug passes
no returned CPUs and preserves partitions unable to restore an active
boot domain housekeeping CPU.

Patch 1 contains the complete kernel fix, including all caller updates.
Patch 2 contains the selftests.

Changes since v3:
  Unify the CPU availability checks following Ridong's suggestion.
  Restrict returned CPUs to the parent's current exclusive grant, and
  retain the active housekeeping CPU guard during hotplug. Collect the
  kernel changes in patch 1 and selftests in patch 2, adding a regression
  for CPU replacement under a populated local parent. Update Ridong's
  email address as requested.

  v3: https://lore.kernel.org/all/20261110050324.173461-1-guopeng.zhang@linux.dev/

Changes since v2:
  Keep patch 1's kernel changes unchanged. Update its selftests following
  Longman's and Sashiko's comments and cover recovery with a single
  top-level HK CPU. Add patch 2 to fix the CPU replacement rejection
  reported by Sashiko, with its own regression test. Update the hotplug
  fix, now patch 3, to avoid invalidating unrelated partitions, including
  partitions whose boot housekeeping CPUs are all offline. Drop v2's
  isolated CPU cleanup patch in favor of Ridong's fix:
  https://lore.kernel.org/all/20261107120100.3587595-4-ridong.chen@linux.dev/

  v2: https://lore.kernel.org/all/20261105130344.664336-1-guopeng.zhang@linux.dev/

Changes since v1:
  Rework the fix following Ridong's suggestion and add test cases.
  Add patch 2 for CPU hotplug and patch 3 for isolated CPU cleanup
  when the parent partition becomes invalid.

  v1: https://lore.kernel.org/all/20261104071600.474587-1-guopeng.zhang@linux.dev/

Guopeng Zhang (2):
  cgroup/cpuset: Keep an active housekeeping CPU in the top sched domain
  selftests/cgroup: Add tests for top sched domain housekeeping checks

 kernel/cgroup/cpuset.c                        | 85 +++++++++++++++----
 .../selftests/cgroup/test_cpuset_prs.sh       | 71 ++++++++++++++++
 2 files changed, 141 insertions(+), 15 deletions(-)


base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.43.0

