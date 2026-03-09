Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F8B274B39
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 05:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773035694; cv=none; b=q8bHSoExjtfaR6uhzmqCHzCYF+YFO2IgGKXZ8lZScHeS0YxqH6oHOq3k6yBNCzfPKJ8QFvzPvj07bopsAvuFBSyRue5l3ISGmj+mBjhZgHUk8bttgOOoChsQdnORSU9HMEgskRzQ8p/rU5rrpNgeX5/dEIQSBoXjuNYT/+c77zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773035694; c=relaxed/simple;
	bh=XCl+gIHDKVKF3BHAFazsPTr3zJzg68KTuSoHcRwyrs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JGX++W5DnZs7qvomxV4CZm3fr+lBezYKKsKEqkw1uOIJZ5vobspUS/ePJFyF2tQjbf6shMZ/eWgxFPadmGcfq/Nk32qrXfwpph/Has/Xz2zDGPGtmxRD9nMkrB6/fxFHPUUNw7DpYmLrlpKBL35EZGuqk4WAv3Gh6LRehSjmBmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npuQ0r9Z; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npuQ0r9Z"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c7393c6832bso1282899a12.2
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Mar 2026 22:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773035692; x=1773640492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32NNtnzDRxNT0zlaCXiiZQWhn0QJ3pzIuoI+2GweKqc=;
        b=npuQ0r9Z0ZQPOcBIPtFip/X+1du3ag+nP2jFJjm5c66ui8rviukW/tQ7rSgYDVRK4x
         BO/iSQbKDICI8WgjqBQLvCaukjC0IehGoMCnt1dPVsuzh5vTHXAEAePa9N1Vx9HJLC54
         cBogATwH5/mwLWKFk7XxFFZa9gzj9iN+ZR8OttfaseIkDnSLvCBN1L1jQginitnTRdYW
         hQilOGIMTEDrqd7R9oEOdOrzzN03f4jRjXJtpU9sWvKKKCdaqgZQonbwglg9XiIv/0bA
         7HAJXpJLAOCI4cQOBez9lnRhyjl5D2qsiKRBDEpiXZ8Po+yoiA5WOy43xHy/lVdT4pww
         aO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773035692; x=1773640492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=32NNtnzDRxNT0zlaCXiiZQWhn0QJ3pzIuoI+2GweKqc=;
        b=WEngt61TD/R0OBUcdeaW3U4Y+3pDg4QJPzMasj4G4Yjcr3k9CYZMpEq/jxa3J/+POf
         xS/Dn6OGAgCJDtMdHqmwMdF74ANxqKtwCx8SwsEqOq7L/dfutwH7AZJV/hziVFMoQhI9
         qrNX/ycDUiEJ/6tKIYkxzIydqq+zhEt4ygMrqLP/ilKio4iJUbjmAkFzVeVFgnKEEIVD
         xCdhNqwlIiv9kWwQMDY4pwTxDaww3jnsjUcUTozUcIlbtR93rLDrw7jISDGPps6q2vYJ
         uIztwTLSyckErve44V+NvwowLmOoe3941o72dwJtoKVYojmXYdXQ2BIK7eEV6PeWqhQs
         thcw==
X-Forwarded-Encrypted: i=1; AJvYcCWtnVjXUghBiD7CDoXtXwOFVdyL8dapSMwZ2ge9deAWufMgpJJSbwSJd2olZKIW6leevXBMHoeDp7oRwT7OaJU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzISLDIcpl5DEkzxFQbCWoPu/bg4YETPOQK99qeF0oce0skOnW5
	5njN8O/ZWyCFCiiIrCxA++frmNoei1ZAdIVlXGJDKh2ilqkDPg88r93f
