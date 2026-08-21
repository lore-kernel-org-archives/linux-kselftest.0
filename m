Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1ED635E549
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 15:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326758; cv=none; b=ueU7y5GnWo7GGB9wfn4GSfJtCgMwQI7QiT5237id5hDyfuqr9CCPVlW+SrH0VkmGG1Mv9g2xj1hrP+CWBYgAM6DWh6UzwsOOJZaunVvFfgXWzay2wyTQ8UtgMngj6gEq+HBpXLKTqvfxlaQwJoZiodaLM8VfDA1qXhPDWrIixRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326758; c=relaxed/simple;
	bh=pG+a6jjAoKRihKXGupTX5Bh3usPZcUjebp1rhSIsNwo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SVR05NLFw6WKPW/aU06NQzuLh8fTYFQbKv2o2RljDYS9TmC9F88AkT1asWK+YEfK5Bab3uoCsVRcnHpwFX14rS4ZtFra5Zw0BCV8MC/wuSykqJu1Y5fakN+s73eFSGS7+wuAbKbcqGeJKIcv2hdmT2CEhwPgpWib7Krw75WPlcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com; spf=pass smtp.mailfrom=isovalent.com; dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b=HAWXCv2b; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isovalent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b="HAWXCv2b"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-69fc9f25118so1370681a12.2
        for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 08:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1787326754; x=1787931554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WL6hMMT7AmtWJM8Xr047L7dEPk5higpq6flz2hMINds=;
        b=HAWXCv2bf4r1sE/Qo5N2Fzve/GEGg6mGEEkL90UNuntpbOFtYg81H4bEtaO/FXQkQK
         oWp8ivZqY/dc2+fGKIBcdxRsB9f8VTI9nPeBfMK5xS2lIRBmW0l5i06NzFWDI2RaK3Z5
         r6uYyZ3hXGvHEz6F2MlabtMllbhsYTboEMwl8QkpB0FOLFzzL4PIkjRyuG6iRNHcPv3T
         6U4r+O5ycXfqH5vH/yXal5rQ1x2qB9pUYlCGif1BeN9ldYJJ955Dq4DJ6FubjQ9drY37
         Hd60vHvtreMkUtBynPN/m5WVcR2X4/9hZd54i/q+9oilAeLDXFoE+kf/3wz1A0N48V/k
         Npfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787326754; x=1787931554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WL6hMMT7AmtWJM8Xr047L7dEPk5higpq6flz2hMINds=;
        b=QIWf3CQp6WW1ozcVbgUHqJKgBmiaQWHKhgu5mfIN+VjHKB9WUPlugHycSMB3yRo4I6
         zZZdNLLFcEnKGHnyYxKqfowuKTfC00RHhfvVHkJ2Ku3+xg+3j7qD3xpKwz5P9JbtikFD
         Vtcdhgo9nnYcecq0M0OYIXprzrKOdEDPycX5AUg6M8BGaKc6juGYwzBdbKjhM4tadj7F
         SFAQvpZ/J6BYQcyyGWdL2vb+y9i0oGiS+WizAaXV0uBTXspwEYKZfMlhSx6+cf4+QJoa
         zCCfleOtWp70y3DJkEndCYNDTdr+Ru+MddLmjyLojvszwgnn9xNlW0JKwyQtAGK3OcdX
         5bcQ==
X-Forwarded-Encrypted: i=1; AHgh+RorqLVM/DFvOrQRkPFDMjIINfgQyI3YooUb7MsGEFe+9j5irOD+Ma3qRubN4Y2bPE9Voyc5CcpsuFMJqB6JHM4=@vger.kernel.org
X-Gm-Message-State: AFuF++kbP62LQFXMc4nWuw0i8XgVgbHIFx4JBmZpJnSJgoAMXSz4bzZu
	D78tRUvEClPc5GxnCZ+jCY1t3qXFnWlQICHj78ZZ0PK7p2rsFh7r1lxyr7TSLbkmXLc=
