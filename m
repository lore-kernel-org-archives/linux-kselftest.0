Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792972496;
	b=11Lj0/mPcdyPiA5rU/mszjxjh/RAgSIjLS/L0XgsuOAqog79EJrW0fvQK05MToiTwVfl
	 lJl7iq+4nHV2yUVk2SAH8Xse1FVypF1hLV6t2N4iLI0VxkyaBVFiqPwYgQzI1J64EwCtK
	 mN1McidU4ZY+N0shq9MRyAKrZ/8LYNlkZ0CX3gchDQbfqv1J/5sNlcvsn0Ye4KoxLN+Jv
	 ge2mVCagvHhQCWD7Tx5i/VYybP2d2XssLlElyvnYx6dB3zoom7nGlXM0IUh+26Kzhxr5q
	 KR09M4NtBN3Aj407kagVu9JkAYEQQf3H1uPzBhGRnWq/V253uuHBl0AmKkcvD4aTSKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792972496;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=m56SEHVn2Gf58KYNLr++62czlSGJ8VvgNElhZ8qMKFk=;
	b=bMt00ZLEbJzOhmTy/9lYGWHH7bpMfDLmzIpaMHKJN/6fjB5E4G8E7i/7JKCnSSQmCBv7
	 nlu5GtIXBWXySaoiGKfq+zXsBkn7+WH/KPfsUlzk3oxTraBpYSIsalnRBfBUJdFkJP6Es
	 u05xBfcgqmw9B+vDHv3d5RZsa1FimkLTLpjhwfhC8uiexi8fP+1fPW/DmTNL4UybDFLgb
	 AJ4JgB+me8LmIcDtXFW8WNW57l5Rej7Zn84P4cWD5cPHo0Yb4BDkuJ5LkVAgGz7ID8Wkn
	 zPRoueqqX/OLJ6GDfg1Ubp2zX8BBarwNqwT59M4Id2HlIpaDgkBTA0h3zsWUEpm4O6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R9abTRDI;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4046606A31D
	for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 23:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F4046606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R9abTRDI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792972493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m56SEHVn2Gf58KYNLr++62czlSGJ8VvgNElhZ8qMKFk=;
	b=R9abTRDI4wx16xT3RasNHZcIsgSp/JsFq0KeiaFYVHjJrCOGMaGaYbIbsIEhf/ZzmRptiq
	jnGHegHWifKRQF0/5mpqSwya/hg29iWOiZMyXe5xAfB5tuM8C1GbBMeE+DNtBJgGgrbahI
	wV4C0nwuwZmdaDbX3NHY3+wv22d9er0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-315-R-ngUY51MPWr_VeGH7EJXw-1; Sun,
 25 Oct 2026 19:54:38 -0400
X-MC-Unique: R-ngUY51MPWr_VeGH7EJXw-1
X-Mimecast-MFC-AGG-ID: R-ngUY51MPWr_VeGH7EJXw_1792972476
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 24B4E19560BA;
	Sun, 25 Oct 2026 23:54:36 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C071E18002B7;
	Sun, 25 Oct 2026 23:54:33 +0000 (UTC)
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
Subject: [PATCH-next v3.1 09/11] cgroup/cpuset: Release invalid isolated CPUs with a shrunk root partition parent
Date: Sun, 25 Oct 2026 19:53:59 -0400
Message-ID: <20261025235359.320155-1-longman@redhat.com>
In-Reply-To: <20261025214449.310715-10-longman@redhat.com>
References: <20261025214449.310715-10-longman@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

It is also reported by sashiko that there may be leakages of isolated
CPUs when a root partition parent shrinks its effective_xcpus with
isolated partition children. Leakage here means that isolated_cpus may
contain extra CPUs that are not in any isolated partitions and not boot
time isolated. Those CPUs cannot be used in any isolated partitions
anymore.

There are 2 different cases here. The effective_xcpus becomes empty and
the isolated partition should be invalidated in this case. Alternatively
some of its effective_xcpus are not in parent's effective xcpus but
still have some valid effective_xcpus left. The isolated partition can
remain valid. In both cases, the invalid isolated CPUs will have to be
released from isolated_cpus if appropriate.

Fix that by calling isolated_cpus_release() to release those isolated
CPUs from isolated_cpus.

New test cases are added to test_cpuset_prs.sh to test this.

Fixes: 11e5f407b64a ("cgroup/cpuset: Keep track of CPUs in isolated partitions")
Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/cgroup/cpuset.c                           | 16 +++++++++++++++-
 .../testing/selftests/cgroup/test_cpuset_prs.sh  |  6 ++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

 [v3.1] Fix the typo "cs->effective_cpus" => "cs->effective_xcpus".

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 6d224e614e74..9a2a6f727929 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -2012,8 +2012,22 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
 		 *
 		 * A partition error happens when parent has tasks and all
 		 * its effective CPUs will have to be distributed out.
+		 *
+		 * For an isolated partition with a shrunk root partition parent
+		 * we may need to return some or all of its isolated CPUs.
 		 */
-		if (nocpu || cpumask_empty(tmp->delmask)) {
+		nocpu |= cpumask_empty(tmp->delmask);
+		if ((parent_prs == PRS_ROOT) && (old_prs == PRS_ISOLATED)) {
+			cpumask_clear(tmp->addmask);
+			if (nocpu)
+				cpumask_copy(tmp->addmask, cs->effective_xcpus);
+			else if (!cpumask_subset(cs->effective_xcpus, parent->effective_xcpus))
+				cpumask_andnot(tmp->addmask, cs->effective_xcpus,
+							     parent->effective_xcpus);
+			if (!cpumask_empty(tmp->addmask))
+				isolated_cpus_release(cs, tmp->addmask);
+		}
+		if (nocpu) {
 			part_error = PERR_NOCPUS;
 			if (is_partition_valid(cs))
 				adding = cpumask_and(tmp->addmask,
diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
index d7d0bef0a17a..ceb1a3b4f94e 100755
--- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
+++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
@@ -522,6 +522,12 @@ TEST_MATRIX=(
 	# its effective xcpus will be removed from isolated_cpus.
 	" C1-4:P1 C3-4:P2   .      .    T:C3-4   .      .      .     0 A1:3-4|A2:3-4 A1:P1|A2:P-2 ."
 
+	# When a root partition parent with an isolated partition child is shrunk
+	# so that its effective xcpus is no longer a superset of its child effective
+	# xcpus, the invalid isolated CPUs should be removed from cpuset.cpus.isolated.
+	" C1-4:P1 C3-4:P2   .      .    T:C4-6   .      .      .     0 A1:5-6|A2:4 A1:P1|A2:P2 4"
+	" C1-4:P1 C1-2:P2   .      .    T:C4-6   .      .      .     0 A1:4-6|A2:4-6 A1:P1|A2:P-2 ."
+
 	#
 	#  old-A1 old-A2 old-A3 old-B1 new-A1 new-A2 new-A3 new-B1 fail ECPUs Pstate ISOLCPUS
 	#  ------ ------ ------ ------ ------ ------ ------ ------ ---- ----- ------ --------
-- 
2.56.0

