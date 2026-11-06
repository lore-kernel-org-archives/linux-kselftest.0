Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934731;
	b=zSLOCDRleMevF4lATGLdYxG+N3dxLCQgKs2kPp47JC9Cf1rjtVFTWG97M6r4QlY2TML4
	 laBXWXa9zMpO4D5u0UW13cMB1VHoSz9FxTodzwKLN7cV1EF3e47lisGV/8PyM2ehDuqYe
	 mSg1zJ2NkWKz2piW9SzdOw1bOiy1bxFDIGKJ098om8B6Yan6398tiQ4uvdFMnKolNpywT
	 rH7tDQAulAHOWcfrQApCKwiYTJaDN3tMpwY62hSWaVnfRGSNE3mI/57XvTbhpz+rHoUMS
	 tFzubjNBLaiVkkZgrAUy/RH/iQU8xvqy0CurZjZT1PsRxKe8REob3M7wGWUYJgD7CNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gknlzQq0R7F7G4AIC4I46wCXFjxiDQKYdQQMUz971M8=;
	b=vSZqCOhmv8rzpkmvvGYcD9dE+EcBT0ixSwetJHzK2NG9HcbSbMuVGH2ctWuRW6uV/oye
	 zmDhhE6wA6R6gDp/XGR7GpHC2pJ9p6lC+AMSQdg8pZ9mSjNL6ozwGVP0XcyIezow0A8/h
	 T5nzUZ22ORdoG/KbnL/4oIkmkceUAQcbAwzxemTIj+bJSnYOVoWXeKGJVC/1/lRFvnw21
	 7XSUn4taS8D6VcVsUVad82zDfbpUrZiFHsK9TLMKzaHMoZEKmu/mK/vWBp7C0LuZB3YLI
	 CFpkZADGfIstdigjJGAPbEOJIuG1/f95FJpCCtjg5E9FLhjFXyIhopEcF9CO5/+tbMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mqJbjn9t;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B85606A32E
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 03:12:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43B85606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mqJbjn9t
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so169557a91.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 19:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793934731; x=1794539531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gknlzQq0R7F7G4AIC4I46wCXFjxiDQKYdQQMUz971M8=;
        b=mqJbjn9tmBBCcprYJd6mu02A0cPWUP/CIjL3QtnbG/D4CK5gqy/vzod5996EP2yBYA
         A8dhaDtEFbM7U3xFR8QqSRVOZxIhkj6YvvbX7vvFqSyLPed9bLLJgzZG7lYaufpXSlCN
         9XOaVYyg1w9G+UcSrqCp1PJbKqlrKKgWpB3U5sbl5mnvT2pNPntMAonZjbsr0VEulV82
         t0EhEsYWbPVThUXGwX3TF989XIdYjFqH7suJNaF5ek9z6ACT2+z71SNkZJsFiVWzY5Zf
         84tSOyBQ0wGf0fiJ85h2ZcZfjdckqxV5uCnWqpAaQ/MchRYIAhnG4Z2idEx97yyxYHcP
         yQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934731; x=1794539531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gknlzQq0R7F7G4AIC4I46wCXFjxiDQKYdQQMUz971M8=;
        b=eqZTFPSvtsqVr/dNb1+tHN2g8lRTNxPqf4jxMYyAkUPdtK3ALZCEhyKEM6AAPOtm8x
         QU1ggPPmdjBu4ZIC/vA1dw6bDf5pk3//e3VUn9uJeu0l0nH/gTeP4Bf9RdVZfTLFouPS
         tcnUNQPkTuHzMDEg6cEou5KN7yUlVmKL/T73gtl8/Pn857f/C3wyWaKAVfEmPwLsuu/C
         3IrrozvLByWJz7zggcsW8UxoffV9Ic5N+KO8fYyZVyXJy0SjuwF5vTz3AEXiVUpUIENO
         WZG6ywXdDVwCoE/sgx8+E+vLHdjCrJjKMfoBgc+OHsyn1dj43TuzW4r6TLxcuzaarp5Q
         HhjA==
X-Forwarded-Encrypted: i=1; AL+hErE7Ec9ub406u0Z+B5krmfYp6GaU6CPXWA4+nakP9QXkqejq7nnzJOVcgTt8m9ATpDDd5TqZxYHFOPaqqS41A9U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VPAWf3PpWHwMgfMTEMurbPwTf8Uz+hGA8qOrhyVjeVqcJ2tHp
	bJP4Y5gi+Yq3pztuPrsWzgfUPil0dBIEp1AKcawN3B5wYp8ZkKQ8o+HT
