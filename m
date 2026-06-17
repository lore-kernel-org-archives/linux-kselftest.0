Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8383B27CD
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 06:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781676653; cv=none; b=gJnalSLc/cSw2zddCO9eaDtPORCeIIzhlnIvY6ZbGaLM4hIxeZBZTn+v0OXp8X3Y/B39ekqWTDLN07LDjRSTDpURLkPR1+VyVMJ9MAivrCmBvma7pixZo42gRbyImTnQyw1zhY2qr8+qS1hmsuMJ0ADE7exRWkz7evlwZXHo7fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781676653; c=relaxed/simple;
	bh=pagONdv6g6sVLo6prEeXJyORVUNqZEAazjNn/2zge2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jaV43CS8BFCQKHgDw8SdYk78O1Jk9LtoSdQaSuEwnmhDnooseGJbhQMcif72QetlfMYkfrlUfcpWJptbTfMx7WHBCy4fEnJzTa72weJl3Y9p7w/hATk+JHvRQm/dPGFH4YwcEWUPVsQFLhNyUNcubMDPq80oOjxkHVnxLriuAjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=ntmOWTxU; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="ntmOWTxU"
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 58A393F610
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 06:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1781676650;
	bh=pOwT39UQWLw0qIZF363opJvNkgJrZg7ks6patcKb+Oc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=ntmOWTxUwe9vsV5PycXK2rU8SO1vcA/gJfZanXajS2iI9iuOm//CFanrpcIWYNBjj
	 8VaCrZbYPwsrkNlgPhqj76yA0lxuDRNGWo61Iv01K84xykR+MiM+lnfscPDXDyVztA
	 xW5OopWhlxYNG1GrSwXspBIkENaYYE/00sZj86QyY2p84BAj8LvncSU3r0wTcZYecu
	 b7r7XPG6UXsyFS0YcHIVp/9oQ22DFzCl4WTfVdm3Co4ySmed8LdfaGBPTdi5xNpTzm
	 mZtnp6QXebmPlN2CfQzzgqdmCPzIuFJP+SWgieyzndos6b9nwb6bMD9uDtIyVhEgn7
	 1K/3iz1dEHju9DSy9ff5NTtuWKJ/FxJCa+HIZN3KDnyQuSQuWGlABtpvkmDXYR6Xmw
	 kotTHxwv1zRPlrj2RqyIV1cMxCBL5Fb8rqFsHKsck+AY6zrEFwPnxAd8vjIfPRanET
	 xMgxD66s/ynerLk/VI2JOjrXezrHVX8gAf2cz7s9DxVtQ4vnVlHBM3vZZw3tDjd6wM
	 MpaqnKW6lC7WFEg7sROu47LnmJydUIzJdN0m3Grsg0+q6kyo9qETWJBcfrEVOZsVPo
	 g3ZEIDYCNrsc5f/a8aNeTaifMRNWHP5FBGI4tUPbSfuc266YMdCtucp5ludBL70A83
	 lIJOP2umFZld2SDrBWRvdONg=
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-45efa2f7009so3694662f8f.3
        for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 23:10:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781676650; x=1782281450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOwT39UQWLw0qIZF363opJvNkgJrZg7ks6patcKb+Oc=;
        b=NLJBS9Ioa41A1PfvaJFxgZgn1Hbl8+GicLzBZVr3PaogK2AvMMLVJFFeaaL/DJOiFz
         Mv9Vek0HvCDxHv44r1bOUFvV8O46ELTG7Q3a8bqI+XkOVTimBSUUI8J8lyjrxMWmyZ9c
         EsczawrZcsQFuMEMa84OnNFMiEDbWs9Vk6ENeCcGnATfupVJRZZ2sVUCC9eiPoM2harm
         yEDib5dXaRY4+mrqmogBRr7AFRNI6fe1+58K5v+TMJ8Mw+Zxa5GcuKneL8wTv81fJlNe
         7ZV6HnrpKdk6h2K+tIc42VTfJbe6+5VlRZrAYALQ2IAd1MheQ3zYHy6+9RxpuSI278Bx
         rIPw==
X-Gm-Message-State: AOJu0Yxw/XweK4y4SUAXCe/Gt5sC7YtwCgEOSyTMYojXOrFeiJKlYqTR
	hf3mC1faJks1riuKFtZo2fH3XXwdqXhEYoiXttfNz/Oe3qalrdmN7JIY/8dc4sYXQ32KxtRJdE1
	SzuZ6aKM/YUcxOXvSYyC3BPLqeQu9Ld/oIq5grNpJ9bqmYsAKlE/KV07GPRIC9x075B3Tr0eszu
	YVwUzfReB4i5DhHgvmPPTq
X-Gm-Gg: AfdE7cn+f1Dt0BuNbfZLHcqW1meMxGfETX/mh1BcwFSMZW8olewk6QVDG84YCmnJQDJ
	w76eaJmLJZP4Rr8UkAEraIzwBe5fOTNPRkZ2je+c9js+0AjEBRTdXn7+7stpjFBY9vO2BxoySIA
	aUUQYpSDnt31fktBAE9drfq/IW5q9iPzK+m1fIloYodfIZs8QQSsCt4PTYiWSEHMoG6AT0qd3q5
	7PboBD8MLXFCGNR4Fv7HHCJjQmW795C44dJTF+UaFRvbeNeJZlGMu/7l+YSJQj8ve0pM4iTcEYB
	xeSZbDKA+Izld6qqsrDeNDiY3ORM8Hb7Y9V3sq874BSR15CUJyrhLuv0WxIUQ/cYCLPYtkL5tJ+
	LDajjFQ899Y8=
X-Received: by 2002:a05:6000:2481:b0:45e:8526:7dc8 with SMTP id ffacd0b85a97d-46238aca122mr4401221f8f.25.1781676649664;
        Tue, 16 Jun 2026 23:10:49 -0700 (PDT)
X-Received: by 2002:a05:6000:2481:b0:45e:8526:7dc8 with SMTP id ffacd0b85a97d-46238aca122mr4401158f8f.25.1781676649267;
        Tue, 16 Jun 2026 23:10:49 -0700 (PDT)
Received: from ross-pc.local ([2001:67c:1562:8007::aac:41a0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f309sm46674988f8f.14.2026.06.16.23.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 23:10:48 -0700 (PDT)
From: Ross Porter <ross.porter@canonical.com>
To: linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Cc: ross.porter@canonical.com,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Oscar Maes <oscmaes92@gmail.com>,
	Brett A C Sheffield <bacs@librecast.net>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] selftests: net: fix file owner for broadcast_ether_dst test
Date: Wed, 17 Jun 2026 18:10:38 +1200
Message-ID: <20260617061039.79717-1-ross.porter@canonical.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The broadcast_ether_dst test can spuriously fail due to file
permissions, depending on which flags tcpdump is compiled with: If
tcpdump is compiled with the `--with-user` flag then tcpdump will
step down to the provided user after opening the device. In this
case the test fails due to permission issues, as the output file
is owned by a different user.
Debian ships tcpdump with this flag enabled, so this bug
appears as part of our kernel testing.

To fix this, we can ensure tcpdump remains as root (regardless of
whether it was compiled with `--with-user`) by passing the `-Z root`
argument when invoking it.

Changes in v2:
* Moved '-Z root' before filter expression for POSIX compliance

Link to v1:
https://lore.kernel.org/all/20260610062230.71573-1-ross.porter@canonical.com/

Ross Porter (1):
  selftests: net: fix file owner for broadcast_ether_dst test

 tools/testing/selftests/net/broadcast_ether_dst.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.53.0

