Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793109845;
	b=dDXL6K4QTRloZN0P9aKlBp8voPc9iv8gMHWCSrS8GRMWrWwiS4VLrz9+bgJQkgtnFpxs
	 fMmfeCXmWYgb8+Cga38E+j2xCY2y3ihKjSuNpAltiGYq/xlO+KuUffHMGcbTGgIXXZmGz
	 RwucsOlHuIIKzZJ+jk+Dtfpsy+8jJqi8vgVgDu7RFivhcHSNajAgyCofKC8wc/zaSajrz
	 +Q6yV+hRrx95Cv+pM6iNWGJ4T8DsYgzDV66Uvf/Wkwvm2bCoTTzLEaz3o5cTAWnJfcdVG
	 ZCDtTzX/+FSmDGhrh1jtG06d7v4XzMEgdIVZYj3bs5/A/CXlLck4GjrBSrJ4e1x8kBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109845;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=PAwubzG0EluHiU5dup8GTgVt2g93YS9uz+x9TVlSADc=;
	b=NR+I8GGig0ifAx2jUe3+cBzMfa0MbYpoiH7Ls89Mu6EVmS3wRS/5uTQ4PT1Hh0xasOaD
	 lqhFt56jRNSLOKQR7d2s34qg4byaJAPQKR1f+zUw3jR7sETpJXzCVkk/dx+HBtJUMWsl+
	 1wghHsz9Fiu0yIpFoZ48zNZ58KN42Db/fNatOUqVkOKrLU4RSvyqUEw5Chg/b5sIjoTzd
	 3mPXrY+YcM87ZAkt23Wb3CJuVM4IEMdHYdbS05pK0vmDxcK1dZXbtbirwmqeFYf0bNKOU
	 M8vipr6VaAIMbObs8wPvZIYaI1DStLHuYncExjI0DEvc2CHnWOv1vIeikk0V9Lj2bTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oTbWgp4B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F248606A325;
	Tue, 27 Oct 2026 14:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oTbWgp4B
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793109844;
	b=kT6BoZsIHd2kJW/lKt+IQWtYw6OcwRPmqingq2BAABuLjpE5AcUPmQsSR0LbyFiyg/rB
	 GyM2o5Ihjr2JQMpr4eD/d7KDQl6WJbiqE2K/k7tg9/ooX26DQkvG53rqoosK0Kh6J050X
	 /jO0z1C76PNKZk0d5Vqk0kHcKKXq7mnDdR0tZTMlQ6aCA/u7Pa7wO10RPJS92/6D1yzti
	 2PFBo/hPZ/++qxCPizV7Lde8b4pdARlOYxAl7g2nyTyGLTMSRTQi8xPm8C6m1Jqqj50Dz
	 lnCjVdDpeS39OqnFXFhFmCR1jEnXMtbWW1i+HVf+5QtwpKsThqB7zC6mrscniniQ/tA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793109844;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=PAwubzG0EluHiU5dup8GTgVt2g93YS9uz+x9TVlSADc=;
	b=X1MCE1oVQ2ccHkrYzIxSrvcyb5HkoXdg/PJXlMIPR0WNt2ldDrjSqx6gpuOQH4vsGbkp
	 tMEZRXyeWct+oL1+TgJ7vNQYmeO3qJHZILto1O7QUI+mXOqtWkN3ue0fLQTjouVj+nxW3
	 ivlVcdJz9ST6D1BaiAEWz8RU4jbcE92tQ3MdCYz9I9qldvWpjNpfyVPg3tFqun0J5cUeN
	 djF/y1OR9B1qPZxWurPrW2WGeSj3utl92SaRul5x+LANOxBCHspfDGWasGHMEKc7FUWOO
	 WnpdNArkngCyL7d6NFc10HuuDdQ9bzEJi/AR55XVMi7Q6sgyQuvLQKMvpOZztkJEYzQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E5DC31F031E1;
	Tue, 27 Oct 2026 14:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793109844;
	bh=PAwubzG0EluHiU5dup8GTgVt2g93YS9uz+x9TVlSADc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=oTbWgp4BldbL55XeTwz5nXuwxHY4tqqWN1WB6E/G5yxUwRDHuxYMp2Pc9d/m4vJQP
	 FfgKUomDUsVhoY1eFlfhK1gDWtmCWHhxryp3KiGsK1g6q1g3hYSdm7vunlUgY9TaYP
	 lJ2IW+2wFXUQ/J9AC+Wo4GZBUpbF/WBqiDhQ7H5K6l/nzazQgUmFWwp3BQpORGv0vG
	 18OGR0fYYkW31HPdb3eDMVobsbCLAX5oW8e2MNemfcAuwrXRSf5V/Cg+W+7XBXpxht
	 3emKIqlfhsL4fp/w73NW7O3mbV4FuvQ7ekupPFzESWHL8c7hsDiqtw2k8aTHXfS09j
	 vscANP/WHP+xA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 573D04510D;
	Tue, 27 Oct 2026 14:04:03 +0000 (UTC)
