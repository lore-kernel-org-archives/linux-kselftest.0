Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795176994;
	b=g90jEacOW4RaoELu+VZmajISIfUxR4/KU/X7SHFzPD9NMrNjVZbqCsWBsv/enkCb616A
	 BC2JWylceLWo4oZFjKVMstec/w0wX6UupojjSs5L+107Xegk9zxwrQlKQ57Lns1IZkHVm
	 rlx8vlDg+DNrXWAKcGaDpcLYy/qmg/72mXUEE30HtYKGn0xxEvDF9H5/JSY4NJ4wSICdB
	 dAqZjkPcGUZYfVfm52yNaAVQFJJFMKS46bEnT7RVhKwyykYLj1aERskSraOlHoUZ/q/Oo
	 iX4hdkKVEmNdZtmcxxxCK5aoLJvbE54Y0T2htbIBAsLv0tDWzkYkkwcNNmyJ+Tcl75w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SGVAw1Lnd8h1V92kbvAURoth0B9xOCBghyTDJcaBXCw=;
	b=xp8kqEyAI53CDsP0apGTnWDOyjCIqo0NDBCxM6AsqmzUeq3Rxleq5LZTw/zEokF+u/oT
	 gzB4eMHATjqEtm3KpOYvuv2Jovcp2EGjL1WmwzPdca1QlRcx6SDQhbrufJI5Q/qa8Z0gs
	 5tLGpTTVbVtG2h4nu4Hwxwb1oJJYBoU9frnq+gdRSaX/pvnESHyChySBSF/8HC3zpeSA/
	 gkB6g0IRTDhyZ2tE/Q/+Tjz4UTjP0kjVNGOUJaPyC0s1JXOcvL/A0mhlBVRREIj6obUdQ
	 vcBoF6NYP0piF2Dlv879eyhUaenayuB8l1BkRYfZ+V/UQGxu2zqaBI3NgGWmUu1Y8uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=MaBLjQLV;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09C8606A326
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 12:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D09C8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=MaBLjQLV
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cde5a7d79b0so420359a12.2
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 04:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795176993; x=1795781793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SGVAw1Lnd8h1V92kbvAURoth0B9xOCBghyTDJcaBXCw=;
        b=MaBLjQLVTCnd3wRkancJgjSpiXXjhsg7AzYrpmJq5p+LYTEVhJIt6nkZugUeiJkHNp
         dzjcPqgjnB0iIbmSSFLLMuQyS9Ea9NX0ZOKokDDy3pYflbb1JHJQ8ryVojYn0gKxw+Kk
         qPtq42UUVtMQ5dkuq4ng/leXkvEiDymaxSUEpQEZfxJvW3AHw1k71LM+btUnIxLnVT68
         NLzzf220i4sz7ZCO+FMJmL858Ji66BJs6JmZ3pocdE6vp38cfAXLUUvGF1POBukjPTzd
         +15kEm2F/veqA4IPH+XiytNqIIi+33Kmd/bT1T9LEsiYo0S8SQd4m1D7WcbPzvFlxMSU
         pOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795176993; x=1795781793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SGVAw1Lnd8h1V92kbvAURoth0B9xOCBghyTDJcaBXCw=;
        b=h5JDpqm5PeVUX7W90Vteu4ZfpFM7g0aas+BUUsIIXw8qWSMaLbGwDDAOocNyE0s720
         8XJGIgoL6LCIrDPTGjEVKxg/8Yf2EigfVkzW9TTBd63ZSK1kwqSHrB9hrSXZM2Eel2Ps
         5wl7kFJq/MbeTLupp7IlfmZ4KVS9ymOz7YDb8aqDWcP/kxNjaNlfKUNHgupTzfYdukaq
         PwMbNFoltlhoDPKFfWMkrbTqJ30UC37snhTy/GEkTF28m8n+NjLDAsm5SSypyFIQRka5
         elCggjzrBWkiVcTMKTW8Ga+cbcQqHEkxXjdaIhmDPWDd3WzaqDWdEpFC5d4lRZWFECUn
         +Qvg==
X-Forwarded-Encrypted: i=1; AL+hErFUaaqKjmUmx3s6Zrq3Y6+pGZyYihwJhwu7FYtCw4JaLzeRN4FN7xy72HDxazlifFoINCvT084EARdpqUo1R94=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mimVnl0fpez9sbzlD7a8wXQIOF6jvPxmq7I5YjWXfLQj5nFFI
	iqxwn/mBLpVntJXoNR2UHMD61P+iQ+OMRN/wFz/pZvbz7OSJBEXNShekIyWNmaOVGzM=
