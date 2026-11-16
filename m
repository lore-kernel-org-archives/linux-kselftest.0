Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857204;
	b=hA+5tvBfxyRArBdtSjvqu+jICw9cdIQHSC5rgILDwf8YLqj/TqinsrGdNz/X2Rf2b47q
	 OEkzpoGPHutgn7IzrQumqQwOOvmP7MKpRM/kULMcbc5O5v656uuTWLZCeOtzMeOeXzP1r
	 ZFHP5Dh4NjJkI61tqdo5LaMN8KYedZtM+bpNgx/RcqVApIcK2fgxfqmLv0gyEZs4ZpH4E
	 PU67sBTES8PB8j7s0KJD2IpwOiJ2O6nSsGLDof0z/QKYIwEh5LwFeo32UxdA784WmLlfO
	 EVA+RWKYLjIysCanwnnaSTyR9GIfGpza5NWa/xbTDEfIPd0sqnal+prs9LFSAbw4xtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857204;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SHiqyxpSRuXjBwldqdTOkC53dlqhLf2Ob/N30s9Ui8g=;
	b=u0e4+nWi5ehlNhQNem6AfpIHKbgAyUrnbnVDwKnEEtn8eJT8X4odJrWGWkJd4D868bHA
	 oBNAHaUieIWE7iD1ghWyEUktk1MBdMK6g+wOAfAZ6uJIgdWXGp2lLTEWpQO7puC2SBM9I
	 HZ3MGAv6gYcQJ3Ay/OLal6rpRY/DJR2zhOgSZWZ7nlTouVCX6ge6a8rEmo6i6vX3euvWA
	 +w4YCKkUhdVZkL+y1tc3tPUUe7v2wdZQzCBgLHB8AlmWAmUBikKVv+Fea7vD7uVCfIj8n
	 /SWZMpwLp97LsLSb78M8rjjM1/mu8t2/r5AA6CFRNbT8jJi5yRxjcTmGO4I+wBxBJvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=ZprA2n86;
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7653F606A889;
	Mon, 16 Nov 2026 19:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7653F606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=ZprA2n86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1794857203;
	bh=SHiqyxpSRuXjBwldqdTOkC53dlqhLf2Ob/N30s9Ui8g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZprA2n86z158GGBogvg35b2jJBG751QFyC4MG3s0yuP69x9OL5y37rs/vXfoNfqiP
	 aTiivVz4nc4Mv6/7X3B2aJrvDeOu/AlIxS5h9x2MEfRJevWWN4F7zJC6TLz14/YS+0
	 T+HGHOK38Xc0EJTuhFCobzOVOD8GBrZY/AZNq6cczgbQucs1Td+VeYQDNLEKrGC//k
	 FynuwJtZcNj48rquqwGK4xqQ+3G/UXaQOYGgW+fi3Q6eo3K5fLwkRFnyAEGOBGNFG1
	 oa4BQ5kAXQNUfweeiI90yIQ0AwueuAaBW/LezjcxSziR7cRRRIbULrld8r28BmC77a
	 L4eg5k/9Dzz/A==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jSyXf6ZfWzQjP;
	Mon, 16 Nov 2026 14:26:42 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: jstultz@google.com,
	peterz@infradead.org,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	connoro@google.com,
	arighi@nvidia.com,
	akpm@linux-foundation.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH v1 7/8] lib: Add test_proxy_exec, kernel mutexes that user space can hold
Date: Mon, 16 Nov 2026 14:26:37 -0500
Message-Id: <20261116192638.233125-8-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261116192638.233125-1-mathieu.desnoyers@efficios.com>
References: <20261116192638.233125-1-mathieu.desnoyers@efficios.com>
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

Proxy execution acts on tasks blocked on a struct mutex. To test it,
user space must block tasks on a kernel mutex in a chosen way:
- hold the mutex for a chosen time;
- block on it from a chosen task and CPU;
- take two mutexes in opposite orders.

