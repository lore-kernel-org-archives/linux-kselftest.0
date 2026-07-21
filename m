Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071123FE37A
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 01:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784598186; cv=none; b=XuZVhLYqEBEHX5ZN6s9iYi5KuQfKCcsyYzzsA+poY1761MDaRlCzlpDpX2opQNf97oqC3sUPYH6Dm43U8/uBUC/Fd47qpx8A7W6j+FP50JfdUihBZrXSPsXOoLk797whJxZs3cXbWSGdBwUHXHT8AHBm9PVgnHFBI/XxdXdbbfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784598186; c=relaxed/simple;
	bh=Cvd62BSbfK1YUoNmu2cB4JDmKSrIffYs7NUg+4REHIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ISJi4be/XWKM3CJ+KgsX3eYVoMen0AmeW6ikHRTNT+AdiJobb9Z5Jv7FuOgYTD5uDoHtKxjJbPMJREQGgb4UeKGAtboUyb2C8jB6i2lsA5YP9esweOZ/IIr6WRHBanHkOs5L5ec31wcFjOlNPt5ZUnbXBQsRfQurpj1QopoX7zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqUNzFHZ; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqUNzFHZ"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8ff5d1b0f91so72944676d6.2
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 18:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784598184; x=1785202984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=13+pPfiHFxOsE9sDGlKpSdwFAptP38k5m91XQ1ijMSw=;
        b=QqUNzFHZPzCG3pDpkkATGqBqa6u+IZ99mdtBjCquUHRCYlnlX97GWpgOD+vNDlehgt
         qI5PCOCWiBcWYPk2StSsk9ZcwxD6v8JQvbeb/+kLpmIuHj27AZ3B91+NsFK5Qa+W7QbB
         27/1jFpsKrnxsIgLmO4wji95cSANXGwfvc5ioL2Nk6dxzeSC9xTcHBMWWlodQF6EEhv/
         p4CR/zKXjOTsglJJyw6Wha81teM634eFSsWmtKQs+6RLiLOAQElyxiPu16z1N268G4wI
         bHDP4j9iwM7YoH9YtlR4ebowGSb3vqft1rDxuJrkVeVuXWTHPuRPyMsZ8+zEvv46Z70r
         HN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784598184; x=1785202984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=13+pPfiHFxOsE9sDGlKpSdwFAptP38k5m91XQ1ijMSw=;
        b=jL29rqOk5ud00V4CB38fV4Jg94mq2bBTfuOsP429pJXnmqmPPNYfPfauhy9aXA9Tp7
         8sIyF/nCdBLrnewKbpJxSoiPAjqx+CMjwC2xyki9bGEWl62lP/Yf+3XeJfieGOaru+Ej
         IcB39gHcBgc35KTT8OWz70TH+Lj68zfzfEvIEBHD2o5TQLuZhM5AQDaCI4im+BlN6p23
         MAF/iWunMgT3RgJiyoq8ZkwpuovxU5reWQd+2Oo1KcYuKKUE5QP7aTLcluPjwVyMvhHQ
         1Ay+e3NIxL96l0Ar4W5CtVrOKo9zOXfiWAOSAWOd4fWnvvtuBMsDqmNBT0OxbPH5dv/l
         IX0Q==
X-Forwarded-Encrypted: i=1; AHgh+RpR+SZw4/z94c/T9s/BVW21un3ODTwp4Ga7ibt4m+eEzNh219T8rNCZXeSpOgAe9gQak84MossLzDOgiqUWOxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeNIYuIKk0SA/Oh2OsVuIgLmwA3zYeynmQ7jdL+x65Wawkma3T
	S+jR90QEpP9PfCIl+4q4tl8LjqwRv5Itvl+gy8V+SJA8R6KU/Avkki0G
