Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89E636AB57
	for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 04:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783829368; cv=none; b=E16GK0lHDXiSkdSRzDyGgkz+M92qUoIlgxYSLHOO7C23+6tEiTfX3bFpgDWm/5vmyyUeMU3dKQ0jmywNCgH/Fd9CIWgmslP6ov8eliuLjBSYzBo0qznXWed9MwQ7FgSSQpCz4hI85CG1S2snb0sAdZdef+/uzlqfZjgNQp3WtrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783829368; c=relaxed/simple;
	bh=ht7k1vfyTfnKzBTKA4hWIj+a/zQqJ1S/l9ggwrpoISo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ouYb08yHiuF5iUjit+CFwKKqte3bJkMn9pJ17vnjZezUk0CpEAN+SFPBG2R5PIvTCW+Jk0dMsLtuA2zrCauu265m5MhJ5yNZgPNDwVOe10BmXe0Tf+qAlQwa8eDDT3LclhnSh7iFdjIf1fBiAAi8uN/WbARcQ0eG7TOFNDOi9lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljVUR4LY; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljVUR4LY"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8ef7b7651ecso24745156d6.1
        for <linux-kselftest@vger.kernel.org>; Sat, 11 Jul 2026 21:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783829365; x=1784434165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CY1zhHCs8Urd6z2dxMWVdrNocO2i3dPyfsdmlbGYaEg=;
        b=ljVUR4LYLTjfRSI3KGhnaHhxHKA2dn/11jD/S0aF9ftwYXsuo9oxFItpkTJLbIguJm
         5/q6bNuC9IKtit2LiIScEYlIwtYvqKLqTPjQyvPwy+nlG86o8W3mbWvDDAd0ogFHtNt6
         fKCWxM/j75Ang57K8NwZ+APwFaZpdrBAJfhP2xftQ3h6cTi43peEQf0TpvKExTNi+IV+
         hBq/tj7zGUyoop+CSRbDS8PkY23sfm5/1/lAgd2BMu5VVW/Yb0j92eRlRTWAk2RFhtko
         SzcYXWphSq3jFyRdrigF2XtXAAmA1p95Bd5bnBM41ZB6kyHx3RhgqT5NuQBFDGVkKXA9
         5pxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783829365; x=1784434165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CY1zhHCs8Urd6z2dxMWVdrNocO2i3dPyfsdmlbGYaEg=;
        b=jcPxNwfHEQzZjVRM+RaKiZbZnv8LNkGEmBbwh8UtwtvyHXYdvuhg9i6fhND002fHjI
         BOsU1dnttipYItnE46Bc8hdmLZ4UdpdXRNwDqX4ltlyGyprt7GEe5msHXXLKHr0us28j
         yFocSmNASvL1rN/1S/vUnZaX7n6R8XGKAOTzFvogVOKh+l08WoZatpKQnJb4buPVPbXZ
         zd2BLApRRuurAiLWOeNYrwxOcYZJt156bWAYRmqJm4y9ZmOeRM1ILYDHorTgF/mNx/lm
         s+K/F/LUgzzJW/5e7Gf+fKWFhkIHU70Lq/L5zsnhDDFI/Xo1vzGsKq6uqbFLjEIAGJY8
         XmlA==
X-Forwarded-Encrypted: i=1; AHgh+Rr3s5Kw/z1aKL+XDnrN4H0lwX7rWc0lTya8y3R7HkX/pHbPB2wQhWX6+KgElfOmYDNzkqLL5BR0GrYVjiN4wf8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIdQTNZ5lBxPHlCVy8wd3HOZnuGfdjLi64L9yBoGQ2wm0FF021
	Nca4wjHBMVgHuQ1k+125S5VFxFMEyfSYlPZcuyw9ctOniR9Yn7e+JIZ3
X-Gm-Gg: AfdE7cld2zlHzEX96xUQhbFFjq17t3v7QPzR7ba1ey7InF5Ggg9+6TI4afbFitBme3c
	0IqHaXXSf8RagghKxTnMNtRUOZjvGMCjz/Cl5g9CBH4b/isVUFct5+gaTh5DhaiTg8TFrUlNM2u
	FT4YMCh77M/01gcQyznkix6D3LCxdAwL31AZ3jgxNStx2yvLzGRb/1X+Y+GKBdpkfH3io3miaei
	N+c5tUsosgsEJAk9mZNX0NUWHATYUkpsUgYmI0yPqABxZ+GtQPvRmHij281dIOSqxdBPJgqWmiM
	9f8GZoPJx8uCVPTgUX4QmE2uRfdgATgBZS0JFsYgjGr+8SaiWSYgI0E+iu9C4MRsLNeF3nmS5dU
	Sjmm2jo6IVc/2xfgWeShNneTdyW3IhnjGAUvpwTDtxz3WHAAELf2ZPc50VZVCdT0b/AhJ3yafTX
	mgbImzWnv9Oeb7byrD8tAlCiH4Ydc1jLCW+mIX0HOGrXY82KsdzihpEe6EEDD3I888VbQIh8OEp
	oizytPwp9HXgwdiM4uWBprR6gF3z0CHoHyfOJ9kofc=
X-Received: by 2002:a05:620a:44d4:b0:92e:e728:9d03 with SMTP id af79cd13be357-92ef3cc8072mr428999985a.6.1783829365498;
        Sat, 11 Jul 2026 21:09:25 -0700 (PDT)
Received: from ip-172-31-15-253.ec2.internal (ec2-44-200-214-82.compute-1.amazonaws.com. [44.200.214.82])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5cf9d9bsm687147085a.28.2026.07.11.21.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 21:09:24 -0700 (PDT)
From: Deep Shah <deepshah146@gmail.com>
To: netdev@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	Deep Shah <deepshah146@gmail.com>
Subject: [PATCH net 2/2] selftests: ptp: add a regression test for the frequency adjustment overflow
Date: Sun, 12 Jul 2026 04:09:22 +0000
Message-ID: <20260712040922.6403-3-deepshah146@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712040922.6403-1-deepshah146@gmail.com>
References: <20260712040922.6403-1-deepshah146@gmail.com>
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
 .../testing/selftests/ptp/ptp_freq_overflow.c | 74 +++++++++++++++++++
 2 files changed, 75 insertions(+), 1 deletion(-)
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
index 000000000000..342b22689f67
--- /dev/null
+++ b/tools/testing/selftests/ptp/ptp_freq_overflow.c
@@ -0,0 +1,74 @@
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
+#define FD_TO_CLOCKID(fd)	((~(clockid_t)(fd) << 3) | 3)
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
+	 * (1 + 147573952589676412) * 125 == 2^64 + 9, which overflows s64 in
+	 * scaled_ppm_to_ppb() and wraps the result to a ppb of 0.  A kernel
+	 * that does not detect the overflow lets this absurd frequency past
+	 * the max_adj check; a fixed kernel rejects it with -ERANGE.
+	 */
+	tx.modes = ADJ_FREQUENCY;
+	tx.freq = 147573952589676412LL;
+
+	ret = clock_adjtime(clkid, &tx);
+	ksft_test_result(ret < 0 && errno == ERANGE,
+			 "overflowing frequency adjustment is rejected (ret=%d errno=%d)\n",
+			 ret, ret < 0 ? errno : 0);
+
+	close(fd);
+	ksft_finished();
+}
-- 
2.43.0

