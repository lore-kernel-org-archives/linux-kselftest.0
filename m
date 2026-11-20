Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795176984;
	b=l4sDTsnuVj/vlhydxah6cnuZAD35ND4h3xmgtde567qr3pIpcuMoWOVI/JqYsc5zgXMj
	 jt7VTok7k06dMxfsaMg2QBWAvSGaNULfBGTv8i+BYE3SA+0bex0P6Fk5vFAuLD4pCY8Yq
	 GPodwLsmYvzyWCEd1tANwT3bJWs+GVKboPsSCTZxRcZFoNZ2JdO+OIpkIaR/ZHRuA/2R+
	 Asefbp1J1Dm/qvSl8pY5bROgfIuE0MzT9D+tYKNdB9fBRJGcDdhn8MZifOUNltTS/gg+4
	 rebSU4UcRvjHChWmfvztspsPgyBtRS8asFMNaCRkGQBBQDhTZDA8i2uPo0f10mOpuQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IknLS1Izf6DM/sF56KVAF42vdnRgs47WGOTqobZZNJY=;
	b=oloqR4ydlD393whF1xJ1vYeD1yIckEaQql6dYVTw1laNSAYQCqWJieEIw+N57x5IMtMg
	 uJEpf//QXjf5c8MF3Z65IyrR/MKsngsINt3Epy428WCC3ZKydDdiE9Jcf48ug7cHpAxv/
	 IEiyfuPzLYSi/D7I1re6t5Djea4u3fahqzg4aLaFCFZrMw6iN8yxRFyOuzJg75dmNs7Sq
	 UP083lGGX91z+8ON2oSYutN2BqIrnnVEkkQzC+gnEa5QA5R8yYFFdkgfyy3jwKKdyG1rP
	 n40EXqUPL+EAWjwzms9Z5TcoRMHEP3IYHqHhMNoDYiyvC5ArlnEUA9ioY0qIg1ibYmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=T9vD3ibR;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F76606A326
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 12:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57F76606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=T9vD3ibR
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso603453a12.2
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 04:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795176983; x=1795781783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IknLS1Izf6DM/sF56KVAF42vdnRgs47WGOTqobZZNJY=;
        b=T9vD3ibRQLSip0fqBDuE3ADF/LJTrbPD5BVSPj9KnfEC11F7KshDIe2v6WWHxEIafs
         c6BIPIiVuyhtlZ9SW/y9+y27NLfofz0s+/JLD8SGcLCJKIJFz8/x4k1xqLA3QVRz8wWW
         QV++PBYMLf3HMfcXxHyc3xbLVg8v2g74m503hHYLvolnX7Z7AJjlRP3XurEEN0D5UEjT
         zRSLYxKBEUtNratmXQRf9290R88Br2oYWf5xLZn0WM/1EWIN6uDXr8tvrS0hFyy7nA88
         L6iiqgAGgZzH7iqKkoJnAzG5MeNZx3+O1qUfxRtOW2vE5N3qBQB3zQ0tQ6TafLQ9sIKM
         AMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795176983; x=1795781783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IknLS1Izf6DM/sF56KVAF42vdnRgs47WGOTqobZZNJY=;
        b=1FaaCSFQKRgBaNYHO+aGfLmvGlxotwWIvNA+0t+HXdatf3ZjxxXov1IBdOCZfRvbJ4
         FE8LmsNzuYOvHKsHEuWVeTN71wKqpbheCx8I5/h9Pc9HaVBrKozGmreKMLxaHl+mw4eN
         EXBwJDcZzn4aWlo75V9wifZEf+O8zGK5J7bdv2hicI7gFcDl1xrXs7LyQyxR3BVs5+//
         9X28dLq+MudGVp/5vW6OGXtsFkUChvIlp71/u7X/pu8N25WhWY5hCZwmeRJqQs5GgRT2
         vUpsBQ3ElafmBykkJ58G1pSMoXw8rQo3QJ2h+Qo1Z2m8Rq+55eo75X+cJXKmplOO6hAk
         HWzA==
X-Forwarded-Encrypted: i=1; AL+hErFmaqUpFsL8ZJr+ZekUBsGvV79IfCJATvpIWBBKebnqnlOJvfXjLFm2ih0vXihBHX5nM1TbMHqhok51pYLRr9o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZrgEM+LYl17MxJZtLkq6L2jnEmlsp3cP6bajKoZGW3HAjfxxP
	4z457xtD3PCHlVDNT+EzUFR/HHTGOUlgmmBsE13dRsNz5hMtQY5QqvwbQf1tYdsn/zI=
