Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792639060;
	b=pYRy63OC8MqVYhcVDCdVcwz1/kEvv2s7hQKUB0iz57DA67DbslQydEQ5ZedC4k3AIpOX
	 JrPUIYsmzyQmTc3ayHDNL1wnRRT2nXTPltw1y8Ko6pL5YGYtmF8SBv/HgaxxUkSM3uyIq
	 zdNIo4agyQYslme/Bl39krpTYXSVH6vEhHClM+X68UWk1ca1LAp5guO0vqoLqQ5DIuJw3
	 bxYDu/yanXbQbaNAWhAm+4cb35c76HtkwD4VOFLOI2BG/dlbF08ufQDJ4vAscF9kwy+Fh
	 If4BRFjW4DVgzNTIau3aFVfWBVMG/bV7+GrBLT1ZavWia6WSLg5F6vLKH/Id9Nl039g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792639060;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=CRAKIw+aAavYc/qCE23QYfjcaOtP9DAYHQGNbtw3SAw=;
	b=jIi+c4f8Mo9LMtfSkoXa+rUJjBLuAGEpyzB7OCohifkLC6YeCb3wDFO+HfyNXaKiNsCP
	 i6szfodbCL583bVmcMoqBYLiIZEDl6qIJCIZFUEVahBz0mzxSfEkNn7f2R9DYo+GW74AH
	 Gx85ox5g0Lp1O+QPwiF90FCvyUsuBEnnGSFDnXacUeKVBEsxmd02ndGcm7RlYf9h24Cit
	 8aHEbC5DOX/7QojQO33Pa1vhCLVA5cCkRdiOwBc5PaMqTOYJ6HgrSimqAsHucyhhFybiA
	 ssVwg9Rp1HquUnktIEXQVpdSF1Pe7KoSh7d9dvezTYsbiikH/5eT3lo52Md0Nu4PWpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bp8Qrgvj;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C288160A383D
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 03:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C288160A383D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bp8Qrgvj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792639058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CRAKIw+aAavYc/qCE23QYfjcaOtP9DAYHQGNbtw3SAw=;
	b=bp8Qrgvj9/rDtsYsI7Id9EOI42MYTA9e05y7ff5Q94eLeEG99t6CbPVq3yZmFqJgfeiaoF
	SJOkMMguty3fGkuqZb6s3Xub/erdLpYxyOA3LBgrJVxnJZmpSTmXbcL1q7rDbRfQJ1RdeZ
	wZueQoX4udZw59w63G0PRsqQQ06jSnE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-632-dszNzGzAPfuombXYQm15xw-1; Thu,
 22 Oct 2026 03:17:33 +0000
X-MC-Unique: dszNzGzAPfuombXYQm15xw-1
X-Mimecast-MFC-AGG-ID: dszNzGzAPfuombXYQm15xw_1792639051
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4186519560BB;
	Thu, 22 Oct 2026 03:17:31 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.rmtusnh.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8D68418005B7;
	Thu, 22 Oct 2026 03:17:29 +0000 (UTC)
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
Subject: [PATCH-next 4/6] cgroup/cpuset: Minor fixes to prstate_housekeeping_conflict()
Date: Wed, 21 Oct 2026 23:16:41 -0400
Message-ID: <20261022031643.1351877-5-longman@redhat.com>
In-Reply-To: <20261022031643.1351877-1-longman@redhat.com>
References: <20261022031643.1351877-1-longman@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Commit 9527ff78a413 ("group/cpuset: Consider all the exclusive CPUs when
doing housekeeping check") changes the way prstate_housekeeping_conflict()
is being used by considering all the exclusive xcpus to be owned by the
partition when doing housekeeping check. However there are two minor
issues reported by sashiko with that patch:

 1) In partition_cpus_change(), prstate_housekeeping_conflict() can
 be called with an invalid partition root. In that case, there are
 no isolated CPUs that are going to be returned back to the system to
 become housekeeping CPUs, so the calculation of the del_cpus cpumask
 is meaningless.

 2) The checking of del_cpus in prstate_housekeeping_conflict() to see
 if it can contain an active housekeeping CPU that can be returned to the
 system ignores the fact that an active CPU not in HK_TYPE_DOMAIN_BOOT HK
 cpumask will not become an active housekeeping CPU when it is released
 by an isolated partition.

Update the existing code to handle these two issues properly to make
prstate_housekeeping_conflict() produce more accurate result.

