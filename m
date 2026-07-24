Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C147C4477EE
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 15:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905598; cv=none; b=T9ay15V7HtXF3h0X8JnJa51lBfaUezsWn/wrGFzgb/1XZ6Dpp+fycjxG0AhVrHSSuXWXPO9sYYhG7E84wVxGwyJ3YA+D1c6IAv5tKon13RhjyBUOkMVLthO6FKeI1yRzoOuM7NJojjL9f03fxfDrZsWBKXnxLvJsdSB/pyTNAdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905598; c=relaxed/simple;
	bh=k2IZxo+RQvcI6PXmn2CgQ7Kxmkd9qEBrLBFwu9yl9ww=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MYNlMoHg6b9I/6RvurhorqXWTmnGuR98ZlBMHfGSRsIk+EC+JMnCLpcNhUgFPJDrRkgb/kDy23UfKpGLeHPK8s8yKxK+b9cSLnUaJ+u+93zzajrFdYQ1tx15JjeNhJUMpiSDks8oqZ8PEFJRP24iaTcI27ywJ+jjL2ZqIhB63lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dAy2kBcL; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dAy2kBcL"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-74d55dac06eso238417137.3
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 08:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784905593; x=1785510393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x2AhQYo9R5DmlVUQgPw/1HHJB2ak8KRQjAhLOo34IsY=;
        b=dAy2kBcLmXLdDu2gBN7QfotWbwUU/7SVmzQDcoNZdMomTBo222gI6Ut/iFJxYpbnTO
         FXJmDugqEi9v2MMls/p7dBZfC3+0WNGegpy2HnH46AO6H7QHFRBvYKZOa2vmAdK7JKf7
         +H/8P++HFVAMAv7ED28tKpQ9V7qJZv3AQwdhiUq0EAzRX+lZAuDEu6KHN7uBN95yNUFl
         5ehJwcERw2vdHsPk/3bWuTBvSFYxY3NG5Z8JUAaXZ7wTXPiNUOeSdOIP8Y1ZKJPJ4noB
         KDURnFnN9EQ5+k1cW3ZfmbUcb1ZwV64jildulqUxHDnNGJJwn0m3QpQQ/gmg3ef1PCGj
         6vmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905593; x=1785510393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x2AhQYo9R5DmlVUQgPw/1HHJB2ak8KRQjAhLOo34IsY=;
        b=VBvQFl6Ik10zjkIgX+PtiGPE+O0ib7CH7a4qhKVH1C7vd/IrGgpcRNB4F6LfMaeASh
         9u73V7J1BJ8UU/s+//vbdeOXFt1HtV8gXMEMxspmU6rOgQpt5A4Uk9VFUjjJaSe5YZ/c
         Fx+BXoo7cG4UnzTeYBpkLZCa55SD9kTkKh5gKsv2wKNsAKcuKHzXhddia+qmW4gNZuym
         XmJ6/dhzTCPep5i0cI58S4wQE9z79fM8JwAe1QpsQbopAbFcEgcDNERi+lJa8L7e20ZC
         W9OLR0X0g4ntEk5281KrotGCzCuSs8s4yoKRzRczKrLaJpBLNsOMYX/S9P4PsYtkcV0J
         d2RA==
X-Forwarded-Encrypted: i=1; AHgh+RpGT/Suzssc1QheCmqZ8RHsRWQi0mn189uL1LrSjMTsnD0+vfLuosXP1oXdSvdxkboOUAbx3MMk0eZUSwWjiHo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0PJWg+9McEvvDXD/l8sxY9QhyqI+GkbJ1hKYW9wMmk/mPtDk/
	rjsn9Gmt4/o3qUUFNpJMnP9LawVDGmuz/nLt2rmOAqAQCJFMaXphktvs9NsPe/q6/YE=
