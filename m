Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795823145;
	b=gdnImE4tWAc9PrDTJCFH9wUIewDzMjrvvjkc7axZQZiLFOKeuyb7FbA5wm1GKegzwW4C
	 Pk2ZdMD589wn3tuobUu3niWjGH99V17SAssAbQJvKYvMm2aqmeZPdJASObiq6Ibd9Bw32
	 UZ26sR1CEWkmmTsX0GVvNBf7/xIIl8STNyajQ+2CdHJY2lobrKmPdPrD1L95xVksMk3Ud
	 qHB0h5koGOSs04rmb3sYJs01Tx17SJTzJFPreZ9PbzhWcjKuOfvZR0ZRWIZcv7/aNtKLM
	 Zd56zshe4PK53sIRPvJ01cSsPlxO6Go/Wn/Vd3oV0L2aQKWJDMOqql9dMOm5VL9n4ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795823145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=0JYQL+cloTOFKXdKvvfoQThZrj8EkD9DkZga/ImDFNc=;
	b=B+LwUUpzZR5NxZJlqYny1AnZqGSLJbEN92KJJG3mcAZZdYSC7GsSZRuAb91RTX37Hls6
	 mG0Aft2dYcVw72OexDdvLXqyt8PjTLyK0T2gcQQmoBMePFHkAHzzaq5fYrveytQ/oOIR5
	 SxSejcGNEgPkByWee23mwOCNQz9GWDPXkQRdNf8XaJ+nUZH2C013zkHTrQfPJ+qvtglBb
	 vDFfacM0CXLyU0U1OQK7lFY7bBY0xKI4Ev1q9pxct1oSPbJlz2g3upZDbWSJDkFXcwMhL
	 pCShMnE/wPVgiQBY+tlXRG7O/HOl3LqT/3mXiDpCLNXPd0coQD969zL48tqjjSSuQKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lE9qoqAA;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACD5606A31E
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 23:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ACD5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lE9qoqAA
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f04fab527eso65015695ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 15:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795823143; x=1796427943; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0JYQL+cloTOFKXdKvvfoQThZrj8EkD9DkZga/ImDFNc=;
        b=lE9qoqAATJIFmRZNx4fp+CDcNWB0bsteQY2/N/RZRWeH9ziTbcKHeEUpSMgtR/nMxD
         N0vi75SPM6J0CCSx9SJs8GpvUXgZvNWFr4zW0yQx0/5dRbCvQx+AcK1ZhOp+7G+sfjjm
         fQ+6+yO0vZ51OxkRjpByMEIroLiBybkjDeNcurXvHRl1vUWlHQUNyyQ+W0f4RrEAA7cp
         CN526d1yB0EQL0UEqy3vOXUY34bKfXvybtGUFAUyQgOncZPDgm7QbTsMB6cP3sKDfJYL
         LwABp/fxZQCcaa6bhIPQKPH7gvWvwWoBLkOypndmN7X7tD17BjyfkLcO/iWlTMGOAdvt
         N/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795823143; x=1796427943;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0JYQL+cloTOFKXdKvvfoQThZrj8EkD9DkZga/ImDFNc=;
        b=syuL75EKjOX/lg9MUCayujZNZlwADn6RBa7X/5yyQKYrNMannX1mqfQ2lRIZJYHVKk
         Fhk+ptsRQleqaqVBtFS4lqjFwluXGLh070RDcE8gUF3vxk842CyvVlQoAZk/RRuy3e3j
         n5fY1QU/WahM5UqIbpO3I8ussIoSaSq+HM2QT4Dg1kiUT8uj1y+ABlpaVrSdEepH8RQN
         mXETx/lQAwbuex6FNXKLi+FnegHfgcHQs2U1w1qKGF2fO77sC0Hz5OaBspe0oByHav7c
         o4rqKnYDulwdo5oH3EoeMJtu6++3I80RlTMMhoLoq/fatkchTnKX9OIDfz4xTJuY3wsN
         dSDg==
X-Forwarded-Encrypted: i=1; AL+hErE5h7gajWpfM4IuTcz/FFR/fLX0VCLLwA6CBdPcLXqS6J7ctYeion+PCFf3MwGiSrwzYmjOZYXHGrpxx+L2ITA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TiHgRkS+4XrKX8zwe7EJ+3E1SiWosfgUSTO3TJ9p7omt/r67B
	a5Z3k01sP1IMSfIuVaiZxPGYICe3ojfDlCNDJMPFGnGMu126N1pYdK9m
