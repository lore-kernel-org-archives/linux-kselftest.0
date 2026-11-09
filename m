Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251417;
	b=2QtDVBI4fM//nmwgRLOJxusanOtjQEpQgdFMH2EJL5EyGxlH+kbVdXLSG0EKFZWGCUrQ
	 lZ5uHJPWwY5fBfJC3FEBuk4jaZb6uTIG2f2lAFQsIAAfSPQ7vyy8FN59Q/CINsJdjisa9
	 +43Bydd3Wb1figh7KFJslAGQRNaO2TqLAvkzjGpvmn5EqdVYXzND+seTOIx1GangQk/58
	 n/3re6wE3o/Xq+SW0z4RZDjKy6jrc8rCFQI7MVlU2DY2Mn2Zzo3BhGjW++KmnlpNvlnIU
	 ax/s/8u75Srni9Hibo6jTVOzuLxJSVbR/cRtXnxZ9gZP5lJa44H55mN22hLDuF85AwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251417;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=1+VGOzdszmEm5r9Dtb+uNL8xaPZUQtUCtTE44595/w0=;
	b=f4d1es5GZqt2hXAn6kfa9mpVEKperMohpN9Oq+ljoMcyTNFkqDP95W3YWvluN/HCXEOe
	 7lmva3jTLWoWFDZ23uJRAmhKQzAyJLBigOF+uPspPfLzXMXzDqnSQK2BIA57gpSwGT0xn
	 VcuMV8nPODvUobkyF4YwVSDwejzu1np3L2t8L3FeM9Oeeht8VgCfk68KIStEGKv/Fh3ZC
	 P+oLC/+yid7oZxTd/5jpHOQf/UkniLS8Hvgf+uWK8XZTas62RcZFcCH4YNoIwuPP0UDed
	 +XzPK4PTZlWYveU8hk0QeJIInnr7yHCajzljAbhjKqUpZbKXJD0nARV6F8IQ/VSjGpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Silqb14l;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47851606A332
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 19:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47851606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Silqb14l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794251416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1+VGOzdszmEm5r9Dtb+uNL8xaPZUQtUCtTE44595/w0=;
	b=Silqb14lK8ZOBflQhtetTRdvHYqFP9sHbhxC0l3aQLZhCOlQ/mhlby7HpxoFnaTr3mjr0G
	gSeQ6HlUV1utsS8AvXjLmp8LLNaPWCdHlezdcABHhsMHyfa1yx3vnfsYRtjZuRJS+1JgEN
	alR3xjBpODPwe6AO079GUy2NeBwjGqM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-336-iGvRxo4pMDuyUzyBPWroFA-1; Mon,
 09 Nov 2026 14:10:11 -0500
X-MC-Unique: iGvRxo4pMDuyUzyBPWroFA-1
X-Mimecast-MFC-AGG-ID: iGvRxo4pMDuyUzyBPWroFA_1794251410
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0F5D4180060F;
	Mon,  9 Nov 2026 19:10:10 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E65EF195608C;
	Mon,  9 Nov 2026 19:10:07 +0000 (UTC)
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
Subject: [PATCH-next v2 0/5] More fix patches
Date: Mon,  9 Nov 2026 14:09:50 -0500
Message-ID: <20261109190955.1398611-1-longman@redhat.com>
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

 [v2]
  - Reorder the series by putting the original patch 4 before patch 2.
  - Update the Fixes tags in patch 1 and 5 as suggested by sashiko.
  - Update the new patch 3 to remove obsolete WARN_ON_ONCE() and update
    comment as reported by sashiko.
  - Minor fix to the test case in patch 5 as reported by sashiko.

This patch series contains an additional set of cpuset fix patches.

Waiman Long (5):
  selftests/cgroup: Fix "test_cpuset_prs.sh -v" failures
  cgroup/cpuset: Correctly set cpus_updated in
    cpuset_hotplug_update_tasks()
  cgroup/cpuset: Fix incorrect partition invalidation logic in
    cpuset_hotplug_update_tasks()
  cgroup/cpuset: Protect current->mems_allowed read in cpuset_fork()
  cgroup/cpuset: Correctly set isolated_cpus when switching partition
    state

 kernel/cgroup/cpuset.c                        | 77 ++++++++++++-------
 .../selftests/cgroup/test_cpuset_prs.sh       | 20 +++--
 2 files changed, 64 insertions(+), 33 deletions(-)

-- 
2.56.0

