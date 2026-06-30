Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194AF3FE674
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 11:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782817338; cv=none; b=MiO1kZaNqZycyLna+hVyHt+Yruk01xJZQ9Nc6wFLG0G6ODMiy6WDmUYmcRT9kQ8DDbDxD3VF2beC9NHkczq29Zxzk2DrnPTYZV18ZlaJQbD86Fi6yfUfxiXrVZmzts4UduEZ4Vwx23abJ/UJm/zOE1xx2B88gJBnz7bYH4QwpEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782817338; c=relaxed/simple;
	bh=Ky5CE7imFLCL+LdihcagyThlg3g5Kbu9v3WlDuHEhs4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t/rb/a/z9+9W2nOdSrUyxVyUez3byIJmq62AwQMiDtfGGT4DQnoo/x8c0Tz9gzrIitJGFXe2xVtKQ7zDgGr7yFXZp/zbVyURG7loMaEq0m1BlFxkMVt7EvYX1LO/baq4P8UAr5O+xe8WZofBzG0XM8PRbdFNYf6L98RF32WJRhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c47CNE0w; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c47CNE0w"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c82538b6c0so25904255ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 04:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782817336; x=1783422136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wSwj0KKZ3DW6Npk2hIc1aOdKUnyuXiuy56Baluf8DAM=;
        b=c47CNE0wW9lwaR1bBk08Nf7moA7gPX89TYOevEeYgtunKL7IFZl9VTaXhGyb+hsNHp
         8dOmTW0osJQ0eUn6MXWjGCr3MPSAqPmGLr+ib+ZpZhO5e0PXqgRPf8a+vZHLZQJKunKp
         ku3FTU5WxMIu4GpbWLTG7hYyGk5wWhgAT7t849gwsXBPMgd/mdpk3LOjanlR8KjQUVxy
         mhGf72BklQznZ6/OfRSBXTUbXGEtbaycYT4zP9sBcczeU1lSEeGbEvMPI3euLS+lbojc
         JcDcUEE6djhn6VMi8/DKTEnCL7bA7ZS2xEsdxnrtJ0bRdq6mGvB5gwmdS4CPHqTqWVPu
         Tw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782817336; x=1783422136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSwj0KKZ3DW6Npk2hIc1aOdKUnyuXiuy56Baluf8DAM=;
        b=b6x+B6oSqc0JxZDGzcXUIg4Jgir9MXwrmvUH0RKI9oiNrTB//U9n815Y7YRDlkNWLB
         KZmDzp94oqGdPlRRx8oTFwPlU+ildamCgK6UEgwCR3ZLzAKpskNh90F8A+EZKwx4Y2Cv
         TwyrPTnCi69kdrOlXmehTt2HnDgkIObOsjpOMfr0JHVSu2pycpSzpfHXgLlnDE2p4YAD
         GzW0pwPf5j4DDUnx2CTYqZoC0yeI0Jtp5XhdIbREhzVbLnCzXKbbSRugg9dZ8Ecf//pL
         rUM7x6GLIsySQSXEo/JkHLI20tNTSzop0PRRR4KBXH7RxSREsyvG/zZIk8kgfvcb/lph
         GrSg==
X-Forwarded-Encrypted: i=1; AHgh+Rq5z/lXqmrpVFaCVhHVqjePMdt6keEigHbNLQyhpFYovh3uo+FGt/caIgRJwlkrAdCOIFz2+8/0iV/TdR7GZXg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy8jZ+UjTL/U+Zo/L9z3YS30E+Q8RwnpIW7XTUu5Mh13PcGs/p
	k4pJD14bqWSZvKUtZRUAmwsfVayT209zckwlGyDSjM6mNOcFTjgt6k+H
X-Gm-Gg: AfdE7cmnR5Ef45JyOQKy/HElsOu7dOq6vYYObQ7cIps3mtljK4P5KOHsNwEaE1oP9eS
	+yDpbI4yNcNkRs8qXeoqik7thHjm6KkRBHcIG70PK5dD23Nr7JlOVaAfdmE6dMc+14q0Wj4Yqx0
	RJEyCkiYcoYrMwSX1wIN+CRFi9QSiNa21+6SXpoVw+fq0aNcbwRhKuGA0JAJlpSyJUk7/lk4Rs5
	J8mUNMw1p0D81ui4HxW1tHXzvJ5PTIm6zwKY8DAhjkBw4QLQHrm5rQAG43u1M+n4loCrsmJakHP
	rF6jx0W5IvN9zOtMVIdUtQSuGZGI51nqoD6WiLbobaoJNqmvPrQgX6k/NJWHGPI+050IMFEa2sj
	MBw6I8oCEhnqqE4dVMKGsjC6djmQvN1mYs3j1as0PJVBbSrye4BaIRcZ9NwItmSyK/9Dyy1mZPh
	2X+bQSNgAYiBuEz5AzQe1Rv2NHRBgJoaqZTJMbxkO/
X-Received: by 2002:a17:903:2c08:b0:2ca:6c8:abd4 with SMTP id d9443c01a7336-2ca2ea18718mr26189015ad.34.1782817336111;
        Tue, 30 Jun 2026 04:02:16 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan ([2400:2410:3f60:500:ae0d:35d1:dac9:a0e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a701b5sm11455265ad.17.2026.06.30.04.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 04:02:15 -0700 (PDT)
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next 0/3] net: report multicast group user count
Date: Tue, 30 Jun 2026 20:02:04 +0900
Message-ID: <20260630110207.37841-1-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RTM_GETMULTICAST reports IPv4 and IPv6 multicast group membership, but
does not include the per-group user count. Userspace therefore still has
to parse /proc/net/igmp and /proc/net/igmp6 to obtain the Users column.
In particular, this prevents iproute2 from moving "ip maddr show"
entirely from procfs to rtnetlink.

Add IFA_MC_USERS to carry the user count in RTM_GETMULTICAST dumps and
RTM_NEWMULTICAST / RTM_DELMULTICAST notifications for both address
families. Update the rt-addr YNL specification and extend the rtnetlink
selftest to verify that two joins increase the reported count by two.

Yuyang Huang (3):
  net: ipv4: report multicast group user count
  net: ipv6: report multicast group user count
  selftests: net: check multicast group user count

 Documentation/netlink/specs/rt-addr.yaml |   4 +
 include/uapi/linux/if_addr.h             |   1 +
 net/ipv4/igmp.c                          |   2 +
 net/ipv6/addrconf.c                      |   1 +
 net/ipv6/mcast.c                         |   1 +
 tools/testing/selftests/net/rtnetlink.py | 101 ++++++++++++++++++++---
 6 files changed, 99 insertions(+), 11 deletions(-)

-- 
2.43.0