X-Gm-Gg: AYBFou0AwCbAyR0Ymu6pd0CtGvKoVVfbhB30rn5LWqzi9e8Vi5KWAKqai/4frg/Bp+0
	k9DD5GTpC1R9qONbMjQMcl2mlZ/ySY5RicRUtR9n9TwFNNBSPae8pjVc4mD+0iAjx0QI/o3X+8k
	9MYT6I40ntj3h6l4wsbrc5HH7yFF9BP60/eZjKUwu8Mt2tqbwzRYLobgraeyCzz2EaV4HL/86AC
	UrwUJrdE7JEHoxENHhJGt9FCC0J+w9intrctrc6DWony+p2XXci/4POXpL4inPWvFKudR7LnLsK
	BR8mP1rJT+0zOd21ZtWWYVPRGUq6HzhyJB60Nhfphhf4QmDtWnLahtZ/G3xLZ4bQlZsQtyiiARt
	zyDWoLuv8EKRM0xTo0XzoWsf5ZqmWZHfcCUcRzg8CuXKN4/SzGkYUy/79L1Nn08L9fOGv/b5eBQ
	6VhipPajXetOgT2GCr4whv/N6Vs3lKx7Tju2pi2BGItyhf1+ft5pOkGcah+eoKicqg4k8FP7Vnt
	s8ulwTSpHJXPqOlxureOBXvWtrAaAawiQ8COZUEVmVGNEqj8i52s/qvnNd9WNvE6g77qa9Pdb2d
	XWwArSTjkl3h5x1LWmTzNb0eXwIqJrsJKWg=
X-Received: by 2002:a17:90b:4ecc:b0:3ad:ce34:f63c with SMTP id 98e67ed59e1d1-3b0db6c38b5mr1071366a91.30.1793934730548;
        Thu, 05 Nov 2026 19:12:10 -0800 (PST)
Received: from localhost ([2a03:2880:7ff:42::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b326add7sm5819211a91.8.2026.11.05.19.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:12:10 -0800 (PST)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Subject: [PATCH net-next 1/3] selftests: drv-net: hds: always restore tcp-data-split to auto
Date: Thu,  5 Nov 2026 19:12:06 -0800
Message-ID: <20261106031208.465456-2-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261106031208.465456-1-dimitri.daskalakis1@gmail.com>
References: <20261106031208.465456-1-dimitri.daskalakis1@gmail.com>
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

From: Dimitri Daskalakis <daskald@meta.com>

_hds_reset() only restores tcp-data-split if the reported value
changed. Drivers may report the current HDS state rather than the
configured value, so an explicit setting made by a test can be
indistinguishable from the original "unknown" config.

bnxt reports enabled or disabled based on whether aggregation rings
are in use. mlx5 will report enabled or disabled based on whether
SHAMPO is active, and an explicit "disabled" keeps HW-GRO off. After
set_hds_disable on a default mlx5 device the reset is skipped, leaving
tcp-data-split disabled and HW-GRO unable to be enabled.

Always reset tcp-data-split to "unknown" when it was reported.

Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 tools/testing/selftests/drivers/net/hds.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hds.py b/tools/testing/selftests/drivers/net/hds.py
index 606e26d75951..af34dc9ce749 100755
--- a/tools/testing/selftests/drivers/net/hds.py
+++ b/tools/testing/selftests/drivers/net/hds.py
@@ -65,13 +65,13 @@ def _hds_reset(cfg, netnl, rings) -> None:
     cur = netnl.rings_get({'header': {'dev-index': cfg.ifindex}})
 
     arg = {'header': {'dev-index': cfg.ifindex}}
-    if cur.get('tcp-data-split') != rings.get('tcp-data-split'):
+    if 'tcp-data-split' in rings:
         # Try to reset to "unknown" first, we don't know if the setting
         # was the default or user chose it. Default seems more likely.
         arg['tcp-data-split'] = "unknown"
         netnl.rings_set(arg)
         cur = netnl.rings_get({'header': {'dev-index': cfg.ifindex}})
-        if cur['tcp-data-split'] == rings['tcp-data-split']:
+        if cur.get('tcp-data-split') == rings['tcp-data-split']:
             del arg['tcp-data-split']
         else:
             # Try the explicit setting
-- 
2.52.0

