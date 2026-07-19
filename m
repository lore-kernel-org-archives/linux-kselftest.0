Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0063B3B2FD9
	for <linux-kselftest@vger.kernel.org>; Sun, 19 Jul 2026 18:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784484019; cv=none; b=hrZFGJVZF/ASgiJwy4UR19ZSgPl21ZLzxHUL+5oyM74NHgKgF0AskXLuzJBwzBHFWfNIv+rWrMoGBpIf123CIjfgVPNida6x8zUs9g/h8MzmHfc8QrH11ROdD2dBQlnxdolQWMzD6lM+WOSq4IoDbtfNLF4iA22/okbfzjSmFGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784484019; c=relaxed/simple;
	bh=IWl/rQwPGM5RLLR3ae5FmKgiapEO5Ii89mk7y4WpFec=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jNiQyD23eAe9j3DnFeJC9uQDQpozv9PvMYB+GR9a78m2UuanSPGmnDcnlcnk3QrAK/K1CE2EKXOGT2OChh7F2sNo2ynB76QwNdxAbferWAvnjKxaz8Ez70q2+IbLXRnidtwJebYcumoPXd3XO+l5yGRdWZKnpTYcxEs1Ts84w7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRSyNP3n; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRSyNP3n"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso104946745ad.1
        for <linux-kselftest@vger.kernel.org>; Sun, 19 Jul 2026 11:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784484013; x=1785088813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OjFgwGrb1ClX/kve0vswPTA8/2SHmC5jDANL46Jtr8I=;
        b=gRSyNP3nbOy92ndFyGq6aP6JDaV8aAmOvPKk6h4ZEMEh+9n1MXRhN/KjKJ00rxs7Hd
         KLoCPSoxZwgxWI8xls30M7eYHu0FOR0MiRmNjhrmI4shqvn0WxeheUew5dXh0r/H5jan
         0IxTL/ohLXUqGZMkpFHvdBOTcinVnPoIVaOcMaRr2IPYLFLYYFgLlqHPsqeAwbnsHO1S
         VZUwdmWN9uuM7msnE8QYvaQyhoc1V2It5aYl8p4y/k/4i9I9UWou3ISu6o61KBH4lxv8
         l8qlx0+WDF36IK4OuqpytHCzwq2lJEnG6i620BEfTNIsK2p9RjAtq1NK4kTU4dfFluTF
         oNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784484013; x=1785088813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OjFgwGrb1ClX/kve0vswPTA8/2SHmC5jDANL46Jtr8I=;
        b=oz4bKUDdE0nWbLV+kJDOnZ6ieTjK8Zn/A38Rr1Jeu8wNAWqlHgIleVREy1H2unDxkn
         76M54l7B8drIr6bkQmnkrxJT955a5XTwzPPCaqNP8HHOMeEdyeEFHJrWcT6CWQGVHig9
         4UQ2MNuIE/ocdWusARiRwbXou6RIjVmylDE23XHI3LMWc8maA2LPGieTxM0mCZxrP0Sh
         cj1Dwg6APyTMlt9sR3UbjN+mZogasYsivY2nFNMwn8m+P3apN2LLmB4FxkmC5uBjOu4/
         aK/1ejNnzKnuNcYl/4eU1YhAjYrfLBpFgFEFwiR7LOMurGl1hvqVvBIQZ8XH5cCnuoM6
         AheA==
X-Forwarded-Encrypted: i=1; AHgh+RoGi7IRGm8j+xSGh9MaiqdxAAs1w7DQy3tRaK1aBJRHYvrNhhb+i8CobNJJTwlqiIgYQsmeN+ee298TlPPmZWE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6ru/lSIhSvdnPc35NszUTFS+G/Fc8O29Sfyf8He4kkETO8XX3
	n4wPKt6cjQC0vV7pfu8Ya/401v1v/Wz5LmXCSEgdiVdj81BhFJ1GWNajbulF0e06X+M=
X-Gm-Gg: AfdE7ckfSgeByh56svrzt4UV9uGkO81o+0V8AYXGJce/8v5a7mK49LFFJgmz1hwXSVY
	2VNuU/+pCEUQD5LRo+9xKQGmNKkqHNb/NWIO3ZrqPVkaEUNmDvHl5vVyIK662Vu+oydu3nNSr+M
	rvua3lcMhQjAkWAI22hxc2uiUoaBK6aYwCjnWFjHzDmz98v3mNYONf/dbbVEnLSjgRBVMVM6vuN
	tN00LjjDz8Uq3DpYFER3ZvRpcg0mALTserVsTyMCZusEKFyCAn/zVYtdyI8jVXy3GrE8rxMHBLy
	FuSLRggnx9vA2L60TUrzo4ZM+g0SceEVzXqPeHKwGLL4Ino4terZZvus/93iV7AEJQK6fMsUHCT
	Iv/NRfwWPzqILJhM+2o+rBp8XXhFhwobPM612MZTJLyy6YrfMfAtmZQUko48EMg/61Q==
X-Received: by 2002:a17:903:988:b0:2cc:f5aa:9513 with SMTP id d9443c01a7336-2cf34821a87mr130472895ad.10.1784484013524;
        Sun, 19 Jul 2026 11:00:13 -0700 (PDT)
Received: from ap.. ([182.213.254.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf34769bd6sm43511065ad.74.2026.07.19.11.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 11:00:13 -0700 (PDT)
From: Taehee Yoo <ap420073@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	Alexei Starovoitov <ast@kernel.org>,
	amd-gfx@lists.freedesktop.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Andrii Nakryiko <andrii@kernel.org>,
	Bill Wendling <morbo@google.com>,
	bpf@vger.kernel.org,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	David Airlie <airlied@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Donald Hunter <donald.hunter@gmail.com>,
	dri-devel@lists.freedesktop.org,
	Eduard Zingerman <eddyz87@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Eric Dumazet <edumazet@google.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Hoyeon Lee <hoyeon.rhee@gmail.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <kees@kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	linaro-mm-sig@lists.linaro.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	llvm@lists.linux.dev,
	Mark Bloch <mbloch@nvidia.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Michael Chan <michael.chan@broadcom.com>,
	Nathan Chancellor <nathan@kernel.org>,
	netdev@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Shuah Khan <shuah@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Simon Horman <horms@kernel.org>,
	Song Liu <song@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Taehee Yoo <ap420073@gmail.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Yonghong Song <yonghong.song@linux.dev>
Subject: [RFC PATCH net-next 03/13] net: core: add XDP_MODE_HW offload hook for knod
Date: Sun, 19 Jul 2026 17:58:47 +0000
Message-ID: <20260719175857.4071636-4-ap420073@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260719175857.4071636-1-ap420073@gmail.com>
References: <20260719175857.4071636-1-ap420073@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Route XDP program install/uninstall to the knod accelerator when a
device is attached, so BPF programs run on the accelerator instead of
the host.

Signed-off-by: Taehee Yoo <ap420073@gmail.com>
(cherry picked from commit 9689730acf7d6e4d34cd677e4615be10856c709c)
---
 net/core/dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index 7c21bc0a1e34..5ba1c969029b 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -10334,7 +10334,7 @@ static int dev_xdp_install(struct net_device *dev, enum bpf_xdp_mode mode,
 		return -EBUSY;
 	}
 
-	if (dev_get_min_mp_channel_count(dev)) {
+	if (dev_get_min_mp_channel_count(dev) && mode != XDP_MODE_HW) {
 		NL_SET_ERR_MSG(extack, "unable to install XDP to device using memory provider");
 		return -EBUSY;
 	}
-- 
2.43.0

