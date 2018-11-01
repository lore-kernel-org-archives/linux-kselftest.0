From: mathieu.desnoyers@efficios.com (Mathieu Desnoyers)
Date: Thu,  1 Nov 2018 10:58:41 +0100
Subject: [RFC PATCH for 4.21 13/16] cpu-opv/selftests: Provide percpu_op API
In-Reply-To: <20181101095844.24462-1-mathieu.desnoyers@efficios.com>
References: <20181101095844.24462-1-mathieu.desnoyers@efficios.com>
Message-ID: <20181101095844.24462-14-mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181101095841.9peN2g1cysUipWeSTjOuHGvdsWZ7W99cRKQHhdPWwDI@z>

Introduce percpu-op.h API. It uses rseq internally as fast-path if
invoked from the right CPU, else cpu_opv as slow-path if called
from the wrong CPU or if rseq fails.

This allows acting on per-cpu data from various CPUs transparently from
user-space: cpu_opv will take care of migrating the thread to the
requested CPU. Use-cases such as rebalancing memory across per-cpu
memory pools, or migrating tasks for a user-space scheduler, are thus
facilitated. This also handles debugger single-stepping.

The use from userspace is, e.g. for a counter increment:

    int cpu, ret;

    cpu = percpu_current_cpu();
    ret = percpu_addv(&data->c[cpu].count, 1, cpu);
    if (unlikely(ret)) {
         perror("percpu_addv");
         return -1;
    }
    return 0;

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers at efficios.com>
CC: Shuah Khan <shuah at kernel.org>
CC: Russell King <linux at arm.linux.org.uk>
CC: Catalin Marinas <catalin.marinas at arm.com>
CC: Will Deacon <will.deacon at arm.com>
CC: Thomas Gleixner <tglx at linutronix.de>
CC: Paul Turner <pjt at google.com>
CC: Peter Zijlstra <peterz at infradead.org>
CC: Andy Lutomirski <luto at amacapital.net>
CC: Andi Kleen <andi at firstfloor.org>
CC: Dave Watson <davejwatson at fb.com>
CC: Chris Lameter <cl at linux.com>
CC: Ingo Molnar <mingo at redhat.com>
CC: "H. Peter Anvin" <hpa at zytor.com>
CC: Ben Maurer <bmaurer at fb.com>
CC: Steven Rostedt <rostedt at goodmis.org>
CC: "Paul E. McKenney" <paulmck at linux.vnet.ibm.com>
CC: Josh Triplett <josh at joshtriplett.org>
CC: Linus Torvalds <torvalds at linux-foundation.org>
CC: Andrew Morton <akpm at linux-foundation.org>
CC: Boqun Feng <boqun.feng at gmail.com>
CC: linux-kselftest at vger.kernel.org
CC: linux-api at vger.kernel.org
---
 tools/testing/selftests/cpu-opv/percpu-op.h | 151 ++++++++++++++++++++++++++++
 1 file changed, 151 insertions(+)
 create mode 100644 tools/testing/selftests/cpu-opv/percpu-op.h

