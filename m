Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934733;
	b=UL1tjVTQS+9atfCB4yUt5OF1kJQ/Xm+CoS1SitX60fLOE0YED8EgbTppMjyoMDXEEkZ/
	 nnmoAJjMJhAPLUttvuAM2YyrSKPRAhTHVX4bf93sKVX6NA4zapC5e1j1SvFEFAv0silE0
	 foifR2NdqiBquqyskMgEVwiqyJxse53TgBJfHtglq72ex/JEpOqL7e7WG2l3QNAHNptze
	 XPqHeHgjCLl0WiVTibe4fPbS7dcdth39YT0XcuGU1GJU3N3yqbbb6iwz2ZuVZY3qgMwrp
	 cK6qpIDUEWpnZFQEiz/PSPOhMrHYSSitui66o/mRG7x5wWhZrU5H6+Fz7rsx0BZ7SuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nGsBSBPX9KKurF0+UuE2NDcT8hZiC4p6rQEs+X/1G9I=;
	b=oDJ7NM/Q5KiCbEtWssG90cTq1MpBQJzxkcPeiAy0a+0nGRO3txd3rYGpc9z9Gsan9yS2
	 xOuKfwcPyuDS+W5TGr62XaX3u0zBLDrlIeCuoeVkowF5EnHgIhdcr7jvu7i0PdrOZ40V4
	 Q9e+dVwUww6bIRcAyt8FgL98Zhg/W18AFVscZIUyXkJxabb67rxHiqiLpI7OC/OI+DlDA
	 Qg++RA52wcLWsiNUfGOaGIzHO8p94e/B1vIIq7a4yrYDzqv/oowa5xh7uiR7lOlQ/uuKs
	 SN2bbq4NKrL0ThsJoO0X45GfWEhHy9QHF9jsQH4qPZDd+BAsrEXTuK0iaoycClHS8Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mGQPQsHP;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328CF606A32E
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 03:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 328CF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mGQPQsHP
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ed1414df17so599875ad.2
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 19:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793934732; x=1794539532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nGsBSBPX9KKurF0+UuE2NDcT8hZiC4p6rQEs+X/1G9I=;
        b=mGQPQsHPf2ej2s2Hl9o3MhzXyEQFnJqt4mwZdCOit/z2MxeWxV/v7bptBK3zngysh6
         8x0T61zDpiZP44j1RoHylY7XUjks2qlDagVDaawixSLxHaqrRpA4w2O0amtckhsqAiUl
         mx8df/MmyvjRaDXhRlLPA5Vc9hKfmS4BXtquKXtl3ibmoX0KpxzaTsT8jm5mCeyHi54E
         GXlOd6kUoYsxI41EtKcrq51Kfevy1jp3zzqPCai6cjQbOLBJWIfSCYaWgy3l3AySGYK1
         QSKke0VEnhjIxMZtqF6d7K7l9tdX2G/9s0taMlPSax/g0eU+EHTX12Kh4p2fFLa/aFpt
         AR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934733; x=1794539533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nGsBSBPX9KKurF0+UuE2NDcT8hZiC4p6rQEs+X/1G9I=;
        b=AxL6SUU8ssaWwo6L2x8MN8FwCnH69aMb2Zs0FSruD5IJGWEWWADHT9zbLVhgZRGmJd
         Y0mdaFsPrJ9bo1eqdX17mJU9+2L/fjFQyX/Fd+85uOfJSNNH5G7gMRc6/JlAC/D3BYT6
         +S75RDQgaKIqjGSHSl1b6Ea8AW99OAnH1vR+sv2hcTffbDZQVxboXdB/igbkBUvNTTIa
         q+SCIDQHPNGI51JVzpRrK2F7R4j76VvIcAIRA3TFmWXy8diIPq2G+TxBRRdqwxRqtsd7
         r8tlm9NNYgHmR9FSzYYpvApG6flJoU0mCIDXsBnAebjs80ElYRIVxnGjMh5yVebsNjLI
         40/A==