No system call gives that control. The mutexes that system calls take
are held for a short time that user space does not choose. Their
locking can change with the subsystem. And user space cannot make two
tasks deadlock on two kernel mutexes.

Add a test module with eight mutexes and a debugfs file. A write to the
file runs one command:
- hold a mutex while busy or asleep;
- take a mutex, interruptibly or not;
- take two mutexes, one inside the other. The inner lock is killable,
  so that a test can end a deadlock it made.
The write returns when the command is done.

The selftest added by the next patch uses it.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 lib/Kconfig.debug     |  11 ++++
 lib/Makefile          |   1 +
 lib/test_proxy_exec.c | 132 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 144 insertions(+)
 create mode 100644 lib/test_proxy_exec.c

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 2d22638ec13a..8d032d7fa387 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1361,6 +1361,17 @@ config TEST_CSD_LOCK
 
 	  If unsure, say N.
 
+config TEST_PROXY_EXEC
+	tristate "Test module for proxy execution"
+	depends on DEBUG_FS
+	help
+	  This builds the "test_proxy_exec" module. It creates kernel
+	  mutexes that user space can hold, take and chain through
+	  debugfs. The selftests in tools/testing/selftests/sched/proxy_exec
+	  use it to block tasks on a mutex in a chosen way.
+
+	  If unsure, say N.
+
 config TEST_LOCKUP
 	tristate "Test module to generate lockups"
 	depends on m
diff --git a/lib/Makefile b/lib/Makefile
index a2afe954805c..8add2a1473df 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -101,6 +101,7 @@ obj-$(CONFIG_TEST_OBJAGG) += test_objagg.o
 obj-$(CONFIG_TEST_MEMINIT) += test_meminit.o
 obj-$(CONFIG_TEST_CSD_LOCK) += test_csd_lock.o
 obj-$(CONFIG_TEST_LOCKUP) += test_lockup.o
+obj-$(CONFIG_TEST_PROXY_EXEC) += test_proxy_exec.o
 obj-$(CONFIG_TEST_HMM) += test_hmm.o
 obj-$(CONFIG_TEST_FREE_PAGES) += test_free_pages.o
 obj-$(CONFIG_TEST_REF_TRACKER) += test_ref_tracker.o
