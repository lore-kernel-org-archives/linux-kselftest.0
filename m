Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8453737BE66
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 01:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780450676; cv=none; b=fUQ/ljhxrvDpdRD+pnsAxQ8Lhm8BbfTxHD6+4xBXx0qJrFzYzpzShxV7/WYh6cr5Ym9j04jgxs5X3q8Dp7o6cV8r1/MUYzGkQZffEvRUctSQRwSexZiY/CAw+/hjCJbxC0OcxECrF/1S0dPKeoJCB+smCr0XkuHc4Hh005xa3kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780450676; c=relaxed/simple;
	bh=rkHcjsPkRR9nNSHxR46h2y9fTpo1dvARrrbdvhIHj/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ujmbC7SGRZFFu45Wav8VGuE2zozlb6JnGdm64A+6w6RZ6D03OTIH069JKO1DnQJdiLpsT4ySgVabNPCP9NcP/CJFPodLx3rJViA0/iX7paJr06YKqrPuWOxE2bdXOZboUDU1aeXA1TZdhzjSVnPq+IrZxJKO5NKIH51rp1wDcjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yh2xw/Ap; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yh2xw/Ap"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c85ba774551so1058292a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 18:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780450674; x=1781055474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p8Jk1ivLmwr3VP3ike29F6VRWUYvoG1CiSF1zOqSE6U=;
        b=Yh2xw/ApLaK4resB94WFblQ/eikImAqAuEOp587sPYEjBTK4UnO2fyTABGxs9vVMVa
         YlO5fNbOjoOzB8HVXiXp4i9oJy6lJGQC0TALrfM6YF7pdsM51eVafuBoJ99u5ftiDUSo
         dMumZFMS/lxO1XQym3Fqp0C4JXTOWB2/4FUHaOLEnZTJBURSYp2UurXGdiHVwS7l9l2n
         MEmwJNMR4wKEHDIZdv1h6+EYcDH+X9rcw85hfW/4M8h+j19JZDDWoKE5VvTVlfpvv6kE
         NSIqD3ndYoGxbaYRDTXz9iiXTiRW/JruO9A3QE6Vo+48QhAVmIYEvLjxM2jd7f1SCRxA
         MpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780450674; x=1781055474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p8Jk1ivLmwr3VP3ike29F6VRWUYvoG1CiSF1zOqSE6U=;
        b=UxO+JBY0gkkeY89S2lAn11t9XMIEWWvz0ZMffoF/R3SCwo1BchUZ1hEUn8r3yfSusm
         oCHUH3I7x4ACa9yCIOjR86PMWhM1ekf+9hUprLmBV5m/DN2j0WdiUNtI1nXd42cCuTR4
         tV9P8UEkSewsucKTAM1Dp2QKNZU5VUn0C26BSk1wnOP/dzol7fKZpvfaQsijNeb3a4S2
         Mm95WL615RM9NNKYFAwKKOw3k8fduyFHkkuEFk5QGK0ggrnW/1kJQXl0BMdFh9L12ctV
         RRvqnSzNKkh2m6GSL3XlTZ3cRUeG9pZlyRdeT45yms2NjIZ/0okbOzsyPCGkyk2nfil5
         nMbg==
X-Forwarded-Encrypted: i=1; AFNElJ8xTWr2s754ydmqoN+p3h8nGukVIlY/eB4BV4/bPUzumFM1BZ/4FlYSHRDuJyafDsEGcs5AMISnL7hjCY8I3ok=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1vJjAGYZqQQjsN0LrkfZAYiQzHbZ/Up62V4rC9zFeclOvnTkU
	8nOJVh+g8PFmZWE/e7eLKd3KOrkCFBOy3AmjXhrgROMfGOlHd4B6GOV9
X-Gm-Gg: Acq92OEslRuedx0hBIBT1M5WDIdMlJ7zGq2XZROu6+HQnWKewtkL7JBC6okLGtDDQZK
	DJMdLA5TtMZi3WMP1r51AI10KMMwjrqNr4pLs40fFGve1jGeXOqLvI54+kGf8Eq4hLZSXZdPihL
	kcPsqeY7miuyGzAfOejdVSzPon7I8cOWf7Cnc0PvH8vAFcSEhkEHyLqRXS7bqqz9HNZqSgqh7uM
	P77XBAgbmuNnL1iktabLk59fujzc3DMg6i5it5lPPxo9XeQgVy6Isia2qPWfXGWzT2LStxb9tM3
	LXJ92dAz+vfT3KhGLYMK249ES4/DWMJFJ84dBpZ2hGNSOAj5W5QoTK49YLX6heH+hjOP308H5ng
	l3dt17T2d0gp2/r4Hbmyyg/2DU+mX191jLBwBS/uG/+LgQDkhQku3mUHJWuBsivfS04gfK00eQX
	NHy+5CPmcw2qVXoUPj0YqTeyLzvNrtlo1kTtlQKAl0
X-Received: by 2002:a05:6a20:c79a:b0:38d:fad1:cf2a with SMTP id adf61e73a8af0-3b4973af276mr1426953637.13.1780450673809;
        Tue, 02 Jun 2026 18:37:53 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:50::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df043216sm525522a12.10.2026.06.02.18.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 18:37:53 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Tue, 02 Jun 2026 18:37:31 -0700
Subject: [PATCH net-next v2 1/2] net: devmem: allow bind-rx from non-init
 user namespaces
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-nl-prov-v2-1-ad721142c641@meta.com>
References: <20260602-nl-prov-v2-0-ad721142c641@meta.com>
In-Reply-To: <20260602-nl-prov-v2-0-ad721142c641@meta.com>
To: Donald Hunter <donald.hunter@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Stanislav Fomichev <sdf@fomichev.me>, 
 Mina Almasry <almasrymina@google.com>, daniel@iogearbox.net, 
 matttbe@kernel.org, petrm@nvidia.com, dw@davidwei.uk, 
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

