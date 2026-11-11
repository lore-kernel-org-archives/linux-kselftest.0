Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423330;
	b=jqfVRiCHCLhDBs2y1a4ZHGugAbT+NngwUrussUkzDnScl9EkFROm511tYR5qWkQajTg6
	 hIJgTmFQv6MTvs8feQ5MP0GkFiNpjKI4B3QUYhMFn/VpOWpilmnJL/Keq4KXWPvsZNTmN
	 j/8uSW4e3z8bvjT4Ktq1Aq94bKpmIpsk9NtkoTSTr+sK6mSQYaeGZXKUbCRw61PMRnr7e
	 /DTDAHG3L0AkeFE4kTSrm3MNnADz/tcQhyFG1vIGC6jJ2PB82ED2esX6GxLIuFphXOQov
	 w8aq6IC2I3lW8CF178sczs3OtwrJrSMbC4qdkV3M0W9XjnOudMDeAybVMgFKeXNfbRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423330;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=TJnpY6z257kJGBN7tvSkztLwnehqtcXSCGdheXOa9oE=;
	b=pVgpalh1Bbbh2He+Kz2N908WGVIYb5B4XWOdWW2KzrR9HP8YN1Vt0cb42t6X+fhQnxm/
	 HwdtkLreVDjGlxqzEjNXsYw85va+GGoPenZibqMYEx0rgLqIed2ZC1ncTeeo8B+43Bz2O
	 DIcRjLIIe54ecaftLTGrZCN3E9ET1/NlZgkqNOrOMIccbJc1REvH0iJvRxT7bKzSXTQAg
	 BJI6bo74BdCeUCs9oPWs2pcJ1fIV4XDn5OOUNvapKoUaJVue3uABu6P59nxINp9RuadmH
	 HW1zp3LZnXDXkNa1I015rdbtIUHmOlPvc9E2spgyuohJJHgY34BL4MCpXWQQpFUUhng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VEtkbqgy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AD9606A890;
	Wed, 11 Nov 2026 18:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VEtkbqgy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B53A11F00A07;
	Wed, 11 Nov 2026 18:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794423330;
	bh=TJnpY6z257kJGBN7tvSkztLwnehqtcXSCGdheXOa9oE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VEtkbqgyWq0glFkTXYHaCPSxfC2yZ0JPPiy+CgMw7/TSBddisd3xuVLDR32N43irC
	 7otReJDp+Co1KxCbax7eOX+UTfe+j4NrMenseB5nHab1KdmvqieMutPd6N8DrukG41
	 K9UnOKDpLFnJpRklqSAOvKGdHoZQVk5vSf2T/t44nP4bDRW5tVUwfU6tPwGuAaKCSq
	 DU0PhPf6dsTeOWHE5L8VoEGMCz4VQO6Kl3u6EpJjEFEM7wQzn8u8ZsgOTCaeShcoI0
	 UDfZm21yX+0qIvvxnBNyx19pez5aXTOrCNeESMaA64wo0ZCjt2eZpR7Sp+D5Mmi9my
	 YxDirRJSprBWA==
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
Subject: [PATCH net v2 5/5] selftests: tls: Cover the cap on consecutive empty records
Date: Wed, 11 Nov 2026 10:55:22 -0800
Message-ID: <20261111185522.2859004-6-kuba@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111185522.2859004-1-kuba@kernel.org>
References: <20261111185522.2859004-1-kuba@kernel.org>
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

Check through both recv() and splice() that a run of 128 empty data
records is consumed and the data record behind it is delivered, and
that a run of 129 breaks the connection with EBADMSG before the data
record can be read. Two runs of 128 with a read returning EAGAIN in
between must not break the connection, the cap applies to a burst the
reader cannot keep up with, not to the connection as a whole.

kTLS cannot send an empty record. A TLS 1.3 record of type 0 whose
only byte is the data content type decrypts to one, since the receiver
strips the 0 as padding.

Reviewed-by: Chuck Lever <cel@kernel.org>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
v2: no change
v1: https://lore.kernel.org/20261109175836.1246840-6-kuba@kernel.org
---
 tools/testing/selftests/net/tls.c | 124 ++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index c505508afde5..bd2797f9f619 100644