X-Gm-Gg: AZFdTZdrnGj04b8fkof7UpXCPicr0EElZ6V1F1zM4Emz7YE78JfI3UpPX8ngy6bCbXa
	XoQydJuZWkQEBLeKq0wDMnf6LgNKaIhouFlNkYC4FswE63b8DdgPUXxD2kE7DqmwCLnrTcLh+LN
	7RyAc7OKFVZbfSjyqOPWTdt3ZKVVwPxSs68apzo2a1ROAHzM7YHnpZJXH8ExgaE1S6kNNot4ONf
	LCRMGo567HGEC4UKQzM4fcN+fiuoFa8mvEYxnCZkFrdeBNSJqPfHHaXt3LOfCezU0/m+IaN+AX1
	7zeRwG0QJY0S1NaTX59sXyi56x1r8b9n939o79bZml4G5027vKAXBv+IYAIiDhY/qdhaLeJB+39
	VxhJ+wyAx2HJ5WW2e18kOzPZdNrpuxlx3tF6bsO6HtjN3425q1YDyJGmKRzeQexZuZRMtJ2Q1zj
	ALtEgXUNbjEPCMr78tJk4OiQ3zXbBwjL1mvwt5GHH0e2Z23S8//PCkYPoqR0+sNGJz5zA35yZyN
	4mDFCuA5cdc8sU/DtJmgD96Kaumu7mPD4FYwEOEkXoJ/lb6v9wWfVmUF5jD2HAbafMUGW4DtiGg
	XLlV57HqDI5PH2JNLveOnqtS5/C6moPBpLpCDBOzpVepnY1FhW2zHXLAHMhwldHgPRZtyhI0WI3
	vIT59gOkOyj9xQhT5PK8byFH2KLfbODPcdw==
X-Received: by 2002:a17:902:f54c:b0:2f0:25ea:8fbe with SMTP id d9443c01a7336-2f03efb104cmr283988045ad.7.1795823143289;
        Fri, 27 Nov 2026 15:45:43 -0800 (PST)
