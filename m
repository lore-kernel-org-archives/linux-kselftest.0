Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792975014;
	b=rV6dwiGMPOw4LjT1IT9zDsJsJHOlpVHVmOwGWl7kA+l3ic6ztgbyuTx1YefPnJabR+uj
	 iWSyGh0DQjEV6M3VdODhKToE5KK7SIHRIqqXPre8Z1riVpmOgTQpcX1r9TMv6R8nBL4T0
	 tNIwkL9SPa4jlH5Sjr/uvwrg3zH7HrNDZouoQlMGlg6ZVmQzuKXR0xNOD9aOPnIBZnqmr
	 un5Y/2IbMskFUCcS6uEfW/zUMRIEYZbYNHrMFc9HcNtK9n11bkin0tAICN6IVTN8JHCyt
	 XPxV/aZ1eabEfAqnL8onubCJqNsot+k5W+qXphU6GyqT6+RFKHgIKKANPeDaoGc0IQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975014;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=m+EbTsNk0LWkXXCWtw52FAj4Hw4PwsHMPWs5J2sqEps=;
	b=B/0nvNoQVJ6yutCWoM4fqqnM5ddcj0tHTEJhzWtTcEBosTgd+gOqOFxkyh91OrzYzB1Q
	 JNmnRC5Kplf5w95440Rd7ZCRCEHgcUOX5373CwfHsJ/Dxh5v5m/Vm2jHhLGluGe9ZSDQP
	 pYUU2h8v504v9OAdwRv1w0gGpCAeimGiaug9lw+LHAwIlHbFs9K+bsl3s/t50ObjQmF0Z
	 Zk3njJlrKIw5UY/syhRqayd4aeQCRyo2ubHnq8Oxs/HrNbI7YjCEo90gXrVeDBWfHBc2d
	 x/uTJ4cA8bz5z9T3baVNMYVSgb9wtdE+zPm1gPQsuqx0RJpIaS8L5zRLgACBLtzZU1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hWfTqytS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F85606A337;
	Mon, 26 Oct 2026 00:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hWfTqytS
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792975014;
	b=gkggy9ZZOMlr2O+TburTPUZzUJQz69bbba/jlzfYptTV0tO5c/klgJHwpusGozlfWaPj
	 OcxYOQgwBRAPOALPgHK4JQPQHV3jXO/lkn5F7iObjCsPHNATnEIOtyMTQFR0cCHdEEjEb
	 EpzJIjMKciZTIuXbXb8Oq0aL1b4Wn7ifjBsNrMjo+horJo2QJOE9ii7sOd1YivbOqLVJ+
	 oVBFEEqnXTOFuhQhPG44eVHRE4K6JFTm2HeeNfMognj2JFZyJfJvKWglYk+0lkXRg2Sqf
	 OSmcQgyKWo65ZRMFZ3DFgiN+K8zC7rbTzVUxFFZ6fv74W6t0WxC4wTV/rFfVJHUNbjg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792975014;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=m+EbTsNk0LWkXXCWtw52FAj4Hw4PwsHMPWs5J2sqEps=;
	b=rgwwO/1Bm5Gf9sLz+K6Ml6sX8/a0PU6gjlerMVpYNcLZuGTW+qSIVDyhcZg5SZCdnWCa
	 VQF9k3qygat2/zNUw6gWhbyyUF2d1AWZvgqZleQksplz30xVNGvcs+9tSos//CDX3AU8p
	 2EzGc7uU9+C/kjIx1ZO1IELMVuPKMrCyJT8L4nxWhe7ZJsJATjxrb3uqa8066OMUFYCvR
	 yHPWfl3lIFfS/lRz8WphUWAouTTw7Xky5xwv6v27Y70c1QlKL+ioz9C9F0tTdiUsvec9j
	 14wm5vksP4rn7+B3CslRuxnbAKJZUy5Hn6Fz+KjZG32d8vZoYcNhe/LtKUsAWt0hP8w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2A1D61F031E3;
	Mon, 26 Oct 2026 00:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792975014;
	bh=m+EbTsNk0LWkXXCWtw52FAj4Hw4PwsHMPWs5J2sqEps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hWfTqytS4xvugKU3N9ivql9sPUNq+J/YhMEgtBo8XX7IznV1sYRyYcMhfRhGEmb1V
	 MRu4c0PzDVv47Qeh+IyUEZjBhre9j1P464AQ3tNevyE2sHcnCxwCLn0gJbB7xxBhnL
	 U+cWS3EGzctMTf6oaNACN3tDgenEjR5QZ+7fAo0glpoltGDTprDSPrQFVAg+sO8PTp
	 UMRSk3KvNTiZCbTsHZj/b/1SiVZK0ZMttpPojGgdBOcuKmalubg0850trJhNSsUg8k
	 3VV5W44owxCwaIyxQGQ2vtOwEDWfZRpkpAWlSigxwtzP6BpA8dDIjtDo/YdSM3bVOq
	 F60SagEesqJNQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5A9F944B6E;
	Mon, 26 Oct 2026 00:36:51 +0000 (UTC)
