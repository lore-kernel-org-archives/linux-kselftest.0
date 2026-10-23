Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785665;
	b=XWSlQz6snespj5CsznTz/XtCRn95S7aN0430IZ9phWJHQUyHJerq38enVD8pZQwu3QeZ
	 VOzsXVFitQyTobl5IlNosenJ/ulrkmp9Lh3agzNBD1236QVAcNbnD/7U/uujTeKvyWPp+
	 3OnnHpos60jjWcD8+Fgd4i2kDqhCUT4ty7cdtK8JV3RfhiADJLPcW07428VjRm4LLmRdf
	 OZUnprPpLJops0SoKyJedTVECcbtLKSeQ3sumXMlTY1fLffFXyd+Jyk3F9k27DmWPz167
	 klyFIMK3/ufKuf+y1Yo3abMSYHVxcNHNzUHWu/OrG2rx1jP3AcGgFosoOrJ8L0fFD+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785665;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=t6K//W4VcL1SC5nLhi5TUGX6yNi2HIfAu/bUBgDdyxM=;
	b=vqJbGgY9nKiQ8kDSIsJCb47pwKnWZs57gi6fB5aCbfpXd9cxpGbwnpiHB33o2vJ4tnpQ
	 ty7RcQfUtbR49b4GWyargiZaU5cq3+qTtGy/jKbhLkvjIllpQQVoh3gSONAtC3BFtr2cU
	 xOe1KRDKgKya0TNCesxhFThDSOd6nDE3LcHGMgsSB7e5zIz9JttKcHHARZf4/iiqyYuwi
	 RYwz/+Nf9XA78Msi5VPFn/TzCogkqxr3mT8wQSVoJFX0DdHqSFs73hlUD5h7OTL9/dQuq
	 256QnzRUTNU1UP9ChO4Vgdq4T4UhMolYaGxEc1jvqAqr8efmItzoaCJqW9Kek7RNJUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=at+W0kPy;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51372606A322
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 20:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51372606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=at+W0kPy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792785664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t6K//W4VcL1SC5nLhi5TUGX6yNi2HIfAu/bUBgDdyxM=;
	b=at+W0kPyEsp3uvUBOPjT1MV+PiR4vIhHNo5RdPu1hN5Cww68LpBHqiE10p56ernAPtBqYn
	yWuPLust1bfvUvZ0AX4yyKTeuzmlJ0+aeW0Aze9jbS0RFFggJSSJnEVe2x8P63sbpS5InR
	dod5iPhrCJ4LwTSDG8lN6sP9eEvhS6k=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-320-Z00jYS-VPn675JvEsUBb4g-1; Fri,
 23 Oct 2026 16:01:02 -0400
X-MC-Unique: Z00jYS-VPn675JvEsUBb4g-1
X-Mimecast-MFC-AGG-ID: Z00jYS-VPn675JvEsUBb4g_1792785661
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 246321956043;
	Fri, 23 Oct 2026 20:01:01 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5CDAB1956088;
	Fri, 23 Oct 2026 20:00:59 +0000 (UTC)
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
Subject: [PATCH-next v2 07/10] cgroup/cpuset: Make sure compute_partition_effective_cpumask() is only called for valid partition
Date: Fri, 23 Oct 2026 16:00:33 -0400
Message-ID: <20261023200036.60560-8-longman@redhat.com>
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

With visual inspection to make sure that
compute_partition_effective_cpumask() is only called for valid partition
root, it was found that the function can be called for an invalidated
partition near the end of cpuset_hotplug_update_tasks(). When partcmd is
set, update_parent_effective_cpumask() is called to either invalidate a
valid partition or with partcmd_update to check if an invalid partition
can be switched back to valid. In both cases, cpuset_force_rebuild()
should be invoked. However, compute_partition_effective_cpumask()
should only be called when an invalid partition is switched back to
valid. When a partition is invalidated, compute_effective_cpumask()
should be called instead.

Also add a WARN_ON_ONCE() in compute_partition_effective_cpumask() to
ensure that a valid partition root is passed in.

Fixes: 72c6303acfa1 ("cgroup/cpuset: Take isolated CPUs out of workqueue unbound cpumask")
Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/cgroup/cpuset.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index d995f1ec5259..2c3a148fa40b 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -2116,6 +2116,8 @@ static void compute_partition_effective_cpumask(struct cpuset *cs,
 	struct cpuset *child;
 	bool populated = partition_is_populated(cs, NULL);
 
+	WARN_ON_ONCE(!is_partition_valid(cs));
+
 	/*
 	 * Check child partition roots to see if they should be
 	 * invalidated when
@@ -4023,9 +4025,12 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
 
 	if (partcmd >= 0) {
 		update_parent_effective_cpumask(cs, partcmd, NULL, tmp);
-		if ((partcmd == partcmd_invalidate) || is_partition_valid(cs)) {
+		if (is_partition_valid(cs)) {
 			compute_partition_effective_cpumask(cs, &new_cpus);
 			cpuset_force_rebuild();
+		} else if (partcmd == partcmd_invalidate) {
+			compute_effective_cpumask(&new_cpus, cs, parent);
+			cpuset_force_rebuild();
 		}
 	}
 
-- 
2.56.0

