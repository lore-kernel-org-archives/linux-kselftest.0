Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0813B42EE
	for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 22:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789769611; cv=none; b=CgsAom7TYYMJGcgLVLyre2Pwh42QFQD35d+H0RUH7p6skv0eO5UwRnbuR1F0dl2s1JW2/zQghs9jJGFayqTg3qFq8dHgYIcyU3RwCmHVxgeRe1WHv6KtozPHPreD+5Uu4c8wto44dXZuDPcl3FMEK4072L7V+eoy04gAdJGwmWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789769611; c=relaxed/simple;
	bh=txGAveWwvTAAtYGBERUy5ooogepTZpOlvAx7wGepRlc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i9GrOPwR8AjeCAlU53775PGKRB7WIWMTIhE9o9DgbKlvKum55g/cE0RTJBXl0QKby3QvDliFARjdOabBSQKRAtYfjE6oD8yXZWGbNVxf6o+kEegNALKjIyy6pnSsczcySp+1HM876krjqJqcyzkjo1Cd5n4jZ5pQ+yiosKgE7tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZ5vy8lR; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZ5vy8lR"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fb334ddcso10902275ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 15:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789769607; x=1790374407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FAJrnRTPiGjW3lczIKaVvBCkSw+LsISQ6r4v8TGclfY=;
        b=MZ5vy8lRjyXUbO7q82VLmSmKccMicCKIHP7RuBDLckWLQ5g5eDf3aZ97XFF8Y1VnIS
         H93WnrDz32WcHdBeWU2MFVr1qHpY32QRk5up1/ELaZ1Z0Us9t+a4LjCICC66laddAdEe
         imatyivHj6+DEytw4Wx6/zNZFs0ig91yE829IOINvHBKcaEIk0B65y3gzuyhMXCysi1d
         TQsrWv0QoX+mO5iTMEt86yjm35UevPkea7xGaJCnjrUfA3vlr1xPfXUsGCCItncReTYC
         oa5q2k2L3RIgRtaEBF/c4LVsp3I2F0IYkkg7irEOYK6YA8p5dhue94Mswga4UY/eniKc
         vZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789769607; x=1790374407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FAJrnRTPiGjW3lczIKaVvBCkSw+LsISQ6r4v8TGclfY=;
        b=UVwHT8zj/m06Se8NKU0VVihhB0jqkvTWyGGYV7/v+uX8qaDZ/oEbXa4z8y9gpJDx4B
         qT4DRMRtedxglWnGkpPTSJjTE37D8IVkqIK8qTgDU3fbUQa3VCNthWjCioa7F37ofaVj
         JlQC6mbDCu6t9UDJf1rIU+Yt34m9rC+LZlqWmtGyw4ybEE6FieMoNbgcTYd8zo6PTUMk
         Gty1bQx0bsNsvwNWAK2DYqCSRet3WDa7gFn6BrX30lDuGZZ4d0cv/E7Shx+K/Ci6xipH
         mO6CA6mp3OBbtEWS+UxA8bjNgD2alXjKv1c5drKsbuwTxQc3LCMdnLwDv+R2638PXyAw
         TCvA==
X-Forwarded-Encrypted: i=1; AKwUvBzXImIC1KKHSuJ7ScY7h/5bmjYtjgLfmG9XMDZL4tra5OLKaLL3wmYSovLF0y60N5VXUqXpQe0KjRa5eu4ipCU=@vger.kernel.org
X-Gm-Message-State: AFuF++mG4HIn+lvvuwZ+RkcsngYI4qj9inIHThlA11LnfYFV/bOtZ1qP
	5gKxsD2JSUmmToazcZjmNYdYA6JUjH2DuvflZcx+n/c6Y1sP8fMXqbhY
X-Gm-Gg: AYBFou1lHoIpxIF5tUaAKZYXpJEEhufGxlQCuTPsAz43NkyJBf15X0m75haPgQGmj+z
	pxmx5//8hZNxRh/G/xhSqRybmENa6coILrKxvYzl+P9qY3yv2fHPFQSqctNcdbKLShBuYVIlhlH
	4ESsxY/+CvpwfOGBKp+V/m9IU2cTUeK1SJie8IvdXmq+iA7V/OqEZ/bRp//Q93+2ujVHSsVCDY7
	V+pivG+BHvFb0ovctcnihqd4K42wkoMNdtHwkpcDRr+gyby+KE1hWuAA8RhyPb/hBakcULVWpN4
	PkkmfKhTC7Qg76r+2EucK+W6c3NHpxmxR81Vfv7aA6GwV2GyaZryRTxCCPCPlWU/uQs+ibLpuN4
	SbD3qBm5T+Db2NTnbhJNtsmqahl+UZC5RfOnVEOhCiYkWI2fnrvXJE1NpuIZ8fzMcLgt/VAEiMd
	Bg58TP0N/gUw5brR4UWD02wG3WPyOc45a44aHuBsDqobQi+uXaHV96Q+md96n4CgDF+N26MnG9i
	bf+fAoO/XYK2KEi9xmwNy0On23SFLirl85VoDKrg42w0qA3tAJVaktAlyXOFFt+yKcy8wFxtYvr
	le4X0eHi1E+kQ6jq7ClI