X-Gm-Gg: ATEYQzz1LtOLQ7otCbu7MItRZWC1Q+V3cGhkbxq3kIbmIOPajzNglBzf9kiAd7M4cJ/
	v+tZhUMP9DAA7bWzXoy6DBdxHP8dAV9ch9SEWBJgnoLguTLxx3033iWaXoaOM4Zth3TEqrW1/Uf
	Vive1f/1D74+IOn2uCwkCm+22BWQyWQyPVNchYh3GgU5u2L629RZDsrROxmShP7tYJa/IAhkJzn
	3JC3OutFhZ7iJGslH5tX/4gZdRk/J/DXjNr1PDsh1Cx7l/p5PZhWI1l/fjz3gVJ2HGjW8Gvp70x
	wJP469hv9tQ59KDb2r1W3rPH+nmnpw8tRTjXc0xwiEPLT2TfX9jklSs6mYWKFrCqtF/hxOBQ2CK
	S42z0cpqpSi5V11kO2lgzBbYLwuadJ7rkLrMxmJ1WIWFvLFLfSaHHKkirHT6oydIFtJJL9T9Nta
	g29M1N4lo/SSODQzxWnbhKvo6qzG9f7qEV1ZzsExqqrB04O1OJqFgsclCIaaSC
X-Received: by 2002:a05:6a20:1449:b0:35b:b508:b99f with SMTP id adf61e73a8af0-39858fb2c45mr8981210637.1.1773035692584;
        Sun, 08 Mar 2026 22:54:52 -0700 (PDT)
Received: from zenbook ([159.196.5.243])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e170923sm7933716a12.17.2026.03.08.22.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 22:54:52 -0700 (PDT)
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
To: John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Damien Le'Moal <dlemoal@kernel.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [RFC net-next 3/3] selftest: tls: add tls record zero pad test
Date: Mon,  9 Mar 2026 15:48:38 +1000
Message-ID: <20260309054837.2299732-5-wilfred.opensource@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309054837.2299732-2-wilfred.opensource@gmail.com>
References: <20260309054837.2299732-2-wilfred.opensource@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Enable record zero padding using the TLS_TX_RANDOM_PAD socket option for
a TLS1.3 connection. This only tests the setsockopt()/getsockopt()
invocations as padding is processed in the kernel.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 tools/testing/selftests/net/tls.c | 45 +++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index 9e2ccea13d70..a72ba8607ead 100644
--- a/tools/testing/selftests/net/tls.c
+++ b/tools/testing/selftests/net/tls.c
@@ -2997,6 +2997,51 @@ TEST(tls_12_tx_max_payload_len_open_rec)
 	close(fd);
 }
 
+TEST(tls_13_tx_record_zero_padding)
+{
+	struct tls_crypto_info_keys tls13;
+	char const *tx = "how much wood could a woodchuck chuck";
+	int tx_len = strlen(tx) + 1;
+	__u8 rx[4096];
+	__u16 opt, zpad = 2048;
+	unsigned int optlen = sizeof(opt);
+	bool notls;
+	int ret, tx_fd, rx_fd;
+
+	tls_crypto_info_init(TLS_1_3_VERSION, TLS_CIPHER_AES_GCM_128,
+			     &tls13, 1);
+
+	ulp_sock_pair(_metadata, &rx_fd, &tx_fd, &notls);
+	if (notls)
+		exit(KSFT_SKIP);
+
+	/* Setup Keys */
+	ret = setsockopt(tx_fd, SOL_TLS, TLS_TX, &tls13, tls13.len);
+	ASSERT_EQ(ret, 0);
+
+	ret = setsockopt(rx_fd, SOL_TLS, TLS_RX, &tls13, tls13.len);
+	ASSERT_EQ(ret, 0);
+
+	ret = setsockopt(tx_fd, SOL_TLS, TLS_TX_RANDOM_PAD, &zpad,
+			 sizeof(zpad));
+	ASSERT_EQ(ret, 0);
+
+	ret = getsockopt(tx_fd, SOL_TLS, TLS_TX_RANDOM_PAD, &opt, &optlen);
+	EXPECT_EQ(ret, 0);
+	EXPECT_EQ(zpad, opt);
+	EXPECT_EQ(optlen, sizeof(zpad));
+
+	ASSERT_EQ(send(tx_fd, tx, tx_len, MSG_EOR), tx_len);
+	close(tx_fd);
+
+	ret = recv(rx_fd, rx, sizeof(rx), 0);
+	ASSERT_GE(ret, 0);
+	ASSERT_LE(tx_len, ret);
+	EXPECT_EQ(memcmp(rx, tx, tx_len), 0);
+
+	close(rx_fd);
+}
+
 TEST(non_established) {
 	struct tls12_crypto_info_aes_gcm_256 tls12;
 	struct sockaddr_in addr;
-- 
2.53.0

