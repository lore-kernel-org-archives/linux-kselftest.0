Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D83641F5EE;
	Mon, 17 Aug 2026 13:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786971840; cv=none; b=EkV5hTqn9OEIhisUwqXjDZlZmcPGKcTBxzBAXXnC4Yw8NsCSAHaqSc1gyJNfEUa2PSdtLVNJkHpDupQh2/Lnh5fRZF9OTApjq/U3W7YufC1Vbsbc9bgIyoVJVeSn6oOtE2Si+FSPh2x0HWGTS78VHtz4Mqp9uSHpzTtCrgx7tlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786971840; c=relaxed/simple;
	bh=q4Nd43VO5p2L2oeaTXK+WXyncV1ZJm4yse+rh2qdWIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iXFQYWbAWIEY+VVP38jrES1npkofrIRcz27wQ/6HAZKF9yhEgdzzsHH/c+6UjJAB2GdthaI4qqgoc+1jVDKAgwTIHsLfLZo6F8hIL5kXC00OIRcCS/gGMIWUMoezGowvFSVInK7MDRi1+2w7nYendq7qryvqJlD8RXNCF8YtqOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rtdVG0lF; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rtdVG0lF"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H0CgUK452514;
	Mon, 17 Aug 2026 13:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=b35eTKWwlCdRUO8Mhpnvsut46UPPFz/MBTQ2ZxyLT7A=; b=
	rtdVG0lF+hoCEuDyYHHG3+Wgy62UkRJAOwE5GoPIRPL/7FW5xoOcUv/VB5UwOe68
	oGLIgYzkoGjvggG2Wri7wRXc5+iE2nvO1Ob7V4xOK0UGLpIhc2N55+/pTmkyusvh
	McKfPtfn3LZFk8CXzXkkPwPSHAA1GMyLhE3saFK1zAuTgaD656TY2tfjP6ntwm5u
	1KmJdMgOhy1yz1owfdIiW6O8FiNs74wnl43c/dmt0R4ULLxRZ4bb+Lt32CwJ0XQ7
	etk+hwH2dToOaHVdY3Ky+f3uZxClL9+ZT1h3yibEdfNl66he3A/eA93LdxawLrWk
	IJZ3sVWQvaLN2+daLy/tNg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g2g5ca9ku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Aug 2026 13:03:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67HD0i1R038750;
	Mon, 17 Aug 2026 13:03:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4g2ejpcmxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Aug 2026 13:03:32 +0000 (GMT)
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67HCsMb4021766;
	Mon, 17 Aug 2026 13:03:32 GMT
Received: from lab61.no.oracle.com (lab61.no.oracle.com [10.172.144.82])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4g2ejpcmpq-2;
	Mon, 17 Aug 2026 13:03:32 +0000 (GMT)
From: =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>
To: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, John Stultz <jstultz@google.com>,
        =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>
Subject: [PATCH 1/1] kernel/locking: Add mutual exclusion self-test
Date: Mon, 17 Aug 2026 15:02:36 +0200
Message-ID: <20260817130239.343594-2-haakon.bugge@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260817130239.343594-1-haakon.bugge@oracle.com>
References: <20260817130239.343594-1-haakon.bugge@oracle.com>
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
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608170099
X-Authority-Analysis: v=2.4 cv=INoyzAvG c=1 sm=1 tr=0 ts=6a8306a5 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22 a=BqU2WV_vvsyTyxaotp0D:22
 a=yPCof4ZbAAAA:8 a=eXRUXUCfHJ3hkrAvezUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13509
X-Proofpoint-GUID: kSsHfHr1EKgB7V12AGQ4f6LYH-Dp7ZDQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA5OSBTYWx0ZWRfX9JTGDUV8ppFc
 tZ//F9CaCfkt7GXJu4mbAvuFicyG2L2DeQHOUU5jqN1WPTIYlmJgUU8W3wWYh/9OUf/NgDbd76W
 /jp6Kox09tuzMeeYs0aXUWoekmJylk3FnK8xd7M2jA1/Vnp9Q7OQuQu5nVkigCPRhTrbJj3o6xW
 PoHJuFw+VQjPl57FgJou/q0dctoz+BO43pf93s4bbe9goTLw8MV7+AYmZZqPFy/Wz7yhu2Zq3r4
 C+1lpeImw0eQ5RBgzFYnYGyQkwmc2sN8kedAvfajDWStpaik1tT93CB29DmA5iOrPtJTZWXS+z3
 3qCFLoH7J5js1TjPtgn6B1YZxABmGr9zYU1DbWyLChTcJXzGSBhxI0BIGmQL1ftXbQg58Ga1VCf
 b06hzYTc6UXmtXgIIArwsBV3dXispVoJESqAv5d4WGgP/nhGuq0sT3vkVz1Bs7nYB0yvOUpflWJ
 6io75FanNFdJ+vIMrKIO0M/YY7HZHpjZyAqCFuB8=