X-Gm-Gg: AR+sD11kEEsgaIeSI4ex7MkXGCnPzNx27+saamIFewqHsRTNuchIR12z8OqE/c9thjH
	M3UrpPqDnfey+C/PDgbC9l4XpBhxUejSQxry5GuqF3AWpIdkJWXa+o73tC9k3Y8ilGcBhVplX2V
	U1T0YA1H3F5Pfr1wp+YJoHXb2XKnMH8nQ5ADHxTQYLOpEW2JdxCQ02DALToFIaBgKvyMFM455k6
	GELaxqpc1JJ7cKbw6Lz8+ArN3xTWKvb9t1Q8Bj1WYHuAc4zku8XZ3MPEbPnVmjykkKmzK/dHebS
	Ga2VJUg5I28tSYYbUzZICJCLIRn7GPfVwfv0rLRB1RTNo8xzDs6nVme4tgPBMaqC8Lm4qA9HteM
	3Ya55qcS7IoF4FDrJhi1U9BL0exPlY/sPwEqEydzG7eA/Bm57X8QQR0JnKO5v6WI4ptyl6w==
X-Received: by 2002:a05:6102:390e:b0:739:a2d:9621 with SMTP id ada2fe7eead31-74d5fbd5eebmr4372851137.13.1784905592834;
        Fri, 24 Jul 2026 08:06:32 -0700 (PDT)
Received: from houminxi ([72.244.37.221])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-74ad32165f4sm7744810137.6.2026.07.24.08.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:06:32 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	i.maximets@redhat.com,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next v6 0/2] selftests/net/openvswitch: add SCTP flow key test
Date: Fri, 24 Jul 2026 11:06:22 -0400
Message-ID: <20260724150624.3457427-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v5 failed in NIPA: the kernel rejected the SCTP-keyed flow with
EINVAL(22) in add_flow. Root cause: v5 installed flows containing
sctp() via ovs-dpctl.py without registering OVS_KEY_ATTR_SCTP in its
flow-string parse table, so the parser silently dropped the L4 key;
the kernel mandates the SCTP key when ipv4.proto == IPPROTO_SCTP
(match_validate() in flow_netlink.c) and returns -EINVAL.

The parse-table entry was present in v1-v4 and was accidentally
dropped in the v4->v5 respin. v6 splits the fix from the test so each
patch stands on its own: patch 1 restores SCTP parsing in ovs-dpctl.py
(the NIPA fix) with unit tests, patch 2 adds the SCTP flow key test
(same goal as v5).

Tested with vng on x86_64: all OVS selftests pass, including the new
sctp_connect_v4.

v6:
  - split into 2 patches: ovs-dpctl.py parse fix + shell test
  - restore OVS_KEY_ATTR_SCTP parse-table entry + unit tests (NIPA fix)
  - listener readiness via /proc/net/sctp/eps (ss needs sctp_diag)
  - add timeout 3 to socat clients (unidirectional connect hangs)
  - restart listeners with kill -TERM + kill -0 poll (wait can hang)
v5: https://lore.kernel.org/netdev/20260723084203.3483560-1-houminxi@gmail.com/
  - switch to socat per Kicinski; NIPA FAIL: EINVAL in add_flow
    (parse entry accidentally dropped in this respin)
v4: https://lore.kernel.org/netdev/20260719162657.3263089-1-houminxi@gmail.com/
  - rebase after ICMPv6 test merged; nc --sctp detection nit
v3: https://lore.kernel.org/netdev/20260715015446.530018-1-houminxi@gmail.com/
  - switch ncat -> nc with skip if nc lacks SCTP support
v2: https://lore.kernel.org/netdev/20260707034718.2717982-1-houminxi@gmail.com/
  - replace sleep after spawn with ovs_wait on listener stderr
v1: https://lore.kernel.org/netdev/20260702090908.1253688-1-houminxi@gmail.com/

Minxi Hou (2):
  selftests/net/openvswitch: add SCTP flow key parsing to ovs-dpctl.py
  selftests/net/openvswitch: add SCTP flow key test

 .../selftests/net/openvswitch/openvswitch.sh  | 121 ++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    | 129 ++++++++++++++++++
 2 files changed, 250 insertions(+)

-- 
2.55.0

