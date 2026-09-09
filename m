Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C72B57D21A
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 13:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960784; cv=none; b=WrBvlC1cyWHLA0kg3la+vnRgrJzreMlDxJyEPpJWMAI7X9LdF5iHeYdM3iNG405uMpfT2jI/80MImUQJtdovaF0WVyCfDgwMM4EEG+K8ODk8P5FW8TBhmF+1GUmQIkItUbBxN9kZkJ+VJ8lRPH5k38WYSaaX2AYEZHoCmXayMJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960784; c=relaxed/simple;
	bh=n7BwLR8vVeSP7BQUeGCqwE2IwAkiiSZQRz5EdOjjFL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y2u3c0WkBxT7vMczlbgsrolHTgA7N27PKwRPfCjWZPArDgha7t+yKt9R3qxWZaeyc+ZtZ8TtwLg1yBwCc9LtMKCy/teq8fmStwOv3qprDh5jWBWrfy6pEpks4lHA8Jm+FwOg345EAWqAgICkDp95an726biZqicbXhNxgtRQx5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=es6FwusF; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="es6FwusF"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d6d28aa26cso37549015ad.2
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 06:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788960781; x=1789565581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=haXVv7k48B6R2bnuYsrQ/CNSi4SRFJHWdVJePl8DmGI=;
        b=es6FwusF9tmU5iELSd08gM0kQDcQgOMOHtRn/wCJRS72Cvcg9tLZ4K3NDL/lPjTixN
         POojZMO4Ag7DXjGjDqlCjZp/tr7cVQPS6or//heqsJeJ49fgfqliDddcslZUhlGSXMll
         JO+fmwSluBrJfr816DgsXlTFuQVoOXX1CJYNpWGXLHOjpZylMnUcJE51zadh+KZ3QAVB
         SMeknSuZraPOyuIx357feZOovhuXw3DyM7jWQtQs7GkybMfTUr16aFTI0o9NAHgkAPXK
         P06ZGeushX9xpZeg0q1/fzxRK/PGtTtonuojeimz24AYcBcPpOCiwsR4cduK8/n8B80i
         M1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788960781; x=1789565581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=haXVv7k48B6R2bnuYsrQ/CNSi4SRFJHWdVJePl8DmGI=;
        b=KoSfzNqFOoIKKoi139N2aIavfR3fdPX/aI94h25g5FGuJcUyPJkF4Fmb9zL/Coot79
         YyKv4hy1MIu5PHVycFKspDYxAEMvvhV8WFO+3d09nFoor94kqhuP5qkF4lvqSekWpjcR
         1Yb3rNJlg8b178h2M46l0eb5EqN+rXTpjZ8KEUTAVkRCKcrOoI6n8MXOHhRG0MiQEyq6
         LJLE0UT8HQJef3uC6A6Kr5fBbhj/xvSfjUVsfsef6pi1j+bfpU2HzfYo8i6c4zc3hPk2
         Dijt7Yv4YdCWyCKYghTvJgPrCwQYI5ENZy/xhvNKv0AeLHmu/hw56yzMkktGIlqLxFxb
         BxeA==
X-Forwarded-Encrypted: i=1; AKwUvBy4Kl1VY13Wrxr03uPVgKWvsbzllAZKpXrlj2trwC2LdNQRZ4n9+42pvzIg+RhMjCa3MVOOppQ5FHSw801GWWU=@vger.kernel.org
X-Gm-Message-State: AFuF++kGBriJ6en/8gcjNJxUCUsDiTS9589wQxG0dbODb4qvYUOX8gRn
	d/gDSqehdnM875ezf7dlC9AiCJlRzv2cGzqlkhkGhpgxkAmvBWBHuodx
X-Gm-Gg: AYBFou0dhkBvCk62bSXARmjztof+vtLXoRHYnMSw2quwySUNfcSMOmvY4dKKFXQuZoo
	KRd0fju5aRN7Z9+g6sXVUsQj34dtEYIC8eW/a2PonIIWQpcEzEq2bGwG2R57vuvZHhdiJm3ni2T
	4Uw8qqFgI35r3IaIu3BXsvGaZ/jEd1Uupg4ghJj5vsADXkXU3NlhlVQ3zBjpp/ULi+GD68K05BT
	w3M2a1JpAFbUHThG5fUtoqg3F3LQNxWdo7oGms/h9K/x5AB8tzM0JUWiL6CnMBqpb7dslOCyZFP
	VXXdPsgs2Un71v/JDqqSy0tSMISz+rhIv5I1bcH7dxlSyYOXYHpNW6smWWugrZ3vj+8o522c3N7
	JKux6Ai4vNUFQdG+AxNlH+vQ6gfJy1004Xg0wGj5uHhc3U97iid7k3eyC60dzDPi2S4COiUHvQE
	m/hI2wR5fYzec6Tf2FHuaA97ErqCbDedMLSCTLT6Fy8hGzbtXbeqMLXM7xAkT4fGhLZI/FlNACz
	8emRptCaVQ8LfwR60cmZggjL0ImjZt7I7Ee/ncPkV11T+AHHpU9lGXOsQiOVyQ=
X-Received: by 2002:a17:903:1acf:b0:2d8:da29:da41 with SMTP id d9443c01a7336-2db127509bemr560812515ad.15.1788960781157;
        Wed, 09 Sep 2026 06:33:01 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:574b:e1a5:307b:15c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae8af3sm72564185ad.80.2026.09.09.06.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:33:00 -0700 (PDT)
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
Subject: [PATCH net-next v3 1/4] netlink: specs: rt-addr: fix the type of target-netnsid
Date: Wed,  9 Sep 2026 22:32:44 +0900
Message-ID: <20260909133247.113923-2-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909133247.113923-1-sigefriedhyy@gmail.com>
References: <20260909133247.113923-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel parses IFA_TARGET_NETNSID as NLA_S32 and rt-link.yaml
declares its target-netnsid as s32, but rt-addr.yaml has it as binary.

Fixes: dfb0f7d9d979 ("doc/netlink: Add spec for rt addr messages")
Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
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

