Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.162
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447680;
	b=0D9etC673BjlmSO4Je5hV5PlR3O8izEOssrUNB2WzuCzuom+89MZ+jlEFq2PTNy/kmBI
	 RGB5RKoeJxYy6lfD+UGQGYnZx14vYsc27YJnuEJzAGn/it1ET1ZSMzpVWq4EaAc+p7i/l
	 TW01Lb7Ioziapr2fJrzw/KKX/nRZgrWs4Cs40bUe2CM19G5F5AGfZyHYmZv1HjTBeLkeD
	 ibW5siKUNE8MYMRGYROEeGXVGqCZSRyIJTBWwfVEDCj85vU3zvzUA7KHbPpYi2rG2KWUf
	 90qElHaZC22N/x63Lf4nuoP9Wf6MqWOzOSMnGL5ruOTvLzR6bHxq1p2dXpz9ZNcbumA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447680;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=qqPm8nIXX4WQfxkaIgzNJF0S+baXAN/1l3nC3wPYeW4=;
	b=eNtfNMBTA367BYQ3BJENv+iwsc9foOD7pTmxFnKmOlEW25/8zMQum1xx+8nJYIGq35td
	 nTGNWLqHLQ5h/Tg3uwJNV53XnPiOUj+DyMukumiKuY+z2BC7/DJvskw/y8vD7M/+qm4n/
	 3jPO98YCRL2GJ9hJpBzebXrzngZQpDuLuRO5xJ8Bh9ILzbJ/lzUb9ssF94fJtn+e+eloI
	 y/gMUtK5x/oSOBjxtDwF8xTPYMSXEXShvSOjN8H7XVRJHGYohOkfa8sDIYIfeQ6qVx2FR
	 2GztS/NSCb7WXb35VLbl1l5UD0mTUHIcw8aFNAYIzXVPjYsh1t3fhHw64iPKaUfe3KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="ZrWMK/wE";
	arc=none smtp.remote-ip=91.218.175.162
Received: from mta0.migadu.com (out-162.mta0.migadu.com [91.218.175.162])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCAF606A32C
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 15:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CCAF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZrWMK/wE
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RaXo+fAW62LWJslzHq4Otn1HbGUNnvp5PQhq2O++7UE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795447678; v=1; x=1796052478;
 b=ZrWMK/wE2w3Ag3kzKzBFC6Svxz2/OtKKzECu4rt9o+L2v+6Nii4cSgJ2fLWLuN8qrhLMJJ8i
 K7wLODYxWBtAXrxBD4eqW/czlpCjRP+O2h/85sUClefqfpowHRVuLzN5nLapA8dldQpIyOlx1+h
 Qmm3anflY4rHLwun+K3Y58EQ=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ec5cb40c4e5406b8;
	Mon, 23 Nov 2026 15:27:57 +0000
X-Mizu-Trace-ID: ec5cb40c4e5406b8
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
Subject: [PATCH bpf-next v3 0/9] bpf: Add log support for tracing link_create
Date: Mon, 23 Nov 2026 23:27:34 +0800
Message-ID: <20261123152743.19629-1-leon.hwang@linux.dev>
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

I'm planning to add syscall common attrs support for LINK_CREATE cmd.

This is the second series for the plan, that adds syscall common attrs
support for LINK_CREATE of tracing prog and cgroup prog.

BTW, address Andrii's review [1] in patch 5:
1. Change if (!OPTS_ZEROED(opts, iter_info_len)) to if
   (!OPTS_ZEROED(opts, log_opts)).
2. Add comment to iter_info and iter_info_len that they are
   deprecated, and use iter.info and iter.len instead.

Links:
[1] https://lore.kernel.org/bpf/CAEf4BzbW4zwL-9j8e2B6KNXVNwsfWyMSAo_RsGCqv-nu_yGhTg@mail.gmail.com/

