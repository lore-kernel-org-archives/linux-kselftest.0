Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830707;
	b=H9MKqzEzGKAovsKFzllKrZyIWE3BhlMGFUEVbd0qzyt8qDnkWNJZER6GouW3QJcmV04N
	 lgY2+C6Y2N0NdybKyVw2Dqh3KaWlRdFyZ09xFSmLpAXgA66+7yo+J4lIZRciQkazknA3C
	 icIZDQQh4ZZCTH9rmlKOoWZBvw1axJ5YWMc7IWV/u/5+BUpAJW5PC0w/vhhg5K75sBdRY
	 K9lYTvf8kyuVRVotXZtsIjoXqVLV5Xt699A6YnEPE5dTwYV9e2X0XrzQmaBAR2QkJo2rS
	 EyBdNjJXqXlh6R8bl4JOf5vHNy5MOWzmDXbM+SmMn8OD9XSBaQeVSP0tKgcGPf6Ie9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=rpNZEkssaLAsymmxs92N94pcsrg9VZFrpliq2QFm7YY=;
	b=tltk/dR5qoUCDe9xQR5XPuiTPlyZ+yNLYBjCjpZhYpOsOZihKu0Si486S/INHEMkDP/7
	 zfTt0J7POZ1lxtJwxzxoQy0GTfcB9NNQgpB42hbb9XyLCHLjP1IXn3LvLnFn8IDBGvzF5
	 IxcuT4DUTxF/EJota6GuOCf+XD9B1o/fRtPOGrJbwZwm1abqrWMn6i49zb/Ar7NgHvAEi
	 Y621g5oAdqGoy1lBrN9rYuOO1EUHzgin0qiEWdB9LGyuEZxWKTSQCv39wPx1n4OJZwEPC
	 cjgr7PXarnoAvSW8pBXVZa9kPITY1gcGp45k0JwHHBJpBo789vlvFTrNzDj99lf7oFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dRsKrGJZ;
	arc=none smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B551606A8A6
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 12:05:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B551606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dRsKrGJZ
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-675617e81f9so3332822d50.3
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 04:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794830706; x=1795435506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rpNZEkssaLAsymmxs92N94pcsrg9VZFrpliq2QFm7YY=;
        b=dRsKrGJZidblvqRbsCPv0AiSCkg+DQGrLRK93lDiQLSocgZ8vO2vJQiIgxEYHqjP4z
         xKTP5ooseru/ohMBHUHI8rFaiHdKYLBXELVQ5ejvhOQUyyasItWeJb44JVXxkZZTomzW
         3EeMoqzEgw5PZuQZapMb8GY/qpGcYC9J3scDq8ziS2WnnlwkmVSPu+MpuHBDX3RsDgCc
         2GmDPZk/siFDIEpnbQO4XaXYysI0gov1i2xeb9hDFds7lnegBm5nQqbIsyBrmYZRHBuD
         MuMTOUF/Zhvjg6t9WFcaPHfGrJbev8r4LrFZwHLqIEoRmJ2C+XTzvQ7dASmavBMyGryY
         rf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830706; x=1795435506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rpNZEkssaLAsymmxs92N94pcsrg9VZFrpliq2QFm7YY=;
        b=a2Zlahe+q2mRD0xM6fQx5DIH3X94Vj2myOQK74BIuGL/cLGLWU+EFJJmC0NMBOLhyt
         a05wB4WnI/w8FllJ0gk6lhADL1xmFTeICu44mxYek2OBx6CU88zCqFhKnhs0JGkKW/+2
         rk3Gq7W3e5pMCEDRBMGd/jX7O7ufFx2XOYkFfwqjxCwlf0yp/FLatsgXdd8siXZDf9UB
         g+fqlZ0WmJe4Iet9Xd2ky6m3x/LPs4uPDBkEVxpO7I7NVZkF4sbIqkaTYe+HbAZDB7Jl
         huiBkRjJzkmkUcnN9XRqfcAzosdWijwXtosF7FPQFLFDEwG6BSwltLLjvFwybLFa+LR1
         M3tQ==
X-Forwarded-Encrypted: i=1; AL+hErH4mYnhpXn14w8J3hv7NtlqVeijOa4ZW4juyR9mOJ//IfJ6MG8qIeF4eGlFKCCp+AyVgUGX1gebSNz/zSSSNYE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+mgJ2Cx0Ac6eSQulJuyrqm1JASk/skY87uQfwTUUPswIiLrwr
	MruKvmLO405Mqtz3m+LB7QRy2x3QdfMCC4XGgnzCIgb/pcANxnaFYnFxg0QArYU3
