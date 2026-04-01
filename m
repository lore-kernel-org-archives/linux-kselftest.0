Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F772D73AD
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 06:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775023544; cv=none; b=DJ0Wc+IFZuL1GRJQy1ASkZ5Q5b7WNeQj1U61X7lsfKCUJotweGxEVpa1d/Q8zivig36BarGeLduM5jqvhpLlU1s/jXSVhyXyf6lyPM6EI/x7KZL2o0GLOdUdwqrrBMHrHk1NZBBLVU9SSe6XrDP/AbwMF1qvQFte3dlMyVmTERg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775023544; c=relaxed/simple;
	bh=15hnnoslM5ivK5iHcnK9XCmoGjgYdOmkj5nkTKztHis=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ntTMddudu3qaYnaxB4FXjmCCYKb+M6TTaDrhgMJvLHqtpvXr51W7QTI6Ul8ESpWPZO0Uy63NBdPAU3J5WsvAMICfocZCkK5twwtExZL1k+V9kbfKHk73B8Z5BR8zgm1szjix7tpd00Qbo9n2dS33Im7uWKFBK41ItUYKao0QDdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CtSCfDq4; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CtSCfDq4"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so10768993eec.1
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 23:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775023540; x=1775628340; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iHiW2fA6FQ0gm2ne9i1cNEZehf2oFJcgxVJhfgdRX+k=;
        b=CtSCfDq42IRjUvgb5MQgH6FcQCPwhDSL2JNfp74Z+w4SZpw9MH1XRcWPoN/Yj9CNJr
         R7e4bwDwyDz/YT+/tyMNe+5SkZ5S9AdG/LZBIzTwh5gd66aJbhoHnsQdVcCV6PyZpPwo
         IjUcC6M0/2sGUAaEPNPlXefmYm4NQOIq7IfJ2vfvCWTDWBcWSdScEF3zNZAnvI/8WNDG
         aNqlGNA2k2qt8s/71UcOB/hYA5W9sOXsbmFQUm/oThp0TIFZ3m/sHcoB6NNK/nzCNFpM
         YCfklEdvA6+Yj1jQBb7IwjcH+TbqLTGKAbNv+o6lmYxukP74xAJE6GkO8RcRI5CrmWQu
         o5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775023540; x=1775628340;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iHiW2fA6FQ0gm2ne9i1cNEZehf2oFJcgxVJhfgdRX+k=;
        b=p9fUioL9s+CX8mx8DK6jvlFG6o6sZwX6/O2KvVZUz4UIDxepxnkmoSzft1KftmRUjx
         V+TF+ILlJm+s4NeTQ1f8K/wzDi1nMnhsGuWdfqk5OiYJWBlAV6IX64paNkOnbm1+GCY8
         DYhK4dOOnSEAyDKOvodquYbgNk63qLnDhuNF8K2BuFBxNfmBIapHJWU4Ql4lAV21d9Pf
         IQHhRM/jNk1R5+lsKDyIF+RNoGkDeqG1mjcX3FoidRHzIl5x53ZWMN3oHdJsMxESswBW
         s0GONhl/TAueUZOlRSXne1LVkdAL1iJhLVDiD5G1oUKEtp16/JbABAx1n1GPBB7IpPeo
         Auuw==
X-Forwarded-Encrypted: i=1; AJvYcCWJWzrr0BJyLaKW1XGn9CedgMJ0JYTy23hgSwXzWg8UwhrgvWRTCp7Kptbz3z/SmsTwL+1og55GCNwm3eOC7Ds=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxOwM7OBK3GMnMWaTLiI35b6yXEhHp8zhS85DO4UdwV0JG6yny
	sm0Xl1OOEjoDDANTpett5rA1Uvs5VXTucxlbeaLW5CkyIamDqF0NJICHzGUQHtH5JzbQOwj45PC
	Zmq9EjAa0LvTezgGdJu21QA==
