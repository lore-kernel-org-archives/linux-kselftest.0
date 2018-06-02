From: mathieu.desnoyers at efficios.com (Mathieu Desnoyers)
Date: Sat,  2 Jun 2018 08:44:06 -0400
Subject: [RFC PATCH for 4.18 14/16] rseq: selftests: Provide basic percpu ops
 test (v2)
In-Reply-To: <20180602124408.8430-1-mathieu.desnoyers@efficios.com>
References: <20180602124408.8430-1-mathieu.desnoyers@efficios.com>
Message-ID: <20180602124408.8430-15-mathieu.desnoyers@efficios.com>

"basic_percpu_ops_test" is a slightly more "realistic" variant,
implementing a few simple per-cpu operations and testing their
correctness.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers at efficios.com>
CC: Shuah Khan <shuahkh at osg.samsung.com>
CC: Russell King <linux at arm.linux.org.uk>
CC: Catalin Marinas <catalin.marinas at arm.com>
CC: Will Deacon <will.deacon at arm.com>
CC: Thomas Gleixner <tglx at linutronix.de>
CC: Paul Turner <pjt at google.com>
CC: Andrew Hunter <ahh at google.com>
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
Changes since v1:
- Use only rseq, remove use of cpu_opv system call.
---
 .../testing/selftests/rseq/basic_percpu_ops_test.c | 313 +++++++++++++++++++++
 1 file changed, 313 insertions(+)
 create mode 100644 tools/testing/selftests/rseq/basic_percpu_ops_test.c