Fixes: 9527ff78a413 ("group/cpuset: Consider all the exclusive CPUs when doing housekeeping check")
Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/cgroup/cpuset.c | 45 +++++++++++++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 7b9062326f35..6e1bef12f86d 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1397,6 +1397,9 @@ static bool prstate_housekeeping_conflict(int new_prs, int parent_prs,
 	    !cpumask_subset(new_cpus, housekeeping_cpumask(HK_TYPE_DOMAIN_BOOT)))
 		return true;
 
+	if (del_cpus && cpumask_empty(del_cpus))
+		del_cpus = NULL;
+
 	/*
 	 * Exit 2nd check early and return false if
 	 * 1) there is no boot time isolated nohz_full CPU
@@ -1405,8 +1408,7 @@ static bool prstate_housekeeping_conflict(int new_prs, int parent_prs,
 	 *    be returned back to the parent.
 	 */
 	if (!housekeeping_enabled(HK_TYPE_KERNEL_NOISE) ||
-	    (new_prs == parent_prs) ||
-	    ((new_prs == PRS_ROOT) && (!del_cpus || cpumask_empty(del_cpus))))
+	    (new_prs == parent_prs) || (!del_cpus && (new_prs == PRS_ROOT)))
 		return false;
 
 	/*
@@ -1417,20 +1419,29 @@ static bool prstate_housekeeping_conflict(int new_prs, int parent_prs,
 	if (parent_prs == PRS_ISOLATED)
 		swap(new_cpus, del_cpus);
 
-	if (del_cpus &&
-	   (cpumask_first_and_and(del_cpus, housekeeping_cpumask(HK_TYPE_KERNEL_NOISE),
-				   cpu_active_mask) < nr_cpu_ids))
-		return false;
-
 	if (!alloc_cpumask_var(&full_hk_cpus, GFP_KERNEL))
 		return true;
 
+	/*
+	 * Check if del_cpus may contain a CPU that can become an active
+	 * housekeeping CPU again.
+	 */
+	if (del_cpus) {
+		cpumask_and(full_hk_cpus, housekeeping_cpumask(HK_TYPE_KERNEL_NOISE),
+			    housekeeping_cpumask(HK_TYPE_DOMAIN_BOOT));
+		if (cpumask_first_and_and(del_cpus, full_hk_cpus,
+					  cpu_active_mask) < nr_cpu_ids) {
+			res = false;
+			goto out;
+		}
+	}
+
 	cpumask_and(full_hk_cpus, housekeeping_cpumask(HK_TYPE_KERNEL_NOISE),
 		    housekeeping_cpumask(HK_TYPE_DOMAIN));
 	cpumask_andnot(full_hk_cpus, full_hk_cpus, isolated_cpus);
 	cpumask_and(full_hk_cpus, full_hk_cpus, cpu_active_mask);
 	res = !cpumask_weight_andnot(full_hk_cpus, new_cpus);
-
+out:
 	free_cpumask_var(full_hk_cpus);
 	return res;
 }
@@ -2475,23 +2486,29 @@ static void partition_cpus_change(struct cpuset *cs, struct cpuset *trialcs,
 				  struct tmpmasks *tmp)
 {
 	enum prs_errcode prs_err;
+	int parent_prs = is_remote_partition(cs)
+		       ? PRS_ROOT : parent_cs(cs)->partition_root_state;
 
 	if (cs_is_member(cs))
 		return;
 
 	prs_err = validate_partition(cs, trialcs);
-	if (!prs_err && !cpumask_empty(trialcs->effective_xcpus)) {
+	if (!prs_err && (parent_prs > 0) &&
+	    !cpumask_empty(trialcs->effective_xcpus)) {
 		int prs = cs->partition_root_state;
-		int parent_prs = is_remote_partition(cs)
-			       ? PRS_ROOT : parent_cs(cs)->partition_root_state;
+
 		/*
 		 * Check for housekeeping conflict by passing the whole
 		 * effective_xcpus as well as those CPUs that are to be
 		 * removed from cs as delmask.
 		 */
-		cpumask_andnot(tmp->delmask, cs->effective_xcpus, trialcs->effective_xcpus);
-		if (parent_prs > 0 &&
-		    prstate_housekeeping_conflict(prs, parent_prs,
+		if (prs > 0)
+			cpumask_andnot(tmp->delmask, cs->effective_xcpus,
+				       trialcs->effective_xcpus);
+		else
+			cpumask_clear(tmp->delmask);
+
+		if (prstate_housekeeping_conflict(prs, parent_prs,
 						  trialcs->effective_xcpus, tmp->delmask))
 			prs_err = PERR_HKEEPING;
 	}
-- 
2.55.0

