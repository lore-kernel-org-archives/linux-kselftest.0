Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793065939;
	b=xe3/QD64Kfuc0WhE4VSBOgr1Fa/jQ/GGVWjuKgX9np0eqmH1huzjYP+OMWXNcrCN2tCe
	 O+vPWaGh0QMNgx2X2aKRpm3QCXSPPsN1lFtO8ot/FUq95a1l1LsLtfMB1aUTTRHrZ/7/4
	 nCLDSTeF0lC7A2tIClXztyGXW9izZvFoI8KUcECC7VmfXP7t83z1oqqYQavL59yS4uWD0
	 P7hf1FRAJ/HZfN+y2XbnFhl1dqcAMCSOvrM5bJQblz0cDi9kjYb5tj6leq2QjuCaQnjjx
	 PRAhF1Iqyj6MSXJfUxxElFRkPyy88UBbm7uoOCCU0pDUTc+J0crfAUjx3oiVtQG5GXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793065939;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=O0e5UsRX/437Pcb2PaCWs3jzNLS3KGar6zSSzPiYqic=;
	b=4Pi14aY3E1vqRLmridMs8KE8X+B6Cfy+WsihCkWSAXi6xX5aIpQxwb5iuqLb56gif9HZ
	 49/0LGRCuWdNWfjZeVndu6z18cRSEckYslbNMYIzHbODvU5WpOQzVYl1vkdGd+Lb7lPfV
	 yzQIwpLRldW4hp+Tob51LaxjjozKUwl74gotuGIkJRazVr+S9/cBRoebEHItRUhptGtu9
	 eWKEc9/lO2IpIydj6742MPcupJ/ydhgePGW2psetFhEbzhYbuTWjmK2LLUxRQ4gAhLksV
	 fGehaDmIAzbiFK6JQwxnCdGpVxNKnPkTUyAbhYEdyiGKvshYAxXHqp6X+OEnHi3tK9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GU5enusX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA529606A32A;
	Tue, 27 Oct 2026 01:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GU5enusX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532A71F031E4;
	Tue, 27 Oct 2026 01:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793065938;
	bh=O0e5UsRX/437Pcb2PaCWs3jzNLS3KGar6zSSzPiYqic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GU5enusX6mVcAYYB7fNC9Bb6UTxt2Ppqi9UY9H5T4RrWzLQTXOFUB4iH/2skPnx2l
	 cnqKtjIt52o/T650isHpw7gqT1oJ6S6CHx5bNmN1jqwN5TDWZeXt9LV+/gbS4RJDPS
	 Yl2XplhROyZC1NHxmIkdW7OEYjfNVInsx3ACrrlga/vP8EDTfwX4Yce8RT9vuIhYSh
	 O3RCfaJEtK63HO6ABzFwZOZiWGuMaNTFQm0KPByWLXZWBhlyP/MP/ZzoooikaHTLeG
	 D96ehsEkQcSB9fguX6cStE0BUdl962bl1vCdsZUzqtOLDLs0UXZTa2Wa5YzkG9kXoy
	 5mvUFNPmaA5nw==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	sd@queasysnail.net,
	john.fastabend@gmail.com,
	shuah@kernel.org,
	cel@kernel.org,
	linux-kselftest@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net 2/2] selftests: tls: Cover splice on a nonblocking socket
Date: Mon, 26 Oct 2026 18:52:15 -0700
Message-ID: <20261027015215.605919-3-kuba@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027015215.605919-1-kuba@kernel.org>
References: <20261027015215.605919-1-kuba@kernel.org>
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

From: Chuck Lever <cel@kernel.org>

Every existing splice call in this file either passes
SPLICE_F_NONBLOCK or runs on a blocking socket, so nothing
exercises the socket's own O_NONBLOCK on the splice path. A change
that stops consulting sock->file->f_flags puts splice(2) and
sendfile(2) back to sleeping in tls_rx_rec_wait(), and the suite
still reports pass.

Splice from a nonblocking socket without SPLICE_F_NONBLOCK, first
with no record queued, which must return EAGAIN, then with a record
to deliver. A kernel that ignores the socket flag sleeps until the
harness timeout rather than returning.

Signed-off-by: Chuck Lever <cel@kernel.org>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 tools/testing/selftests/net/tls.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index 9d3cd4fff062..c4203401c4bf 100644
--- a/tools/testing/selftests/net/tls.c
+++ b/tools/testing/selftests/net/tls.c
@@ -889,6 +889,37 @@ TEST_F(tls, splice_to_pipe)
 	EXPECT_EQ(memcmp(mem_send, mem_recv, send_len), 0);
 }
 
+/* The socket's O_NONBLOCK governs the record wait, as on a plain TCP
+ * socket, even without SPLICE_F_NONBLOCK.
+ */
+TEST_F(tls, splice_nonblock_socket)
+{
+	struct pollfd pfd = { .fd = self->cfd, .events = POLLIN };
+	int send_len = TLS_PAYLOAD_MAX_LEN;
+	char mem_send[TLS_PAYLOAD_MAX_LEN];
+	char mem_recv[TLS_PAYLOAD_MAX_LEN];
+	int flags, p[2];
+
+	flags = fcntl(self->cfd, F_GETFL, 0);
+	ASSERT_GE(flags, 0);
+	ASSERT_EQ(fcntl(self->cfd, F_SETFL, flags | O_NONBLOCK), 0);
+
+	memrnd(mem_send, sizeof(mem_send));
+
+	ASSERT_GE(pipe(p), 0);
+	EXPECT_EQ(splice(self->cfd, NULL, p[1], NULL, send_len, 0), -1);
+	EXPECT_EQ(errno, EAGAIN);
+
+	/* The record may still be in flight, wait for it. A failed splice()
+	 * would leave the read() below blocking until the harness timeout.
+	 */
+	EXPECT_EQ(send(self->fd, mem_send, send_len, 0), send_len);
+	ASSERT_EQ(poll(&pfd, 1, 5000), 1);
+	ASSERT_EQ(splice(self->cfd, NULL, p[1], NULL, send_len, 0), send_len);
+	EXPECT_EQ(read(p[0], mem_recv, send_len), send_len);
+	EXPECT_EQ(memcmp(mem_send, mem_recv, send_len), 0);
+}
+
 TEST_F(tls, splice_cmsg_to_pipe)
 {
 	char *test_str = "test_read";
-- 
2.56.0

