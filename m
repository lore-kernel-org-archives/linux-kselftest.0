Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792964724;
	b=pNe2+ou9l/9uHHaM6jUSbhKUFyk0vB8GTI7NeL7osbgpkS1o4tGen3mrslPwACtUG/f+
	 YDaaqJ5Zk9FKmnWfENl43mwRa1MkazgtScbrXwkE//U554vlLNJHhCnyasshk2TqvRoGW
	 rORjcnxyjBE5esX8Q8Gik0zfav/FJwBsVZ/VSIppzcsJDzTS0qbkX3J9MhKdVUs/5EUPB
	 ez141UM+Of5jusxwPsxvMUughDprBQKZGZRRFfd/kff3jtn43SOOl5uUyeEuQgVFNfDyV
	 OnVH6MQa8PLvcPxl+POvelaqW6FhOC18I5hTVGPCh+sh2u4I7hrGWSoSvhQ1Jb0Hv+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792964724;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=gNPFPtJBuvgI8G2xZVgk0aKgvTYbFV3CyACNTkV0OMs=;
	b=sWABdYn3JgZahUMm1PFeNSm26cuSKirfo23pd86kaMrqQsX9IIKL8NUTnM83ub4t9Xrn
	 XLcQSqDL5AuVe7G6FN8CC8uaVKbQcEvmXoCO55qjc5eU/gO0ItgweejWYLnYMwR8gT0sI
	 QsuPOqlek7TiRRDaejbieZiSBs8JdzeE3f1rChrEWOjgfKEjXx5eoZYqQ1LYe4jVPOPRd
	 BLncww2lPjXnQdAjFA0dxcCKzplezsn7tqn6RTv4jAy8ccMfbPcYl/dkgN6UTmYWWN9rp
	 R5HY8CWvjKcRKoE7EXdI/PwTKyKXKBe9wkFv71Y8xXYhRwTVCL0JmDI2q7drQPyzZlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W9WZg4sd;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAD1606A332
	for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 21:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DAD1606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W9WZg4sd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792964722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gNPFPtJBuvgI8G2xZVgk0aKgvTYbFV3CyACNTkV0OMs=;
	b=W9WZg4sdseyuz4cqM03/8cpdIkg+Sw9TfGVrHw8uhdjlkm0xE3NszT/W4FPRnC3/5BRb9Q
	EwogAqRPeLDtk8zzLN8j4mlM0wHe3sIDwXRzi9X/dDK/wtotdC4Ru/gBhCexy85o4arnLQ
	enSHkZvzfJ6X5nCRdzvoWrfscvcp/gE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-693-8OsyI-fZMJK6pR9b_v9R5w-1; Sun,
 25 Oct 2026 17:45:16 -0400
X-MC-Unique: 8OsyI-fZMJK6pR9b_v9R5w-1
X-Mimecast-MFC-AGG-ID: 8OsyI-fZMJK6pR9b_v9R5w_1792964715
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D84511800678;
	Sun, 25 Oct 2026 21:45:14 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 19BDF1956087;
	Sun, 25 Oct 2026 21:45:12 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Ridong Chen <ridong.chen@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Guopeng Zhang <guopeng.zhang@linux.dev>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH-next v3 02/11] cgroup/cpuset: Properly compute effective xcpus in update_parent_effective_cpumask()
Date: Sun, 25 Oct 2026 17:44:40 -0400
Message-ID: <20261025214449.310715-3-longman@redhat.com>
In-Reply-To: <20261025214449.310715-1-longman@redhat.com>
References: <20261025214449.310715-1-longman@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Since the introduction of cpuset.cpus.exclusive in commit
e2ffe502ba45 ("cgroup/cpuset: Add cpuset.cpus.exclusive for v2"), a
compute_effective_exclusive_cpumask() helper which is later renamed to
compute_excpus() is added to compute the effective xcpus of a partition
root. However update_parent_effective_cpumask() is not updated in all
proper places to use the new helper to check if a given cpuset should
remain a valid partition root. This can cause a cpuset to incorrectly
remain a valid partition root even if no effective xcpus is left.

