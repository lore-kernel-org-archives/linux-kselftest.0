Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB55C3E3C62
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 17:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779297821; cv=none; b=ta/P9FhZ2a4NYYXXBHIV+QD2e2WscbCdRzYyIY1TR8H6X+PgXajnBPgwe+T1q36hGkW4lfSnKAhT3YOIYHEeatbwkAuMw4nhXoqBSchBDgHBXjgcUAMyR0h5KyZtJlmH/pnHpfntrQXb1dk1Ls8c3f7VpECL+ZmEDWd2uW31I1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779297821; c=relaxed/simple;
	bh=pq5ewNPh6QbkE7tEQm34DFGGF2XP2Fga+Ldca3aZ7pk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UmwrlVzM4eGGGbnGILLMEDQGqyrIjnBQMqK+R8J4RO66l1+0o0G8M1eVnhGRpEeBxO9Iw5pdHC31TiAchvBXtgjWqFEsx0MnSG89ZlLNJuhzkwPaJnEwm+Zh/h/YwdVXZ4peiSEED4qU2XBCJfcPY9ypKEsBZCQtPNnyhd+AWvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so2073664f8f.2
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 10:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779297818; x=1779902618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z0yVai+Va2zy8HPA5HXIs74P3GZW6aeEN+twxmzuGU4=;
        b=eLDpfDLE5fVR3pHwn53t3nbFFBPqdRdPTspVB4G3fbhl5KRuJW2ZxUOa/p5wUcl9r3
         mZyEVGlCY0Ja0yo0yAlMvQzB/QUqo4bTA3D/UFtAprCgSW5LOZkTh3YYSbmMifJaP4+Y
         RQRmM/TGcs8DVclCmGkRT3dlocG8t7K76oAVQFhwuMX4xnvGQhxDV4b5OD4Egqp0ncxD
         YV9+8FeHw8qC4aTOd+pQhpUweTgNkgRRQmhErRmavqbammabRaHDdwXNi0O7/sRRgxDl
         qpJgq1tCWBmD30AZU/QxjxPVIk2IHSS/tnpxJ72/CYqBluMv7XDGrbCBACY7BvX0BgGp
         BC0g==
X-Forwarded-Encrypted: i=1; AFNElJ8/Yz6bCDcQIr+xDtRwgOOssu8SMI3nLcC2n5/hy8czfZ8ih/ZrJfUBRcFkbeV8wqmW77vRhxR9gCELyI5vDF8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk5bN3x8pzPic5mPaLx/k1eqkCcLSLqsmmbsfoO31cb1e6PKZw
	4o2QG5DsHCdtdGmmdxyt1uD54tivqNF186kRkfFDVWEB7Tt4/3vApkAu
X-Gm-Gg: Acq92OELV5G2wiG6lPhEH2gC5/SLP7GsaR7tjKsUDah6++Muh63vuxijwYAXdcDqjy7
	YaORe8H8MYs8ZOyiaLp62IHZuf4ftpBPV4lEMQ7HZMYcKcTA+xQrOt95ct0fMt74VP/Zefv01EW
	68H1dExlqfkU6mcRFew1QJMhv37LdmJI8o3gb0MQ3+KiWWPfZE+FOwXNwxFBfTC+Xem+Cj+f+d2
	SRSexey1RrPuL+BIDFQOIRchRKp9TUF0eQhDjDGMptVILVs3Rl3J8B1YT1dOWiSwnksaw5u9+Jp
	wK0wcADI9H4M9nGIfkqqnVPOW9Xoe7uiK3/gjWI6njoOxMmlcPFVVrqkrHDXc8kI/Aanys7908b
	fOitcZvga5JzAk4Y5e5D9A1SbOtqlrul8ZJi55n33/eOeJ1uTisU5q1ENXL0qpb6oa8o1vSmS9e
	YYMSXtDpE1HbIO1lgGjTKhg27RoVaodgTuWbxt2cgV6B/kpwxX25k4QK+sWAg=
X-Received: by 2002:a5d:584c:0:b0:439:b8b2:fabc with SMTP id ffacd0b85a97d-45e5c587396mr38222091f8f.21.1779297818305;
        Wed, 20 May 2026 10:23:38 -0700 (PDT)
Received: from im-t490s.redhat.com (89-24-32-159.nat.epc.tmcz.cz. [89.24.32.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0fecsm51125580f8f.26.2026.05.20.10.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 10:23:37 -0700 (PDT)
From: Ilya Maximets <i.maximets@ovn.org>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Kees Cook <kees@kernel.org>,
	Adrian Moreno <amorenoz@redhat.com>,
	Jiri Benc <jbenc@redhat.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Matteo Perin <matteo.perin@canonical.com>,
	Ilya Maximets <i.maximets@ovn.org>
Subject: [PATCH net v2 1/4] net: netlink: fix sending unassigned nsid after assigned one
Date: Wed, 20 May 2026 19:22:35 +0200
Message-ID: <20260520172317.175168-2-i.maximets@ovn.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260520172317.175168-1-i.maximets@ovn.org>
References: <20260520172317.175168-1-i.maximets@ovn.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the current skb is not shared, it is re-used directly for all the
sockets subscribed to the notification.  If we have remote all-nsid
socket receiving a message first, then the 'nsid_is_set' will be
set to 'true'.  If the nsid is NOT_ASSIGNED for the next socket in
the list, the 'nsid_is_set' will remain 'true' and the negative value
is be delivered to the user space.  All subsequent nsid values will be
delivered as well, since there is no code path that sets the flag
back to 'false'.

Fix that by always dropping the flag to 'false' first.

Fixes: 7212462fa6fd ("netlink: don't send unknown nsid")
Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
---
 net/netlink/af_netlink.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
index 2aeb0680807d6..0742e97f256e4 100644
--- a/net/netlink/af_netlink.c
+++ b/net/netlink/af_netlink.c
@@ -1482,6 +1482,7 @@ static void do_one_broadcast(struct sock *sk,
 		p->skb2 = NULL;
 		goto out;
 	}
+	NETLINK_CB(p->skb2).nsid_is_set = false;
 	NETLINK_CB(p->skb2).nsid = peernet2id(sock_net(sk), p->net);
 	if (NETLINK_CB(p->skb2).nsid != NETNSA_NSID_NOT_ASSIGNED)
 		NETLINK_CB(p->skb2).nsid_is_set = true;
-- 
2.53.0

