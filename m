Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE91356767
	for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 22:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791670818; cv=none; b=pxz08jyrtuMINNph1CFREWXJ+bEnxyDeeKPMpDslKS9qkfAE/BhplKueoGq2kpdYhYwNFVrfGSrIAShF0EjTLBoSh15NxRnujO68QgapL4aRi9ij98VoaqopvOid6le45y9QIwliTkD3LmZuQ19ni80Z8CMOqHCJyfGEqBRO+7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791670818; c=relaxed/simple;
	bh=2m2ymYWRKgVS2hfmCCY7AoPPRRrl+IzuMUafM6259HE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IEJuxOVdamemtfzu9CYXtEPEJeevgxLd67WnHQavhI1wPhmbC+eEOLfoEeFwxED1xCGA/A09nmZPnWR8j5+54RKuj380Oibhgh7yYQM0qs4LGEwqqRBu/8Eo1HwHq8RdcT/NIxzmjfWdU8mGORmWqQN4mv/IliLCpjdwoDj7CAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cCV7dTbp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cCV7dTbp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791670816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tW8XXIPxsaGzI3jMSbShjWcxolHFONrvMURSmWRciDs=;
	b=cCV7dTbp4zrqpTT8o2dUJv+QwPttmmsRb6YvcwEmrURuqaph+pzMiO7vxfP0Fxiaq7LJI6
	k1rPO4+3th+0OZlava98uMxYcvJc8lCWtiOdev9Cq35jGbHX2EhF2F8AP2Yu3JnWgI2LwC
	I8Loizvh3ylkey2Bs32bzwvep3hxeRw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-54-EDUSU66iOd2567lUbgLVmA-1; Sat,
 10 Oct 2026 22:20:11 +0000
X-MC-Unique: EDUSU66iOd2567lUbgLVmA-1
X-Mimecast-MFC-AGG-ID: EDUSU66iOd2567lUbgLVmA_1791670809
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2A4DA195399C;
	Sat, 10 Oct 2026 22:20:09 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.redhat.corp (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4257B1800473;
	Sat, 10 Oct 2026 22:20:06 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Ridong Chen <ridong.chen@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Hui Peng <benquike@gmail.com>,
	Guopeng Zhang <guopeng.zhang@linux.dev>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH-next v2 3/6] cgroup/cpuset: Do housekeeping check before converting invalid partition to valid
Date: Sat, 10 Oct 2026 18:19:35 -0400
Message-ID: <20261010221938.243859-4-longman@redhat.com>
In-Reply-To: <20261010221938.243859-1-longman@redhat.com>
References: <20261010221938.243859-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

When a hotplug event happens or when update_cpumasks_hier() is called, an
invalid partition may be converted back to valid. However check against
housekeeping conflict isn't being done which can lead to a partition
state that violates the housekeeping rules. Update the code to allow
reviving an invalid partition only if it can pass the housekeeping check.

Fixes: 4a74e418881f ("cgroup/cpuset: Check partition conflict with housekeeping setup")
Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/cgroup/cpuset.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 1c0441fa3bea..fb41cd76add6 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1374,6 +1374,13 @@ static bool prstate_housekeeping_conflict(int new_prs, int parent_prs,
 	cpumask_var_t full_hk_cpus;
 	int res;
 
+	/*
+	 * For a currently invalid partition state, do the check assuming that
+	 * it may be converted back to valid.
+	 */
+	if (new_prs < 0)
+		new_prs = -new_prs;
+
 	if (housekeeping_enabled(HK_TYPE_DOMAIN_BOOT) && (new_prs == PRS_ROOT) &&
 	    !cpumask_subset(add_cpus, housekeeping_cpumask(HK_TYPE_DOMAIN_BOOT)))
 		return true;
@@ -1956,9 +1963,16 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
 			bool exclusive = true;
 
 			/*
-			 * Convert invalid partition to valid has to
-			 * pass the cpu exclusivity test.
+			 * Convert invalid partition to valid has to pass the
+			 * cpu exclusivity test as well as the housekeeping
+			 * check.
 			 */
+			if (prstate_housekeeping_conflict(cs->partition_root_state,
+							  parent->partition_root_state,
+							  xcpus, NULL)) {
+				part_error = PERR_HKEEPING;
+				goto write_error;
+			}
 			rcu_read_lock();
 			cpuset_for_each_child(child, css, parent) {
 				if (child == cs)
-- 
2.55.0

