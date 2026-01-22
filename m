Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9518392806
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Jan 2026 15:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769095927; cv=none; b=RsZGk0KRqyenrATF+HQ/S9mQKxwWljzBtFFFcddBusqPQxGdkcZlsK6+LhCBLSifxwIt1c/FYEhgZln6p2QzDpJ/uVnR66/ii9OTVh3Oh1hgBtUpx4F+cXc0DytCVuHelazYsNTPLnb/RCA/Lc8nEHMZpb87LtCm+RRUzWIS4co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769095927; c=relaxed/simple;
	bh=BWssMsvThIkETaUb6TMS2f0ki/smN/731UUTxTdFR5w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YFnMuoomDX6v1cag1nyKtjAxxS4wgiqRipv8i/MzG+SQ7ZlykNrVvY/Q74Mv+nSYvc0bnzBQfFRPGPEc2JAbrMFhRIvEF0k/bKpF8R27VWLmeNq2+YIaJTyTEYh6ILe+hSanvaxqKr1sbBQcBADrQpz3gjRA0s3OS7Y8UmhJppo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RTMWgO/x; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RTMWgO/x"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769095910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IvHCbTBkcrs7yjgSou9Squ8cPA5xN1uY+VKYC/xnhMo=;
	b=RTMWgO/x8BLllNfcLo3wcwJqf1M9yeqQnEdGIp2gibat1a1WSNobEYEgM5TXIgZOX2HqyX
	yYXzRYEjhSTfEFrdLrVZwYxDWqRcJjgETNBWutIUJ6TetGbtSy/FXAnWoDksJMbnuql+3/
	lILbBBBjcdPOMw0sHzI0tR+G4YqldMg=
From: Leon Hwang <leon.hwang@linux.dev>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Leon Hwang <leon.hwang@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-patches-bot@fb.com
Subject: [PATCH bpf-next 0/2] bpf: Disallow BPF_F_LOCK with mixed special fields
Date: Thu, 22 Jan 2026 23:31:18 +0800
Message-ID: <20260122153120.69249-1-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Disallow combining BPF_F_LOCK with map values that mix bpf_spin_lock and
other special BTF fields, which may lead to undefined behavior. Such cases
are now rejected with -EOPNOTSUPP.

Map update flag validation is centralized in
bpf_map_check_op_flags() and reused across array, hash, local-storage,
and task-storage update paths, with selftests added to verify the new
behavior.

Leon Hwang (2):
  bpf: Disallow BPF_F_LOCK with mixed special fields and centralize flag
    checks
  selftests/bpf: Add tests to verify BPF_F_LOCK restrictions

 include/linux/bpf.h                           |  7 ++
 kernel/bpf/arraymap.c                         | 11 ++-
 kernel/bpf/bpf_local_storage.c                |  7 --
 kernel/bpf/bpf_task_storage.c                 |  3 -
 kernel/bpf/hashtab.c                          |  8 +--
 .../selftests/bpf/prog_tests/map_lock.c       | 70 +++++++++++++++++++
 .../selftests/bpf/progs/test_map_lock.c       | 31 +++++++-
 7 files changed, 114 insertions(+), 23 deletions(-)

--
2.52.0
