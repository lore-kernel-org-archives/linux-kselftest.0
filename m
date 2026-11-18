Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010992;
	b=J/MPlXG9yF0OL+og/IoYHIKxs7oSWnzHzWKnOc4GwqyByv55fcQKQH2vT2WNq4v/j/wI
	 y3D3TrePSTXuvgA2oTQRWDKUmp5AZ7RDauRBe7F6HEsAvgg0fbrQ86cGpYwnxondANKvj
	 ZaHgTyQ27HqZOJRzw26Z+PcuMCCke8/VBsxIKAGSnN0THYk2wwU66ikvK1C2yqjQ53tRg
	 dpC2P0YDmwmFl1MYO2fS59Zksqn0zRxnPRy7yiguY/L8qG1D7WobOjUqUp+hX4Yh3fnoa
	 Dz9blLobrVcpRt+5VPXXrDzKtGLFZEHMZrzmBolYgQZ2f7ytvkXlEM1UEYqKoVkUW+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=XAheLrxIyzbdT9JPYIudMidPXsJvcTTt6MqGrybJiMo=;
	b=N4JwF/ORhSBB5sU8HXiF/E+Y8oKmnq8Ul9OrwM5N4uJYn6fGzqmZhtxy2qq8OoUNmm4m
	 lu0fQ1y07x5NDuVIQBfH03gcaEdnL9jYZvLBmnR1YOuEk0sOtKA3UtGHKlyr09AzofgRU
	 PcldzaoYou6TF29t0yHHlKYED4Vp6rJUS6YGixkRCgy/HTYCOAnIfV9woda1C0Pe2jXDa
	 gytfSc7rq1/onSgrd2rCfxV7PZ7GERvMCeK7P09HsOX+7S8jA6dPnV++xaNcFQzlHSBqd
	 NSWu9Ade9NUnurcyrmC0e0e5VSKz4RFYGQLtdRmH6QDHyBY3EGn6YH0Hw2OCn2zF/9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jT9z8ZUs;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B482060A2618
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 14:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B482060A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jT9z8ZUs
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-703be215729so488584eaf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 06:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795010989; x=1795615789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAheLrxIyzbdT9JPYIudMidPXsJvcTTt6MqGrybJiMo=;
        b=jT9z8ZUsVYiBGxipChoWzCY5tmzAdRWCz0HJ5IWSPRXPhff3OUE3AEatyqayMpOLJU
         RRiJkKJOdnxGRlt2G0k5oQTp71Amz2gjMnh4qxTstm/wN2zaUWOddOvNayM6Q+SNKJeE
         QrZvpM1lQcEICLhxAY3C70lWW3DrbLS7dlTRoVXop8L+2EG6M5rlvzqkxzTeDwa1BZNW
         FXIEkuIS8MiTISs0xlkpuM8zWg5Plh99tFe6dCX4Ie8fm0VKJuB5dg02y8xkNmUW4vC0
         nXOHPRSdHB1o4tRteJBiv2MyOQhKVrQog/0Fn3aWEQZ4V3mGXrvUSZQ1dZKzjIp9X9zK
         p5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010989; x=1795615789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XAheLrxIyzbdT9JPYIudMidPXsJvcTTt6MqGrybJiMo=;
        b=VaR391yW3z4f9f07mwOix34IN/6IeGHRb4gn2vuR0bSxZ4AivgMn4vXtPXx58ojkNE
         +XK7jV0RhecsyXk2VVz5YwAdQ3SGE4yD68d20ZAk+XPUtZu28Bp9OI9JBACTlz0QF4BL
         Rq2XY3QeOt3ivWUqhc7xP7h45T3Zjus7QobxXkIY98ohRun8E1SuH6D0PLgeI6GVPtC6
         rXu/a4Adg/Z1ojuJC7SW8KZwKc6Bqzds9di36IAlMrbZ0zDbBoCSoA04mxWE788SeMO5
         JT6HZg8WUSBuwBNz2YgZBGMPaqAfd1dfckMgkgQqQldNfqqKS/Zl4S0XMWS3x144y8es
         wqrA==
X-Forwarded-Encrypted: i=1; AL+hErHR0GwoLFGOmFRHziIaR8PV/wiqwvrbDSAS3boShmTGt7dGX8KCLXugMpbYpFvwO1nksEkU8/oTPmGxiXTq+NQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z87lQ8jD1ZO6i0AscafXuCygZXP9yXk8rLvxQdNSMg9PCSBPmYW
	3wGCPBnzFKvQ4smex38hcsnio99Ufxu+LcJmXAmVoFtPL1fCcYv9VgQF
X-Gm-Gg: AYBFou1grb+csHCbB6kQ1TEn7UUjnZcqBlfyQ/9blJwCDN9XpTFrxOTesxe3PSlX81q
	yfMkXy/7pnLPkCT7Z9SnyPnEF8J6JT2Cnxtn+V/xFtt3iD0ZpEt3NOHQWTUcXr6FmKgbjwy/gv0
	zDbQ4XgV86OIFQPghDzk6KnS/EBruqUSv50t8HWq40dz8ipc9aXuxvwkycTeq1jzh+UDIZEQnLH
	6OayTPplmshPBM6GRRbOVFWVvRgODWdE399ZGbnkGw4e4+KPVrsXyFNndutk6baGyVcQ9XBr+Me
	65FGL8/xwMpeNAkpgftWPsV49ELkJjOYcBmo2OHe1oPRdpfvheE4j3/DR4fucOdWcdjeBYEL3ly
	le38UJhZSiBZ4RDd/gw0ibYfNVc49uJ0MAzwtO7HshUnUo2w5sZBFEFJjhll9hJPyB4t4v+vsKe
	ztmjcU+Rto38XlEPnufm8urhRyAIizWeLLmcvx+C+VQd+7sipnSblSKZj1kIm838mjd0CZxjAvP
	leLdP48Kf5Ohsg/4Yi+ZpAhABvGB5mJbAD1PjQ33DKBtuuHI/H52P3NmXaH3bUWaTQ2O6tfB9Ju
	fQcGAZZjQo5UF01bnGrkxo0Sdw==
X-Received: by 2002:a05:6820:55d6:20b0:6cd:3ffc:64cd with SMTP id 006d021491bc7-71b18600d04mr1037879eaf.72.1795010989519;
        Wed, 18 Nov 2026 06:09:49 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:1::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b744126dfdsm2294761fac.10.2026.11.18.06.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:09:49 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Wed, 18 Nov 2026 06:08:07 -0800
Subject: [PATCH net-next v5 5/6] selftests: drv-net: psp: factor out psp
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
Message-Id: <20261118-psp-v5-5-b9ec840e0296@gmail.com>
References: <20261118-psp-v5-0-b9ec840e0296@gmail.com>
In-Reply-To: <20261118-psp-v5-0-b9ec840e0296@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: Daniel Zahka <daniel.zahka@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Willem de Bruijn <willemb@google.com>
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
index 7c8fb2200b39..a6b46acf6bf8 100755
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