X-Received: from dyx7.prod.google.com ([2002:a05:693c:8207:b0:2be:710c:1d1])
 (user=marcharvey job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:cc12:b0:2c4:ec89:be7 with SMTP id 5a478bee46e88-2c9328a61eamr1278254eec.23.1775023539614;
 Tue, 31 Mar 2026 23:05:39 -0700 (PDT)
Date: Wed, 01 Apr 2026 06:05:24 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKS1zGkC/x3MQQrCMBBG4auUWTswxtIWryIuQvOnDtRRJqEUS
 u9ucPkt3juowBWF7t1Bjk2LfqwhXDqaX9EWsKZmChIG6eXKFfGttnBy3eCsVuEWV55uOWSRsU/ DRK3+OrLu//ODDJUNe6Xnef4Aj72PIHMAAAA=
X-Change-Id: 20260401-teaming-driver-internal-83f2f0074d68
X-Developer-Key: i=marcharvey@google.com; a=ed25519; pk=OzOeciadbfF5Bug/4/hyEAwfrruSY4tn0Q0LocyYUL0=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775023538; l=2643;
 i=marcharvey@google.com; s=20260401; h=from:subject:message-id;
 bh=15hnnoslM5ivK5iHcnK9XCmoGjgYdOmkj5nkTKztHis=; b=fQbE9ksUrfC8qptLzLiYHMfnYBevOZ6D8FSBuBZVce8T2nj/RRv72+dlwQziYQCVdsxPfxqu2
 CyMX2suukVqBlTKD1kTCjz5PEhdPAa7vOfYZq32rv6ZDrX4j9+v4qOO
X-Mailer: b4 0.14.3
Message-ID: <20260401-teaming-driver-internal-v2-0-f80c1291727b@google.com>
Subject: [PATCH net-next v2 0/7] Decouple receive and transmit enablement in
 team driver
From: Marc Harvey <marcharvey@google.com>
To: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Marc Harvey <marcharvey@google.com>
Content-Type: text/plain; charset="utf-8"

Allow independent control over receive and transmit enablement states
for aggregated ports in the team driver.

The motivation is that IEE 802.3ad LACP "independent control" can't
be implemented for the team driver currently. This was added to the
bonding driver in commit 240fd405528b ("bonding: Add independent
control state machine").

This series also has a few patches that add tests to show that the old
coupled enablement still works and that the new decoupled enablement
works as intended (4, 5, and 7).

There are three patches with small fixes as well, with the goal of
making the final decouplement patch clearer (1, 2, and 3).

Signed-off-by: Marc Harvey <marcharvey@google.com>
---
Changes in v2:
- Patch 4 and 5: Fix shellcheck errors and warnings, use iperf3
  instead of netcat+pv, fix dependency checking.
- Patch 7: Fix shellcheck errors and warnings, fix dependency
  checking.
- Link to v1: https://lore.kernel.org/all/20260331053353.2504254-1-marcharvey@google.com/

---
Marc Harvey (7):
      net: team: Annotate reads and writes for mixed lock accessed values
      net: team: Remove unused team_mode_op, port_enabled
      net: team: Rename port_disabled team mode op to port_tx_disabled
      selftests: net: Add tests for failover of team-aggregated ports
      selftests: net: Add test for enablement of ports with teamd
      net: team: Decouple rx and tx enablement in the team driver
      selftests: net: Add tests for team driver decoupled tx and rx control

 drivers/net/team/team_core.c                       | 241 +++++++++++++++++---
 drivers/net/team/team_mode_loadbalance.c           |   8 +-
 drivers/net/team/team_mode_random.c                |   4 +-
 drivers/net/team/team_mode_roundrobin.c            |   2 +-
 include/linux/if_team.h                            |  63 +++---
 tools/testing/selftests/drivers/net/team/Makefile  |   4 +
 tools/testing/selftests/drivers/net/team/config    |   4 +
 .../drivers/net/team/decoupled_enablement.sh       | 249 +++++++++++++++++++++
 .../testing/selftests/drivers/net/team/options.sh  |  99 +++++++-
 .../testing/selftests/drivers/net/team/team_lib.sh | 115 ++++++++++
 .../drivers/net/team/teamd_activebackup.sh         | 207 +++++++++++++++++
 .../drivers/net/team/transmit_failover.sh          | 151 +++++++++++++
 tools/testing/selftests/net/lib.sh                 |  13 ++
 13 files changed, 1090 insertions(+), 70 deletions(-)
---
base-commit: f1359c240191e686614847905fc861cbda480b47
change-id: 20260401-teaming-driver-internal-83f2f0074d68

Best regards,
-- 
Marc Harvey <marcharvey@google.com>

