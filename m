Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795034161;
	b=ZU3llZi2qvfG+HDPFPO3WRVL5NgG6gV0EZtA9V83Dc5uo3T0eeWcrdb2LhoLZzKowJ3N
	 7Pe+B+WvkmhTSz2666epFUi7Tn0yfo+2qg4t7vkDW0c/V5qLdRC957xO61X118hkhBTci
	 JtHtZYO/uEaGw04MISBzTGvnbdjoOyJETF+KSIx81N0mtjVqbyUCxfJzP634e7usPPOfF
	 Cs7ld7sdCHr5Et+0U+BSCZRouidKWPAoECo8MzVPw2AUDWMkZ+qHB0qFqo34HeXFKZYmE
	 36dFdbf3S6y7VCweyACUzT0qZMFhTaJNxZqaz39WSidTcRI0Yng7+f7aO7tFrDdcpuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034161;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jEY0vd2jLPeL22K7g3/zg/F4xvcfDnw6JtP7MLa4ipY=;
	b=zhC09zHij8iWVYuzGzFqLQy7uz15pmQ/4033RPQ1/JC8Q0EMq6k4zjBoq3YbA2FpnxCz
	 U4tzBNoVFSccDrreeHSKhOGX1Ew4MyrPY+tXjbLFnGx7L1z8U9N6V3Wyv/NingmvX8RaF
	 WZY0dlvp/AcsbogT57JMFmlqI+d8jU0QX5K+Dd5pV8rkWhKSWcRbGo1g+NfwnLhVFRFj+
	 1VjcKlTvTfhQBmkydssS+Fwo+lI44x1/fT17/RGc4cmN/UrJuzBHCvqFRIvrZ31OvqKAL
	 7Z0SCBFUAlISw8l6uO0XAKcZ8kd6KsYlKBviwBXKJ6F+xXAmpC+FDfMNt3FP8YPIlig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G3DdLBtG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB88606A320;
	Wed, 18 Nov 2026 20:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G3DdLBtG
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795034161;
	b=EZpQxlLwL5kOzj/oDLPW3TK6bO3h3VOpFgEhHe7akIGpK7qlvl8mdS6GnZ+Fe5pIy7yW
	 Kxiew5km3eH8fPpsf6zqDzCqwlrQ18r1N9j6vl5BPu/PxKZ896PdUVoOqMYLDoeI4Vi1D
	 Yb3YjVHC/BaKNDfLVVZbcvCBd4Iayr093IdCRrgB9KMuzPMxBVe2jmslYPl6gLSV0FDLA
	 fws9egw7ERJDjjWFecrkKiscxeR4Ign6aFBTls3R/p/jtYszlmBFiJV0xY7mn5DY0A+8a
	 wQj+ObZHsYuDMqojpkza9ZdXWbCEPYvWXdky3FnEPrwDY6ufu5i2GoaR7RZa653Ciiw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795034161;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jEY0vd2jLPeL22K7g3/zg/F4xvcfDnw6JtP7MLa4ipY=;
	b=e7eYliVGJKeoixOxbVGBVDIwLHJzgh1ZpC4bqWLwNMDL7T4QjhOknbVa93hq1LQvnGBW
	 2XXp37kM9bb/bXX6oRXh35pg++6bJj13vGItEiy73n1Jfvxlk91VHTMc2+0UCXDLXd0Z5
	 PMDcTY5ttLdTa63VuqwenuZWY0zlwJKervyK/7Iih+IXnhsecmaCYC2YSzkChjtVr5XpP
	 rsFQBdeS+ASRFU7fbtyhKa/K42E1T4Zclmpn05TUKqQw/r+D/iyW7hTXnpsDgNspBr6kU
	 4U74cInwFzn5ca4M+/bILISVtaY1ETvepyzsQ0rHcVUcQjtrOgopjwUVH/k+9gvzMSA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BB6DC1F000C5;
	Wed, 18 Nov 2026 20:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795034161;
	bh=jEY0vd2jLPeL22K7g3/zg/F4xvcfDnw6JtP7MLa4ipY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=G3DdLBtGMEXH7ZTgNv5TIg04YUbpEQjWBPx7E3h0WzvRK04n5wLAEjyiNzJ/2Kd3e
	 jUhUAB4bx+NWWAbQe1KC82hANTKEqpq1lQHKTNwUkwqjTkjFL7aVN2aqKh6zPrU+qx
	 czufARCOY7N5pkrqxD/6DuKcMYeY5n1+rfxinCPzLpw5Q3qFqceg/iEfMiV7Gkt5Ka
	 MQaECa8eZ9u+p9VI4QGhp8jruS/jED1XYwxilmknQHghH9S1c/SnN5tr7maZ2jtmV0
	 3O2geM2fW/drcPojKwgjeMc20jYOzx3I2G0BxqMmr/c7RNxgqzrLdIYwq4S5n0vX8N
	 Y6q11U1TjrYHQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3E6894AF7A;
	Wed, 18 Nov 2026 20:36:00 +0000 (UTC)
