Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792754770;
	b=eilRtzts5eRcqoZbzSEA8jspGnS0elwtrqoanVW3P/RuJb6S9ViPr5qcJ7WKJ3jYDcFM
	 Vvsj7y4X4YL+AIFOm/pSV3gVHd4D9oa2mo4nNAQC1buEW2YS5PCN3yhmk2mU7gue2oL+1
	 YdvWS8JMoWI4kW1Axnv05t9EIGVQ4CbAnXkfmJ6vgwb05FXx5IviEq/Lc4EDzYTiGJrwA
	 ZOljW93faRYlyinrLiWioai02BSfZGx5850PYxjGSnlmvpIyUXoNs/qMSIES8Fbi+IDhq
	 1udLBfUEIGvXfmbjTh2Ue8Kn3cRc9ngZNOw86kcfBrpRwJ3to123iXjQpTkFE8ep4EA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792754770;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7V05kjnhOHwz9Rn9HHAePSObxd8ClZWF7ntAaDTI6WA=;
	b=sTS/wDFFwHkGMkr9lBjYbNAsnEf/ZIdVjfrG0YpogmMpqzILmoOO8uw1naCBV9p7ya3p
	 BARtghZwDyP0syqw0DKIO0yZTJSJ34Kj2kaYRh5sKT0v1Rx4P75zdRQO8LED5p/C/UmGB
	 hNvac3p353IPSLaXTfKnFmfT6g6r87C1xS5C7S74rKyrndVHibtsLaf9vQ1uTwCyHvK0+
	 YzrKNk+10qs6DwzC3cSZcgW4vFBeanGWZG5cp5xg5TsJfMjtCxNFWbKoHJgExVBww0cFq
	 liAA4u6FWl+k9T//RVJjTzQu6bZw8e4eYP8gisUPfDvsw+WZw9MMS1fyz4+t8IbnynQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fjoApjQN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C08606A31A;
	Fri, 23 Oct 2026 11:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fjoApjQN
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792754770;
	b=YNPEt+dZ0b3ET/cOA0kU+xVhYiDpgNJk6aTV9aBFj+f3mYahyKUpFDEKzBPrH39fEA35
	 5Pc8iphuOcRoeua2BvOQVyzHFCD7HIATGOzBdghlDAC6eZ6JXfs4r2JVw4Rxan210bsZX
	 HofdRa/RIT1seHAyiLF4guTU+HNZYFFLJLbr9NupB77YNZ90reQixiPVtNPQl1df8xwIk
	 GGaOtZLauMxLiboJDWc0Qg1k2GLLTd1VWvm7wMY+LtXitzEFILwbJmHnpBkch0YuoBf6v
	 SEXziilcTVSvS7PJScEMwpichS9/j3k5LBJX9raerRJrKB5MsiAtovyPYlHUvVFGqzw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792754770;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7V05kjnhOHwz9Rn9HHAePSObxd8ClZWF7ntAaDTI6WA=;
	b=bTbx4+4w4C305koCqdz9KSEx0bWdZMJvGlZhlOks/2uIRF4Agdtec9Y5IW6dsqRK3OGM
	 6DAo6c3ALBzNS16FtbU/xdWYk/AHMLNk3qmK2IWmcgpunxu1F3kAyj+Ir7hCN3/aRj3E2
	 dqXEbImwsPKnN28jhVRR2aub7C4xD/Li35rfTI4ySjBBJxsDEA+gNQmia/7L1Uonyqdq4
	 Xm1XqosAza6iixkyUyiZpgINKzxgMYaty9OUVfczUBETbQJf8MpQdH0rl1FeYrgEowUBu
	 e3hh11fWzWpqpd/Ihm0KYVEVb+1gZykUH40waHp69ivOloKRb2hfVEMMMY89enSKiqw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2FC8A1F01829;
	Fri, 23 Oct 2026 11:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792754770;
	bh=7V05kjnhOHwz9Rn9HHAePSObxd8ClZWF7ntAaDTI6WA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fjoApjQNXcgg95WqAPYQVZPsqTGkkfp0sn8tYM7fR/2RQ9IT7sQROuUeyuu84N96T
	 JI5M1vBqJ4+JCUuQsu8bDfYsNDlZb8mEhVI7W2w3/wpFwJ0VTZGL/BUZHGLOQqbwh2
	 X1DoW6vLPgGM24GdQposb1ctk9htgp1XZG/9r2AYByNUaZ1K4XkZTsezen8JkosspU
	 dZQ8Ffk8W4AN/TXtADfWioHDdNiUahmdcEGW2MCkhguyAKaIlkF5Bmrpqep+oLG8zs
	 GCzKx6p3i3YcxSHQP6DnfBFKEznjBqJlW76wM1UBldIagY7US1aw43lwFvx0DuaLy3
	 mmTy1eA0Ll61w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9AFDE444E7;
	Fri, 23 Oct 2026 11:26:08 +0000 (UTC)
