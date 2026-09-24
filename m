Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB8D31715A
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 01:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790212568; cv=none; b=Fwc0khQsAq1KVV1heuAXyzwnHGsOstxGCAVlgKgYSK6sBKHlS6SoLpDYFAti7elb2H/SMkxMbr0U6g6n4ZYbiCT9SM1lTIBvFlz9913debRH5HRbFsml24h1Plaagn4eZGikym5FRVWWA4qG33LtVq7PvxTylmuVrQP1FtQMOtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790212568; c=relaxed/simple;
	bh=J8Mf3HYZaTmZYQFkYELALEytTws8uvz/goY09yFk2pM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qOOEDrS9PdlA9UysT0JjAGFOqYg40ZulhGuCzq59ViLDZpc2qI0/gRtR/WlQx94nXtajZPllixYHS3U7GLzB2lJa9o/zm8SgRNhAg7fCDraKR1AHeajkIR+7ud54jdpcAmMZHy3w5cEZbfqP/ffK0QxarQQVTmqzL3zmFAUiwGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cyEk4hV2; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cyEk4hV2"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so821281a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 18:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790212566; x=1790817366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pGK4SZ365cD9EYRGUuPJEEEIN0V6+rF/hbiJa0/JQok=;
        b=cyEk4hV2qa0spkaYxZIwWESxomqDUjloyvE8GAcfU41Z8AUznq1Hl+VDkFSm39LFL4
         rxfs1vL5qdDWAO2QoZ4HWLWkJZSgAnFVjaGm+1BwuY9qZGT9f2A5kfA0qddxuWsAf0tj
         q67joE6K64mWvH8pNJt+HxNpxMuMEAN+VgYDkKSVJqhEDm3g0ohC5YFzTz1tkTU8AWlG
         l6vbOiwuZIcA1pvKFVxY5meBQq+60W+b7TIyFihz1pMCKqNGYTNvjmiTlsUEtzCnDUpX
         kN2ud4IkGIS01HC7v/5IWOfYxuLXrVxLcUVapCs/Cm9yd5KrEhtI+1G0vgsFlNIHqoEF
         pGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790212566; x=1790817366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pGK4SZ365cD9EYRGUuPJEEEIN0V6+rF/hbiJa0/JQok=;
        b=Crfdf1ThBgL63XYUmOy6a84KIAEioTv0jqyKTcAYO8XK4aZHqtH4kw+jgzOaPG+NfW
         BQsfRL8uCtOM8MzWANr8x5giDEV4fLRvmEE531qcE4yRGPyZgdOXc91/tOwN7C4jSXkf
         Xh/aqtrRlkr5VvdWOAO8x+Ck6vv06fCPj8JbmCs/n1MY9FsVZPhBNXLpHZBshkWttJmB
         Ye2BQYWgtaQ1qG48du2xWgbacZAhnHLriJD6XRFFUfSUX9YMgJlCjHBVv0zZWboH30lB
         h0ZveL+SvrqTcJ73bSlkHPmEllfngS6QaIAMS/mxNfQwbNadqMDysEyk2ADcypitPAiJ
         f1Fw==
X-Forwarded-Encrypted: i=1; AKwUvBzYx9JbGwhH589qmwRk+9UC7ejVCsLcVw5Rtne42lgJA/GWEy6L5LwzfrbpgiM27BbNVlVrdGvjkSMZaU9RLKE=@vger.kernel.org
X-Gm-Message-State: AFuF++kIxkgeWGt/J9LfWaTWTH9GHhAn2AMnLphoKJRkJmNHCC+hP122
	kyaCVUmS9Ovs3T65l7vbY0k/yH+9j3R/E3ZG1Yz/KqmCeKd5Sp9fYc2P
X-Gm-Gg: AYBFou08ctcHtakYcBbKDr6KD7nppq0aJ18yW8W6G2TtG9xe8addkWcBcVkcKHzxIHY
	SEIW0Oih4hlwQjwjn3WS+2FpXw5M9ia21jFlrK7NwmMSM4xJekVEXBQUXTpDUS4v6ZpD7bdQkYQ
	td12qkvgolWHNXaqI3tjJw2UlSuNyuspwMhUa1KQhBof7+xT1bnVxwwvAI5nKTiHaVOzxLwByEE
	4mokdPQNxmUYPE+g5WZKQDG2Rw4L69uL3XDoo8B2cI9nZKkJVAZe986vBSILUq7DcCzwBBIOeA2
	GTirWKdYJjnuqoLMPArOvoysQfxnlP802l1WrOiUVZ/IlNKA0PvlmGtJzcYXSltTRH2lOfkNFfc
	QOJG7vGFva2VoRjkvClBh/tVlwbtUPFa+Tbut8/2BNiRcGjGg0iSRHOygpBubF/r2kJO+7OmQ2J
	BrCRnFOFDUn12pk757W23xBxq5GFRGaF+dpME2b0UZJYOuVB4Jpt6JPgmfgilZUpu88PNkbTsr8
	dgEP04aBYVkSP79iGjvUbWjjlwd+fE6/xAeJ1aDeXbth1psfwoJWKSg8oBLhCPom4QavUU0bq6F
	EuSHJRGkNSI=
X-Received: by 2002:a05:6a20:160c:b0:3dd:a196:3098 with SMTP id adf61e73a8af0-3de0e976432mr797444637.72.1790212566305;
        Wed, 23 Sep 2026 18:16:06 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan (oki-109-236-14-10.jptransit.net. [109.236.14.10])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3d5794sm1741392a12.14.2026.09.23.18.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 18:16:05 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Willem de Bruijn <willemb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v7 1/5] netlink: specs: rt-addr: fix the type of target-netnsid
Date: Thu, 24 Sep 2026 10:15:50 +0900
Message-ID: <20260924011554.3494-2-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924011554.3494-1-sigefriedhyy@gmail.com>
References: <20260924011554.3494-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel parses IFA_TARGET_NETNSID as NLA_S32 and rt-link.yaml
declares its target-netnsid as s32, but rt-addr.yaml has it as binary.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
---
 Documentation/netlink/specs/rt-addr.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/netlink/specs/rt-addr.yaml b/Documentation/netlink/specs/rt-addr.yaml
index 0ecbd24c890c..17ead2203451 100644
--- a/Documentation/netlink/specs/rt-addr.yaml
+++ b/Documentation/netlink/specs/rt-addr.yaml
@@ -119,7 +119,7 @@ attribute-sets:
         type: u32
       -
         name: target-netnsid
-        type: binary
+        type: s32
       -
         name: proto
         type: u8
-- 
2.43.0