From: Martin Belanger via B4 Relay <devnull+martin.nvme.dev.gmail.com@kernel.org>
Date: Sun, 25 Oct 2026 20:36:52 -0400
Subject: [PATCH RFC net-next 5/5] selftests/tls: add KeyUpdate tests
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261025-keyupdate-rfc-v1-5-60b7756eccbd@gmail.com>
References: <20261025-keyupdate-rfc-v1-0-60b7756eccbd@gmail.com>
In-Reply-To: <20261025-keyupdate-rfc-v1-0-60b7756eccbd@gmail.com>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hannes Reinecke <hare@kernel.org>, Chuck Lever <cel@kernel.org>, 
 kernel-tls-handshake@lists.linux.dev, linux-nvme@lists.infradead.org, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Martin Belanger <martin.belanger@dell.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792975010; l=8642;
 i=martin.nvme.dev@gmail.com; s=20261014; h=from:subject:message-id;
 bh=yVTcJm4gumldwJJYUwOUFkQ01b/PvpDG48+U91afbhM=;
 b=OWGWACKk60Jdz51NxNg5fFf6lIwPI7RqwuiJYwckoH/iN1vocuNyVsCmOWt7Te23mgmX4FsWt
 wdcZylFlv4ZCOH7qmYwuwU5EFsMPsBiLKbc8ang8/0/rHyxFbXwcSgN
X-Developer-Key: i=martin.nvme.dev@gmail.com; a=ed25519;
 pk=4K+XXetGK35w2LzRRddd/bbHawZU222BN+YZRuSpN+k=
X-Endpoint-Received: by B4 Relay for martin.nvme.dev@gmail.com/20261014
 with auth_id=1176
X-Original-From: Martin Belanger <martin.nvme.dev@gmail.com>
Reply-To: martin.nvme.dev@gmail.com

From: Martin Belanger <martin.belanger@dell.com>

Test the in-kernel KeyUpdate on a bidirectional connection with both
traffic secrets registered on each socket:

- registration errors: wrong length, missing key, TLS 1.2, SM4, and
  the RX secret before the TX secret;
- KeyUpdates in both directions with data around them;
- a data record, a KeyUpdate and another data record queued before
  the first read;
- update_requested: the peer answers before its next data, and a
  second request waits for the answer;
- splice() across a KeyUpdate;
- a key installed with TLS_TX removes the registered secrets;
- more than 8 KeyUpdates in one second, and an invalid
  request_update value, end the connection.

Assisted-by: LLM
Signed-off-by: Martin Belanger <martin.belanger@dell.com>
---
 tools/testing/selftests/net/tls.c | 249 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 249 insertions(+)

diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index 9d3cd4fff062..838030d09cd3 100644
--- a/tools/testing/selftests/net/tls.c
+++ b/tools/testing/selftests/net/tls.c
@@ -2390,6 +2390,255 @@ TEST_F(tls, rekey_poll_delay)
 	}
 }
 
