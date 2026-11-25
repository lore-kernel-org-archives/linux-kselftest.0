Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795570737;
	b=Pomy9tLN5Rlv+wXI5Q8RT4o49LtaEGyKG5T/xbMK7C17cF7Iwi65UXTS/qBRPGJ0CGPY
	 Yg//hlHEPlJ2wBB3TwN+BnIsz68qZ/DPh71wGcvkrO4/lSvgjdBP6FOwW8bVsYvh3Y7Bk
	 Cye5W8GlpTZPa5GFiUIJ2t99i+GCFYWIv1de+gFuV4kNNJP6DyH/frM87JSzt1VVEPEzr
	 yn/j2Od+9x3qlnBbqW0ZxkUmYWYdzWg7ogG5M2iCRLIFDB5antw1PoFtB8l8jWXiQ9qsa
	 sY74rNwLN67YYejOJg95bB3D1ges9Kbwo336vXHHA0LfYKKdX3q6jk2iofkQNOSRvMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YDIcmu9gZok4T9RCCwjzEyzCUipWYiC3bM6Ft7AoXiQ=;
	b=yvhlRzCfUaDzmka84IqIsEk9a1t4gj69sfeA9VtiTZjSbVJYE+2Zc/dmqZWdP3KfA7HG
	 +qtqmfY2LBFmGlrNtRB5H8ySwJ2MGyz02XEmQhuNDLlVvUXAHzukHCAWArimz7QuHAUIi
	 Kxk5yJTsykhziGAAmaOjHogZx4pXx9IIIeDcUxgceWakD0SFfci1Mc26rxX9ZCzfXMdx9
	 CjEMPmD8ZSCJf3qs7H7O8eiIx8AOexuzErElPOjkLbQCpgHzAxS9AATbRnkdTFVxqpcgI
	 BXOOQFWQJzbwWe/V9zT5/HySaprKl2Vu7lRLhOp4+pfyqBLhsM9CG4jJwlrs97ICwuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nQ3cYOFl;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614DA606A32E
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 01:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 614DA606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nQ3cYOFl
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8cf79c02fb8so252713b3a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 17:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795570736; x=1796175536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YDIcmu9gZok4T9RCCwjzEyzCUipWYiC3bM6Ft7AoXiQ=;
        b=nQ3cYOFlTRFhcuSLIWlwOPuC2LQzGSEZw3kz3m3DYrwBMqvQH5vLebKCVtGmpzqd8j
         VwFvgPv+Qt5BK6J7fGTGjiLqAW3WgA8fQXWviz+3ekMnlQ8vJU1tRVCjP7zSds6sne67
         7ZljZ/RCRZ7lrmaEIq2tDJNR1LvUeupfzTHD2EGted1iHScyX8uiPSluADAdJsVYE/Ri
         fCRdU7t/vJF4aNTmF4m/BUbaob2qqKTKaX/Kx1YGhKxzRgbxNB7NQUIxsRBlKYaPglqF
         8e42LJFvRXkxoTXx6jtCSVL8p4Pu+5/BDZ05mA1TSO9lfp4RYzMHusEuJnnwlcigTNjc
         in0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795570736; x=1796175536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YDIcmu9gZok4T9RCCwjzEyzCUipWYiC3bM6Ft7AoXiQ=;
        b=U4NhhgIAzV8VIQ+0zp+XlmK3CgXYJm8jMWsS3gmBSrVvfxyhT1vcUuMkZR2ClUQaQr
         kr5+R+C6TRdBetvfOLJtGyXc0FD/+f79OcdEuVLn0X7a6w2nfoaf38hJy9jrao089sNA
         EGoHlxlYziy/+nHUW3epOds6RqzB4LqkcOah4OwEnel9s3p0u1i+SyAs+rEQfmu9Bd5A
         8h/bMHHsro8GVWWVM1s0lj782/EdAhDileFyvk3c3f2C49LaTXZtzPeCNPcftL/vz9fW
         9P6j8r6D9RlokXfKcxVSvzbEKLM4kwqdpJ5an5ikHwJdf2E2s2jUSaYviiyPlkTOf78G
         +cIg==