X-Forwarded-Encrypted: i=1; AL+hErH/gULOIovC/BZ0+JT6Ubmy47Z1e8owQhY16NXGPbExPTQqkDOxwmSq8NxGOdkxEvYPVUPNQj8lke/0e64Qpe0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MD2XiN1Mj0+18Gz4kyFUrZLmPRVjHX83lcKOrWFCRv3K0cKcM
	lxwctDm7cGrLoiXDcK2N1HKZ9MUz+emxm3T5sL4vd2ID+A8+md77KVwoE41Kmw==
X-Gm-Gg: AYBFou0ilx28PMClbdmnJY3vi52YbIvnNpIIepNgeYWwl6kG8BgUzicIkSeOLY+rDXf
	tgLhJvfPeAoIai+z/MLHvDJ/E1ItMRHt0q5eGOa49GSIo/LDRsDdv4emL0kzkZH+7Jv9LydczoT
	bgObQCy0UyfBQb078k3wbEIbytKk2fIQzmb5mU4SBj51qFpS4ZCsg9Rx7sdigmIZCpGOWQhAEft
	0VeyyOUaQXl5jhUAawgaMWEV2uS8MbvoP4LgvOGan/X7Fv5cuOtMTHZYk6IebInrvin6iZEtXsF
	kVdnUDgz11W+05Vln2WHJr0p3wNVyJBi8rmyqbeFcS69eLUQmsVDkNwruvlwC8719FgDVPfFpEu
	XTppo5MXM1We9c+VVxlNodU1SxsO+aNm0/kRZ5hncxL2ZnzIaENwCXeurFecSKik72BBlRkcMxq
	i0U0w9AaDiMw+nr4LLpYL7aVhoKq45ob32rfzW4yHdjRV6q0i12mKWjXS4PnimPs70RFqARFiN8
	cz02nqR6ZGEjGKG4V2Nn1CoNPc+s5rp1WHywbn9fHMuJJMRB2iMT7DOCpW9I402Q/hqqs7NRcbg
	0QL5OBDtVGqZ2HWfyrBtGXBQc4ZeSYSvga4=
X-Received: by 2002:a17:902:ec85:b0:2e6:1a6c:abcd with SMTP id d9443c01a7336-2ed405eda1dmr18188195ad.3.1793934732585;
        Thu, 05 Nov 2026 19:12:12 -0800 (PST)
Received: from localhost ([2a03:2880:7ff:4c::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed477a9994sm972685ad.19.2026.11.05.19.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:12:12 -0800 (PST)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Subject: [PATCH net-next 2/3] selftests: drv-net: hds: perturb settings via ioctl in ioctl_enabled_set_xdp
Date: Thu,  5 Nov 2026 19:12:07 -0800
Message-ID: <20261106031208.465456-3-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261106031208.465456-1-dimitri.daskalakis1@gmail.com>
References: <20261106031208.465456-1-dimitri.daskalakis1@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dimitri Daskalakis <daskald@meta.com>

ioctl_enabled_set_xdp never calls _ioctl_ringparam_modify(), so it
does not exercise the ioctl path. Add the missing call.

Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 tools/testing/selftests/drivers/net/hds.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/hds.py b/tools/testing/selftests/drivers/net/hds.py
index af34dc9ce749..7f052c319603 100755
--- a/tools/testing/selftests/drivers/net/hds.py
+++ b/tools/testing/selftests/drivers/net/hds.py
@@ -274,6 +274,8 @@ def ioctl_enabled_set_xdp(cfg, netnl) -> None:
     defer(netnl.rings_set, {'header': {'dev-index': cfg.ifindex},
                             'tcp-data-split': 'unknown'})
 
+    _ioctl_ringparam_modify(cfg, netnl)
+
     with ksft_raises(CmdExitFailure) as e:
         _xdp_onoff(cfg)
 
-- 
2.52.0