X-Gm-Gg: AR+sD11wEeXpqQ60Yef+LCQtbKqRgNWrHOKjOhd9q5PIZeQyKcE1RT/ErdLqGMJ3FVX
	mUjFiMBzklxpBajWhmh0uD5kgT+8syAxz0ytnlHYUmVZNiYLezkGjhVNU1FWPYSEy/wkfQssxxw
	rG5v4WcowZb0lBGht04gcQq/g+zdvqjR2119dOWm0c43Mx4ZQXcTtB0t6YKBNlYUvcFkE7JebZC
	TCbPpUBMteWnFP/wgqMlqsKqVD1gHRgstrxRHoIEjaDveOqpX5GcEZSKoCYiFfg8k4DIj9OMa5y
	71W2eAkpaqp2mOcsm4Qi2pE2xLW6Cg7cG6lUqgjORh4qcxBcXji12CxtQ9LJ7vBE3vMKnGidWN5
	l+1J8x6sTvJ6gInMX6bv8xJZVs+yOGRIL+mLYiUUAZnluN4w1YgPRcEqJVXM2f7wYpvcO4+Jd56
	LtPJzQBQLBYKsj+TxNTW4nRz/0WWB6OuxAR+8cxwT0gRZuNfTW/3Gxc4hMLvwK5rTYKlpIcEN1x
	gUmfMcPc2FPUWbJB71KCgfPT3w=
X-Received: by 2002:ad4:5d63:0:b0:8ef:e857:c9d6 with SMTP id 6a1803df08f44-90778357dafmr156356076d6.22.1784598183672;
        Mon, 20 Jul 2026 18:43:03 -0700 (PDT)
Received: from ip-172-31-15-253.ec2.internal (ec2-13-222-20-6.compute-1.amazonaws.com. [13.222.20.6])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9077871f650sm104418266d6.45.2026.07.20.18.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 18:43:03 -0700 (PDT)
From: Deep Shah <deepshah146@gmail.com>
To: netdev@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Simon Horman <horms@kernel.org>,
	Deep Shah <deepshah146@gmail.com>
Subject: [PATCH v2 net 2/2] selftests: ptp: add a regression test for the frequency adjustment overflow
Date: Tue, 21 Jul 2026 01:42:56 +0000
Message-ID: <20260721014256.1876-3-deepshah146@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721014256.1876-1-deepshah146@gmail.com>
References: <20260721014256.1876-1-deepshah146@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

testptp's -f option stores the requested adjustment as an int ppb and
converts it to scaled ppm, so it cannot express the 64-bit scaled-ppm
values needed to overflow scaled_ppm_to_ppb() and bypass the max_adj
check enforced by ptp_clock_adjtime().

Add a small test that crafts struct timex.freq directly and verifies that
an overflowing frequency adjustment is rejected with -ERANGE.  The test
skips when no frequency-adjustable PTP device is available.

Signed-off-by: Deep Shah <deepshah146@gmail.com>
---
 tools/testing/selftests/ptp/Makefile          |  2 +-
 .../testing/selftests/ptp/ptp_freq_overflow.c | 99 +++++++++++++++++++
 2 files changed, 100 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/ptp/ptp_freq_overflow.c

diff --git a/tools/testing/selftests/ptp/Makefile b/tools/testing/selftests/ptp/Makefile
index 8f57f88ecadd..dd7376cc9bf5 100644
--- a/tools/testing/selftests/ptp/Makefile
+++ b/tools/testing/selftests/ptp/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 CFLAGS += $(KHDR_INCLUDES)
-TEST_GEN_PROGS := testptp
+TEST_GEN_PROGS := testptp ptp_freq_overflow
 LDLIBS += -lrt
 TEST_PROGS = phc.sh
 
