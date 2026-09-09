Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B34D492E2A
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 01:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788917677; cv=none; b=bEJINTIZxePnT0TqpVYyusAMPmFgh+oi2daRxhMYjg7s+J02eSswg25a8Yog1co1bRPQ+rcf86tmPAi2NZwHdw5n6JvO8/3rzhIEe4hfe6NNoyHO9Q/IxLjg7f4lOb11MQtCkw9GSiNnJ/V4bb3Oo6ZLNUBiv0NdezYi72nwca4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788917677; c=relaxed/simple;
	bh=2zQvRUscIgNiPZoEjC1Z5mtgLCeG0uKE2CLDirOMMRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=etKlj6hlJHlPSnBVuW0haSqs4poE86phLNt8AXvo9yhXI/G0QL/YoaCHDOk1cKUJoAQl0xUHxZX2hyQFs50WLXV7AiYjyvNFX1QWhS52fuJpDEr9TjCijBHuLT8DTixIQvWvOMk4U74UgwTPNKxUfpbnL+pIOVU8J2Be1s8vy84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBS31s1f; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBS31s1f"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2dcff8f44f2so1450655ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 18:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788917675; x=1789522475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=263Ot5CK8k8W50+c/iZQZai2Z4LPXqFiKiK4/FLJICs=;
        b=FBS31s1fgnJFehFVpftohOqC8/T3k5VLMTm73STjTooWd9FTe87YiML5RgMrY6u0di
         cQ97LwM7PaK5hg7h7enhSG8sbrGWhiZ+gLX324Fif/lLq/rw9FPaKiXHfUhYXBkTreIM
         zN+XtQJb1NqSWNG3ZWsIZ0N6soAKXpx1e5Lic0q9ymCeSKN4Z96AhjT0aYmDp8YtYC4t
         hUqZ49dLeJh/SAc0Xzy1xbQhCvW8ok+eq5ou4+ogB2FtewnYuFV7keCR7OFuNo6M4Ban
         dlVFUgjyydQUO0QGJRjfh4yhaxjAa/kAToXkLomPm9MnZ6YzNDbtFkETUhC++SMnJ/Ei
         9ztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788917675; x=1789522475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=263Ot5CK8k8W50+c/iZQZai2Z4LPXqFiKiK4/FLJICs=;
        b=WoDDd/9fHdv7aTMvdhYzvgsMFJRT6gLscD1t9ZBvhFp9Qw38Wd69WulOystFH2Ovlq
         YbCVf/eC0O+x/S3dzFfQNqzEuGuf20DRCCQciryAY7hOlDR7YHMhKXYoCRSTF2MC5U9j
         i5Lo+fNE0RQ7rdEs8i1Ie0OUp90/A/3NIYHtYrrwxOjfGepjjcbAWW3T5TDK3/Z1uvvT
         D+E5aCncOAk0BNFerHbeDHSyiO16Y7mDSu6ZkPFmmNQJdvzzZSGSgrhZI7+cm3BoAPsq
         +ncwN5xP5W7LRn8LLr1hSf5obkU574hUzOGrG/8b0u1Lu+mA3hOth52vGiQJtUtzDN7A
         CTfg==
X-Forwarded-Encrypted: i=1; AKwUvBw8ZFGeiSUY/eZiNLD7HdKUKyfh4hCYYJo4v5RmvNpPAb5ZIGRe5BNPtN6TeGU6HcewM/dsfNdv9bXr69wLCXk=@vger.kernel.org
X-Gm-Message-State: AFuF++kxaBlUWetOWWZk88Vs8f43MGesJlu9qQjGXwz4CS1ME8qr5Stj
	guC5+VFE7/DvLsRuDmDmXO3/+S3Z0oJwbA+Lq8BR3Qxz+OmBNuzJ+iNo
X-Gm-Gg: AYBFou3jFBAxpb0+1tlC/jG91iBGPOp4plFjGS1loMHudhdJnjfntH0lZrqKob1VED7
	1D4sTDlFM8UgkwXmKz6Ny0myYVMYEPKJRq4cpMuMg12imtOIg1gPDQBRupv0KBNMFg1/g096wtM
	2u3+KDk3Q7Q+zR+lmKzoXp3YqymOFltpP/oCSOT+rT2cY1DeQIXhIqI+4VlQ+mQ2vYhN+i37rfi
	Hf8OrIHEVquD46wXtzJAY20G8ItbA+kMK/fV8sbMicZlRzn0n6tnMrGlH5f48jH6X20LyZhlsEl
	p8+Herw+YULa9LZAUSRmuNccBkczlzn2O2LAqNHnQ0iog1uWFx4xO1XuNQOhoCBKduNaA6FwzVg
	ZD9vVguMRJFD//226RrEbNfcBLnxtxGH0QqaTDsOsrjgT2PQlNeJkf80f6WaLx3fg9cUt7UTk6Y
	LXbiIMS7AwMVh4N8iZpjRBuTBRahdb//iHG+cgt46i+QPLgXDbai6H8sIhgPkOS7/zl/dAwuNw5
	q5/COKtvZfVdoetmCkT/jLStLij+T1g0EOpTwvK3/tPCyMdwIGAvvWBqM1BeQ==
X-Received: by 2002:a17:903:3b54:b0:2ca:d91d:d3a7 with SMTP id d9443c01a7336-2db127c02a1mr331886045ad.10.1788917675355;
        Tue, 08 Sep 2026 18:34:35 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:574b:e1a5:307b:15c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db63c00837sm27975145ad.40.2026.09.08.18.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 18:34:34 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v2 2/3] netlink: specs: rt-addr: document AF_PACKET multicast dumps
Date: Wed,  9 Sep 2026 10:34:00 +0900
Message-ID: <20260909013401.14408-3-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909013401.14408-1-sigefriedhyy@gmail.com>
References: <20260909013401.14408-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mention that ifa-family AF_PACKET dumps link-layer multicast addresses
and what the permanent flag means for them.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 Documentation/netlink/specs/rt-addr.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/netlink/specs/rt-addr.yaml b/Documentation/netlink/specs/rt-addr.yaml
index 0ecbd24c890c..2a2310cb0df0 100644
--- a/Documentation/netlink/specs/rt-addr.yaml
+++ b/Documentation/netlink/specs/rt-addr.yaml
@@ -168,7 +168,12 @@ operations:
           attributes: *ifaddr-all
     -
       name: getmulticast
-      doc: Get / dump IPv4/IPv6 multicast addresses.
+      doc: |
+        Get / dump multicast addresses. ifa-family selects the address
+        family: AF_INET or AF_INET6 for the IP multicast groups joined on
+        a device, AF_PACKET for the link-layer multicast addresses in the
+        device filter. Link-layer entries added with SIOCADDMULTI are
+        reported with the permanent flag set.
       attribute-set: addr-attrs
       fixed-header: ifaddrmsg
       do:
-- 
2.43.0

