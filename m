Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794247120;
	b=uDBypFD/07LMykQTziVfcSZif/zgC8K2xc/UsuuMLJVdV8kY6/avLGklANPdPIhIxDH2
	 82HasoejLImGXG71qUQtWeZrCSNlHotMbOEeNKn//hi8OCRZWyof1HxZW5QW6uxgWvfna
	 CKPDbG+tAUwFypVqqv1XtCQ81XO+WnuIO1Cm54jp95z3YX02UJdne+RooKJh8Vt3wpSiP
	 QrMAwpbq1idVVvJYzY636hxCOYS1to90GXR8PdAVKt0mMMaMrpEKRFkXyoLY61bm0Hx/x
	 NTXfTCKcAKdtZv5V/Re7JXnWnVKHNDrKzdyDCcaV1EHVOkiI7vhmdtS1/I92NpuvOuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247120;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=qzh072tvnldhB2IgZiGvPOiwIHPitItrhGpaFYelnmE=;
	b=C67ZFrgIXdsGIKqu7EeVOhSD1tRF7eMb8JzfdJtzDlVSR1AAbu6aOg9j0nShkeRijttH
	 foHiyg6f8pWEso5r4SrymkTIt9NBS+JJl6/hOlS4gCfgKfcmN7QTN/MV3cVeqdn6RKXiU
	 nlwJLjteAyA8Ky4rNI5Wr5N3eD0rbfelwdb1u/52k9mNOhtx1Gst+lvwgjyILjnmm/MuS
	 FYUhhS9gv/xFE9IvILh1OxyXmU21yp/BOIHX3ovKZTnRNJBKOBvghkW8Nuu2HdEJn0a4W
	 tXWoOZUtKFIyFkZs5S9a66s0/kdROtRphhi4mQwxneJckIzMBO0B1goUQpUC7LrQ4lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cNvWJNhc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F24606A333;
	Mon,  9 Nov 2026 17:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cNvWJNhc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C11071F008A4;
	Mon,  9 Nov 2026 17:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794247120;
	bh=qzh072tvnldhB2IgZiGvPOiwIHPitItrhGpaFYelnmE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cNvWJNhcYi9Onm5y8b4xPz7skd0DwWgOJOGI8bX3gYI3KIER01asDv97jfoPqI/63
	 MZNV6hcvshJSIvAAktHi51eAMZ4yj868BmYu3z28t/upKMjuQNs77K6C2FBZFAvAP7
	 COZCDD8lUTqLjMFzt/z2UhtlIQSyAg/7RlsoNWtGsaBN5AuJ4TMiGtJsChrPfMfvsE
	 /+RirxQJyrfoRePQzUaH5LwUVfU1QE1WeNDM6NTIS+Czr1hGrel8PI2jpAOD95QHNL
	 zf81b12Mx7DDBSKCuBiz7fpc8KJD9AqnpL5PpTnp8eFLJbFK+bQdcM41AcnyV/+pXc
	 PwEQUU4UrtnFQ==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	sd@queasysnail.net,
	shuah@kernel.org,
	cel@kernel.org,
	linux-kselftest@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net 3/5] selftests: tls: Skip the zero_len tests when TLS is unavailable
Date: Mon,  9 Nov 2026 09:58:34 -0800
Message-ID: <20261109175836.1246840-4-kuba@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109175836.1246840-1-kuba@kernel.org>
References: <20261109175836.1246840-1-kuba@kernel.org>
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

FIXTURE_SETUP(zero_len) returns early when ulp_sock_pair() reports
that the TCP_ULP setsockopt failed, so on a kernel built without
CONFIG_TLS the TLS_RX setsockopt never runs. TEST_F(zero_len, test)
then sends its raw records over a plain TCP socket, which returns
the ciphertext verbatim. All eight variants FAIL on a machine that
lacks TLS, and those failures mask any real regression in the same
run.

Skip the test when the fixture recorded notls, as the other
fixtures in this file do.

Fixes: a61a3e961baf ("selftests: tls: add tests for zero-length records")
Signed-off-by: Chuck Lever <cel@kernel.org>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 tools/testing/selftests/net/tls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index c4203401c4bf..ca47576220d3 100644
--- a/tools/testing/selftests/net/tls.c
+++ b/tools/testing/selftests/net/tls.c
@@ -2670,6 +2670,9 @@ TEST_F(zero_len, test)
 	int rec_off;
 	int i;
 
+	if (self->notls)
+		SKIP(return, "no TLS support");
+
 	for (i = 0; i < 4 && variant->recs[i]; i++)
 		EXPECT_EQ(send(self->fd, variant->recs[i]->cipher_data,
 			       variant->recs[i]->cipher_len, 0),
-- 
2.56.0

