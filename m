Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86793306B0A
	for <linux-kselftest@vger.kernel.org>; Sat,  1 Aug 2026 13:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785591779; cv=none; b=KUEPPXpNQlkm9VnEFVmRXhKIIhm6FI48Lon27bY0LLNFi9mExjB3H/3dzajyy/UZ8py5cTySEAq1veqSqLhuSKPi0ms0h66lD1Px7nKxXOZqpzaPWI9kvwmAamzxyBhQ4dSg+73T+MA1MMPDoGjQ3auhtO+AJU+B3afuTWKVX5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785591779; c=relaxed/simple;
	bh=7oZpUAI64myintFN5P3mwkl+kh7M5jFwqp1ttfu5Aas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cg0s4t6QVG6xFnwwqnbZNQ58PodEdP+kWox3p/DGVDHYZr93a2IAunsJAP/lDgTGZ+CHWNOUvKUpUmDH+uFezv+igIwTucTEQB6LRiqLSFTDJww9sm32+DNl9mDClw2SvMWBMv4vZlR/739YqT6/rgeqw+NwihYovAL1KX9NwZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dWpjD7HN; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dWpjD7HN"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ceb096e675so23341445ad.0
        for <linux-kselftest@vger.kernel.org>; Sat, 01 Aug 2026 06:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785591778; x=1786196578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jtGDI9BCziEtTlla0MY6NVjGHkp8vq0UbFBjp9Cujkk=;
        b=dWpjD7HNEUS3q0o+pKmD79/04YOGK9ebHoZXUjasDJSpgpQM1BkoMCuSsAMGE2nI/R
         rHlLE8XIo45hjEZZi85226sCnLwtW994EwTrFiwo1+L8z/oZlMI/KPM+hokBqOSFjzyV
         svvfennsuKReqPsmKZwGk/5i9dD0kbCAMGbbcMuOLx+E/cV8BIa0UwzoxARHE5qu+2z3
         HWk71kVKIkihGoGjYV+DvkvnjG7PvtJSKphcO2ae71W6JX8crMeSEA+9GGcHYsgccc+9
         sKI7N3geCA1YfLj3boAQvlSwopAf7p658lYFqcUPCJ9m/5N1sxQmb4bADSQALydIX/kP
         QU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785591778; x=1786196578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jtGDI9BCziEtTlla0MY6NVjGHkp8vq0UbFBjp9Cujkk=;
        b=V+WZm10qAifck6eG7DcVsCM5tYkcixheFpI7/7rZmbmsNIlEXqmiO+iY4TXwYsIL9T
         2QLUfB9dr6ad1myYWF21Pxl3VD2uqV6VlEUBGBW5LL/uQpoSS/k1GwNGaAhRJsvH8yQ9
         heTJLQdQ58M7yLWSJqMkTozQHjEgTjBKkV+w8QYKnyfsNLwPAhmTKvScQxlAr5YQkl2O
         kr1uXp8a9qhdRW6EkLGucrXSbyGftGNj21+jNlKQQ8tUkcl31XCa8JIfdXeLl7qKHsgI
         A0n9av1vRTm1P3Vy3bzT+66kwZEldlZU90WN1IstFUbZTYvn0s0+HctAWjlSmrYOr7M1
         Jg6A==
X-Forwarded-Encrypted: i=1; AHgh+Ro/gOUK6WyA6rW6HWomtFB+Tj7hpLvJ7rliFqB0phGNQk7Pbkt6SgVo2RCFwPgf/Sjpv3fIeDMwsUJG7SjQqkM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAe4mWL0k2VBMHtq1c5n9sL13FkB4+Zd9x7lHL4p+JIFfxJZMk
	EopNIbS+x5hn0gluEznSMF13GPM9H3oS7HKB3EHDqAHvmnzTTVle39a0
X-Gm-Gg: AR+sD13sfcGFMXbP2rx9DNbugRkVmrXJixuZzVufhO533ydS82LQXl3uUHUAFbd6Z5c
	5xfjbvSd7aPiG7uDCpu3TH6b4bxMuU7KtPEwo+xq8qUprJa4/VkcVc4kdW+E2T7Q7gZIwEpy1EY
	rinv5jqkw7K4iP5Jl3IbumfmPatt5zeOciILFimm8S2d8rm5ivVm1lZ8QMkSSMr1a4M+QEe0YyA
	fseDqG2ThzZtdEri0mOFXfi8JVmdBaK+vOkkMPZqmp7+POJ4m8RrrGNX89GCN17+jtyFu3lxoqc
	1OJbm9p4L6nJF99Sz/aYBfGUzDNc9pnhs/8L8gRH9dd9LpQqAMBlW4bi3PcbCNdBan8ycRaJkdZ
	D53nTnlhwCyHiRgK8He+eqfmaNt4d9pLAJV6wV+W357skXoOg8e/WT7/y5hB1cHkkFiGvnMaJGr
	Z1mdDsCEp2MGEPW70DexNHLxedXtJ2pn8CjuRKkVvIpuzI+AxOeHB1oDVitNmGIIV47CGlw5Gbb
	JPJ
