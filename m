Received: from mta0.migadu.com (out-120.mta0.migadu.com [91.218.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30B63F4854
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 05:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787288594; cv=none; b=dBXcjr0kGlkJ+d4KJvtyjsdXZCDxlKmOU4MViB2/5nmYrfEQg0mIKyTEowe4NT45kgRJoXQfr9Af17iVHelGy6Kmbj3uu2SohJtZzfn10q+AsXCL5IKelJ5bk8lyJycABUJ6gn41+FwUkzSbrLsvWyzOqy1flAbICHVIydnMpY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787288594; c=relaxed/simple;
	bh=8e3YUmUVq9LXBtfSpghJpybxCk6jcc9EbZkyE/Avoqw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mwN80dlK/inbSPR3ZQ0c7JZNxMJFS+ztX5rxE/DWHk1yQK74l0PKzsQuTWRMhpy1xGy8KX1zXAAkgaCb2wFZmYdOQjOwOqudemSNyN0ckC9jIl54aIbVujm5XtavtGfxikMqkxkAq4zhQWsjsISULkbflNIIiuBRWkL7dMge6/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CVHRQ3vO; arc=none smtp.client-ip=91.218.175.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CVHRQ3vO"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8e3YUmUVq9LXBtfSpghJpybxCk6jcc9EbZkyE/Avoqw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787288588; v=1; x=1787893388;
 b=CVHRQ3vOWNEAtdo5oJUYVIVGF27o4+zAO0Wk8C7oNAU3rlbQURzVB1dnIuNrMFRHFHdRC4cr
 bRXoHS64j8qn0dbA3dov3tZrLb54EcsIRDMHN4HcV5LtXtibkoLb6D6XeUwhd8yZFPconHuA2IY
 j17HuqlKWZVBhfs+tA7wUQ7Q=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: from localhost.localdomain (147.136.157.1)
	by smtp.migadu.com with ESMTPS id 904cbd7780a28367;
	Fri, 21 Aug 2026 05:03:08 +0000
X-Mizu-Trace-ID: 904cbd7780a28367
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: bpf@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH bpf-next v4 0/4] bpf: arena: handle memory.max on fault-in with reclaim/OOM
Date: Fri, 21 Aug 2026 13:01:19 +0800
Message-ID: <20260821050250.35112-1-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit e66fe1bc6d25 ("bpf: arena: Reintroduce memcg accounting"),
arena pages are charged to the memcg of the process that created the arena.
That accounting exposes two problems in the arena user page fault path.

1. The fault-in allocation runs under arena->spinlock, so it can only use the
   non-blocking allocator, which never reclaims. Once memory.current is at
   memory.max the allocation simply fails. Reaching memory.max is completely
   normal for a healthy application - e.g. reading a large file fills
   memory.current with page cache - so the process ends up killed for no real
   reason.

2. That failure is turned into VM_FAULT_SIGSEGV, which is misleading: the
   faulting address is a perfectly valid arena address. When we know it is an
   out-of-memory condition we can return VM_FAULT_OOM and let the memcg OOM
   path handle it properly.

Preallocate the page outside the lock (patch 2), the way do_anonymous_page()
does, so the allocation can sleep and go through reclaim and the OOM path.
This needs a sleepable allocator (patch 1), because can_alloc_pages() is a
conservative guess for BPF program context and always forces the non-blocking
allocator under PREEMPT_RT. patch 3&4 adds a selftest that faults an arena in
under a memory.max limit: without the fix the child gets SIGSEGV on a valid
address, with it the child is killed by the memcg OOM killer.


v3 -> v4:
   - rebase bpf-next and fix conflict
   - add Reviewed-by tag from Emil Tsalapatis

v2 -> v3:
   - selftest: check the memcg OOM via memory.events "oom_kill" instead of
     the exit signal; it only aims to pass on the fixed kernel, since the
     unfixed SIGSEGV is racy.

v1 -> v2:
   - Rebase on the separate deadlock fix (found by the Sashiko AI review),
     now applied to bpf-next.
   - Honor the map's NUMA node on fault-in.
   - Return VM_FAULT_SIGBUS for the non-recoverable faults (lock, range-tree
     and page-table failures); a scratch-page hole stays VM_FAULT_SIGSEGV
     only under BPF_F_SEGV_ON_FAULT. (Kumar Kartikeya Dwivedi)
   - Add read_cgroup_file() to cgroup_helpers instead of open-coding the
     /mnt/... path in the test. (Emil Tsalapatis)
   - Dump the cgroup memory stats on test failure to ease debugging.

v2:
https://lore.kernel.org/bpf/20260805091720.139924-1-jiayuan.chen@linux.dev/
v1:
https://lore.kernel.org/bpf/20260727062521.376231-1-jiayuan.chen@linux.dev/

Jiayuan Chen (4):
  bpf: Add a sleepable page allocator for map memory
  bpf: arena: allocate the fault-in page outside the lock
  selftests/bpf: Add read_cgroup_file() to cgroup_helpers
  selftests/bpf: Add a test for arena fault-in under memory.max

 include/linux/bpf.h                           |   1 +
 kernel/bpf/arena.c                            |  92 ++++++++---
 kernel/bpf/syscall.c                          |  21 ++-
 tools/testing/selftests/bpf/cgroup_helpers.c  |  67 ++++++++
 tools/testing/selftests/bpf/cgroup_helpers.h  |   4 +
 .../selftests/bpf/prog_tests/arena_memcg.c    | 156 ++++++++++++++++++
 .../testing/selftests/bpf/progs/arena_memcg.c |  24 +++
 7 files changed, 340 insertions(+), 25 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/arena_memcg.c
 create mode 100644 tools/testing/selftests/bpf/progs/arena_memcg.c

-- 
2.43.0