Fix that problem by using compute_excpus() to compute the effective xcpus
into delmask in all cases except partcmd_disable, partcmd_invalidate
or partcmd_update with newmask set and use it for tasks_nocpu_error()
check as well as checking its emptiness. This enables us to catch invalid
partition root more accurately in update_parent_effective_cpumask().

In the case of partcmd_update with newmask set, the passed in new
effective xcpus value will directly be used in the tasks_nocpu_error()
check without relying on old data in the cpuset.

For the partcmd_update with NULL newmask case, the cpu exclusivity test
there is also relaxed to be performed only if exclusive_cpus is empty.

Some test case are added to test_cpuset_prs.sh for invalidating a
partition root due to its effective xcpus becoming empty as well as
making sure that an invalid partition can only be revived when exclusive
CPUs are available agin.

Fixes: e2ffe502ba45 ("cgroup/cpuset: Add cpuset.cpus.exclusive for v2")
Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/cgroup/cpuset.c                        | 87 ++++++++++---------
 .../selftests/cgroup/test_cpuset_prs.sh       | 11 +++
 2 files changed, 56 insertions(+), 42 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index bbd44782d4bf..b850aba4d907 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1795,7 +1795,7 @@ static void remote_cpus_update(struct cpuset *cs, struct cpumask *xcpus,
  * update_parent_effective_cpumask - update effective_cpus mask of parent cpuset
  * @cs:      The cpuset that requests change in partition root state
  * @cmd:     Partition root state change command
- * @newmask: Optional new cpumask for partcmd_update
+ * @newmask: Optional new effective xcpus for partcmd_update
  * @tmp:     Temporary addmask and delmask
  * Return:   0 or a partition root state error code
  *
@@ -1810,11 +1810,11 @@ static void remote_cpus_update(struct cpuset *cs, struct cpumask *xcpus,
  * given back to parent's effective_cpus. 0 will always be returned.
  *
  * For partcmd_update, if the optional newmask is specified, the cpu list is
- * to be changed from effective_xcpus to newmask. Otherwise, effective_xcpus is
- * assumed to remain the same. The cpuset should either be a valid or invalid
- * partition root. The partition root state may change from valid to invalid
- * or vice versa. An error code will be returned if transitioning from
- * invalid to valid violates the exclusivity rule.
+ * to be changed from effective_xcpus to newmask. Otherwise, effective_xcpus
+ * will be computed and a valid partition will be invalidated if it is the new
+ * cpumask is empty. The cpuset should either be a valid or invalid partition
+ * root. The partition root state may change from valid to invalid or vice
+ * versa.
  *
  * For partcmd_invalidate, the current partition will be made invalid.
  *
@@ -1837,7 +1837,6 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
 	int deleting;	/* Deleting cpus from parent's effective_cpus	*/
 	int old_prs, new_prs;
 	int part_error = PERR_NONE;	/* Partition error? */
-	struct cpumask *xcpus = user_xcpus(cs);
 	int parent_prs = parent->partition_root_state;
 	bool nocpu;
 
@@ -1880,30 +1879,30 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
 	if (!newmask && xcpus_empty(cs))
 		return PERR_CPUSEMPTY;
 
-	nocpu = tasks_nocpu_error(parent, cs, xcpus);
+	/*
+	 * Except for partcmd_disable and non-NULL newmask, use delmask
+	 * to compute the current effective xcpus value and use it for
+	 * tasks_nocpu_error check.
+	 */
+	if ((cmd != partcmd_disable) && !newmask) {
+		compute_excpus(cs, tmp->delmask);
+		nocpu = tasks_nocpu_error(parent, cs, tmp->delmask);
+	}
 
 	if ((cmd == partcmd_enable) || (cmd == partcmd_enablei)) {
-		/*
-		 * Need to call compute_excpus() in case
-		 * exclusive_cpus not set. Sibling conflict should only happen
-		 * if exclusive_cpus isn't set.
-		 */
-		xcpus = tmp->delmask;
-		if (compute_excpus(cs, xcpus))
-			WARN_ON_ONCE(!cpumask_empty(cs->exclusive_cpus));
 		new_prs = (cmd == partcmd_enable) ? PRS_ROOT : PRS_ISOLATED;
 
 		/*
 		 * Enabling partition root is not allowed if its
 		 * effective_xcpus is empty.
 		 */
-		if (cpumask_empty(xcpus))
+		if (cpumask_empty(tmp->delmask))
 			return PERR_INVCPUS;
 
-		if (prstate_housekeeping_conflict(new_prs, parent_prs, xcpus, NULL))
+		if (prstate_housekeeping_conflict(new_prs, parent_prs, tmp->delmask, NULL))
 			return PERR_HKEEPING;
 
-		if (tasks_nocpu_error(parent, cs, xcpus))
+		if (nocpu)
 			return PERR_NOCPUS;
 
 		/*
@@ -1915,16 +1914,14 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
 		 *
 		 * Warn if it is not the case.
 		 */
-		cpumask_and(tmp->new_cpus, xcpus, cpu_active_mask);
+		cpumask_and(tmp->new_cpus, tmp->delmask, cpu_active_mask);
 		WARN_ON_ONCE(!cpumask_subset(tmp->new_cpus, parent->effective_cpus));
-
 		deleting = true;
 	} else if (cmd == partcmd_disable) {
 		/*
 		 * May need to add cpus back to parent's effective_cpus
 		 * (and maybe removed from subpartitions_cpus/isolated_cpus)
-		 * for valid partition root. xcpus may contain CPUs that
-		 * shouldn't be removed from the two global cpumasks.
+		 * for valid partition root.
 		 */
 		if (is_partition_valid(cs)) {
 			cpumask_copy(tmp->addmask, cs->effective_xcpus);
@@ -1944,8 +1941,8 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
 			goto write_error;
 		}
 
-		/* Check newmask again, whether cpus are available for parent/cs */
-		nocpu |= tasks_nocpu_error(parent, cs, newmask);
+		/* Check newmask whether cpus are available for parent/cs */
+		nocpu = tasks_nocpu_error(parent, cs, newmask);
 
 		/*
 		 * partcmd_update with newmask:
@@ -2000,7 +1997,7 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
 		/*
 		 * partcmd_update w/o newmask
 		 *
-		 * delmask = effective_xcpus & parent->effective_cpus
+		 * delmask = newly computed effective xcpus value
 		 *
 		 * This can be called from:
 		 * 1) update_cpumasks_hier()
@@ -2012,7 +2009,7 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
 		 * A partition error happens when parent has tasks and all
 		 * its effective CPUs will have to be distributed out.
 		 */
-		if (nocpu) {
+		if (nocpu || cpumask_empty(tmp->delmask)) {
 			part_error = PERR_NOCPUS;
 			if (is_partition_valid(cs))
 				adding = cpumask_and(tmp->addmask,
@@ -2025,38 +2022,44 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
 				cpumask_copy(tmp->addmask, cs->effective_xcpus);
 				adding = true;
 			}
-		} else if (is_partition_invalid(cs) && !cpumask_empty(xcpus) &&
-			   cpumask_subset(xcpus, parent->effective_xcpus)) {
+		} else if (is_partition_invalid(cs)) {
 			struct cgroup_subsys_state *css;
 			struct cpuset *child;
 			bool exclusive = true;
 
 			/*
 			 * Convert invalid partition to valid has to pass the
-			 * cpu exclusivity test as well as the housekeeping
-			 * check.
+			 * cpu exclusivity test when cpuset.cpus.exclusive is
+			 * empty as well as the housekeeping check.
 			 */
 			if (prstate_housekeeping_conflict(cs->partition_root_state,
-							  parent_prs, xcpus, NULL)) {
+							  parent_prs, tmp->delmask, NULL)) {
 				part_error = PERR_HKEEPING;
 				goto write_error;
 			}
-			rcu_read_lock();
-			cpuset_for_each_child(child, css, parent) {
-				if (child == cs)
-					continue;
-				if (!cpusets_are_exclusive(cs, child)) {
-					exclusive = false;
-					break;
+			if (cpumask_empty(cs->exclusive_cpus)) {
+				rcu_read_lock();
+				cpuset_for_each_child(child, css, parent) {
+					if (child == cs)
+						continue;
+					if (!cpusets_are_exclusive(cs, child)) {
+						exclusive = false;
+						break;
+					}
 				}
+				rcu_read_unlock();
 			}
-			rcu_read_unlock();
 			if (exclusive)
-				deleting = cpumask_and(tmp->delmask,
-						xcpus, parent->effective_cpus);
+				deleting = !cpumask_empty(tmp->delmask);
 			else
 				part_error = PERR_NOTEXCL;
 		}
+		/*
+		 * When both cs and parent remain valid, parent's
+		 * compute_partition_effective_cpumask() call would have removed
+		 * cs's effective_xcpus from the parent's effective_cpus. So
+		 * there is no need to adjust parent's effective_cpus here.
+		 */
 	}
 
 write_error:
diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
index d04aad697b96..8bdda955b4a7 100755
--- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
+++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
@@ -359,6 +359,8 @@ TEST_MATRIX=(
 								       A1:P0|A2:P1|A3:P2|B1:P1 2-4|3"
 	"  C1-6:P1 C3-6:P1 C5-6:P1 .      .      P2      .      .    0 A1:1-2|A2:3-6|A3:5-6 \
 								       A1:P1|A2:P2|A3:P-1 3-6"
+	"  C1-6:P2 C3-6:P2 C3-4:P2 .      .     C5-6     .      .    0 A1:1-4|A2:5-6|A3:5-6 \
+								       A1:P2|A2:P2|A3:P-2 1-6"
 	" C1-4:X2-4 C2-4:X3-4:P1 C3-4:X4:P2 \
 				   .      .      X5      .      .    0 A1:1-4|A2:2-4|A3:3-4 \
 								       A1:P0|A2:P-1|A3:P-2 ."
@@ -427,6 +429,10 @@ TEST_MATRIX=(
 	# cpuset.cpus is allowed, but those extra CPUs are ignored.
 	"  C2-3:P1   C3:P1  .      .      .     C2-4    .      .     0 A1:|A2:2-3 A1:P1|A2:P1"
 
+	# A child cannot recover until its exclusive CPUs are available again.
+	" CX1-4:P1 CX3-4:P1 .     .     X1-2     .      .      .     0 A1:1-2|A2:1-2|XA2: A1:P1|A2:P-1"
+	" CX1-4:P1 CX3-4:P1 .     .  X1-2:X1-4   .      .      .     0 A1:1-2|A2:3-4|XA2:3-4 A1:P1|A2:P1"
+
 	# Taking away all CPUs from parent or itself if there are tasks
 	# will make the partition invalid.
 	"  C2-3:P1   C3:P1  .      .      T     C2-3    .      .     0 A1:2-3|A2:2-3 A1:P1|A2:P-1"
@@ -503,6 +509,11 @@ TEST_MATRIX=(
 	"  C1-3:P2 C2:P2    .      .       .     P1     .      .     0 A1:1-3|A2:2 A1:P2|A2:P-1 1-3"
 	"  C1-3:P2 C2:P1    .      .       .    C2-3    .      .     0 A1:1-3|A2:2-3 A1:P2|A2:P-1 1-3"
 
+	# A middle isolated parent shrunk below coverage: the released CPUs of
+	# an invalidated child stay isolated as a higher ancestor still covers them.
+	" CX0-4:P2 CX2-4:P2 CX3-4:P2 .     .     X2     .      .     0 A1:0-1,3-4|A2:2|A3:2 \
+								       A1:P2|A2:P2|A3:P-2 0-4"
+
 	#
 	#  old-A1 old-A2 old-A3 old-B1 new-A1 new-A2 new-A3 new-B1 fail ECPUs Pstate ISOLCPUS
 	#  ------ ------ ------ ------ ------ ------ ------ ------ ---- ----- ------ --------
-- 
2.56.0

