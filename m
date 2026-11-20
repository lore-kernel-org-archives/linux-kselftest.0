Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196629;
	b=5evH4pfrtQ6n/BYZ/3fS59W3FZrQLxg746Cxpku4t/o+u1DULUiz7hh9cnMoZNwSiblC
	 XkNuhnJoQ+glCub+cO7s3xEx3AiMPnQ+CApBb1cjgT7gwf3LzFa9Yy6HtFx3XnbSXDfL7
	 V95vSftJCUU+pnSggbEjeCqk+mCSWyXpgjVihq43yUrqXSkZQaBAn+AfQyF576cpiz76P
	 19X59rBOrDC/fhA7tgwEXQEhZtOVaRFY19vi0xyCDAtjtVefg4qN8EoZQo3bUKkJA28Z+
	 w4TJ84S5gVkyESWFkWIdjSEqyIj9giQ94jy3Mq97EnJBP5Tuzy5TnBphtmfaHfKR7Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Lk7Qvdty/kP051BKcCJgvdEe/6/wWSs6Fi35IE/5fU4=;
	b=iC6ah5FuzSii4nuCcpfbr1u3dGYSgkR4AHFPjmiZPoQeq4fH46+LWjz952N3osjYWHzT
	 ziDvn64lOorcfQbiVbIkgbLzloJY3R05wDxiSxrde1B+UvRWCc54NrWJv0gURR8Et1P/q
	 41D4sVd7VpTUSns10sI/XAxHVsQcMQSRZfYjq/m4R/DvNFc2/haZ0mPNxYuQqKOiJKiy3
	 rkq0NnnVDGbxa0NEF8N7vU/yyAyTqt+uE2vNP/8gATvMBOpv1pi0P0Mh3mqm5GUY1z+N9
	 pBygDYh/8diQFUWmzFx+WfhY13GYinepYg1+1o5MstdamWj9c4fLo2ub5zDCPkTwpdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cXhwszKz;
	arc=none smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042EA60A2620
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 17:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 042EA60A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cXhwszKz
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-99e740a7131so405380241.2
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 09:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196628; x=1795801428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lk7Qvdty/kP051BKcCJgvdEe/6/wWSs6Fi35IE/5fU4=;
        b=cXhwszKzmi1uRYcxKJ7V8hxhEioP8bAdekNIhlMKyG0EqFYvPG3AlJsX987pmURtlV
         NHDTiFkp89uslxjmENfjeHiiXwFHdQmrsMOWuTgTYbQYjxFYfUqF6x1lkDbxOV4nJgfn
         L2SCtwuOtfucDNTpFxKZyEvJ0JU9lDco0gd26MoeBlmAeGZbvLxrJjrI+axboUV6hFW+
         mbk6fhkbleUXrB7PeVdg64yH5waz74ZIPbyI8xatcH9dzfUzlGBWgF+TgCw58YMXu/1a
         q3/wd+ThUp+ANBNrCo0Z8Idxe64USQvfjvt4EQAvb7RFHa6cDoz/N2ddiGVvtRLIBm8T
         2Ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196628; x=1795801428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lk7Qvdty/kP051BKcCJgvdEe/6/wWSs6Fi35IE/5fU4=;
        b=K2OSZXKYVw6nzLu40vtl1R11L3QjeeW0sdZnF7gT4fGgsyaDowGDsjwTDc4s4sDNX5
         fnp3PNBmErcNdL/0rYzLlNgG7ndXuditaBEZBB+3cxej6z1cn9DseO58NOFgbS+q16Iz
         5OUyzz6jn7PSXRcVdfmiO0mFO5UmyQdFfsp3aQBYpSqvZMfb/AmLU51ers8HZ97Ajflx
         Bo/zY1oiGIJ6SxyGBgK2KIQOP1YbmjsNm4dbCUY9GYh7GrNwIsCQ62kcbZpH/E8qeNd9
         H7k1n8KDEe+GHPaR70O0ry85gxK6E8DOVAVz1kR1n35VAOlMIJKPK6lM3SLqJiWOHCHA
         +3Cg==
X-Forwarded-Encrypted: i=1; AL+hErGL0ZB6x4FKQ4+QzYp82PmNQCS2paL5ltahklnsX4Yqv/whKU+68nU/kQiB5ck/KlWw/o98LOAV8c0cFY66YG0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bvwmlJfHzB7A1dfZ6fza89/DXLJG0hYr0jBZJG5H0i5mO/t66
	GskOsgTJq1kjEfkNso5bkqB8HCMQxseqLYRAs5StPoxRdsDdUFVWujZ6