X-Gm-Gg: AR+sD10e9UZ53aOui1L+TglzEHbPDFibixPBiDs9tYgnK5aQ6nGWt+yJrnFQ3+LfDl2
	S4X8al7yk3DqgUNFEghMU4KMeDN6xzQgonvK1CH98ZLEk+NGxdztG0NxagixG2CdkWqSIyqjI4Y
	F3HUXeaKjz6gusCAjVhe2FpjPxuPk82BNyFRKAR5WnLpGCxvbTxOQ4Ip1eCc60JTgvSeGmIMXQK
	MDlj6V2dmDCi7//X9ZIDtMjhZIrT6bAOSp2LyFA9TCt330IR/xkx3mLM4fwJn5lheYj0N1oTl6a
	5LYdH7kotmTIhZ4pxlLG3iOIcAk9akAHpQmgDUoMgvcUQV5R5EVRqGiN+gQVuLTfWy8Nau78ZKM
	Ir41AtbxUutoMDY68hVVnt1uvcyXZQKKvef/ogZQEXTf8vfhNqFLv7rssgOL1ckM/cFb8IBmD7F
	PaJUGKkVyrcgxeE8cilp5H2iHXUYaUHqWfSBUMi071qqwIJDquVv2CSu1xwh3ZhGYkd9rn9LqQJ
	u9cbZtLPI5t/QdYiXtFm+7Oi2eIIOLzhgAyVzye4L+rbFypt58eUNnkJs2q5DA=
X-Received: by 2002:a17:907:db03:b0:c12:74af:51f3 with SMTP id a640c23a62f3a-c246a33e291mr725930266b.6.1787326753472;
        Fri, 21 Aug 2026 08:39:13 -0700 (PDT)
Received: from localhost.localdomain (92-180-236-231.dynamic.orange.sk. [92.180.236.231])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3feeca188sm7395734a12.6.2026.08.21.08.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:39:13 -0700 (PDT)
From: Rastislav Szabo <rastislav.szabo@isovalent.com>
To: netdev@vger.kernel.org
Cc: edumazet@google.com,
	davem@davemloft.net,
	dsahern@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	dima@arista.com,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net 1/2] net/tcp: fix TCP-AO key deletion in VRFs
Date: Fri, 21 Aug 2026 17:38:22 +0200
Message-ID: <20260821153823.266343-1-rastislav.szabo@isovalent.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TCP-AO keys with TCP_AO_KEYF_IFINDEX store the VRF L3 interface index in
l3index. tcp_ao_del_cmd() validates the supplied ifindex, but does not
assign it to its local l3index before matching keys.

As a result, deleting a key scoped to a non-default VRF always fails with
ENOENT because it is matched against l3index 0.

Fixes: 248411b8cb89 ("net/tcp: Wire up l3index to TCP-AO")
Cc: stable@vger.kernel.org
Signed-off-by: Rastislav Szabo <rastislav.szabo@isovalent.com>
---
 net/ipv4/tcp_ao.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/ipv4/tcp_ao.c b/net/ipv4/tcp_ao.c
index 5094267447ae..26864621e6de 100644
--- a/net/ipv4/tcp_ao.c
+++ b/net/ipv4/tcp_ao.c
@@ -1834,6 +1834,9 @@ static int tcp_ao_del_cmd(struct sock *sk, unsigned short int family,
 	if (cmd.ifindex && !(cmd.keyflags & TCP_AO_KEYF_IFINDEX))
 		return -EINVAL;
 
+	if (cmd.keyflags & TCP_AO_KEYF_IFINDEX)
+		l3index = cmd.ifindex;
+
 	ao_info = setsockopt_ao_info(sk);
 	if (IS_ERR(ao_info))
 		return PTR_ERR(ao_info);

base-commit: 746fc0787f616da418ffc04a110296fe95d53491
-- 
2.43.0