X-Gm-Gg: AZFdTZdraOXyxyy1q/8Y4BEht4FFgWJZ3XQBGbJKfvgkhZutiqJbJUEGHkp0JOBmgTS
	k+3lEm58Ek4MCkFeJHBd5u7TXCq9MKvRQ0FRu8eafIAgrOXo6Eu0lCubOGHO1NZCue4xSvGbLCJ
	c1tDM2FSMJzA++yzpR180DdyxfWAYcvEEjYjEQ/TS2Ftr3ejzdsn8ymGPp0EtOG4mtPJ1n0zfaF
	GEf/oIUglYCF5Puyq03+qtHP/7muc3b+YuZJSds+aaHwR4tXHm7ophu/3f0cTO9huuSJO22Y6qN
	HbJoRZA0j66HqxEzAOGJRoQCdvNhw+68Cjo8A/vJHeVbcVtm0DjteB0VA/09NFEmac85Eu+YVfv
	+/bH4LokYLgiAS80OD7Fpz6HzKu8Epn0r7paGJqzkmkeAMC6lGF0llp036YumlXoCmMssuXS6vq
	aG7ntVESMvb8GyPxvxwTl20fePRShBlBnVVeT0h0z/zQlN79XiK/tSTY4VUp5vi8Verm4vtf3YB
	+NJ0wYLI4PUrt2SfbXVzXYkKDk2ACm6buJg71aDv6d3mJah02YZq0sHE0NEJs4kcrKmP93wQA6J
	EPexy9nbGqV43Ahl87haG++sF26wkGjlRASrbw==
X-Received: by 2002:a17:90a:ec88:b0:3b4:127a:2bb9 with SMTP id 98e67ed59e1d1-3b41c8d9275mr2701568a91.13.1795176993204;
        Fri, 20 Nov 2026 04:16:33 -0800 (PST)