From: Jhonata Poma-Hansen via B4 Relay <devnull+jhonata.poma.gmail.com@kernel.org>
Date: Tue, 27 Oct 2026 15:04:02 +0100
Subject: [PATCH net v2 2/2] selftests: net: netlink-dumps: start a dump
 with a notification queued
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261027-netlink-dump-livelock-v2-2-c4bb05352a33@gmail.com>
References: <20261027-netlink-dump-livelock-v2-0-c4bb05352a33@gmail.com>
In-Reply-To: <20261027-netlink-dump-livelock-v2-0-c4bb05352a33@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Kuniyuki Iwashima <kuniyu@google.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Jhonata Poma-Hansen <jhonata.poma@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4013;
 i=jhonata.poma@gmail.com; h=from:subject:message-id;
 bh=QvCDY24BNqHaFSZD0SluMGJ84blsufGLlWuNu8gQX+A=;
 b=owGbwMvMwCX21S6Y7aK9oS7jabUkhqwH64Oktjz70LHhuN/z+bsPVT9ic2zlunBItb7ZKW/ez
 CcJue+nd5SyMIhxMciKKbL4nH3cw634ccf/hzsuw8xhZQIZwsDFKQATUc1m+Ct5hXee5qeannOO
 L63VN/EGRmTfnHil1E6o8+3xsmknPd8yMiy/sixsXejrmtCzkqv1LBs8FNk3Cvz/w2k/u2Wl2SV
 tbm4A
X-Developer-Key: i=jhonata.poma@gmail.com; a=openpgp;
 fpr=4CCDE38C0B21F1B8FFE1B8D3F53E5306D13F312D
X-Endpoint-Received: by B4 Relay for jhonata.poma@gmail.com/default with
 auth_id=1288
X-Original-From: Jhonata Poma-Hansen <jhonata.poma@gmail.com>
Reply-To: jhonata.poma@gmail.com
Content-Transfer-Encoding: 7bit

From: Jhonata Poma-Hansen <jhonata.poma@gmail.com>

Add a test which starts a link dump on a socket with SO_RCVBUF 2048
while a link notification is still queued, after a large read made the
kernel attempt large dump skbs. It reads like libnl does, peeking
before each read, and expects the dump to complete with a zero status
and at least one link. The notifications come from bringing lo up and
down, so the test runs in its own netns and is skipped without the
privileges to create one.

The test fails without the previous patch.

Signed-off-by: Jhonata Poma-Hansen <jhonata.poma@gmail.com>
---
 tools/testing/selftests/net/netlink-dumps.c | 102 ++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/tools/testing/selftests/net/netlink-dumps.c b/tools/testing/selftests/net/netlink-dumps.c
index 51129c564..4a94a2516 100644
--- a/tools/testing/selftests/net/netlink-dumps.c
+++ b/tools/testing/selftests/net/netlink-dumps.c
@@ -2,9 +2,12 @@
 
 #define _GNU_SOURCE
 
+#include <errno.h>
 #include <fcntl.h>
+#include <sched.h>
 #include <stdio.h>
 #include <string.h>
+#include <sys/ioctl.h>
 #include <sys/socket.h>
 #include <sys/stat.h>
 #include <sys/syscall.h>
@@ -260,4 +263,103 @@ TEST(close_with_ref)
 	usleep(100 * 1000);
 }
 
