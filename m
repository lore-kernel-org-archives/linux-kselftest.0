Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B79245019
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 05:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774935265; cv=none; b=F6rEgG9vdCq6S60w9YWXwEAyECn2KYVnY7fCCOatS1J/Ag4x3384JrJedYvlsTHb/skQdRMBwm3Sl4RlvX5CEGJqAFUmbA8hImFgMBnFLnS/0xStimjKDgZDBWashOvTmenIwQjw7cC4V3iF7Vyu319OncDmWWASRhAVgX2Gi9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774935265; c=relaxed/simple;
	bh=LypP5TvHBGUpwgm9IIzSGl9rh7prtq+QWmrtNtjKXfI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=KR2I8Uv49376xJQVhJLPnnKKMGVepmZeMvNjV58CmLfqsGW4ji7woifahkNf1raElZEBldq/xnWnqJdCUAj1L3T4c2/UNnc0dEdTRwZOh/V8lKaBYRkiORYea3fe1Qq+G53IgjA3KWJVAjeRotQ6qNA2qfTPeHnViFYJF24M8MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uIv+GCBA; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uIv+GCBA"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso5616399eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 22:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774935263; x=1775540063; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g7TxFxoQB12ZdFLHuJA4IXnVez6sPeZr+Rc57EvugjU=;
        b=uIv+GCBAJ3tu/UbiOJa54XBZXckS1esrHsS7I8CD4faT4u5lALmMdexuON9MqKN7gD
         XnqaCrh4pz3oFFQQpooes5S6wdVV6bHX6zwUEkfYuo1n/axLJJMzF5mpqpPisDAjjxys
         ++1MfOggsAn/5IlfyJox90DiWIzgM4w+7gaqGaxcFISDeYoQPRFtDUJXQkMvmfyibKcr
         frhee3tUaCbQ6uhpluqQfrcPWdWe1RE8TZl8A1AemnTDijwLaHFqdGbdavIzPkeMtYVu
         /EoJ1U/CbOysKB0Y7kbnNeAk8jNA81NLibJnGXJvikkkABq04jBtJgQK2kAvpi1I2KmT
         N0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774935263; x=1775540063;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g7TxFxoQB12ZdFLHuJA4IXnVez6sPeZr+Rc57EvugjU=;
        b=rryCpWJshvZDg5wePpgHDYHt6rc8b1sIUMv20J8gX/MYa/LfSitxLZNBRwbaydc6g2
         kXbJNtwrdbk8YXvnBq9soGjKcgLufMuRoQnq2ZqqRbcV3VjiopMaEUXBAS0nTYujQdSq
         xln4JGUK7qZ+veRhI2O7uAOjZuc1Cui1c3OvsJKVYONIyTGZZc4cHqlfNJKVG+1qqJD0
         XkEdHSurvHTmlSvHHEwU0CapXnNLkSvJzw55NcHjH49AHPCLXb3HqutYvth2s8v3Y8mU
         2o0uJ4jNs1tSnmb/fgec2o+yR7voWD84sli7ItugmUA3IL+y7SrwZNmWMyhzTIZQx1Rt
         O/kQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWiRUd/AzSwhZ0moVklHo1QwBOXL0nOXULHQmLJwONdw0As4oi3cet1aVq3FUGf/nMK979WTgVNWMKJFjnuVY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuChqpxoev+e1sZ1rSG0dCBd4/e0TPW33Buy14BEwU0D+CXOcR
	8UBN1k1OPcU4o2Nfr2NNvq2kyqlkysxMcQAV+pmH+I/B9jfsy25BY0IPMa1Al0lbwwEPYYw+grv
	7rPU7qYGrEXLe6KUDYQXuSg==
X-Received: from dycmp17.prod.google.com ([2002:a05:7301:711:b0:2c4:e093:7c6a])
 (user=marcharvey job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:3d19:b0:2c1:571f:b824 with SMTP id 5a478bee46e88-2c185efdd70mr6909484eec.30.1774935262628;
 Mon, 30 Mar 2026 22:34:22 -0700 (PDT)
Date: Tue, 31 Mar 2026 05:33:46 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260331053353.2504254-1-marcharvey@google.com>
Subject: [PATCH net-next 0/7] Decouple receive and transmit enablement in team driver
From: Marc Harvey <marcharvey@google.com>
To: jiri@resnulli.us, andrew+netdev@lunn.ch
Cc: willemb@google.com, maheshb@google.com, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Marc Harvey <marcharvey@google.com>
Content-Type: text/plain; charset="UTF-8"

Allow independent control over receive and transmit enablement states
for aggregated ports in the team driver.

The motivation is that IEE 802.3ad LACP "independent control" can't
be implemented for the team driver currently. This was added to the
bonding driver in commit 240fd405528b ("bonding: Add independent
control state machine").

This series also has a few patches that add tests to show that the old
coupled enablement still works and that the new decoupled enalbment
works as intended (4, 5, and 7).

There are three patches with small fixes as well, with the goal of
making the final decouplement patch clearer (1, 2, and 3).

Marc Harvey (7):
  net: team: Annotate reads and writes for mixed lock accessed values
  net: team: Remove unused team_mode_op, port_enabled
  net: team: Rename port_disabled team mode op to port_tx_disabled
  selftests: net: Add tests for failover of team-aggregated ports
  selftests: net: Add test for enablement of ports with teamd
  net: team: Decouple rx and tx enablement in the team driver
  selftests: net: Add tests for team driver decoupled tx and rx control

 drivers/net/team/team_core.c                  | 241 +++++++++++++++---
 drivers/net/team/team_mode_loadbalance.c      |   8 +-
 drivers/net/team/team_mode_random.c           |   4 +-
 drivers/net/team/team_mode_roundrobin.c       |   2 +-
 include/linux/if_team.h                       |  63 +++--
 .../selftests/drivers/net/team/Makefile       |   3 +
 .../testing/selftests/drivers/net/team/config |   4 +
 .../drivers/net/team/decoupled_enablement.sh  | 200 +++++++++++++++
 .../selftests/drivers/net/team/options.sh     |  96 +++++++
 .../selftests/drivers/net/team/team_lib.sh    | 145 +++++++++++
 .../drivers/net/team/teamd_activebackup.sh    | 208 +++++++++++++++
 .../drivers/net/team/transmit_failover.sh     | 155 +++++++++++
 tools/testing/selftests/net/forwarding/lib.sh |  13 +-
 tools/testing/selftests/net/lib.sh            |  13 +
 14 files changed, 1084 insertions(+), 71 deletions(-)
 create mode 100755 tools/testing/selftests/drivers/net/team/decoupled_enablement.sh
 create mode 100644 tools/testing/selftests/drivers/net/team/team_lib.sh
 create mode 100755 tools/testing/selftests/drivers/net/team/teamd_activebackup.sh
 create mode 100755 tools/testing/selftests/drivers/net/team/transmit_failover.sh

-- 
2.53.0.1018.g2bb0e51243-goog