--- a/tools/testing/selftests/net/tls.c
+++ b/tools/testing/selftests/net/tls.c
@@ -2894,6 +2894,130 @@ TEST_F(zero_len_splice, test)
 	close(p[1]);
 }
 
+FIXTURE(zero_len_run)
+{
+	int fd, cfd;
+	bool notls;
+};
+
+/* Before each of two reads, send n[i] empty records followed by a data
+ * record if data[i] is set. ret[i] is the result of the read.
+ */
+FIXTURE_VARIANT(zero_len_run)
+{
+	unsigned int n[2];
+	bool data[2];
+	int ret[2];
+};
+
+FIXTURE_VARIANT_ADD(zero_len_run, 128)
+{
+	.n = { 128, 0, },
+	.data = { true, false, },
+	.ret = { 4, -EAGAIN, },
+};
+
+/* More than 128 consecutive empty records break the connection */
+FIXTURE_VARIANT_ADD(zero_len_run, 129)
+{
+	.n = { 129, 0, },
+	.data = { true, false, },
+	.ret = { -EBADMSG, -EAGAIN, },
+};
+
+/* The count starts over on every read */
+FIXTURE_VARIANT_ADD(zero_len_run, 128_128)
+{
+	.n = { 128, 128, },
+	.data = { false, true, },
+	.ret = { -EAGAIN, 4, },
+};
+
+FIXTURE_SETUP(zero_len_run)
+{
+	struct tls_crypto_info_keys tls13;
+	int ret;
+
+	tls_crypto_info_init(TLS_1_3_VERSION, TLS_CIPHER_AES_GCM_128,
+			     &tls13, 0);
+
+	ulp_sock_pair(_metadata, &self->fd, &self->cfd, &self->notls);
+	if (self->notls)
+		return;
+
+	ret = setsockopt(self->fd, SOL_TLS, TLS_TX, &tls13, tls13.len);
+	ASSERT_EQ(ret, 0);
+	ret = setsockopt(self->cfd, SOL_TLS, TLS_RX, &tls13, tls13.len);
+	ASSERT_EQ(ret, 0);
+}
+
+FIXTURE_TEARDOWN(zero_len_run)
+{
+	close(self->fd);
+	close(self->cfd);
+}
+
+static void zero_len_run_send(struct __test_metadata *_metadata, int fd,
+			      const FIXTURE_VARIANT(zero_len_run) *variant,
+			      int i)
+{
+	/* kTLS cannot send an empty record. Send the data content type as
+	 * the only byte of a record of type 0 instead, the receiver strips
+	 * the 0 as padding and sees an empty data record.
+	 */
+	char data_type = 0x17;
+	unsigned int j;
+
+	for (j = 0; j < variant->n[i]; j++)
+		ASSERT_EQ(tls_send_cmsg(fd, 0, &data_type, 1, 0), 1);
+	if (variant->data[i])
+		ASSERT_EQ(send(fd, "data", 4, 0), 4);
+}
+
+static void zero_len_run_expect(struct __test_metadata *_metadata,
+				ssize_t ret, int expected)
+{
+	EXPECT_EQ(ret, expected >= 0 ? expected : -1);
+	if (expected < 0)
+		EXPECT_EQ(errno, -expected);
+}
+
+TEST_F(zero_len_run, recv)
+{
+	char buf[16];
+	int i;
+
+	if (self->notls)
+		SKIP(return, "no TLS support");
+
+	for (i = 0; i < 2; i++) {
+		zero_len_run_send(_metadata, self->fd, variant, i);
+		zero_len_run_expect(_metadata,
+				    recv(self->cfd, buf, sizeof(buf),
+					 MSG_DONTWAIT),
+				    variant->ret[i]);
+	}
+}
+
+TEST_F(zero_len_run, splice)
+{
+	int i, p[2];
+
+	if (self->notls)
+		SKIP(return, "no TLS support");
+
+	ASSERT_GE(pipe(p), 0);
+	for (i = 0; i < 2; i++) {
+		zero_len_run_send(_metadata, self->fd, variant, i);
+		zero_len_run_expect(_metadata,
+				    splice(self->cfd, NULL, p[1], NULL, 16,
+					   SPLICE_F_NONBLOCK),
+				    variant->ret[i]);
+	}
+	close(p[0]);
+	close(p[1]);
+}
+
 FIXTURE(tls_err)
 {
 	int fd, cfd;
-- 
2.56.0

