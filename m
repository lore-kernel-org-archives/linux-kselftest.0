Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D1B363C6B
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 19:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780341880; cv=none; b=UsvBImG7byaDKRd4ejkD0kKG4l1Zzw3TozSv8/my4+BVWeQZBJQWYU3KM11JHFLMu/VSsmZgNDTuhn1YJLC8iuuOsQdKdAGgBkV8eTDs03YTpNdDyOHtGw1uAW7ZCYG8i4leJY6eJHBX1HhBRmjL8ApM1+dVeuc1HhpqVtoo2Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780341880; c=relaxed/simple;
	bh=rkHcjsPkRR9nNSHxR46h2y9fTpo1dvARrrbdvhIHj/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mLIXsxLMys4MD9lkJAnc/MIsuh9C/4CUqXA3xnVhUGYuqYpX0MopiPrdvVLlIzh7Bq+J9fvW4Vwc5c3y7UgsC4tdgIbkG57PCrLN0jjRJq5z9uDdyQEJsx+vYphocTBBOvLBGcTgFElqnXEk9R6IgjBGyD7iYjpb5KK9pxST/yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ky3hS9Aq; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ky3hS9Aq"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0bd02d97eso20828865ad.2
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 12:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780341878; x=1780946678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p8Jk1ivLmwr3VP3ike29F6VRWUYvoG1CiSF1zOqSE6U=;
        b=Ky3hS9AqHXRSJRKrQavLc3UCZYwr7npEDXG78lJeKbVx8lKsMxgYDvOwjHHukeehgo
         atSxmGiMrF71OcGGX32O6CAIlV9eo5Yk+lbACPC70YvKqcO3Rqdvhh3oKoaeYUmu7jbE
         V4Q6AEMfpp9ac0lN46yEntowvNO9NM9rJJGIY75VWjNn6lvjI+RtKQIE5wOfMOzkhegh
         HPxQN6/+KLkA/ABBiPEecPTnDGsaMRsJZMlJtwCr+pM8LiXTjD1xdXBECB+++LiwBpbA
         neFlcoSwXK/0hcPuoY9BZJDKUSoXW/g1T9/wiBECs4LbnlqW3MF0Qd30SYZ2XoQOOx8P
         SL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780341878; x=1780946678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p8Jk1ivLmwr3VP3ike29F6VRWUYvoG1CiSF1zOqSE6U=;
        b=p0RQtuh9PmyGbJ6wBpTesh+1ZQJVdEaweIiweG8U6lUGBIKpGK+phiVZ+ZvgGi8arM
         a4eSN/glYQqA9HbhyDvttcxqRnJlgijvmuCsUcRP7d9+iQuZk+DqZ8T4Nr2yox3qEaV8
         XkaK/8vF030cvVuyFncRv9YQDrT6EmeiLXzyFe2hiOh7NjJSe9IkyJyDujPEqqf6Vd9V
         nTHBU5N77fqZ5ux3E4ZXDSHe7UP/skDt5mysVIC9teGlhR+9YNzPZ/5g1sq+W6FSlqZ+
         QZeX8UpG6EeFHV6czFSmz/P9ZVcIz1NEARjolASElnNVtyuIvCDUR8Et2vl9atC+WwWY
         LI6g==
X-Forwarded-Encrypted: i=1; AFNElJ964A5baVALIKFCJ0FFkAR7qzGfPnhIg7pvh6vEWntGXCHsmHIDgMtxhoAshMWIALb6yFiesUFiwgfsQbTKJBI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw00aIK/FRQHnjklyVWxvStrp1aZrAiLUwnAAYNT6ALpsJPQ+gy
	JQ2X5ycWBsh1Bx//OTB8UktQavJZDmE2fCP1cpickV8qc2N+r/9Ykmlu
