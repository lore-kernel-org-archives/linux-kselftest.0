Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251423;
	b=LlKABy6CjydtVG7zbGY6zeiqfy0Glc3F3UXmpnEuFr095PtxRUKHg4Jzg5pAryN8xDDu
	 WeR5mhcNrp6QI2KPRCxMtNGis84Mb9OXpl7PpDO8Pcn+I87ncsmG1VNrv8G64oeuke0/q
	 PazbEob0FjcBJTcGcn20Pf7BUivDcEkyc3yvz3YpzfadL7cNN/lu5k4K8ppo6t8ymzhCE
	 Vb++BDhzUYTsp6/u+UTfBHggdjSwgafGutooeFvh2jpQja9faNpEQugR3xkpqq5T9B58/
	 WwTeeKx0M4MynoshEY2QZZs5Ieup1FDTcWXUjLHApZAfr29k6S6kRR1WK1/duy9vA5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251423;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=SWY0LOhl7u7/ZhncZxGD74gh22kvpu7hykNvziwYG1c=;
	b=U84HiBkvUC/znuZ22NEbUYfw5GcKOgC4Gq3/oDVrkJy39uWcmIW0GGnGgeruVVohk2q2
	 H/cJ5ZvSQ2grIfOwLsURzEqAqt/FMXrL3tWm9Feke6wSYA0AHsUHl3Ci11nEbs+S48YoA
	 19vRwx1JB6+P6mCs9pAujDeipb3P7mRqVIn3IMqHss406FgPsXLywKR2hzc/Zz9WhrCgu
	 Aja5UFyZq5dcqq51YC89G2nIJrj2PumgNfnjDo4IDXm7Aa8pj91rGBDpyTB1vIWoslkVC
	 O4OYuXlpfmLkUEpbk1quWxn1zHJoqQcUdFsAHtOH0x5ypi3dHZwWEx3e+9H5GTs89Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UAbu1rvT;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D631960A261C
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 19:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D631960A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UAbu1rvT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794251421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SWY0LOhl7u7/ZhncZxGD74gh22kvpu7hykNvziwYG1c=;
	b=UAbu1rvTdATtmjgxHZ6fdeXJF9UQtlTnX5wsjEyqC9R+Fo5elAoSfHMxMbdE/+oTbvJevV
	ivr+DP8xFNV2ACy6hybisw5G9A4Q+5BtTfRQzaKkbOHFceUpWyR7CVdY8Hep1fil3c4JMA
	tnG2G857yRy64o9QprtthuHvDNTSTlc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-421-VyPAhC2FNv-TYcND9HN3fQ-1; Mon,
 09 Nov 2026 14:10:18 -0500
X-MC-Unique: VyPAhC2FNv-TYcND9HN3fQ-1
X-Mimecast-MFC-AGG-ID: VyPAhC2FNv-TYcND9HN3fQ_1794251416
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 627001955F03;
	Mon,  9 Nov 2026 19:10:16 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B65B6195608C;
	Mon,  9 Nov 2026 19:10:14 +0000 (UTC)
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
	Waiman Long <longman@redhat.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH-next v2 3/5] cgroup/cpuset: Fix incorrect partition invalidation logic in cpuset_hotplug_update_tasks()
Date: Mon,  9 Nov 2026 14:09:53 -0500
Message-ID: <20261109190955.1398611-4-longman@redhat.com>
In-Reply-To: <20261109190955.1398611-1-longman@redhat.com>
References: <20261109190955.1398611-1-longman@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

When most of the active CPUs of a system are allocated to
sub-partitions below the top_cpuset partition, it is possible that a
CPU offline operation may remove the last active CPU in the top_cpuset
partition. When that really happens, cpuset_handle_hotplug() will clear
the subpartitions_cpus to make sure active CPUs are present in the top
partition and let the other sub-partitions get invalidated and then
competes for their exclusive CPUs again.

In cpuset_hotplug_update_tasks(), the current code use
"cpumask_empty(subpartitions_cpus)" to determine if that partition
should be invalidated. That is fine if there is only one sub-partition.
As reported by sashiko that when there are more than one sub-partitions
and the first sub-partition will get invalidated and then it will
try to acquire the exclusive CPUs and become valid again. When this
happens, the subpartitions_cpus will no longer be empty. The remaining
sub-partitions will assume their exclusive CPUs are safe and proceed
as normal. As a result, active CPUs owned by those sub-partitions
remain in both top_cpuset.effective_cpus and the sub-partitions'
effective_cpus while missing from subpartitions_cpus, breaking partition
CPU exclusivity and triggering WARN_ON_ONCE() in generate_sched_domains()
and remote_partition_disable().

Fix that by checking if the sub-partitions' effective_xcpus are subset
of subpartitions_cpus to determine if they should be invalidated. Also
remove the obsolete WARN_ON_ONCE() call in remote_partition_disable().

Fixes: 0c7f293efc87 ("cgroup/cpuset: Add cpuset.cpus.exclusive.effective for v2")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/bug/linux-bf69cd3c-833a-4599-a1f9-8dd9e044cd7c
Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/cgroup/cpuset.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 3955d2d574cf..e9b84671af21 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1766,15 +1766,6 @@ static int remote_partition_enable(struct cpuset *cs, int new_prs,
 static void remote_partition_disable(struct cpuset *cs, struct tmpmasks *tmp)
 {
 	WARN_ON_ONCE(!is_remote_partition(cs));
-	/*
-	 * When a CPU is offlined, top_cpuset may end up with no available CPUs,
-	 * which should clear subpartitions_cpus. We should not emit a warning for this
-	 * scenario: the hierarchy is updated from top to bottom, so subpartitions_cpus
-	 * may already be cleared when disabling the partition.
-	 */
-	WARN_ON_ONCE(!cpumask_subset(cs->effective_xcpus, subpartitions_cpus) &&
-		     !cpumask_empty(subpartitions_cpus));
-
 	spin_lock_irq(&callback_lock);
 	cs->remote_partition = false;
 	partition_xcpus_del(cs->partition_root_state, NULL, cs->effective_xcpus);
@@ -4020,9 +4011,9 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
 	 * or update_parent_effective_cpumask() is called as cs->effective_cpus
 	 * may have been updated.
 	 */
-	if (is_remote_partition(cs) && (cpumask_empty(subpartitions_cpus) ||
-				       (cpumask_empty(&new_cpus) &&
-					partition_is_populated(cs, NULL)))) {
+	if (is_remote_partition(cs) &&
+	    (!cpumask_subset(cs->effective_xcpus, subpartitions_cpus) ||
+	     (cpumask_empty(&new_cpus) && partition_is_populated(cs, NULL)))) {
 		WRITE_ONCE(cs->prs_err, PERR_HOTPLUG);
 		remote_partition_disable(cs, tmp);
 		compute_effective_cpumask(&new_cpus, cs, parent);
@@ -4035,12 +4026,12 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
 	 * 1) empty effective cpus but not valid empty partition.
 	 * 2) parent is invalid or doesn't grant any cpus to child
 	 *    partitions.
-	 * 3) subpartitions_cpus is empty.
+	 * 3) effective_xcpus isn't a subset of subpartitions_cpus.
 	 */
 	if (is_local_partition(cs) &&
 	    (!is_partition_valid(parent) ||
 	     tasks_nocpu_error(parent, cs, &new_cpus) ||
-	     cpumask_empty(subpartitions_cpus)))
+	     !cpumask_subset(cs->effective_xcpus, subpartitions_cpus)))
 		partcmd = partcmd_invalidate;
 	/*
 	 * On the other hand, an invalid partition root may be transitioned
-- 
2.56.0

