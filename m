Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794792238;
	b=hdisIC4w+9F+cGa/3De0+G619Ljpq72yz18xxgFj0ts8lCJoVKFVgAqcDDzF4ZOFr1US
	 I5EnYRj4Sag2VUiivEWmgG1tAiZgST78PX84Pc/wK985CznDv5lsfTZrnJeuBKOhbHceA
	 Ic84N8cSmTjVi2ev7CmeFRqVrFyWfVVHnccd95du4ACZ7rM9hcvXstLKPBnR8P64k+OsW
	 Bk7z6eQ2K0SPiJZc+WJdbd1JxOhZew85GNtP0JuN30MxohfI5MiSO11F8mRFmTa5V93cJ
	 ep070WnJ5BmNuyuMkVFD7UaGXLToD+ZOB4Il6JVbyZj/0SxbHWXfI51aH41y74/bTVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794792238;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=hiVCargSd0qGrTeJLSriIOpN4bF8iJ0+ZPWI+j7lt9Y=;
	b=finzxdABijzW7zFnrut3FajMff2Tv66VB4doOQ/+gXVpUBmR3RU4V0v4TNplbz+Bfz1X
	 xsT9ah3Jmn6juF2j8ehfcrmiWIbp4OcCG9by3T3u5L0oQdAJwLk94Sq9qUB7/e8V4u6Pi
	 oc9K5O4+TY+vmGUctqt6ByNv8pVVaEmmkvUdzeFDHSQL5pCXhqA+B9GgxdSB8TcqyONgH
	 lte7EXbLKy+O3Wky8G05igXP9HxXJa7N67pLNf4w9NMp5DWpw/I4uEQwkfCtIkaM16kge
	 9CUh4hqwqp548Z1iMNIGbey294wS37s913xZ0QvVX1jl0LRrbbAG0iQ9MnMPeogmy4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PlQXQef7;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116CF606A32A
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 01:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 116CF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PlQXQef7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794792237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hiVCargSd0qGrTeJLSriIOpN4bF8iJ0+ZPWI+j7lt9Y=;
	b=PlQXQef7P4DOL8L3JRXNTXDrMVOPX/em5jOaIZk+zPUJ7jq4YGZhiQsAASeQ706lOagruy
	MVb+ts+wS3LEIBY4GwCuO7MFZ2bqhJhWWZu0ZUUHZrurQw1avhue4zNTdEo2PYBUMP/IKd
	Nk8B1/ZO0QCJW9RfT+FC7zhNSIuzYvE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-175-o9FOjyzvPrGA_jHZ3CBRjA-1; Sun,
 15 Nov 2026 20:23:53 -0500
X-MC-Unique: o9FOjyzvPrGA_jHZ3CBRjA-1
X-Mimecast-MFC-AGG-ID: o9FOjyzvPrGA_jHZ3CBRjA_1794792232
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BED871956089;
	Mon, 16 Nov 2026 01:23:51 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A278F589;
	Mon, 16 Nov 2026 01:23:49 +0000 (UTC)
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
Subject: [PATCH-next v4 1/6] cgroup/cpuset: Fix incorrect partition invalidation logic in cpuset_hotplug_update_tasks()
Date: Sun, 15 Nov 2026 20:23:04 -0500
Message-ID: <20261116012330.2271010-2-longman@redhat.com>
In-Reply-To: <20261116012330.2271010-1-longman@redhat.com>
References: <20261116012330.2271010-1-longman@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

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
Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/cgroup/cpuset.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 1b88a93b3db4..631fb449cef8 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1768,15 +1768,6 @@ static int remote_partition_enable(struct cpuset *cs, int new_prs,
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
@@ -3983,9 +3974,9 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
 	if (!tmp || !cs->partition_root_state)
 		goto update_tasks;
 
-	if (is_remote_partition(cs) && (cpumask_empty(subpartitions_cpus) ||
-				       (cpumask_empty(&new_cpus) &&
-					partition_is_populated(cs, NULL)))) {
+	if (is_remote_partition(cs) &&
+	    (!cpumask_subset(cs->effective_xcpus, subpartitions_cpus) ||
+	     (cpumask_empty(&new_cpus) && partition_is_populated(cs, NULL)))) {
 		WRITE_ONCE(cs->prs_err, PERR_HOTPLUG);
 		remote_partition_disable(cs, tmp);
 		compute_effective_cpumask(&new_cpus, cs, parent);
@@ -3997,12 +3988,12 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
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

