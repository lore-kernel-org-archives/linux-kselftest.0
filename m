Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793995955;
	b=mJxtRDTnNSqcC/TnjNhc9a6YhuboUmU6vq8LBHLoIXqtP7yjZYgvZofwarwI2zMdthQI
	 3jlJ9B+9zWiB0mSj24CLAJDRDBT26W5bXLNpA6HCXBzTnt9INldlS1DvfaPLYqP7SE1E0
	 TiZGnc1XhPKCZC24AGBN6wDSjLB1dwVw4CDkE/vgljMQ15JscvsvRyjYVyyfxUPn9+rMJ
	 TzN2tXOse7P5vY/cQ6nCYnqfhixFLmcDyDyhQC3bZY4XrPpeBkT4W5zw8p1e7oavGLEEm
	 7i8pf8/KYCuSzUyB1kCg/JOltBXLxUFYP09cBpn0sbMe8cDGHJwXKpJwe+vExyzFv1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793995955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ew7E1f5KeCzBIQRa8bgmL8F5+wG2gJUY5b9RGgICLtE=;
	b=VA321PWwIpPJXQhs1aQRb93wt5OVviz6SNUZRyrNbki1MLpPKK7HRjFtoAGRZn7MEeHH
	 IyNQ0wamELIISWa+R8zhgZyK/1J3zzcCrJj9nclPqSBAmqDRYIKwtbmW4EZFqJmKArVne
	 Y3PT+Rook0nN+oTWjd+q1+qYjhb6srPhxC1KK2kFUP1uUF8oVqRK5vapY4JeH5KV7kNmM
	 48ngL5eVQYroFHTH0bmjUJIYoZlMlUaz9CZxq6dQwBrgS9YuEc7EcqekpSkQnUeUVoGN0
	 uxDhRbyvWe07nIjE4K3IHs3Ie+DhMhlYg9OUwYukAjy8X+mz657FfsgDXDBHh4DjC9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yFyqFmbS;
	arc=none smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5421E606A33E
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 20:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5421E606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yFyqFmbS
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6774639a8a4so976125d50.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 12:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793995954; x=1794600754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ew7E1f5KeCzBIQRa8bgmL8F5+wG2gJUY5b9RGgICLtE=;
        b=yFyqFmbSPRDyOjlucTFvD3ofba1IvyWA5YmoIUekjlPTb/5GGl8xvZ1VjuQr14GTRa
         qBUiiSAYL7X7wWIEQSg1iR8foFnRdrf+ujPbUcLSh1nRt81DXcvzC74V9DQFqqtz84mn
         3rVjC70F1cK4RJ4cMtw76bDMpfhViJyRB1tti+Y6QsImD0OHMjMgluujo8W5yOAOYk7P
         Qu+pw3S8ZwzsTGHgn54UtC0A/5QTlltGtI0yVk2pgdzJzfonCQMjvZpkdSfRL4etGPdX
         cqkQ1Oh9OQnXgoxwxIMfeIm/Ci9gWKeRd5Xtah8RhX1c+oAznr0d6jxcjwU7qNadK0Hs
         I2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793995954; x=1794600754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ew7E1f5KeCzBIQRa8bgmL8F5+wG2gJUY5b9RGgICLtE=;
        b=Gy8yuIK2UInkFNMLFFuWq/ojvUlZq1HN4Lmgfra3mbohpgZkAqD1kimHBpcQ9UZyGz
         yEmvrb9dtrsNUDQ4EbUGNz8B06pTpv18WGMH8LQ9Vf2e0plO4WHrQ/1xSwJOPZFS473u
         tn2YfY3zGxKXsV4NKOkpv18t7Z/a0Euh/R2tx49f0RjO0SNi1wanOg40J6K5UAUruY6B
         a0q81WNjh/kJtdBKGmq5E1U0udsRTp31D1X4IkdN3MBAt4KgEaYdMDscE3+hOmMdIhzZ
         H9G2GovsCsrPJgnPAiqaHYw4pWoX4NfpZSPHNG+OLVBpe4Crf0yFJWw4I8IZd5Jlwd8N
         FtQA==
X-Forwarded-Encrypted: i=1; AL+hErEjjQZqN23BZxH/v9tFrFCipBWvn6SW+0OopMey6s5eDh6ekfqMcCPrDCBueLZAqi6chx6VouoLthGSzf9mEIA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KZenDuVKh3rr74smdNooE7ngL5d3sVvygzJ1+kGFPtnk0+GXj
	/EWu24DoWYzuEVcaHZFn9tbhiJ9h2sokoZXSJkBw7AVvBsbea6iDA3+P
