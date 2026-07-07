Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D9E423796
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 13:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432787; cv=none; b=XzahKr85KZXbVMnBsMdvHxXxLRBF32ks1oWJdBBA9Qq3A0KcLwV4jWkvHNKirekPG+yiXvH4i1jKLlLVZkRCB+UDpkVYu20WDbVrqYaY9JHpfjvVFgQbSxKvUcEKIowv+GQS5YYpoNP6WJfrxioE2sn9y+C9HRdNU5cMAi3TCHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432787; c=relaxed/simple;
	bh=fKe70vqmsSB7Sbpqp5Pwa9y18Qh7KEsEmm0Uen+uTFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m7UKrBQQ2bGKcxd1ooIyBHpT9KtrEPw7vLiGex3VE29Ai490MhzpX3ClAtiRcX9RaryKsJBks3OM2sCNARsJBoHvMjO/Rxlq0M4w/w+vMjVQtOvdrTAV5BXHnNaOLCyZP3lNBgzMluv1QwdXHF6y0voBBw2hG7wohpvH6o5HCjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IlkKE9iq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlkKE9iq"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493bb0e2894so6535005e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 06:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783432784; x=1784037584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f9VRQMdG5mh4GbPjofS2MPnVG7awxExT5N1bUTExBEM=;
        b=IlkKE9iqwsuZXYS8lwMuAA2NBeFz2yUY59OTqskSF2pqnbkhPdzcHoYJ3h3Tal1HHS
         hzzu3+U3kReQezqHyt5YZZsWgu18+3bWm8bsq26glfgQm53iCsGwCd2ngv2ayoyrCIpd
         4BU+vHMiEKZghAlWSQWVq8ewE1H0temMj6ct8Mg/gTGdFAfhWs7KRZNABCtA2xXmXd7Z
         6wJJk1KlG+pDb4qB7NrXYtcfeqzBpNStinpctPi2j/MSTDTG3sCx9J+7LnO5UpihLXtM
         kmPdZsqF9sBra8yN5Ft+Q6hno8suycbQ2DFDfml/U5BxRSslOYfTuA5H91aH5fXf25U5
         nZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783432784; x=1784037584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f9VRQMdG5mh4GbPjofS2MPnVG7awxExT5N1bUTExBEM=;
        b=shn7pKK5LtHwk2hZn1CgHwTH5F550zJpn1EDP3RJEBa/sxALbDKKAD8usiMs8yQJ0J
         EwsAvWHrVUUkqsphnuEg6rHOmupQjifJcr0EZR8dKIsyghxEhGvDVNWpEXj3ygb+HxZX
         iIIGvWWqG6WqB7Wns3Zh8FLcIDkiGIEsqyxirkx8Hn9DN5uftG2fA88t+nLKSbO/9Fdb
         B30c2VwbBOT1j2nLvkCdIbx9RPIqcwiFJVeYb3p/1LetgSE61pPqRKcuVUR3AW/XKyqC
         eozo/LcHTy16Z2CKoAxGAa606shnIc1Ayc7oKkQZxXnfPCjT2CkjHVkpPOp08xLkebLT
         7U4Q==
X-Forwarded-Encrypted: i=1; AHgh+RpAbguZIpm2GxeONMwTE9L7XOzwEbL/zr7MaUnixS5N3AjfXWzn4KqMw5DqvVjaa2jITNi7xCzX2rw2RstiwUk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw320buFqxJRYN7B2hxFaHfckGcmLFoMavdX9G/pb2a62GLAn2A
	Tb3qrkJg/j7xLe3mitmADa4iUsJUuGCWK5EiS7beWF6j7b+Jvp+7A8VD
X-Gm-Gg: AfdE7cn+5iX2cJd9ZTfKgAOFhLHqO44EAJcCPk85W95xDWQkwF52tQ57m1wGYaDhfVo
	yWB+mNZUkSLbWMKxqd76osy8M3s/KXZ1wGxqoJ5IwSIMOFgQ37AnDKNlAbgZ8ijlb3b5ike0oCK
	AXpQ7jneqHhrrbRQeFuxLjOIcFNg+GCrk6p8xk+T1zUcAahEL/8zCmsj+9v6s2Bw2TYEVYlHDP/
	+kmJxuko4Cs/YAof3vZ4yUC6+Fy9ig0sPIq6rHoWyVnO7rgHlo+gbUCzmOC26FU0FePzWal9V+c
	qoz9sT9ztMY6Ox9k8hEdG0ap/su9M32S+EpRZm9hldh/dn8rgAHOoe5h/lzBQ7AH7l90ivYKxi9
	OafFXbBgNdkrgYDnAravSWmf54i3G/rNvI0DbthnIvhDXMpoiLO1PfIvUFaRbUCbw6mjViq4vce
	SwYRrcY61Fpj51vfeefRUPuvtjUwc4FeMH0pYXEoyGAPjISCRiVLIsIlD2E2Svlq3O28Vqawu9P
	KsSdV4XNA2uW3Vky7UW4P2QGuKDqzwZu0oahqKw470MJqs++PI=
X-Received: by 2002:a05:600c:1907:b0:493:bd67:315 with SMTP id 5b1f17b1804b1-493d0f4284fmr111439575e9.5.1783432783600;
        Tue, 07 Jul 2026 06:59:43 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-077-189-165-250.77.189.pool.telefonica.de. [77.189.165.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f40d50sm67409615e9.5.2026.07.07.06.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:59:43 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Felix Maurer <fmaurer@redhat.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xin Xie <xiexinet@gmail.com>
Subject: [PATCH net-next v3 3/4] net: hsr: allow PRP RedBox (interlink) creation
Date: Tue,  7 Jul 2026 15:59:36 +0200
Message-ID: <20260707135937.18-4-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260707135937.18-1-xiexinet@gmail.com>
References: <20260707135937.18-1-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the PRP interlink datapath, duplicate discard and supervision support
in place, a PRP device can act as a RedBox. Remove the rtnetlink rejection
of "type hsr ... interlink <dev> proto 1"; the feature is implemented
unconditionally by the preceding patches.

Signed-off-by: Xin Xie <xiexinet@gmail.com>
---
 net/hsr/hsr_netlink.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/net/hsr/hsr_netlink.c b/net/hsr/hsr_netlink.c
index 8099f2069a7..88940e8014b 100644
--- a/net/hsr/hsr_netlink.c
+++ b/net/hsr/hsr_netlink.c
@@ -121,14 +121,8 @@ static int hsr_newlink(struct net_device *dev,
 		}
 	}
 
-	if (proto == HSR_PROTOCOL_PRP) {
+	if (proto == HSR_PROTOCOL_PRP)
 		proto_version = PRP_V1;
-		if (interlink) {
-			NL_SET_ERR_MSG_MOD(extack,
-					   "Interlink only works with HSR");
-			return -EINVAL;
-		}
-	}
 
 	return hsr_dev_finalize(dev, link, interlink, multicast_spec,
 				proto_version, extack);
-- 
2.53.0

