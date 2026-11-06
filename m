Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962573;
	b=UqtIVodUgyegL2n1qliaQHHZZ5ZR+tetEnmo85hXYzWlqV11zKUznWhRaJ6IBec5yIGS
	 lo2p47dmEd/88qVaRySAuqPNDOiqyGSk8XJXF6oPqFN3o1g46nYmwGey4sWffVsCkme9B
	 RGTYnnIe8Oa9t+tn8sKnrWrjMWs6Yx5uH92H0JdSVelu/AJUEbjbYfeYkASKl8ZO0IYIK
	 09keuewJAUK1WFPoFk8M1AmR5alvVn5sx49qmDvyqMl7h94zUiPT+0GmwkZ+761bD0B5L
	 yMX+9Pq2o3JF82b2vsz1Sxn/1lWpG/0hgXPZrSokbKuf77G9f7TrKUP5pax8cQF6UWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962573;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=B80Ru/+QQZrR8+3BTuaBiUO91fsH99eqxOSlWVO284w=;
	b=CuOoflDjsCG4ZLJqDdnI2RSYhMwJGQuKrx7uXudu1Zv1jOMD3yJaelK0qGE0GBBRndD2
	 EWHbDDW6NKpSczFvPvr5A0lW71MZ4wGjlPawG+AUQOtbkhTnoValGb1bq3vOjNitTHOlY
	 Hm8usBGWjBTEVPaEo+fllltwkhNiqj9KrLooOPtT+D1IV2R0PtBez4b1feMLBboOOjEaC
	 7pewxMWopp0waqxrXMHm7ogBT7BzQ96+jtnXu41Pku+d2xLjG6pE5geER0exBleSCGPr7
	 93cnlf4/Xyaqwz8RKcbV5EkrMK/QBrqOCp+ZPTZ4grGnR44HCiQQUsCM322S4KJruAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VOE9R7wp;
	arc=none smtp.remote-ip=91.218.175.28
