Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FD9302146
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 07:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775200471; cv=none; b=jFyX5MZbvZTNv8NBhDD5kkmi7i0O5d/ndkhUdH/GjeIEQAlojce0++gspzUKU1Tk2idU8Kdh/Gg0PFU69bP/72ZpTfzw3KFxpiG+k7Sto4G/gCRp5PB1wdo2mrf4CqeVVc71oIutIJoWF4qn7gJGn23spiv3elyCNz8hW6+xNZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775200471; c=relaxed/simple;
	bh=EW8KYf1c/w/FYmF+mNEfWcWh1gUEZj8sImOt5w1jamA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=D0kR7kN+a7d/435jGMI2wgniQpjjQcv+TeBjDtHYDHK6/ZgWxgJEECXZ2aZ4JFhlaWgDtE7Z4a6qFYM9v9cONoZgHCdkm/kGEHKFkMpnfZkWsihqQXQ5SZZ9IRM2WHzRQtsBGyZdCYoiRtFUmXFL/emM4i6NCWVU27Z50X3vRQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=utWvnz6h; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="utWvnz6h"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2c8ac8e422dso2674844eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 00:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775200469; x=1775805269; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qj1IHyCeC9JWQmqj8CIl1mS6vkiwWXO8x4RE4Fp5E1M=;
        b=utWvnz6h4TzhM4M0JznbBdLdSgtekR+2EbBxCtZQygvweAhYXm95CG0O7QGqd7pYw8
         SaiIweZwaxlkeI7oUadz/VWH8ydHjv0cPdjQ7njvZlJl/TtJEmcXowBNXwVjE/9zaelX
         ioM7VmbCDKB97t2KUJ9IBD2BgQDtJoLHfzoWIIdxLEg6v9YjbCpgkjD9eyabW3onPzgq
         jUuOPqxtgCYyDuO43BuMSmDLQf/eDwAHZzbBwXIOAtakw9m+UU4MktX+UFkCayK8OuKz
         VzVWKSTkodEzDORtCzxyPY0QymvBRWuCg+gyAqZtXBTHZJeDUcQf7gzDTeFY49NbSP+J
         tYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775200469; x=1775805269;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qj1IHyCeC9JWQmqj8CIl1mS6vkiwWXO8x4RE4Fp5E1M=;
        b=W+2AGrJynSO3iOtV6ZjvJG9NhLHXztzAN6EwgKvJfFoszO/hAjaWf6JaFVqM7Yvjg+
         5VDgV+Ct4dWXRki5s68AwdktkMbl18Bvmb8j4ItwlOIT7FcrIIoB4mBVMOorrwKCW/d7
         pWRHAFYOE6I0rUzo87h7vdgkR3+AM1a6IYMB1R67EKdsIXGx2MJaZN69PQnFYlF0GNAk
         TR5ewWYiMql7eZ1gDawvxGXzWYRTyP3aHWiXeeSqGO0nBPD1z4lyP0+8Q2EbBrP29DtV
         FAIzVw/tDNGXsjsY6RDrKdd69bMM4O4sq4wN093yC6b++zjrUfU4HjwAIBn4+iqQrY/V
         bcZg==
X-Forwarded-Encrypted: i=1; AJvYcCWn5kE5cYaMBA13RtFeFJddtvl4Dukm/ov0duYigvaY3Sn6XZwGe3U2rqtq/jSf57u16Lt5oVQD+6CUGz8l+5E=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd0G/aK/GLfukdxLQleMm1cUh9G+fRicHK9RFhyE5j+/g7uo3p
	wnsSFIrJbqfVRXqIw+UB4u+08sSjDQm7m9+sWtp2moGvbuna9Zs8ryTPMZBfr9RZAOHVJxxJfdX
	6P6CA5nUTpjPv9/iF1Gek/g==
