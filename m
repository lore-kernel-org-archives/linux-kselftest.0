Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794792236;
	b=q91C0zj3DfdLhj32k0XIRHxOL0xTejbdpkqO4pykRuxAJg0iugym2qLrLOLMx9wl+W8X
	 LeObV4AnZFFJsmpNeSBXz6BlaIGcQ3DR+dP2QDGaR1gyH1BycZlmyuxRlq1MAu4XDORWl
	 o3uR8VKHUYu0/iCu9BlGEQi1ZIynY3aVlZfJv0PuiKcQiJDGxK4z6n+t9AXzp5JsDOs+w
	 BUk0jXWlFc2LF4cf140j06wIS78C3wFcjo8/FucsgyV3HLgUKacYjmNVVJm1kwS7y2Wof
	 Qajz1QM+C+lgvudA+mdMRFQCISs1fc0Li35b+ma6+TM20X7rEpnEt6cJYT2S1rFnOqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794792236;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=7/foLeZWh6mOx/E6h1htnKBNjksry5ms+vKjgn4bpO8=;
	b=VLahypa1CvaahpSwY8srvFLJDsyxY45yBxVbe46Q2CQgPUSKK90A9cdvqo9qU82VpeVB
	 b4Q71AgRyMGF/e5IoF0tYk/hs+T3ifVY5ZYzlKAC4SzPAYBnwky48qylarOrykrgWwb3t
	 +rqtOiPMvt1PqOr4cYKx7orTu8aRodES4NHbRD1fxbaRFcK2uOYISLDkkisy7oMGA0LcY
	 q4JselIcixEX8KMin16+1fmZRQOxgTeICFcs+VM7Gf5n/we/4etjkH+IFcq1Y9CxdVcvD
	 5OnKr2x2PymhzQRlGvxsv949VDRxvIWiOPDBCoHBYzvrhek3GErHIECg1juWpiTg5IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LQI4Yxe0;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C37606A321
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 01:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83C37606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LQI4Yxe0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794792235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7/foLeZWh6mOx/E6h1htnKBNjksry5ms+vKjgn4bpO8=;
	b=LQI4Yxe0H40ibvKKNEyUwgjHV/8xc71jrQFTT0GRtiKY2OiOVNPUhKTxJnVl1apWULjHay
	fqqyBZH8ttCw2d8fXmCLTc30wW0gIyvAZ/ASGtbPgvejjEtrDO7tG0pXwUrjRTF/7k11q1
	uXdXy6GLsBMUAFWkRqV3oAqb80PAF/0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-36-uAdGMwHPM7yOni6GEiFIQQ-1; Sun,
 15 Nov 2026 20:23:51 -0500
X-MC-Unique: uAdGMwHPM7yOni6GEiFIQQ-1
X-Mimecast-MFC-AGG-ID: uAdGMwHPM7yOni6GEiFIQQ_1794792230
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4EDD619560AF;
	Mon, 16 Nov 2026 01:23:49 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 21029436;
	Mon, 16 Nov 2026 01:23:46 +0000 (UTC)
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
Subject: [PATCH-next v4 0/6] cgroup/cpuset: More fix patches
Date: Sun, 15 Nov 2026 20:23:03 -0500
Message-ID: <20261116012330.2271010-1-longman@redhat.com>
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

[v4]
  - Drop v3 patch 1 as it is fixed in a different way in patch 5.
  - Add a new patch 2 fixing a minor bug reported by sashiko.
  - Add patch 4/5 to fix a remote partition hotplug problem reported
    by Guopeng.
  - Add patch 6 to fix a bug in lockdep_is_cpuset_held().

[v3]
  - Drop patch 1, 4 & 5 of v2 as they are merged.
  - Update the new patch 1 as suggested by Chen Ridong
  - Add a new fix patch 3.

[v2]
  - Reorder the series by putting the original patch 4 before patch 2.
  - Update the Fixes tags in patch 1 and 5 as suggested by sashiko.
  - Update the new patch 3 to remove obsolete WARN_ON_ONCE() and update
    comment as reported by sashiko.
  - Minor fix to the test case in patch 5 as reported by sashiko.

This patch series contains an additional set of cpuset fix patches.

Waiman Long (6):
  cgroup/cpuset: Fix incorrect partition invalidation logic in
    cpuset_hotplug_update_tasks()
  cgroup/cpuset: excpus parameter of remote_cpus_update() must have at
    least 1 active CPU
  cgroup/cpuset: Check remote partition underneath before making an
    invalid partition valid
  cgroup/cpuset: Revert "remove global remote_children list"
  cgroup/cpuset: Handle remote partitions before local partitions in
    cpuset_handle_hotplug()
  cgroup/cpuset: Fix lockdep_is_cpuset_held()

 kernel/cgroup/cpuset-internal.h               |  10 +-
 kernel/cgroup/cpuset-v1.c                     |  16 +-
 kernel/cgroup/cpuset.c                        | 178 +++++++++++++-----
 .../selftests/cgroup/test_cpuset_prs.sh       |   6 +-
 4 files changed, 149 insertions(+), 61 deletions(-)

-- 
2.56.0

