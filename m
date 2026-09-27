Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3454B248880
	for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 00:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790468692; cv=none; b=XqSrq8Hn4IRwb+xEG5DP7p5S/RoPQk+3j0dfwABTKOpW2SxKpYzW5bvznPFhl58If8Sk9Mg/ScrMn2Yoj5liYO82tUMKnjqxqeel7FdVVNBXbTdeWv5UEXSGSHYuLG7Hlew5N5SQxpYTtMN3L4OiO2GPUT3I+t/Z/Ei2jjIk6gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790468692; c=relaxed/simple;
	bh=J8Mf3HYZaTmZYQFkYELALEytTws8uvz/goY09yFk2pM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h24015njcGoSay66lbPYT6/U1OHYQBaJpn0IP9lCQgi2O+mQa8PNktboVe2eQCLFwLK83PF4BaqE+pgrPIptThqsehXciRsiJq+34K3cLqKXN8+RSl6sb9QXIYpQnYZJEjaO1P5oxojTAp1mUaDFyam48iEJc8RLfInsEkA37uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFdf/JV7; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFdf/JV7"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc78e1a94b8so998640a12.0
        for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 17:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790468689; x=1791073489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pGK4SZ365cD9EYRGUuPJEEEIN0V6+rF/hbiJa0/JQok=;
        b=CFdf/JV7+jF+CBKIz7FEXWGpUX9VGYxIbzZ/OlilwhqDFv9pF6RMhlq1h8k9NRk4XG
         TRPrKKSN3JVKFma9E5pSpvwXD1WwMgcE31oFjMStyH3YK/+nUn11GM60ty7VH/IJV3y3
         6SsTN4ppBhkCVzOxS8EY1qH4KoYb7OTpIq50WYtHRF4bWu6lPE81hLCkRoGTpOi09PFC
         Mvq7g+Ph0qGlqTjfLdUTgdKGmAtvAToNffpVsTKPNh7xU/4dxpoNsUTeJ+Wimc0ZvIrX
         iclIQFQ8FjgWn8NKoDCJn3y+q1LKZOAgVbSx5hbdmKcceQp/t5XA0SmxfxirIa/63oIq
         KWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790468689; x=1791073489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pGK4SZ365cD9EYRGUuPJEEEIN0V6+rF/hbiJa0/JQok=;
        b=mEbslaAT/q5aqRMe+hNyl6Hs+Zfca46r7X6g3wOISlzNVWsnRiW59kBtBlYxerP+/z
         Vw6N5hHwZR3zFo98SmQ+fWFSBJVTh+N54vzByKWoHTpXT00wnuhWoE+NsmUx7XuThMrZ
         FuSwl6en7UUGWMgxjylijvapOeFZ8CnONBDXa1wqMFZTaLu+YthemQfbAuqcploC0qya
         8QEj5+Urw2RktAtODrC05STnCyhpQBfSqFbeXyVv11yusH+HDBXyMLLpgRrJ8erXM70G
         dkNWqLYB499dnQxDFJ5JpJNV2JJv1Ixf3qOcAX5s9qxXrC+4YEoGO2qgO1KSZ48E9vf5
         hDZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIAZnsp4mTkcUhJvmb0MJh7ZOoj9PP6NYHeBzfREaZ5PjjLEMu5anl4ScdfnQQu4qNn6D9KEuu8y3Ab4B2U58=@vger.kernel.org
X-Gm-Message-State: AFq9FYJc5R6EuAFqoeDJsU8ihgzmWudtJj4kT94mHupmMDGMxu+4aZgT
	QKSbfKZl/So80KdcxReaUuE0ewFzV67uMXZs3bzPQfGT8EGCm5P+WI9w
X-Gm-Gg: AYBFou1XewE09dHjdqR/DSM/1WjH7UWgZIbyfr0dZyXG9ofUWqfLd+pC2Ni0tLcSJ49
	zSmJl7AAcN16rdQZL1FboEfmwxALrzbCpDTLYV1UCRlDweEmsNl9cnAl8fuM//FB98/sUsFKPGo
	i1/FD8/TQNiXJlbLLk7UgqfjIFkTADh4cAGilOFngzwEuYfm1ueyHTGQcbKblLvR3TlJ00U0WKY
	wRNpbPrZ8IptH0K2SX9Ao2JdaaS2KwOr+Un14s6QleSYtJKc35/gsKuM5SloPTIOcduKBnXOpDS
	Hp7h9d1plfln+q9omUc/8g7AHCAlWxLiBaqjJSSVihjKO/XiDQ2I7uULMF7QMvRY/NIwPq389+0
	Veehnpi0LDzCOttF3ihMvn0mt+ua4gF2Z3kgXNn4mZSMX8na6qW8UlvkIdlL7pdGdP2Wsr08A4c
	+bWob50rc6OIjQ2H0ixC8GBwvFleH0lMBNmRTUnJYJB+lgqIRmFoJ9NmAiow/QWy6JUAMuLKYr4
	8phTR0HDNaZd4EHuLuqDvH9178LewsV8aXuKgrXvlCCN5eLLpMRHeyx/i40
X-Received: by 2002:a17:90b:2645:b0:39e:6c68:c77a with SMTP id 98e67ed59e1d1-3a098e05151mr8205483a91.48.1790468689284;
        Sat, 26 Sep 2026 17:24:49 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:78b6:7bf6:b1de:12ef])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78791c680sm2698224a12.16.2026.09.26.17.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:24:48 -0700 (PDT)
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
Subject: [PATCH net-next v8 1/5] netlink: specs: rt-addr: fix the type of target-netnsid
Date: Sun, 27 Sep 2026 09:24:23 +0900
Message-ID: <20260927002427.4519-2-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927002427.4519-1-sigefriedhyy@gmail.com>
References: <20260927002427.4519-1-sigefriedhyy@gmail.com>
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

