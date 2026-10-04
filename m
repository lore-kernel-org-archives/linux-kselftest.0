Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF8047142E
	for <linux-kselftest@vger.kernel.org>; Sun,  4 Oct 2026 17:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791134206; cv=none; b=JQw9Jre4WGVoFhPrB4Mx1eeQQVxC74KXLT1gwDKvtDzzaKUIehDSlxnjueYivFGqZRE+hg217gZTCPTSjvgb8E4G3ItsUc5SdnDCFWKywUCCo+MJ+w81SxBQ/fZCyiDVNxgrKM7JDlGjy38IcAJCxNTWq9qgvhHgWl7bae03gIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791134206; c=relaxed/simple;
	bh=bmE6DJq5mQYt8ACvF1ZIyWP9iLVRBzWtezcMwXt3IsY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sChE7yqfX9bU0i/17qAevmyfq9AAQufLaTv7BRZOUPuRdzVssWdAl4o9+MKiCgPyEnPvCBye0TNMo3xXOI4AXbeWJaO0JkkmTrWQM1R1nAeCs47h4i2WnvMxW3E7OWyUfNnCP/jaTf7YdLhaZSPUNgQfeoffLBaCzcfL5UfjKTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=zxAXwcy0; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="zxAXwcy0"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6ab006eb282so1375637a12.0
        for <linux-kselftest@vger.kernel.org>; Sun, 04 Oct 2026 10:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791134199; x=1791738999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TlaQzqtT4L/X0UVb7t9+uS9vqwfYnLXqmrlooszQDxo=;
        b=zxAXwcy08QW2QkJf7VIp31UHdQhVL68lgB0JEDGWR8QA7h8+7jE3REcLYMDKnYl6Q+
         RAutXssSpHHCf9kvoNGCMCvnGfeX4WsvnrLV/anvM1CSC5Qc9CVP+2208Also9XwOdr1
         tHFWcKmmNenZE+Owe3aFaSC6WFqdlZDRo3E5gCH3kxbsu5bEJ7qsrLCPML6IvXUvNi41
         mZMpcX595P5a2+Fg0bv6qEiNhmXK4TxfqlYdg4lI4epAgMOZ6Y80KzuNAVUFvLkrlbbz
         nIzZmJQQFaokpafRbamYcVTwNJA/CFHVjQTyl6HA9zLYAL2VVQnWXHMvlHDy0NDXDiz1
         +KTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134199; x=1791738999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TlaQzqtT4L/X0UVb7t9+uS9vqwfYnLXqmrlooszQDxo=;
        b=ARNgxqYE913yee1wk5e48IhFeKLbyNXoR/km/4HtUrcNISCPYtAFcTccP+bk243dGI
         YAQ+QbmBUcwcj6TeRXO9VCagsswduhjxSKhi26IQ8syCCOmJQd3Kp11mDAgq7ckZ2eIt
         5zx3Mgri8/O3ge6kYaQoJRGR/7mCCkua5aBgenYZ9hJ/CD9c8/2hy2x+pN2qicky6Cx7
         bDnv8+r9M5z5U+dn8LiYObAARVGuT31/oahShZ+A1Jq/P6eT/CXHn3j5WsvdP9MraMeA
         Q6lsGSFjhLlV9oCbGjxQh9EaIjsh+QRD/qcj5hAx1kfEbwfX/4yYMSIAy25D4XG2EBVg
         hBag==
X-Forwarded-Encrypted: i=1; AKwUvBz1hQaO6O0ta0MM9WGJwgNZ8qwPpC6C10kS90K86ApPNTCbdJFRYwH8R94h9248AlIZrIU6MOnmZvdVItcNVcU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcv9MzoSUxiBFeo5hZmPtAOJkj7+nn4+9QJlC0fKQPKqX/rgTs
	ivxIe3Fanat2bBSCBvEcOeOgYcGx/dW06mk/2VndZ7Lwn9yGFuEANWrHuBv25UOd3g==
