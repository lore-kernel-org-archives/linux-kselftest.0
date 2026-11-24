Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532949;
	b=VQref/tUPJWLfHd7S8QL9x9R1MFG5MSxvOGW+/qfltqULzvFNb3LhTTZBw0YyYSOQhID
	 IS/eLX2mCb8eFTUecr4fjxaHV/7Fi2s7nEal3RoFyq/0kuncp/k+xxMAO84Lz2VcGbNnE
	 JEkoPImADSH94KJ/IgE9dEF+p3aN6Od5ZdCboI9yaqaCm/bJbPSgXXL/bZVLvkj94CxMa
	 ynROBQTjZPMw7t3tjoUFpzxC9bMdBAJ1Snj2lQ54B1DQ8LhUdXLfytyEByPm/n7S42ltE
	 WV04gV8thcp5+gYJ+fIAq0wWuwp+6ZqYnqEklXKMZrLx3pdz5ay4RR3gwAOd5sZc+yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PY9hbO0H3/9Weo+ZvlM781HxAXOkUPjKw95mENwVI2g=;
	b=SLaOZGcPmcNdBmyv102PGYLRNNNUlw+9kXKrDrMZiXKi8a/AAhCttjXEGx1BckYUiySF
	 aMKH6UnJgvoVWlXaLCUj150cc7OTcC6n9imaJTnN1lhWrsT+Il97kr25rOoTZNySTVd6x
	 Rc+yCmBlyHMNuZMrzn1KLdVv9rj270AxGcZ7TT0HmE0ocUoxBMV+7kOviPkm8zct3eauD
	 CJr7rolNd2SaC3ii6uPY+seXkyPZeSMDe7/S8kWfHKxpp8LTH8iwz9ATQBhgRTeRi/v52
	 kMqEW4OPA0TX5Gu2I8urLBCnNHQWDNzqf8wQw8Rm45lctnTVvIAMdI5oY9v0oqDB9bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=scRf2kPO;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA7C606A326
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 15:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BA7C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=scRf2kPO
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-384d0550c71so2559962eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 07:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795532948; x=1796137748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PY9hbO0H3/9Weo+ZvlM781HxAXOkUPjKw95mENwVI2g=;
        b=scRf2kPO5CX1dswZDhU4WN+rGAOiiYWyt3ugXdL86J8eESEPjTPE7HcffnpwOx/pAx
         kicP64H82kSNkbY6vrCH5lzcB1PUzc+s7dsS+/bbA3AJmf2jIfQoD+0QP7uE9Oko4Wx7
         jr/PNrbO8gpTbEni80+wTERIGzfbYScwUF70lAGxPPaN1qXLdkf6xhmPx4c2dyRArfaz
         SwpWZk7yHMoYJ1Ewt+TSKgy0gWQSKVtfnOhFJOSvvcrYsEm7yO8bHO/vqGSsVU+pVlEz
         Kht6GstcSDvQIv4YGY4v5yDxbj4N+t7w6rrpLLk3qObf9J/nyntXdS1j/K6sCF40jKyr
         0mzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795532948; x=1796137748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PY9hbO0H3/9Weo+ZvlM781HxAXOkUPjKw95mENwVI2g=;
        b=CSAZnTPwuJnVP8lj5QcFMhIhLuJM6YFc/pYaM/MdSVki7PVctQH0LbN76dphKP2kPr
         1nahBXYLVH5P8LsfX0c9cnFGIoZWGjQkVqlMsrvQmM//n5I7/dbC6FEI/Su8ySYo/urY
         W1cdXUHozf4NtNxaz183AWUwgf4lP5vjOc16AruK6+X5PaK4t6Tdk7c+VkpWYdJaA1ez
         ja8bXwgMGwZOebzZMPlCZCdS5NcP75k8pqTyd2FBrKCU2cNjA8SuI1uUHFaK3PPoYBeG
         rkjaSnxuYfZclprfdceBtPlUgv2gGy0oPzbhHYv6sIvBCbkEd767ltiFBhCE5pl3SWK7
         U+xw==
X-Forwarded-Encrypted: i=1; AL+hErFmS7aESvG5qHbwv9if2/dj3V4j5kYElfEcwZ12QMrUp867ER2FQV3Sr1YTw4pFsep4ZA/0h+O97DmZItjkhHw=@vger.kernel.org
X-Gm-Message-State: APuU4Z99jJyqka7qZMAKGu0EglrG46q1Wdd+EIApgX1RICez7pRHwk/y
	WH+omHWp1QsgIsAJA+5knlvxgXVWxQXmPJeTW+Bgz+oPTtQx0SkuHog=