Received: from localhost ([153.61.198.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dc0ebsm123686035ad.33.2026.11.27.15.45.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 15:45:42 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 23:45:42 +0000
Message-Id: <DN6E6AI3KW0Y.GIGIAPTDZFS@gmail.com>
To: "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>, "Peter Zijlstra"
 <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>
Cc: "Shuah Khan" <shuah@kernel.org>, "Aniket Gattani"
 <aniketgattani@google.com>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 <bpf@vger.kernel.org>, "Naveen N Rao" <naveen@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, "Masami Hiramatsu" <mhiramat@kernel.org>,
 <linux-trace-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 15/16] selftests/membarrier: Check the memory
 barriers of each thread
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20261127185822.158216-16-mathieu.desnoyers@efficios.com>
References: <20261127185822.158216-1-mathieu.desnoyers@efficios.com> <20261127185822.158216-16-mathieu.desnoyers@efficios.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, Nov 27, 2026 at 10:58 AM Mathieu Desnoyers <mathieu.desnoyers@efficios.com> wrote:
>  - The test lists the kernel functions which hold the instructions,
>    and the kind of instruction to look for in each. It finds them by
>    their bytes in the kernel text, which it reads from /proc/kcore.
>    The kernel refuses a kprobe which is not on the first byte of an
>    instruction, so a wrong match is dropped.

A bunch of x86 specific kprobes?
Wow. I haven't seen such a heavy duty selftest before.
I'm glad that it works, but I asked my bot for a simpler solution...

ipi_mb(), ipi_sync_core() and ipi_rseq() are straight-line code.
smp_mb() is their first statement. A call of the handler is an
executed barrier.
csd_do_func() has trace_csd_function_entry(func, csd) right before
func(info).

count the IPIs there instead:

                   kprobe on the insn          csd_function_entry
  ---------------  --------------------------  ----------------------
  finds the place  kallsyms, kcore, opcodes    __ksym, libbpf does it
  arch             x86-64                      all
  lost hits        nested kprobe,              none, irqs are off
                   bpf_prog_active
  global state     kprobes-optimization = 0    none

read_kernel(), scan_function(), probe_sites(), sites[], the cookies,
set_optprobes(), the signal handlers and the "probe hits were lost"
warning go away.

diff --git a/tools/testing/selftests/membarrier/membarrier_test_barrier.bpf.c b/tools/testing/selftests/membarrier/membarrier_test_barrier.bpf.c
new file mode 100644
index 0000000..ffaa899
--- /dev/null
+++ b/tools/testing/selftests/membarrier/membarrier_test_barrier.bpf.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Count the membarrier IPIs and the context switches of each registered
+ * thread.
+ *
+ * See membarrier_test_barrier.c.
+ */
+#include <stdbool.h>
+#include <linux/bpf.h>
+#include <bpf/bpf_helpers.h>
+#include <bpf/bpf_tracing.h>
+
+#include "membarrier_test_barrier.h"
+
+struct mm_struct;
+
+/* The fields which this program reads. CO-RE relocates them. */
+struct task_struct {
+	struct mm_struct *mm;
+} __attribute__((preserve_access_index));
+
+/*
+ * The IPI handlers. libbpf finds them in /proc/kallsyms. The address is 0
+ * when the kernel has no such handler.
+ */
+extern const void ipi_mb __ksym __weak;
+extern const void ipi_sync_core __ksym __weak;
+extern const void ipi_rseq __ksym __weak;
+
+/* Slot of a registered thread. */
+struct {
+	__uint(type, BPF_MAP_TYPE_TASK_STORAGE);
+	__uint(map_flags, BPF_F_NO_PREALLOC);
+	__type(key, int);
+	__type(value, __u32);
+} task_slot SEC(".maps");
+
+/* The counters of each slot. User-space maps them. */
+struct {
+	__uint(type, BPF_MAP_TYPE_ARRAY);
+	__uint(map_flags, BPF_F_MMAPABLE);
+	__uint(max_entries, MBT_MAX_SLOTS);
+	__type(key, __u32);
+	__type(value, struct mbt_counters);
+} counters SEC(".maps");
+
+/*
+ * Only the CPU which runs a thread, or which switches to it, counts for
+ * that thread. So the increments need no lock.
+ */
+static __always_inline struct mbt_counters *counters_of(struct task_struct *task)
+{
+	__u32 *slot = bpf_task_storage_get(&task_slot, task, 0, 0);
+
+	return slot ? bpf_map_lookup_elem(&counters, slot) : NULL;
+}
+
+/* csd_do_func() is about to call func(). Interrupts are disabled. */
+SEC("tp_btf/csd_function_entry")
+int BPF_PROG(csd_function_entry, void *func)
+{
+	struct mbt_counters *c;
+
+	if (func != &ipi_mb && func != &ipi_sync_core && func != &ipi_rseq)
+		return 0;
+	c = counters_of(bpf_get_current_task_btf());
+	if (!c)
+		return 0;
+	c->c[MBT_IPI]++;
+	if (func == &ipi_sync_core)
+		c->c[MBT_SYNC_CORE]++;
+	return 0;
+}
+
+SEC("tp_btf/sched_switch")
+int BPF_PROG(sched_switch, bool preempt, struct task_struct *prev,
+	     struct task_struct *next)
+{
+	struct mbt_counters *c;
+
+	c = counters_of(prev);
+	if (c)
+		c->c[MBT_SCHED_OUT]++;
+	if (!next->mm || prev->mm == next->mm)
+		return 0;
+	c = counters_of(next);
+	if (c)
+		c->c[MBT_SCHED_IN]++;
+	return 0;
+}
+
+/* Give a slot to the calling thread. User-space runs this program. */
+SEC("syscall")
+int register_thread(struct mbt_register *ctx)
+{
+	__u32 slot = ctx->slot;
+
+	if (!bpf_task_storage_get(&task_slot, bpf_get_current_task_btf(), &slot,
+				  BPF_LOCAL_STORAGE_GET_F_CREATE))
+		return -1;
+	return 0;
+}
+
+char _license[] SEC("license") = "GPL";
diff --git a/tools/testing/selftests/membarrier/membarrier_test_barrier.h b/tools/testing/selftests/membarrier/membarrier_test_barrier.h
new file mode 100644
index 0000000..da8edfd
--- /dev/null
+++ b/tools/testing/selftests/membarrier/membarrier_test_barrier.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef MEMBARRIER_TEST_BARRIER_H
+#define MEMBARRIER_TEST_BARRIER_H
+
+#include <linux/types.h>
+
+/* Counters of a thread. */
+enum {
+	/* A membarrier IPI handler interrupted the thread. */
+	MBT_IPI,
+	/* The handler was ipi_sync_core(). */
+	MBT_SYNC_CORE,
+	/* The thread was scheduled out. */
+	MBT_SCHED_OUT,
+	/*
+	 * The thread was scheduled in after a task of another mm, or
+	 * after a kernel thread.
+	 */
+	MBT_SCHED_IN,
+	MBT_NR_COUNTERS,
+};
+
+struct mbt_counters {
+	__u64 c[16];
+};
+
+/* Argument of the register_thread program. */
+struct mbt_register {
+	__u32 slot;
+};
+
+#define MBT_MAX_SLOTS		512
+
+#endif /* MEMBARRIER_TEST_BARRIER_H */

pw-bot: cr
