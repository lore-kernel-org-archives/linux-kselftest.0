Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6212374A1D
	for <linux-kselftest@vger.kernel.org>; Sat,  1 Aug 2026 22:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785623370; cv=none; b=DnrWYO0jvOXFXM0G1i6t5sjVxeJlvY/InuSdZrEgXscD05O2jao2GOMu0em1Ts77oIbxQAtjnUoI77DuREX7nC0ue2fb2IhR5ebUjTj/yrP0WKrKDCU5TGol1dsvmXjdlpEbS3AyrVkrbDOsDD8kEvsySbQSA4AGrjtWtNootZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785623370; c=relaxed/simple;
	bh=0frn8/1E2g2P+fUpThAiML8loGGJ8rAIh229UyRnt74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GIMDj8QjekwgEw1agDWFWsnc038GaeS1LcXNdvS+jxU5hqL5jJqv6m0df8Vry13lIBR4kNsciPKV4L7S01KJKUtwgd9AsRHm6tWuWdjm5rdkvgY6xwwngmz6FyfD5BFKRrCGklTeoOyb7cLapxYE8ol8LCdatYRs/Tb5fT1Z5JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBlg+Mlk; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBlg+Mlk"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92e6a434cabso101183185a.1
        for <linux-kselftest@vger.kernel.org>; Sat, 01 Aug 2026 15:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785623367; x=1786228167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qri4zx3w0KdMvYOIUh/Vq3TWzAXXnzlER5xidoSLn1Y=;
        b=MBlg+MlkAFUMBfyEWZAemjc3+jM744G7Ixr4Wc9R6rQJnb0q5X83hePfWtlD2+8AYH
         ufPjIn9M987+DvpXsTgkAgLOLYrfYU20RBpcSIBEnG2ncDeli+3o1LMXUmSNToz/3gaq
         MUgwejhLJUlg3TT73FXl3XUJW8vFa8HeIilzMmZNb6Hwyk9X7qxsA6MzOb+8gItGwCAt
         U4B1/CezRFCYKgXAs8D9fsjPNnBlzDwh3EeGgjwFnX/1jMMQRtsKSjDrjzahAyj8Mn5L
         DElxZrprZN047cOYH8JPzzFXcruLVi748QUvjtoOfC98Nl8xmgmhkEITQWH+b50eNyNO
         o+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785623367; x=1786228167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qri4zx3w0KdMvYOIUh/Vq3TWzAXXnzlER5xidoSLn1Y=;
        b=hEkXxduIaWl3Y6QbOEtqN7V9KQooQbmEG3ggePJMr1m4Zl47at50zKQEcJ7zeIxPbR
         y0A8lYNAPuOctm/ODO88eIPV6GC6QoZ+juEcH7yhQw6dMyNhFgYirJFPfFksE67wBbGa
         ReGsDlX9n6y27NF1aKepMLXE1jhRgMBnKUAc57teD+46ICCRANnABde+6q6i4RD0+pRz
         M/WUshohDranURPMSO99cBhloz2HFK/yJV8TjdRqgHtiDvpN+ETV/SqX5y7jrcXvC8Bo
         ymTGoFLpjOk/MYaYzcQW5lkT/cSTXmWYEqbVcBnGXPphcfKfLBsQhsI/nTD0qj7JHtAs
         t42w==
X-Forwarded-Encrypted: i=1; AHgh+RobeE1KWDmyFMMtCz7MbQXl+6gmZxvS/J/xpdKGRBzO7m2TxDRPp5WXVRFSUcWr9R4yoK0dxOJ+Z6SpM349q04=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEUxf2ZhJBaFH1VrSb9PMsOfm/FQgI0cVgpf31L8jiJCgJwIyt
	xLPA6jIfWSq1JpQlagDcbqcfkZ2/a0JWUbYtZlsxEuKN9QTySQRtDEaW
X-Gm-Gg: AR+sD11XQswYgTUUpjhzo1lT4FqpIlL8PAfsmmMeq2UJlPbk0kOj3/NNgqq29tenmMa
	U4YAiNgfIMFox4b+LEdZCBbutdErdqK3dZ4jShvKWvISNkpkYepT8/uCT0CHRpzG3NqEB+xGxMT
	GQh1KJBqGYweqsSVu58qA7drdHoJW8cT8LV2E1px4Fn8WpLgI5RqX0Iih8jOQe95gAf4GzSa7XC
	a65tLAxhQdsr/59GT7pOGo4YIlaAswN8Jqdb9YCwbM6AoeJcYfVw6aJWjHyOtBjSrAA6aP/P1xs
	62w8ghs2rkEmoflwubtwXPiSmHUhm+y9GDYwpabVfOsP6r9KPs92reh4LYGhTT900/Gn2Jz68R0
	bK9+rH4aQ+vuyAwx/NxsJVQuvvt19jHe72i+lbSM9J4rpQ1k097tmTUXipH9TDs8elEMNyjzPXL
	symj9H5WbBauuou+cDgLK5Ni+IBknQGBeuAciPYVrQlGtkRd7m5ZRn0+XkIj4a9vueg7oGrgNTe
	YW/DPgeXFjz9V7VPR/r6+3u5rwzA6ti6T/DJZBVLKZNSUE4xhkbYNUUznIOEE+3xHIdQhv5Tjcg
	Ijbw07x4woVijYVqSkCb+FBZ3g==
X-Received: by 2002:a05:622a:1f91:b0:517:7b6c:4465 with SMTP id d75a77b69052e-52b56752f3dmr113230701cf.22.1785623366788;
        Sat, 01 Aug 2026 15:29:26 -0700 (PDT)
Received: from ip-172-31-15-253.ec2.internal (ec2-32-195-55-166.compute-1.amazonaws.com. [32.195.55.166])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52b4eb956c3sm33403831cf.22.2026.08.01.15.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 15:29:26 -0700 (PDT)
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
Subject: [PATCH net-next v3 2/2] selftests: ptp: add a regression test for the frequency adjustment overflow
Date: Sat,  1 Aug 2026 22:29:23 +0000
Message-ID: <20260801222923.39017-3-deepshah146@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801222923.39017-1-deepshah146@gmail.com>
References: <20260801222923.39017-1-deepshah146@gmail.com>
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
 tools/testing/selftests/ptp/.gitignore        |   1 +
 tools/testing/selftests/ptp/Makefile          |   2 +-
 .../testing/selftests/ptp/ptp_freq_overflow.c | 101 ++++++++++++++++++
 3 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/ptp/ptp_freq_overflow.c

diff --git a/tools/testing/selftests/ptp/.gitignore b/tools/testing/selftests/ptp/.gitignore
index 534ca26eee48..e63194b44395 100644
--- a/tools/testing/selftests/ptp/.gitignore
+++ b/tools/testing/selftests/ptp/.gitignore
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 testptp
+ptp_freq_overflow
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
index 000000000000..e90477175958
--- /dev/null
+++ b/tools/testing/selftests/ptp/ptp_freq_overflow.c
@@ -0,0 +1,101 @@
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
+	 *
+	 * The cast avoids a -Woverflow warning where tx.freq is 32-bit
+	 * without tying the value to the width of long, which differs from
+	 * the width of tx.freq on x32 and other y2038 configurations.
+	 */
+	tx.modes = ADJ_FREQUENCY;
+	tx.freq = (__typeof__(tx.freq))147573952589676412LL;
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

