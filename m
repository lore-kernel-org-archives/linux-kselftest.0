Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CB53C872C
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 07:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246850; cv=none; b=kPa+JddZzV0FYSTVeF8t5649ZzYDPfY1079ZJ7Rp3rxvWNcLjVwGic1zeyzBNixuiwqHHsyGyAX5ZDFY0yN4nKLKuTze4HKkFyo8u+v1AT0vHSI0qtzPFPgBf74LLZNeA/l92akkuhKVbk3KdnkaPL5MFH9dRB1O0nIaqiBAWYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246850; c=relaxed/simple;
	bh=J4RGoZnnRiQoevlGy8lm2wL/d6hz8MOcWCl8s2VRWIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PpN3cTZmuzkNm2D5W+yGn0rNBI58A/JMIplYs7hQnHFHOxp0yUubCdF2VkW77E6bdFRZGF/rSAwuchqc6vUWFCXGwrxgWPZiHuQP4UYdWVZpe8VPCKJUUkgXYviIMPH7kr+mG/iTye37V560yWv0PXiGkrCmrT0bEaB+rHhk2cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rx7B2w/8; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rx7B2w/8"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d942c7cc2fso4923775ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 00:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246848; x=1788851648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AhnZnMS1zl6dPRGigIwYLk+xKIiY6xljGos5e3aMaGE=;
        b=Rx7B2w/8tRz6cAHeO+mx+t4X0jgQpoQZ3mJ/trWX6JAjl5BpQGu0Ua1xi4/5Ori4VF
         4sfR2V3rbMrDLT7mVaDLNxiTFHPreue8z8QVqnZZ9Be+OGookjnOn2bHtlpWcDlznweS
         hiDsf6qSB7wb0k/c6yzB5zvL2L62waIl8OnLmCtWMVzGTuEeM+05WnLXxYKPr3FMtjgD
         JGdhak87kZib5lsTVyrarLdeQaUeuiGtmyRVeKwviPbO7Lh6X24YMgAk4dwDmFNmX7U1
         MrWWfjqiiNziQ4wGITOmTBXXu643s9mDUT4xVempFU4Oppf5GYovRfyfDu64UmITMNQ6
         78rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246848; x=1788851648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AhnZnMS1zl6dPRGigIwYLk+xKIiY6xljGos5e3aMaGE=;
        b=d+DrtUAjh4C2IVBD/WTPmgO8lfJfpMwK7qD1N5Lm0aOF9mJIN05dmH4SYygClR1iwe
         86zqxSlxnsIgghdagEbKkqsxqxByIEmvKQ6Sc1Y2hYSH7h6PqPad0xAG3eM4C+JXJu6v
         1iMouEOLo6MUHKePHWGunzMRP0TVGLc7KGBFMq9iVVjwDzWhVzYzzT0oRMuywIdZk0Kb
         nVZdrg0hxwK2fdW93S2lolgv1xeSpheo4QwQUSWrpPBnWFFpxzKtyB6/IXkPQFKxaZxC
         8EBkDlW5/B7muIMa3R/tSxTWXI9XDNjGSfxg94IgQzA3vNt7uoWXGIa/RerV/ygbQINt
         vZ7g==
X-Forwarded-Encrypted: i=1; AKwUvBzYS75mqYoSMdtS5UsMB9Qmoh9xaC2rTeJyaxVYE4dMn5LAqajJ4g2aVGL+tTDSjsmLFhnrDIQzXgW18tlkyGU=@vger.kernel.org
X-Gm-Message-State: AFuF++nMAzwGQiJgmFmmbdFxBSfjkOozVHuKkjV/v+Wd689RlfQBUtcg
	Awmhnfw4EKEa0kGZVYfUBPGRHNpga/x6G1af3h3Zf3ZpB9PuCSFOJE+/
X-Gm-Gg: AYBFou0dRK2VihpxU/r0cgDnMGzbEhRcu6M4tKHzsEHjnPmOtvZaiWflqhqRMt1KsWV
	geCTZDP4RaijmAjRXIKXI/cz9SOf8UCcMQraueQ8GMEzx1CyppSkpmZHp4NAncx2i/Q3RI6Fmww
	xkZs843KBACHFpxQgF/t4qEYjYUglzFZwQbkV5DRF2xZehnetYCBynDwQXxEk6ll/qG6QFW5u5o
	dWEDUVPMVMpXApkHnktcmJ6f5YqvL8aY+X8pnzi0XDob2GVtFoUoep282G7cXnA0TybiDFDqxg1
	G5EwL27NYRrBuVrZsI2CwsLZVOGFwQC5TXDvpITuJ+gzg+jxuGeWChiR3ow+qy+mx8tzLaZv8Ea
	Gh8Vst4bortQdzSAoK41dchXc6oSUjFTVU8/yHOl11+T5tuZloHi5ujdvsqddYS3hXKB4mnIlTX
	izs0vPD/e56Z+FFNhdKt38edUCHqgOItWpDGcuh1ohgGOCKe6RGjPIOtinp2P3dJFkN4HP2gxcm
	g==
X-Received: by 2002:a17:903:228a:b0:2cf:9347:f445 with SMTP id d9443c01a7336-2d74ddc705cmr412540935ad.10.1788246848073;
        Tue, 01 Sep 2026 00:14:08 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e2a95sm34374175eec.23.2026.09.01.00.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:14:07 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Subject: [PATCH] selftests: net: ipmr: Avoid memcpy() from NULL in nl_add_rtattr()
Date: Tue,  1 Sep 2026 07:13:53 +0000
Message-ID: <20260901071353.3302900-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nl_add_rtattr() unconditionally does memcpy(RTA_DATA(rta), data, len).
For zero-length attributes the callers pass data == NULL and len == 0,
for example the RTA_PREFSRC attribute added for proxy MFC entries:

	if (mfc_attr->proxy)
		rta = nl_add_rtattr(nlmsg, rta, RTA_PREFSRC, NULL, 0);

Passing a NULL pointer to memcpy() is undefined behaviour even when the
length is zero, because its source parameter is marked
__attribute__((nonnull)); it is flagged by fortify/-Wnonnull.

Only call memcpy() when len is non-zero.

Fixes: 05068eaa67b2 ("selftest: net: Add basic functionality tests for ipmr.")
Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
---
 tools/testing/selftests/net/forwarding/ipmr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/forwarding/ipmr.c b/tools/testing/selftests/net/forwarding/ipmr.c
index 9cd9f70de132..d3e26341821c 100644
--- a/tools/testing/selftests/net/forwarding/ipmr.c
+++ b/tools/testing/selftests/net/forwarding/ipmr.c
@@ -120,7 +120,8 @@ static struct rtattr *nl_add_rtattr(struct nlmsghdr *nlmsg, struct rtattr *rta,
 
 	rta->rta_type = type;
 	rta->rta_len = RTA_LENGTH(len);
-	memcpy(RTA_DATA(rta), data, len);
+	if (len)
+		memcpy(RTA_DATA(rta), data, len);
 
 	nlmsg->nlmsg_len += NLMSG_ALIGN(rta->rta_len);
 
-- 
2.43.0

