Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F164C282F14;
	Tue, 30 Jun 2026 14:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782828125; cv=none; b=IeZSA/BdwcBVbVPm/DdhH/L8eUrSE2ENZUao7KcODSJZKBs8E2dFnfEn0c9Seg8yRQRFdnx8M3L/aK62tmHPyGBfF6vg+cIHngInaob2iQKSOfhiQxpsZbwmSRs/Ct/MCh4Dx3EIQInC3YMlGwp+xTK+u4EVtYNBNo38jPwXl98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782828125; c=relaxed/simple;
	bh=NsOjACNrU0Te2q2mq+KqTUXxbIikDkVEJzhIGhRdc4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i+P+F/6rQqO3zVJowNGIzO2x/eZ8ePaxYpznbfI7rpTaKJwrqXFWkC7veUiTSv4KV9VVyeX5gzlbsIZfuRothnQFXMc1l63/WdsPbsLUcQeMXLWWa+RSUapAVNWZ8DirCT4OotsgyFgDrs/Yloxr0MyRA7In0NyOxrptzzVvIxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=CcpSF8Ux; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="CcpSF8Ux"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=tPJEyP21W37G/fWi4bqpC264dXqog1BfYPyHF9m28Rw=; b=CcpSF8UxoKDYAiHkp/SPl8N09m
	NZAkLGHCoBY/o/UjXpuwM/06x2U7ls89rBP22gG49ZAtqx7pIfwvO10/2fVZeCEKAmw7114P7Tlv+
	irbPAAJUNbaNwy57+b4//fPbDp8BdFhNUlt/X3fHY6V1xuiP1pmPCO1I9Qdmh9ZH//ArlV7/neguH
	5uPkk+eyAC48Rz70s/YIwOUg8oC3IMTvzTLmSK3gG1IWnDbRIKXH42KQPsNZKHrEUqayXGORfS8kr
	w1E/FquoscvyFuxJwJluI1SOAYNYvgKoRI3egz+eYlR7t3BBFa3kIofzLVq5VIxmamPWke1Pgw2ck
	bvMVMOYA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1weZ2I-0077Ih-0X;
	Tue, 30 Jun 2026 14:02:02 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 30 Jun 2026 07:01:29 -0700
Subject: [PATCH net-next v2 4/4] selftests: net: getsockopt_iter: add raw
 ICMP_FILTER coverage
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-getsockopt_phase2-v2-4-193335f3d4d1@debian.org>
References: <20260630-getsockopt_phase2-v2-0-193335f3d4d1@debian.org>
In-Reply-To: <20260630-getsockopt_phase2-v2-0-193335f3d4d1@debian.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Shuah Khan <shuah@kernel.org>, sdf.kernel@gmail.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3908; i=leitao@debian.org;
 h=from:subject:message-id; bh=NsOjACNrU0Te2q2mq+KqTUXxbIikDkVEJzhIGhRdc4s=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqQ8xEajFBcrDtA+og4IiWP4XoUCbge1ezlOkM0
 i/4EZGUrZmJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCakPMRAAKCRA1o5Of/Hh3
 bZPpD/9Mh9wa/+cf8EQygtMJ2JTzgoaMS10NpQ0aj96H+a59Rr6MVuV3nqY7GNXaPsP19de3k36
 4Eu+nXvgFkWmGVa8a9kR1+x8r+E4kpiD/Qfd/j2HLqflzgFW7pAYwSicN8cgtS5JT+fEjzncIjt
 KGtjV9BOJ7lHsNraSIizJRccrzm2U1MeUlVS590thEcV3KTfG+Zc6Gl3QagrqKsbt1bpC56j93Q
 LDJq1PUV12oxkg5PkfcANJ+rGgOlCMDBaU/9X5AJOjTBsNy9PoBo1uiPBvVQjd37ZGUsIYarhPs
 RAIdoNGTljA/BcuTcdALGIp/7EpSYCDAlWTsn4qUG2Yi9Nm8tC5sNUfydVZPT501nddyGxihlbM
 KX22U0kwjWfwEJ1BQroYiOz2Q7jNVfEEv70glDFca5g6vdy4kN5ZBmBwzrRNgrBL6PjEO2yMs56
 V1WZoiJ8rep5FZQagjWKp5Axgifg235ehof47iuOJZyYiRyT9RlqBUF8oIrxQGAjKP2tuf+glbf
 2RBA1hWkknMrPrsvLkK7KxNGEjaKe5qs6Gfu7TvhpsXDhzZW5G8g1yikt2mWBSi56hMSP4qoA+B
 WrP4h8nFY6anZsCEBNOdpEMsv8vtr8mQd4F4TXZqcCjaKUyEpVKy6I8oSTQZ21S4jCG5CjwXhfc
 UajwyNCNYNUB2pQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Exercise the raw getsockopt path now backed by sockopt_t. ICMP_FILTER
