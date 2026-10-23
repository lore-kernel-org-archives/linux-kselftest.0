Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785674;
	b=NLRmtYmn5kZTCUaIWfC9xZfM8C/rp1aPRsyp8KdXthcDmKjKbj+2GsLmv1QimwbWck1r
	 4rQYwWQE1HU3PIb4SnJZTzx49XJg7NBmM5EjFXivhGc2isdXJ73I+eIS2wKw4t3DG+pt9
	 IAApoL5gmmARBSxDrzZWXx3avSkFm1r0OutrflkBrDmQCBWezzC8kt6ewe5SD6gL75JuX
	 Op/HxP0vVjjt9gMOWWaFVciKfM8wib/GcIsJsS/QgVir/dFBI8RKORjwLbv1ZnAAJauye
	 DsyXegmLZFldy1Tr7/VJAl1tMYBrkARlIC+4RaRRtfbIlrz+oGcUhZRPRkG94BsnUrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785674;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=dOjKFLT6q7N0NtB4wOtPJKvnXmMMNKlaZzQTuFAhdps=;
	b=by86WQkYlsg6wW17o5cOiuAj9xotHEqjWDF4bqRzzIbX0RnEDgnEwEbFWfXRjwjsqlga
	 IGZwmzwFi1m3Iy5kLzA9+vM5/Ha3vnnK0+0T8hYx2IYejHRu0+wgm2lJ2toiL7REt/Z8l
	 BFnFjD66D3LWpiHpaCAha2xic8cbJkPriX7Vqaqls7t6UbWG0LIwihxbnYxa8oq23GdNG
	 KIwjYt7Am6XlS19te/FPkqvG5AY+eDSyo1ort0oXNT3PJnXUlObD1Mdfy7l68TnXUB8il
	 wcrKPqjbIOTo9KjL9hw7BqZiCMCS6BXqmDgznPqoZpBA5D9tu5xGyuRoYjIMoczwl5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="X/Fx7cJ2";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D386D60A2619
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 20:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D386D60A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X/Fx7cJ2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792785673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dOjKFLT6q7N0NtB4wOtPJKvnXmMMNKlaZzQTuFAhdps=;
	b=X/Fx7cJ2jv1ML/gMf+OEZkzYydy5xtX+Tq71SQA0XfO98TyQlJHSPUqp2gXBUdTxXDk8Ag
	4phAm4TiZlE+jaVt+u9pfQFTueXMpWiBStLXJgCZ75Ja3IP+DbzU4fa5FhhOY3i1EIkhmX
	VHZ1UAcKaxW7pvSlb5ckYWxF1kx4iDw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-339-47jf6FfHMm2Y4uA4uBb5qg-1; Fri,
 23 Oct 2026 16:01:09 -0400
X-MC-Unique: 47jf6FfHMm2Y4uA4uBb5qg-1
X-Mimecast-MFC-AGG-ID: 47jf6FfHMm2Y4uA4uBb5qg_1792785666
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C69671805A22;
	Fri, 23 Oct 2026 20:01:06 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 437F91955F03;
	Fri, 23 Oct 2026 20:01:05 +0000 (UTC)
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
Subject: [PATCH-next v2 10/10] cgroup/cpuset: Integrate compute_partition_effective_cpumask() into compute_effective_cpumask()
Date: Fri, 23 Oct 2026 16:00:36 -0400
Message-ID: <20261023200036.60560-11-longman@redhat.com>
In-Reply-To: <20261023200036.60560-1-longman@redhat.com>
References: <20261023200036.60560-1-longman@redhat.com>
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

Update compute_effective_cpumask() to call
compute_partition_effective_cpumask() directly if the given cpuset is
a valid remote or local partition root. This simplifies the call sites
where they are being involved. No functional change is expected.

