Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF3C3CF211
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 03:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782790479; cv=none; b=Ka/7nxNMMV+SC+nr2EcUQ8wKzpw/aYjCJVGNYD4wGKiHFR/T1OmM0DkYp9kbksWWnu4BfxTBLez52DFk9rftjNR+LaVjrRLLZyZXzIKJ51Xu45Pa8aKQ8FuLIpaDU4YWG27C2g2TDIc2ntUKR7rZB0F7R5JqtkxSyYo1XOOxpQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782790479; c=relaxed/simple;
	bh=4q/NEw5WT6Acwn3NuDWTYx7slkyAylnoUlmazUnmlCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=caXfcwH8dy1nNIvqM5vj5MEhiRiIhvp/kzNP3wZL2o5UAt/OXkljHzFOtRA+5iVdCKoTW2JKB3cDF6FM2DzhfJ4YhPneU1en+CTj8ZvaZDUefIaO1k50N6n9Bl2DzuhuGNbeHFl+/+lSeTnF1V6IJ/kslhjRQMd1WP4YyuGBsu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ew2a9/iM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ew2a9/iM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782790477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+P0n6eh3tQM4yrtA4Z0WxFBGLLq339JFASZ7owHr8Lg=;
	b=Ew2a9/iMGauNQPONezllAaBBlpnVYQgOpuSLW9dHHQQXX4NemG+VEtorQEeJg5aFk/szvA
	D43suntKfWV5aoJIBgX/HW4SE1v/mGhnFf6T+S0NUfGVY3QSvQ5On7FbfcVMMhYWKeneBV
	5sY9iU87QZC1FKFyihhHHgsGdRH8HeA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-683-VXs-JTZAPoGFor-PiGV8pg-1; Mon,
 29 Jun 2026 23:34:33 -0400
X-MC-Unique: VXs-JTZAPoGFor-PiGV8pg-1
X-Mimecast-MFC-AGG-ID: VXs-JTZAPoGFor-PiGV8pg_1782790471
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 87DC91955DCD;
	Tue, 30 Jun 2026 03:34:31 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.2.16.200])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CF457195608D;
	Tue, 30 Jun 2026 03:34:27 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Ridong Chen <ridong.chen@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Juri Lelli <juri.lelli@redhat.com>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Aaron Tomlin <atomlin@atomlin.com>,
	Guopeng Zhang <guopeng.zhang@linux.dev>,
	Waiman Long <longman@redhat.com>,
	Gregory Price <gourry@gourry.net>
Subject: [PATCH-next v9 05/11] cgroup/cpuset: Add a cpuset_reserve_dl_bw() helper
Date: Mon, 29 Jun 2026 23:33:38 -0400
Message-ID: <20260630033344.352702-6-longman@redhat.com>
In-Reply-To: <20260630033344.352702-1-longman@redhat.com>
References: <20260630033344.352702-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Extract the DL bandwidth allocation code in cpuset_attach() to a new
cpuset_reserve_dl_bw() helper to simplify code.

No functional change is expected.

Signed-off-by: Waiman Long <longman@redhat.com>
Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
Reviewed-by: Gregory Price <gourry@gourry.net>
---
 kernel/cgroup/cpuset.c | 42 ++++++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 47aa8f2fdfdc..c3c354ab61db 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -3031,6 +3031,25 @@ static int cpuset_can_attach_check(struct cpuset *cs)
 	return 0;
 }
 
+static int cpuset_reserve_dl_bw(struct cpuset *cs)
+{
+	int cpu, ret;
+
+	if (!cs->sum_migrate_dl_bw)
+		return 0;
+
+	cpu = cpumask_any_and(cpu_active_mask, cs->effective_cpus);
+	if (unlikely(cpu >= nr_cpu_ids))
+		return -EINVAL;
+
+	ret = dl_bw_alloc(cpu, cs->sum_migrate_dl_bw);
+	if (ret)
+		return ret;
+
+	cs->dl_bw_cpu = cpu;
+	return 0;
+}
+
 static void reset_migrate_dl_data(struct cpuset *cs)
 {
 	cs->nr_migrate_dl_tasks = 0;
@@ -3045,7 +3064,7 @@ static int cpuset_can_attach(struct cgroup_taskset *tset)
 	struct cpuset *cs, *oldcs;
 	struct task_struct *task;
 	bool setsched_check;
-	int cpu, ret;
+	int ret;
 
 	/* used later by cpuset_attach() */
 	attach_ctx.old_cs = task_cs(cgroup_taskset_first(tset, &css));
@@ -3101,27 +3120,14 @@ static int cpuset_can_attach(struct cgroup_taskset *tset)
 		}
 	}
 
-	if (!cs->sum_migrate_dl_bw)
-		goto out_success;
-
-	cpu = cpumask_any_and(cpu_active_mask, cs->effective_cpus);
-	if (unlikely(cpu >= nr_cpu_ids)) {
-		ret = -EINVAL;
-		goto out_unlock;
-	}
-
-	ret = dl_bw_alloc(cpu, cs->sum_migrate_dl_bw);
-	if (ret)
-		goto out_unlock;
-
-	cs->dl_bw_cpu = cpu;
-
-out_success:
-	attach_ctx.in_progress++;
+	ret = cpuset_reserve_dl_bw(cs);
 
 out_unlock:
 	if (ret)
 		reset_migrate_dl_data(cs);
+	else
+		attach_ctx.in_progress++;
+
 	mutex_unlock(&cpuset_mutex);
 	return ret;
 }
-- 
2.54.0