X-Received: by 2002:a17:903:1983:b0:2dd:ad73:c936 with SMTP id d9443c01a7336-2ddb1b9952bmr75011755ad.23.1789769607146;
        Fri, 18 Sep 2026 15:13:27 -0700 (PDT)
Received: from lawlee-vm0.d4y3nv5wwgfelhhopdxv1tqjld.dx.internal.cloudapp.net ([13.93.150.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3311a716sm1553671eec.8.2026.09.18.15.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 15:13:26 -0700 (PDT)
From: Lawrence Lee <lfqlee314@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	netdev@vger.kernel.org,
	Arun Ajith S <aajith@arista.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Jaehee Park <jhpark1013@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 0/2] ipv6: update NUD_FAILED neighbors from NA messages
Date: Fri, 18 Sep 2026 22:13:22 +0000
Message-ID: <cover.1789734885.git.lfqlee314@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Neighbor Advertisements for existing NUD_FAILED entries are currently
ignored. This can leave a first-hop router with an unusable neighbor after
the host becomes reachable and announces itself, particularly when
forwarding is offloaded away from the kernel and traffic destined to the
FAILED neighbor is unable to trigger the kernel's normal neighbor
resolution process.

Allowing neighbor entries to be updated from NAs already received by the
kernel is preferable since it creates less work compared to periodically
probing FAILED neighbors (e.g. using NTF_EXT_MANAGED).

Extend accept_untracked_na to treat FAILED entries like absent entries.
Require a target link-layer address, IPv6 forwarding, and acceptance by the
sysctl, including its source-prefix check in mode 2. Recover the entry only
to STALE, including for solicited NAs, to maintain parity with handling of
non-existent neighbor cache entries.

Patch #1 implements the behavior and updates RFC 9131-related comments and
accept_untracked_na documentation.

Patch #2 extends ndisc_unsolicited_na_test.sh to cover FAILED-entry
recovery and each acceptance gate, including in-prefix and out-of-prefix
mode 2.

Thanks to Ido Schimmel for feedback on the original RFC.

---
v3:
- Cite RFC 4861 section 7.3.3 when describing FAILED entries.
- Simplify the FAILED-entry path as suggested by Ido Schimmel.
- Drop the NDISC callback and 6LoWPAN changes. The existing 6LoWPAN
  override-only behavior also applies to INCOMPLETE entries and is left
  unchanged.
- Restore the existing rt6_clean_tohost() source-address behavior. The
  source-versus-target behavior applies to all neighbor states and is left
  unchanged.
- Verify the link-layer address learned during recovery in selftests.
- Keep the NA source, target, and neighbor key fixed while varying the
  router prefix in the mode 2 selftest cases.
- Arm packet capture in selftest before starting host DAD and wait for
  capture readiness and receive completion.

v2:
- Full implementation of logic to update FAILED entries to STALE.
- Update the RFC 9131-related comments and sysctl documentation.
- Add selftests to verify state changes only when the accept_untracked_na
  setting is enabled.

v1 (RFC):
https://lore.kernel.org/r/20260813233344.445265-1-lfqlee314@gmail.com

Testing:
- x86_64 allyesconfig build with W=1
- Sparse on net/ipv6/ndisc.c
- tools/testing/selftests/net/ndisc_unsolicited_na_test.sh: 14 passed
- Local NIPA checks: all 45 checks passed
- Sashiko local review completed

Lawrence Lee (2):
  ipv6: update NUD_FAILED neighbors from NA messages
  selftests: net: test untracked NA recovery of FAILED neighbors

 Documentation/networking/ip-sysctl.rst        |  28 +--
 net/ipv6/ndisc.c                              |  47 +++--
 .../net/ndisc_unsolicited_na_test.sh          | 195 ++++++++++++++----
 3 files changed, 201 insertions(+), 69 deletions(-)


base-commit: 4bb9710c6a68d35207f123aef55dcd50e7195ec5
-- 
2.43.0
