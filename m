Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1895030F812;
	Sun,  8 Mar 2026 13:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772975545; cv=none; b=eETT/Eyxj7m2PIXjxz4bEgqtNdlohZYb8o7iALUXgbh1DVKsmJxYlUOoeDjDkKehCjJhGAj/vGSfVvJF45PurAazMComo/8FytIibpjc31bJNFOhx9h1o3QSbtlVWt+Q3l+4IEjRS6+cC7TM6JZJ1eq/kJqCxIW+sEiEZXC/A0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772975545; c=relaxed/simple;
	bh=RishPkSnif/6BFgHWRfH/UAt7vxgJLKCv2bHyf2A0Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=C6ncG4XsD9Y6lN7xNbws4yYa3IjBf+m704v7QQ5+qzQxhvnqon7iyFncvVpmnnTKKbXe2NdmGnwl2KczReuFxtyuNdCCnrW8i8Z9a8eemyA/+YDk6H8zbyFQa4vQ8JyLqjjzh/T84N0J3TJ9TKMoMbhmBR3/sN6ompdc+K5SP1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HvWrcXtv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HvWrcXtv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5767C116C6;
	Sun,  8 Mar 2026 13:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772975544;
	bh=RishPkSnif/6BFgHWRfH/UAt7vxgJLKCv2bHyf2A0Hg=;
	h=From:To:Cc:Subject:Date:From;
	b=HvWrcXtvpmwROJ/Vtb0zqdn2X9T3gwNwrzdtBr/dDgfXB/rb7HcoxMFwnOistuqQY
	 xu796YG/ihAli8qG46pJQ4ag9mOPT/8+KTGVEfZ8ENzYlWVsr+CHQ/S914WkGJwLtv
	 kV2mhe1Dg4wmT4B93AW4dCG3Bb6qUPQWNKEpMXcFfC7cJPwSALGtw/uGRyH5jWdRpv
	 lopw/Eqx3WhP9zWG/1ZNdq1lxTQolnM0bzlkgsDgfZFes0dCGQFGLqGv7zzLLyOcUF
	 qQvQtJmmRTTH8tfZZXjTOrLEfxIkthqOKExaHtXKmhRH/opt7oBECGkZxN9pYHwX49
	 rEmda73j1aAgA==
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
Subject: [PATCH net-next v3 0/3] ethtool: Dynamic RSS context indirection table resizing
Date: Sun,  8 Mar 2026 14:12:14 +0100
Message-ID: <20260308131218.3172332-1-bjorn@kernel.org>
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

Changes v2 -> v3:

 - Changed ethtool_rxfh_can_resize() to return bool instead of int;
   true means resize is possible, false means it is not. Inverted
   callers accordingly. (Jakub)
 - Added Tested-by from Pavan

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
 net/ethtool/common.c                          | 143 +++++++++++++++
 .../selftests/drivers/net/hw/rss_drv.py       | 163 +++++++++++++++++-
 4 files changed, 335 insertions(+), 11 deletions(-)


base-commit: 0bcac7b11262557c990da1ac564d45777eb6b005
-- 
2.53.0