Changes:
v2 -> v3:
* Add log support for bpf_check_attach_btf_id_multi().
* Add more selftests to cover more logs for link creation failures.
* Update some log messages in patch 1. (Alexei)
* Add log for dst attach type check in bpf_check_attach_target(). (Alexei)
* Update some log messages in patch 2. (Alexei)
* Pass 'log' to btf_attach_func_proto() and btf_distill_func_proto() in
  bpf_check_attach_btf_id_multi(). (Alexei)
* Add a log msg in check_dup_ids() when dup ids. (Alexei)
* Add a log msg in bpf_tracing_multi_attach() when it returns
  -EOPNOTSUPP. (Alexei)
* Swap function names between iter_info and iter_info_len selftests.
  (Sashiko)
* v2: https://lore.kernel.org/bpf/20261114150610.84507-1-leon.hwang@linux.dev/

v1 -> v2:
* Add log_opts support for bpf_program__attach_iter() API in libbpf.
* Add test to verify the log for freplace max_ctx_offset case.
* Update a subtest to verify the log_opts in bpf_program__attach_iter()
  API.
* Add log for freplace max_ctx_offset case. (bot+bpf-ci)
* Drop unnecessary bpf_verifier.h include. (bot+bpf-ci)
* Change log to "Invalid tracing attach_type.\n" when the link
  attach_type is not prog->expected_attach_type. (bot+bpf-ci)
* Change BPF_XDP to BPF_TRACE_FEXIT in tracing link_create test.
  (bot+bpf-ci)
* Drop dead iter.len check in libbpf. (bot+bpf-ci, Sashiko)
* Add OPTS_ZEROED(opts, iter) check. (bot+bpf-ci, Sashiko)
* Swap log positions of iter_info and iter_info_len. (Sashiko)
* Update bpf_program__attach_iter() to use iter.info and iter.len.
  (Sashiko)
* v1: https://lore.kernel.org/bpf/20261109140816.5196-1-leon.hwang@linux.dev/

Leon Hwang (9):
  bpf: Add log support for tracing link_create
  bpf: Add log support for tracing_multi link_create
  bpf: Add log support for iter link_create
  bpf: Add log support for cgroup prog link_create
  libbpf: Add log_opts support for BPF_TRACE_ITER
  selftests/bpf: Test tracing link_create logs
  selftests/bpf: Test tracing_multi link_create logs
  selftests/bpf: Verify iter link_create logs
  selftests/bpf: Verify cgroup prog link_create logs

 include/linux/bpf-cgroup.h                    |   6 +-
 include/linux/bpf.h                           |   9 +-
 include/linux/bpf_verifier.h                  |   3 +-
 include/linux/trace_events.h                  |   7 +-
 kernel/bpf/bpf_iter.c                         |  27 +-
 kernel/bpf/cgroup.c                           |  76 +-
 kernel/bpf/syscall.c                          |  30 +-
 kernel/bpf/trampoline.c                       |   5 +-
 kernel/bpf/verifier.c                         |  51 +-
 kernel/trace/bpf_trace.c                      |  27 +-
 tools/lib/bpf/bpf.c                           |  23 +-
 tools/lib/bpf/bpf.h                           |   8 +
 tools/lib/bpf/libbpf.c                        |   5 +-
 tools/lib/bpf/libbpf.h                        |   3 +-
 .../selftests/bpf/prog_tests/cgroup_link.c    | 324 ++++++++
 .../selftests/bpf/prog_tests/iter_link.c      | 156 ++++
 .../selftests/bpf/prog_tests/tracing_link.c   | 741 ++++++++++++++++++
 .../selftests/bpf/progs/tracing_link_ctx.c    |  17 +
 .../selftests/bpf/progs/tracing_link_multi.c  |  36 +
 .../selftests/bpf/test_kmods/bpf_testmod.c    |   5 +
 20 files changed, 1484 insertions(+), 75 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/iter_link.c
 create mode 100644 tools/testing/selftests/bpf/prog_tests/tracing_link.c
 create mode 100644 tools/testing/selftests/bpf/progs/tracing_link_ctx.c
 create mode 100644 tools/testing/selftests/bpf/progs/tracing_link_multi.c

-- 
2.55.0