X-Proofpoint-ORIG-GUID: kSsHfHr1EKgB7V12AGQ4f6LYH-Dp7ZDQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA5OSBTYWx0ZWRfX+YANOQm7QBcI
 itgiRlRyTFnUB2XcTR01rbCrVY80XLl7ODfFdNasNmzTvIoyj5xbtCT/Ambn/0LfHVhxp8vjAAq
 s5yH0FdgwpqonJy86Tge8Iz42uWKo2g4MPQBo5F9VGfifqaLPfLy

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
        Number of elements in the array. The default is 1000.

    mx_test:
        Test variant to run. Supported variants include spin_lock,
        spin_lock_irq, spin_lock_irqsave, and write_lock. Specifying an
        unknown variant causes the module to print the complete list of
        supported variants. The default is spin_lock.

    mx_scnds_per_test:
        Duration of each test run, in seconds. The default is 1.

    mx_min_padding:
        Minimum padding value to test. The default is 8 bytes.

    mx_max_padding:
        Maximum padding value to test. The default is 8 bytes.

After all workers have stopped, the test sums the counters and reports
a failure if the result is nonzero. Such a result indicates that the
expected invariant was violated. Because this is a stress test, a zero
result means only that no failure was observed during that run.

The test can expose ordering regressions in atomic bit operations. For
example, reverting commit 415d83249709 ("locking/atomic: Make
test_and_*_bit() ordered on failure") causes the
test_and_clear_bit_innov and test_and_set_bit_innov variants to fail
on weakly ordered ARM systems. These variants rely on a failing
test_and_*_bit() operation to enforce visibility of updates to other
processors, rather than using smp_mb__before_atomic(). They therefore
provide regression coverage for commit 415d83249709.

The harness also includes variants that reproduce known incorrect uses
of these primitives. Before commit 1422f28826d2 ("rds: introduce
acquire/release ordering in acquire/release_in_xmit()"), RDS used them
without the required acquire/release ordering. The rds_busted variant
models that bug and fails on ARM systems.

The padding parameters allow the layout of the test data to be varied.
Empirically, the known failures are reproduced only when the padding is
congruent to 8 modulo 16. The precise reason has not been established,
but the relative placement of the lock and counter across cache-line or
page boundaries appears to matter.

The patch also adds a shell script for the CI kselftest framework. The
script first runs the busted variant, which performs the updates
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
 kernel/locking/Makefile                    |   1 +
 kernel/locking/mx_test.c                   | 707 +++++++++++++++++++++
 lib/Kconfig.debug                          |   9 +
 tools/testing/selftests/locking/Makefile   |   2 +-
 tools/testing/selftests/locking/mx_test.sh | 181 ++++++
 5 files changed, 899 insertions(+), 1 deletion(-)
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
index 0000000000000..71d9ddc48a44b
--- /dev/null
+++ b/kernel/locking/mx_test.c
@@ -0,0 +1,707 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/completion.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/random.h>
+#include <linux/rwlock.h>
+#include <linux/slab.h>
+#include <linux/smp.h>
+#include <linux/spinlock.h>
+#include <linux/vmalloc.h>
+#include <linux/workqueue.h>
+#include <linux/ww_mutex.h>
+
+static unsigned long mx_scnds_per_test = 1;
+static unsigned int mx_nmbr_elems = 1000;
+static unsigned int mx_min_padding = 8;
+static unsigned int mx_max_padding = 8;
+static char *mx_test = "spin_lock";
+
+module_param(mx_scnds_per_test, ulong, 0444);
+MODULE_PARM_DESC(mx_scnds_per_test, "Number of seconds to run for each test iteration (default is 1)");
+
+module_param(mx_nmbr_elems, uint, 0444);
+MODULE_PARM_DESC(mx_nmbr_elems, "Number of elements (default 1000)");
+
+module_param(mx_min_padding, uint, 0444);
+MODULE_PARM_DESC(mx_min_padding, "Minimum padding (default 8)");
+
+module_param(mx_max_padding, uint, 0444);
+MODULE_PARM_DESC(mx_max_padding, "Maximum padding (default 8)");
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
+	MX_CMPXCHG,
+	MX_RDS_BUSTED,
+	MX_TEST_AND_SET_BIT_LOCK,
+	MX_TEST_AND_SET_BIT_INNOV,
+	MX_TEST_AND_SET_BIT_PLAIN,
+	MX_TEST_AND_CLEAR_BIT_INNOV,
+	MX_TEST_AND_CLEAR_BIT_PLAIN,
+	MX_SINGLE_WW_MUTEX_WW,	/* Wound-Wait */
+	MX_SINGLE_WW_MUTEX_WD,	/* Wait-Die */
+};
+
+union mx_elem {
+	struct {
+		long counter;
+	} mx_busted;
+	struct {
+		/* Protecting counter */
+		spinlock_t lock;
+		long counter;
+	} mx_spin;
+	struct {
+		rwlock_t lock;
+		long counter;
+	} mx_rw;
+	struct {
+		/* Protecting counter */
+		struct mutex mutex;
+		long counter;
+	} mx_mutex;
+	struct {
+		atomic_t counter;
+	} mx_atomic_add;
+	struct {
+		long counter;
+	} mx_cmpxchg;
+	struct {
+		unsigned long bits;
+		long counter;
+	} mx_rds_busted;
+	struct {
+		unsigned long bits;
+		long counter;
+	} mx_test_and_set_bit_lock;
+	struct {
+		unsigned long bits;
+		long counter;
+	} mx_test_and_set_clr_bit;
+	struct {
+		struct ww_mutex ww_mutex;
+		long counter;
+	} mx_single_ww_mutex;
+};
+
+struct mx_inc_dec_params {
+	struct work_struct work;
+	union mx_elem *elements;
+	unsigned int nelems;
+	unsigned long timeout;
+	enum mx_test mx_type;
+	int padding;
+	u64 iter;
+	struct completion completion;
+};
+
+static inline unsigned int mx_rand(unsigned int *seed)
+{
+	*seed = *seed * 69069 + 111;
+	return *seed;
+}
+
+static inline void mx_acquire(union mx_elem *el, enum mx_test typ, unsigned long *flags_ptr)
+{
+	int ret;
+
+	switch (typ) {
+	case MX_BUSTED:
+		break;
+	case MX_SPIN_LOCK:
+		spin_lock(&el->mx_spin.lock);
+		break;
+	case MX_SPIN_LOCK_IRQ:
+		spin_lock_irq(&el->mx_spin.lock);
+		break;
+	case MX_SPIN_LOCK_IRQSAVE:
+		spin_lock_irqsave(&el->mx_spin.lock, *flags_ptr);
+		break;
+	case MX_RW_LOCK_W:
+		write_lock(&el->mx_rw.lock);
+		break;
+	case MX_RW_LOCK_W_BH:
+		write_lock_bh(&el->mx_rw.lock);
+		break;
+	case MX_RW_LOCK_TRW:
+		while (!read_trylock(&el->mx_rw.lock))
+			;
+		read_unlock(&el->mx_rw.lock);
+		write_lock(&el->mx_rw.lock);
+		break;
+	case MX_RW_LOCK_TRW_BH:
+		while (!read_trylock(&el->mx_rw.lock))
+			;
+		read_unlock(&el->mx_rw.lock);
+		write_lock_bh(&el->mx_rw.lock);
+		break;
+	case MX_MUTEX:
+		mutex_lock(&el->mx_mutex.mutex);
+		break;
+	case MX_ATOMIC_ADD:
+	case MX_CMPXCHG:
+		break;
+	case MX_RDS_BUSTED:
+		while (test_and_set_bit(MX_RDS_IN_XMIT, &el->mx_rds_busted.bits))
+			;
+		break;
+	case MX_TEST_AND_SET_BIT_LOCK:
+		while (test_and_set_bit_lock(MX_RDS_IN_XMIT, &el->mx_test_and_set_bit_lock.bits))
+			;
+		break;
+	case MX_TEST_AND_SET_BIT_INNOV:
+	case MX_TEST_AND_SET_BIT_PLAIN:
+		while (test_and_set_bit(MX_SOME_BIT, &el->mx_test_and_set_clr_bit.bits))
+			;
+		break;
+	case MX_TEST_AND_CLEAR_BIT_INNOV:
+	case MX_TEST_AND_CLEAR_BIT_PLAIN:
+		while (!test_and_clear_bit(MX_SOME_BIT, &el->mx_test_and_set_clr_bit.bits))
+			;
+		break;
+	case MX_SINGLE_WW_MUTEX_WW:
+	case MX_SINGLE_WW_MUTEX_WD:
+		ret = ww_mutex_lock(&el->mx_single_ww_mutex.ww_mutex, NULL);
+		WARN_ONCE(ret, "ww_mutex_lock returned %d for the single w/w mutex case\n", ret);
+		break;
+	default:
+		WARN_ON_ONCE(true);
+	}
+}
+
+static inline void mx_release(union mx_elem *el, enum mx_test typ, unsigned long *flags_ptr)
+{
+	switch (typ) {
+	case MX_BUSTED:
+		break;
+	case MX_SPIN_LOCK:
+		spin_unlock(&el->mx_spin.lock);
+		break;
+	case MX_SPIN_LOCK_IRQ:
+		spin_unlock_irq(&el->mx_spin.lock);
+		break;
+	case MX_SPIN_LOCK_IRQSAVE:
+		spin_unlock_irqrestore(&el->mx_spin.lock, *flags_ptr);
+		break;
+	case MX_RW_LOCK_W:
+	case MX_RW_LOCK_TRW:
+		write_unlock(&el->mx_rw.lock);
+		break;
+	case MX_RW_LOCK_W_BH:
+	case MX_RW_LOCK_TRW_BH:
+		write_unlock_bh(&el->mx_rw.lock);
+		break;
+	case MX_MUTEX:
+		mutex_unlock(&el->mx_mutex.mutex);
+		break;
+	case MX_ATOMIC_ADD:
+	case MX_CMPXCHG:
+		break;
+	case MX_RDS_BUSTED:
+		clear_bit(MX_RDS_IN_XMIT, &el->mx_rds_busted.bits);
+		/* Deliberately outside the critical region, as RDS did prior to 1422f288 */
+		smp_mb__after_atomic();
+		break;
+	case MX_TEST_AND_SET_BIT_LOCK:
+		clear_bit_unlock(MX_RDS_IN_XMIT, &el->mx_test_and_set_bit_lock.bits);
+		break;
+	case MX_TEST_AND_SET_BIT_INNOV:
+		/*
+		 * Ensuring global visibility on other processors by
+		 * means of a failing test_and_set_bit()
+		 */
+		(void)test_and_set_bit(MX_SOME_BIT, &el->mx_test_and_set_clr_bit.bits);
+		clear_bit(MX_SOME_BIT, &el->mx_test_and_set_clr_bit.bits);
+		break;
+	case MX_TEST_AND_SET_BIT_PLAIN:
+		/* Ensure the counter gets global visiblity before releasing the lock*/
+		smp_mb__before_atomic();
+		clear_bit(MX_SOME_BIT, &el->mx_test_and_set_clr_bit.bits);
+		break;
+	case MX_TEST_AND_CLEAR_BIT_INNOV:
+		/*
+		 * Ensuring global visibility on other processors by
+		 * means of a failing test_and_clear_bit()
+		 */
+		(void)test_and_clear_bit(MX_SOME_BIT, &el->mx_test_and_set_clr_bit.bits);
+		set_bit(MX_SOME_BIT, &el->mx_test_and_set_clr_bit.bits);
+		break;
+	case MX_TEST_AND_CLEAR_BIT_PLAIN:
+		/* Ensure the counter gets global visiblity before releasing the lock*/
+		smp_mb__before_atomic();
+		set_bit(MX_SOME_BIT, &el->mx_test_and_set_clr_bit.bits);
+		break;
+	case MX_SINGLE_WW_MUTEX_WW:
+	case MX_SINGLE_WW_MUTEX_WD:
+		ww_mutex_unlock(&el->mx_single_ww_mutex.ww_mutex);
+		break;
+	default:
+		WARN_ON_ONCE(true);
+	}
+}
+
+static inline void mx_add(union mx_elem *el, enum mx_test typ, long addend)
+{
+	long old;
+
+	switch (typ) {
+	case MX_BUSTED:
+		el->mx_busted.counter += addend;
+		break;
+	case MX_SPIN_LOCK:
+	case MX_SPIN_LOCK_IRQ:
+	case MX_SPIN_LOCK_IRQSAVE:
+		el->mx_spin.counter += addend;
+		break;
+	case MX_RW_LOCK_W:
+	case MX_RW_LOCK_W_BH:
+	case MX_RW_LOCK_TRW:
+	case MX_RW_LOCK_TRW_BH:
+		el->mx_rw.counter += addend;
+		break;
+	case MX_MUTEX:
+		el->mx_mutex.counter += addend;
+		break;
+	case MX_ATOMIC_ADD:
+		atomic_add(addend, &el->mx_atomic_add.counter);
+		break;
+	case MX_CMPXCHG:
+		do {
+			old = READ_ONCE(el->mx_cmpxchg.counter);
+		} while (cmpxchg(&el->mx_cmpxchg.counter, old, old + addend) != old);
+		break;
+	case MX_RDS_BUSTED:
+		el->mx_rds_busted.counter += addend;
+		break;
+	case MX_TEST_AND_SET_BIT_LOCK:
+		el->mx_test_and_set_bit_lock.counter += addend;
+		break;
+	case MX_TEST_AND_SET_BIT_INNOV:
+	case MX_TEST_AND_SET_BIT_PLAIN:
+	case MX_TEST_AND_CLEAR_BIT_INNOV:
+	case MX_TEST_AND_CLEAR_BIT_PLAIN:
+		el->mx_test_and_set_clr_bit.counter += addend;
+		break;
+	case MX_SINGLE_WW_MUTEX_WW:
+	case MX_SINGLE_WW_MUTEX_WD:
+		el->mx_single_ww_mutex.counter += addend;
+		break;
+	default:
+		WARN_ON_ONCE(true);
+	}
+}
+
+static inline long mx_read(union mx_elem *el, enum mx_test typ)
+{
+	switch (typ) {
+	case MX_BUSTED:
+		return el->mx_busted.counter;
+	case MX_SPIN_LOCK:
+	case MX_SPIN_LOCK_IRQ:
+	case MX_SPIN_LOCK_IRQSAVE:
+		return el->mx_spin.counter;
+	case MX_RW_LOCK_W:
+	case MX_RW_LOCK_W_BH:
+	case MX_RW_LOCK_TRW:
+	case MX_RW_LOCK_TRW_BH:
+		return el->mx_rw.counter;
+	case MX_MUTEX:
+		return el->mx_mutex.counter;
+	case MX_ATOMIC_ADD:
+		return atomic_read(&el->mx_atomic_add.counter);
+	case MX_CMPXCHG:
+		return el->mx_cmpxchg.counter;
+	case MX_RDS_BUSTED:
+		return el->mx_rds_busted.counter;
+	case MX_TEST_AND_SET_BIT_LOCK:
+		return el->mx_test_and_set_bit_lock.counter;
+	case MX_TEST_AND_SET_BIT_INNOV:
+	case MX_TEST_AND_SET_BIT_PLAIN:
+	case MX_TEST_AND_CLEAR_BIT_INNOV:
+	case MX_TEST_AND_CLEAR_BIT_PLAIN:
+		return el->mx_test_and_set_clr_bit.counter;
+	case MX_SINGLE_WW_MUTEX_WW:
+	case MX_SINGLE_WW_MUTEX_WD:
+		return el->mx_single_ww_mutex.counter;
+	default:
+		WARN_ON_ONCE(true);
+	}
+	return 0;
+}
+
+static inline void mx_init(union mx_elem *el, enum mx_test typ)
+{
+	switch (typ) {
+	case MX_SPIN_LOCK:
+	case MX_SPIN_LOCK_IRQ:
+	case MX_SPIN_LOCK_IRQSAVE:
+		spin_lock_init(&el->mx_spin.lock);
+		break;
+	case MX_RW_LOCK_W:
+	case MX_RW_LOCK_W_BH:
+	case MX_RW_LOCK_TRW:
+	case MX_RW_LOCK_TRW_BH:
+		rwlock_init(&el->mx_rw.lock);
+		break;
+	case MX_MUTEX:
+		mutex_init(&el->mx_mutex.mutex);
+		break;
+	case MX_TEST_AND_CLEAR_BIT_INNOV:
+	case MX_TEST_AND_CLEAR_BIT_PLAIN:
+		set_bit(MX_SOME_BIT, &el->mx_test_and_set_clr_bit.bits);
+		break;
+	/* The following relies on the vzalloc below */
+	case MX_BUSTED:
+	case MX_ATOMIC_ADD:
+	case MX_CMPXCHG:
+	case MX_RDS_BUSTED:
+	case MX_TEST_AND_SET_BIT_LOCK:
+	case MX_TEST_AND_SET_BIT_INNOV:
+	case MX_TEST_AND_SET_BIT_PLAIN:
+		break;
+	case MX_SINGLE_WW_MUTEX_WW:
+		ww_mutex_init(&el->mx_single_ww_mutex.ww_mutex, &ww_class);
+		break;
+	case MX_SINGLE_WW_MUTEX_WD:
+		ww_mutex_init(&el->mx_single_ww_mutex.ww_mutex, &wd_class);
+		break;
+	default:
+		WARN_ON_ONCE(true);
+	}
+}
+
+static inline void mx_fini(union mx_elem *el, enum mx_test typ)
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
+	case MX_CMPXCHG:
+	case MX_RDS_BUSTED:
+	case MX_TEST_AND_SET_BIT_LOCK:
+	case MX_TEST_AND_SET_BIT_INNOV:
+	case MX_TEST_AND_SET_BIT_PLAIN:
+		break;
+	case MX_MUTEX:
+		mutex_destroy(&el->mx_mutex.mutex);
+		break;
+	case MX_SINGLE_WW_MUTEX_WW:
+	case MX_SINGLE_WW_MUTEX_WD:
+		ww_mutex_destroy(&el->mx_single_ww_mutex.ww_mutex);
+		break;
+	default:
+		WARN_ON_ONCE(true);
+	}
+}
+
+/*
+ * Empirically, tests have shown that alignment of the union used here
+ * matters a lot when it comes to detecting incorrect locking schemes
+ * or error in locking primitives. The alignment will to a variable
+ * extent create false-sharing in the different cache levels, which is
+ * like a catalyst provoking bugs.
+ */
+static inline union mx_elem *add_pad(const union mx_elem *el, size_t inx, size_t pad)
+{
+	return (union mx_elem *)((uintptr_t)el + inx * (sizeof(*el) + pad));
+}
+
+static void mx_inc_dec(struct work_struct *_work)
+{
+	struct mx_inc_dec_params *params;
+	unsigned long flags;
+	union mx_elem *el;
+	unsigned int seed;
+	u64 iter = 0;
+	int padding;
+
+	params = container_of(_work, struct mx_inc_dec_params, work);
+	el = params->elements;
+	padding = params->padding;
+
+	get_random_bytes(&seed, sizeof(seed));
+	do {
+		unsigned int inx1 = mx_rand(&seed) % params->nelems;
+		unsigned int inx2 = mx_rand(&seed) % params->nelems;
+		union mx_elem *rnd_el1 = add_pad(el, inx1, padding);
+		union mx_elem *rnd_el2 = add_pad(el, inx2, padding);
+
+		++iter;
+
+		mx_acquire(rnd_el1, params->mx_type, &flags);
+		mx_add(rnd_el1, params->mx_type, 1);
+		mx_release(rnd_el1, params->mx_type, &flags);
+
+		mx_acquire(rnd_el2, params->mx_type, &flags);
+		mx_add(rnd_el2, params->mx_type, -1);
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
+static int run_test(const enum mx_test test, const char *mnemonic, const int threads,
+		    const int padding)
+{
+	struct mx_inc_dec_params *params = kzalloc_objs(*params, threads);
+	unsigned long start_jf = jiffies;
+	u64 total_iters = 0;
+	union mx_elem *el = NULL;
+	unsigned long ms;
+	long sum = 0;
+	size_t bytes;
+	int ret = 0;
+	int i;
+
+	if (check_mul_overflow((size_t)mx_nmbr_elems,
+			       sizeof(*el) + (size_t)padding, &bytes)) {
+		ret = -EOVERFLOW;
+		goto exit_free;
+	}
+
+	el = vzalloc(bytes);
+
+	if (!el || !params) {
+		ret = -ENOMEM;
+		goto exit_free;
+	}
+
+	for (i = 0; i < mx_nmbr_elems; ++i)
+		mx_init(add_pad(el, i, padding), test);
+
+	for (i = 0; i < threads; ++i) {
+		struct mx_inc_dec_params *p = params + i;
+
+		p->elements = el;
+		p->nelems = mx_nmbr_elems;
+		p->timeout = jiffies + mx_scnds_per_test * HZ;
+		p->mx_type = test;
+		p->padding = padding;
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
+		mx_fini(add_pad(el, i, padding), test);
+
+	if (total_iters > LONG_MAX)
+		pr_warn_once("mx_test: Total number of iterations %llu exceeds LONG_MAX; consider reducing mx_scnds_per_test\n",
+			     total_iters);
+
+	for (i = 0; i < mx_nmbr_elems; ++i)
+		sum += mx_read(add_pad(el, i, padding), test);
+	ms = jiffies_to_msecs(jiffies - start_jf);
+
+	pr_notice_or_err(sum,
+			 "mx_test: %-27s padding: %2d result: %s sum: %ld elements: %d elapsed: %lu.%03lu seconds\n",
+			 mnemonic, padding, !sum ? "SUCCESS" : "FAILURE", sum, mx_nmbr_elems,
+			 ms / 1000, ms % 1000);
+	if (sum)
+		ret = -EFAULT;
+
+exit_free:
+	vfree(el);
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
+	unsigned int p;
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
+	if ((mx_min_padding % 8) || (mx_max_padding % 8)) {
+		pr_err("mx_test: padding must be a multiple of 8 bytes\n");
+		return -EINVAL;
+	}
+
+	if (mx_min_padding > mx_max_padding) {
+		pr_err("mx_test: mx_min_padding must be less than equal to mx_max_padding\n");
+		return -EINVAL;
+	}
+
+	if (mx_max_padding > L1_CACHE_BYTES) {
+		pr_err("mx_test: mx_max_padding must be less than equal to L1_CACHE_BYTES (%d)\n",
+		       L1_CACHE_BYTES);
+		return -EINVAL;
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
+	for (p = mx_min_padding; p <= mx_max_padding; p += 8) {
+		int sts = run_test(test, mnemonic, threads,  p);
+
+		if (sts)
+			return sts;
+	}
+
+	return 0;
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
+
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 1244dcac2294a..1d7cf1f22d457 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1734,6 +1734,15 @@ config CSD_LOCK_WAIT_DEBUG_DEFAULT
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
index 0000000000000..9e365a6da74e9
--- /dev/null
+++ b/tools/testing/selftests/locking/mx_test.sh
@@ -0,0 +1,181 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+declare mx_min_log2_elems=10
+declare mx_max_log2_elems=10
+declare mx_inc_log2_elems=1
+declare mx_seconds=1
+declare mx_min_pad=8
+declare mx_max_pad=8
+
+# Kselftest framework requirement - SKIP code is 4.
+declare ksft_skip=4
+
+set_low_params() {
+	mx_min_log2_elems=10
+	mx_max_log2_elems=10
+	mx_inc_log2_elems=1
+	mx_seconds=1
+	mx_min_pad=8
+	mx_max_pad=8
+}
+
+set_med_params() {
+	mx_min_log2_elems=8
+	mx_max_log2_elems=12
+	mx_inc_log2_elems=2
+	mx_seconds=2
+	mx_min_pad=8
+	mx_max_pad=24
+}
+
+set_high_params() {
+	mx_min_log2_elems=1
+	mx_max_log2_elems=28
+	mx_inc_log2_elems=4
+	mx_seconds=5
+	mx_min_pad=0
+	mx_max_pad=56
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
+			       mx_scnds_per_test="$mx_seconds" \
+			       mx_min_padding="$mx_min_pad" \
+			       mx_max_padding="$mx_max_pad"
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