Suggested-by: Ridong Chen <ridong.chen@linux.dev>
Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/cgroup/cpuset.c | 37 ++++++++++---------------------------
 1 file changed, 10 insertions(+), 27 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index f9ba711e1e1a..9190dc8e4c49 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1567,8 +1567,6 @@ static void compute_partition_effective_cpumask(struct cpuset *cs,
 	struct cpuset *child;
 	bool populated = partition_is_populated(cs, NULL);
 
-	WARN_ON_ONCE(!is_partition_valid(cs));
-
 	/*
 	 * Check child partition roots to see if they should be invalidated
 	 * when all the effective_cpus will be used up and cs is populated.
@@ -1629,6 +1627,10 @@ static void compute_effective_cpumask(struct cpumask *new_cpus,
 {
 	bool has_cpus;
 
+	if (is_remote_partition(cs) ||
+	    (is_partition_valid(cs) && is_partition_valid(parent)))
+		return compute_partition_effective_cpumask(cs, new_cpus);
+
 	has_cpus = cpumask_and(new_cpus, cs->cpus_allowed, parent->effective_cpus);
 	if (!has_cpus && is_in_v2_mode())
 		cpumask_copy(new_cpus, parent->effective_cpus);
@@ -2224,10 +2226,7 @@ static void update_cpumasks_hier(struct cpuset *cs, struct tmpmasks *tmp,
 			remote = (new_prs == old_prs);
 		}
 
-		if (remote || (is_partition_valid(parent) && is_partition_valid(cp)))
-			compute_partition_effective_cpumask(cp, tmp->new_cpus);
-		else
-			compute_effective_cpumask(tmp->new_cpus, cp, parent);
+		compute_effective_cpumask(tmp->new_cpus, cp, parent);
 
 		if (remote)
 			goto get_css;	/* Ready to update cpuset data */
@@ -2326,10 +2325,7 @@ static void update_cpumasks_hier(struct cpuset *cs, struct tmpmasks *tmp,
 			 */
 			new_prs = cp->partition_root_state;
 			if (new_prs != old_prs) {
-				if (new_prs > 0)
-					compute_partition_effective_cpumask(cp, tmp->new_cpus);
-				else
-					compute_effective_cpumask(tmp->new_cpus, cp, parent);
+				compute_effective_cpumask(tmp->new_cpus, cp, parent);
 			}
 		}
 
@@ -3961,7 +3957,6 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
 	static nodemask_t new_mems;
 	bool cpus_updated;
 	bool mems_updated;
-	bool remote;
 	int partcmd = -1;
 	struct cpuset *parent;
 
@@ -3973,21 +3968,12 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
 	if (!tmp || !cs->partition_root_state)
 		goto update_tasks;
 
-	/*
-	 * Compute effective_cpus for valid partition root, may invalidate
-	 * child partition roots if necessary.
-	 */
-	remote = is_remote_partition(cs);
-	if (remote || (is_partition_valid(cs) && is_partition_valid(parent)))
-		compute_partition_effective_cpumask(cs, &new_cpus);
-
-	if (remote && (cpumask_empty(subpartitions_cpus) ||
-			(cpumask_empty(&new_cpus) &&
-			 partition_is_populated(cs, NULL)))) {
+	if (is_remote_partition(cs) && (cpumask_empty(subpartitions_cpus) ||
+				       (cpumask_empty(&new_cpus) &&
+					partition_is_populated(cs, NULL)))) {
 		WRITE_ONCE(cs->prs_err, PERR_HOTPLUG);
 		remote_partition_disable(cs, tmp);
 		compute_effective_cpumask(&new_cpus, cs, parent);
-		remote = false;
 	}
 
 	/*
@@ -4013,10 +3999,7 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
 
 	if (partcmd >= 0) {
 		update_parent_effective_cpumask(cs, partcmd, NULL, tmp);
-		if (is_partition_valid(cs)) {
-			compute_partition_effective_cpumask(cs, &new_cpus);
-			cpuset_force_rebuild();
-		} else if (partcmd == partcmd_invalidate) {
+		if (is_partition_valid(cs) || (partcmd == partcmd_invalidate)) {
 			compute_effective_cpumask(&new_cpus, cs, parent);
 			cpuset_force_rebuild();
 		}
-- 
2.56.0

