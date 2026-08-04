Received: from out-165.mta1.migadu.com (out-165.mta1.migadu.com [95.215.58.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E978A46D551
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 14:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785855488; cv=none; b=h5gOTs0qcvt5mx4BKV/XuWrypDrjC5PUHGYS+jaHbkjb3vR+6pC6B6VPRAa4SivrMo0mykHi548CXZSXt2SVKJBlQR7cYXe2AnYL/taNbKZzAko7dOSKRQ2sW8JQCAaKXIUCeS34Br+rN5eHGpvwDTtacNqr5B5qjoPCsl/VrVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785855488; c=relaxed/simple;
	bh=ArRkU7RXkXJPQgDlD1hkgxUxaScBlomq6HnbZq6kUJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QHsX0CNFdRJ7ZwU8d82xJhMM2xHPbJj829Ex2gN5ErujDVDvYRdLF5sDR7nVs1ES61LRCKksiHVLXpy8+jDTrBmn5bXgPvrPnOhh9yo7SawOQFOEbQaJUGFi9fB504dwZcP2jaRjX25gUFvgOS3mWqfejdAdvdTX7nVYEb+lR3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MALbJcyJ; arc=none smtp.client-ip=95.215.58.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MALbJcyJ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785855469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RghPM1u2T+6y3vNEtKyQ684wTecvoQm8vEjYVhkxYx0=;
	b=MALbJcyJV+IPMrqXFzmiM/S4agQ7rl9PEKMgcXKFdOUVK2vUqvCm2qGRivM1i//We4H48l
	JveISNTEeo3TVGti2klIdS/kbc+sXddZEOyGl2kpNELh8IVpUXGm9Q9sYwRI5glDGBs/mM
	YaYU2A7Q+CPsCiW2cFTjrXf6/fDH6fo=
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
	Shuah Khan <shuah@kernel.org>,
	Sechang Lim <rhkrqnwk98@gmail.com>,
	Varun R Mallya <varunrmallya@gmail.com>,
	Leon Hwang <leon.hwang@linux.dev>,
	Viktor Malik <vmalik@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH bpf-next v3 0/2] bpf: Fix sleepable check for tracing prog
Date: Tue,  4 Aug 2026 22:57:08 +0800
Message-ID: <20260804145710.43062-1-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

When CONFIG_FUNCTION_ERROR_INJECTION is disabled, a sleepable tracing prog
is allowed to attach to '__x64_'-alike prefix symbols.

It is because the verifier does not verify whether the symbol is a kernel
function or a bpf prog. That said, a sleepable tracing prog is allowed to
attach to a bpf prog target whose name has '__x64_'-alike prefix.

For example, a sleepable fentry prog attaches to a '__x64_sys_nop' XDP
prog, and copies buffer from a user pointer with bpf_copy_from_user()
helper. After attaching the XDP prog to lo interface, the kernel BUG
could be triggered by 'ping -c 1 -W 1 127.0.0.1':

[    3.460756] BUG: sleeping function called from invalid context at kernel/bpf/trampoline.c:1324

Fix it by disallowing sleepable tracing prog always when its target btf
is not kernel's btf.

Changes:
v2 -> v3:
* Use btf_is_kernel() instead of passing 'tgt_prog'. (per Andrii)
* v2: https://lore.kernel.org/bpf/20260725132624.78373-1-leon.hwang@linux.dev/

v1 -> v2:
* Drop redundant 'prog->sleepable' check. (per Viktor)
* Collect Acked-by from Viktor, Thanks.
* v1: https://lore.kernel.org/bpf/20260724141422.10463-1-leon.hwang@linux.dev/

Leon Hwang (2):
  bpf: Fix sleepable check for tracing prog
  selftests/bpf: Verify rejection of sleepable tracing prog

 kernel/bpf/verifier.c                         |  3 +
 .../selftests/bpf/prog_tests/fexit_bpf2bpf.c  | 57 +++++++++++++++++++
 .../selftests/bpf/progs/fentry_sleepable.c    | 18 ++++++
 tools/testing/selftests/bpf/progs/xdp_dummy.c |  6 ++
 4 files changed, 84 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/progs/fentry_sleepable.c

--
2.55.0