X-Received: by 2002:a05:6a21:510:b0:398:7ed3:a001 with SMTP id adf61e73a8af0-3c92a543d1dmr3175828637.2.1785591777858;
        Sat, 01 Aug 2026 06:42:57 -0700 (PDT)
Received: from enjou-Legion-Y7000P-2019 ([165.232.167.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm16077652eec.1.2026.08.01.06.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 06:42:57 -0700 (PDT)
From: Ren Wei <enjou1224z@gmail.com>
To: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	vega@nebusec.ai,
	milkory@outlook.com,
	enjou1224z@gmail.com
Subject: [PATCH net v2 1/2] net/sched: reject overly deep qdisc hierarchies
Date: Sat,  1 Aug 2026 21:42:33 +0800
Message-ID: <1e9ab39597423fd5d13cfaaf52279b8ee3d9fc3c.1785434373.git.milkory@outlook.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1785434373.git.milkory@outlook.com>
References: <cover.1785434373.git.milkory@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zijie Huang <milkory@outlook.com>

Deep qdisc hierarchies can lead to excessive recursion in qdisc tree
walkers and exhaust the kernel stack. The existing loop check does not
cover the create-and-graft path, so a hierarchy can still be extended by
creating a new child qdisc below an already deep parent.

Store the hierarchy depth in struct Qdisc and update it when qdiscs are
grafted. Reject new child qdiscs once the parent is already at the maximum
allowed depth.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Assisted-by: Codex:gpt-5.4
Signed-off-by: Zijie Huang <milkory@outlook.com>
Signed-off-by: Ren Wei <enjou1224z@gmail.com>
---
changes in v2:
  - Store the qdisc hierarchy depth in struct Qdisc and update it from
    qdisc_graft(), instead of walking the parent chain.
  - Move the depth check to qdisc_graft() so it is applied at the actual
    attach point.
  - Add tdc tests for the maximum allowed depth and rejection above it.
  - v1 Link: https://lore.kernel.org/all/cover.1785304107.git.milkory@outlook.com/


 include/net/sch_generic.h | 1 +
 net/sched/sch_api.c       | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/net/sch_generic.h b/include/net/sch_generic.h
index 45a1e8c78222..cbc248776511 100644
--- a/include/net/sch_generic.h
+++ b/include/net/sch_generic.h
@@ -99,6 +99,7 @@ struct Qdisc {
 	struct hlist_node       hash;
 	u32			handle;
 	u32			parent;
+	int			depth;
 
 	struct netdev_queue	*dev_queue;
 
diff --git a/net/sched/sch_api.c b/net/sched/sch_api.c
index 668bcd60d183..65b35528d125 100644
--- a/net/sched/sch_api.c
+++ b/net/sched/sch_api.c
@@ -1114,6 +1114,9 @@ static int qdisc_graft(struct net_device *dev, struct Qdisc *parent,
 		unsigned int i, num_q, ingress;
 		struct netdev_queue *dev_queue;
 
+		if (new)
+			new->depth = 0;
+
 		ingress = 0;
 		num_q = dev->num_tx_queues;
 		if ((q && q->flags & TCQ_F_INGRESS) ||
@@ -1211,9 +1214,15 @@ static int qdisc_graft(struct net_device *dev, struct Qdisc *parent,
 			NL_SET_ERR_MSG(extack, "STAB not supported on a non root");
 			return -EINVAL;
 		}
+		if (new && parent->depth >= 7) {
+			NL_SET_ERR_MSG(extack, "Qdisc hierarchy is too deep");
+			return -E2BIG;
+		}
 		err = cops->graft(parent, cl, new, &old, extack);
 		if (err)
 			return err;
+		if (new)
+			new->depth = parent->depth + 1;
 		notify_and_destroy(net, skb, n, classid, old, new, extack);
 	}
 	return 0;
-- 
2.47.2