diff --git a/lib/test_proxy_exec.c b/lib/test_proxy_exec.c
new file mode 100644
index 000000000000..d3f7af3222e8
--- /dev/null
+++ b/lib/test_proxy_exec.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Test module for proxy execution: kernel mutexes that user space can
+ * hold, take and chain.
+ *
+ * Proxy execution acts on tasks blocked on a struct mutex. User space
+ * cannot hold a kernel mutex for a chosen time, nor make two tasks take
+ * two of them in a chosen order. This module lets it do both. See
+ * tools/testing/selftests/sched/proxy_exec.
+ *
+ * Write one command to <debugfs>/test_proxy_exec/op:
+ *   hold I MS        lock mutex I, busy-wait MS ms, unlock
+ *   hold_sleep I MS  lock mutex I, sleep MS ms, unlock
+ *   take I           lock mutex I, unlock
+ *   take_intr I      mutex_lock_interruptible(I), unlock if acquired
+ *   pair A B MS      lock A, busy-wait MS ms, lock B killable, unlock both
+ * The write returns when the command is done. It fails with EINTR if a
+ * signal interrupted take_intr or the inner lock of pair.
+ *
+ * Two tasks that run pair with the mutexes in opposite orders deadlock.
+ * A fatal signal ends the deadlock.
+ */
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/init.h>
+#include <linux/ktime.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/uaccess.h>
+
+#define TPE_NR_MUTEX	8
+#define TPE_MAX_MS	10000
+
+static struct mutex tpe_mutex[TPE_NR_MUTEX];
+/* One lockdep class per mutex: "pair" nests them. */
+static struct lock_class_key tpe_key[TPE_NR_MUTEX];
+static struct dentry *tpe_dir;
+
+/*
+ * Busy-wait @ms milliseconds. The caller can be preempted. cond_resched()
+ * gives a kernel without preemption a place to do it.
+ */
+static void tpe_busy_wait(unsigned int ms)
+{
+	ktime_t end = ktime_add_ms(ktime_get(), ms);
+
+	while (ktime_before(ktime_get(), end)) {
+		cpu_relax();
+		cond_resched();
+	}
+}
+
+static ssize_t tpe_op_write(struct file *file, const char __user *ubuf,
+			    size_t len, loff_t *ppos)
+{
+	unsigned int a, b, ms = 0;
+	char buf[64];
+	int ret = 0;
+
+	if (len >= sizeof(buf))
+		return -EINVAL;
+	if (copy_from_user(buf, ubuf, len))
+		return -EFAULT;
+	buf[len] = '\0';
+
+	if (sscanf(buf, "hold_sleep %u %u", &a, &ms) == 2) {
+		if (a >= TPE_NR_MUTEX || ms > TPE_MAX_MS)
+			return -EINVAL;
+		mutex_lock(&tpe_mutex[a]);
+		msleep(ms);
+		mutex_unlock(&tpe_mutex[a]);
+	} else if (sscanf(buf, "hold %u %u", &a, &ms) == 2) {
+		if (a >= TPE_NR_MUTEX || ms > TPE_MAX_MS)
+			return -EINVAL;
+		mutex_lock(&tpe_mutex[a]);
+		tpe_busy_wait(ms);
+		mutex_unlock(&tpe_mutex[a]);
+	} else if (sscanf(buf, "take_intr %u", &a) == 1) {
+		if (a >= TPE_NR_MUTEX)
+			return -EINVAL;
+		ret = mutex_lock_interruptible(&tpe_mutex[a]);
+		if (!ret)
+			mutex_unlock(&tpe_mutex[a]);
+	} else if (sscanf(buf, "take %u", &a) == 1) {
+		if (a >= TPE_NR_MUTEX)
+			return -EINVAL;
+		mutex_lock(&tpe_mutex[a]);
+		mutex_unlock(&tpe_mutex[a]);
+	} else if (sscanf(buf, "pair %u %u %u", &a, &b, &ms) == 3) {
+		if (a >= TPE_NR_MUTEX || b >= TPE_NR_MUTEX || a == b ||
+		    ms > TPE_MAX_MS)
+			return -EINVAL;
+		mutex_lock(&tpe_mutex[a]);
+		tpe_busy_wait(ms);
+		ret = mutex_lock_killable(&tpe_mutex[b]);
+		if (!ret)
+			mutex_unlock(&tpe_mutex[b]);
+		mutex_unlock(&tpe_mutex[a]);
+	} else {
+		return -EINVAL;
+	}
+	return ret ? ret : len;
+}
+
+static const struct file_operations tpe_op_fops = {
+	.owner	= THIS_MODULE,
+	.write	= tpe_op_write,
+	.llseek	= noop_llseek,
+};
+
+static int __init tpe_init(void)
+{
+	int i;
+
+	for (i = 0; i < TPE_NR_MUTEX; i++) {
+		mutex_init(&tpe_mutex[i]);
+		lockdep_set_class(&tpe_mutex[i], &tpe_key[i]);
+	}
+	tpe_dir = debugfs_create_dir("test_proxy_exec", NULL);
+	debugfs_create_file("op", 0200, tpe_dir, NULL, &tpe_op_fops);
+	return 0;
+}
+module_init(tpe_init);
+
+static void __exit tpe_exit(void)
+{
+	debugfs_remove_recursive(tpe_dir);
+}
+module_exit(tpe_exit);
+
+MODULE_DESCRIPTION("Kernel mutexes for the proxy execution selftests");
+MODULE_LICENSE("GPL");
-- 
2.47.3

