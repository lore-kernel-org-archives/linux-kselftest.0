Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF06A3812DB
	for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 01:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789520443; cv=none; b=pNYmaaVkyMfIRqP06MfFh2mFLkfGva1Dnymm3edknWovep7HPpQGIEdvMx/7VX8uJAJBmd2OZOtVL49yOfyPN+VFhuQ4WaOMNfL4BTKpirQBu+o/D0VtF/tzsHXyt9z/Jur09wvOgDtgqurM/Bht0Ni1yKuVfGEFWPrIaX8AUew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789520443; c=relaxed/simple;
	bh=xPK2t4dVouE2ovJ9joBM9NP69qWKdD0UzEOb1CVD8zM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d4TTr4q71/RKirfMB4MIr/8oxMSVOr5S2GSXwl604tcqN14G4/coi0NT4QT6Szrc/xzZGXhPFL1pcfkPaHuq1Jux4V0V5w29/DOn+klJrwjLiJHroj4W/Nyc+5i6FAtPmLFbSl1wVrhTFMvdud7Ko9feLVYKDiAJ1sqqIWhe/Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFuD0YKw; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFuD0YKw"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2dd68a16955so17931725ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 18:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789520441; x=1790125241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pGlFz15R1rbiCxHN0uJe/I5FW6CkIy16D/PLU4iFFD4=;
        b=hFuD0YKwh5HXZD2zW6PJVoCWA3p19jqRIITD7sumzouh9VjIndoGRyoFxGMEC1DRB7
         TZy+wXEzL2w0Tpw+F5INTAOnB96UmZyiptDyldAXSVbJOb7j4d3pCPznKWuM5hOKyUeV
         JDfLVxHD66xb9vLz99IX04wS7gxJmDHUD629Rqlttl2YoPkyP74c3FU8ukaiXSdHEb6I
         EkjJ4nNPmxRmD8ZwMAnRkX9gH6KLVzk3V/wIN9+9Yoii3+eyjYcKUGcIlq5c85HRZebI
         NnUTWwXJuaH1e3oNaJdgOU23cqvcin2BoRgb8Ybp4PXiFtQMq1zQRJZP703hihwilqfL
         a/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789520441; x=1790125241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pGlFz15R1rbiCxHN0uJe/I5FW6CkIy16D/PLU4iFFD4=;
        b=aU2uxyAdHHb7MJUYid6SykTpqDLD7pVQYDCZffMdqTFlRnUPV1iD4DEMsDpGblho2S
         OLvLWnb+SwlSIOsk1WKxLkK2NFGZ/I3u4kAahjIIcZ8XPocml6mxtBaqf+yASLj7LI1d
         f8z+9yVgGEjTUVBSAZCNvlM/rxY6TYrw97YmLRjUlXpbJvsZxxpkoHkdUTGbwXvyRlpf
         OhpfTeVUad6CZTZr4vXgsQcBeCKeWQN+uR1qtCnUHrAx4w3e52687k53KPSs+9VUk2Dq
         0iY7XukYorhSonDWlTpiGo7pCzSxQG0JKXipMh2cS9f5NRQrkBu1RuEMSTDHUZZ29JjO
         XE5w==
X-Gm-Message-State: AFuF++k0H3/Eg+BF8vqMr4EFZDgdEjqdnRQCiL4c4LU56OpizV9F1VcM
	OrOCba5YFt6zcx6rtdSMgbT8ajYQ8TXZv+BSg2ZhRpSOciTmPHofPINo
X-Gm-Gg: AYBFou0M0ZFrmVl3umF0fcs+EVpkO7p2xXtSUTK/Vwk7jS/zm0HOhdoN7JtpGLRX5xk
	zi2MNHrW8x+o+79yIrxCFxgqM+gQ4dyziPd/28gmW5nRPa5BSpbQuDGR+bXnQfWvJiV3R59/9kr
	WFtPAjpTEKUFdv4phW7PUKOLdsKDxrtkQX2LB6uWgrHBrE7SWU2IJVM5hi0KZQRgzfsBD4fa0iW
	aA1dG8MmU7u41H6qXDtgnwIhBffqyjt+A9eLaINCoO5EImMuO/U3A8uDlh5CvXNWUu3JA176+Ak
	iiyZtJK4lszfox0MCU3dzfvE2QOzLP8zsH6XVm2eh8F+TtYuMbb7hqqrQVY0mTV8jNsUYf5vVA1
	IC7qQ+4WBGJsCUe1X/Ixzblhs6O6dG7chf6x4SmaNs8WEZA43o8LNETmYtKOuwFZQhCzrwQ9dSq
	QhcRBB84idEYhwtFe1Z2nTBv8lWJezq3rlDJJjop6OL+f7E/ALL6OTJ3A9cQVLbqzl2xfeVvwBs
	L3VDtLzL17JrfGowScqaI2nrTQSiGMg+2FIFg==
X-Received: by 2002:a17:90b:39a6:b0:398:a649:8fa3 with SMTP id 98e67ed59e1d1-39dfe1c9d0emr8791472a91.23.1789520440642;
        Tue, 15 Sep 2026 18:00:40 -0700 (PDT)
Received: from narcisav-mac.thefacebook.com ([2620:10d:c090:400::5:7b05])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395bf6e8esm2123023c88.0.2026.09.15.18.00.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 15 Sep 2026 18:00:40 -0700 (PDT)
From: Narcisa Vasile <narcisav.kernel@gmail.com>
To: netdev@vger.kernel.org,
	kuba@kernel.org,
	daniel.zahka@gmail.com,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Petr Machata <petrm@nvidia.com>,
	Anubhav Singh <anubhavsinggh@google.com>,
	Richard Gobert <richardbgobert@gmail.com>,
	Coco Li <lixiaoyan@google.com>
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	narcisav.kernel@gmail.com
Subject: [PATCH net] selftests: net: gro: fix OOB access when under-coalescing
Date: Tue, 15 Sep 2026 18:00:29 -0700
Message-ID: <20260916010029.50911-1-narcisav.kernel@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When more packets than expected are received, num_pkt
could index beyond the end of the array. Add a check to prevent
OOB access.

Continue receiving until the FIN is received to obtain
the total packet count. This helps diagnose issues by
distinguishing the cases where no coalescing happened from
the partial-coalescing cases that didn't meet the test check.

Fixes: 7d1575014a63 ("selftests/net: GRO coalesce test")
Signed-off-by: Narcisa Vasile <narcisav.kernel@gmail.com>
---
 tools/testing/selftests/net/lib/gro.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/lib/gro.c b/tools/testing/selftests/net/lib/gro.c
index 7a333155de1a..85ba69eeb6aa 100644
--- a/tools/testing/selftests/net/lib/gro.c
+++ b/tools/testing/selftests/net/lib/gro.c
@@ -1211,7 +1211,8 @@ static void check_recv_pkts(int fd, int *correct_payload,
 				- sizeof(struct tcphdr) - sizeof(struct iphdr);
 		}
 		vlog("%d ", data_len);
-		if (data_len != correct_payload[num_pkt]) {
+		if (num_pkt < correct_num_pkts &&
+		    data_len != correct_payload[num_pkt]) {
 			vlog("[!=%d]", correct_payload[num_pkt]);
 			bad_packet = true;
 		}
-- 
2.53.0-Meta

