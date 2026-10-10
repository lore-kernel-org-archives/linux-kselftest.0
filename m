Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530F6331A48
	for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 21:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791666177; cv=none; b=CtUjYsjROAZSbAa1Xd+PrOu3Ywa6sBvVV88+ZKUFk4oavc4D9BSiz6nXK97PSm1316u5HZyAlwJHXmTUOKs37Zdh+ZCkVGzokWOaFdahmqL2Z+cXy851RCXpr1oHe18IL2uEMVLMYQpeAPqm0Bd08MgmJkbZmpVxVPvWj6kXc94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791666177; c=relaxed/simple;
	bh=CWB005W1JYdLCvsKy7Ozq6WQtnMeMg9lxlm/MnPEdhw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lEqRGst+jXFJRQCsiHLc7ji7sz8yCWDyeTqx0yLWUR0VLm7YApJxBTtft8F/shwAo0dA1Xgx6VjVim0PIXYVrs6TZy1mXFump+qgF8mF+bw/VZWAtn7uLFApTth0YIoGu+bw+RyaoJDM2kLPVpLZByWwW14pwOsY051Ul+dKPkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=idIOcLWG; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="idIOcLWG"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93e503815adso52797685a.1
        for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 14:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1791666175; x=1792270975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jcVxPsPHkMv7myJPq9OeT+TVrTGAJUgIg48UHobGlpI=;
        b=idIOcLWG+QVHdypSONwQHE+9TeUQXC+vWFNEG61iof8GBQis7IpCJyFlCtPp13vgHA
         Zrj419D1emcp+DDAWYeSZ7i+8kOLuw9ijFtrlzvZszjte/x4h5KtBXlCblMKwd08l8vk
         PVHprpU36Qq75rE2KoIUOBvm0o1JN5HoE3WGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791666175; x=1792270975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jcVxPsPHkMv7myJPq9OeT+TVrTGAJUgIg48UHobGlpI=;
        b=2LQ+FubbhaYrA0TNvS/+jTAL1oSaowuBCE0dvycZRi9VYldliNgIRfCQ2T3KrV0Az0
         1gFChB5is0vnRtN1F+UPBLcC1BrS9ZGRqUTQtsJM9dnnEg0QrhjzjSMbEsrVHyg0x8uD
         leqoUG/J+Xv3tLIm0CUc8tEa31uRRgCv8nWWQB/yc3Q137UmPVtpwkkMryrWCd8OPBdM
         gelIIOC5r4/1k4X0IwQmjshnnsIMghTSISR2ArW/A+RuPqZarGtjGqiy8icRmmj4M/W2
         0bSer7JXebndrgU6QWD3QCbWZUv7eCRfw4SAA0kDlxgXG96VaabdKiF8r8QVmuE2Ie14
         LpIA==
X-Forwarded-Encrypted: i=1; AKwUvBxUXvMXCWB/YF9lqGWDuYRSCgUnnl+tEsqJFOjUXa1Khz94HbRWl6pyhWSpNkw69Lyhb0LH6yeM1X+mttal4W8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuYchJ11vdmg5du8D4v/TgRBFvRHuvc+JXfHJDqPZYT6lInL9D
	PMAV6XCYpMcNx3RS6K/Or8mak4lGrQUO49FMVwizAyiipVUEX0WMtz/BU+cUIag/cg==