+/* In-kernel KeyUpdate: fd and cfd both register the TX and RX traffic
+ * secrets of a bidirectional connection. Returns false if the variant
+ * does not support it.
+ */
+static bool keyupdate_setup(struct __test_metadata *_metadata,
+			    FIXTURE_DATA(tls) *self,
+			    const FIXTURE_VARIANT(tls) *variant)
+{
+	struct tls_crypto_info_keys tls12;
+	unsigned char secret_a[48], secret_b[48];
+	int len;
+
+	if (self->notls || variant->tls_version != TLS_1_3_VERSION)
+		return false;
+
+	switch (variant->cipher_type) {
+	case TLS_CIPHER_AES_GCM_128:
+	case TLS_CIPHER_AES_CCM_128:
+	case TLS_CIPHER_CHACHA20_POLY1305:
+		len = 32;
+		break;
+	case TLS_CIPHER_AES_GCM_256:
+		len = 48;
+		break;
+	default:
+		return false;
+	}
+
+	/* cfd -> fd */
+	tls_crypto_info_init(variant->tls_version, variant->cipher_type,
+			     &tls12, 1);
+	EXPECT_EQ(setsockopt(self->fd, SOL_TLS, TLS_RX, &tls12, tls12.len), 0);
+	EXPECT_EQ(setsockopt(self->cfd, SOL_TLS, TLS_TX, &tls12, tls12.len), 0);
+
+	memset(secret_a, 0xa5, sizeof(secret_a));
+	memset(secret_b, 0x5a, sizeof(secret_b));
+
+	/* the RX secret needs the TX secret first */
+	EXPECT_EQ(setsockopt(self->fd, SOL_TLS, TLS_RX_TRAFFIC_SECRET,
+			     secret_b, len), -1);
+	EXPECT_EQ(errno, EINVAL);
+
+	EXPECT_EQ(setsockopt(self->fd, SOL_TLS, TLS_TX_TRAFFIC_SECRET,
+			     secret_a, len), 0);
+	EXPECT_EQ(setsockopt(self->fd, SOL_TLS, TLS_RX_TRAFFIC_SECRET,
+			     secret_b, len), 0);
+	EXPECT_EQ(setsockopt(self->cfd, SOL_TLS, TLS_TX_TRAFFIC_SECRET,
+			     secret_b, len), 0);
+	EXPECT_EQ(setsockopt(self->cfd, SOL_TLS, TLS_RX_TRAFFIC_SECRET,
+			     secret_a, len), 0);
+
+	return true;
+}
+
+static void keyupdate_send(struct __test_metadata *_metadata, int fd,
+			   int request)
+{
+	EXPECT_EQ(setsockopt(fd, SOL_TLS, TLS_TX_KEY_UPDATE,
+			     &request, sizeof(request)), 0);
+}
+
+static void send_recv_str(struct __test_metadata *_metadata, int from, int to,
+			  const char *str)
+{
+	int len = strlen(str) + 1;
+	char buf[64];
+
+	EXPECT_EQ(send(from, str, len, 0), len);
+	EXPECT_EQ(recv(to, buf, sizeof(buf), 0), len);
+	EXPECT_EQ(memcmp(buf, str, len), 0);
+}
+
+TEST_F(tls, keyupdate_secret_errors)
+{
+	unsigned char secret[48] = {};
+	int one = 1;
+
+	if (self->notls)
+		SKIP(return, "no TLS support");
+
+	/* no secret registered */
+	EXPECT_EQ(setsockopt(self->fd, SOL_TLS, TLS_TX_KEY_UPDATE,
+			     &one, sizeof(one)), -1);
+	EXPECT_EQ(errno, EINVAL);
+
+	if (variant->tls_version != TLS_1_3_VERSION) {
+		EXPECT_EQ(setsockopt(self->fd, SOL_TLS, TLS_TX_TRAFFIC_SECRET,
+				     secret, 32), -1);
+		EXPECT_EQ(errno, EINVAL);
+		return;
+	}
+
+	if (variant->cipher_type == TLS_CIPHER_SM4_GCM ||
+	    variant->cipher_type == TLS_CIPHER_SM4_CCM) {
+		EXPECT_EQ(setsockopt(self->fd, SOL_TLS, TLS_TX_TRAFFIC_SECRET,
+				     secret, 32), -1);
+		EXPECT_EQ(errno, EOPNOTSUPP);
+		return;
+	}
+
+	/* the RX key is not installed on fd */
+	EXPECT_EQ(setsockopt(self->fd, SOL_TLS, TLS_RX_TRAFFIC_SECRET,
+			     secret, 32), -1);
+	EXPECT_EQ(errno, EINVAL);
+
+	/* wrong length */
+	EXPECT_EQ(setsockopt(self->fd, SOL_TLS, TLS_TX_TRAFFIC_SECRET,
+			     secret, 16), -1);
+	EXPECT_EQ(errno, EINVAL);
+}
+
+TEST_F(tls, keyupdate)
+{
+	int i;
+
+	if (!keyupdate_setup(_metadata, self, variant))
+		SKIP(return, "no in-kernel KeyUpdate for this variant");
+
+	send_recv_str(_metadata, self->fd, self->cfd, "before");
+
+	/* stay below the limit of 8 received KeyUpdates per second */
+	for (i = 0; i < 4; i++) {
+		keyupdate_send(_metadata, self->fd, 0);
+		send_recv_str(_metadata, self->fd, self->cfd, "after");
+		keyupdate_send(_metadata, self->cfd, 0);
+		send_recv_str(_metadata, self->cfd, self->fd, "reverse");
+	}
+}
+
+TEST_F(tls, keyupdate_queued)
+{
+	const char *str = "queued behind a KeyUpdate";
+	int len = strlen(str) + 1;
+	char buf[64];
+
+	if (!keyupdate_setup(_metadata, self, variant))
+		SKIP(return, "no in-kernel KeyUpdate for this variant");
+
+	/* the record before the KeyUpdate, the KeyUpdate and the record
+	 * after it are all queued before the first read
+	 */
+	EXPECT_EQ(send(self->fd, str, len, MSG_MORE), len);
+	keyupdate_send(_metadata, self->fd, 0);
+	EXPECT_EQ(send(self->fd, str, len, 0), len);
+
+	EXPECT_EQ(recv(self->cfd, buf, len, MSG_WAITALL), len);
+	EXPECT_EQ(memcmp(buf, str, len), 0);
+	EXPECT_EQ(recv(self->cfd, buf, len, MSG_WAITALL), len);
+	EXPECT_EQ(memcmp(buf, str, len), 0);
+}
+
+TEST_F(tls, keyupdate_request)
+{
+	int one = 1;
+
+	if (!keyupdate_setup(_metadata, self, variant))
+		SKIP(return, "no in-kernel KeyUpdate for this variant");
+
+	keyupdate_send(_metadata, self->fd, 1);
+
+	/* no answer yet */
+	EXPECT_EQ(setsockopt(self->fd, SOL_TLS, TLS_TX_KEY_UPDATE,
+			     &one, sizeof(one)), -1);
+	EXPECT_EQ(errno, EBUSY);
+
+	/* cfd processes the request, then answers ahead of its data */
+	send_recv_str(_metadata, self->fd, self->cfd, "request");
+	send_recv_str(_metadata, self->cfd, self->fd, "answer");
+
+	/* answered */
+	keyupdate_send(_metadata, self->fd, 1);
+	send_recv_str(_metadata, self->fd, self->cfd, "request");
+	send_recv_str(_metadata, self->cfd, self->fd, "answer");
+}
+
+TEST_F(tls, keyupdate_splice)
+{
+	const char *str = "spliced after a KeyUpdate";
+	int len = strlen(str) + 1;
+	char buf[64];
+	int p[2];
+
+	if (!keyupdate_setup(_metadata, self, variant))
+		SKIP(return, "no in-kernel KeyUpdate for this variant");
+
+	ASSERT_GE(pipe(p), 0);
+
+	keyupdate_send(_metadata, self->fd, 0);
+	EXPECT_EQ(send(self->fd, str, len, 0), len);
+
+	EXPECT_EQ(splice(self->cfd, NULL, p[1], NULL, len, 0), len);
+	EXPECT_EQ(read(p[0], buf, len), len);
+	EXPECT_EQ(memcmp(buf, str, len), 0);
+
+	close(p[0]);
+	close(p[1]);
+}
+
+TEST_F(tls, keyupdate_manual_rekey)
+{
+	struct tls_crypto_info_keys tls12;
+	int zero = 0;
+
+	if (!keyupdate_setup(_metadata, self, variant))
+		SKIP(return, "no in-kernel KeyUpdate for this variant");
+
+	/* a key installed by the user removes the registered secrets */
+	tls_crypto_info_init(variant->tls_version, variant->cipher_type,
+			     &tls12, 2);
+	EXPECT_EQ(setsockopt(self->fd, SOL_TLS, TLS_TX, &tls12, tls12.len), 0);
+
+	EXPECT_EQ(setsockopt(self->fd, SOL_TLS, TLS_TX_KEY_UPDATE,
+			     &zero, sizeof(zero)), -1);
+	EXPECT_EQ(errno, EINVAL);
+}
+
+TEST_F(tls, keyupdate_rate_limit)
+{
+	char buf[64];
+	int i;
+
+	if (!keyupdate_setup(_metadata, self, variant))
+		SKIP(return, "no in-kernel KeyUpdate for this variant");
+
+	/* the ninth KeyUpdate in one second ends the connection */
+	for (i = 0; i < 9; i++)
+		keyupdate_send(_metadata, self->fd, 0);
+	EXPECT_EQ(send(self->fd, "x", 1, 0), 1);
+
+	EXPECT_EQ(recv(self->cfd, buf, sizeof(buf), 0), -1);
+	EXPECT_EQ(errno, EBADMSG);
+}
+
+TEST_F(tls, keyupdate_invalid)
+{
+	/* key_update, length 1, request_update 2 */
+	static const char bad[] = "\x18\x00\x00\x01\x02";
+	char buf[64];
+
+	if (!keyupdate_setup(_metadata, self, variant))
+		SKIP(return, "no in-kernel KeyUpdate for this variant");
+
+	EXPECT_EQ(tls_send_cmsg(self->fd, TLS_RECORD_TYPE_HANDSHAKE,
+				(char *)bad, 5, 0), 5);
+
+	EXPECT_EQ(recv(self->cfd, buf, sizeof(buf), 0), -1);
+	EXPECT_EQ(errno, EBADMSG);
+}
+
 struct raw_rec {
 	unsigned int plain_len;
 	unsigned char plain_data[100];

-- 
2.53.0


