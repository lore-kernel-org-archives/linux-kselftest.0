Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8A94D488A;
	Mon, 21 Sep 2026 16:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008074; cv=none; b=LioE9V5iRseWr+iZlpVMHn923U6KzGtUWOwNB4WgePy3eKRZM5rFxXeVPrLw2r+zHHv8nqkOjnOjkZvAJ5PwkJVMpPIGI9oFB34KD5us9sxqyrXeBabZI74gsqtFF32HqMDQM3uPANYqvbiBdpVfpKNlihfzhWrykgq4MJetTJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008074; c=relaxed/simple;
	bh=LE2/Jw/dzFq6HsH2rAJcP0GhY7EwC23AEzqsjsSOQj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bNNDmazYZpdICCqm4VmLhv4tfcCBHGmCLpZ7+1UiaF2BDDEOLKZEs5xk6UtLyVerT0pys6mn0QqXTDo4UvTeOlY99cJ0vbAyfQFd9F+r06jDA21Lhh9j/7bFoTfNz36u/LuKi0I0aVq5SiNX2lKGYx0nT24UwGmSkEAY0mmRM5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=C4wQ9Dc+; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="C4wQ9Dc+"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LDtlAv1635004;
	Mon, 21 Sep 2026 16:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=wx3JI7y5SQuIVmLpBPmrwTMBLXOxe1VE8gBskFNlCgw=; b=
	C4wQ9Dc+zt542XTn4K09smA8OzrhTKvsqOJ0ethspTB75X4ISjSPQ7Cfhp7bOhrv
	g+04KnVDtQQO/eApV+f3Ve4dHeuhfoaM11kcBLCMz/jCPRNSYLXhSGUoZYUw43Y/
	wHH2sPbLV3u0ArCQxq20p6xp2lclIc6vZagg8BC7mhwEa0cSHzmkaGFxhJXBw99r
	nwO1OvcZxhBL6yZjLCwOKI5TWdZEcr8G/BayuvS1tYyMO9zVNdyQtNFsquhNzewe
	2ZrKn9YGL1mUA8I/Q7tbOSPATAQ6DXyZndU5ypMbBJsl1uFp67LAERjKrkZdU9iW
	woR/lawvEQRKMSz0/HULNQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gsk1ganmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Sep 2026 16:27:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68LGP95b019791;
	Mon, 21 Sep 2026 16:27:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4gtegjen1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Sep 2026 16:27:38 +0000 (GMT)
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 68LGRUVt026549;
	Mon, 21 Sep 2026 16:27:37 GMT
Received: from lab61.no.oracle.com (lab61.no.oracle.com [10.172.144.82])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4gtegjemsy-2;
	Mon, 21 Sep 2026 16:27:37 +0000 (GMT)
From: =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>
To: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <shuah@kernel.org>
Cc: John Stultz <jstultz@google.com>,
        =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>,
        linux-kselftest@vger.kernel.org
Subject: [PATCH v2 1/1] kernel/locking: Add mutual exclusion self-test
Date: Mon, 21 Sep 2026 18:27:20 +0200
Message-ID: <20260921162722.212610-2-haakon.bugge@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260921162722.212610-1-haakon.bugge@oracle.com>
References: <20260921162722.212610-1-haakon.bugge@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0
 phishscore=0 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2609210239
X-Proofpoint-GUID: nm5KKrQDt8Dhv425Y6wlhjDzGW8kw4uV
X-Authority-Analysis: v=2.4 cv=T6sZ3PKQ c=1 sm=1 tr=0 ts=6ab15afb cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22 a=x4eqshVgHu-cdnggieHk:22
 a=yPCof4ZbAAAA:8 a=YHNDNSdmkXTikWg6I18A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI0MCBTYWx0ZWRfX6yGoKmOTqOJW
 r5v7S/K8weIIIcFEtwV1CeoZ3SwZdXrFLllstDyesaHfQrORoC3Vb9l4+ljqxhONXvx7WT0Mw3I
 gnqxSnhvq2EPw+AegTW5SqhlBlswOnnIoeKATZv9vTDWuKsDxeFJ
X-Proofpoint-ORIG-GUID: nm5KKrQDt8Dhv425Y6wlhjDzGW8kw4uV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI0MCBTYWx0ZWRfX0RH0OxlfR0KT
 IKSyNLD66tss64yoaXtLW9yJB84IelCgDZQP7mwGSa5VaXNmZPYIfIFHeiJyHkCMPvXhEXwpmZI
 S6zGhDTfTSkE1FWcI7tgkPkiDrPBd1KmikUSxqmnnSYVnP3PEQesBEg2Yi+ZhbgIrFNA+MY5rfk
 LaSX10USuC2onu6Y+FQFe6VpDbWEEWbppmxkE4wi33yy+Wko4C70gbc4vJcHkaSt9oYKtOuqgli
 sPbV2Fm/9Kzd5xitE+KOhCixBrcuFj8W65g05J0d0krqinD1zmuz8N86Kh0BjQxj03UXhGPyq2m
 h44nqQW4K6P1qbKYg5ULOgk0zGa0HJHtE9L7wQhevXDXdPPywOEaOZKJf4hQO8V/08mDg5pUJ/m
 4+akmxTUEmHVXaDNEJT2B/XpJbKYWOitOKtYstKMTx+L3wTvsDUR/oDrjCQxii6S/k3xbKjRFHD
 knDTXvUnJTBW6iUiA/Q==

Add a stress test for locking and atomic synchronization primitives.