X-Gm-Gg: AZFdTZdIFsj9bvY8MNqRuD7JVsjmc8TpKgTtRqpXo7loK65jz8PuuwbW5ayWujkq2EY
	L4dxkOsZ7WobHedci+TarEEVVyI68qErNCG3nmprrodl5gO1IYiCHrgcv3JLT540PyO8XENEbq6
	xWCh8S/EhbmBiEUQ/KY0Q/r52rZs9fKkITbmh1DXcTk858u+gFM81+IwecMWxejpy3WkMpqvmuh
	jo2qsocPLuuArMNIJH+PCoN6YhmD18eOyjcEyGWMviDlUdPUf0ZjYefcEYGC1E8Sn6rcILb+Iav
	PUHCozTWOpAbIZhAXs22ZE5r9neQTXZEduCb2EkNPY+QaMSAD7vfRyqTXb7JWWGBWDG7QyqzyPP
	wKlhfJIZYYuvOaWrdUbRX/rKcuRn2sDjZf4R6HsZuM48yS40dSEfflJudOTkRJi5FepIcPF1Pof
	ugKihREbOk8LSUcuLOOupIfar8AMF16mthD0gSOVhjrKSjh6+xqrxfyrNUZOxf57PIKpneDd1/l
	msfp2XN0LoCkM9l4RcguWyWOJAJv+iItG+jE+ShZvEMAe9wOcqBJ7C4IkeEhmX8AQ2Kqep/68QU
	ouLGr2eZPNzR4XXnElshnt+c7A==
X-Received: by 2002:a05:690e:1287:b0:67d:a096:d8b7 with SMTP id 956f58d0204a3-67da096daffmr3722819d50.3.1794830706323;
        Mon, 16 Nov 2026 04:05:06 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:5::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a6210ffsm9648073d50.20.2026.11.16.04.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:05:04 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Mon, 16 Nov 2026 04:04:39 -0800
Subject: [PATCH net-next v4 4/5] selftests: drv-net: psp: factor out psp
 connection setup
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
Message-Id: <20261116-psp-v4-4-1a599df2aefa@gmail.com>
References: <20261116-psp-v4-0-1a599df2aefa@gmail.com>
In-Reply-To: <20261116-psp-v4-0-1a599df2aefa@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Willem de Bruijn <willemb@google.com>
X-Mailer: b4 0.13.0

Lift out connection setup and PSP assoc uapi code in psp.py and
responder, so that the key exchange sequence can be used in other test
cases that start with a key exchange, but might choose to perform
additional tx/rx assoc calls afterwards.

Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
v4:
- drop closing the data socket on conn_setup_psp() failure; preexisting
  and not needed by the series

v3:
- take key lengths from the kernel's rx-assoc reply instead of a
  per-version table
- close the data socket in psp_responder if conn_setup_psp() fails
---
 tools/testing/selftests/drivers/net/psp.py         | 14 ++++-
 .../testing/selftests/drivers/net/psp_responder.c  | 73 ++++++++++++++--------
 2 files changed, 59 insertions(+), 28 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
index c114d2245135..ce0ab6666603 100755
--- a/tools/testing/selftests/drivers/net/psp.py
+++ b/tools/testing/selftests/drivers/net/psp.py
@@ -467,10 +467,11 @@ def assoc_twice(cfg):
             ksft_eq(len(tx), 0)
 
 
-def _data_basic_send(cfg, version, ipver):
-    """ Test basic data send """
-    _init_psp_dev(cfg)
+def _establish_psp_conn(cfg, version, ipver=None):
+    """Establish a PSP connection and return after key exchange
 
+    Requires _init_psp_dev() to have been called first.
+    """
     # Version 0 is required by spec, don't let it skip
     if version:
         name = cfg.pspnl.consts["version"].entries_by_val[version].name
@@ -495,7 +496,14 @@ def _data_basic_send(cfg, version, ipver):
                         "version": version,
                         "tx-key": tx,
                         "sock-fd": s.fileno()})
+    return s
+
+
+def _data_basic_send(cfg, version, ipver):
+    """ Test basic data send """
+    _init_psp_dev(cfg)
 
+    s = _establish_psp_conn(cfg, version, ipver)
     data_len = _send_careful(cfg, s, 100)
     _check_data_rx(cfg, data_len)
     _req_echo(cfg, s)
