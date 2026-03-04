Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33FA191F94;
	Wed,  4 Mar 2026 13:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772630345; cv=none; b=qDl0BAKEX6X27mN7ncRkK6AS+OSdHRNVLOZ6uBY1N+bdC1/bWW/aI533oASsIBMFW3aMecYuEvy13znK2j0pQjx8rian3pNokCDZQkrOcDwLqQLySonTdk3/3N3ANdqLXseLTY9K2dYIDhdPFLwVgyYRD1GacnADtMC+EeiT4cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772630345; c=relaxed/simple;
	bh=C1LUb2aaVVJMppU4WEn1TilKT8PcWh18uvF7AdKGFTk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VVyTkihZLxb1vIKx8JSkYQYFjRGIs5kViKGVIvFeme4vo3rIHuSx4IzQaS+YXWmMW/spQG18kDNje0JHnLX3D0McL6Ku+dU3LNi9VxEQEbqn2xMbdt3FMJ1G5TRT2Kaew6ebBR/qvK0t04RBDhUuQoAqJDowwQ+zMXcgOJ/F/Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ms+4BAi1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ms+4BAi1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E170C19423;
	Wed,  4 Mar 2026 13:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772630345;
	bh=C1LUb2aaVVJMppU4WEn1TilKT8PcWh18uvF7AdKGFTk=;
	h=From:To:Cc:Subject:Date:From;
	b=ms+4BAi1nnyGyti6BVz6jeLLcq1MRKH2eE4fOgRLcEcYzp3QJzkThz/G7kCHgI2XZ
	 Krxo70RgsPhY3ck5qvxIJQ0Vl+8zALgsj1URsVZoqsMaXTG1/f0nz8XPA9eeql2qtO
	 C+ioX4AlXq36IGdbg/BpTzMuqmCnz5BYiJKZvguPzyLU5Wi2Bd5/I8tZBobeEFCYNo
	 rLq2kWHCIpRic9x0dsiCMvNrbmyRhscYoIQngsRyJLT2/dd1JPT1t6ZVHA8cBOK3bf
	 oKFgPu8RmGtfgAWQ5VZ0BqDNYQO9rUD7Q+OeT9v3uihhbNRXXoG0vqQMyzfCI0ydTl
	 NrBEUXsv9qjQg==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next v2 0/3] ethtool: Dynamic RSS context indirection table resizing
Date: Wed,  4 Mar 2026 14:18:50 +0100
Message-ID: <20260304131855.3225539-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi!

Some NICs (e.g. bnxt) change their RSS indirection table size based on
the queue count, because the hardware table is a shared resource. The
ethtool core locks ctx->indir_size at context creation, so drivers
have to reject channel changes when RSS contexts exist.

This series adds resize helpers and wires them up in bnxt.

Patch 1 adds core helpers:
  ethtool_rxfh_can_resize() - read-only validation
  ethtool_rxfh_resize() - fold/unfold a raw table in place
  ethtool_rxfh_ctxs_can_resize() - validate all non-default contexts
  ethtool_rxfh_ctxs_resize() - resize all non-default contexts,
    with locking and RSS_NTF notifications

Patch 2 uses them in bnxt_set_channels(). Validation runs before
bnxt_close_nic(); actual resize is deferred until after. RSS table
size only changes on P5 chips with older firmware.

Patch 3 adds HW tests in rss_drv.py (devices without dynamic table
sizing are skipped):
  resize_periodic - fold/unfold with a non-default [3,2,1,0]xN
    pattern, verifying exact content preservation (main + ctx)
  resize_nonperiodic_reject - non-periodic table blocks channel
    reduction, with an extra periodic context to exercise
    multi-context validation (main + ctx)
  resize_nonperiodic_no_corruption - failed resize leaves table
    contents and channel count unchanged (main + ctx)

Running the tests:

  # On real hardware
  sudo NETIF=eth0 ./rss_drv.py

Changes v1 -> v2:

 - Dropped netdevsim support and netdevsim selftest (Jakub)
 - Split ethtool_rxfh_contexts_resize_all() into separate validate
   (ethtool_rxfh_ctxs_can_resize) and apply (ethtool_rxfh_ctxs_resize)
   so drivers can validate before closing the device (Jakub)
 - Shortened helper names (Jakub)
 - Replaced scoped_guard(mutex) with explicit mutex_lock/unlock
   (Jakub)
 - Removed defensive zero-size check, bare expressions instead of != 0
   comparisons, ! instead of == 0 (Jakub)
 - In bnxt, moved bnxt_check_rings() before RSS validation and
   deferred actual resize to after bnxt_close_nic() (Jakub, Michael)
 - Added comment that RSS table size only changes on P5 chips with
   older firmware (Michael)
 - Use non-default [3,2,1,0]xN pattern set via netlink to distinguish
   correct fold from driver resetting to defaults (Jakub)
 - Check exact indirection table pattern, not just set(indir) (Jakub)
 - Use ksft_raises() instead of try/except/else (Jakub)
 - Removed queue_count=8 from NetDrvEnv (Jakub)
 - Added ksft_variants to resize_nonperiodic_reject for ctx coverage
 - Added extra periodic context in reject test for multi-context
   validation coverage
 - Added resize_nonperiodic_no_corruption test

Open items:

 - No user-controlled minimum table size yet. The plan is to record
   the user-provided indirection table length in the context (e.g.
   ctx->user_indir_size) and use it as a floor when folding: reject if
   new_size < user_indir_size. This way the user's original table size
   serves as an implicit minimum, preventing the driver from shrinking
   below what the user intended. Left for a follow-up.


Björn Töpel (3):
  ethtool: Add RSS indirection table resize helpers
  bnxt_en: Resize RSS contexts on channel count change
  selftests: rss_drv: Add RSS indirection table resize tests

 .../net/ethernet/broadcom/bnxt/bnxt_ethtool.c |  36 +++-
 include/linux/ethtool.h                       |   4 +
 net/ethtool/common.c                          | 146 ++++++++++++++++
 .../selftests/drivers/net/hw/rss_drv.py       | 163 +++++++++++++++++-
 4 files changed, 338 insertions(+), 11 deletions(-)


base-commit: ed0abfe93fd135dac223e87a3c945017b1fa8bfc
-- 
2.53.0

