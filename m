Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503390;
	b=B3tV/as9HeICivBDhMogDkJs7Rb35DVUx1mJ/04vU167Mjn+IEGDGriE3YzTS6h7H7ti
	 O4HsLAq9ZjgxB3SjN47/sFr3lXr1Drvj5VJX/yX4zp1RNA/wSXWBF3k16lu0IPyvtaiqM
	 elKC5CAWfPPkD5oPs8cG/SgbN3nZSG7W2fuG9y6lFhSZShHAV8579Ncurc4swziYw7oGg
	 KSaC5oR07oTGzUR4K60173F7Dr2j5wdG0jyC618V17pSPQGG5NT2HoOB/L8bJivQuXQ5R
	 IDPTC4OBHLk2Vv/YktaQeReKq0SBEKL8uJUYFLhe9j4amgNDtkc7s8ntHlzWg5koXUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503390;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=mf8k7XTI/zTxzeprUjIQpoEOfwu4NGyWtykxH2O6lr0=;
	b=34G2I46XWw4HU8q1g30VeI1PGdlWsDhSCIQ4qJNLIUC48lMy8fOkqUmcLuu2wxEf3iUk
	 EoO0zZdSNxnmExv0teS47/rp1JCZkKLbX0h1f/Nd62w4LojjSfP4V9BNwYWF/yj6jYOA7
	 CYFrKi5Wnqf/gbjSCFgbXZj/FaTUJF+6yd4HZkg+qnagNe/GUem3tC10+k38oFZyit3qH
	 uq+Csr253efttgkYR/X7Cg2lHhI7YUTbOyAcMr5sqb4NKG6gXYRFxB1ZKUMuP/zht4JGp
	 GUbi2XMx2lIChnGtPdrXkwNjC14N0PcbOXeJpeFqjn46z8jVH7WSJmBKCVKF86AwLwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=smbu0gWk;
	arc=none smtp.remote-ip=91.218.175.151
Received: from mta0.migadu.com (out-151.mta0.migadu.com [91.218.175.151])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7F060A2625
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 13:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D7F060A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=smbu0gWk
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mqlNuzWiK+UMeR8XNNFBfexTXPgP+qQFSEcNjwZbRo8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792503387; v=1; x=1793108186;
 b=smbu0gWkp3PPRx9wUWACH/JxGuNCXdJ421b0VaqdKf3InUBO9oyz/TQ59rGDVv/tcxmG/yEy
 IP6+Cs8O2Edaqu8DFRjagygrfyHmeeNSYI5t3SSWqEtFb/sa27CWMlSIYJwag1JpBCbOzKiNQLO
 7gEfp7kmFeyYduSsX8iaKa/s=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3c43797985b64205;
	Tue, 20 Oct 2026 13:36:26 +0000
X-Mizu-Trace-ID: 3c43797985b64205
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
Subject: [PATCH] cgroup/cpuset: Fix task checking when enabling a partition
Date: Tue, 20 Oct 2026 21:36:15 +0800
Message-ID: <20261020133615.124373-1-guopeng.zhang@linux.dev>
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

Creating a child partition can fail when tasks are present in its
descendants, even though the parent has no tasks of its own.

On a cgroup v2 system with CPUs 0-7 online:

    cd /sys/fs/cgroup
    echo +cpuset > cgroup.subtree_control
    mkdir A
    echo 1-2 > A/cpuset.cpus
    echo root > A/cpuset.cpus.partition
    echo +cpuset > A/cgroup.subtree_control
    mkdir A/B
    echo 1-2 > A/B/cpuset.cpus
    echo +cpuset > A/B/cgroup.subtree_control
    mkdir A/B/C
    echo 1-2 > A/B/C/cpuset.cpus
    echo $$ > A/B/C/cgroup.procs
    echo root > A/B/cpuset.cpus.partition
    cat A/B/cpuset.cpus.partition
    root invalid (Parent unable to distribute cpu downstream)
    cat A/cpuset.cpus.effective
    1-2

B should be a valid root, leaving A with an empty effective CPU list.
The task in C belongs to B's partition and does not need CPUs in A.

partition_is_populated() is called with B as excluded_child, but
continue only skips B in the pre-order walk. The walk still visits C
and finds the task there, so A is considered populated.

Fix this by skipping the whole excluded subtree with
css_rightmost_descendant(), as is already done for valid child
partitions. Also add a test case to test_cpuset_prs.sh with a task in
a grandchild cpuset.

Fixes: b1bcaed1e39a ("cpuset: Treat cpusets in attaching as populated")
Signed-off-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
---
 kernel/cgroup/cpuset.c                            | 4 ++--
 tools/testing/selftests/cgroup/test_cpuset_prs.sh | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 585a982249ad..71644482faa7 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -478,10 +478,10 @@ static inline bool partition_is_populated(struct cpuset *cs,
 
 	rcu_read_lock();
 	cpuset_for_each_descendant_pre(cp, pos_css, cs) {
-		if (cp == cs || cp == excluded_child)
+		if (cp == cs)
 			continue;
 
-		if (is_partition_valid(cp)) {
+		if (cp == excluded_child || is_partition_valid(cp)) {
 			pos_css = css_rightmost_descendant(pos_css);
 			continue;
 		}
diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
index d04aad697b96..9978c560b398 100755
--- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
+++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
@@ -452,6 +452,9 @@ TEST_MATRIX=(
 	# Enabling partition with child cpusets is allowed
 	"   C0-1    C1      .    C2-3    P1      .      .      .     0 A1:0-1|A2:1 A1:P1"
 
+	# Tasks below a new partition belong to it, not to its parent.
+	" C1-2:P1 C1-2 C1-2:T    .      .      P1     .      .     0 A1:|A2:1-2|A3:1-2 A1:P1|A2:P1"
+
 	# A partition root with non-partition root parent is invalid| but it
 	# can be made valid if its parent becomes a partition root too.
 	"   C0-1    C1      .    C2-3     .      P2     .      .     0 A1:0-1|A2:1 A1:P0|A2:P-2"
-- 
2.43.0