X-Gm-Gg: Acq92OG4PNQf5I7Q4TGvUi+tdZQlTnYcqNALO6ydghHx0mihxrLMRMfK++wS4nGySJU
	DFKHgxyhlROMtccd94BlFZj/KdLkeK7ao9LnIrCbt34ovq4aRLfo25FN+erklSJ3EFBw0G/fQnG
	Yvg5DIWPEw+Qhv9rkfDZgkNL8Dbs8fw8AGYBYAl6w3BBzJ0Cv5ccAj3LSQR4jfQFW8gRplLx+LT
	zSo4LVC8ZCtf63Lq8C+VerLU64cAaL2KtDopWXVUfNggKnJkp6ZH0P3rF+rTyCxPKaCbt7UTmkC
	jEpcJty5WhutcsNTSd6SNngRAhd+/sOLctncXOXtSxq2DTXmDqKdbTuQpbwMQP/kkcpYvkrhOVd
	0AlBnoNMY4GhqdKUpcghTFhFpmAJ1NvDkdtw7qaxOEfoeVGJ7KBw9uQd2F2+abSfq+2KejKW/Ez
	VXXsRhuNadVgCCmmCUUYopOlrrrY8bBw==
X-Received: by 2002:a17:903:8c8:b0:2bc:eea4:83c3 with SMTP id d9443c01a7336-2bf368334b0mr136497405ad.25.1780341877857;
        Mon, 01 Jun 2026 12:24:37 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:41::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a2dbfbsm113520295ad.37.2026.06.01.12.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 12:24:37 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Mon, 01 Jun 2026 12:24:27 -0700
Subject: [PATCH net-next 1/2] net: devmem: allow bind-rx from non-init user
 namespaces
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-nl-prov-v1-1-9bc57d6ca3f3@meta.com>
References: <20260601-nl-prov-v1-0-9bc57d6ca3f3@meta.com>
In-Reply-To: <20260601-nl-prov-v1-0-9bc57d6ca3f3@meta.com>
To: Donald Hunter <donald.hunter@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Stanislav Fomichev <sdf@fomichev.me>, 
 Mina Almasry <almasrymina@google.com>, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

NETDEV_CMD_BIND_RX is currently GENL_ADMIN_PERM, which checks
CAP_NET_ADMIN against init userns. With recent container/netkit/ns
support for devmem, other userns/netns use cases come online and require
bind-rx to allow CAP_NET_ADMIN in non-init user ns as well.

Switch the flag to GENL_UNS_ADMIN_PERM to allow bind-rx for
CAP_NET_ADMIN in the netns's owning userns as well.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 Documentation/netlink/specs/netdev.yaml | 2 +-
 net/core/netdev-genl-gen.c              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/netlink/specs/netdev.yaml b/Documentation/netlink/specs/netdev.yaml
index a1f4c5a561e9..49862b666d7d 100644
--- a/Documentation/netlink/specs/netdev.yaml
+++ b/Documentation/netlink/specs/netdev.yaml
@@ -798,7 +798,7 @@ operations:
       name: bind-rx
       doc: Bind dmabuf to netdev
       attribute-set: dmabuf
-      flags: [admin-perm]
+      flags: [uns-admin-perm]
       do:
         request:
           attributes:
diff --git a/net/core/netdev-genl-gen.c b/net/core/netdev-genl-gen.c
index c7e138bfe345..d18c89b5a6c7 100644
--- a/net/core/netdev-genl-gen.c
+++ b/net/core/netdev-genl-gen.c
@@ -220,7 +220,7 @@ static const struct genl_split_ops netdev_nl_ops[] = {
 		.doit		= netdev_nl_bind_rx_doit,
 		.policy		= netdev_bind_rx_nl_policy,
 		.maxattr	= NETDEV_A_DMABUF_FD,
-		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
+		.flags		= GENL_UNS_ADMIN_PERM | GENL_CMD_CAP_DO,
 	},
 	{
 		.cmd		= NETDEV_CMD_NAPI_SET,

-- 
2.53.0-Meta

