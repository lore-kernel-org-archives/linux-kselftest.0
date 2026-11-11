Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794362369;
	b=wGQJSCJsaQ7Qd3A+hLzNVns6SV3jF284qQRYprH+4pVU+5cEJdhYK8+SB8FGKSld/5Ve
	 p7liZhb2dgSwfNxPo9lToq86TbsnuXGLvGg+9IdsrESFMKVHECsWEl75RbiyKZDXuFsh+
	 CdwPlvBtd2zXvN3hgGzAjptaG1ngC7RIaLuclFxUTsAcIi4AWy7F83HYlSDiR29h7nLud
	 mCj+YxRha6SSNelE2H0ZqkSz/UoTOVnaq6BT7hJZkuIeyQjN8a9LJQbrGswtyUwySuvAK
	 /lqVO8Nah8fJaF744VuXXTLaaYq4JSUihkK3VOR4EuJPG06ylLAirJYRsksCrVSKhrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794362369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2ke5kyJBmq0AFCcx3Fu7oLeZm6H/B0W+HhAkyx1DQsI=;
	b=e31CZOuc2VVw0n6f7gaS8ICeqApTFXM1KplEKGnQDrNmrbOoprJnn2dz7ktKhk3TY9bg
	 kv5vGCL5iWiL0gBamND3VOxEgy923Q3uE9MZNg3a2a8aXvIaSHdtijQ2SUd7opkWy4eTG
	 btIwvpPlDVY7e2tNRnpCkrJZb2lMNIFPgF788APGh95cbGEGVM159vbxdmSZqXEzr1RKC
	 XhlMVZml/lZM2Q85THO8d31MnSVXdXJRtDoldHIvpboiN0aE2NtKJ5XNLGcCQ75Dwonpz
	 P6U6AilHKyZlxe4rf7p75fE+ZUhEUhjC4HI4Vc79eoLKwpibTwrH3vD1dFP6uh1XAnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=S5gUk4di;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6559606A320
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 01:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6559606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=S5gUk4di
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b6f42095bcso3619996a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 17:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794362367; x=1794967167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ke5kyJBmq0AFCcx3Fu7oLeZm6H/B0W+HhAkyx1DQsI=;
        b=S5gUk4dimJhKaLynL3tjG1twjvBv2NBjeIh62CUJ0NqRTEyi+tsShsPrvV1cWhQd4y
         wgEM5GdyDHpe4DQ3ei6bfZRquKgULlS5MrKWXxNBbD1rPYLIz3DgkDg7hhNwHU0MIs1F
         MWcaD4YdkKLNipDvkPqD9ebyZOWngy1bQTZlttfDsjCB/3oz2bOMvGHrP73S+G9gfCsr
         SJhFCiLdBmgu1RoSbdao+CzdhvrIjIGIb6BMbKTxS7LCFFycAvFSLqTx2rmFSVSlHtU+
         +Pe6DcEHmClnNzPZWVFWkKTjs2PGPK9CGc7loRSucdDS//goGzoobiL5ipSYmBT2MEA8
         CsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794362367; x=1794967167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ke5kyJBmq0AFCcx3Fu7oLeZm6H/B0W+HhAkyx1DQsI=;
        b=Gukfut9ZPjSRU5muIdRdv52v6yJlA9lYe8zes4Lzv98UiahUAW1LLmT1+bKJdR9KGg
         YER5q4V8r8xxq31QOhbGEuODUR8v1wGF3EqjfzY3VE6KdZ0hdcXSQ9PzbOanQi2/3nRw
         1oqif5pYCi1nklvNpYzPZLB72G4cvx+iFhSJ6tfFzaA1MRkpUVOb1uij+uqX9nrl7Mb4
         ZJxxZzmJrRYA9fg/dUjnH9Hll9bkHrPR74NgNf3U+Hot3SfoFpuh+dyqKxtwR5r708BJ
         FxBUaHyhXWGUF3L1glOWji2o95lUDBbTX+3jO3M7Cj7WzFkkv5gSf2eXvIr2Y0gf72Ht
         2faA==
X-Forwarded-Encrypted: i=1; AL+hErFjxNT+RmnAzotnH0qv9TotkLJjRok1+EpcIYgCEs9Mv9jYr/qKIqaj7L+OL0BTeqL3myBimBQ8iBnvpzIsRWc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ytnv4+97q6wrRinJ3y0cU7eD7mjFT48EYB9ANeXXcLvJC4h/1
	b0J/GLVVjgk2T/8yrgYB4wTwbjQgI1vnZTbeR5OrZckU6LLDeHFyFDnLg75Hw4JGtsU=
