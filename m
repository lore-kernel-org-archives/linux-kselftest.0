Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA68F24886E
	for <linux-kselftest@vger.kernel.org>; Tue,  6 Oct 2026 17:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791308000; cv=none; b=gAaY38zSgO7h5Xjah673SlnwVwsHvisirMwDV6itn7toQx2pTWi6jRSpwPCwANi/ae971oORv8iq4nY0tuw/0o0gSSlW/DpKBqYWXBIiNMNKzB4lzNp6RXCvprgI4qmloqnYBQh5xNhoZ4Ks56VDKZtwJqyQZoa1EI08EZoI8U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791308000; c=relaxed/simple;
	bh=H1lfUv8lZxLYx5JGsjCazmYH2gGjI45FEj2BuG/W9QE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u5Qf/CTgxp8Fa16EdRiJ56TE6PlQkWz3ts/S6SWiVkbLXAJ4uki2w7aFPFJfUckCuGdtu1F5MMwmI7kdl+0Lvm1EWaE7Psl5zEOET/rCzOUMCpZkBZz8X7yfkO6S1KUcWD8ky7PZS4JRuph7Tn7dtJMrPrDHQg/8chu2Q2Z9y7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=Fz9ZY0OR; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="Fz9ZY0OR"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48afbd2c386so876332f8f.3
        for <linux-kselftest@vger.kernel.org>; Tue, 06 Oct 2026 10:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1791307997; x=1791912797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vI/CREtYlaKCf7QQt+Wn+NAvceTNfQIZHGOmhJieQwk=;
        b=Fz9ZY0ORb1P2pCcSHH1kIlDpttDSuV0LwH7BU5/2eHKThNrWZNBvkRSOlxgq/SzFtK
         blI+3usjGrdZqS5g1C4lmx5unKWCCZzl3vMmuZwRsBG+OfjqdUooxOddd1bJPorvTdWg
         sI66JcU5SbRa5kMD81krBkCsv2yqKuL1TMEySu0P2xsVaDv6RmaNO/RQ7XUKvTW8t1y7
         2G0oizMJNdkmJNECJuT32S9HvkfTqtyhNb12izvha9AuxtNqh046TBNZNL78DRN9Cd4M
         qU7tC6iaKPQuQ0fCZ0X/eMA2tVtPc7LGIdsBo8CB5tMCNAH9ZexbS2ZIsYV6bPlaIi5x
         YxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791307997; x=1791912797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vI/CREtYlaKCf7QQt+Wn+NAvceTNfQIZHGOmhJieQwk=;
        b=zyY4fyCAgtPysE9tJprv34QQEkzTJMCv3arohmy1ThCqGa8j+1428/CnKHOlw3CuU3
         3U/kUHOLL8/Z64VeSZGSQ0f0HkET1u+7GC7T0+m5PDDfPLPUjWDXPRPgnVhzys2FigCE
         JCeqfJEy9Iakhrg91YWxu1I3jUIj2+Y31ulnoPH5tW+7TukAErZpmRYFolFjilc3uMOb
         ILN2RFxJ/JLiju8+1DBj9B56vgrzG/E3ZZR6DSebLh9PKNenUHkfw91N+rzI3Phg/ijl
         5lNh8XDBg269yPu8Nq52I3Ivzv5cJj7eLT+VfbYoiLhwy0o1PRZ+VCRnZaXIFUNFbanP
         o8+Q==
X-Forwarded-Encrypted: i=1; AKwUvBz9zfunebxKihjzt8+Cmrs9MBj0VUB0CgmlvMBU7YYhN6Mp1mCfnagrh+hQ6IzpTaf3TpVEJvJuaK/brsgC8kU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiMqD2AEHfw7KOprHILoKZFuFF3nz8b4Rs/7uim0UQn9lf0ynt
	lgS+QkmkyMuubii/pxlvknTjzx2jqJGjcnJy6Iee9NbNffi50M9rHcLvHo/TyThCL7Q=
X-Gm-Gg: AYBFou1IZZ+JTWA4lqV5laVYb3cb+vzj9+JkpVVaEFn2pau31NmjFZgEjs7meY1/OkV
	6OxHgIeFi6VBEgv8Gh/jeUOnpadS/aROxi3D6VDZjdDXP/oJ3dUVRE5suOm/Vg8/z9EfJ+6WaDa
	XwDLC6UGRf/hNRca4DP6j+rgJFWiSo5ee5hTUIIKyZ92y7HmxNKf2SEuaHBRqWlcd33xYsuIxEY
	R8SRVwHQrPelFn8K5Usgw7I6GBSjrVCBXcQutq/s2F/s27tOHltuvvKB+UsmZThj9qPunPRPUz0
	QNi11AtI7QoIgQk8hyttLQMALlWHRzi8mxdiJP+2U6SXvUXKdafWjxEFAEuhCZsoEVMkzTj/abj
	wCuYjGm7Pk2oUcjJqH9wOou4s62kP3v3fdZRXlAFQjV2JolEWaFcYwC8rRhUcqX0jnjujelPGD+
	viLolhA8rCG7FGIEys5G5tSPSDgvt1yaokvx/zlAj8GeWjplXYdDK1xY2L3kBYNcwkQAucP7jHb
	/NISjAmQu4Qyag=
X-Received: by 2002:a05:6000:26c6:b0:48b:10c8:2180 with SMTP id ffacd0b85a97d-48c7279001cmr297088f8f.33.1791307997130;
        Tue, 06 Oct 2026 10:33:17 -0700 (PDT)
Received: from D90XRJJJNQ ([2a09:bac6:37af:d2::15:413])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1272esm714121f8f.27.2026.10.06.10.33.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 10:33:16 -0700 (PDT)
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
Subject: [PATCH net 0/2] veth: fix peer NETDEV_XDP_ACT_NDO_XMIT after GRO is toggled while down
Date: Tue,  6 Oct 2026 18:32:35 +0100
Message-ID: <20261006173241.65945-1-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Toggling GRO on a veth device while it is down leaves its peer's
NETDEV_XDP_ACT_NDO_XMIT flag stale once the device comes up. XDP
redirects into the peer are then rejected with -EOPNOTSUPP, or, if GRO
was turned off, accepted and then dropped with -ENXIO. Patch 1 refreshes
the peer's flags in veth_open().

Patch 2 extends veth.sh to check the peer's flag after GRO is toggled
while the device is down, in both directions.

Tianyi Gao (2):
  veth: fix peer NETDEV_XDP_ACT_NDO_XMIT after GRO is toggled while down
  selftests: net: veth: test peer ndo-xmit after GRO toggle while down

 drivers/net/veth.c                  |  1 +
 tools/testing/selftests/net/veth.sh | 46 +++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)


base-commit: d5a007b9b457c915ab1a53227e8939e4018aa97a
-- 
2.55.0