Received: from rmustafin-laptop ([27.79.41.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb1b66sm4463146a91.1.2026.11.20.04.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:16:32 -0800 (PST)
From: Rustam Mustafin <rmustafin@cloudlinux.com>
To: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Shuah Khan <shuah@kernel.org>,
	Jaewon Yang <yong010301@gmail.com>,
	linux-integrity@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rustam Mustafin <rmustafin@cloudlinux.com>
Subject: [PATCH v2 2/2] selftests: tpm2: test that io_uring reads ignore the file offset
Date: Fri, 20 Nov 2026 19:16:14 +0700
Message-ID: <20261120121614.978396-3-rmustafin@cloudlinux.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261120121614.978396-1-rmustafin@cloudlinux.com>
References: <20261120121614.978396-1-rmustafin@cloudlinux.com>
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

Test that an IORING_OP_READ request on /dev/tpm0 and /dev/tpmrm0
returns the whole pending response from its start, although sqe->off
points past the response header. The offset stays inside
priv->data_buffer, so an unpatched kernel fails the test on the
returned header without an out-of-bounds access.

Signed-off-by: Rustam Mustafin <rmustafin@cloudlinux.com>
---
 tools/testing/selftests/tpm2/.gitignore  |   1 +
 tools/testing/selftests/tpm2/Makefile    |   4 +
 tools/testing/selftests/tpm2/tpm_uring.c | 131 +++++++++++++++++++++++
 3 files changed, 136 insertions(+)
 create mode 100644 tools/testing/selftests/tpm2/tpm_uring.c

diff --git a/tools/testing/selftests/tpm2/.gitignore b/tools/testing/selftests/tpm2/.gitignore
index 6d6165c5e35d..d2324bd0eca2 100644
--- a/tools/testing/selftests/tpm2/.gitignore
+++ b/tools/testing/selftests/tpm2/.gitignore
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 AsyncTest.log
 SpaceTest.log
+tpm_uring
diff --git a/tools/testing/selftests/tpm2/Makefile b/tools/testing/selftests/tpm2/Makefile
index a9bf9459fb25..67f346f4cdef 100644
--- a/tools/testing/selftests/tpm2/Makefile
+++ b/tools/testing/selftests/tpm2/Makefile
@@ -1,4 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+CFLAGS += $(KHDR_INCLUDES) -idirafter ../../../include -Wall
+
+TEST_GEN_PROGS := tpm_uring
+
 include ../lib.mk
 
 TEST_PROGS := test_smoke.sh test_space.sh test_async.sh
diff --git a/tools/testing/selftests/tpm2/tpm_uring.c b/tools/testing/selftests/tpm2/tpm_uring.c
new file mode 100644
index 000000000000..9caa3cba5bf0
--- /dev/null
+++ b/tools/testing/selftests/tpm2/tpm_uring.c
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * An io_uring read chooses its own file offset. The TPM character devices
+ * must ignore it and return the response from its start.
+ */
+
+#include <endian.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <poll.h>
+#include <signal.h>
+#include <io_uring/mini_liburing.h>
+#include "../kselftest.h"
+
+#define RING_ENTRIES	4
+#define BUF_LEN		4096
+#define POLL_TIMEOUT_MS	10000
+#define TPM_VERSION_FILE	"/sys/class/tpm/tpm0/tpm_version_major"
+struct tpm_header {
+	uint16_t tag;
+	uint32_t size;
+	uint32_t return_code;
+} __attribute__((packed));
+
+/* TPM2_GetCapability(TPM_CAP_TPM_PROPERTIES, TPM_PT_FIXED, 1) */
+static const unsigned char cmd[] = {
+	0x80, 0x01,		/* TPM_ST_NO_SESSIONS */
+	0x00, 0x00, 0x00, 0x16,	/* command size */
+	0x00, 0x00, 0x01, 0x7a,	/* TPM_CC_GetCapability */
+	0x00, 0x00, 0x00, 0x06,	/* TPM_CAP_TPM_PROPERTIES */
+	0x00, 0x00, 0x01, 0x00,	/* TPM_PT_FIXED */
+	0x00, 0x00, 0x00, 0x01,	/* property count */
+};
+
+static void test_read(struct io_uring *ring, const char *path)
+{
+	static char buf[BUF_LEN];
+	const struct tpm_header *hdr = (const void *)buf;
+	struct pollfd pfd = { .events = POLLIN };
+	struct io_uring_sqe *sqe;
+	struct io_uring_cqe *cqe;
+	int fd, ret, res;
+
+	fd = open(path, O_RDWR);
+	if (fd < 0) {
+		if (errno == ENOENT)
+			ksft_test_result_skip("%s: not present\n", path);
+		else
+			ksft_test_result_fail("%s: open: %s\n", path,
+					      strerror(errno));
+		return;
+	}
+
+	if (write(fd, cmd, sizeof(cmd)) != sizeof(cmd)) {
+		ksft_test_result_fail("%s: write: %s\n", path, strerror(errno));
+		goto out;
+	}
+
+	pfd.fd = fd;
+	if (poll(&pfd, 1, POLL_TIMEOUT_MS) != 1) {
+		ksft_test_result_fail("%s: no response to the command\n", path);
+		goto out;
+	}
+
+	sqe = io_uring_get_sqe(ring);
+	memset(sqe, 0, sizeof(*sqe));
+	sqe->opcode = IORING_OP_READ;
+	sqe->fd = fd;
+	/*
+	 * Inside the response buffer: an unpatched kernel returns the response
+	 * without its header instead of reading out of bounds
+	 */
+	sqe->off = sizeof(*hdr);
+	sqe->addr = (unsigned long)buf;
+	sqe->len = BUF_LEN;
+	ret = io_uring_submit(ring);
+	if (ret != 1) {
+		ksft_test_result_fail("%s: io_uring_submit: %d\n", path, ret);
+		goto out;
+	}
+	ret = io_uring_wait_cqe(ring, &cqe);
+	if (ret) {
+		ksft_test_result_fail("%s: io_uring_wait_cqe: %d\n", path, ret);
+		goto out;
+	}
+	res = cqe->res;
+	io_uring_cqe_seen(ring);
+
+	/* the offset is ignored: the whole response, from its start */
+	ksft_test_result(res >= (int)sizeof(*hdr) &&
+			 be32toh(hdr->size) == res && !hdr->return_code,
+			 "%s: io_uring read %d\n", path, res);
+out:
+	close(fd);
+}
+
+/* the command is TPM2 only; test_smoke.sh skips the same way */
+static int tpm_version_major(void)
+{
+	FILE *f = fopen(TPM_VERSION_FILE, "r");
+	int major = 0;
+
+	if (f) {
+		if (fscanf(f, "%d", &major) != 1)
+			major = 0;
+		fclose(f);
+	}
+	return major;
+}
+
+int main(void)
+{
+	struct io_uring ring;
+
+	ksft_print_header();
+	if (tpm_version_major() != 2)
+		ksft_exit_skip("no TPM 2.0 device\n");
+	if (io_uring_queue_init(RING_ENTRIES, &ring, 0)) {
+		/* not built in, or disabled by kernel.io_uring_disabled */
+		if (errno == ENOSYS || errno == EPERM)
+			ksft_exit_skip("io_uring_setup: %s\n", strerror(errno));
+		ksft_exit_fail_msg("io_uring_queue_init: %s\n", strerror(errno));
+	}
+	ksft_set_plan(2);
+
+	test_read(&ring, "/dev/tpm0");
+	test_read(&ring, "/dev/tpmrm0");
+
+	io_uring_queue_exit(&ring);
+	ksft_finished();
+}
-- 
2.52.0

