Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794362545;
	b=NQNzydYiujrWpbf6zpYiPhGkmblMPJ5ztTqc2zO/LySJl53Kwln3Tjt97MrN6LlHPe/b
	 Yp8PorAGCWvuJwCeRblb3dxDchv13ZfirPsfWBE7gg42B6XAiH5CdnzEhTSgc0EHylmbv
	 KduYisw5cdylKeTVdPBoSkyAIAKy/45YKCkad9sQGphB1b4+UKpwlL8uY99zdpZM1Wy0x
	 L9GZE5SwUL4h52qEHnD+9OVJaQ7xLRdJ7GTgFTfPobE5rXSJaiDTfjW4hLThC45X856Pb
	 BPiLMfDBYBMUn+6n8z8/1tsZr9FZPZQaHCkySOHJSEihr5NxrNCs7VfYlzT5LMjwj7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794362545;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=x1wmDnLmutSVZBJ+c/yQ5tnPYHmRRqT2fv6wsOfi1XM=;
	b=FXxufRyRu4Obb0TwJU54yfbYySS0J5vpfTaldrPJNgtj5ruTkwcwZLG6TwP7/+KVWaqL
	 ZJl7hJrTFhdGarzLJsX8I7NvYX8SGa2OaBCfkX7wXVmqK43oZtaDFOgUPH/oGlasM4bww
	 yNrOgcT48ho3h0omSRUHy/Eey4Sw3AYMEnluD6smhAf4ASOVdd3QtDAt3pY/A1n7Zzf08
	 WSITIZ8xCcWsHpLIgVp7pnGpWWMGVRx6uWJ+quRIZBjawtAcB9VmiJOAhYcUK4ICUmxc3
	 oc5MGm8oViRpN6CdrWJtyPO2AHt6i5VargzAlBWtOPsLRiZqXj+6gJme/GT+ug2a6xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AFHya8su;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4501606A327
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 02:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4501606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AFHya8su
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794362543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=x1wmDnLmutSVZBJ+c/yQ5tnPYHmRRqT2fv6wsOfi1XM=;
	b=AFHya8suYpnZpNa7cIrrRvEB4trLJijQm4GzI1tR901HyjdLOvSuOFdaUeuS1hwL2QZULr
	ltKffnI7oZbIOSWQIchL+/F1Ko674hYpREq2u/CHx1H6bs8EVaTMjtkf8c57Acq6BwVChs
	/Kpd0zjOKle7PcbrxrkjQpZlu+ydhuY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-479-hu1iZoP0OIGwtUMMp-GLZA-1; Tue,
 10 Nov 2026 21:02:20 -0500
X-MC-Unique: hu1iZoP0OIGwtUMMp-GLZA-1
X-Mimecast-MFC-AGG-ID: hu1iZoP0OIGwtUMMp-GLZA_1794362538
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5D98A1978F5D;
	Wed, 11 Nov 2026 02:02:18 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 671381966664;
	Wed, 11 Nov 2026 02:02:16 +0000 (UTC)
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
Subject: [PATCH-next v3 0/3] cgroup/cpuset: More fix patches
Date: Tue, 10 Nov 2026 21:02:01 -0500
Message-ID: <20261111020204.1660055-1-longman@redhat.com>
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

Waiman Long (3):
  cgroup/cpuset: Correctly set cpus_updated in
    cpuset_hotplug_update_tasks()
  cgroup/cpuset: Fix incorrect partition invalidation logic in
    cpuset_hotplug_update_tasks()
  cgroup/cpuset: Check remote partition underneath before making an
    invalid partition valid

 kernel/cgroup/cpuset.c                        | 70 ++++++++++---------
 .../selftests/cgroup/test_cpuset_prs.sh       |  4 ++
 2 files changed, 42 insertions(+), 32 deletions(-)

-- 
2.56.0