X-Gm-Gg: AYBFou16cVo6SqsalG7HnJFXqKTE29+jGjGRPDmeME8y3EF0Iv5aosKL9WiweYyBcaS
	NniBwk/XoCTSe7TpqxSDWg2F79NuFuKl81lvrzPkgOpclf8DOZ4Kmc8SzvleBFlQ6amPQaLha+u
	VxQDY6Oy/lndtgMndzYzJ5PdQ49lgpbBAvQzgDRxqw1DdJ8cW65Y4v4w3D0oDxCqzAbvaDnS4bf
	/gS/jtghny+JDZPAjZ/N6Sq8KreKE08Ei2TxNdOIUoxe56m5LVsxIGyXmBUmo66pKZtX+6TfZ3f
	OK55Pj2H5iy6CmQFceWLqgLeXbcESIdFiz+4QXBeKwX4z39r8Dl97ykK/7+df+P6wVllvn0gq+R
	As3/jYsDGLYATrkkKxiZK6pcrKGETZe9EzL1ScVZzljIZ9yleWfKhvPNt5PJOMeu3YD81Lg/W3B
	ZoXos1oCEfb3nEa+++fxuOMQq97Lo61/rUuigqAlAqHnKvMvEzGZtp/buzoYmwdaf8Cp7urTfZ5
	K88emThjoGRens9H8xQCw1WXRxQTF/p0KjnJT8diQEtO0JcOp7gvF5KiEloN6gTk19gjQqG9haa
	s3DJAeIONDoOVhFD8RfqYjO8CJEhrgiFqMRX2BmkVX1y
X-Received: by 2002:a05:690e:788:b0:679:bb48:692b with SMTP id 956f58d0204a3-67c1455b60dmr1240896d50.59.1793995954318;
        Fri, 06 Nov 2026 12:12:34 -0800 (PST)
Received: from localhost ([2a03:2880:30ff::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c13635f25sm2601355d50.23.2026.11.06.12.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:12:33 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Fri, 06 Nov 2026 12:12:12 -0800
Subject: [PATCH net-next v3 4/5] selftests: drv-net: psp: factor out psp
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
Message-Id: <20261106-psp-v3-4-a8dd38f5a727@gmail.com>
References: <20261106-psp-v3-0-a8dd38f5a727@gmail.com>
In-Reply-To: <20261106-psp-v3-0-a8dd38f5a727@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.13.0

Lift out connection setup and PSP assoc uapi code in psp.py and
responder, so that the key exchange sequence can be used in other test
cases that start with a key exchange, but might choose to perform
additional tx/rx assoc calls afterwards.

The caller of conn_setup_psp() not handling errors was preexisting. Here
we are adding some more error paths, so we just handle errors by closing
the data sock to make the code a bit more robust.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
v3:
- take key lengths from the kernel's rx-assoc reply instead of a
  per-version table
- close the data socket in psp_responder if conn_setup_psp() fails
---
 tools/testing/selftests/drivers/net/psp.py         | 14 +++-
 .../testing/selftests/drivers/net/psp_responder.c  | 78 ++++++++++++++--------
 2 files changed, 63 insertions(+), 29 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
index 473500901879..71eeade62ad2 100755
--- a/tools/testing/selftests/drivers/net/psp.py
+++ b/tools/testing/selftests/drivers/net/psp.py
@@ -447,10 +447,11 @@ def assoc_twice(cfg):
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
@@ -475,7 +476,14 @@ def _data_basic_send(cfg, version, ipver):
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
     _close_psp_conn(cfg, s)
diff --git a/tools/testing/selftests/drivers/net/psp_responder.c b/tools/testing/selftests/drivers/net/psp_responder.c
index a26e7628bbb1..14b179e1aec8 100644
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
@@ -282,7 +305,10 @@ run_session(struct ynl_sock *ys, struct opts *opts,
 				/* nothing to do */
 			} else if (accept_cfg == ACCEPT_CFG_PSP) {
 				dbg("new data sock: psp\n");
-				conn_setup_psp(ys, opts, data_sock);
+				if (conn_setup_psp(ys, opts, data_sock)) {
+					close(data_sock);
+					data_sock = -1;
+				}
 			} else {
 				fprintf(stderr, "WARN: new data sock but no config\n");
 			}

-- 
2.52.0

