Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503207;
	b=zPJWkEccFyc9vWLYJvhbatctkPBJFYm8JBQ26D9EGhad9dy1VwLRP/Os18blXPkB14tR
	 i6pDY3+IujNwP8weTkyda0MIIqO8I03PwA61JnRb/g+w/GgMBjD/ONJ9XdiWd4FGVhc4O
	 8kGrSObHhSunUg6K3XuKKptD8sdsvO9toRY0sFunVT8vngQ4eIdniEBZjLZodoFVkcGVI
	 6o6AmMOy1DxffiAPm1WyYkv+kgv02ufoUU5QZrPcsbztT2eUp/YquojNYefl2EPZu35L1
	 puN/ODlugxS/vEh6KLO+SddSjL/PPhzHoK5iyHBt45wU6bk9CsgxBjVviVo1dSpoE9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503207;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=CmgxYFLM8qJUWvWVc5vYTJVXqVY4Hx6nTGQxyWlnrto=;
	b=at/RP+WewPsW3mjlevvF4ENfiokSVwrTZCMz/tJK9xfzEQCzcstOhm2rBIwJ4i3RXW6I
	 bTABVXppFAPm73po/dp6XKf1GywrNpd05Q2006zYbMencB3RN1GjlrMOy1y2ordw3n8A2
	 pNoyp4/RRdoI7hGcWdU+YfiqShsheQJbm3Gj4MjFv/R7qrzULrfLenmix56Q2ZGsP53BD
	 biXEFIDkMS7wUDP5cB9cE1az1Y6P8smmb3EWOa/p+76FdXQLbRI90qJrZWzMlmVEeN1Ou
	 qRIzjgDGYWxfZmyCWV53etgi4JzlJ7sBgvvlqT9LSysEq2BFgDCfgHELopXY1yxrqAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eB11u1uT;
	arc=none smtp.remote-ip=91.218.175.49
Received: from mta0.migadu.com (out-49.mta0.migadu.com [91.218.175.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3566606A31C
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 13:33:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3566606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eB11u1uT
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AcUqUaao/jqaBmXmcRy6oGKOshGqT8aN/yaRUiJYB6k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792503205; v=1; x=1793108005;
 b=eB11u1uTpT3ODAs7wT0x6IA+nZ/UsgIhKtWa9+vn1kgU5cO9/yE72O7XOz9IbVKA/O49NJoT
 kWuPVqJcFyY5+TKIn+P8wAgWqar4CzaPJGtDm226FUx+nAotocKQ9WQLwkf8TTAWpnpoJej+PyF
 LbY2snBQa1vOqIo5ZMwd0zN0=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fb1a7d32086cf4bb;
	Tue, 20 Oct 2026 13:33:24 +0000
X-Mizu-Trace-ID: fb1a7d32086cf4bb
X-Migadu-Flow: FLOW_OUT
From: Guopeng Zhang <guopeng.zhang@linux.dev>
To: longman@redhat.com,
	tj@kernel.org
Cc: ridong.chen@linux.dev,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	shuah@kernel.org,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Guopeng Zhang <zhangguopeng@kylinos.cn>
Subject: [PATCH] cgroup/cpuset: Fix partition recovery with unavailable CPUs
Date: Tue, 20 Oct 2026 21:33:15 +0800
Message-ID: <20261020133315.123890-1-guopeng.zhang@linux.dev>
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

An invalid local partition can become valid again even when its
exclusive CPUs are no longer available from its parent.

This can be reproduced on a cgroup v2 system with CPUs 0-7 online:

    cd /sys/fs/cgroup
    echo +cpuset > cgroup.subtree_control
    mkdir A
    echo 1-4 > A/cpuset.cpus
    echo 1-4 > A/cpuset.cpus.exclusive
    echo root > A/cpuset.cpus.partition
    echo +cpuset > A/cgroup.subtree_control
    mkdir A/B
    echo 3-4 > A/B/cpuset.cpus
    echo 3-4 > A/B/cpuset.cpus.exclusive
    echo root > A/B/cpuset.cpus.partition
    echo 1-2 > A/cpuset.cpus.exclusive
    cat A/B/cpuset.cpus.partition
    root
    cat A/B/cpuset.cpus.exclusive.effective
    cat A/cpuset.cpus.effective
    1-2
    cat A/B/cpuset.cpus.effective
    1-2

B is changed back to a valid root even though its exclusive CPUs are
no longer available and cpuset.cpus.exclusive.effective is empty. B
should remain invalid until A can provide its exclusive CPUs again.

Shrinking A's exclusive CPUs invalidates B in
compute_partition_effective_cpumask(). The subsequent walk in
update_cpumasks_hier() tries to recover B, but
update_parent_effective_cpumask() skips the recovery checks when xcpus
is not a subset of parent->effective_xcpus. Since part_error is still
zero, B is changed back to a valid partition.

Set PERR_INVCPUS when the subset check fails so that the partition stays
invalid. New test cases are added to test_cpuset_prs.sh for removing and
restoring the parent's exclusive CPUs.

Fixes: 0c7f293efc87 ("cgroup/cpuset: Add cpuset.cpus.exclusive.effective for v2")
Signed-off-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
---
 kernel/cgroup/cpuset.c                            | 8 ++++++--
 tools/testing/selftests/cgroup/test_cpuset_prs.sh | 4 ++++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 585a982249ad..be80763953ed 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1986,12 +1986,16 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
 				cpumask_copy(tmp->addmask, cs->effective_xcpus);
 				adding = true;
 			}
-		} else if (is_partition_invalid(cs) && !cpumask_empty(xcpus) &&
-			   cpumask_subset(xcpus, parent->effective_xcpus)) {
+		} else if (is_partition_invalid(cs) && !cpumask_empty(xcpus)) {
 			struct cgroup_subsys_state *css;
 			struct cpuset *child;
 			bool exclusive = true;
 
+			if (!cpumask_subset(xcpus, parent->effective_xcpus)) {
+				part_error = PERR_INVCPUS;
+				goto write_error;
+			}
+
 			/*
 			 * Convert invalid partition to valid has to pass the
 			 * cpu exclusivity test as well as the housekeeping
diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
index d04aad697b96..f1d517647ade 100755
--- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
+++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
@@ -427,6 +427,10 @@ TEST_MATRIX=(
 	# cpuset.cpus is allowed, but those extra CPUs are ignored.
 	"  C2-3:P1   C3:P1  .      .      .     C2-4    .      .     0 A1:|A2:2-3 A1:P1|A2:P1"
 
+	# A child cannot recover until its exclusive CPUs are available again.
+	" CX1-4:P1 CX3-4:P1 .     .     X1-2    .      .      .     0 A1:1-2|A2:1-2|XA2: A1:P1|A2:P-1"
+	" CX1-4:P1 CX3-4:P1 .     .  X1-2:X1-4 .      .      .     0 A1:1-2|A2:3-4|XA2:3-4 A1:P1|A2:P1"
+
 	# Taking away all CPUs from parent or itself if there are tasks
 	# will make the partition invalid.
 	"  C2-3:P1   C3:P1  .      .      T     C2-3    .      .     0 A1:2-3|A2:2-3 A1:P1|A2:P-1"
-- 
2.43.0