X-Gm-Gg: AYBFou1mVn/52WNHSnISCo9ERQ1PKr3cRVhRa6yq3gRFyoBue7Kxoye59sXXUf0kHFx
	2oTyVTSiFBy1GK5BfrIjBSqXW9GCAcHIbGrus2hNDPapQkvLCKyiE6IaTf34ZXbXI737QSVYawX
	K8ZvsgG0YMcNC0XfwlkvRAtarTCO7yVBBht4jl4pqESGhCnFAbhiWSlQJb7kZBcnqZl996R785w
	Pk0awf1D+2vEAaYoyxEa8QAy+dUTrcOvRP8PkM4sfmi1x8CjYrKZpH7GHjV0Tp07+827UwAhGoK
	V/3NHDDadH8FRHFNkEiqeVlWiwqB1bFp2NcbOrldbgM9sTzI0JDzttPnBhrLPWR/f0e+Xt+Me+H
	uW+w8oQjwAYw14//VQqCojEXSgvkzg2P6Jdpiw84NR/ScXah1YB6NlI2iWkX4PJ1/tNAiFWt3Dk
	WSDuuCPSrzXRQI2l4ULaeuXjdITpVxZqqJKgiS/1IDO9KV8Kv2CtSCAEJzER2iT//56MhBUNGbP
	qCBjWjiMdaCgxM5ExjqCyLcEhKjfFAmJ9aIhkNu2oEZ
X-Received: by 2002:a05:620a:2b8b:b0:93e:c12c:f12a with SMTP id af79cd13be357-93ec12d08ebmr821334685a.69.1791666174924;
        Sat, 10 Oct 2026 14:02:54 -0700 (PDT)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb984845csm498538085a.14.2026.10.10.14.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 14:02:54 -0700 (PDT)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jiri@resnulli.us,
	bpf@vger.kernel.org,
	stable@vger.kernel.org,
	sashiko-bot@kernel.org,
	victor@mojatatu.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	andrew+netdev@lunn.ch
Subject: [PATCH net v2 0/3] net/sched: cls_bpf: accept dev-bound programs on shared blocks
Date: Sat, 10 Oct 2026 17:02:47 -0400
Message-Id: <QDISC-PYC7.v2.20261010165947@mojatatu.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes the regression where a device-bound SCHED_CLS program
attached through a shared block is rejected even when it is bound to a
netdev that owns the block, and closes the bind/reoffload replay hole a
later-joining device would otherwise exploit.

Patch 1 gives netdevsim's cls_bpf TC block callback the device-match
check nfp already has; the callback is the authoritative per-device
acceptance boundary and the defect there predates the cls_bpf core
change.

Patch 2 makes the core attach-time check derive the target device from
the shared block's member set (block->q is NULL for a shared block) and
require every member to match, mirroring the broadcast fan-out of the
offload path.  Patch 1 is a prerequisite of patch 2 on v7.2+ trees:
commit 120977e2c096 ("net/sched: cls_bpf: reject dev-bound programs
bound to a different device") made the replay path unreachable through
shared blocks as a side effect, and patch 2 re-exposes it, so a stable
tree must take both together.

Patch 3 adds shared-block and late-join coverage to bpf_offload.py; it
uses the existing sample_ret0.bpf.o with an explicit `type classifier`
override instead of adding a new sample object.

---
Changelog:

v1 -> v2
- Patch 1 (netdevsim): enforce bpf_offload_dev_match() on the cls_bpf TC
  block callback, closing the bind/reoffload replay path (nipa High).
- Patch 2 (cls_bpf): reject an empty shared block; reformat the comment
  (gemini + nipa Low).
- Patch 3 (selftests): new shared-block + late-join coverage in
  bpf_offload.py.
- Split the v2 draft into three patches; patches 1 and 2 each carry their
  own Fixes: and stable metadata (the selftest companion carries neither).

Jamal Hadi Salim (3):
  netdevsim: reject cls_bpf programs bound to another device
  net/sched: cls_bpf: accept dev-bound programs on shared blocks
  selftests: net: exercise dev-bound cls_bpf on shared blocks


 drivers/net/netdevsim/bpf.c                |  12 ++
 net/sched/cls_bpf.c                        |  28 ++++-
 tools/testing/selftests/net/bpf_offload.py | 139 +++++++++++++++++++++
 3 files changed, 175 insertions(+), 4 deletions(-)

-- 
2.43.0