diff --git a/tools/testing/selftests/cpu-opv/percpu-op.h b/tools/testing/selftests/cpu-opv/percpu-op.h
new file mode 100644
index 000000000000..918171e585d7
--- /dev/null
+++ b/tools/testing/selftests/cpu-opv/percpu-op.h
@@ -0,0 +1,151 @@
+/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
+/*
+ * percpu-op.h
+ *
+ * (C) Copyright 2017-2018 - Mathieu Desnoyers <mathieu.desnoyers at efficios.com>
+ */
+
+#ifndef PERCPU_OP_H
+#define PERCPU_OP_H
+
+#include <stdint.h>
+#include <stdbool.h>
+#include <errno.h>
+#include <stdlib.h>
+#include "rseq.h"
+#include "cpu-op.h"
+
+static inline uint32_t percpu_current_cpu(void)
+{
+	return rseq_current_cpu();
+}
+
+static inline __attribute__((always_inline))
+int percpu_cmpeqv_storev(intptr_t *v, intptr_t expect, intptr_t newv,
+			 int cpu)
+{
+	int ret;
+
+	ret = rseq_cmpeqv_storev(v, expect, newv, cpu);
+	if (rseq_unlikely(ret)) {
+		if (ret > 0)
+			return ret;
+		return cpu_op_cmpeqv_storev(v, expect, newv, cpu);
+	}
+	return 0;
+}
+
+static inline __attribute__((always_inline))
+int percpu_cmpnev_storeoffp_load(intptr_t *v, intptr_t expectnot,
+			       off_t voffp, intptr_t *load, int cpu)
+{
+	int ret;
+
+	ret = rseq_cmpnev_storeoffp_load(v, expectnot, voffp, load, cpu);
+	if (rseq_unlikely(ret)) {
+		if (ret > 0)
+			return ret;
+		return cpu_op_cmpnev_storeoffp_load(v, expectnot, voffp,
+						    load, cpu);
+	}
+	return 0;
+}
+
+static inline __attribute__((always_inline))
+int percpu_addv(intptr_t *v, intptr_t count, int cpu)
+{
+	if (rseq_unlikely(rseq_addv(v, count, cpu)))
+		return cpu_op_addv(v, count, cpu);
+	return 0;
+}
+
+static inline __attribute__((always_inline))
+int percpu_cmpeqv_storev_storev(intptr_t *v, intptr_t expect,
+				intptr_t *v2, intptr_t newv2,
+				intptr_t newv, int cpu)
+{
+	int ret;
+
+	ret = rseq_cmpeqv_trystorev_storev(v, expect, v2, newv2,
+					   newv, cpu);
+	if (rseq_unlikely(ret)) {
+		if (ret > 0)
+			return ret;
+		return cpu_op_cmpeqv_storev_storev(v, expect, v2, newv2,
+						   newv, cpu);
+	}
+	return 0;
+}
+
+static inline __attribute__((always_inline))
+int percpu_cmpeqv_storev_storev_release(intptr_t *v, intptr_t expect,
+					intptr_t *v2, intptr_t newv2,
+					intptr_t newv, int cpu)
+{
+	int ret;
+
+	ret = rseq_cmpeqv_trystorev_storev_release(v, expect, v2, newv2,
+						   newv, cpu);
+	if (rseq_unlikely(ret)) {
+		if (ret > 0)
+			return ret;
+		return cpu_op_cmpeqv_storev_storev_release(v, expect, v2, newv2,
+							   newv, cpu);
+	}
+	return 0;
+}
+
+static inline __attribute__((always_inline))
+int percpu_cmpeqv_cmpeqv_storev(intptr_t *v, intptr_t expect,
+				intptr_t *v2, intptr_t expect2,
+				intptr_t newv, int cpu)
+{
+	int ret;
+
+	ret = rseq_cmpeqv_cmpeqv_storev(v, expect, v2, expect2, newv, cpu);
+	if (rseq_unlikely(ret)) {
+		if (ret > 0)
+			return ret;
+		return cpu_op_cmpeqv_cmpeqv_storev(v, expect, v2, expect2,
+						   newv, cpu);
+	}
+	return 0;
+}
+
+static inline __attribute__((always_inline))
+int percpu_cmpeqv_memcpy_storev(intptr_t *v, intptr_t expect,
+				void *dst, void *src, size_t len,
+				intptr_t newv, int cpu)
+{
+	int ret;
+
+	ret = rseq_cmpeqv_trymemcpy_storev(v, expect, dst, src, len,
+					   newv, cpu);
+	if (rseq_unlikely(ret)) {
+		if (ret > 0)
+			return ret;
+		return cpu_op_cmpeqv_memcpy_storev(v, expect, dst, src, len,
+						   newv, cpu);
+	}
+	return 0;
+}
+
+static inline __attribute__((always_inline))
+int percpu_cmpeqv_memcpy_storev_release(intptr_t *v, intptr_t expect,
+					void *dst, void *src, size_t len,
+					intptr_t newv, int cpu)
+{
+	int ret;
+
+	ret = rseq_cmpeqv_trymemcpy_storev_release(v, expect, dst, src, len,
+						   newv, cpu);
+	if (rseq_unlikely(ret)) {
+		if (ret > 0)
+			return ret;
+		return cpu_op_cmpeqv_memcpy_storev_release(v, expect, dst, src,
+							   len, newv, cpu);
+	}
+	return 0;
+}
+
+#endif  /* PERCPU_OP_H_ */
-- 
2.11.0
