Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE6828314E;
	Tue,  3 Mar 2026 18:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772561747; cv=none; b=MDt4ToJ8pp7EQ0fio5WrMRkjdCGvWVMtoo8CHVHS0iYJL3edBLtlDujysYRMoy4xxjLGui37vc/6Hd+KhJN3YWUY6L1YwVA8e9sduGIpHW1zbtoS+/Y3xy/KMKHHcdpJV90zQFAPS0dvm+YwEEytZf+rQbFyyMOn+seSYqewMcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772561747; c=relaxed/simple;
	bh=7NQsM+lugV83l3nTYmooXBAC7dbMpHbk/5K5ZR+QtoA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Kg4XwN/Ej2dvQEoxRGquK0zvk5f4BjO7n1VArKzcMTZv11ZXIcQcYM/5FP8dwMbYUfDBxMHtFDU7u3sG5jpia/HgloDTopJylV+OXgaHZI2Z0s5CEW64O2ALjLMeHGyfCNaEn/J3C1BeXrH6dmKIE1oXPDXtASPZb7hI1B6OaK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jh/LPOgd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jh/LPOgd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9A4C116C6;
	Tue,  3 Mar 2026 18:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772561747;
	bh=7NQsM+lugV83l3nTYmooXBAC7dbMpHbk/5K5ZR+QtoA=;
	h=From:To:Cc:Subject:Date:From;
	b=Jh/LPOgdTbwPc5SHM5rlA5AEvfNgYYKtNh/H978t0JXLImB/OaxmLgFqYRysX72V8
	 EmfMreFAtDpG5xZBLY4sfJgVV+w8pI8X1ml/Or0Y57f+XIejg3dOFTsr/ttxuc56AQ
	 +pjFoLq0vYrcq748H08brFRVsTJ7oMfTGwTx0WPvQ4W7qaOatXWr0TPDHoCKX19xf7
	 PDQL+5UKF3Xi82zB7w8iwRjizuOVDhby3bCS7sIRRMhhxCAo/wDQTXEsqOUvUzE6/G
	 0WT85qN7ovQ26wDYE8qCNu2rVZPf0tz+W8gCSn3VFbdmq597pqHBbYgVOqTZV1r3ax
	 kcnjAkrlwDFXw==
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
Subject: [PATCH net-next 0/5] ethtool: Dynamic RSS context indirection table resizing
Date: Tue,  3 Mar 2026 19:15:28 +0100
Message-ID: <20260303181535.2671734-1-bjorn@kernel.org>
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

This series adds resize helpers and wires them up in bnxt and
netdevsim.

Patch 1 adds three core helpers:
  ethtool_rxfh_indir_can_resize() - read-only validation
  ethtool_rxfh_indir_resize() - fold/unfold a raw table in place
  ethtool_rxfh_contexts_resize_all() - resize all non-default
    contexts (all-or-none), with locking and RSS_NTF notifications

Patch 2 uses them in bnxt_set_channels(), replacing the -EINVAL
rejection. Context 0 is validated first, then non-default contexts are
resized, then context 0 is mutated.

Patch 3 adds RSS context support to netdevsim with dynamic table
sizing (roundup_pow_of_two(channels) * 16), exercising the full resize
path.

Patches 4-5 add tests:
  ethtool-rss.sh - netdevsim-specific bash test
  rss_drv.py - Python test that runs on any device with dynamic
    table sizing (skips otherwise)

Running the tests:

  # netdevsim bash test (requires root, netdevsim module)
  cd tools/testing/selftests/drivers/net/netdevsim
  sudo ./ethtool-rss.sh

  # Python test on netdevsim
  cd tools/testing/selftests/drivers/net/hw
  sudo ./rss_drv.py

  # Python test on real hardware
  sudo NETIF=eth0 ./rss_drv.py

Open items:

 - Pre-existing bug in bnxt: the IFF_RXFH_CONFIGURED guard in
   bnxt_set_channels() only protects context 0. If context 0 uses
   defaults but non-default contexts exist, channel changes that
   change the table size succeed without updating ctx->indir_size for
   those contexts. The core's ethtool_check_max_channel() prevents
   invalid queue references but not the size mismatch itself. This
   series fixes it by resizing all contexts. Should a separate fix be
   sent to net for the existing bug?

 - No user-controlled minimum table size yet. The plan is to record
   the user-provided indirection table length in the context (e.g.
   ctx->user_indir_size) and use it as a floor when folding: reject if
   new_size < user_indir_size. This way the user's original table size
   serves as an implicit minimum, preventing the driver from shrinking
   below what the user intended. Left for a follow-up.

 - rss_drv.py lives in drivers/net/hw/ but runs on netdevsim too now.
   Maybe move up a level?


Björn Töpel (5):
  ethtool: Add RSS indirection table resize helpers
  bnxt_en: Resize RSS contexts on channel count change
  netdevsim: Add RSS context support with dynamic table sizing
  selftests: netdevsim: Add RSS indirection table resize test
  selftests: rss_drv: Add RSS indirection table resize tests

 .../net/ethernet/broadcom/bnxt/bnxt_ethtool.c |  23 +++-
 drivers/net/netdevsim/ethtool.c               | 119 ++++++++++++++++-
 drivers/net/netdevsim/netdevsim.h             |   4 +
 include/linux/ethtool.h                       |   3 +
 net/ethtool/common.c                          | 126 ++++++++++++++++++
 .../selftests/drivers/net/hw/rss_drv.py       | 101 +++++++++++++-
 .../selftests/drivers/net/netdevsim/Makefile  |   1 +
 .../drivers/net/netdevsim/ethtool-rss.sh      | 123 +++++++++++++++++
 8 files changed, 488 insertions(+), 12 deletions(-)
 create mode 100755 tools/testing/selftests/drivers/net/netdevsim/ethtool-rss.sh


base-commit: ed0abfe93fd135dac223e87a3c945017b1fa8bfc
-- 
2.53.0