diff --git a/tools/testing/selftests/drivers/net/psp_responder.c b/tools/testing/selftests/drivers/net/psp_responder.c
index a26e7628bbb1..411a23be78d5 100644
--- a/tools/testing/selftests/drivers/net/psp_responder.c
+++ b/tools/testing/selftests/drivers/net/psp_responder.c
@@ -37,20 +37,15 @@ static struct {
 	unsigned char rx;
 } psp_vers;
 
-static int conn_setup_psp(struct ynl_sock *ys, struct opts *opts, int data_sock)
+#define PSP_MAX_KEY_LEN		32
+
+static int
+rx_assoc(struct ynl_sock *ys, __u32 *spi, char *key, unsigned int *key_len,
+	 int data_sock)
 {
 	struct psp_rx_assoc_rsp *rsp;
 	struct psp_rx_assoc_req *req;
-	struct psp_tx_assoc_rsp *tsp;
-	struct psp_tx_assoc_req *teq;
-	char info[300];
-	int key_len;
-	ssize_t sz;
-	__u32 spi;
 
-	dbg("create PSP connection\n");
-
-	// Rx assoc alloc
 	req = psp_rx_assoc_req_alloc();
 
 	psp_rx_assoc_req_set_sock_fd(req, data_sock);
@@ -64,29 +59,28 @@ static int conn_setup_psp(struct ynl_sock *ys, struct opts *opts, int data_sock)
 		return -1;
 	}
 
-	// SPI exchange
-	key_len = rsp->rx_key._len.key;
-	memcpy(info, &rsp->rx_key.spi, sizeof(spi));
-	memcpy(&info[sizeof(spi)], rsp->rx_key.key, key_len);
-	sz = sizeof(spi) + key_len;
+	*key_len = rsp->rx_key._len.key;
+	memcpy(spi, &rsp->rx_key.spi, sizeof(*spi));
+	memcpy(key, rsp->rx_key.key, *key_len);
 
-	send(data_sock, info, sz, MSG_WAITALL);
 	psp_rx_assoc_rsp_free(rsp);
 
-	sz = recv(data_sock, info, sz, MSG_WAITALL);
-	if (sz < 0) {
-		perror("ERROR: failed to read PSP key from sock");
-		return -1;
-	}
-	memcpy(&spi, info, sizeof(spi));
+	return 0;
+}
+
+static int
+tx_assoc(struct ynl_sock *ys, __u8 version, __u32 spi, char *key,
+	 unsigned int key_len, int data_sock)
+{
+	struct psp_tx_assoc_rsp *tsp;
+	struct psp_tx_assoc_req *teq;
 
-	// Setup Tx assoc
 	teq = psp_tx_assoc_req_alloc();
 
 	psp_tx_assoc_req_set_sock_fd(teq, data_sock);
-	psp_tx_assoc_req_set_version(teq, psp_vers.tx);
+	psp_tx_assoc_req_set_version(teq, version);
 	psp_tx_assoc_req_set_tx_key_spi(teq, spi);
-	psp_tx_assoc_req_set_tx_key_key(teq, &info[sizeof(spi)], key_len);
+	psp_tx_assoc_req_set_tx_key_key(teq, key, key_len);
 
 	tsp = psp_tx_assoc(ys, teq);
 	psp_tx_assoc_req_free(teq);
@@ -99,6 +93,35 @@ static int conn_setup_psp(struct ynl_sock *ys, struct opts *opts, int data_sock)
 	return 0;
 }
 
+static int conn_setup_psp(struct ynl_sock *ys, struct opts *opts, int data_sock)
+{
+	char info[sizeof(__u32) + PSP_MAX_KEY_LEN];
+	unsigned int key_len;
+	ssize_t sz;
+	__u32 spi;
+
+	dbg("create PSP connection\n");
+
+	if (rx_assoc(ys, &spi, &info[sizeof(spi)], &key_len, data_sock))
+		return -1;
+
+	// SPI exchange
+	memcpy(info, &spi, sizeof(spi));
+	sz = sizeof(spi) + key_len;
+
+	send(data_sock, info, sz, MSG_WAITALL);
+
+	sz = recv(data_sock, info, sz, MSG_WAITALL);
+	if (sz < 0) {
+		perror("ERROR: failed to read PSP key from sock");
+		return -1;
+	}
+	memcpy(&spi, info, sizeof(spi));
+
+	return tx_assoc(ys, psp_vers.tx, spi, &info[sizeof(spi)], key_len,
+			data_sock);
+}
+
 static void send_ack(int sock)
 {
 	send(sock, "ack", 4, MSG_WAITALL);

-- 
2.52.1