returns a fixed-size struct and, unlike the int/u64 options already
covered, clamps the length down to the user buffer on a short read
instead of failing, so check that semantic explicitly along with the
exact and oversized cases, the -EOPNOTSUPP path on a non-ICMP raw
socket, and an unknown optname.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 tools/testing/selftests/net/getsockopt_iter.c | 97 +++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/tools/testing/selftests/net/getsockopt_iter.c b/tools/testing/selftests/net/getsockopt_iter.c
index 209569354d0e3..fe5a5268bc34e 100644
--- a/tools/testing/selftests/net/getsockopt_iter.c
+++ b/tools/testing/selftests/net/getsockopt_iter.c
@@ -11,6 +11,8 @@
  *   that always reports the required buffer length back via optlen,
  *   even when the user buffer is too small to receive any group bits.
  * - vsock:   SO_VM_SOCKETS_BUFFER_SIZE covers the u64 path.
+ * - raw:     ICMP_FILTER covers a fixed-size struct payload that clamps
+ *            the length down on a short buffer instead of failing.
  *
  * Author: Breno Leitao <leitao@debian.org>
  */
@@ -24,12 +26,20 @@
 #include <linux/rtnetlink.h>
 #include <linux/time_types.h>
 #include <linux/vm_sockets.h>
+#include <linux/icmp.h>
+#include <netinet/in.h>
 #include <sys/socket.h>
 #include "kselftest_harness.h"
 
 #ifndef AF_VSOCK
 #define AF_VSOCK 40
 #endif
+#ifndef SOL_RAW
+#define SOL_RAW 255
+#endif
+#ifndef ICMP_FILTER
+#define ICMP_FILTER 1
+#endif
 
 /* ---------- netlink ---------- */
 
@@ -297,4 +307,91 @@ TEST_F(vsock, connect_timeout_old_exact)
 	ASSERT_EQ(sizeof(tv), optlen);
 }
 
+/* ---------- raw (ipv4) ---------- */
+
+FIXTURE(raw)
+{
+	int fd;
+};
+
+FIXTURE_SETUP(raw)
+{
+	struct icmp_filter filt = { .data = 0xdeadbeef };
+
+	self->fd = socket(AF_INET, SOCK_RAW, IPPROTO_ICMP);
+	if (self->fd < 0)
+		SKIP(return, "SOCK_RAW/ICMP socket: %s", strerror(errno));
+
+	if (setsockopt(self->fd, SOL_RAW, ICMP_FILTER, &filt, sizeof(filt)) < 0)
+		SKIP(return, "set ICMP_FILTER: %s", strerror(errno));
+}
+
+FIXTURE_TEARDOWN(raw)
+{
+	if (self->fd >= 0)
+		close(self->fd);
+}
+
+TEST_F(raw, icmpfilter_exact)
+{
+	struct icmp_filter filt = {};
+	socklen_t optlen = sizeof(filt);
+
+	ASSERT_EQ(0, getsockopt(self->fd, SOL_RAW, ICMP_FILTER,
+				&filt, &optlen));
+	ASSERT_EQ(sizeof(filt), optlen);
+	ASSERT_EQ(0xdeadbeef, filt.data);
+}
+
+TEST_F(raw, icmpfilter_oversize_clamped)
+{
+	char buf[16] = {};
+	socklen_t optlen = sizeof(buf);
+
+	ASSERT_EQ(0, getsockopt(self->fd, SOL_RAW, ICMP_FILTER,
+				buf, &optlen));
+	ASSERT_EQ(sizeof(struct icmp_filter), optlen);
+}
+
+/* Unlike the int/u64 options above, ICMP_FILTER clamps the length down
+ * to the user buffer instead of returning EINVAL: a short buffer
+ * succeeds and reports the truncated length back via optlen.
+ */
+TEST_F(raw, icmpfilter_undersize_clamped)
+{
+	char buf[2] = {};
+	socklen_t optlen = sizeof(buf);
+
+	ASSERT_EQ(0, getsockopt(self->fd, SOL_RAW, ICMP_FILTER,
+				buf, &optlen));
+	ASSERT_EQ(sizeof(buf), optlen);
+}
+
+TEST_F(raw, icmpfilter_wrong_proto)
+{
+	struct icmp_filter filt;
+	socklen_t optlen = sizeof(filt);
+	int fd;
+
+	fd = socket(AF_INET, SOCK_RAW, IPPROTO_UDP);
+	if (fd < 0)
+		SKIP(return, "SOCK_RAW/UDP socket: %s", strerror(errno));
+
+	ASSERT_EQ(-1, getsockopt(fd, SOL_RAW, ICMP_FILTER, &filt, &optlen));
+	ASSERT_EQ(EOPNOTSUPP, errno);
+	close(fd);
+}
+
+TEST_F(raw, bad_optname)
+{
+	socklen_t optlen;
+	int val;
+
+	optlen = sizeof(val);
+
+	ASSERT_EQ(-1, getsockopt(self->fd, SOL_RAW, 0x7fff, &val, &optlen));
+	ASSERT_EQ(ENOPROTOOPT, errno);
+	ASSERT_EQ(sizeof(val), optlen);
+}
+
 TEST_HARNESS_MAIN

-- 
2.53.0-Meta