X-Gm-Gg: AZFdTZeoqT8UfMVXETKNAXMykFhokRHfCEC3qifkpWXg0WY+JC1oMQUxjIchNaGwqJd
	vDhOVREjEtZXv2XT9huc/MqoFAx55sSBQJmmhBeGziZUtEtam2P95YWFX4uFmodI64SGWH0aCNk
	5m4/gL+E5kWIcm8XoS9b8OrL3ZmvbFHUZQimQ1S9wPCvKfoFWQzkRLjoXsmER1nxkF4EF4VnkPj
	7ZocSPWZtcr3mL9Ab3xERy2nMCxnRKICilgzCIorcJW2PJErCqv4SjBgvoFEjOrLaj3SNCKawca
	t+iIdOHzcaNH/f1iEiE85yZPp3aR/aF6LujaLSjlPnF0TdEFeh1wKGvoTqhOhR7MpFBwrSFc7O2
	UlVjWwGj3ieWywDIHoDCXPE7nXUfANvNrAPubITnxwUjzmeBVzSknqZ+pwQEt0wlnTPZHdxWy7z
	m66Trl4cjIn352M0hHvkHmBwkVqK/aD5bARdshyiCAD32F2SA6iNGoCoes8B/H0b2lwiL4HoUR+
	1wqIk28N3sltkdA4SjBn7LqEgYYaf2JduLG+rVrHIc0MQfvWqrMl0zYdKctx6CW33oBMaSSey0i
	6qdDdHNKtmmIMQbmHt9ZV4EVOsuXH6XtKQVY
X-Received: by 2002:a17:90b:1f87:b0:3b3:ca9e:9e22 with SMTP id 98e67ed59e1d1-3b41c9b2667mr2658990a91.17.1795176982660;
        Fri, 20 Nov 2026 04:16:22 -0800 (PST)
Received: from rmustafin-laptop ([27.79.41.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb1b66sm4463146a91.1.2026.11.20.04.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:16:22 -0800 (PST)
From: Rustam Mustafin <rmustafin@cloudlinux.com>
To: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Shuah Khan <shuah@kernel.org>,
	Jaewon Yang <yong010301@gmail.com>,
	linux-integrity@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rustam Mustafin <rmustafin@cloudlinux.com>
Subject: [PATCH v2 0/2] tpm: Track the response read position internally
Date: Fri, 20 Nov 2026 19:16:12 +0700
Message-ID: <20261120121614.978396-1-rmustafin@cloudlinux.com>
X-Mailer: git-send-email 2.52.0
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

tpm_common_read() uses *off as an index into priv->data_buffer.
nonseekable_open() makes pread() fail, but an IORING_OP_READ request
still reaches tpm_common_read() through loop_rw_iter() with *off set
to sqe->off, and a plain read() racing a write() reaches it with a
stale f_pos. Both allow out-of-bounds reads and zeroing of kernel
memory.

Patch 1 moves the read position into struct file_priv, under
buffer_mutex, and ignores *off.

Patch 2 adds a kselftest: an io_uring read with sqe->off inside the
response buffer must return the whole response from its start.

Blocking io_uring, suggested in the v1 review, is no longer needed for
safety with patch 1; I discuss it in the v1 thread.

Tested in a QEMU guest with swtpm and KASAN: the tpm2 selftests pass
with patch 1, and the new one fails without it.
Claude Opus 5.5 was used in preparing this series.

Changes in v2:
- commit message reworked per review, read()/write() race trace added
- add a kselftest

v1: https://lore.kernel.org/all/20261117104838.2650999-1-rmustafin@cloudlinux.com/

Rustam Mustafin (2):
  tpm: Track the response read position internally
  selftests: tpm2: test that io_uring reads ignore the file offset

 drivers/char/tpm/tpm-dev-common.c        |  11 +-
 drivers/char/tpm/tpm-dev.h               |   1 +
 tools/testing/selftests/tpm2/.gitignore  |   1 +
 tools/testing/selftests/tpm2/Makefile    |   4 +
 tools/testing/selftests/tpm2/tpm_uring.c | 131 +++++++++++++++++++++++
 5 files changed, 143 insertions(+), 5 deletions(-)
 create mode 100644 tools/testing/selftests/tpm2/tpm_uring.c


base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
-- 
2.52.0

