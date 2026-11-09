Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233310;
	b=bFiaMxXIDr+EHaL84CsgXp2o965MeZ19YTDfT/inkNXV1Mk8whAySG4cdP4WzWz7RzXC
	 c6kvDHUl19INlqKIFv4lHgHnT51FmMLzCRTtmMHjJ1LYQa0pDD9B5Zds5/7vYX1iyys3R
	 LYLeSKlQLpfxsjTmeYbYaKbvgBP5RDMj0mN7vch6UxY6zX4pKcYmcoNUjbetFOO+u6l9g
	 65M8nIHms7arqgLpFi/hMAp063QHG0q4ETPwG8uDAhiyIvcZ7iG1BoL/3u7VsEKku+i7T
	 4bumXDMPQaz/a9aEeKG2APkTpYdRWBUTYHJnhkFLk6yjS+Uv8h3gw0QmiXyi3HiK/0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233310;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=nMfShMoTWWZnzsnuXz7dZMMK1Ty2nWujG10KYlZdues=;
	b=QxjQSu7G5JSyDI4XPtL/+TYMqFQ/g9Jn4JLT/RyBeKDImGTuSj0BEb/hTwzMNNJUeI4C
	 6X4kE6b3YR2op5f2XfZDBkkfmOmvR4CXuGu2x2BJSp4JebsoOIrwJl0L7lIarIYyIL0a7
	 iIpoqKbOs2cmwThDvEQq1mpFxHB4564QRv2vYV0AiISgvrnpoeah9z3X1orFB08oNHVfw
	 faLFCktW3F/LcnIcI2hZRiDpKe2fugazJjPB2R2wY9N7iR75ngO0l8l8nTdjufHBVtQDF
	 EzADOQdsfK+Dn6LjZR9Dae+bBP1eltssE4xh1bHdb0GEl8FUcfYoR2U3T+jCc9N/VUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Zih1Nypg;
	arc=none smtp.remote-ip=91.218.175.170
Received: from mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635E5606D807
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 14:08:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 635E5606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Zih1Nypg
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=od9iAb6nN4npUfkIdrpGNq33ktulcg+4meU3VJi0/YM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794233306; v=1; x=1794838106;
 b=Zih1NypgBkrIfUFE7W935KqWvPgHOj1qCug/vkFsewJ6uTBIONAicMmbYcArKwmsk3MSAH/Y
 oBbVCrd3g9C5RBDIBqvS9vS8Qpi1ldtu3yyFM4heyVuDKUBvza2BNQQCnTrUy0/Q4GGD+K4vVe4
 isJKj08Oh6qgFo/ee9XTVb2Q=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4ce0702978e98536;
	Mon, 09 Nov 2026 14:08:26 +0000
X-Mizu-Trace-ID: 4ce0702978e98536
X-Migadu-Flow: FLOW_OUT
From: Leon Hwang <leon.hwang@linux.dev>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	KP Singh <kpsingh@kernel.org>,
	Matt Bobrowski <matt@bobrowski.net>,
	Shuah Khan <shuah@kernel.org>,
	Leon Hwang <leon.hwang@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH bpf-next 0/9] bpf: Add log support for tracing link_create
Date: Mon,  9 Nov 2026 22:08:07 +0800
Message-ID: <20261109140816.5196-1-leon.hwang@linux.dev>
X-Mailer: git-send-email 2.55.0
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

I'm adding syscall common attrs support for LINK_CREATE cmd.

This is the second series for the plan, that adds syscall common attrs
support for LINK_CREATE of tracing prog and cgroup prog.

BTW, address Andrii's review [1] in patch 5:
1. Change if (!OPTS_ZEROED(opts, iter_info_len)) to if
   (!OPTS_ZEROED(opts, log_opts)).
2. Add comment to iter_info and iter_info_len that they are
   deprecated, and use iter.info and iter.len instead.

Links:
[1] https://lore.kernel.org/bpf/CAEf4BzbW4zwL-9j8e2B6KNXVNwsfWyMSAo_RsGCqv-nu_yGhTg@mail.gmail.com/

Leon Hwang (9):
  bpf: Add log support for tracing link_create
  bpf: Add log support for tracing_multi link_create
  bpf: Add log support for iter link_create
  bpf: Add log support for cgroup prog link_create
  libbpf: Add log_opts support for BPF_TRACE_ITER
  selftests/bpf: Verify tracing link_create logs
  selftests/bpf: Verify tracing_multi link_create logs
  selftests/bpf: Verify iter link_create logs
  selftests/bpf: Verify cgroup prog link_create logs

 include/linux/bpf-cgroup.h                    |   7 +-
 include/linux/bpf.h                           |   3 +-
 include/linux/trace_events.h                  |   7 +-
 kernel/bpf/bpf_iter.c                         |  27 +-
 kernel/bpf/cgroup.c                           |  76 +++-
 kernel/bpf/syscall.c                          |  28 +-
 kernel/trace/bpf_trace.c                      |  26 +-
 tools/lib/bpf/bpf.c                           |  17 +-
 tools/lib/bpf/bpf.h                           |   8 +
 .../selftests/bpf/prog_tests/cgroup_link.c    | 324 +++++++++++++++
 .../selftests/bpf/prog_tests/iter_link.c      | 132 ++++++
 .../selftests/bpf/prog_tests/tracing_link.c   | 377 ++++++++++++++++++
 12 files changed, 979 insertions(+), 53 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/iter_link.c
 create mode 100644 tools/testing/selftests/bpf/prog_tests/tracing_link.c

-- 
2.55.0

