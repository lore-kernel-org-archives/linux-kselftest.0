Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240574;
	b=4oYkwiSvrI6dGxpWCRZFpUY4IJssecAl5SYUbdcUfZsNgwljWiLWqr66rYNDRgt3nHlT
	 dezmfaNXmbe2/tIEdZOn7gTy67bV9ECy2FSuh5TYhVXsKAIAuuNv+TqhzWInTEMdvBqma
	 Q9RtFg+dd32XVQs3KPvnlmMA3G4gAR0Z2JDkMOFXCY+NOWyMwoQHB2geKWV5IA75Ooy2X
	 wATSpN3d/1rdWq9SKweqd+bzuJdP7nO3gll7A4RnJgL2w/BZ8QQmzryuTHdugLswSbKpD
	 AMc67zLBvEAcE48WGsNREBN1qIL9p6ZuZAaIvvToMDSV4Zxy/jRQVB3snA24CHXTnyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240574;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=oUBECy7Kye9hL8xkXSPQ6hpNWvgAWLC7yF5gCgHsvsU=;
	b=s5GilNX2UEe6vt76XmiRAl+Aejy68UUUVQ9B+pQ4IC5qbD7cxjvwkLLyfzQTcRzH1Amm
	 dDCXr1NGo25ury50ZgpcybLV6GMMqfC+AdrAPS26hHDFysWvl06WSHwj8vXhyEQJX1D0J
	 /f7sJFfC2AFJlX+l4wVSzugqMBc5thBFErFE9W7ztGl2WmB0TJ7Rp9Z2OONBIigBZ9BM8
	 XgvTQbFjRaIHyHnPMUhDF4gpHtk8gagqcCCepnMK1LPOa3YyS3l6VqrncqBnwXccrm3jp
	 /nNwSzvAFK3+KJqtJPx/cVsORH2cRO/T9Z/BiVwu27BimJCtolPQLbkucUo6uojWHhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TUq5xXNl;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88CB606A31C
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 16:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E88CB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TUq5xXNl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794240573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oUBECy7Kye9hL8xkXSPQ6hpNWvgAWLC7yF5gCgHsvsU=;
	b=TUq5xXNlhHaYvY5WdezpSg8+TKizeksqEje2s+WJVVmxv1uxCkHfUqq2PWT4fSHzTOe5EU
	R7XrSfxjPGY1B5r69rvYLCMEuBMTMro6vNclHNVZinot3PhZ0x9D+yyG3Y94gKiH++2jf3
	i9CcwPggz224e0IrYzaBcZgvtxrGb78=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-159-Q3ant5ugPyC2v36aBQvWSA-1; Mon,
 09 Nov 2026 11:09:29 -0500
X-MC-Unique: Q3ant5ugPyC2v36aBQvWSA-1
X-Mimecast-MFC-AGG-ID: Q3ant5ugPyC2v36aBQvWSA_1794240567
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 13E60195607D;
	Mon,  9 Nov 2026 16:09:27 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9745E26C;
	Mon,  9 Nov 2026 16:09:24 +0000 (UTC)
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
Subject: [PATCH 0/5] cgroup/cpuset: More fix patches
Date: Mon,  9 Nov 2026 11:09:07 -0500
Message-ID: <20261109160912.1369897-1-longman@redhat.com>
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

This patch series contains an additional set of cpuset fix patches.

Waiman Long (5):
  selftests/cgroup: Fix "test_cpuset_prs.sh -v" failures
  cgroup/cpuset: Fix incorrect partition invalidation logic in
    cpuset_hotplug_update_tasks()
  cgroup/cpuset: Protect current->mems_allowed read in cpuset_fork()
  cgroup/cpuset: Correctly set cpus_updated in
    cpuset_hotplug_update_tasks()
  cgroup/cpuset: Correctly set isolated_cpus when switching partition
    state

 kernel/cgroup/cpuset.c                        | 66 ++++++++++++++-----
 .../selftests/cgroup/test_cpuset_prs.sh       | 20 ++++--
 2 files changed, 63 insertions(+), 23 deletions(-)

-- 
2.56.0