Received: from mta0.migadu.com (out-28.mta0.migadu.com [91.218.175.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B115B606A33A
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 10:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B115B606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VOE9R7wp
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PUjvcPrNp9l3japZeaonwrQrwoa398mhSxLN/CbO7N0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793962570; v=1; x=1794567370;
 b=VOE9R7wpapU4bEnEd8BgSNgkGTfWaJnXebL/NgEyPvyc06x4zKdydE6O7zXyibuWg5SNs4nS
 1+VhJNI9zUUovEtF5BnBwMZ+JhJ8eR6tc0cTu4C8yvssK/xJ3tv62bXdmx3EG4yIIOeYBBk5A6l
 2aYDO6MoVoF2uXsRoSGFa+nM=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5cfb5cbc1ecd42f4;
	Fri, 06 Nov 2026 10:56:08 +0000
X-Mizu-Trace-ID: 5cfb5cbc1ecd42f4
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: Waiman Long <longman@redhat.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Ridong Chen <ridong.chen@linux.dev>,
	Chen Ridong <chenridong@huawei.com>,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	Guopeng Zhang <zhangguopeng@kylinos.cn>,
	Ridong Chen <chenridong@xiaomi.com>
Subject: [PATCH v2 1/4] cgroup/cpuset: Reset partition data when an invalid partition stays invalid
Date: Fri,  6 Nov 2026 18:55:35 +0800
Message-Id: <20261106105538.2915492-2-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106105538.2915492-1-ridong.chen@linux.dev>
References: <20261106105538.2915492-1-ridong.chen@linux.dev>
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

When cpuset.cpus or cpuset.cpus.exclusive of a partition root is
changed, update_cpumask() and update_exclusive_cpumask() copy the new
effective_xcpus computed for the trial cpuset into the cpuset, and call
reset_partition_data() only if the partition was valid before and is
invalid now:

	if ((old_prs > 0) && !is_partition_valid(cs))
		reset_partition_data(cs);

An invalid partition root (old_prs < 0) that stays invalid is not
covered. Its effective_xcpus is then left with the trial value, which
is computed from user_xcpus() and so falls back to cpuset.cpus when
cpuset.cpus.exclusive is cleared. As an invalid partition root does not
own any exclusive CPUs, and rm_siblings_excl_cpus() treats a non-empty
effective_xcpus of a sibling without cpuset.cpus.exclusive as owned,
those CPUs can then no longer be claimed by a sibling:

  # A1: cpuset.cpus=2-3, cpuset.cpus.exclusive=2-3, root, with tasks
  # offline CPUs 2-3 -> A1 becomes invalid
  echo > A1/cpuset.cpus.exclusive
  cat A1/cpuset.cpus.exclusive.effective    # 2-3, expected empty
  echo 3 > B1/cpuset.cpus.exclusive         # -EINVAL

Reset the partition data whenever the cpuset is a partition root, valid
or not, and ends up invalid. As effective_xcpus may be cleared by that,
also force update_cpumasks_hier() to update the subtree, so that the
effective_xcpus of the descendants doesn't keep the released CPUs. Add
test cases for it.

Fixes: de9f15e21c55 ("cpuset: use parse_cpulist for setting cpus.exclusive")
Fixes: c5866c9a007d ("cpuset: refactor CPU mask buffer parsing logic")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20261101114206.2434398-1-ridong.chen%40linux.dev?part=15
Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
 kernel/cgroup/cpuset.c                            | 10 ++++++++--
 tools/testing/selftests/cgroup/test_cpuset_prs.sh |  6 ++++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 3052413e41e7..cf38e8708ddd 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -2607,8 +2607,11 @@ static int update_cpumask(struct cpuset *cs, struct cpuset *trialcs,
 	spin_lock_irq(&callback_lock);
 	cpumask_copy(cs->cpus_allowed, trialcs->cpus_allowed);
 	cpumask_copy(cs->effective_xcpus, trialcs->effective_xcpus);
-	if ((old_prs > 0) && !is_partition_valid(cs))
+	if (old_prs && !is_partition_valid(cs)) {
 		reset_partition_data(cs);
+		/* effective_xcpus may be cleared, update the subtree too */
+		force = true;
+	}
 	spin_unlock_irq(&callback_lock);
 
 	/* effective_cpus/effective_xcpus will be updated here */
@@ -2672,8 +2675,11 @@ static int update_exclusive_cpumask(struct cpuset *cs, struct cpuset *trialcs,
 	spin_lock_irq(&callback_lock);
 	cpumask_copy(cs->exclusive_cpus, trialcs->exclusive_cpus);
 	cpumask_copy(cs->effective_xcpus, trialcs->effective_xcpus);
-	if ((old_prs > 0) && !is_partition_valid(cs))
+	if (old_prs && !is_partition_valid(cs)) {
 		reset_partition_data(cs);
+		/* effective_xcpus may be cleared, update the subtree too */
+		force = true;
+	}
 	spin_unlock_irq(&callback_lock);
 
 	/*
diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
index bdca6c471f87..32e1e44fa0b1 100755
--- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
+++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
@@ -434,6 +434,12 @@ TEST_MATRIX=(
 	# cpuset.cpus is allowed, but those extra CPUs are ignored.
 	"  C2-3:P1   C3:P1  .      .      .     C2-4    .      .     0 A1:|A2:2-3 A1:P1|A2:P1"
 
+	# Clearing cpuset.cpus.exclusive of an invalid partition releases its
+	# exclusive CPUs, including those of its descendants, so a sibling
+	# can claim them.
+	" CX2-3:P1    .     .     C3  T:O2=0:O3=0:X  .     .      X3   0 XA1:|XB1:3 A1:P-1"
+	" CX2-3:P1   X3     .     C3  T:O2=0:O3=0:X  .     .      X3   0 XA1:|XA2:|XB1:3 A1:P-1"
+
 	# A child cannot recover until its exclusive CPUs are available again.
 	" CX1-4:P1 CX3-4:P1 .     .     X1-2     .      .      .     0 A1:1-2|A2:1-2|XA2: A1:P1|A2:P-1"
 	" CX1-4:P1 CX3-4:P1 .     .  X1-2:X1-4   .      .      .     0 A1:1-2|A2:3-4|XA2:3-4 A1:P1|A2:P1"
-- 
2.34.1