From: Jhonata Poma-Hansen via B4 Relay <devnull+jhonata.poma.gmail.com@kernel.org>
Date: Fri, 23 Oct 2026 13:26:08 +0200
Subject: [PATCH net 2/2] selftests: net: netlink-dumps: start a dump with a
 notification queued
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
Message-Id: <20261023-netlink-dump-livelock-v1-2-478214a635d2@gmail.com>
References: <20261023-netlink-dump-livelock-v1-0-478214a635d2@gmail.com>
In-Reply-To: <20261023-netlink-dump-livelock-v1-0-478214a635d2@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Kuniyuki Iwashima <kuniyu@google.com>, 
 Jhonata Poma-Hansen <jhonata.poma@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3524;
 i=jhonata.poma@gmail.com; h=from:subject:message-id;
 bh=f+a8MC9imhU/+9RhQSahUYzMxPQaNUJwAl0pyGoew3k=;
 b=owGbwMvMwCX21S6Y7aK9oS7jabUkhqzbLv5s5vKyU8XutQhXJs9qZ/lTqNcqrtmwfI5vi8SlD
 8uZRSs6SlkYxLgYZMUUWXzOPu7hVvy44//DHZdh5rAygQxh4OIUgInU+DH8ZpmxIuPLw5sCalPC
 lcoWT3Kas13UPMvm1IrM/T2/nsRfO8PwP6yALS61scmVvarvH68n7yf34oJfATulug8/3nHx/zk
 tBgA=
X-Developer-Key: i=jhonata.poma@gmail.com; a=openpgp;
 fpr=4CCDE38C0B21F1B8FFE1B8D3F53E5306D13F312D
X-Endpoint-Received: by B4 Relay for jhonata.poma@gmail.com/default with
 auth_id=1288
X-Original-From: Jhonata Poma-Hansen <jhonata.poma@gmail.com>
Reply-To: jhonata.poma@gmail.com
Content-Transfer-Encoding: 7bit

From: Jhonata Poma-Hansen <jhonata.poma@gmail.com>

Add a test which starts a link dump on a socket with a small receive
buffer while a link notification is still queued, after a large read
made the kernel attempt large dump skbs. The test reads like libnl
does, peeking before each read, and expects the dump to complete.

Signed-off-by: Jhonata Poma-Hansen <jhonata.poma@gmail.com>
---
 tools/testing/selftests/net/netlink-dumps.c | 93 +++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/tools/testing/selftests/net/netlink-dumps.c b/tools/testing/selftests/net/netlink-dumps.c
index 51129c564..6f66a478d 100644
--- a/tools/testing/selftests/net/netlink-dumps.c
+++ b/tools/testing/selftests/net/netlink-dumps.c
@@ -3,8 +3,10 @@
 #define _GNU_SOURCE
 
 #include <fcntl.h>
+#include <sched.h>
 #include <stdio.h>
 #include <string.h>
+#include <sys/ioctl.h>
 #include <sys/socket.h>
 #include <sys/stat.h>
 #include <sys/syscall.h>
@@ -260,4 +262,95 @@ TEST(close_with_ref)
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
+	int netlink_sock, inet_sock, i;
+	int rcvbuf = 8192;
+	bool done = false;
+	char buf[32768];
+	ssize_t n;
+
+	ASSERT_EQ(unshare(CLONE_NEWNET), 0);
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
+			if (nlh->nlmsg_type == NLMSG_DONE)
+				done = true;
+		}
+	}
+	EXPECT_TRUE(done);
+
+	close(netlink_sock);
+	close(inet_sock);
+}
+
 TEST_HARNESS_MAIN

-- 
2.54.0