X-Gm-Gg: AYBFou0YUhXrVQtHecflATSg8uln0hGgLRwaBxXZXncLlOMDxrgbprrRXAdZHomOLgr
	Ol16TttLNlJP7rU5SoCZLju4gs7NEP0ImtwZkCaSlw1vgCDSWPP6BOofQ/MRI5Va5ntz958nrF9
	DKFZ06WEk3e+MsMZ6KLtFEta71jCc+m3QP+g+gh/ebP9MfZcJa/jZIpG5TTRvo9wrWQDKHD5G6N
	Ku9TAHIYM4ptHm5I8qTEdxmPcT4ReE5NZdUQx26xEMrbwgtS9bYxXR+ZMtXrHs7czXTv8eBBEc1
	ljVLOmQuf87NpXpAcbHL7RQ51t6lWOZSa2sO6Xgkdn5OiVplNCqKz1tlfE0PocpUNVbxsERwmX6
	NT7gpGmbZlDYWdrG5HsvBPd/4tkmQXvqG2z+YlcLmQIK1kWt7VP6Diktx78Z/QTIueY3XWOqXsO
	OwqG8/pFooaXGYFCXSPN9139VnQnpji/bCNTfW8WIYWXfnR0P+ev2XxAM8J03qJ1zHwM/dtisVE
	Q87Y1ipgqm/zW/1259uU6+PZ02BbyMmHvaxTjZwaCa0lzBpN5fa7/wpmsrv3XyWQphGPaZTpsVX
	HprDqUQh1WfUcD5InuU80oBqjbQwbKRccopM9yGnPXRrPARsaw5oYlACmw==
X-Received: by 2002:a05:6402:4005:b0:6b7:8444:a456 with SMTP id 4fb4d7f45d1cf-6b78444a614mr130398a12.0.1794362367268;
        Tue, 10 Nov 2026 17:59:27 -0800 (PST)
Received: from L9JK9NPFH9 ([104.28.20.58])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7834cdc23sm147498a12.12.2026.11.10.17.59.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 17:59:25 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	toke@redhat.com,
	lorenzo@kernel.org,
	horms@kernel.org,
	bpf@vger.kernel.org,
	shuah@kernel.org,
	hawk@kernel.org,
	kernel-team@cloudflare.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	linux-kselftest@vger.kernel.org,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next v2 0/3] veth: link RX queues to their NAPI instances
Date: Wed, 11 Nov 2026 01:59:19 +0000
Message-ID: <20261111015922.67745-1-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
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

veth does not link its RX queues to their NAPI instances. queue-get
therefore reports no napi-id for them. napi-get lists the NAPI instances
of a veth, and their thread PIDs when NAPI is threaded. It does not show
which RX queue each instance polls. Userspace cannot tell which NAPI
thread to pin for a given queue, or which NAPI to change with napi-set.

There is also no way to busy poll an AF_XDP socket bound to a veth
queue. xsk_bind() takes the socket's NAPI ID from the RX queue, and a
veth RX queue has none.

Patch 1 is a cleanup to ease review of patch 2. veth_enable_xdp_range()
adds the NAPI instances only to pass their napi_id to
xdp_rxq_info_reg(), which no longer uses it. Patch 1 moves
netif_napi_add() into the loop that enables the NAPI instances. It also
removes the arguments and wrappers that came with adding the NAPI
instances in two places.

Patch 2 calls netif_queue_set_napi() in veth_napi_enable_range(), after
napi_enable(). In veth_napi_del_range(), it clears the link with NULL
before napi_disable().

Patch 3 adds RX queue NAPI link checks to veth.sh. The napi-id of every
RX queue must match a NAPI instance of the device. The queues must be
linked only while NAPI is enabled. The checks run with GRO on and with
XDP attached, and across RX channel changes and link down/up.

---
Changes in v2:
- Rebase on net-next. Patch 3 no longer applied after commit
  c1f04ea0aa0f ("selftests: net: check veth carrier after changing
  channel counts"). The conflict is in context only. No code change.
- v1: https://lore.kernel.org/all/20261105143356.17062-1-tianyi@cloudflare.com/

Tianyi Gao (3):
  veth: refactor NAPI enable paths
  veth: link RX queues to their NAPI instances
  selftests: net: veth: test RX queue NAPI links

 drivers/net/veth.c                  | 83 ++++++++---------------------
 tools/testing/selftests/net/veth.sh | 79 ++++++++++++++++++++++++++-
 2 files changed, 99 insertions(+), 63 deletions(-)


base-commit: 79ee9e6768721f337952e9b3edd14cedbbc03030
-- 
2.56.0

