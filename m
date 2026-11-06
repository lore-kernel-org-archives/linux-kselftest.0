Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977524;
	b=Lf6sVVo7ZIXmov/doiMheFd3IsW/cU6/tsAnJYpClW6a8C5J0NXijHLeNeU5QmCCxaZu
	 8x4FzJWrZfbK/ORk0Kg/yp2TuYkNcWL/v13qBjIbY0QpLsLyu6YMBx1EYVwNZ82Mf56w4
	 c618zdvKi7juQBLY9hUqZT5McxcE8b6O/3fWn8eposQ7F5wZ8ZSDPKqwkg8UvpcWoQ1Gl
	 SJwpfbaSKDzuPpgg5ltp/PvWXy3jDvyfitg4NDY/9QGHS2giBpold1R5ggH1A1vtiyr1O
	 lgjvnxxyx6Q9+2IHBAhbzVDWyqyQw11yBh+xxpP7D9ba4awIFmcPHPpQ61Ura4IJRCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=AmiW9emmj8T3laIwBfZf//xv7IetRbnMAUqXEU+CEsc=;
	b=1zhCinS5+h1B0pjlSr60orPrDbSDY5XJWyS1sZzc+VSX5L87aY/ddWrU6aSfcAPeFKyU
	 uzFTxNHuOQ0lWWj8mwPK/vLWvqtnzNf73RHndbwAwJ/NR4ryW6JPScrCPkCi4/jva5xx1
	 K30rcXQ9hF63ippIvke+Vy/PHWIKK8o0C2z8A2SUXvsQksYoLiueXAkctkITpYDeDBJDB
	 gEdbioUEVAeXVLrPGHCP8vUq5b8C3YvBUD5wX4sE7075RJBX5j7IeccsvPZezyod0kNLO
	 qE+iLDKWta1CJyxQ12sGrhIdRX/PQxBGkDnN5e+PnzjzuoEQjAat4yYAokqy6nyMJyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yGusTcbF;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284C4606D80C
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 15:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 284C4606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yGusTcbF
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a599e9110eso2297535e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 07:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793977522; x=1794582322; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AmiW9emmj8T3laIwBfZf//xv7IetRbnMAUqXEU+CEsc=;
        b=yGusTcbFvJMxDWFkQqL7/7VJc1srXLp1ZyzkqHljAh9MJgxGv0TdBf2kCq4x40R+8N
         +uwVNgGt4KQHUS6+kqz+zb92xHF/zFdVYC9D+KTiXRelHT/2ym1HxC3v2h9uoS3XyNTV
         Ah2701llocXqBRcfMeIY11U0ipBWRCj4y1vl0MWadrdDFIEZH7PfO5EINmVW3B15CYKF
         smvJXapilCrmhv4OIowo9s8cLk5cus2nG+e2z/akTx0pNMrSVKJbaGKZW9fFRChBjVQ6
         Ye9UsBgrTBmQqcmaBWUkAZhtTnoTfxeRV2ohscUmyF+oHkluWLECHsbSUpXcB4ShUF8q
         BQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977522; x=1794582322;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AmiW9emmj8T3laIwBfZf//xv7IetRbnMAUqXEU+CEsc=;
        b=NOlo7drlWLj5iEOHO0V38JYrpt4m6tX+RiqZqHNc/Is0Le0zO6PgV19lU6xol3HWHX
         rOOJJKg5s4Baf37axJtc3P92Jkg9B+uq+e9rhQwlKzEm5Vpov+rX3ebZH7at1GKX8QQE
         fhnU99ZujmEcftnT0faSexog8F0oNcRNPXMeKYAlMNewPGP0O4pGK604JAuyY56ifQS7
         zLgVqkRag7QSuF7qPL9cMO7qfSGZ3/HTQBuUJEdzZ11kD09qrsbKPaooXDdEjDJ8ZT0b
         MJDd3O/6ytp+hR4oK7PsK0gvfMiU81z1nEQTxJGtx/bBIdZxYCiMJtD0t9nd6ENGHrsF
         n/4A==
X-Forwarded-Encrypted: i=1; AKwUvByrr1fuD1rjSWZCzoCwYF066SGLCz8Zc8NQ/vxKSDOsmkQXW2Q31w/KoXtwROxUzQXy/St5R5IzWruIyAC6u8E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+COs8hPHd9SYIz/uuCm9wvj492YyBbg6Mvg2OYY6AhBjhkvRiC
	HWXeDV8NNeXqWcQQe5zWR+iuAQDZQGbsJFaaqxTUIsc19WX0GP3sTBpN