X-Gm-Gg: AZFdTZcFRsmicSkSR8E0PMoD5648p42clmEncClnvkEaOsc9K7boxC2bsaBm50CCIeE
	b4F4LFua8C3CxBos8asDne4x3kS+0LIOL439w2ILZ0Ldy4CjPfkTv0BWIhJ09eeatLx/sYsBDM3
	Q/9sNoYAgZeazYJNz12u2RxY0AujBaDu09l4Ldb5OcJVr0Nqp8+1ddf2b+nWCH045e50hsSoeqP
	tLZgLnDmIQcjnWrgWQZVTtOxDrCNolMNTRfGw356ayy5fEwn+UqoeK7NQXOXIArrEWCXLYi8RmB
	Lmf0uJh320+ctpto9WYilb5uZRiZ8UuZY6YYN2S2Y8HTOCqfciIDdLreqQ9ReQfawz9lT7VrfJD
	vSJgIghQ1w+PMyQ5tovBd24AIpiXu2RiY/nhP/TT+RxNVSzqObTbX9wEVyzVv0Nmq7EHhxZjpmB
	lbz3P4EAPUiVgJUa5CF6ld0gjDOoUqkbX/88kNxWqPqcYPZ1bIquqx+33qhtNTp/cPRYUP2a+ba
	FxNuYZzpFGixoWqrwqbwSaMHCTQzCHLmCd4wQU3N5YCNB7omXGUXzQciKYi4QpsIgfVBFFRedbJ
	y7utFAO7reJHuuYYKAQwjjE7rQ==
X-Received: by 2002:a05:701b:2096:10b0:151:2e62:fe5b with SMTP id a92af1059eb24-1b5568eb642mr16907521c88.22.1795532947433;
        Tue, 24 Nov 2026 07:09:07 -0800 (PST)
