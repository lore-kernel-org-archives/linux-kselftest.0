Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805EA3D411D;
	Tue, 15 Sep 2026 18:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789496483; cv=none; b=GCXDYc0bOhkiuvlpbDkqL8UiZooJyOcjFZJSxIApva/cxGJRJzNMr6AYy6/5IstQYMyXqY7EfFZ3e5+fbKp3HdK5owJiE21gcqJXwhL15lQ4DU36vV8lwv23XlZGl/WK/v5YMm9kQ+nB5ddKSHVSxtiMSQ0ZyyKJEOd5Vc6k9UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789496483; c=relaxed/simple;
	bh=VEPKiJaR6yfaiZyD7Fq5ykuC9ZtROuv8ISrp/eFw3Yk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fKz1FJ1iZZhMX8dw7ZQ/YNLyLerqsj2cvZ4XeMUT6If7Ovb0Hf94RukIlEtUzucMsPqmzF7Bk91lW8gaTvFGkzqu3AeowlyPeCti1mh1x2kk49UWALJOEd0l+Cv2yqRazaPoOO0H7wo0u7T0jtLoSqjj4sx3QC7vX+BAq0P7SRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L6gEsnf2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L6gEsnf2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFEA01F000FF;
	Tue, 15 Sep 2026 18:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789496481;
	bh=KIdGYMcq+dBeGCbsrx5rPMqcCMjSKW7LVZY+ETyow5E=;
	h=From:To:Cc:Subject:Date;
	b=L6gEsnf2QYLY9c+87eGsl9SPz1nxzikE10FVdyIC6b2zvorUTkDZCU4Vss94P9USF
	 XHw2Y7mDsd//WkIOsBkQsEtWVe/t8eIoQS2u1lMx0ElMqXWBuhbJQILoLrOKsUwHb8
	 1HJ0EpRnc0dGSxNDC9DBhJURzJ7brLBi13rckAh9AniasujBuEy+E3Oi32fEzqXpXP
	 g7gULYko1Y41RaW8RMrnmIYobGzwACLIuUsf7hQoG3MfBavCfh2tR8zDaHAxOh3vvJ
	 SPAqdrJY1mGJU2kX4ohQGcJcU1qA2na3FvWISelxED0bAD5IWv0IMjDx3MBJ0bFTad
	 uxRWSXbvs/ayg==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Dimitri Daskalakis <daskald@meta.com>,
	Weiming Shi <bestswngs@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Breno Leitao <leitao@debian.org>,
	Tao Cui <cuitao@kylinos.cn>,
	Pavel Begunkov <asml.silence@gmail.com>,
	David Wei <dw@davidwei.uk>
Subject: [PATCH net-next v3 0/5] fbnic: Support larger RX pages
Date: Tue, 15 Sep 2026 20:20:58 +0200
Message-ID: <20260915182105.4162425-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi!

This series adds support for large io_uring zero-copy RX buffers to
fbnic.

fbnic hardware consumes receive memory in 4 KiB device pages, while
io_uring may expose a larger software buffer, such as 256 KiB. Track
the device-page geometry per BDQ, represent each large buffer with
consecutive descriptors, and decode completions to the corresponding
offset within the buffer. HPQ keeps its existing PAGE_SIZE geometry.

Larger buffers also reduce pressure on the memory provider. One
provider allocation supplies multiple 4 KiB device pages, so the same
amount of receive memory needs fewer net_iov objects and fewer
allocation, refill, and recycle operations. Hardware descriptor use
remains unchanged.

Ring depth and buffer size must be validated together. An ethtool ring
change can otherwise make an active memory-provider configuration
invalid. Store accepted ring depths in netdev_config, stage proposed
values in cfg_pending, and validate the default and each RX queue
before committing the change. Both netlink and ioctl use the same
transaction helpers.

The selftest requests a power-of-two buffer larger than twice the MTU,
checks the reported buffer length, and verifies received data. It does
not assume how packets are placed within the buffer.

Sashiko found, as usual, a number of bugs. I've sent the relevant ones
to net.

Changes in v3
=============

- Carry Breno's Reviewed-by on the netdev_config helper patch.
- Clarify that the fbnic ring-depth consumer follows the core patch.
- Document initialization, override, normalization, and stored ring
  depth semantics.
- Drop the CQE placement assertion from the large-buffer test.
- Reject a zero RX-jumbo depth before validating large RX pages.
- Rebase on net-next.

Changes in v2
=============

- Add generic netdev_config lifecycle helpers for the netlink and ioctl
  paths.
- Store ring parameters in netdev_config and revalidate RX queues before
  committing a ring change.
- Preserve the distinction between accepted and applied HDS state.
- Track fbnic device-page geometry per BDQ.
- Validate the fbnic RX page size, fragment count, and PPQ depth.
- Add automated large-buffer test coverage.


v2: https://lore.kernel.org/netdev/20260910180908.1506533-1-bjorn@kernel.org/
v1: https://lore.kernel.org/netdev/20260522113225.241337-1-bjorn@kernel.org/

Björn Töpel (4):
  fbnic: Track BDQ device-page geometry per ring
  net: Revalidate queue config for ringparam changes
  fbnic: Support larger memory-provider RX pages
  selftests: drv-net: Request larger zcrx buffers

Jakub Kicinski (1):
  net: Add netdev_config helpers

 drivers/net/ethernet/meta/fbnic/fbnic_csr.h   |  34 +---
 .../net/ethernet/meta/fbnic/fbnic_debugfs.c   |   5 +-
 .../net/ethernet/meta/fbnic/fbnic_netdev.c    |   5 +
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c  | 173 ++++++++++++++----
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.h  |   7 +
 include/net/netdev_queues.h                   |  49 ++++-
 net/core/dev.c                                |   7 +-
 net/core/dev.h                                |   7 +
 net/core/netdev_config.c                      |  75 +++++++-
 net/ethtool/common.c                          |   9 +
 net/ethtool/common.h                          |   2 +
 net/ethtool/ioctl.c                           |  24 ++-
 net/ethtool/netlink.c                         |  15 +-
 net/ethtool/rings.c                           |  13 +-
 .../selftests/drivers/net/hw/iou-zcrx.py      |   6 +-
 15 files changed, 345 insertions(+), 86 deletions(-)


base-commit: b8e9e7d82e7eefd5d2d528469d94ec20e96b38c3
-- 
2.55.0