X-Gm-Gg: AZFdTZeizDeAYHKs1w3WmlXGixXKcH9RBc83nC4LC+etr6a+4bCQXQKVdSf8YZBaFtm
	V5v3AKJNgf0ch3BHJAJMagNphR3I3M/77qhmVkjgJndEg13JwbsH3GiDOg9HaxZ/I0dtOcuAWdt
	du0aZCjCdB8r+Q2l/obO4N1NGSG+wDVo/bsJj/ZcUGkx47cNAnKIOpN1Nfq035JZlvEAI1fjOwc
	3v+jhm3MIXb9RH2hw04hWeZbX/MFN34ia+jcYqYLSBeUvWcW9xufJeF97+R+1AjZMgR0fS2FkSp
	jr+gqPVmXe29FUHuuR362RdOdGZwjUMb1ZDe8M+ZD3l7P33y8tuEsmzlvSOf7BwAOTUi5V1nJSq
	NzWrLQcm0Guv3BnmveRpb4zgg/b3Kp2PMTvS6SmvpeZEx2BkJ7Ko7jKpPKNtZFEvqDMDflZcUQW
	Amq3IAFkGvkB8YpKjeY8WDnH/YsGU03BMMpd9uDfO3TC/B/XXEHgb/6AR7HlZsuG7soL4zMONKD
	tdZiAECblU9N0KCRrdRX6cTHt4z2VxTwytymw34fAWbt5tKvDLcGa4plAoRf2fnyDmDfJHISCue
	YyPzQwGacc9cHkWbp1/8DZyIwhIoC5t276yBXbQDgDnOpzjUNF3QOJkcFC4QrZcVEjg2Mg==
X-Received: by 2002:a05:6102:512a:b0:7d6:bae0:e431 with SMTP id ada2fe7eead31-7d73945d06amr2075398137.17.1795196627836;
        Fri, 20 Nov 2026 09:43:47 -0800 (PST)
Received: from localhost.localdomain ([2603:9000:d440:53a:a9cf:4432:7fb7:e8])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7d784b3sm3571363137.2.2026.11.20.09.43.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 09:43:47 -0800 (PST)
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Willem de Bruijn <willemb@google.com>,
	Eric Garver <e@erig.me>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 4/4] selftests: net: Add UDP bind conflict tests
Date: Fri, 20 Nov 2026 12:43:41 -0500
Message-ID: <20261120174341.35873-5-juanagusnicco@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120174341.35873-1-juanagusnicco@gmail.com>
References: <20261120174341.35873-1-juanagusnicco@gmail.com>
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

Add tests for the three bind conflict fixes in this series:

- reuseport_scan_{address,device,hash2}: a SO_REUSEPORT bind is refused
  when a conflicting socket sits behind a compatible one, on the primary
  and on the secondary hash.
- disconnect_keeps_{device,scoped_device}: connect(AF_UNSPEC) keeps a
  device set with SO_BINDTOIFINDEX or with the scope id of bind().
- connect_device_ignored: a device set by connect() does not let a
  socket on another device bind next to it.

reuseport_share and disconnect_clears_connect_device check that the
sharing and the clearing that should still happen still do.

Signed-off-by: Juan Agustin Niccolini <juanagusnicco@gmail.com>
---
 tools/testing/selftests/net/.gitignore        |   1 +
 tools/testing/selftests/net/Makefile          |   1 +
 .../testing/selftests/net/udp_bind_conflict.c | 228 ++++++++++++++++++
 3 files changed, 230 insertions(+)
 create mode 100644 tools/testing/selftests/net/udp_bind_conflict.c

diff --git a/tools/testing/selftests/net/.gitignore b/tools/testing/selftests/net/.gitignore
index 21412510ac26..35f6d5220156 100644
--- a/tools/testing/selftests/net/.gitignore
+++ b/tools/testing/selftests/net/.gitignore
@@ -56,6 +56,7 @@ tools
 tun
 txring_overwrite
 txtimestamp
+udp_bind_conflict
 udp_splice_checksum
 udpgso
 udpgso_bench_rx
diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 9180b9bec515..16b804559051 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -202,6 +202,7 @@ TEST_GEN_PROGS := \
 	tap \
 	tcp_port_share \
 	tls \
+	udp_bind_conflict \
 	udp_splice_checksum \
 # end of TEST_GEN_PROGS
 