X-Gm-Gg: AYBFou11G+Rn/yedDMPGjWFvBK3OsNaElnJowKRBjoaKOnbuW5iiGbWTm1bqPcO2oO+
	Mm4fZ0gWajXN6q3DsQuf0b595/i3q3tdK2gcb8rYnyQzIJ40OE3MDkDqNGLPMlSHofJMBOYFky0
	n2rf9TRvzOp5OQ/4Urzv7hMJ6autGpWJfvRXNJ1auGDi9vX5z8ozfUUJjSlltdYrLAeVaqLMEs8
	YPCpIqw9LiXDdqGfw9B7eSnOEqsYN69pjZZc7R+DNM61P5pWw+evRfPeSJkctZ/aeVX93RoTvVS
	geFPPnbdfpLOJ46S9rXcDkVcruD1XXY49z5qbQKMIbPiS5BQqzbT1awTyKkxccvNLnNE0Y7RBZR
	oekhXILHgoBarZAcFDghxpQoqoaooHMhKFjsN6U6ssHV11PtQCFRVHvMrvI1F/Vbchw9G3gfrSJ
	9exdFjuc3HtzvM76U/fvU7/R4//jlMJNesaKocNyQX301krIOSFxVekU7bayJqTFDuwsLX1Cb4r
	ZK7Try6xclpWJ3CP0KF9/rdLbwCdtpJYzp3+2rJHB8lynExSb+CUhlrdVFW2DBDpB7GzDg3avmv
	DmoAaJ8N1nNyxFpMZoqI5Tc8yDyMF2wQWrPYeA3PPnFqLcjzW3TU2qZD308M3MP2gUID+ndrcKo
	t8a5xBYxmCncE0KnQzoPVtqS17yw8emlEa+NvTGaz16Q+lnwhkmyrU+BjhpNEZspKYBt0G6XsHU
	ddTueihS2O/slqG5rEESMfcm8=
X-Received: by 2002:a05:6402:2709:b0:6af:a64f:bd44 with SMTP id 4fb4d7f45d1cf-6afada35853mr4633290a12.45.1791134198617;
        Sun, 04 Oct 2026 10:16:38 -0700 (PDT)
Received: from Desktop (pd9513667.dip0.t-ipconnect.de. [217.81.54.103])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb014784bsm2256819a12.3.2026.10.04.10.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:16:37 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: pablo@netfilter.org,
	fw@strlen.de
Cc: phil@nwl.cc,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH nf-next v3 0/3] netfilter: flowtable: carry a priority into the offload
Date: Sun,  4 Oct 2026 19:16:33 +0200
Message-ID: <20261004171636.3545085-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Packets forwarded by the flowtable skip the ruleset, so a priority set
with "meta priority set" before "flow add" is lost after the first
packets. Patch 2 stores skb->priority in the flow, applies it in the
software fast path and passes it to drivers as FLOW_ACTION_PRIORITY.
Patch 1 makes mlx5 ignore that action on flowtable flows, so flows it
offloads today stay offloaded. Patch 3 adds a selftest.

v2 review asked whether this should be a flowtable attribute instead.
A per-flow priority covers both one class per flowtable and a class
chosen per connection, with existing syntax:

  meta priority set 1:3 flow add @ft
  udp dport 5060 meta priority set 1:3 flow add @ft

An attribute needs one flowtable per class. nft rejects a device in
two flowtables of the same table with -EEXIST, so it also needs one
table per class. Pablo, is the per-flow approach fine with you?

mlx5 maintainers: patch 1 is needed before patch 2 and is meant to go
through nf-next; an Acked-by would allow that.

The selftest passes with the series, and its priority checks fail with
only patch 3 applied (QEMU, three runs). The mlx5, airoha and mtk
changes are compile-tested only; Lorenzo, a Tested-by on airoha would
be welcome. struct flow_offload grows by 8 bytes.

Changes in v3:
- new patch 1 for mlx5
- airoha uses the priority for its QoS queue (Lorenzo Bianconi)
- describe the tc flower effect and the TOS-derived priority
- rebased onto nf-next

v2: https://lore.kernel.org/netfilter-devel/20260902155136.4963-1-julius@bairaktaris.de/
v1: https://lore.kernel.org/netfilter-devel/20260901092632.369248-1-julius@bairaktaris.de/

Julius Bairaktaris (3):
  net/mlx5e: Ignore FLOW_ACTION_PRIORITY on flowtable offload
  netfilter: flowtable: carry a priority into the offload
  selftests: netfilter: nft_flowtable.sh: check the priority a flow
    carries

 Documentation/networking/nf_flowtable.rst     |   4 +-
 drivers/net/ethernet/airoha/airoha_ppe.c      |   3 +
 .../net/ethernet/mediatek/mtk_ppe_offload.c   |   1 +
 .../net/ethernet/mellanox/mlx5/core/Makefile  |   2 +-
 .../mellanox/mlx5/core/en/tc/act/act.c        |   1 +
 .../mellanox/mlx5/core/en/tc/act/act.h        |   1 +
 .../mellanox/mlx5/core/en/tc/act/prio.c       |  22 ++++
 include/net/netfilter/nf_flow_table.h         |   1 +
 net/netfilter/nf_flow_table_ip.c              |   6 +
 net/netfilter/nf_flow_table_offload.c         |  11 ++
 net/netfilter/nft_flow_offload.c              |   2 +
 .../selftests/net/netfilter/nft_flowtable.sh  | 110 ++++++++++++++++++
 12 files changed, 162 insertions(+), 2 deletions(-)
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/prio.c


base-commit: 87b80c2f6b05cad9f0ff9136709c62a0f59923e3
-- 
2.53.0

