Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A523038654B
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Mar 2026 20:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772569381; cv=none; b=G4fto8uPmfy2sGhrgciRP9oDhpj5sY7nXGvIMrFTCdBsZ3SRzBNCywgn885JCYob+Uxr7KlMMceIVYZBb2NG/jiIsvtoC/CeAnWSGOjBV/hRTI3E48GFMFmKAGpgZVQNLkW4PtBXfUgTz6otV8TP1EP0r64fAQVIcQRpwQTx8sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772569381; c=relaxed/simple;
	bh=ZlkAHRongZW7MFNkY97hZ1B7jfOQGw7I4BaMQXtR3VE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jq+6VeLjWdD3OH/ORj7TAVpeoAW0SIQw0VnYiLZJnCH21VEezlgBN6goTM/4DQASKY9ArsOmfn1oaBakfTw31Ux6xIHsZSogLLbkRR6nnOISDhXdWhJzWAAwLfFuYXfuZWnAysF85b/BQOeAQP9RlWrkOoonDHV4YD28tuiZSwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fNE/Qw6i; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fNE/Qw6i"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-45f194e9a98so2367514b6e.3
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Mar 2026 12:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772569379; x=1773174179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yEdszIU/63CHIO1XYZ9+oYkvoNvBVjVhAjHwY5bSphA=;
        b=fNE/Qw6iXwv11x5pQMhHnMOMO026BQq0DRI2s/ipH0cfTtUdcNeVkJJZZJxhfxy0L8
         unPtuMRg2wwgqHWKjfI3zwpVNwvIgQg5zPszQ7iAhkNMI8BvvCyXmknehZY+sAOnR3TH
         Iq7lNjTpGLTRARHDXsxR453ozjfPQXI+z/7CuiEor2RSpsFGFQR5SHYwEnurshDjz4jU
         nWcSGeIJIbAv0bTg3xhMrwzEIG1yusQazgh7DhjVDsm+o/4YYLoifFGsZCzbHvTUJNVn
         QBFj89iDQqksblAFCrtdIrNtVe5YwXbr7dlDEPnhNc8Cm1ii20Sj99N+20vUdsuvSEkk
         BTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772569379; x=1773174179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEdszIU/63CHIO1XYZ9+oYkvoNvBVjVhAjHwY5bSphA=;
        b=J/oTD7f/+xSmU97fzAvpG1y4yYh7IpHdbl8NYkWqWjZfrTlk1wCnNeYgJjFRjdeHom
         KvDwKpHEGSKtVcO4IokKMwVM8gyyUHySlt/T6WjjwGnzyj/5PiKq4NDm9tbZBumi04DO
         D58Otk6/0v/vo1R3/N89xxlN/rIUp7gaPY6FWUXYnaGpzwBO6QTxuwMsvg5sKGTstYZL
         YeqTakKPOEwSwTvBgrn+uPv75cEo30qoZgCAsQ5PJh24x2hOvN937R9joS0SIPUBIWMH
         Z1UGvUHj9tw+KAqqlXVsiH48lwknX4hXCgNhgMvfv7j0FjrEqqtU6GFpbkecBBITgrP7
         2YAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjn7CkQ4v3V3tcuZaebnrTj8/FVfL2VJtmsQXnu7YbE6oNh9eOUeZV39mXTRxy2FZVaBWkh2XpWIGUiWS0HAI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFXBvqQEGY8HakO3ErvylB8KRNWuGRaw2pmpbP4lfCcxBxSHAj
	UrAZCkzUCSvilPuuo1MFwhcPrRvF31+0EHtzLaeVexUu1TnoqqYIe+nO
X-Gm-Gg: ATEYQzwy5XpjZGJzG8rz0Up3QJWTYSmhcqgoxSejH65oUXG93hTK8nbhklZ6Hkvkuu0
	EV0is/hvj2NkJpH7XnEyTTeYU9xMaxiOIpM8OKvz79qQJXfEKPXWpzyzVYsGa0PE4uqI1xEhFNd
	79sKpG7gsp5tov8O98QCxYJ10YbJRztQEM2XvInuvnN6Waj9zzjPM7tSJKkInorxLuZyeCWY873
	++N6M2sW8eLTOUhlejjjkfdjcDF1Nu9QF7QRIblfj0P4xWreZyVkqnbbfCKQV6S56lKsf1N0aCz
	yu6BIpfwfr+qxuk0e7CIcV2Bh2x6VRFFGUUqXdrTGYuT9hFrhqm8INnb7yqMwx32cOUeLUrdNZG
	1IfRErkgO6firmHPPzxcvcFjCXzR1bhHHrRZXrYNnzscflIfAZvXAiAW1oyWI25GFWO8ds11axM
	HLR0BUQJPBetNCrrAQRJu7aQ88LWmEbQ==
X-Received: by 2002:a05:6808:1491:b0:45e:e07c:3fd8 with SMTP id 5614622812f47-464bec61c64mr8375764b6e.43.1772569379579;
        Tue, 03 Mar 2026 12:22:59 -0800 (PST)
Received: from localhost ([2a03:2880:12ff:70::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160cf23977sm15103082fac.4.2026.03.03.12.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 12:22:59 -0800 (PST)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S . Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Gal Pressman <gal@nvidia.com>,
	Nimrod Oren <noren@nvidia.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next] selftests: drv-net: rss: Fix error calculation in test_hitless_key_update
Date: Tue,  3 Mar 2026 12:22:58 -0800
Message-ID: <20260303202258.1595661-1-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This test verifies there are no errors when a devices RSS key is updated
while traffic is flowing. The current check is a no-op since the last
sample was subtracted from itself.

Fixes: 933048fec4dd ("selftests: drv-net: rss_ctx: test flow rehashing without impacting traffic")
Signed-off-by: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
---
 tools/testing/selftests/drivers/net/hw/rss_ctx.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/hw/rss_ctx.py b/tools/testing/selftests/drivers/net/hw/rss_ctx.py
index 97246eab863a..d7cb30306368 100755
--- a/tools/testing/selftests/drivers/net/hw/rss_ctx.py
+++ b/tools/testing/selftests/drivers/net/hw/rss_ctx.py
@@ -357,7 +357,7 @@ def test_hitless_key_update(cfg):
         tgen.wait_pkts_and_stop(5000)
 
     ksft_lt((t1 - t0).total_seconds(), 0.15)
-    ksft_eq(errors1 - errors1, 0)
+    ksft_eq(errors1 - errors0, 0)
     ksft_eq(carrier1 - carrier0, 0)
 
 
-- 
2.47.3

