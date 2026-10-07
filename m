Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1836490BF4
	for <linux-kselftest@vger.kernel.org>; Wed,  7 Oct 2026 11:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374331; cv=none; b=pZdwogamFBkWEXQkfIG3tckP2X4Rxt0HFQIdB2uSqLd/Cq0BvuKvuGqhg//0Hy29+GhJJExeyQsclOWV0HAOy+XuDNmcqle9MDuokTcNFUo6+II5NI2k4nTNMvCzx99RZIDOpMW2Azma1/Cb8Ap2MoBPE2hXHsra3pC7mWy4ZSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374331; c=relaxed/simple;
	bh=s7RHTsXfEOg+gwqThuTUUiknVQDtwJu49s4s8eAwliU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jbT7WHfHMKZGRl2RWw1k1Gkdn/ZQcjsMTT7ygTlkhvusi9//B5SSC7nlpmKp51BrehXVY5B+4vF6K9+zG1063YjyRFnIhrOFNpcByhyeW9WcispEzbbLst5XU6i9JF6NGB+eJO4tBhTFML6cK741uuNe3vLuN7V+DqtYtVKMaeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SIzPxpTI; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SIzPxpTI"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so1638822a91.0
        for <linux-kselftest@vger.kernel.org>; Wed, 07 Oct 2026 04:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791374319; x=1791979119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IEgFM2qnyZ26U72V739p3+vOc5ZxhizwkmlzBdho0QE=;
        b=SIzPxpTIhtpspFxN5a67mVTrA/+OHpoJoUQTDH/zBZoeC5U/NCOzsR7FHRHKdWrhXt
         +A57W8WxQAZQbtAgcdGCV5fgz9v8/LjRSldDsf3x3hQd9Ww0FdVvz7h2oyKt/Hj97FlO
         JudV/Jduycabm0zwjatpQjw5PaSPTrCcoDZxvEFArkGDT5AusE2yOAw2YtdgN9DR61fC
         iXHzK80TjLPgV7gJQGS7GjCWxtobW8F4d3pqWUZZSvZwayLpbi0aVY0CBFMgeLajxuMc
         sgPzx0HQfw0xIwrimjvgyj+owx8LhkGzwg7a0yD1Rb+OLvsnTi17E8xKaapDaqtFRarf
         AESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791374319; x=1791979119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IEgFM2qnyZ26U72V739p3+vOc5ZxhizwkmlzBdho0QE=;
        b=a9RRdp1fLU4pLsgeaw289f2sd5TPF3RuualOeMtb016GrVTHEosn59vt8qjLhSvTvp
         NGnL78CaQVF7o1Z0y6527zrtQ5RJcP2+Q9rg5bhqlPuUMZscmpLBlhnxJvmYYwUQoDTT
         DiMwlqPZT1ulRniewGuqipC6mBRsmRRSHtwdW39SzdObCx7TR/iZmbdmcp1Naa4DsLjt
         gt9RpuGxxeLsWk2WL+54C+uHVNUfnI132N/UcAZGp8gALw1NhovWJ1BU/2iCJk3ijeTO
         JXbRZbkK5HOchmznKiT88bCbOOw0OuTys7LuBUXtI8Ld+W2Tnw974kFkuYevmWm784wW
         uVsw==
X-Forwarded-Encrypted: i=1; AKwUvBx+CfF56qBiK5GvBaP/xK1+PrpK7o6nyTtbwUHM3hW1wBIB0mwwGAygDyvGhpvHw+V9Y2QiGxBBG3pJ9NA7WD4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbj8CjZCVTgjWgANgHvoK4oVM7GnWgHs411SSvl2hG++cTOjPG
	qL6XdgY89EjQUuqi0zQQJc3GqXqzF+ZcWlouxfa7N5CCgV6SD1v2XMWk
X-Gm-Gg: AYBFou0+Oi4O8+CKae9TtdVZHPGsszvoBzN9W7efsoNI8eaIgmxeZGM3P7d5VReAA6i
	UL+V8+iH68rxQl527L0lK9/jXO0M9mUwXNYTF1LqkfDoUwKDNoYLzZKOIWCE7X4rsnwU/jRRmat
	rnxQL12yu4La6uVXAeCvPNZxqdxs8MJB6VdWJ7j4u+ltbWm6P88K+sapTW9IlivT2NuccGTLuOt
	EC4XxeFMyITJ1xvg347JjYpd8Tu+S2AI/iF3G9/Z8vlJpUjTTOTHeVA/MevUM2ygvYNL+BPeA+M
	nVPiYAwXNTVGSj6SXSOTsBFK88/rvsysQ5ewVA6Fz5M5ll1AzfBo7Yc4AU/uK+xqHX7qckVjItO
	CZ56ZxWnd8cJepAjq8HxMkJCHh9F6ZMco1+rC0epuaFsCQioDVuImutR6CSlqltRdtGJi40txCK
	S9LQ1zsfBQffZJ+PXzrBUjYSD+2BUVXy/gQv8FR+hXGtfkx9gsoWxcUQxy7qOS775Vw9ZCjnhHg
	PaX+RoEDibAJNWs5GHeCCUKGpOjRZHWp4eXUixNIn2DHGNkA2HHEV0UtmUp05sV/wU5ApZzUYGu
	TmjEfS4sgIU=
X-Received: by 2002:a17:90b:534c:b0:3a2:bb9f:f87d with SMTP id 98e67ed59e1d1-3a8a0e2bad1mr1081798a91.21.1791374318558;
        Wed, 07 Oct 2026 04:58:38 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan (oki-109-236-14-10.jptransit.net. [109.236.14.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8987b09e2sm4456582a91.2.2026.10.07.04.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:58:37 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Ajay Singh <ajay.kathat@microchip.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Kees Cook <kees@kernel.org>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Willem de Bruijn <willemb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v10 1/6] netlink: specs: rt-addr: fix the type of target-netnsid
Date: Wed,  7 Oct 2026 20:58:16 +0900
Message-ID: <20261007115821.11332-2-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007115821.11332-1-sigefriedhyy@gmail.com>
References: <20261007115821.11332-1-sigefriedhyy@gmail.com>
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
Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
---
 Documentation/netlink/specs/rt-addr.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/netlink/specs/rt-addr.yaml b/Documentation/netlink/specs/rt-addr.yaml
index 0ecbd24c890c6..17ead22034515 100644
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

