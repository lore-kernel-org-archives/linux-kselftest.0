Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792639050;
	b=MpmZzrMDOu/1prfgBUj2nv7S6OKj/O6tlVKjmfYYRyalWVf+Wg9ShwUYvzX/7I+Eou8/
	 3GEzpGQSMS5K32hgTud6p1D7W7PYl5MhK74xfv5ESNTfnPLBxbk/E9eszDgKQPQ6wev3f
	 xT+m/ykAQWjM6xrCDP1eq0YsRjEQig/ufeA+YajgVUWYevyzGa4Okcoh1fe0scy2G1OEy
	 /s/vrqdKRApVe4QQbjU5KymSfTOiktlQic38kISwL2+bLq9TRh1ftn8hgxWa+lnWK9eW2
	 eo41CkoIec9vz2+RTBRsSx5e2qJbF9xcz72tSI/LNU7phDEQncoadk6IUbXOP6p+NqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792639050;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=ZBHqicZnElDr6Q+9i3XwZjIk/+4ctso0XI9yKskduSE=;
	b=WLTCffTxCEEMZ/HUk2rnMj/NvWsgodl+hfBR4RnV7xflggYyUyezvAybMXir8Zt/NJ0U
	 rhgUoEPFU78mp6jjVikUmimSWC+3+VJFwi1naUklQ8Dmh8I98SjN+md0gzy7I8LUJAAo0
	 y+QLwOo4HmXL3OTej9yfCzGdS7QRWOAYNvZnS32CrdtneSW37/DCCy961GLHOdtdx7BIf
	 6/4+e1ACyhEhVIhprw0eXFrPtazQPPIjfqjdO4aV7LtpA8/ZD0ImNkyPk+LyE/bhW63wx
	 rh7AChfiwtS0GpSrUAU9Tt9b/bRO4GMJ2p8HM27+qD4KjTsXcbjJu+VD02CVK1xRIjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WLwldc93;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C86E60A2610
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 03:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C86E60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WLwldc93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792639048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZBHqicZnElDr6Q+9i3XwZjIk/+4ctso0XI9yKskduSE=;
	b=WLwldc93gORomnxZxZEOeOIREN6hxf7oQ8LJ3A6OefoH6Rlw/Xi8gF5yp1c6LVoSBT+9em
	L+5K/6ol/mrZ1x7pMrUR1pgwuqgL0w6lD8DTAFmTc8lruKHZphFfoW1fiMa3UfOXtdkqhU
	Ic1xUi8F8P1f/sTaKvKMhbjLjVtL5Y8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-5-_6cYOh31ObGM0wPquH6Bcw-1; Wed,
 21 Oct 2026 23:17:25 -0400
X-MC-Unique: _6cYOh31ObGM0wPquH6Bcw-1
X-Mimecast-MFC-AGG-ID: _6cYOh31ObGM0wPquH6Bcw_1792639043
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 73ED01800755;
	Thu, 22 Oct 2026 03:17:23 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.rmtusnh.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 46CE418005B7;
	Thu, 22 Oct 2026 03:17:20 +0000 (UTC)
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
Subject: [PATCH-next 0/6] cgroup/cpuset: Miscellaneous bug fixes
Date: Wed, 21 Oct 2026 23:16:37 -0400
Message-ID: <20261022031643.1351877-1-longman@redhat.com>
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

This patch series includes a number of fixes for bugs or issues reported
by sashiko (patches 1-5) and Guopeng Zhang (patch 6).

Waiman Long (6):
  cgroup/cpuset: Find furthest isolated ancestor for invalidated
    isolated partition
  cgroup/cpuset: Properly compute effective xcpus in
    update_parent_effective_cpumask()
  cgroup/cpuset: Fix incorrect effective_cpus bug in
    update_cpumasks_hier()
  cgroup/cpuset: Minor fixes to prstate_housekeeping_conflict()
  selftests/cgroup: Check for a single range nohz_full CPUs before
    running test matrix
  cgroup/cpuset: Prevent recursive call of remote_cpus_update() via
    update_cpumasks_hier()

 kernel/cgroup/cpuset-internal.h               |   5 +
 kernel/cgroup/cpuset.c                        | 140 ++++++++++--------
 .../selftests/cgroup/test_cpuset_prs.sh       |  18 ++-
 3 files changed, 100 insertions(+), 63 deletions(-)

-- 
2.55.0