Received: from localhost ([2a09:bac1:36c0:1f38::1c5:14c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm34675941c88.3.2026.11.24.07.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:09:06 -0800 (PST)
From: Murali Krishna <muralikrishna2444b@gmail.com>
To: mani@kernel.org,
	shuah@kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Murali Krishna <muralikrishna2444b@gmail.com>
Subject: [RFC net-next] selftests: net: add tests for the QRTR socket family
Date: Tue, 24 Nov 2026 20:37:53 +0530
Message-ID: <20261124150753.115914-1-muralikrishna2444b@gmail.com>
X-Mailer: git-send-email 2.43.0
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

net/qrtr has no test coverage in tools/testing/selftests, although the
behaviour it exposes to userspace is well defined and testable without
Qualcomm hardware: the local node always exists, and CONFIG_QRTR_TUN
lets a test act as a QRTR endpoint.

Add tools/testing/selftests/net/qrtr with two programs.

qrtr_sock covers the AF_QIPCRTR socket contract: the ephemeral port
range and the CAP_NET_ADMIN boundary documented above
qrtr_port_assign(), the bind() rule that an address must name the
socket's own node, rebinding (which moves the port and releases the old
one), EADDRINUSE on a taken port, auto-bind on send, and local datagram
delivery including the source address reported to the receiver.

qrtr_endpoint covers frame validation in qrtr_endpoint_post() by writing
crafted frames to /dev/qrtr-tun: length alignment, unknown protocol
versions, headers truncated below the v1 and v2 minimums, a zero or
over-long declared payload size, a size that disagrees with the frame
length, control types whose payload is too small to hold a struct
qrtr_ctrl_pkt, control types addressed to an ordinary port, and the
legacy 16-bit control port number. Each frame is malformed in exactly
one way so a failure names the check that regressed.

Both programs skip cleanly when CONFIG_QRTR is not available, and
qrtr_endpoint also skips when /dev/qrtr-tun cannot be opened, so the
suite is harmless on non-Qualcomm configurations.

Assisted-by: LLM
Signed-off-by: Murali Krishna <muralikrishna2444b@gmail.com>
---
This is an RFC rather than a submission: net/qrtr has no selftests at
all, and I could not tell from
Documentation/process/maintainer-netdev.rst whether a test-only series
is wanted on its own, since it describes selftests as travelling with a
code change. If the shape is wrong, or you would rather tests arrived
only alongside functional patches, please say so and I will drop it.

Questions I would most like answered: whether the split between the
socket-contract tests and the frame-validation tests makes sense, and
which behaviours are worth covering next.

Testing: built and run on x86_64 against net-next (a4c450594).
qrtr_sock passes 12/12 as an ordinary user; qrtr_endpoint passes 12/12
as root with qrtr-tun loaded. Both skip cleanly when CONFIG_QRTR or
/dev/qrtr-tun is unavailable, and the suite builds with no warnings
under -Wall -Wextra. I have no Qualcomm hardware, so only the tun
endpoint and the local node are covered; the SMD and MHI transports are
untested.

checkpatch --strict reports four things I believe are expected, and I
have left them alone:

 - three "Prefer __packed over __attribute__((packed))" warnings.
   __packed is a kernel-internal macro that is not available to a
   userspace selftest, and existing selftests use
   __attribute__((packed)) in the same way.
 - an unrecognized-email-address error for 'LLM', and a non-standard
   signature warning for the Assisted-by trailer. checkpatch does not
   know that tag, although
   Documentation/process/coding-assistants.rst asks for it and
   specifies it as the word LLM followed by optional tool names, with
   no address.

The tests were written with the help of an LLM coding assistant, from a
prompt asking for selftests covering the AF_QIPCRTR socket contract and
qrtr_endpoint_post() frame validation; hence the Assisted-by tag. I
have read and run every test and can explain what each one checks.
Writing them corrected two assumptions I had got wrong: that bind()
treats sq_node == 0 as "any node", and that rebinding an already bound
socket fails.

 MAINTAINERS                                   |   1 +
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/net/qrtr/.gitignore   |   3 +
 tools/testing/selftests/net/qrtr/Makefile     |  11 +
 tools/testing/selftests/net/qrtr/config       |   2 +
 .../selftests/net/qrtr/qrtr_endpoint.c        | 275 ++++++++++++++++
 tools/testing/selftests/net/qrtr/qrtr_sock.c  | 298 ++++++++++++++++++
 7 files changed, 591 insertions(+)
 create mode 100644 tools/testing/selftests/net/qrtr/.gitignore
 create mode 100644 tools/testing/selftests/net/qrtr/Makefile
 create mode 100644 tools/testing/selftests/net/qrtr/config
 create mode 100644 tools/testing/selftests/net/qrtr/qrtr_endpoint.c
 create mode 100644 tools/testing/selftests/net/qrtr/qrtr_sock.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 97308edec..cce309b30 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23174,6 +23174,7 @@ S:	Maintained
 F:	include/trace/events/qrtr.h
 F:	include/uapi/linux/qrtr.h
 F:	net/qrtr/
+F:	tools/testing/selftests/net/qrtr/
 
 QUALCOMM IPCC MAILBOX DRIVER
 M:	Manivannan Sadhasivam <mani@kernel.org>
diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index c55d7792b..3d0916b60 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -97,6 +97,7 @@ TARGETS += net/openvswitch
 TARGETS += net/ovpn
 TARGETS += net/packetdrill
 TARGETS += net/ppp
+TARGETS += net/qrtr
 TARGETS += net/rds
 TARGETS += net/tcp_ao
 TARGETS += nfsd
diff --git a/tools/testing/selftests/net/qrtr/.gitignore b/tools/testing/selftests/net/qrtr/.gitignore
new file mode 100644
index 000000000..cc2ea8a2b
--- /dev/null
+++ b/tools/testing/selftests/net/qrtr/.gitignore
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+qrtr_endpoint
+qrtr_sock
diff --git a/tools/testing/selftests/net/qrtr/Makefile b/tools/testing/selftests/net/qrtr/Makefile
new file mode 100644
index 000000000..0e22f4047
--- /dev/null
+++ b/tools/testing/selftests/net/qrtr/Makefile
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0
+top_srcdir := ../../../../..
+
+CFLAGS += $(KHDR_INCLUDES) -Wall -Wextra -Wno-unused-parameter
+
+TEST_GEN_PROGS := \
+	qrtr_endpoint \
+	qrtr_sock \
+# end of TEST_GEN_PROGS
+
+include ../../lib.mk
diff --git a/tools/testing/selftests/net/qrtr/config b/tools/testing/selftests/net/qrtr/config
new file mode 100644
index 000000000..0bdb8a4c5
--- /dev/null
+++ b/tools/testing/selftests/net/qrtr/config
@@ -0,0 +1,2 @@
+CONFIG_QRTR=m
+CONFIG_QRTR_TUN=m
diff --git a/tools/testing/selftests/net/qrtr/qrtr_endpoint.c b/tools/testing/selftests/net/qrtr/qrtr_endpoint.c
new file mode 100644
index 000000000..47dc57c4d
--- /dev/null
+++ b/tools/testing/selftests/net/qrtr/qrtr_endpoint.c
@@ -0,0 +1,275 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Tests for QRTR frame validation in qrtr_endpoint_post().
+ *
+ * /dev/qrtr-tun (CONFIG_QRTR_TUN) lets userspace act as a QRTR endpoint:
+ * a write() is handed straight to qrtr_endpoint_post(), so every length and
+ * header check in that function is reachable from here with no Qualcomm
+ * hardware. A rejected frame makes write() fail with EINVAL; an accepted one
+ * returns the full length.
+ *
+ * The frames below are deliberately malformed in one way each, so a failure
+ * names the specific check that regressed.
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <stdint.h>
+#include <string.h>
+#include <unistd.h>
+
+#include <linux/qrtr.h>
+
+#include "../../kselftest_harness.h"
+
+/* From net/qrtr/af_qrtr.c */
+#define QRTR_PROTO_VER_1	1
+#define QRTR_PROTO_VER_2	3
+#define QRTR_PORT_CTRL_LEGACY	0xffff
+
+/* A node id for the test endpoint, distinct from the local node (1). */
+#define TEST_SRC_NODE		5
+
+struct qrtr_hdr_v1 {
+	__le32 version;
+	__le32 type;
+	__le32 src_node_id;
+	__le32 src_port_id;
+	__le32 confirm_rx;
+	__le32 size;
+	__le32 dst_node_id;
+	__le32 dst_port_id;
+} __attribute__((packed));
+
+struct qrtr_hdr_v2 {
+	uint8_t version;
+	uint8_t type;
+	uint8_t flags;
+	uint8_t optlen;
+	__le32 size;
+	__le16 src_node_id;
+	__le16 src_port_id;
+	__le16 dst_node_id;
+	__le16 dst_port_id;
+};
+
+/* One header plus one control packet: the smallest realistic valid frame. */
+struct v1_frame {
+	struct qrtr_hdr_v1 hdr;
+	struct qrtr_ctrl_pkt pkt;
+} __attribute__((packed));
+
+static void v1_init(struct v1_frame *f, uint32_t type)
+{
+	memset(f, 0, sizeof(*f));
+	f->hdr.version = QRTR_PROTO_VER_1;
+	f->hdr.type = type;
+	f->hdr.src_node_id = TEST_SRC_NODE;
+	f->hdr.src_port_id = QRTR_PORT_CTRL;
+	f->hdr.size = sizeof(f->pkt);
+	f->hdr.dst_node_id = 0;
+	f->hdr.dst_port_id = QRTR_PORT_CTRL;
+	f->pkt.cmd = type;
+}
+
+FIXTURE(tun)
+{
+	int fd;
+};
+
+FIXTURE_SETUP(tun)
+{
+	self->fd = open("/dev/qrtr-tun", O_RDWR | O_NONBLOCK);
+	if (self->fd < 0) {
+		if (errno == ENOENT)
+			SKIP(return,
+			     "no /dev/qrtr-tun: modprobe qrtr-tun, or CONFIG_QRTR_TUN=n");
+		if (errno == EACCES || errno == EPERM)
+			SKIP(return, "/dev/qrtr-tun needs root");
+		ASSERT_LE(0, self->fd);
+	}
+}
+
+FIXTURE_TEARDOWN(tun)
+{
+	if (self->fd >= 0)
+		close(self->fd);
+}
+
+/* Baseline: a well formed HELLO to the control port is accepted. */
+TEST_F(tun, valid_hello)
+{
+	struct v1_frame f;
+
+	v1_init(&f, QRTR_TYPE_HELLO);
+
+	EXPECT_EQ((ssize_t)sizeof(f), write(self->fd, &f, sizeof(f)));
+}
+
+/* A length that is not a multiple of four is rejected before anything else. */
+TEST_F(tun, unaligned_length)
+{
+	struct v1_frame f;
+
+	v1_init(&f, QRTR_TYPE_HELLO);
+
+	EXPECT_EQ(-1, write(self->fd, &f, sizeof(f) - 1));
+	EXPECT_EQ(EINVAL, errno);
+}
+
+/* Only protocol versions 1 and 3 exist. */
+TEST_F(tun, bad_version)
+{
+	struct v1_frame f;
+
+	v1_init(&f, QRTR_TYPE_HELLO);
+	f.hdr.version = 2;
+	EXPECT_EQ(-1, write(self->fd, &f, sizeof(f)));
+	EXPECT_EQ(EINVAL, errno);
+
+	v1_init(&f, QRTR_TYPE_HELLO);
+	f.hdr.version = 0xff;
+	EXPECT_EQ(-1, write(self->fd, &f, sizeof(f)));
+	EXPECT_EQ(EINVAL, errno);
+}
+
+/* A frame shorter than the version 1 header cannot carry one. */
+TEST_F(tun, truncated_v1_header)
+{
+	struct v1_frame f;
+	size_t len;
+
+	v1_init(&f, QRTR_TYPE_HELLO);
+
+	for (len = 4; len < sizeof(struct qrtr_hdr_v1); len += 4) {
+		EXPECT_EQ(-1, write(self->fd, &f, len));
+		EXPECT_EQ(EINVAL, errno);
+	}
+}
+
+/* A frame shorter than the version 2 header cannot carry one. */
+TEST_F(tun, truncated_v2_header)
+{
+	struct qrtr_hdr_v2 hdr = {};
+	size_t len;
+
+	hdr.version = QRTR_PROTO_VER_2;
+	hdr.type = QRTR_TYPE_HELLO;
+
+	for (len = 4; len < sizeof(hdr); len += 4) {
+		EXPECT_EQ(-1, write(self->fd, &hdr, len));
+		EXPECT_EQ(EINVAL, errno);
+	}
+}
+
+/* A declared payload size of zero is rejected. */
+TEST_F(tun, zero_size)
+{
+	struct v1_frame f;
+
+	v1_init(&f, QRTR_TYPE_HELLO);
+	f.hdr.size = 0;
+
+	EXPECT_EQ(-1, write(self->fd, &f, sizeof(f)));
+	EXPECT_EQ(EINVAL, errno);
+}
+
+/* A declared size larger than the frame is rejected: it would over-read. */
+TEST_F(tun, size_exceeds_frame)
+{
+	struct v1_frame f;
+
+	v1_init(&f, QRTR_TYPE_HELLO);
+	f.hdr.size = sizeof(f) + 64;
+
+	EXPECT_EQ(-1, write(self->fd, &f, sizeof(f)));
+	EXPECT_EQ(EINVAL, errno);
+}
+
+/* The frame length must be exactly the header plus the padded payload. */
+TEST_F(tun, size_does_not_match_length)
+{
+	struct v1_frame f;
+
+	v1_init(&f, QRTR_TYPE_HELLO);
+	/* Fits in the frame, but leaves four unaccounted trailing bytes. */
+	f.hdr.size = sizeof(f.pkt) - 4;
+
+	EXPECT_EQ(-1, write(self->fd, &f, sizeof(f)));
+	EXPECT_EQ(EINVAL, errno);
+}
+
+/*
+ * NEW_SERVER and RESUME_TX are parsed as a struct qrtr_ctrl_pkt, so a
+ * payload too small to hold one must be rejected rather than read past.
+ */
+TEST_F(tun, control_payload_too_small)
+{
+	struct {
+		struct qrtr_hdr_v1 hdr;
+		uint32_t body;
+	} __attribute__((packed)) f;
+
+	memset(&f, 0, sizeof(f));
+	f.hdr.version = QRTR_PROTO_VER_1;
+	f.hdr.src_node_id = TEST_SRC_NODE;
+	f.hdr.src_port_id = QRTR_PORT_CTRL;
+	f.hdr.size = sizeof(f.body);
+	f.hdr.dst_port_id = QRTR_PORT_CTRL;
+
+	f.hdr.type = QRTR_TYPE_NEW_SERVER;
+	EXPECT_EQ(-1, write(self->fd, &f, sizeof(f)));
+	EXPECT_EQ(EINVAL, errno);
+
+	f.hdr.type = QRTR_TYPE_RESUME_TX;
+	EXPECT_EQ(-1, write(self->fd, &f, sizeof(f)));
+	EXPECT_EQ(EINVAL, errno);
+}
+
+/*
+ * Only DATA and RESUME_TX may be addressed to an ordinary port. A control
+ * message aimed at a normal port is rejected.
+ */
+TEST_F(tun, control_type_to_normal_port)
+{
+	struct v1_frame f;
+
+	v1_init(&f, QRTR_TYPE_HELLO);
+	f.hdr.dst_port_id = 0x4321;
+
+	EXPECT_EQ(-1, write(self->fd, &f, sizeof(f)));
+	EXPECT_EQ(EINVAL, errno);
+}
+
+/* The legacy 16-bit control port number is still understood. */
+TEST_F(tun, legacy_control_port)
+{
+	struct v1_frame f;
+
+	v1_init(&f, QRTR_TYPE_HELLO);
+	f.hdr.dst_port_id = QRTR_PORT_CTRL_LEGACY;
+
+	EXPECT_EQ((ssize_t)sizeof(f), write(self->fd, &f, sizeof(f)));
+}
+
+/* A version 2 header is accepted on its own terms. */
+TEST_F(tun, valid_v2_hello)
+{
+	struct {
+		struct qrtr_hdr_v2 hdr;
+		struct qrtr_ctrl_pkt pkt;
+	} f;
+
+	memset(&f, 0, sizeof(f));
+	f.hdr.version = QRTR_PROTO_VER_2;
+	f.hdr.type = QRTR_TYPE_HELLO;
+	f.hdr.size = sizeof(f.pkt);
+	f.hdr.src_node_id = TEST_SRC_NODE;
+	f.hdr.src_port_id = (uint16_t)QRTR_PORT_CTRL;
+	f.hdr.dst_port_id = (uint16_t)QRTR_PORT_CTRL;
+	f.pkt.cmd = QRTR_TYPE_HELLO;
+
+	EXPECT_EQ((ssize_t)sizeof(f), write(self->fd, &f, sizeof(f)));
+}
+
+TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/net/qrtr/qrtr_sock.c b/tools/testing/selftests/net/qrtr/qrtr_sock.c
new file mode 100644
index 000000000..592e4e429
--- /dev/null
+++ b/tools/testing/selftests/net/qrtr/qrtr_sock.c
@@ -0,0 +1,298 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Tests for the AF_QIPCRTR socket address family.
+ *
+ * These exercise the port assignment contract documented above
+ * qrtr_port_assign() in net/qrtr/af_qrtr.c, the bind() address rules in
+ * qrtr_bind(), and local datagram delivery between two sockets on the local
+ * node. No QRTR endpoint and no Qualcomm hardware is required: the local
+ * node always exists.
+ */
+
+#include <errno.h>
+#include <string.h>
+#include <unistd.h>
+
+#include <linux/qrtr.h>
+#include <sys/socket.h>
+
+#include "../../kselftest_harness.h"
+
+/* From net/qrtr/af_qrtr.c. Ports below the ephemeral range are privileged. */
+#define QRTR_MIN_EPH_SOCKET	0x4000u
+#define QRTR_MAX_EPH_SOCKET	0x7fffu
+
+FIXTURE(qrtr)
+{
+	int fd;
+	__u32 node;	/* this socket's own node id */
+};
+
+FIXTURE_SETUP(qrtr)
+{
+	struct sockaddr_qrtr sq = {};
+	socklen_t len = sizeof(sq);
+
+	self->fd = socket(AF_QIPCRTR, SOCK_DGRAM, 0);
+	if (self->fd < 0 &&
+	    (errno == EAFNOSUPPORT || errno == EPROTONOSUPPORT))
+		SKIP(return, "AF_QIPCRTR not supported (CONFIG_QRTR=n?)");
+	ASSERT_LE(0, self->fd);
+
+	/*
+	 * A fresh socket already knows which node it lives on; bind() insists
+	 * on being given that same value, so every test needs it.
+	 */
+	ASSERT_EQ(0, getsockname(self->fd, (struct sockaddr *)&sq, &len));
+	self->node = sq.sq_node;
+}
+
+FIXTURE_TEARDOWN(qrtr)
+{
+	if (self->fd >= 0)
+		close(self->fd);
+}
+
+static int qrtr_bind_port(int fd, __u32 node, __u32 port)
+{
+	struct sockaddr_qrtr sq = {
+		.sq_family = AF_QIPCRTR,
+		.sq_node = node,
+		.sq_port = port,
+	};
+
+	return bind(fd, (struct sockaddr *)&sq, sizeof(sq));
+}
+
+static __u32 qrtr_port(struct __test_metadata *_metadata, int fd)
+{
+	struct sockaddr_qrtr sq = {};
+	socklen_t len = sizeof(sq);
+
+	ASSERT_EQ(0, getsockname(fd, (struct sockaddr *)&sq, &len));
+	return sq.sq_port;
+}
+
+/* A socket is unbound until it is bound: getsockname() reports port 0. */
+TEST_F(qrtr, getsockname_unbound)
+{
+	struct sockaddr_qrtr sq = {};
+	socklen_t len = sizeof(sq);
+
+	ASSERT_EQ(0, getsockname(self->fd, (struct sockaddr *)&sq, &len));
+	EXPECT_EQ(sizeof(sq), (size_t)len);
+	EXPECT_EQ(AF_QIPCRTR, sq.sq_family);
+	EXPECT_EQ(0u, sq.sq_port);
+}
+
+/*
+ * bind() requires the address to name the socket's own node. Unlike most
+ * families, zero does not mean "any node".
+ */
+TEST_F(qrtr, bind_foreign_node_rejected)
+{
+	EXPECT_EQ(-1, qrtr_bind_port(self->fd, self->node + 1, 0));
+	EXPECT_EQ(EINVAL, errno);
+
+	if (self->node != 0) {
+		EXPECT_EQ(-1, qrtr_bind_port(self->fd, 0, 0));
+		EXPECT_EQ(EINVAL, errno);
+	}
+}
+
+/* A too-short or wrong-family address is rejected. */
+TEST_F(qrtr, bind_bad_addr)
+{
+	struct sockaddr_qrtr sq = {
+		.sq_family = AF_QIPCRTR,
+		.sq_node = self->node,
+		.sq_port = 0,
+	};
+
+	EXPECT_EQ(-1, bind(self->fd, (struct sockaddr *)&sq, sizeof(sq) - 1));
+	EXPECT_EQ(EINVAL, errno);
+
+	sq.sq_family = AF_INET;
+	EXPECT_EQ(-1, bind(self->fd, (struct sockaddr *)&sq, sizeof(sq)));
+	EXPECT_EQ(EINVAL, errno);
+}
+
+/* Binding port 0 assigns an ephemeral port inside the documented range. */
+TEST_F(qrtr, bind_ephemeral_in_range)
+{
+	__u32 port;
+
+	ASSERT_EQ(0, qrtr_bind_port(self->fd, self->node, 0));
+
+	port = qrtr_port(_metadata, self->fd);
+	EXPECT_LE(QRTR_MIN_EPH_SOCKET, port);
+	EXPECT_GE(QRTR_MAX_EPH_SOCKET, port);
+}
+
+/* A port at or above the ephemeral range may be claimed by any user. */
+TEST_F(qrtr, bind_unprivileged_port)
+{
+	const __u32 want = QRTR_MIN_EPH_SOCKET + 0x1000;
+
+	ASSERT_EQ(0, qrtr_bind_port(self->fd, self->node, want));
+	EXPECT_EQ(want, qrtr_port(_metadata, self->fd));
+}
+
+/*
+ * A port below the ephemeral range requires CAP_NET_ADMIN. As a normal user
+ * this must fail with EACCES; as root it must succeed. Both directions are
+ * checked so the test says something either way.
+ */
+TEST_F(qrtr, bind_privileged_port)
+{
+	int ret = qrtr_bind_port(self->fd, self->node, 0x100);
+
+	if (geteuid() == 0) {
+		EXPECT_EQ(0, ret);
+	} else {
+		EXPECT_EQ(-1, ret);
+		EXPECT_EQ(EACCES, errno);
+	}
+}
+
+/* Two sockets cannot hold the same port. */
+TEST_F(qrtr, bind_port_in_use)
+{
+	const __u32 port = QRTR_MIN_EPH_SOCKET + 0x2000;
+	int other;
+
+	ASSERT_EQ(0, qrtr_bind_port(self->fd, self->node, port));
+
+	other = socket(AF_QIPCRTR, SOCK_DGRAM, 0);
+	ASSERT_LE(0, other);
+
+	EXPECT_EQ(-1, qrtr_bind_port(other, self->node, port));
+	EXPECT_EQ(EADDRINUSE, errno);
+
+	close(other);
+}
+
+/*
+ * Rebinding is permitted: the socket moves to the new port and releases the
+ * old one, which another socket may then take.
+ */
+TEST_F(qrtr, rebind_moves_port)
+{
+	const __u32 port_a = QRTR_MIN_EPH_SOCKET + 0x2100;
+	const __u32 port_b = QRTR_MIN_EPH_SOCKET + 0x2200;
+	int other;
+
+	ASSERT_EQ(0, qrtr_bind_port(self->fd, self->node, port_a));
+	ASSERT_EQ(port_a, qrtr_port(_metadata, self->fd));
+
+	ASSERT_EQ(0, qrtr_bind_port(self->fd, self->node, port_b));
+	EXPECT_EQ(port_b, qrtr_port(_metadata, self->fd));
+
+	/* The first port must have been released. */
+	other = socket(AF_QIPCRTR, SOCK_DGRAM, 0);
+	ASSERT_LE(0, other);
+	EXPECT_EQ(0, qrtr_bind_port(other, self->node, port_a));
+	close(other);
+}
+
+/* Binding the port a socket already holds is a no-op, not an error. */
+TEST_F(qrtr, rebind_same_port)
+{
+	const __u32 port = QRTR_MIN_EPH_SOCKET + 0x2300;
+
+	ASSERT_EQ(0, qrtr_bind_port(self->fd, self->node, port));
+	EXPECT_EQ(0, qrtr_bind_port(self->fd, self->node, port));
+	EXPECT_EQ(port, qrtr_port(_metadata, self->fd));
+}
+
+/* A datagram sent to a port on the local node is delivered to that socket. */
+TEST_F(qrtr, local_datagram)
+{
+	struct sockaddr_qrtr peer_addr = {};
+	static const char msg[] = "qrtr";
+	struct sockaddr_qrtr from = {};
+	char buf[sizeof(msg)] = {};
+	socklen_t fromlen;
+	__u32 self_port;
+	int peer;
+
+	peer_addr.sq_family = AF_QIPCRTR;
+	peer_addr.sq_node = self->node;
+	fromlen = sizeof(from);
+
+	ASSERT_EQ(0, qrtr_bind_port(self->fd, self->node, 0));
+	self_port = qrtr_port(_metadata, self->fd);
+
+	peer = socket(AF_QIPCRTR, SOCK_DGRAM, 0);
+	ASSERT_LE(0, peer);
+	ASSERT_EQ(0, qrtr_bind_port(peer, self->node, 0));
+	peer_addr.sq_port = qrtr_port(_metadata, peer);
+
+	ASSERT_EQ((ssize_t)sizeof(msg),
+		  sendto(self->fd, msg, sizeof(msg), 0,
+			 (struct sockaddr *)&peer_addr, sizeof(peer_addr)));
+
+	ASSERT_EQ((ssize_t)sizeof(msg),
+		  recvfrom(peer, buf, sizeof(buf), 0,
+			   (struct sockaddr *)&from, &fromlen));
+
+	EXPECT_EQ(0, memcmp(msg, buf, sizeof(msg)));
+	EXPECT_EQ(sizeof(from), (size_t)fromlen);
+	EXPECT_EQ(AF_QIPCRTR, from.sq_family);
+	EXPECT_EQ(self->node, from.sq_node);
+	EXPECT_EQ(self_port, from.sq_port);
+
+	close(peer);
+}
+
+/* An unbound sender is auto-bound by sendto(), inside the ephemeral range. */
+TEST_F(qrtr, autobind_on_send)
+{
+	struct sockaddr_qrtr peer_addr = {};
+	static const char msg[] = "auto";
+	__u32 port;
+	int peer;
+
+	peer_addr.sq_family = AF_QIPCRTR;
+	peer_addr.sq_node = self->node;
+
+	peer = socket(AF_QIPCRTR, SOCK_DGRAM, 0);
+	ASSERT_LE(0, peer);
+	ASSERT_EQ(0, qrtr_bind_port(peer, self->node, 0));
+	peer_addr.sq_port = qrtr_port(_metadata, peer);
+
+	/* self->fd was never bound. */
+	ASSERT_EQ(0u, qrtr_port(_metadata, self->fd));
+
+	ASSERT_EQ((ssize_t)sizeof(msg),
+		  sendto(self->fd, msg, sizeof(msg), 0,
+			 (struct sockaddr *)&peer_addr, sizeof(peer_addr)));
+
+	port = qrtr_port(_metadata, self->fd);
+	EXPECT_LE(QRTR_MIN_EPH_SOCKET, port);
+	EXPECT_GE(QRTR_MAX_EPH_SOCKET, port);
+
+	close(peer);
+}
+
+/* sendto() with a wrong-size or wrong-family address is rejected. */
+TEST_F(qrtr, sendto_bad_addr)
+{
+	static const char msg[] = "x";
+	struct sockaddr_qrtr sq = {
+		.sq_family = AF_QIPCRTR,
+		.sq_node = self->node,
+		.sq_port = QRTR_MIN_EPH_SOCKET,
+	};
+
+	EXPECT_EQ(-1, sendto(self->fd, msg, sizeof(msg), 0,
+			     (struct sockaddr *)&sq, sizeof(sq) - 1));
+	EXPECT_EQ(EINVAL, errno);
+
+	sq.sq_family = AF_INET;
+	EXPECT_EQ(-1, sendto(self->fd, msg, sizeof(msg), 0,
+			     (struct sockaddr *)&sq, sizeof(sq)));
+	EXPECT_EQ(EINVAL, errno);
+}
+
+TEST_HARNESS_MAIN
-- 
2.43.0

