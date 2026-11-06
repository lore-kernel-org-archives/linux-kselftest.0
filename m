Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934735;
	b=ZkG21q3E2aI+Mc9RMsBQPUrL80tSULTqIG3fCIxNBYutRiqTNjsYAtHicfdY1ENmJ4U6
	 paKDCOK0vc9o3tm6X8Cr1KlNs7Vp44ZTLExe6r34xB1Ql4xyTgLXBBs3decWiOx/2aS0y
	 K+rqLkJHj2Nm8AX+arDPGeCh3sIsZ7aInLRrANFy3vwVylHLt+qyYNRgKofA2rbODTnzX
	 ZzNe8xk3qY6yErJ1SdXl/PeuSJmbF437SbMMD7xNidgarmEHQZy0Kk03loD4/etsZFKn9
	 XlzjnuW22AOduIhqi9hEWH2Oa3I/ESxgftnDV9fa1i7SREAm9yGnytFUh8gb9EFGjeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ff6PTiGrdFGwQ+XfBLwgofKAzGmny9vJs85i5I/222c=;
	b=pPGFRRBgAxWfc2CLn4GkZlfAkoVm41GdbR7btrqZ493D9ktAWpVRQfqRpxGcBu7Slbbb
	 Ua70mODzZzZPCxiOOh3YCa7RP4itYOBK3dqRMGcKcptLYL4gMa33YKnFqMKHyzqYR4p+Y
	 8gIHx+VPW78sy7zfnkV4gTWZ+oswVohCZzhGYfVlQfX2jLJYmqTGYpPy1TFnFh1FCU++r
	 b1O6NYjpQeJSQ6Gn/zo6i+FVDESIPf7ExQBhakeUQbJse3W+WnxdwklqkkllIZ7PLyVTF
	 Hz5t5o5pffOCY+FPnTdloCXQbmB1X0PBSgo8f61SZixVnrkSEZ1Ph9Tqq82nX5XOn3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c6IWp2JW;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0516606A331
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 03:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0516606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c6IWp2JW
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso67393a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 19:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793934734; x=1794539534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ff6PTiGrdFGwQ+XfBLwgofKAzGmny9vJs85i5I/222c=;
        b=c6IWp2JWjxCrdmLv1HzBmo19rvwEu1wp9A/ZlMhE2bvBhWDj61nes1rucRhaCXQjc2
         qvlUmHTteeOj8evY70jZiwjfhwKsjZiOk/zo40LKcFC5MBGi0qkie0rrEPg76ORCnift
         QQVPq8Cq5CP28rcys9XtatQV5dl7mjncTVUMO94PQdr+p8rxwOGhkObbh0tL/QQm7/g+
         ba92tw07SEERv7PTg2J7KBcq2SfwOpCx5OI/42IZ8gIc/x/pcG8vcPs1dkRJfuD/tXue
         HP8aTLcJwxBmhh/ie6r8SmxGJL9OFpuJORKNmj4drj0W6pe1k6EmIcCJ49wN6I3L5SiH
         EFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934734; x=1794539534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ff6PTiGrdFGwQ+XfBLwgofKAzGmny9vJs85i5I/222c=;
        b=cY78WQKGr8Z1lSLDhONKgzPPGYwoCUGtS0Hs9R1x2XQI+pjGqcPNnfmZVOJQeINqFy
         0l72w3fQid+9/mu9PmUggX2LVEmuPCKCuLm1rPxRkpP+1I8/d0RvpeQ3TqCbiWqKNyT5
         Mw5PoTWk2y7ly9zfuRUgzc7rfPCeKprkQQrcJCqYqyYj4RqwNN51rfdZ7XgZGDylppxy
         2MfAIw2f3i03OcdZ5Xku8zNcDGpmPjY2L0x7OgF7fj2yoFxwfu1unjb5RmNePuCWulpu
         XVTKkKMcGvzPxAS9GKV7cXEXuLSChtZQoKt5t97IFtgKwQZzqH0xWh6VkyE1vaEVuNUt
         17Iw==
X-Forwarded-Encrypted: i=1; AL+hErGvQ6xXxY+x2BOdog6u/uAdOrRkLGsW9FjRcDdFDnP048HbBlnOZNCJE27P2twKWdHuQaWvMwgyLZUFzpMFOFw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SzW49mMDQnEg4wGvK19oc7Wa1jHakKzZrdaz/rbP7q8XDLJM3
	cKXbVPUYAot5ZG86yaU0pLA/YUoBuODkpFGEJ8GhCXDBp1aNi9FAhShQ
X-Gm-Gg: AYBFou38f9QmdCzriqK2jJdMNXskZD2TLcKo0cwphxJ2CAK8BXCqscWYaL61Xpz9bhV
	IvsnZ9616a9G3DhDmUFPinUDgYKcMElMrKkrCgYXwFTkBo4meuovpXhKOy1GFAaSWB3E8UKo11D
	ZkMAw2pMxb6/Z+0jwy+KOx3tlQOuGbDQID+x2LesmiBZdeLpDM3Fv4w1bL5VgkTDWt9tBJrrgBg
	eVFlC23h8jUOan6FknYsyEf9259PSMFBt3jg2uc6+Kka1Jno0Rhipy1sAjTs1F2n4G54bsUC1tU
	Azho/HQSPH2XVdvJfSiNOgTKo5AzzAp96Cl/skkLMvNVXh0OEG5HMuXHUKMGtXsFWs1SY8h09GJ
	/llWn32oiw4cOF1Hz3+aodvMvpC+tYlaXnTk4hcDBlePF9Ln9lwYFbywuxyeNBotgNoIXy73M+p
	MRwYIWa1aKVXV6F0i6R2Pm3aJZsf/9kWwgwM7hJOqT3lyr2anXf2jcwHGVFzDTsUjAj5CIpyjh4
	EpPUpCB1spt1bWtlhXNCG1rUZuB7tVcnVinSfmn/AnJ9+7DdGdWVACIzgy4WdPBzSnNSUTaagi6
	WneTupHgeKr0spAGbp79kynRJ8stawml+A==
X-Received: by 2002:a17:90b:4ece:b0:3ab:1af3:a0d with SMTP id 98e67ed59e1d1-3b0db705fd7mr1061194a91.33.1793934733894;
        Thu, 05 Nov 2026 19:12:13 -0800 (PST)
Received: from localhost ([2a03:2880:7ff:6::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c42c65sm1357846a91.4.2026.11.05.19.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:12:13 -0800 (PST)
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
Subject: [PATCH net-next 3/3] selftests: drv-net: hds: restore HDS settings in ioctl_set_xdp
Date: Thu,  5 Nov 2026 19:12:08 -0800
Message-ID: <20261106031208.465456-4-dimitri.daskalakis1@gmail.com>
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

ioctl_set_xdp sets tcp-data-split to "unknown" without restoring the
original setting. Defer a reset like set_xdp does.

Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 tools/testing/selftests/drivers/net/hds.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/drivers/net/hds.py b/tools/testing/selftests/drivers/net/hds.py
index 7f052c319603..a1ea195743b5 100755
--- a/tools/testing/selftests/drivers/net/hds.py
+++ b/tools/testing/selftests/drivers/net/hds.py
@@ -254,6 +254,7 @@ def ioctl_set_xdp(cfg, netnl) -> None:
     """
     mode = _get_hds_mode(cfg, netnl)
     if mode == 'enabled':
+        _defer_reset_hds(cfg, netnl)
         netnl.rings_set({'header': {'dev-index': cfg.ifindex},
                          'tcp-data-split': 'unknown'})
 
-- 
2.52.0

