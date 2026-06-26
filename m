Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766E63B893A
	for <linux-kselftest@vger.kernel.org>; Fri, 26 Jun 2026 18:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782499167; cv=none; b=JKLI4Ts6ixy9XYUdJfcelCCvAc2BVfdpLS0vWdm4PYLQpzd/oPwhXldSgNnYwTOUhiLXH9MVKYiO+fJxjCR+RyAtWGUmq/8iQAWgHrzN1Z1BOvnNFubqISfxvNMq63Cmz+7i22l7Rh4+F4evRPVPtlzJIdnd1JO5Hwa/2GbAwyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782499167; c=relaxed/simple;
	bh=Gs6mbfrdBmFcPfxIGQpGRYkRJypGTZA8RHJBoaD+4nk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i0Pz2ZA3SUrKG1pZiNOD6g0mT0+h2ZeOUxznMZLPc4FecnWYsI+1W5Psdq8nI0uTFGOa+3QvNpvGjPYshSBn/mwTKkw1bxH6EdCLQTXiCj9CpvURkJGojFcvaV5teO7bk+CrnUVvk+i8yEgCDeznZxj8rN9UgOGp2U278CN+Yqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CTPMqXpE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CTPMqXpE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782499165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FR85SqjTioxEOnr06yRon6rto8Olp0PTbmWX15TMEEU=;
	b=CTPMqXpE2jl8onxolGVn9rNun19XEjbUtBYo7rkuwgDdzbRBscCLkTJE+r2C07/B8maucZ
	15GaFBbZ2fSko36e1qlaFMCOV5AFSHgChzaOxbqr+h5hECekIKDB5wKIfQ4SlXNeN0g1Cs
	PmMOORr6YZN84NnfljEPzeaomWpMSu0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-447-gZz9MSDAMQiY_jRPd4egBA-1; Fri,
 26 Jun 2026 14:37:58 -0400
X-MC-Unique: gZz9MSDAMQiY_jRPd4egBA-1
X-Mimecast-MFC-AGG-ID: gZz9MSDAMQiY_jRPd4egBA_1782499076
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 79B571954AE1;
	Fri, 26 Jun 2026 18:37:56 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.2.16.156])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8C02619560A3;
	Fri, 26 Jun 2026 18:37:52 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Ridong Chen <ridong.chen@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Farhad Alemi <farhad.alemi@berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Aaron Tomlin <atomlin@atomlin.com>,
	Guopeng Zhang <guopeng.zhang@linux.dev>,
	Gregory Price <gourry@gourry.net>,
	David Hildenbrand <david@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH v8 07/11] cgroup/cpuset: Make attach_ctx.old_cs track task group leader
Date: Fri, 26 Jun 2026 14:19:19 -0400
Message-ID: <20260626181923.133658-8-longman@redhat.com>
In-Reply-To: <20260626181923.133658-1-longman@redhat.com>
References: <20260626181923.133658-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

There are two possible ways that migration of tasks from multiple source
cpusets to a target cpuset can happen. Either a multithread application
with threads in different cpusets is wholely migrated to a new cpuset
or disabling of v2 cpuset controller will move all the tasks in child
cpusets to the parent cpuset.

In the former case, it is the mm setting of the group leader that
really matters. So attach_ctx.old_cs should track the oldcs of the
thread leader. In the latter case, effective_mems of child cpusets
must always be a subset of the parent. So no real page migration
will not be necessary no matter which child cpuset is selected as
attach_ctx.old_cs.

IOW, attach_ctx.old_cs should be updated to match the latest task
group leader in cpuset_can_attach(), but fall back to that of the first
task if there is no group leader in the taskset.

Suggested-by: Ridong Chen <ridong.chen@linux.dev>
Signed-off-by: Waiman Long <longman@redhat.com>
Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
---
 kernel/cgroup/cpuset.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 05a81839966b..e830ba13be9b 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -3086,11 +3086,32 @@ static int cpuset_can_attach(struct cgroup_taskset *tset)
 	if (ret)
 		goto out_unlock;
 
+	/*
+	 * The attach_ctx.old_cs is used mainly by cpuset_migrate_mm() to get
+	 * the old_mems_allowed value. There are two ways that many-to-one
+	 * cpuset migration can happen:
+	 * 1) A multithread application with threads in different cpusets is
+	 *    wholely migrated to a new cpuset.
+	 * 2) Disabling v2 cpuset controller will move all the tasks in child
+	 *    cpusets to the parent cpuset.
+	 *
+	 * In the former case, it is the mm setting of the group leader that
+	 * really matters. So attach_ctx.old_cs should track the oldcs of the
+	 * group leader. It falls back to the oldcs of the first task if there
+	 * is no group leader in the taskset. In the latter case, effective_mems
+	 * of child cpusets must always be a subset of the parent. So no real
+	 * page migration will be necessary no matter which child cpuset is
+	 * selected as attach_ctx.old_cs.
+	 */
 	cgroup_taskset_for_each(task, css, tset) {
 		ret = task_can_attach(task);
 		if (ret)
 			goto out_unlock;
 
+		/* Update attach_ctx.old_cs to the latest group leader */
+		if (task == task->group_leader)
+			attach_ctx.old_cs = task_cs(task);
+
 		if (setsched_check) {
 			ret = security_task_setscheduler(task);
 			if (ret)
-- 
2.54.0