X-Received: from dycmz22.prod.google.com ([2002:a05:7300:ea16:b0:2cb:45a9:2264])
 (user=marcharvey job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:c010:b0:2cc:600d:2ff5 with SMTP id 5a478bee46e88-2cc601c7db1mr293473eec.18.1775200468649;
 Fri, 03 Apr 2026 00:14:28 -0700 (PDT)
Date: Fri, 03 Apr 2026 07:14:21 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAM1oz2kC/4XNQQ7CIBQE0KsY1mLob23RlfcwLlr40J+0YCghN
 U3vLmGlC+NyMpk3G1swEC7sethYwEQLeZdDczwwNfbOIiedMwMBrWhExSP2MznLdaCEgZOLGFw
 /cVkbMEJ0jW4ly+tnQENrke/MYeQO18geuRlpiT68ymWC0v/VE3DBjRSqgkvVQTfcrPd2wpPyc 0FT/QnBb6jOEEplNKp6OCv4gvZ9fwMO+0FDEgEAAA==
X-Change-Id: 20260401-teaming-driver-internal-83f2f0074d68
X-Developer-Key: i=marcharvey@google.com; a=ed25519; pk=OzOeciadbfF5Bug/4/hyEAwfrruSY4tn0Q0LocyYUL0=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775200467; l=3241;
 i=marcharvey@google.com; s=20260401; h=from:subject:message-id;
 bh=EW8KYf1c/w/FYmF+mNEfWcWh1gUEZj8sImOt5w1jamA=; b=HBn+gRL/62VMxn6FPwumRTS2wPMpbEgcNcfaMow6hE9bt3+lUsQlUEW8ZIJfiOA0Sj7EtlKcv
 JHLH+UU2qxVA+EHDb6NPwmHkuk4UTIWvRkex+yxFW8NN7ZB6BxubRCk
X-Mailer: b4 0.14.3
Message-ID: <20260403-teaming-driver-internal-v4-0-d3032f33ca25@google.com>
Subject: [PATCH net-next v4 00/10] Decouple receive and transmit enablement in
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
works as intended (4, 5, and 10).

There are three patches with small fixes as well, with the goal of
making the final decouplement patch clearer (1, 2, and 3).

Signed-off-by: Marc Harvey <marcharvey@google.com>
---
Changes in v4:
- Split the large v3 patch "net: team: Decouple rx and tx enablement
  in the team driver" into 4 smaller patches.
- Link to v3: https://lore.kernel.org/r/20260402-teaming-driver-internal-v3-0-e8cfdec3b5c2@google.com

Changes in v3:
- Patch 5: In test cleanup, kill teamd to fix timeout.
- Link to v2: https://lore.kernel.org/r/20260401-teaming-driver-internal-v2-0-f80c1291727b@google.com

Changes in v2:
- Patch 4 and 5: Fix shellcheck errors and warnings, use iperf3
  instead of netcat+pv, fix dependency checking.
- Patch 7: Fix shellcheck errors and warnings, fix dependency
  checking.
- Link to v1: https://lore.kernel.org/all/20260331053353.2504254-1-marcharvey@google.com/

---
Marc Harvey (10):
      net: team: Annotate reads and writes for mixed lock accessed values
      net: team: Remove unused team_mode_op, port_enabled
      net: team: Rename port_disabled team mode op to port_tx_disabled
      selftests: net: Add tests for failover of team-aggregated ports
      selftests: net: Add test for enablement of ports with teamd
      net: team: Rename enablement functions and struct members to tx
      net: team: Track rx enablement separately from tx enablement
      net: team: Add new rx_enabled team port option
      net: team: Add new tx_enabled team port option
      selftests: net: Add tests for team driver decoupled tx and rx control

 drivers/net/team/team_core.c                       | 238 ++++++++++++++++----
 drivers/net/team/team_mode_loadbalance.c           |   8 +-
 drivers/net/team/team_mode_random.c                |   4 +-
 drivers/net/team/team_mode_roundrobin.c            |   2 +-
 include/linux/if_team.h                            |  63 +++---
 tools/testing/selftests/drivers/net/team/Makefile  |   4 +
 tools/testing/selftests/drivers/net/team/config    |   4 +
 .../drivers/net/team/decoupled_enablement.sh       | 249 +++++++++++++++++++++
 .../testing/selftests/drivers/net/team/options.sh  |  99 +++++++-
 .../testing/selftests/drivers/net/team/team_lib.sh | 115 ++++++++++
 .../drivers/net/team/teamd_activebackup.sh         | 217 ++++++++++++++++++
 .../drivers/net/team/transmit_failover.sh          | 151 +++++++++++++
 tools/testing/selftests/net/lib.sh                 |  13 ++
 13 files changed, 1096 insertions(+), 71 deletions(-)
---
base-commit: 8b0e64d6c9e7feec5ba5643b4fa8b7fd54464778
change-id: 20260401-teaming-driver-internal-83f2f0074d68

Best regards,
-- 
Marc Harvey <marcharvey@google.com>

