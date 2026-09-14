Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED329416873
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 09:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376679; cv=none; b=DsAanPv7FLC4g8fzMEoJ0HPx5hEEW8YUUPOcVUvEk7sM4c1FBNPnCVqrtZXtb1Ia7uhz2yuPbuLx5WzMNZJWaIzbyxitVMNBNs3FrolSbezIGOCJdkkCoIX4PuQjkOx0ngwWjjnnQFiL14llVviMWBZUrl453rZaGp0x1zJOWyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376679; c=relaxed/simple;
	bh=pAks+KPInh9ZWtI6ct5/genc48SB9KuXEC2hZWx4L/4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R8uiYlYWQcPkfMS8+Nx8aOkLlCGFX6kfWWHehvPR9mrcrgIj4o9Xy3RAWyKdHwVg/HwClaLj+MgpMFm/PXlsyoxEDqTn1kqhOIMjsilKxTd64KzKCPFEd9aDFRpqHGC/WbcuAhiSwpUZQNNO4fiQYG2AwyGEYDUKmWHzuG1Rdew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.huji.ac.il; spf=pass smtp.mailfrom=mail.huji.ac.il; dkim=pass (1024-bit key) header.d=mail.huji.ac.il header.i=@mail.huji.ac.il header.b=UQW1AmI6; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.huji.ac.il
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.huji.ac.il
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.huji.ac.il header.i=@mail.huji.ac.il header.b="UQW1AmI6"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7af75f51so86435e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 02:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mail.huji.ac.il; s=mailhuji; t=1789376673; x=1789981473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fmdVUI1/NR1WuBXeu4WYA7tw+26r3ITA6s7ZdRYWlzo=;
        b=UQW1AmI6gZa8aEIz7daQRPEBLdrPQaBUqmR4bhHzecYwiIQbpZ757T+fs5syCsHNyg
         TPJCDILI+Zstl+jTXYmibw/BFQJ1F08+0OrGyzVnM9HMJyf4FbnFrAKLwhII0c/nMVsN
         aPbl6JEq0TMsoJpXoeZUHw61lvENz3nOQ90RA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376673; x=1789981473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmdVUI1/NR1WuBXeu4WYA7tw+26r3ITA6s7ZdRYWlzo=;
        b=hHupJe3nlpe6Qd+jXzODy6oq43EmUJHoHxEHmJ6yQYYGqZGTeWrib9o7A1+ZtQvxyA
         F8+FWjjCwgNtFLgjIFQTssHWquoHF5Enc8QgYMe2TwfFMF/9ZrCnG9IhH6SpCuPd64j/
         GqlJ3l5JqRIMJWDwwBFbARYYlEMicFDD2rmvtBkXbpzYuHpREej+wBFOH1DKWN6m9fw3
         jiggKrm0wykSP0Hotml4bKEWYMnJQiGc8oajOfUU2r/SOcNtj/P4uAffbLR0F0oTBETQ
         TgcIlyDp/5pKloXm0CjCdihbAB77eVgYHFRhkqa9AOJoA8WJXt0nP2M3yc0zK6WBRwt1
         3Cdw==
X-Forwarded-Encrypted: i=1; AKwUvBy9i7bhrEOH0ku1w1MArxMMg+P/+gSTRQqzn2vrVRM0uTwopATU4afQr6MOxXSBBnBsnAWfLknE1/3HgUVg9c4=@vger.kernel.org
X-Gm-Message-State: AFuF++mkKRkXiHcwZQS90gYTvPFsYdWAX+HvcwfeFvO056gx1gV5NHcW
	4C8691aHnMyH03j1HRI9gIcv/6RQvNuWdrhl/Go477yKn+Yc9+uprjS+uEQONYh57A==
X-Gm-Gg: AYBFou138dA96STjwHLs1Kjl9B/rmupy83m6pbHb/0+cqyfuwGBT0xIalZ+Iap4HQvA
	i7FcgOSHoOdB8fpc3LBjYpDulStjqoestvWoXseRuCrQx/EA/IhobSY0l4KW72f8r5/6sO/7Pfj
	ld0JsdKGCPTg/aGap1aTxrBaYO/p6G+D49ASkeOynLwpWCtpQq4/LHHzbGVRVevyA7YoqPVp3XY
	9ohH5cp5d7lzx/q9/qWSM4+fowkWZdxBnLQiI0Nc/FQRvcERFQvcoYApr9bBXzV9w6d/ATYkP2S
	FOvOTNVaVn67z5W78BGysWJf59khFUNS3VHOEih2ozYrLem18Ky7Sb5zmG0aLeHNqa2nYb8kaMF
	wC9urg/uw1u7R61gqhAhOTWgW70APdEGQqaXf37m95OCm+HfL7uIm1/imxMSYu+YqzPKX6CpCYh
	4K4AJkd+ztFXpaC258ovxnEP3EvAOFEClwN04pmeiI3uGeMw2/eVPCu92hDZ5d5Pu5H1y0JdBV0
	5+MjEhxCxXa45Ro4rOsWy1gg9jcgXOLP1VP
X-Received: by 2002:a05:600c:a18e:b0:49e:7c8b:fdef with SMTP id 5b1f17b1804b1-49e7c8bfe12mr1732005e9.2.1789376673036;
        Mon, 14 Sep 2026 02:04:33 -0700 (PDT)
Received: from inbal-OptiPlex-Micro-7020.tailf3f5b8.ts.net ([2a06:c701:c272:d400::7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6a06cfb8sm227502585e9.5.2026.09.14.02.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:04:32 -0700 (PDT)
From: Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>
To: netdev@vger.kernel.org
Cc: edumazet@google.com,
	ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	amit.klein@mail.huji.ac.il,
	Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>
Subject: [PATCH net v3 0/2] tcp: exclude old ACKs from fast path
Date: Mon, 14 Sep 2026 12:04:06 +0300
Message-ID: <20260914090408.1435080-1-inbal.lipshtat@mail.huji.ac.il>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exclude ACKs outside [SND.UNA, SND.NXT] from TCP header prediction so
that they fall through to the slow path, where ACK
validation is applied.

Add a packetdrill test for a data segment carrying an
excessively old ACK. The test fails on the unpatched kernel and passes
with the fix.

---

Changes in v3:
- Add a Fixes tag and stable Cc.
- Clarify the visible impact of accepting payload carried by an
  excessively old ACK (RCV.NXT is advanced before the ACK is rejected).
- Document ACK sequence validity as a TCP fast-path condition.
- Initialize the packetdrill test with the suite defaults and disable
  invalid-packet rate limiting.
- Add an SPDX license identifier to the packetdrill test.

Changes in v2:

- Exclude all ACKs before SND.UNA from header prediction instead of
  duplicating old-ACK validation in the fast path.
- Cover pure ACKs as well as data-carrying segments.
- Let the existing slow path handle validation and challenge ACKs.
- Remove the packetdrill reproducer from the commit message; add the
  packetdrill test separately.

v2: https://lore.kernel.org/netdev/20260909075644.1408171-1-inbal.lipshtat@mail.huji.ac.il/
v1: https://lore.kernel.org/netdev/20260906123151.1391349-1-inbal.lipshtat@mail.huji.ac.il/T/#u

Inbal Schussheim (2):
  tcp: exclude old ACKs from tcp fast path
  selftests: net: packetdrill: test exclusion of old ACK from TCP fast
    path

 net/ipv4/tcp_input.c                          |  3 +-
 .../tcp_rfc5961_reject-old-ack.pkt            | 29 +++++++++++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rfc5961_reject-old-ack.pkt

-- 
2.43.0

