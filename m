Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792964734;
	b=1qsG2qRYjShaVI0bEJ2TDmHUzksvxSHn7CLX72oVactXwU9T+00UULItLm2W8vCIPZAs
	 EGC/XHw7U2U+DVrW0Fl3/HZ6ZFHgmXDgUn1qu+ySEb3GfZEbDlfCJ+sfwqCFOJFuFrYp5
	 5yNzT2lXXfe7JuP11fXokloKFo8z1AtWpznGU9hrhPfiJyZXJrE6Ssl7e4DEyoaRZCijS
	 4MAHOBvoUZDYMD7wscW49NAmFjObutlqpPwM5IixsSGOJBCHThTkkwMs/UwRNv8QVib0z
	 EPo923j94huaC8eCQvmjedjZF2i0A87GjI/V7r4Yv3EK8JytOeSXUM3EyWdBGW9Qe+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792964734;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=4J8c+Hr5fTJH0BDfp7U8QsduNp0G3VxfVToMETDsmm0=;
	b=AW5CFL/zZwKrqU88h284fKtv2X1vl+76MtgT328h6BCfKuNU5Gj4wUl4uuVMn/ObXrnF
	 16AMY1xCZ/prC5mxKL7dyE9IQ23yjJr33bkc0+RCFAZJUUf3BduLCxpCWm3f+m1ntetdt
	 pm/mPkQcWlOY/oTefFsJRBR8F6XrPC20J+BcNx6jXWT4/ng2TY1+OSMPkJvg8fFXlNAOL
	 G32hZ2f1eGzo9EWyDPdE108eOYphXLFCXqZ6tnpZuFiiFSqWToOlkthUBdMEMtvTRRf4b
	 t+LWhdv5x1KsP/iHuh6HNZCMfbapCxAKegJeapGfyW2VCcQFppYjlg/en7SA4IXWs8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y8IvpdNy;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F8C606A33A
	for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 21:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0F8C606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y8IvpdNy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792964729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4J8c+Hr5fTJH0BDfp7U8QsduNp0G3VxfVToMETDsmm0=;
	b=Y8IvpdNySpUOX7v9VvAkLXaY9j0AaQtR5z7TxVWAMw/cSrqmlnRoaEB8+uPI1un0wnC5ae
	0S2L0e6yqp/fhR3+K8XI8dZDDH14CgciHgDou1pbDDMirNnDT1MQDhhDRmjo8JmbSsZ3P4
	chj/Br6l8BEUUXom0L3+hsvvWNA0cu8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-350-kiY07tD6MfuvvRHOjurh2Q-1; Sun,
 25 Oct 2026 17:45:26 -0400
X-MC-Unique: kiY07tD6MfuvvRHOjurh2Q-1
X-Mimecast-MFC-AGG-ID: kiY07tD6MfuvvRHOjurh2Q_1792964725
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C36D41801359;
	Sun, 25 Oct 2026 21:45:24 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 493FA1956087;
	Sun, 25 Oct 2026 21:45:23 +0000 (UTC)
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
Subject: [PATCH-next v3 07/11] cgroup/cpuset: Make sure compute_partition_effective_cpumask() is only called for valid partition
Date: Sun, 25 Oct 2026 17:44:45 -0400
Message-ID: <20261025214449.310715-8-longman@redhat.com>
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
index 8903e441ecc1..53fa3970946e 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -2163,6 +2163,8 @@ static void compute_partition_effective_cpumask(struct cpuset *cs,
 	struct cpuset *child;
 	bool populated = partition_is_populated(cs, NULL);
 
+	WARN_ON_ONCE(!is_partition_valid(cs));
+
 	/*
 	 * Check child partition roots to see if they should be
 	 * invalidated when
@@ -4035,9 +4037,12 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
 
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

