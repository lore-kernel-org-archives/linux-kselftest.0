Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D159047B40D
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 12:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785326897; cv=none; b=cNjd4akD1bLDHL1WRI3X3yH0IDCBALB8qODfmbOZDbb5tYk0E0EKrrOqKXsSzg0d6POHleo24MsyD0PFg1oGqhyS8TysxI/J+6QX5ZZqnPGW96EVJxQzCFFX3OYZ7stUAWpwyoTKJi7uxgKSDstelQoPkY1u6yY/3druZ65mEp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785326897; c=relaxed/simple;
	bh=Ldrln8LKzLxxG1U61lhESq/BvKrysELVPMi2uGpkCNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sm2j6pbtIl8SIDkMukvrDs9n5JlrG70QKsBxDiqfFDacmDFURJdGrl/ONA16IcgUsWrUuEyRxq/KwntJgEqe/alsWFVkU0ShgIUVSR6hI/BRVmPvhal3B1b3I+W1l5ftbhFFWevB51hs1li73kQceN76GPdoYP25stiOZbg68gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ce8C9p3l; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ce8C9p3l"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84874b52eabso1147460b3a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 05:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785326895; x=1785931695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2gu6y3IXkxO6mUr5eTB6klMueKQY1psJ64Dbxcvj7NI=;
        b=ce8C9p3lO/8lnmqf6oMy5lRGEmDJFLfqPZ/+/bE45fhi4KZgLSGkCHI1uZz4VjQjPq
         7lw2axV+8lJtNgSyPTnMAdavyAYowJ7kI1DwkKVRh/Cw2r/go0+AUFu1YTBjEZRxVeJm
         3eDzNk7eTs4Pw3dGhuJZKbtELcM3CjUV8RlQeh1SFR/gciAvFSJaJ+QNt6c9qjRD+5rF
         4GEW7exdeVwJYhl5QgqB+Ewj/xgUyMp6TCPibQkTgBpkYZhrxoSbGdvfhhvqbhFniaH5
         zTaeyxGGbCVrF+T34lb63Uytao4QkGM5ERtCU/5Vdg9z8pCnJ3Iv1dyCa4npt7gn8RIc
         FDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785326895; x=1785931695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2gu6y3IXkxO6mUr5eTB6klMueKQY1psJ64Dbxcvj7NI=;
        b=VndrIvaenddSwRYV57pejIDuD2AGboTOKiBt7Vz64bZeuTkTYWMYA/JFPVNbknHPjx
         QVlZhCse/+jRsGTKkD1yM0L9FdpPdX1IXrJwWZt8KS4cWKoyKXlufcAuDfJTkvqUzvz0
         QnfMWH7lobSy/ia41qiPd4bEBp2CsfbKXzhynC1QYWP7BA7UqCquAA+nMJTkP1yPc/hR
         cA1OfBV8AyqEsXoN/yPjVXfiCQ/Tyv3mJSnL3FKuEY2OE7NszKn36JmmXCHW1GLqFe5G
         HZquT+6F+3qE9fgVOjECu5b0rXIYTUahgBancE4xxoRI8YDSwaGyCGOy8HaF4MD5RR5g
         p0oA==
X-Forwarded-Encrypted: i=1; AHgh+RonK3V+FMmQ6nSwzDHIc2xOosRvHMMCN5q3ST57xUtVx4Eq251nE4RmdA+6hMsu8iaWBZcfTQ6hKnAaLHxY/qg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzba6XswSJqpfhM6kaRz+pIKNrV8pqTplHFuK7Uen3DCzqOJP97
	iMZTNRronbkXjXK7cJUaySrVcJYSIiRKzDmWJVX/F6kFqvSGN4Mnftmi
X-Gm-Gg: AR+sD12hedO39tdb7BloHHSHArHbFyuGG+TR9qqTvCGE7FvOigysuim4EyVAAaoaqLm
	nEUJ+f6rjPLzr0gFt0ZK9GrFUkQfqcXzarPlzITgGL6s17H9QEwqd7IRp3Dh2Gn1xwKh+mtdxpi
	tw4ksBZ1xmQ6n+qT0trFxx1dqUL9byktHIaN8A+kVjBhJ30Rko5dfeXWVaC+RDvO5C9iubUKvtC
	zWqG/2zgAOtrP8k4M0yBd0BqU/3sBiQm6i7Mk6z+/DDvpfLcXOR05Y9PCUXDcTLlbzj+PJ5uIyW
	8a6rplPG0WtcH+TL6BdX0+iwYsP7Fm+nvTp5eOiMBH7syqj2RyBWnD35lxKsysmBubt7DtA7772
	FKdbJk/Op9nZXB3OJqKla/5U6yT7P/ho1lNSaf77QiDah1HApdztp9TNHRO/LgKYTO9EK7Og8AX
	zITPqWIhLcQi2rvXfj9utrUaA4dyC1gBSLbtghi+WLMI2bSYYCOOMx4S7G9nTXu5J19fvAHKvSt
	UuAs5743P47xOGTyASAlx1njiJfcpiE4xe+Dg==
X-Received: by 2002:a05:6a00:3e0b:b0:848:2f77:e2d6 with SMTP id d2e1a72fcca58-84e9336cb1dmr6491726b3a.63.1785326895013;
        Wed, 29 Jul 2026 05:08:15 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan ([2400:2410:3f60:500:c705:d3b3:a6d9:8512])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0300ac2sm1263482b3a.35.2026.07.29.05.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:08:12 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Chris J Arges <carges@cloudflare.com>,
	David Ahern <dsahern@kernel.org>,
	David Wei <dw@davidwei.uk>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Gal Pressman <gal@nvidia.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Willem de Bruijn <willemb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v4 05/10] ipv6: expose the route deletion reason in RTM_DELROUTE
Date: Wed, 29 Jul 2026 21:07:34 +0900
Message-ID: <20260729120739.47880-6-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729120739.47880-1-sigefriedhyy@gmail.com>
References: <20260729120739.47880-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Emit RTA_DEL_REASON from rt6_fill_node() when the deletion reason is
not RTA_DEL_REASON_UNSPEC, and reserve room for it in
rt6_nlmsg_size().

Every caller still passes RTA_DEL_REASON_UNSPEC.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 net/ipv6/route.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index b30becf3f56b..b67c8a31ccd6 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -5749,6 +5749,7 @@ static size_t rt6_nlmsg_size(struct fib6_info *f6i)
 	       + nla_total_size(sizeof(struct rta_cacheinfo))
 	       + nla_total_size(TCP_CA_NAME_MAX) /* RTAX_CC_ALGO */
 	       + nla_total_size(1) /* RTA_PREF */
+	       + nla_total_size(4) /* RTA_DEL_REASON */
 	       + nexthop_len;
 }
 
@@ -5964,6 +5965,10 @@ static int rt6_fill_node(struct net *net, struct sk_buff *skb,
 	if (rtnl_put_cacheinfo(skb, dst, 0, expires, dst ? dst->error : 0) < 0)
 		goto nla_put_failure;
 
+	if (del_reason != RTA_DEL_REASON_UNSPEC &&
+	    nla_put_u32(skb, RTA_DEL_REASON, del_reason))
+		goto nla_put_failure;
+
 	if (nla_put_u8(skb, RTA_PREF, IPV6_EXTRACT_PREF(rt6_flags)))
 		goto nla_put_failure;
 
-- 
2.43.0