diff --git a/tools/testing/selftests/ptp/ptp_freq_overflow.c b/tools/testing/selftests/ptp/ptp_freq_overflow.c
new file mode 100644
index 000000000000..417c0516622d
--- /dev/null
+++ b/tools/testing/selftests/ptp/ptp_freq_overflow.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Regression test for the scaled_ppm_to_ppb() integer overflow that allowed
+ * a crafted clock_adjtime(ADJ_FREQUENCY) to bypass the PTP max_adj check.
+ *
+ * testptp's -f option stores the adjustment as an int ppb and cannot express
+ * the 64-bit scaled-ppm values needed to overflow the conversion, so this
+ * test crafts struct timex.freq directly.
+ */
+#define _GNU_SOURCE
+#define __SANE_USERSPACE_TYPES__
+#include <errno.h>
+#include <fcntl.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/timex.h>
+#include <time.h>
+#include <unistd.h>
+#include <linux/ptp_clock.h>
+#include "../kselftest.h"
+
+#define FD_TO_CLOCKID(fd)	((clockid_t)((((unsigned int)~(fd)) << 3) | 3))
+
+/* clock_adjtime is not available in GLIBC < 2.14 */
+#if !__GLIBC_PREREQ(2, 14)
+#include <sys/syscall.h>
+static int clock_adjtime(clockid_t id, struct timex *tx)
+{
+	return syscall(__NR_clock_adjtime, id, tx);
+}
+#endif
+
+int main(int argc, char *argv[])
+{
+	const char *device = argc > 1 ? argv[1] : "/dev/ptp0";
+	struct ptp_clock_caps caps;
+	struct timex restore = { 0 };
+	struct timex tx = { 0 };
+	clockid_t clkid;
+	int fd, ret;
+
+	ksft_print_header();
+	ksft_set_plan(1);
+
+	if (sizeof(tx.freq) < 8)
+		ksft_exit_skip("the overflow only affects 64-bit kernels\n");
+
+	fd = open(device, O_RDWR);
+	if (fd < 0)
+		ksft_exit_skip("cannot open %s: %s\n", device, strerror(errno));
+
+	clkid = FD_TO_CLOCKID(fd);
+
+	if (ioctl(fd, PTP_CLOCK_GETCAPS, &caps))
+		ksft_exit_skip("PTP_CLOCK_GETCAPS on %s: %s\n", device, strerror(errno));
+	if (!caps.max_adj)
+		ksft_exit_skip("%s does not support frequency adjustment\n", device);
+
+	/*
+	 * Remember the current frequency.  A vulnerable kernel accepts the
+	 * bogus value below and programs it into the hardware, so restore the
+	 * original afterwards instead of leaving the clock corrupted.
+	 */
+	if (clock_adjtime(clkid, &restore))
+		ksft_exit_skip("clock_adjtime(get) on %s: %s\n", device, strerror(errno));
+	restore.modes = ADJ_FREQUENCY;
+
+	/*
+	 * (1 + 147573952589676412) * 125 == 2^64 + 9, which overflows s64 in
+	 * scaled_ppm_to_ppb() and wraps the result to a ppb of 0.  A kernel
+	 * that does not detect the overflow lets this absurd frequency past
+	 * the max_adj check; a fixed kernel rejects it with -ERANGE.
+	 */
+	tx.modes = ADJ_FREQUENCY;
+#if __SIZEOF_LONG__ >= 8
+	tx.freq = 147573952589676412L;
+#endif
+
+	ret = clock_adjtime(clkid, &tx);
+	if (ret < 0 && errno == EBUSY) {
+		/*
+		 * A free-running physical clock (virtual clocks active) rejects
+		 * frequency adjustment with -EBUSY before the overflow is even
+		 * evaluated, so the test cannot run here.
+		 */
+		ksft_test_result_skip("%s: frequency adjustment returned EBUSY, skipping\n",
+				      device);
+	} else {
+		ksft_test_result(ret < 0 && errno == ERANGE,
+				 "overflowing frequency adjustment is rejected (ret=%d errno=%d)\n",
+				 ret, ret < 0 ? errno : 0);
+	}
+
+	/* put the frequency back the way we found it */
+	clock_adjtime(clkid, &restore);
+
+	close(fd);
+	ksft_finished();
+}
-- 
2.43.0