diff --git a/tools/testing/selftests/rseq/basic_percpu_ops_test.c b/tools/testing/selftests/rseq/basic_percpu_ops_test.c
new file mode 100644
index 000000000000..96ef27905879
--- /dev/null
+++ b/tools/testing/selftests/rseq/basic_percpu_ops_test.c
@@ -0,0 +1,313 @@
+// SPDX-License-Identifier: LGPL-2.1
+#define _GNU_SOURCE
+#include <assert.h>
+#include <pthread.h>
+#include <sched.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <stddef.h>
+
+#include "rseq.h"
+
+#define ARRAY_SIZE(arr)	(sizeof(arr) / sizeof((arr)[0]))
+
+struct percpu_lock_entry {
+	intptr_t v;
+} __attribute__((aligned(128)));
+
+struct percpu_lock {
+	struct percpu_lock_entry c[CPU_SETSIZE];
+};
+
+struct test_data_entry {
+	intptr_t count;
+} __attribute__((aligned(128)));
+
+struct spinlock_test_data {
+	struct percpu_lock lock;
+	struct test_data_entry c[CPU_SETSIZE];
+	int reps;
+};
+
+struct percpu_list_node {
+	intptr_t data;
+	struct percpu_list_node *next;
+};
+
+struct percpu_list_entry {
+	struct percpu_list_node *head;
+} __attribute__((aligned(128)));
+
+struct percpu_list {
+	struct percpu_list_entry c[CPU_SETSIZE];
+};
+
+/* A simple percpu spinlock.  Returns the cpu lock was acquired on. */
+int rseq_this_cpu_lock(struct percpu_lock *lock)
+{
+	int cpu;
+
+	for (;;) {
+		int ret;
+
+		cpu = rseq_cpu_start();
+		ret = rseq_cmpeqv_storev(&lock->c[cpu].v,
+					 0, 1, cpu);
+		if (rseq_likely(!ret))
+			break;
+		/* Retry if comparison fails or rseq aborts. */
+	}
+	/*
+	 * Acquire semantic when taking lock after control dependency.
+	 * Matches rseq_smp_store_release().
+	 */
+	rseq_smp_acquire__after_ctrl_dep();
+	return cpu;
+}
+
+void rseq_percpu_unlock(struct percpu_lock *lock, int cpu)
+{
+	assert(lock->c[cpu].v == 1);
+	/*
+	 * Release lock, with release semantic. Matches
+	 * rseq_smp_acquire__after_ctrl_dep().
+	 */
+	rseq_smp_store_release(&lock->c[cpu].v, 0);
+}
+
+void *test_percpu_spinlock_thread(void *arg)
+{
+	struct spinlock_test_data *data = arg;
+	int i, cpu;
+
+	if (rseq_register_current_thread()) {
+		fprintf(stderr, "Error: rseq_register_current_thread(...) failed(%d): %s\n",
+			errno, strerror(errno));
+		abort();
+	}
+	for (i = 0; i < data->reps; i++) {
+		cpu = rseq_this_cpu_lock(&data->lock);
+		data->c[cpu].count++;
+		rseq_percpu_unlock(&data->lock, cpu);
+	}
+	if (rseq_unregister_current_thread()) {
+		fprintf(stderr, "Error: rseq_unregister_current_thread(...) failed(%d): %s\n",
+			errno, strerror(errno));
+		abort();
+	}
+
+	return NULL;
+}
+
+/*
+ * A simple test which implements a sharded counter using a per-cpu
+ * lock.  Obviously real applications might prefer to simply use a
+ * per-cpu increment; however, this is reasonable for a test and the
+ * lock can be extended to synchronize more complicated operations.
+ */
+void test_percpu_spinlock(void)
+{
+	const int num_threads = 200;
+	int i;
+	uint64_t sum;
+	pthread_t test_threads[num_threads];
+	struct spinlock_test_data data;
+
+	memset(&data, 0, sizeof(data));
+	data.reps = 5000;
+
+	for (i = 0; i < num_threads; i++)
+		pthread_create(&test_threads[i], NULL,
+			       test_percpu_spinlock_thread, &data);
+
+	for (i = 0; i < num_threads; i++)
+		pthread_join(test_threads[i], NULL);
+
+	sum = 0;
+	for (i = 0; i < CPU_SETSIZE; i++)
+		sum += data.c[i].count;
+
+	assert(sum == (uint64_t)data.reps * num_threads);
+}
+
+void this_cpu_list_push(struct percpu_list *list,
+			struct percpu_list_node *node,
+			int *_cpu)
+{
+	int cpu;
+
+	for (;;) {
+		intptr_t *targetptr, newval, expect;
+		int ret;
+
+		cpu = rseq_cpu_start();
+		/* Load list->c[cpu].head with single-copy atomicity. */
+		expect = (intptr_t)RSEQ_READ_ONCE(list->c[cpu].head);
+		newval = (intptr_t)node;
+		targetptr = (intptr_t *)&list->c[cpu].head;
+		node->next = (struct percpu_list_node *)expect;
+		ret = rseq_cmpeqv_storev(targetptr, expect, newval, cpu);
+		if (rseq_likely(!ret))
+			break;
+		/* Retry if comparison fails or rseq aborts. */
+	}
+	if (_cpu)
+		*_cpu = cpu;
+}
+
+/*
+ * Unlike a traditional lock-less linked list; the availability of a
+ * rseq primitive allows us to implement pop without concerns over
+ * ABA-type races.
+ */
+struct percpu_list_node *this_cpu_list_pop(struct percpu_list *list,
+					   int *_cpu)
+{
+	for (;;) {
+		struct percpu_list_node *head;
+		intptr_t *targetptr, expectnot, *load;
+		off_t offset;
+		int ret, cpu;
+
+		cpu = rseq_cpu_start();
+		targetptr = (intptr_t *)&list->c[cpu].head;
+		expectnot = (intptr_t)NULL;
+		offset = offsetof(struct percpu_list_node, next);
+		load = (intptr_t *)&head;
+		ret = rseq_cmpnev_storeoffp_load(targetptr, expectnot,
+						 offset, load, cpu);
+		if (rseq_likely(!ret)) {
+			if (_cpu)
+				*_cpu = cpu;
+			return head;
+		}
+		if (ret > 0)
+			return NULL;
+		/* Retry if rseq aborts. */
+	}
+}
+
+/*
+ * __percpu_list_pop is not safe against concurrent accesses. Should
+ * only be used on lists that are not concurrently modified.
+ */
+struct percpu_list_node *__percpu_list_pop(struct percpu_list *list, int cpu)
+{
+	struct percpu_list_node *node;
+
+	node = list->c[cpu].head;
+	if (!node)
+		return NULL;
+	list->c[cpu].head = node->next;
+	return node;
+}
+
+void *test_percpu_list_thread(void *arg)
+{
+	int i;
+	struct percpu_list *list = (struct percpu_list *)arg;
+
+	if (rseq_register_current_thread()) {
+		fprintf(stderr, "Error: rseq_register_current_thread(...) failed(%d): %s\n",
+			errno, strerror(errno));
+		abort();
+	}
+
+	for (i = 0; i < 100000; i++) {
+		struct percpu_list_node *node;
+
+		node = this_cpu_list_pop(list, NULL);
+		sched_yield();  /* encourage shuffling */
+		if (node)
+			this_cpu_list_push(list, node, NULL);
+	}
+
+	if (rseq_unregister_current_thread()) {
+		fprintf(stderr, "Error: rseq_unregister_current_thread(...) failed(%d): %s\n",
+			errno, strerror(errno));
+		abort();
+	}
+
+	return NULL;
+}
+
+/* Simultaneous modification to a per-cpu linked list from many threads.  */
+void test_percpu_list(void)
+{
+	int i, j;
+	uint64_t sum = 0, expected_sum = 0;
+	struct percpu_list list;
+	pthread_t test_threads[200];
+	cpu_set_t allowed_cpus;
+
+	memset(&list, 0, sizeof(list));
+
+	/* Generate list entries for every usable cpu. */
+	sched_getaffinity(0, sizeof(allowed_cpus), &allowed_cpus);
+	for (i = 0; i < CPU_SETSIZE; i++) {
+		if (!CPU_ISSET(i, &allowed_cpus))
+			continue;
+		for (j = 1; j <= 100; j++) {
+			struct percpu_list_node *node;
+
+			expected_sum += j;
+
+			node = malloc(sizeof(*node));
+			assert(node);
+			node->data = j;
+			node->next = list.c[i].head;
+			list.c[i].head = node;
+		}
+	}
+
+	for (i = 0; i < 200; i++)
+		pthread_create(&test_threads[i], NULL,
+		       test_percpu_list_thread, &list);
+
+	for (i = 0; i < 200; i++)
+		pthread_join(test_threads[i], NULL);
+
+	for (i = 0; i < CPU_SETSIZE; i++) {
+		struct percpu_list_node *node;
+
+		if (!CPU_ISSET(i, &allowed_cpus))
+			continue;
+
+		while ((node = __percpu_list_pop(&list, i))) {
+			sum += node->data;
+			free(node);
+		}
+	}
+
+	/*
+	 * All entries should now be accounted for (unless some external
+	 * actor is interfering with our allowed affinity while this
+	 * test is running).
+	 */
+	assert(sum == expected_sum);
+}
+
+int main(int argc, char **argv)
+{
+	if (rseq_register_current_thread()) {
+		fprintf(stderr, "Error: rseq_register_current_thread(...) failed(%d): %s\n",
+			errno, strerror(errno));
+		goto error;
+	}
+	printf("spinlock\n");
+	test_percpu_spinlock();
+	printf("percpu_list\n");
+	test_percpu_list();
+	if (rseq_unregister_current_thread()) {
+		fprintf(stderr, "Error: rseq_unregister_current_thread(...) failed(%d): %s\n",
+			errno, strerror(errno));
+		goto error;
+	}
+	return 0;
+
+error:
+	return -1;
+}
+
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