The test maintains an array of elements containing counters
initialized to zero. It creates four worker threads per online CPU. On
each iteration, a worker chooses two elements at random, increments
the first counter, and decrements the second. Each completed pair of
updates therefore preserves the sum of all counters.

The harness supports variants that protect the counters with an
explicit locking primitive and variants that use allegedly lock-free
primitives. A common operations interface allows the same workload to
exercise different primitives.

The module accepts the following parameters:

    mx_nmbr_elems:
        Number of elements in the array. The default is 2048.

    mx_test:
        Test variant to run. Supported variants include spin_lock,
        spin_lock_irq, spin_lock_irqsave, and write_lock. Specifying an
        unknown variant causes the module to print the complete list of
        supported variants. The default is osq_lock.

    mx_scnds_per_test:
        Duration of each test run, in seconds. The default is 1.

After all workers have stopped, the test sums the counters and reports
a failure if the result is nonzero. Such a result indicates that the
expected invariant was violated. Because this is a stress test, a zero
result means only that no failure was observed during that run.

The test can expose ordering regressions in atomic bit operations. For
example, reverting commit 415d83249709 ("locking/atomic: Make
test_and_*_bit() ordered on failure") causes the
"test_and_clear_bit_innov" and "test_and_set_bit_innov" variants to
fail on weakly ordered Arm systems. These variants rely on a failing
test_and_*_bit() operation to enforce visibility of updates to other
processors, rather than using smp_mb__before_atomic(). They therefore
provide regression coverage for commit 415d83249709.

The harness also includes variants that reproduce known incorrect uses
of these primitives. Before commit 1422f28826d2 ("rds: introduce
acquire/release ordering in acquire/release_in_xmit()"), RDS used them
without the required acquire/release ordering. The "rds_busted"
variant models that bug and fails on Arm systems.

The "osq_lock_busted" locking type fails when the Optimistic Spin
Queue (OSQ) helpers are treated as providing mutual exclusion: under
the tested conditions, they do not. Whether the helpers should provide
that guarantee remains under discussion.

Regardless of the intended semantics, this test documents the behavior
observed in v7.3-rc4. If the helpers are changed to guarantee mutual
exclusion, the test can then serve as regression coverage for that
change.

The patch also adds a shell script for the CI kselftest framework. The
script first runs the "busted" variant, which performs the updates
without synchronization and is expected to fail. If that variant does
not fail, the script skips the remaining tests because the run did not
expose even the intentional race, making successful results from the
other variants inconclusive.

The script then loads the module with an unsupported mx_test value to
obtain the list of available variants from the kernel log. It parses
that list and runs every variant whose name does not contain "busted".

For interactive use, the script accepts "-e low", "-e medium", or
"-e high" to select the test effort.

Signed-off-by: Håkon Bugge <haakon.bugge@oracle.com>

---

v1 -> v2:
   * Added "osq_lock_busted" as locking primitive. It is "busted"
     because the osq_lock helpers do not provide mutual exclusion.
   * Added "atomic_xchg" locking type, in order to mimic the sequence
     atomic_xchg() in osq_lock() and corresponding
     atomic_try_cmpxchg_release() in osq_unlock()
   * Refactored the big union to simplify mx_add
   * Added "atomic64_add" lockless test type
   * Having the counters, when needed, as a separate array, which
     removes the need for the padding logic
   * Rebased on v7.3-rc4
---
 kernel/locking/Makefile                    |   1 +
 kernel/locking/mx_test.c                   | 723 +++++++++++++++++++++
 lib/Kconfig.debug                          |  10 +
 tools/testing/selftests/locking/Makefile   |   2 +-
 tools/testing/selftests/locking/mx_test.sh | 171 +++++
 5 files changed, 906 insertions(+), 1 deletion(-)
 create mode 100644 kernel/locking/mx_test.c
 create mode 100755 tools/testing/selftests/locking/mx_test.sh

diff --git a/kernel/locking/Makefile b/kernel/locking/Makefile
index cee1901d4cff8..240084b4abbb7 100644
--- a/kernel/locking/Makefile
+++ b/kernel/locking/Makefile
@@ -38,3 +38,4 @@ obj-$(CONFIG_QUEUED_RWLOCKS) += qrwlock.o
 obj-$(CONFIG_LOCK_TORTURE_TEST) += locktorture.o
 obj-$(CONFIG_WW_MUTEX_SELFTEST) += test-ww_mutex.o
 obj-$(CONFIG_LOCK_EVENT_COUNTS) += lock_events.o
+obj-$(CONFIG_MX_TEST) += mx_test.o
diff --git a/kernel/locking/mx_test.c b/kernel/locking/mx_test.c
new file mode 100644
index 0000000000000..6a2dd23cdbf4c
--- /dev/null
+++ b/kernel/locking/mx_test.c
@@ -0,0 +1,723 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/completion.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#ifdef CONFIG_LOCK_SPIN_ON_OWNER
+#include <linux/osq_lock.h>
+#endif
+#include <linux/random.h>
+#include <linux/rwlock.h>
+#include <linux/slab.h>
+#include <linux/smp.h>
+#include <linux/spinlock.h>
+#include <linux/vmalloc.h>
+#include <linux/workqueue.h>
+#include <linux/ww_mutex.h>
+
+#if IS_MODULE(CONFIG_MX_TEST) && defined(CONFIG_LOCK_SPIN_ON_OWNER)
+#include "osq_lock.c"
+#endif
+
+/*
+ * The default here is derived from an empirical test, where
+ * "osq_lock_busted" was run 100 times of one second, varying the
+ * number of elements. This was run on a 160 CPU Arm BM system. The
+ * percentage failures were:
+ *    #elements	      percent failures
+ * ===================================
+ *	   1024		     90
+ *	   2048		     95
+ *	   4096		     92
+ *	   8192		     94
+ *	  16384		     85
+ *	  32768		     79
+ *	  65536		     66
+ */
+static unsigned int mx_nmbr_elems = 2048;
+static unsigned long mx_scnds_per_test = 1;
+static char *mx_test = "spin_lock";
+
+module_param(mx_nmbr_elems, uint, 0444);
+MODULE_PARM_DESC(mx_nmbr_elems, "Number of elements (default 2048)");
+
+module_param(mx_scnds_per_test, ulong, 0444);
+MODULE_PARM_DESC(mx_scnds_per_test, "Number of seconds to run for each test iteration (default is 1)");
+
+module_param(mx_test, charp, 0444);
+MODULE_PARM_DESC(mx_test,
+		 "Mutual exclusion method or lock-free method (spin_lock, spin_lock_irq, spin_lock_irqsave, write_lock, ...)");
+
+#define MX_RDS_IN_XMIT 2
+#define MX_SOME_BIT 13
+static DEFINE_WD_CLASS(wd_class);
+static DEFINE_WW_CLASS(ww_class);
+
+enum mx_test {
+	MX_ILLEGAL,
+	MX_BUSTED,
+	MX_SPIN_LOCK,
+	MX_SPIN_LOCK_IRQ,
+	MX_SPIN_LOCK_IRQSAVE,
+	MX_RW_LOCK_W,
+	MX_RW_LOCK_W_BH,
+	MX_RW_LOCK_TRW,
+	MX_RW_LOCK_TRW_BH,
+	MX_MUTEX,
+	MX_ATOMIC_ADD,
+	MX_ATOMIC64_ADD,
+	MX_CMPXCHG,
+	MX_RDS_BUSTED,
+	MX_TEST_AND_SET_BIT_LOCK,
+	MX_TEST_AND_SET_BIT_INNOV,
+	MX_TEST_AND_SET_BIT_PLAIN,
+	MX_TEST_AND_CLEAR_BIT_INNOV,
+	MX_TEST_AND_CLEAR_BIT_PLAIN,
+	MX_SINGLE_WW_MUTEX_WW,	/* Wound-Wait */
+	MX_SINGLE_WW_MUTEX_WD,	/* Wait-Die */
+#ifdef CONFIG_LOCK_SPIN_ON_OWNER
+	MX_OSQ_LOCK_BUSTED,
+#endif
+	MX_ATOMIC_XCHG,
+};
+
+struct mx_locks {
+	/* This union contains locks and lock-free data types */
+	union {
+		/* Protecting the counter below */
+		spinlock_t spinlock;
+		rwlock_t rwlock;
+		/* Protecting the counter below */
+		struct mutex mutex;
+		atomic_t atomic_lock;
+		atomic_t atomic_counter;
+		atomic64_t atomic64_counter;
+		long cmpxchg_counter;
+		unsigned long bits;
+		struct ww_mutex ww_mutex;
+#ifdef CONFIG_LOCK_SPIN_ON_OWNER
+		struct optimistic_spin_queue osq_lock;
+#endif
+	};
+};
+
+struct mx_inc_dec_params {
+	struct work_struct work;
+	struct mx_locks *locks;
+	long *counters;
+	unsigned int nelems;
+	unsigned long timeout;
+	enum mx_test mx_type;
+	u64 iter;
+	struct completion completion;
+};
+
+static bool mx_lockless_test(enum mx_test typ)
+{
+	return
+		(typ == MX_ATOMIC_ADD)  ||
+		(typ == MX_ATOMIC64_ADD)  ||
+		(typ == MX_CMPXCHG);
+}
+
+static inline unsigned int mx_rand(unsigned int *seed)
+{
+	*seed = *seed * 69069 + 111;
+	return *seed;
+}
+
+static inline void mx_acquire(struct mx_locks *locks, enum mx_test typ, unsigned long *flags_ptr)
+{
+	int ret;
+
+	switch (typ) {
+	case MX_BUSTED:
+		break;
+	case MX_SPIN_LOCK:
+		spin_lock(&locks->spinlock);
+		break;
+	case MX_SPIN_LOCK_IRQ:
+		spin_lock_irq(&locks->spinlock);
+		break;
+	case MX_SPIN_LOCK_IRQSAVE:
+		spin_lock_irqsave(&locks->spinlock, *flags_ptr);
+		break;
+	case MX_RW_LOCK_W:
+		write_lock(&locks->rwlock);
+		break;
+	case MX_RW_LOCK_W_BH:
+		write_lock_bh(&locks->rwlock);
+		break;
+	case MX_RW_LOCK_TRW:
+		while (!read_trylock(&locks->rwlock))
+			;
+		read_unlock(&locks->rwlock);
+		write_lock(&locks->rwlock);
+		break;
+	case MX_RW_LOCK_TRW_BH:
+		while (!read_trylock(&locks->rwlock))
+			;
+		read_unlock(&locks->rwlock);
+		write_lock_bh(&locks->rwlock);
+		break;
+	case MX_MUTEX:
+		mutex_lock(&locks->mutex);
+		break;
+	case MX_ATOMIC_ADD:
+	case MX_ATOMIC64_ADD:
+	case MX_CMPXCHG:
+		break;
+	case MX_RDS_BUSTED:
+		while (test_and_set_bit(MX_RDS_IN_XMIT, &locks->bits))
+			;
+		break;
+	case MX_TEST_AND_SET_BIT_LOCK:
+		while (test_and_set_bit_lock(MX_RDS_IN_XMIT, &locks->bits))
+			;
+		break;
+	case MX_TEST_AND_SET_BIT_INNOV:
+	case MX_TEST_AND_SET_BIT_PLAIN:
+		while (test_and_set_bit(MX_SOME_BIT, &locks->bits))
+			;
+		break;
+	case MX_TEST_AND_CLEAR_BIT_INNOV:
+	case MX_TEST_AND_CLEAR_BIT_PLAIN:
+		while (!test_and_clear_bit(MX_SOME_BIT, &locks->bits))
+			;
+		break;
+	case MX_SINGLE_WW_MUTEX_WW:
+	case MX_SINGLE_WW_MUTEX_WD:
+		ret = ww_mutex_lock(&locks->ww_mutex, NULL);
+		WARN_ONCE(ret, "ww_mutex_lock returned %d for the single w/w mutex case\n", ret);
+		break;
+#ifdef CONFIG_LOCK_SPIN_ON_OWNER
+	case MX_OSQ_LOCK_BUSTED:
+		preempt_disable();
+		while (!osq_lock(&locks->osq_lock)) {
+			preempt_enable();
+			cond_resched();
+			preempt_disable();
+		}
+		break;
+#endif
+	case MX_ATOMIC_XCHG:
+		while (atomic_xchg_acquire(&locks->atomic_lock, 1) != 0)
+			cpu_relax();
+		break;
+	default:
+		WARN_ON_ONCE(true);
+	}
+}
+
+static inline void mx_release(struct mx_locks *locks, enum mx_test typ, unsigned long *flags_ptr)
+{
+	switch (typ) {
+	case MX_BUSTED:
+		break;
+	case MX_SPIN_LOCK:
+		spin_unlock(&locks->spinlock);
+		break;
+	case MX_SPIN_LOCK_IRQ:
+		spin_unlock_irq(&locks->spinlock);
+		break;
+	case MX_SPIN_LOCK_IRQSAVE:
+		spin_unlock_irqrestore(&locks->spinlock, *flags_ptr);
+		break;
+	case MX_RW_LOCK_W:
+	case MX_RW_LOCK_TRW:
+		write_unlock(&locks->rwlock);
+		break;
+	case MX_RW_LOCK_W_BH:
+	case MX_RW_LOCK_TRW_BH:
+		write_unlock_bh(&locks->rwlock);
+		break;
+	case MX_MUTEX:
+		mutex_unlock(&locks->mutex);
+		break;
+	case MX_ATOMIC_ADD:
+	case MX_ATOMIC64_ADD:
+	case MX_CMPXCHG:
+		break;
+	case MX_RDS_BUSTED:
+		clear_bit(MX_RDS_IN_XMIT, &locks->bits);
+		/* Deliberately outside the critical region, as RDS did prior to 1422f288 */
+		smp_mb__after_atomic();
+		break;
+	case MX_TEST_AND_SET_BIT_LOCK:
+		clear_bit_unlock(MX_RDS_IN_XMIT, &locks->bits);
+		break;
+	case MX_TEST_AND_SET_BIT_INNOV:
+		/*
+		 * Ensuring global visibility on other processors by
+		 * means of a failing test_and_set_bit()
+		 */
+		(void)test_and_set_bit(MX_SOME_BIT, &locks->bits);
+		clear_bit(MX_SOME_BIT, &locks->bits);
+		break;
+	case MX_TEST_AND_SET_BIT_PLAIN:
+		/* Ensure the counter gets global visiblity before releasing the lock*/
+		smp_mb__before_atomic();
+		clear_bit(MX_SOME_BIT, &locks->bits);
+		break;
+	case MX_TEST_AND_CLEAR_BIT_INNOV:
+		/*
+		 * Ensuring global visibility on other processors by
+		 * means of a failing test_and_clear_bit()
+		 */
+		(void)test_and_clear_bit(MX_SOME_BIT, &locks->bits);
+		set_bit(MX_SOME_BIT, &locks->bits);
+		break;
+	case MX_TEST_AND_CLEAR_BIT_PLAIN:
+		/* Ensure the counter gets global visiblity before releasing the lock*/
+		smp_mb__before_atomic();
+		set_bit(MX_SOME_BIT, &locks->bits);
+		break;
+	case MX_SINGLE_WW_MUTEX_WW:
+	case MX_SINGLE_WW_MUTEX_WD:
+		ww_mutex_unlock(&locks->ww_mutex);
+		break;
+#ifdef CONFIG_LOCK_SPIN_ON_OWNER
+	case MX_OSQ_LOCK_BUSTED:
+		osq_unlock(&locks->osq_lock);
+		preempt_enable();
+		break;
+#endif
+	case MX_ATOMIC_XCHG:
+		atomic_set_release(&locks->atomic_lock, 0);
+		break;
+	default:
+		WARN_ON_ONCE(true);
+	}
+}
+
+static inline void mx_add(struct mx_locks *locks, long *counters, enum mx_test typ, long addend)
+{
+	long old;
+
+	switch (typ) {
+	case MX_BUSTED:
+	case MX_SPIN_LOCK:
+	case MX_SPIN_LOCK_IRQ:
+	case MX_SPIN_LOCK_IRQSAVE:
+	case MX_RW_LOCK_W:
+	case MX_RW_LOCK_W_BH:
+	case MX_RW_LOCK_TRW:
+	case MX_RW_LOCK_TRW_BH:
+	case MX_MUTEX:
+	case MX_RDS_BUSTED:
+	case MX_TEST_AND_SET_BIT_LOCK:
+	case MX_TEST_AND_SET_BIT_INNOV:
+	case MX_TEST_AND_SET_BIT_PLAIN:
+	case MX_TEST_AND_CLEAR_BIT_INNOV:
+	case MX_TEST_AND_CLEAR_BIT_PLAIN:
+	case MX_SINGLE_WW_MUTEX_WW:
+	case MX_SINGLE_WW_MUTEX_WD:
+#ifdef CONFIG_LOCK_SPIN_ON_OWNER
+	case MX_OSQ_LOCK_BUSTED:
+#endif
+	case MX_ATOMIC_XCHG:
+		*counters += addend;
+		break;
+	case MX_ATOMIC_ADD:
+		atomic_add(addend, &locks->atomic_counter);
+		break;
+	case MX_ATOMIC64_ADD:
+		atomic64_add(addend, &locks->atomic64_counter);
+		break;
+	case MX_CMPXCHG:
+		do {
+			old = READ_ONCE(locks->cmpxchg_counter);
+		} while (cmpxchg(&locks->cmpxchg_counter, old, old + addend) != old);
+		break;
+	default:
+		WARN_ON_ONCE(true);
+	}
+}
+
+static inline long mx_read(struct mx_locks *locks, long *counters, enum mx_test typ)
+{
+	switch (typ) {
+	case MX_BUSTED:
+	case MX_SPIN_LOCK:
+	case MX_SPIN_LOCK_IRQ:
+	case MX_SPIN_LOCK_IRQSAVE:
+	case MX_RW_LOCK_W:
+	case MX_RW_LOCK_W_BH:
+	case MX_RW_LOCK_TRW:
+	case MX_RW_LOCK_TRW_BH:
+	case MX_MUTEX:
+	case MX_RDS_BUSTED:
+	case MX_TEST_AND_SET_BIT_LOCK:
+	case MX_TEST_AND_SET_BIT_INNOV:
+	case MX_TEST_AND_SET_BIT_PLAIN:
+	case MX_TEST_AND_CLEAR_BIT_INNOV:
+	case MX_TEST_AND_CLEAR_BIT_PLAIN:
+	case MX_SINGLE_WW_MUTEX_WW:
+	case MX_SINGLE_WW_MUTEX_WD:
+#ifdef CONFIG_LOCK_SPIN_ON_OWNER
+	case MX_OSQ_LOCK_BUSTED:
+#endif
+	case MX_ATOMIC_XCHG:
+		return *counters;
+	case MX_ATOMIC_ADD:
+		return atomic_read(&locks->atomic_counter);
+	case MX_ATOMIC64_ADD:
+		return atomic64_read(&locks->atomic64_counter);
+	case MX_CMPXCHG:
+		return locks->cmpxchg_counter;
+	default:
+		WARN_ON_ONCE(true);
+	}
+	return 0;
+}
+
+static inline void mx_init(struct mx_locks *locks, enum mx_test typ)
+{
+	switch (typ) {
+	case MX_SPIN_LOCK:
+	case MX_SPIN_LOCK_IRQ:
+	case MX_SPIN_LOCK_IRQSAVE:
+		spin_lock_init(&locks->spinlock);
+		break;
+	case MX_RW_LOCK_W:
+	case MX_RW_LOCK_W_BH:
+	case MX_RW_LOCK_TRW:
+	case MX_RW_LOCK_TRW_BH:
+		rwlock_init(&locks->rwlock);
+		break;
+	case MX_MUTEX:
+		mutex_init(&locks->mutex);
+		break;
+	case MX_TEST_AND_CLEAR_BIT_INNOV:
+	case MX_TEST_AND_CLEAR_BIT_PLAIN:
+		set_bit(MX_SOME_BIT, &locks->bits);
+		break;
+	/* The following relies on the vzalloc below */
+	case MX_BUSTED:
+	case MX_ATOMIC_ADD:
+	case MX_ATOMIC64_ADD:
+	case MX_CMPXCHG:
+	case MX_RDS_BUSTED:
+	case MX_TEST_AND_SET_BIT_LOCK:
+	case MX_TEST_AND_SET_BIT_INNOV:
+	case MX_TEST_AND_SET_BIT_PLAIN:
+	case MX_ATOMIC_XCHG:
+		break;
+	case MX_SINGLE_WW_MUTEX_WW:
+		ww_mutex_init(&locks->ww_mutex, &ww_class);
+		break;
+	case MX_SINGLE_WW_MUTEX_WD:
+		ww_mutex_init(&locks->ww_mutex, &wd_class);
+		break;
+#ifdef CONFIG_LOCK_SPIN_ON_OWNER
+	case MX_OSQ_LOCK_BUSTED:
+		osq_lock_init(&locks->osq_lock);
+		break;
+#endif
+	default:
+		WARN_ON_ONCE(true);
+	}
+}
+
+static inline void mx_fini(struct mx_locks *locks, enum mx_test typ)
+{
+	switch (typ) {
+	case MX_SPIN_LOCK:
+	case MX_SPIN_LOCK_IRQ:
+	case MX_SPIN_LOCK_IRQSAVE:
+	case MX_RW_LOCK_W:
+	case MX_RW_LOCK_W_BH:
+	case MX_RW_LOCK_TRW:
+	case MX_RW_LOCK_TRW_BH:
+	case MX_TEST_AND_CLEAR_BIT_INNOV:
+	case MX_TEST_AND_CLEAR_BIT_PLAIN:
+	case MX_BUSTED:
+	case MX_ATOMIC_ADD:
+	case MX_ATOMIC64_ADD:
+	case MX_CMPXCHG:
+	case MX_RDS_BUSTED:
+	case MX_TEST_AND_SET_BIT_LOCK:
+	case MX_TEST_AND_SET_BIT_INNOV:
+	case MX_TEST_AND_SET_BIT_PLAIN:
+#ifdef CONFIG_LOCK_SPIN_ON_OWNER
+	case MX_OSQ_LOCK_BUSTED:
+#endif
+	case MX_ATOMIC_XCHG:
+		break;
+	case MX_MUTEX:
+		mutex_destroy(&locks->mutex);
+		break;
+	case MX_SINGLE_WW_MUTEX_WW:
+	case MX_SINGLE_WW_MUTEX_WD:
+		ww_mutex_destroy(&locks->ww_mutex);
+		break;
+	default:
+		WARN_ON_ONCE(true);
+	}
+}
+
+static void mx_inc_dec(struct work_struct *_work)
+{
+	struct mx_inc_dec_params *params;
+	unsigned long flags;
+	struct mx_locks *locks;
+	unsigned int seed;
+	u64 iter = 0;
+
+	params = container_of(_work, struct mx_inc_dec_params, work);
+	locks = params->locks;
+
+	get_random_bytes(&seed, sizeof(seed));
+	do {
+		unsigned int inx1 = mx_rand(&seed) % params->nelems;
+		unsigned int inx2 = mx_rand(&seed) % params->nelems;
+		struct mx_locks *rnd_el1 = locks + inx1;
+		struct mx_locks *rnd_el2 = locks + inx2;
+
+		++iter;
+
+		mx_acquire(rnd_el1, params->mx_type, &flags);
+		mx_add(rnd_el1, params->counters + inx1, params->mx_type, 1);
+		mx_release(rnd_el1, params->mx_type, &flags);
+
+		mx_acquire(rnd_el2, params->mx_type, &flags);
+		mx_add(rnd_el2, params->counters + inx2, params->mx_type, -1);
+		mx_release(rnd_el2, params->mx_type, &flags);
+	} while (time_before(jiffies, params->timeout));
+
+	params->iter = iter;
+	complete(&params->completion);
+}
+
+#define pr_notice_or_err(err, fmt, ...)				\
+	do {							\
+		if (err)					\
+			pr_err(fmt, ##__VA_ARGS__);		\
+		else						\
+			pr_notice(fmt, ##__VA_ARGS__);		\
+	} while (0)
+
+static int run_test(const enum mx_test test, const char *mnemonic, const int threads)
+{
+	struct mx_inc_dec_params *params = kzalloc_objs(*params, threads);
+	unsigned long start_jf = jiffies;
+	u64 total_iters = 0;
+	struct mx_locks *locks;
+	long *counters = NULL;
+	unsigned long ms;
+	long sum = 0;
+	int ret = 0;
+	int i;
+
+	locks = kvmalloc_array(mx_nmbr_elems, sizeof(*locks), GFP_KERNEL | __GFP_ZERO);
+
+	if (!mx_lockless_test(test)) {
+		counters = kvmalloc_array(mx_nmbr_elems, sizeof(*counters),
+					  GFP_KERNEL | __GFP_ZERO);
+		if (!counters) {
+			ret = -ENOMEM;
+			goto exit_free;
+		}
+	}
+
+	if (!locks || !params) {
+		ret = -ENOMEM;
+		goto exit_free;
+	}
+
+	for (i = 0; i < mx_nmbr_elems; ++i)
+		mx_init(locks + i, test);
+
+	for (i = 0; i < threads; ++i) {
+		struct mx_inc_dec_params *p = params + i;
+
+		p->locks = locks;
+		p->counters = counters;
+		p->nelems = mx_nmbr_elems;
+		p->timeout = jiffies + mx_scnds_per_test * HZ;
+		p->mx_type = test;
+		init_completion(&p->completion);
+
+		INIT_WORK(&p->work, mx_inc_dec);
+		queue_work(system_dfl_wq, &p->work);
+	}
+
+	for (i = 0; i < threads; ++i) {
+		struct mx_inc_dec_params *p = params + i;
+
+		wait_for_completion(&p->completion);
+		total_iters += p->iter;
+	}
+
+	for (i = 0; i < mx_nmbr_elems; ++i)
+		mx_fini(locks + i, test);
+
+	if (total_iters > LONG_MAX)
+		pr_warn_once("mx_test: Total number of iterations %llu exceeds LONG_MAX; consider reducing mx_scnds_per_test\n",
+			     total_iters);
+
+	for (i = 0; i < mx_nmbr_elems; ++i)
+		sum += mx_read(locks + i, counters + i, test);
+
+	ms = jiffies_to_msecs(jiffies - start_jf);
+
+	pr_notice_or_err(sum,
+			 "mx_test: %-27s result: %s sum: %ld elements: %7d elapsed: %lu.%03lu seconds\n",
+			 mnemonic, !sum ? "SUCCESS" : "FAILURE", sum, mx_nmbr_elems,
+			 ms / 1000, ms % 1000);
+	if (sum)
+		ret = -EFAULT;
+
+exit_free:
+	kvfree(counters);
+	kvfree(locks);
+	kfree(params);
+	return ret;
+}
+
+static int __init mx_test_init(void)
+{
+	unsigned int threads = 4 * num_online_cpus();
+	enum mx_test test = MX_ILLEGAL;
+	char *mnemonic;
+	unsigned int i;
+	int sts;
+	struct {
+		enum mx_test test;
+		char *mnemonic;
+	} mx_test_types[] = {
+		{
+			.test = MX_BUSTED,
+			.mnemonic = "busted",
+		},
+		{
+			.test = MX_SPIN_LOCK,
+			.mnemonic = "spin_lock",
+		},
+		{
+			.test = MX_SPIN_LOCK_IRQ,
+			.mnemonic = "spin_lock_irq",
+		},
+		{
+			.test = MX_SPIN_LOCK_IRQSAVE,
+			.mnemonic = "spin_lock_irqsave",
+		},
+		{
+			.test = MX_RW_LOCK_W,
+			.mnemonic = "write_lock",
+		},
+		{
+			.test = MX_RW_LOCK_W_BH,
+			.mnemonic = "write_lock_bh",
+		},
+		{
+			.test = MX_RW_LOCK_TRW,
+			.mnemonic = "read_trylock_write_lock",
+		},
+		{
+			.test = MX_RW_LOCK_TRW_BH,
+			.mnemonic = "read_trylock_write_lock_bh",
+		},
+		{
+			.test = MX_MUTEX,
+			.mnemonic = "mutex",
+		},
+		{
+			.test = MX_ATOMIC_ADD,
+			.mnemonic = "atomic_add",
+		},
+		{
+			.test = MX_ATOMIC64_ADD,
+			.mnemonic = "atomic64_add",
+		},
+		{
+			.test = MX_CMPXCHG,
+			.mnemonic = "cmpxchg",
+		},
+		{
+			.test = MX_RDS_BUSTED,
+			.mnemonic = "rds_busted",
+		},
+		{
+			.test = MX_TEST_AND_SET_BIT_LOCK,
+			.mnemonic = "test_and_set_bit_lock",
+		},
+		{
+			.test = MX_TEST_AND_SET_BIT_INNOV,
+			.mnemonic = "test_and_set_bit_innov",
+		},
+		{
+			.test = MX_TEST_AND_SET_BIT_PLAIN,
+			.mnemonic = "test_and_set_bit_plain",
+		},
+		{
+			.test = MX_TEST_AND_CLEAR_BIT_INNOV,
+			.mnemonic = "test_and_clear_bit_innov",
+		},
+		{
+			.test = MX_TEST_AND_CLEAR_BIT_PLAIN,
+			.mnemonic = "test_and_clear_bit_plain",
+		},
+		{
+			.test = MX_SINGLE_WW_MUTEX_WW,
+			.mnemonic = "single_ww_mutex_wound_wait",
+		},
+		{
+			.test = MX_SINGLE_WW_MUTEX_WD,
+			.mnemonic = "single_ww_mutex_wait_die",
+		},
+#ifdef CONFIG_LOCK_SPIN_ON_OWNER
+		{
+			.test = MX_OSQ_LOCK_BUSTED,
+			.mnemonic = "osq_lock_busted",
+		},
+#endif
+		{
+		  .test = MX_ATOMIC_XCHG,
+			.mnemonic = "atomic_xchg",
+		},
+	};
+
+	/* Select the test type */
+	for (i = 0; i < ARRAY_SIZE(mx_test_types); ++i)
+		if (!strcmp(mx_test, mx_test_types[i].mnemonic)) {
+			test = mx_test_types[i].test;
+			mnemonic = mx_test_types[i].mnemonic;
+			break;
+		}
+
+	if (test == MX_ILLEGAL) {
+		pr_err("mx_test: unknown test type %s\n", mx_test);
+		pr_notice("mx_test: legitimate test types:\n");
+		for (i = 0; i < ARRAY_SIZE(mx_test_types); ++i)
+			pr_notice("mx_test_types:	 %s\n", mx_test_types[i].mnemonic);
+		return -ENOPROTOOPT;
+	}
+
+	if (mx_nmbr_elems < 1) {
+		pr_err("Number of elements must be greater than equal to one\n");
+		return -EINVAL;
+	}
+
+	if (mx_scnds_per_test > MAX_JIFFY_OFFSET / HZ) {
+		pr_err("mx_scnds_per_test too large\n");
+		return -EINVAL;
+	}
+
+	sts = run_test(test, mnemonic, threads);
+
+	return sts;
+}
+
+static void __exit mx_test_exit(void)
+{
+}
+
+module_init(mx_test_init);
+module_exit(mx_test_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Håkon Bugge <Haakon.Bugge@oracle.com>");
+MODULE_DESCRIPTION("mutual exclusion tests");
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 134b15a44625e..6b60c66e92627 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1691,6 +1691,16 @@ config CSD_LOCK_WAIT_DEBUG_DEFAULT
 	  This option causes the csdlock_debug= kernel boot parameter to
 	  default to 1 (basic debugging) instead of 0 (no debugging).
 
+config MX_TEST
+	tristate "miscellaneous lock-full and lock-less selftests"
+	help
+	  This option provides a kernel module that runs tests using
+	  different locking primitives and lockless operations.
+
+	  Say M if you want these self tests to build as a module.
+	  Say N if you are unsure.
+
+
 endmenu # lock debugging
 
 config TRACE_IRQFLAGS
diff --git a/tools/testing/selftests/locking/Makefile b/tools/testing/selftests/locking/Makefile
index 6e7761ab35360..d9cfb0e565275 100644
--- a/tools/testing/selftests/locking/Makefile
+++ b/tools/testing/selftests/locking/Makefile
@@ -5,6 +5,6 @@
 # No binaries, but make sure arg-less "make" doesn't trigger "run_tests"
 all:
 
-TEST_PROGS := ww_mutex.sh
+TEST_PROGS := ww_mutex.sh mx_test.sh
 
 include ../lib.mk
diff --git a/tools/testing/selftests/locking/mx_test.sh b/tools/testing/selftests/locking/mx_test.sh
new file mode 100755
index 0000000000000..6db2caafd4629
--- /dev/null
+++ b/tools/testing/selftests/locking/mx_test.sh
@@ -0,0 +1,171 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+declare mx_min_log2_elems=11
+declare mx_max_log2_elems=11
+declare mx_inc_log2_elems=1
+declare mx_seconds=1
+
+# Kselftest framework requirement - SKIP code is 4.
+declare ksft_skip=4
+
+set_low_params() {
+	mx_min_log2_elems=11
+	mx_max_log2_elems=11
+	mx_inc_log2_elems=1
+	mx_seconds=1
+}
+
+set_med_params() {
+	mx_min_log2_elems=6
+	mx_max_log2_elems=14
+	mx_inc_log2_elems=2
+	mx_seconds=2
+}
+
+set_high_params() {
+	mx_min_log2_elems=1
+	mx_max_log2_elems=23
+	mx_inc_log2_elems=2
+	mx_seconds=5
+}
+
+usage() {
+	printf "Usage: %s [-e low|medium|high] [-h]\n" "$(basename "$0")"
+}
+
+unload_module_exit_on_error() {
+	local str="$1"
+	local sts
+
+	if [ -d /sys/module/mx_test ]; then
+		/sbin/modprobe -q -r mx_test
+		sts=$?
+		if (( sts != 0 )); then
+			echo "mx_test: $str Exit status: $sts"
+			exit 1
+		fi
+	fi
+}
+
+run_test() {
+	local test=$1
+	local log2_elems
+	local sts
+
+	# Paranoia check. Unload if loaded.
+	unload_module_exit_on_error "Failed to unload preloaded mx_test module."
+
+	for log2_elems in $(seq $mx_min_log2_elems $mx_inc_log2_elems $mx_max_log2_elems); do
+		/sbin/modprobe -q mx_test mx_test="$test" \
+			       mx_nmbr_elems=$((1 << log2_elems)) \
+			       mx_scnds_per_test="$mx_seconds"
+		sts=$?
+
+		if (( sts == 0 )); then
+			unload_module_exit_on_error "Failed to unload module after test \"$test\"."
+		else
+			return $sts
+		fi
+	done
+
+	return 0
+}
+
+find_eligible_tests() {
+	local test
+
+	# Note, the following modprobe will fail and module is not loaded afterwards
+	/sbin/modprobe -q mx_test mx_test=non_existing_test
+
+	# Skip "busted" and any "foo_busted"
+	for test in $(dmesg -t | \
+			      grep mx_test_types: | \
+			      awk '{ print $2; }' | \
+			      sort -u | \
+			      grep -v busted); do
+		echo $test
+	done
+}
+
+# Run kernel selftests for lock-full and lock-less mutual exclusion tests.
+# First, check module availability.
+if ! /sbin/modprobe -q -n mx_test; then
+	echo "mx_test: module mx_test is not found [SKIP]"
+	exit $ksft_skip
+fi
+
+# Parse arguments
+while getopts :e:h arg; do
+	case $arg in
+		e)
+			case $OPTARG in
+				low)
+					set_low_params
+					;;
+				medium)
+					set_med_params
+					;;
+				high)
+					set_high_params
+					;;
+				*)
+					echo "mx_test: Invalid effort level: $OPTARG"
+					usage
+					exit 1
+					;;
+			esac
+			;;
+		h)
+			usage
+			exit 0
+			;;
+		:)
+			echo "mx_test: Option -$OPTARG requires an argument"
+			usage
+			exit 1
+			;;
+		\?)
+			echo "mx_test: Unknown option -$OPTARG"
+			usage
+			exit 1
+			;;
+	esac
+done
+
+shift "$((OPTIND - 1))"
+
+if (($# != 0)); then
+	echo "mx_test: Unexpected argument: $1"
+	usage
+	exit 1
+fi
+
+# First, run "busted" to verify the test environment. If this test
+# doesn't fail, there is no point in performing more tests in this
+# environment.
+run_test "busted"
+sts=$?
+if (( sts == 0 )); then
+	echo mx_test: The test \"busted\" did not fail. Probable cause: UP kernel or too few CPUs online.
+	echo mx_test: Hence, skipping the rest of the tests.
+	exit $ksft_skip
+fi
+
+eligible_test="$(find_eligible_tests)"
+if [ -z "$eligible_test" ]; then
+	echo mx_test: No tests found. Skipping.
+	exit $ksft_skip
+fi
+
+for test in $eligible_test; do
+	run_test "$test"
+	sts=$?
+	if (( sts != 0 )); then
+		echo mx_test: Test \"$test\" failed
+		exit 1
+	fi
+done
+
+echo mx_test: All tests passed
+exit 0
-- 
2.43.5