X-Gm-Gg: AYBFou0hRHMMAyURMRmv+YxIbC+vdL7jOWRQCmI/ODc6ezKoe/g78Xpva11aXS/i60J
	4rn/xzfnqWDn3t49jAf8/jESEkERDNw17Nx3vi9rLqpatcdNKwE0ggcATlOniqdXcZ+AR2U6jiR
	WqFYgErTyHFZve2Ly8v2ki+RJeOXhLJOoFj0+CGXB65KyDDRxG+ym5vWHYAqrEc2P3TQfCLvNoJ
	8szJHunj5liBRgw3+FpUDR7YoDgoly94Rl0Rx8UJnlSxDYRoe6FYGQCS/VWAPeqpWIzaLIfOmgb
	dvHFTUOnO/ymu+p0OO77DnRl6NZ1aa9QKKqku+10xQbGptLObcEq8B23pPjiQxWUMamUfHXmUVt
	kXBEOYMDMrjJRpce6XcnEkzeQXivdxoH1hS4ZWD3P0uCN+D1GGCPXP3Brg9onTnB6yWYyJEMkm8
	wR/Meiu/TVoON2oAs3LIgzv7JqkEPBKy0Sd3OgJdWWP7eryxUjKZUaYRUWfAIgU/ecG5xs5bNCu
	FtjgfdHvgTJ9b9AsNTNUDwSr5X8+978OnYbxzyCtHE9SKpYzXWGhORGsThz9OLAA0tXhX5xYeQb
	d4f5GcJhJUTi3bFqQmFhyVmkf892q0bHOrXuBL7ed2G4+FkjT9gcHjsIjPDShF7GLpMtIfAu
X-Received: by 2002:a05:600c:c111:b0:4a1:e015:6441 with SMTP id 5b1f17b1804b1-4b6d8a63e17mr41374465e9.0.1793977522560;
        Fri, 06 Nov 2026 07:05:22 -0800 (PST)
Received: from localhost.localdomain ([193.255.169.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e58fcc6sm260950305e9.2.2026.11.06.07.05.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 07:05:22 -0800 (PST)
From: =?UTF-8?q?Bilal=20Yaz=C4=B1c=C4=B1o=C4=9Flu?= <ahmetbilalyazicioglu@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	hmohsin@meta.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Bilal=20Yaz=C4=B1c=C4=B1o=C4=9Flu?= <ahmetbilalyazicioglu@gmail.com>
Subject: [PATCH net 2/2] selftests: drv-net: ring_reconfig: skip tx stall test without channel config
Date: Fri,  6 Nov 2026 18:05:09 +0300
Message-ID: <20261106150509.30458-3-ahmetbilalyazicioglu@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106150509.30458-1-ahmetbilalyazicioglu@gmail.com>
References: <20261106150509.30458-1-ahmetbilalyazicioglu@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

reconfig_tx_stall() needs at least two combined channels and already
skips devices which don't report enough of them. On devices whose
driver doesn't implement the ethtool get_channels op (e.g. e1000e)
the initial channels_get call fails with -EOPNOTSUPP instead, which
YNL raises as an NlError, so the test is reported as a failure.

Use the _channels_get_or_skip() helper to skip the test in that case
as well. Other netlink errors are still reported as failures.

The issue was found through AI-assisted source code analysis
(OpenAI Codex) and confirmed on a ThinkPad T480 with an Intel I219-V
(e1000e, 8086:15d8). As for the previous patch, the test function
was run against that device with a stub environment and ethtool set
requests blocked, and is now skipped.

Fixes: c98610c2eb70 ("selftests: drv-net: Test queue stall upon reconfig")
Signed-off-by: Bilal Yazıcıoğlu <ahmetbilalyazicioglu@gmail.com>
---
 tools/testing/selftests/drivers/net/ring_reconfig.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/ring_reconfig.py b/tools/testing/selftests/drivers/net/ring_reconfig.py
index baac20e8d3e..dd6ff6b2b64 100755
--- a/tools/testing/selftests/drivers/net/ring_reconfig.py
+++ b/tools/testing/selftests/drivers/net/ring_reconfig.py
@@ -319,7 +319,7 @@ def reconfig_tx_stall(cfg) -> None:
     other_queue = 0
 
     ehdr = {'header': {'dev-index': cfg.ifindex}}
-    chans = cfg.eth.channels_get(ehdr)
+    chans = _channels_get_or_skip(cfg, ehdr)
 
     if "combined-max" not in chans:
         raise KsftSkipEx("device does not support combined channels")
-- 
2.56.0

