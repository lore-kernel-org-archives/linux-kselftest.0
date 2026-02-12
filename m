Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C9C2D7D42
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Feb 2026 08:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770884637; cv=none; b=acZx3MvcP/Rv3+mnwdOIJayovYrBwSvlSOOmJr4NRLONpDajIPuH4WxUM+e3CyJ40TJ0He5P0hYipyEL2r4TyM/Pf0rnElJZYGUP7BFNckLO2ifZ1b8+8gle8acjPOUsg4j4i6EWtRaWIVCE5NcQHmwOQ3PHQOol8/UsqrUyYe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770884637; c=relaxed/simple;
	bh=nc9UqMakTgTVpIVgbrfrdJ3wNfSWNxcL+yXxgJfcvJo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=E+Gm6VZDuMSsIclV7d9Pn6ULw9O8c/9n2e2YvpTXmbDA+Rz0Ay5ZzgSDGL22d4nToUlEyWjLGJEETlhMXaPrz6+kOckXhtj13wJy3DpAadS7LMMrcbsqCmN2LMeYDILmxAyUf4lON2CkqFHalbdyRmm7C4X0dHNSxUwlMsmc/rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XijP+Aja; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XijP+Aja"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770884624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nG1F/Kmp6JwkFcrp15JMZNDubf9nKflBRchreJY3ZlM=;
	b=XijP+AjafbjgMxF/DSBHdAP+2rp4pvVbeq7EN/TaXPqfY/pR/Rh9/uS4pSE0MRoKKY/n6k
	29dxRtBU7+TC7UIz82mkX2pafsIH8X30sEEfHjJk+VFee9nJuGpQeBsMg7Lg7hjZ7kl+Xr
	6cLpO7nAWVNrWW21hZwdyYyQKsgRNFk=
From: Hui Zhu <hui.zhu@linux.dev>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Hui Zhu <zhuhui@kylinos.cn>,
	JP Kobryn <inwardvessel@gmail.com>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next 0/3] Fix test_cgroup_iter_memcg issues found during back-porting
Date: Thu, 12 Feb 2026 16:23:13 +0800
Message-ID: <cover.1770883926.git.zhuhui@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Hui Zhu <zhuhui@kylinos.cn>

While back-porting "mm: bpf kfuncs to access memcg data", I
encountered issues with test_cgroup_iter_memcg, specifically
in test_kmem.

The test_cgroup_iter_memcg test would falsely pass when
bpf_mem_cgroup_page_state() failed due to incompatible enum
values across kernel versions. Additionally, test_kmem would
fail on systems with cgroup.memory=nokmem enabled.

This series addresses these issues:
1. Add return value checks for bpf_mem_cgroup_page_state()
2. Return error when accessing kmem with nokmem enabled
3. Skip test_kmem when cgroup.memory=nokmem is set

Hui Zhu (3):
  selftests/bpf: Check bpf_mem_cgroup_page_state return value
  mm/memcontrol: Return error when accessing kmem with nokmem
  selftests/bpf: Skip test_kmem when cgroup.memory=nokmem

 mm/memcontrol.c                               |  3 +-
 .../bpf/prog_tests/cgroup_iter_memcg.c        | 40 +++++++++++++++++++
 2 files changed, 42 insertions(+), 1 deletion(-)

-- 
2.43.0