X-Forwarded-Encrypted: i=1; AL+hErE3w7NERyQSDpct5so8Y3G4s2jGR+tXkFGdf5FT0SaRdg86nez7Yv3nIGQ0KcwZ311B4ieKYaAd7EL5hGyORtM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WjGFUy0BSJGqby9EUOC79KSjYRzQaQnP1dsmycbvVB9244Aru
	bnFQfDpUHbyzAJJ1jWne4skWWEBmb/Rc0tnMENGhVSEhLHijgP/VY1graWiz9fcufWY=
X-Gm-Gg: AZFdTZeU0AlwkSsF7H8M9bkN2CQbNGCnN/AVF3s7g1ADj6Wgfcw1SlZVSunibIhQBRI
	3LlP/MrRwiJnqOBH0qparynq3Nbi4CD2xUh+/dmZfEuQwifwwv+iWnfqThpN0S0DCEhIsqvoiuH
	22OK8mwdoJOjo0gtn2JOv8nUJQRrM6garGZpBTLqgEZOgv4tDjuGyRe1hklEUB/AJbf4iPEdiyk
	UIswRFZnMIwggoRsDyTrAkIrFFOOh7co0UROU7X1zpJjffZGaQnVGdMeMUCPGIQ/myzLawemjoO
	F2BPbuWrJb5GVMq9sD7pjb7LTty8RzGBhAbjyRzsEZmJKjpqeN8lR70KOuUOHHAXiTxOvJotL5K
	Uriiyme2dqcuRwZ+o7IMFLS3gBBhAYdrZ8AJp9ZUFsPlkfYRSkY0aLT7BpnOWUQ54AjrFOAFxQ+
	e4096ref5Fq+UavRrp/G6+9A1qZyL6mwn8gQtv4QKN07tlfzTxjP2x1LFQ2W5yx//aaCidE9spv
	GOxZNyYd1tuoipBaL4W7DT1lZSX6wrc3mc+p1QFZmZExPPkDfgXlW1gdqiiV11WXOMVxMuKXcvH
	iDilFx1FVME54xOYZiuXXsfbL2GkMB5uN6QQRmNGk4haeXTV5ebZC1lZvfejpqiq
X-Received: by 2002:a05:6300:8095:b0:3e2:83d5:191b with SMTP id adf61e73a8af0-4014c25610dmr14554528637.63.1795570735677;
        Tue, 24 Nov 2026 17:38:55 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:54::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8706844a0sm8133696b3a.1.2026.11.24.17.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 17:38:55 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: edumazet@google.com,
	horms@kernel.org,
	narcisav.kernel@gmail.com,
	Joe Damato <joe@dama.to>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 2/2] selftests: drv-net: uso: add small MSS variants
Date: Tue, 24 Nov 2026 17:38:36 -0800
Message-ID: <20261125013838.3823834-3-joe@dama.to>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261125013838.3823834-1-joe@dama.to>
References: <20261125013838.3823834-1-joe@dama.to>
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

Add small MSS variations to test paths in drivers where small frames are
sent through different TX paths.

Signed-off-by: Joe Damato <joe@dama.to>
Suggested-by: Jakub Kicinski <kuba@kernel.org>
---
 tools/testing/selftests/drivers/net/hw/uso.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/hw/uso.py b/tools/testing/selftests/drivers/net/hw/uso.py
index b0936b6b2161..be152d36cf3e 100755
--- a/tools/testing/selftests/drivers/net/hw/uso.py
+++ b/tools/testing/selftests/drivers/net/hw/uso.py
@@ -92,6 +92,8 @@ def _uso_variants():
     for ipver in ["4", "6"]:
         yield KsftNamedVariant(f"v{ipver}_partial", ipver, 1400, 1400 * 10 + 500)
         yield KsftNamedVariant(f"v{ipver}_exact", ipver, 1400, 1400 * 5)
+        yield KsftNamedVariant(f"v{ipver}_small_partial", ipver, 8, 8 * 10 + 4)
+        yield KsftNamedVariant(f"v{ipver}_small_exact", ipver, 32, 32 * 3)
 
 
 @ksft_variants(_uso_variants())
-- 
2.53.1-Meta