diff --git a/tools/testing/selftests/net/udp_bind_conflict.c b/tools/testing/selftests/net/udp_bind_conflict.c
new file mode 100644
index 000000000000..9a67f58c348a
--- /dev/null
+++ b/tools/testing/selftests/net/udp_bind_conflict.c
@@ -0,0 +1,228 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Check that bind() refuses a UDP socket that overlaps another one in
+ * the cases that SO_REUSEPORT, disconnect and connect() used to let
+ * through.
+ */
+
+#include <arpa/inet.h>
+#include <net/if.h>
+#include <sched.h>
+#include <stdlib.h>
+#include <unistd.h>
+
+#include "kselftest_harness.h"
+
+#define PORT	34567
+#define MAX_FDS	32
+
+FIXTURE(udp_bind_conflict)
+{
+	int fd[MAX_FDS];
+	int nr_fds;
+	int lo;
+	int d0;
+};
+
+FIXTURE_SETUP(udp_bind_conflict)
+{
+	ASSERT_EQ(unshare(CLONE_NEWNET), 0);
+	ASSERT_EQ(system("ip link set dev lo up"), 0);
+	ASSERT_EQ(system("ip link add d0 type dummy"), 0);
+	ASSERT_EQ(system("ip link set dev d0 up"), 0);
+	ASSERT_EQ(system("ip addr add fe80::1/64 dev d0 nodad"), 0);
+
+	self->lo = if_nametoindex("lo");
+	self->d0 = if_nametoindex("d0");
+	ASSERT_NE(self->lo, 0);
+	ASSERT_NE(self->d0, 0);
+	self->nr_fds = 0;
+}
+
+FIXTURE_TEARDOWN(udp_bind_conflict)
+{
+	while (self->nr_fds)
+		close(self->fd[--self->nr_fds]);
+}
+
+/* Bind a UDP socket to addr:PORT, on device @ifindex if not 0: through
+ * the scope id for a link-local address, SO_BINDTOIFINDEX otherwise.
+ * Returns the socket, or -errno.
+ */
+static int udp_bind(FIXTURE_DATA(udp_bind_conflict) *self, const char *addr,
+		    int ifindex, bool reuseport)
+{
+	union {
+		struct sockaddr sa;
+		struct sockaddr_in v4;
+		struct sockaddr_in6 v6;
+	} sa = {};
+	socklen_t len;
+	int one = 1;
+	int fd, err;
+
+	if (self->nr_fds == MAX_FDS)
+		return -ENOSPC;
+
+	if (inet_pton(AF_INET, addr, &sa.v4.sin_addr) == 1) {
+		sa.v4.sin_family = AF_INET;
+		sa.v4.sin_port = htons(PORT);
+		len = sizeof(sa.v4);
+	} else if (inet_pton(AF_INET6, addr, &sa.v6.sin6_addr) == 1) {
+		sa.v6.sin6_family = AF_INET6;
+		sa.v6.sin6_port = htons(PORT);
+		len = sizeof(sa.v6);
+		if (IN6_IS_ADDR_LINKLOCAL(&sa.v6.sin6_addr)) {
+			sa.v6.sin6_scope_id = ifindex;
+			ifindex = 0;
+		}
+	} else {
+		return -EINVAL;
+	}
+
+	fd = socket(sa.sa.sa_family, SOCK_DGRAM, 0);
+	if (fd < 0)
+		return -errno;
+
+	if ((reuseport &&
+	     setsockopt(fd, SOL_SOCKET, SO_REUSEPORT, &one, sizeof(one))) ||
+	    (ifindex &&
+	     setsockopt(fd, SOL_SOCKET, SO_BINDTOIFINDEX,
+			&ifindex, sizeof(ifindex))) ||
+	    bind(fd, &sa.sa, len)) {
+		err = -errno;
+		close(fd);
+		return err;
+	}
+
+	self->fd[self->nr_fds++] = fd;
+	return fd;
+}
+
+static int disconnect(int fd)
+{
+	struct sockaddr sa = { .sa_family = AF_UNSPEC };
+
+	return connect(fd, &sa, sizeof(sa));
+}
+
+/* connect() to a link-local peer, which sets the device to @ifindex */
+static int connect_link_local(int fd, int ifindex)
+{
+	struct sockaddr_in6 sa = {
+		.sin6_family = AF_INET6,
+		.sin6_port = htons(PORT),
+		.sin6_scope_id = ifindex,
+	};
+
+	inet_pton(AF_INET6, "fe80::2", &sa.sin6_addr);
+	return connect(fd, (struct sockaddr *)&sa, sizeof(sa));
+}
+
+static int bound_ifindex(int fd)
+{
+	socklen_t len = sizeof(int);
+	int ifindex;
+
+	if (getsockopt(fd, SOL_SOCKET, SO_BINDTOIFINDEX, &ifindex, &len))
+		return -errno;
+	return ifindex;
+}
+
+/* The conflict scan used to stop at the first SO_REUSEPORT socket of the
+ * same owner that overlapped the new one, before reaching 127.0.0.2.
+ */
+TEST_F(udp_bind_conflict, reuseport_scan_address)
+{
+	ASSERT_LE(0, udp_bind(self, "127.0.0.2", 0, false));
+	ASSERT_LE(0, udp_bind(self, "127.0.0.3", 0, true));
+	ASSERT_EQ(-EADDRINUSE, udp_bind(self, "0.0.0.0", 0, true));
+}
+
+TEST_F(udp_bind_conflict, reuseport_scan_device)
+{
+	ASSERT_LE(0, udp_bind(self, "0.0.0.0", self->lo, false));
+	ASSERT_LE(0, udp_bind(self, "0.0.0.0", self->d0, true));
+	ASSERT_EQ(-EADDRINUSE, udp_bind(self, "0.0.0.0", 0, true));
+}
+
+/* More than 10 sockets on the port: the secondary hash is scanned. */
+TEST_F(udp_bind_conflict, reuseport_scan_hash2)
+{
+	char addr[INET_ADDRSTRLEN];
+	int i;
+
+	ASSERT_LE(0, udp_bind(self, "127.0.0.2", self->lo, false));
+	for (i = 3; i < 14; i++) {
+		snprintf(addr, sizeof(addr), "127.0.0.%d", i);
+		ASSERT_LE(0, udp_bind(self, addr, 0, true));
+	}
+	ASSERT_LE(0, udp_bind(self, "127.0.0.2", self->d0, true));
+	ASSERT_EQ(-EADDRINUSE, udp_bind(self, "127.0.0.2", 0, true));
+}
+
+/* Sockets of one owner that SO_REUSEPORT lets share a port still can. */
+TEST_F(udp_bind_conflict, reuseport_share)
+{
+	int i;
+
+	for (i = 0; i < 16; i++)
+		ASSERT_LE(0, udp_bind(self, "127.0.0.1", 0, true));
+	ASSERT_LE(0, udp_bind(self, "0.0.0.0", 0, true));
+	ASSERT_LE(0, udp_bind(self, "0.0.0.0", self->lo, true));
+	ASSERT_LE(0, udp_bind(self, "127.0.0.1", self->d0, true));
+}
+
+/* Disconnect used to clear the device the socket was bound to, leaving it
+ * on top of 0.0.0.0%lo where bind() had refused it.
+ */
+TEST_F(udp_bind_conflict, disconnect_keeps_device)
+{
+	int fd;
+
+	ASSERT_LE(0, udp_bind(self, "0.0.0.0", self->lo, false));
+	ASSERT_EQ(-EADDRINUSE, udp_bind(self, "127.0.0.1", 0, false));
+
+	fd = udp_bind(self, "127.0.0.1", self->d0, false);
+	ASSERT_LE(0, fd);
+	ASSERT_EQ(0, disconnect(fd));
+	ASSERT_EQ(self->d0, bound_ifindex(fd));
+}
+
+TEST_F(udp_bind_conflict, disconnect_keeps_scoped_device)
+{
+	int fd;
+
+	fd = udp_bind(self, "fe80::1", self->d0, false);
+	ASSERT_LE(0, fd);
+	ASSERT_EQ(0, disconnect(fd));
+	ASSERT_EQ(self->d0, bound_ifindex(fd));
+}
+
+/* A device that connect() set is still cleared by disconnect. */
+TEST_F(udp_bind_conflict, disconnect_clears_connect_device)
+{
+	int fd;
+
+	fd = udp_bind(self, "::", 0, false);
+	ASSERT_LE(0, fd);
+	ASSERT_EQ(0, connect_link_local(fd, self->d0));
+	ASSERT_EQ(self->d0, bound_ifindex(fd));
+	ASSERT_EQ(0, disconnect(fd));
+	ASSERT_EQ(0, bound_ifindex(fd));
+}
+
+/* A device that connect() set used to count in the conflict check, so a
+ * socket on another device could bind next to [::]:PORT and overlap it
+ * once it disconnected.
+ */
+TEST_F(udp_bind_conflict, connect_device_ignored)
+{
+	int fd;
+
+	fd = udp_bind(self, "::", 0, false);
+	ASSERT_LE(0, fd);
+	ASSERT_EQ(0, connect_link_local(fd, self->d0));
+	ASSERT_EQ(-EADDRINUSE, udp_bind(self, "::", self->lo, false));
+}
+
+TEST_HARNESS_MAIN
-- 
2.43.0