+static int lo_set_up(int sock, bool up)
+{
+	struct ifreq ifr = {};
+
+	strcpy(ifr.ifr_name, "lo");
+	if (ioctl(sock, SIOCGIFFLAGS, &ifr))
+		return -1;
+	if (up)
+		ifr.ifr_flags |= IFF_UP;
+	else
+		ifr.ifr_flags &= ~IFF_UP;
+	return ioctl(sock, SIOCSIFFLAGS, &ifr);
+}
+
+static const struct {
+	struct nlmsghdr nlhdr;
+	struct ifinfomsg ifm;
+} dump_links = {
+	.nlhdr = {
+		.nlmsg_len	= sizeof(dump_links),
+		.nlmsg_type	= RTM_GETLINK,
+		.nlmsg_flags	= NLM_F_REQUEST | NLM_F_ACK | NLM_F_DUMP,
+		.nlmsg_seq	= 1,
+	},
+	.ifm = {
+		.ifi_family	= AF_UNSPEC,
+	},
+};
+
+// A dump started while a notification is still queued must make progress
+// for a reader which peeks before reading, like libnl does
+TEST(dump_with_queued_ntf)
+{
+	struct sockaddr_nl addr = {
+		.nl_family	= AF_NETLINK,
+		.nl_groups	= RTMGRP_LINK,
+	};
+	int netlink_sock, inet_sock, i, ret, links = 0;
+	int rcvbuf = 2048;
+	bool done = false;
+	char buf[32768];
+	ssize_t n;
+
+	ret = unshare(CLONE_NEWNET);
+	if (ret && errno == EPERM)
+		SKIP(return, "Needs CAP_SYS_ADMIN for a netns");
+	ASSERT_EQ(ret, 0);
+
+	inet_sock = socket(AF_INET, SOCK_DGRAM, 0);
+	ASSERT_GE(inet_sock, 0);
+	netlink_sock = socket(AF_NETLINK, SOCK_RAW, NETLINK_ROUTE);
+	ASSERT_GE(netlink_sock, 0);
+	ASSERT_EQ(setsockopt(netlink_sock, SOL_SOCKET, SO_RCVBUF,
+			     &rcvbuf, sizeof(rcvbuf)), 0);
+	ASSERT_EQ(bind(netlink_sock, (struct sockaddr *)&addr,
+		       sizeof(addr)), 0);
+
+	// A large read makes the kernel attempt large dump skbs
+	ASSERT_EQ(lo_set_up(inet_sock, true), 0);
+	n = recv(netlink_sock, buf, sizeof(buf), 0);
+	ASSERT_GE(n, (ssize_t)sizeof(struct nlmsghdr));
+
+	// Leave one notification queued, then start the dump
+	ASSERT_EQ(lo_set_up(inet_sock, false), 0);
+	n = send(netlink_sock, &dump_links, sizeof(dump_links), 0);
+	ASSERT_EQ(n, sizeof(dump_links));
+
+	for (i = 0; i < 100 && !done; i++) {
+		struct nlmsghdr *nlh;
+
+		n = recv(netlink_sock, buf, sizeof(buf),
+			 MSG_PEEK | MSG_TRUNC | MSG_DONTWAIT);
+		if (n < 0)
+			continue;
+		n = recv(netlink_sock, buf, sizeof(buf), MSG_DONTWAIT);
+		if (n < 0)
+			continue;
+
+		for (nlh = (struct nlmsghdr *)buf; NLMSG_OK(nlh, n);
+		     nlh = NLMSG_NEXT(nlh, n)) {
+			if (nlh->nlmsg_seq != dump_links.nlhdr.nlmsg_seq)
+				continue;
+			if (nlh->nlmsg_type == NLMSG_ERROR)
+				EXPECT_EQ(*(int *)NLMSG_DATA(nlh), 0);
+			if (nlh->nlmsg_type == RTM_NEWLINK)
+				links++;
+			if (nlh->nlmsg_type == NLMSG_DONE) {
+				EXPECT_EQ(*(int *)NLMSG_DATA(nlh), 0);
+				done = true;
+			}
+		}
+	}
+	EXPECT_TRUE(done);
+	EXPECT_GE(links, 1);
+
+	close(netlink_sock);
+	close(inet_sock);
+}
+
 TEST_HARNESS_MAIN

-- 
2.54.0