From: Felipe Pereira Stival via B4 Relay <devnull+v0idpwn.gmail.com@kernel.org>
Date: Wed, 18 Nov 2026 17:35:49 -0300
Subject: [PATCH net 2/2] selftests: tls: add a poll test for a queued
 KeyUpdate
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
Message-Id: <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-2-8e25101e7be6@gmail.com>
References: <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-0-8e25101e7be6@gmail.com>
In-Reply-To: <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-0-8e25101e7be6@gmail.com>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Felipe Pereira Stival <v0idpwn@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795034159; l=2062;
 i=v0idpwn@gmail.com; s=20261118; h=from:subject:message-id;
 bh=aEku9achIkB6xdlEKNORIQj8tkacDlGHfxVLzvkqD+I=;
 b=9enkyopIsrXF5MoQP6Zq/3/ASTULs3Fy+dQmB0HgprtypW2tcal9ICT36I2YwTGth+euHjEo0
 OVRpWt5r9r3Dt7EHSsmtfRYLtcPzIvSS/9B9ZzJbiis7hZpV9eyZwsK
X-Developer-Key: i=v0idpwn@gmail.com; a=ed25519;
 pk=dy+Py1JexopmEarZT58aUO9PMt7zs+cB62CS+N7NWTw=
X-Endpoint-Received: by B4 Relay for v0idpwn@gmail.com/20261118 with
 auth_id=1562
X-Original-From: Felipe Pereira Stival <v0idpwn@gmail.com>
Reply-To: v0idpwn@gmail.com
Content-Transfer-Encoding: 7bit

From: Felipe Pereira Stival <v0idpwn@gmail.com>

Check that poll() reports a read event when a recv() for data has
decrypted and queued a KeyUpdate. Once the KeyUpdate has been read,
check that poll() doesn't report a record sent with the new key.

Assisted-by: Claude:claude-fable-5-2
Signed-off-by: Felipe Pereira Stival <v0idpwn@gmail.com>
---
 tools/testing/selftests/net/tls.c | 40 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index bd2797f9f61..59e403b5f12 100644
--- a/tools/testing/selftests/net/tls.c
+++ b/tools/testing/selftests/net/tls.c
@@ -2421,6 +2421,46 @@ TEST_F(tls, rekey_poll_delay)
 	}
 }
 
+TEST_F(tls, rekey_poll_queued)
+{
+	char const *test_str = "test_message";
+	struct tls_crypto_info_keys tls12;
+	struct pollfd pfd = { };
+	char buf[100];
+	int send_len;
+
+	if (self->notls)
+		SKIP(return, "no TLS support");
+
+	if (variant->tls_version != TLS_1_3_VERSION)
+		return;
+
+	/* data followed by a KeyUpdate */
+	send_len = strlen(test_str) + 1;
+	EXPECT_EQ(send(self->fd, test_str, send_len, 0), send_len);
+	tls_send_keyupdate(_metadata, self->fd);
+
+	/* reading the data decrypts the KeyUpdate and leaves it queued */
+	EXPECT_EQ(recv(self->cfd, buf, sizeof(buf), MSG_WAITALL), send_len);
+	EXPECT_EQ(memcmp(buf, test_str, send_len), 0);
+
+	/* KeyUpdate hasn't been read, expect cfd to be readable */
+	pfd.fd = self->cfd;
+	pfd.events = POLLIN;
+	EXPECT_EQ(poll(&pfd, 1, 0), 1);
+
+	/* get KeyUpdate */
+	tls_recv_keyupdate(_metadata, self->cfd, 0);
+
+	/* update TX key and send with it */
+	tls_crypto_info_init(variant->tls_version, variant->cipher_type, &tls12, 1);
+	EXPECT_EQ(setsockopt(self->fd, SOL_TLS, TLS_TX, &tls12, tls12.len), 0);
+	EXPECT_EQ(send(self->fd, test_str, send_len, 0), send_len);
+
+	/* key hasn't been updated, expect cfd to be non-readable */
+	EXPECT_EQ(poll(&pfd, 1, 0), 0);
+}
+
 struct raw_rec {
 	unsigned int plain_len;
 	unsigned char plain_data[100];

-- 
2.56.0


