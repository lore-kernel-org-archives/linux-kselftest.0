Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A3935B645
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 16:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775580597; cv=none; b=E6G0nD7NzcTyUupUp4rVDikmlSCnX8BzZ3sne9tr6956f/rwj7sTqQk5NJ1BOXXS5khnqfDrN9niswf8X9o5uFiMr8RPbY6NZmUYERqFyByoxMzuf+aDFnwrs+LzO4NyyUhMfNwBy33+4ahVSUoM1SWwMEVJ5aVCucVQNCW5Afo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775580597; c=relaxed/simple;
	bh=vlaZpXscWUZ3B05OE1majSMSg9sMzDiqX6C22P6IGgM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dDlNDgZLdAFzqykX4j77p8b0D+aiakRviOSWdhtfj9OKWWxpqipE9bkbmSjzGsXoUzikjGI19xsDQ5ejdnsH5xZhpls09Ff1k2Au2w+YcpXPG+QR6VCpgatbu7TpAR1hcdDsCSfy+ujvTSlT4gd0fjREbjc24w2POdZptijKe+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6RfnGXW; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6RfnGXW"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ad9516a653so26954915ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 09:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775580596; x=1776185396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EUCVU3vJIe9dfiNXrQ/I9OAV/ScAJcuKICE2xaQxYn8=;
        b=T6RfnGXW6NEC4RkguSTFVOdpeoAmAcGRW4MJ1Sgu+lgKUt5lbqy1jZ3TgulGyNLbNc
         GSjLCG4jyWqtVkLUmVy0bj6XJRaMP8V1fYcEOHztIYWBrVEfx3ee/X/h8kvjb/Cz4RVH
         7D1XKBqw5paEmD14ix0E3A5baabuhEsdOUT46GKDUOkqOnl0w12LVTIgrXb8nNPBsxeb
         UMhaatyl9yzs3/aFZqFtn+KcHyhBr83lUQCBWwst/H/ee9BodQEsNBBF0aYeWFqfP6Fm
         wNaPDpgNZGsGFChKUxi16lwhR0dE/jA9okyrRo3H07BkC+Ws+LX7R+gt7rkQcpVjADm0
         hmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775580596; x=1776185396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUCVU3vJIe9dfiNXrQ/I9OAV/ScAJcuKICE2xaQxYn8=;
        b=Q/9h5AqCv7deinw2DYBTVi+XEqnN6DiiXqVGAKEKLXdc7ilwyNoakLMLzNN0/Dsbsg
         8Q92jVVerevTws1HBBKdwCvy85ZFiSrptZaWIXJxvHpCGihoEiuvCpsJcFjRUG7l5ynn
         iXMryhsswOC0ZhAonCnJa2N7cqDAEE+geRzU4tROOFiPMnGH87snaNWDDYPcV6IxSoR1
         mev4Wqk++y6Lvvuw2Hsry48E4mUbjS0p72x0ZCBLBX6ZhdamtR4AusZxbSv3k/uIhOAB
         s1gXN14V+mODAEah3n2KNHz40sQbFbO03hTB0pD2nufZD6VMLBmMu2u9Q7w5glilFdgx
         my3g==
X-Forwarded-Encrypted: i=1; AJvYcCVm/IjtxNGAOUWL79bXUNOuJiqoGZGCEd5n+tVG1n1hPWF63oYow4uutIewmGFCwv/A8cpcBVDYhHUKWhTdneo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuKk/eWR78MUcMbgmukKYRhnhOne5bl8OsTdOy6CTtaj9iza0+
	Wc31yFo2i4eGjWyYw29yMSgSfFeTVI1l9f2BofCltKEJEZWpWt6okjl4
X-Gm-Gg: AeBDieuK58euxldk3Dm0uepRiUHu7OPZRTcmFhvUvYPk3KRWUuGDN9XEAxtayzc/9SX
	utVOANL1IlbcKg2vYqw04D/2+rPxz6T37CB0tNSJQOO3BDuDCk0fxfG4DKTPpiK/6Ve8vYhHUs4
	xOyJpKXMzGva2GGsG4EZLzgzVJoXZ/yEec302abnTXxkGwQTLB0TFKHSPC1KijgXuBS6pLUjPrT
	dI6jzt2Rj2Ay3xLCsGB63qJ0IMBJMTYLo3T8h/iUTX5/Wpfw1hFWPJ98ZVQ4FIWGchRAZ/1WMeB
	sjhe5MyXc+n7QVRNvw6ckh579QT9dku/L3KfCoq2ZWR0w1R4TYtpTBsxVZdtI7ahKZ/RnnKW+Dj
	JD+b9a9uAid2cDWHfaQCxpwhgV3YuelKpWKdYoI3ViIh0Mf8yz4GxD5LF8gNxMradCr9xY6A+Ob
	NnSOrtPXdPPx0t2VHcGgaNCAvBdSEG
X-Received: by 2002:a17:902:f70f:b0:2b0:61c2:8e7a with SMTP id d9443c01a7336-2b28178afb9mr197013165ad.25.1775580596074;
        Tue, 07 Apr 2026 09:49:56 -0700 (PDT)
Received: from localhost ([2a03:2880:7ff:71::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af31sm173287125ad.52.2026.04.07.09.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 09:49:55 -0700 (PDT)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S . Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Petr Machata <petrm@nvidia.com>,
	David Wei <dw@davidwei.uk>,
	Chris J Arges <carges@cloudflare.com>,
	Carolina Jubran <cjubran@nvidia.com>,
	Dimitri Daskalakis <daskald@meta.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 0/2] Add selftests for ntuple (NFC) rules
Date: Tue,  7 Apr 2026 09:49:52 -0700
Message-ID: <20260407164954.2977820-1-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dimitri Daskalakis <daskald@meta.com>

Thoroughly testing a device's NFC implementation can be tedious. The more
features a device supports, the more combinations to validate.

This series aims to ease that burden, validating the most common NFC rule
combinations.

Dimitri Daskalakis (2):
  selftests: drv-net: Add ntuple (NFC) flow steering test
  selftests: drv-net: ntuple: Add dst-ip, src-port, dst-port fields

 .../testing/selftests/drivers/net/hw/Makefile |   1 +
 .../selftests/drivers/net/hw/ntuple.py        | 162 ++++++++++++++++++
 2 files changed, 163 insertions(+)
 create mode 100755 tools/testing/selftests/drivers/net/hw/ntuple.py

-- 
2.52.0

