Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9429951FCD1;
	Thu, 10 Sep 2026 18:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789063761; cv=none; b=mzk/6geBiqTlKMEHFonrVQSlYRtP0ndbTy9Nx6jP8ydp6IbGzzeZNZeDIAXBWr7pCtWOSyLPpqM5rFfBBVEc0FAZbOtK905o+8XNXShYNk0KLIkQdwWxMzTdjIDHdFuzv8qFLluGa4WnkVnrrlkmgeMnS4ZpJDDp14wnJulbLgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789063761; c=relaxed/simple;
	bh=qorGJyYS6nvMoW+R7pQhQnJEdYbo6NknBhgmEyCxpbc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kG5VNKrOBybQ52Tk97J+AU1K46R93rr+Nb6AR026S1bu4q+i/Uh59G/ZLif/28nKTwOUoZXXf/w05JJZ0dVDlAhUtJO6pf6rMzRYbUiN8fJv9+mQprOSexceeQNeDL2vIuo35gRkZG8s44l0qeksHh2yIAdpV6P1OIcNE7kwsaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KIh6DKnL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KIh6DKnL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CFD51F000FF;
	Thu, 10 Sep 2026 18:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789063760;
	bh=91suzAE6OB+CHTM049kw/QY2viLYB5QINw6In2HnGy4=;
	h=From:To:Cc:Subject:Date;
	b=KIh6DKnLn+XFP2Iw49SqoiqxlJBtNdHaIjvQsvVxu9tqdNDhctSv5BVMV35qv1Ous
	 QsFerCRVpB1YNlFtevXuSu0YYkJ8oW9aArNF562FygwWipuhcaPzhxmCTCShIfKxAj
	 PcPgHtNqc0BwSPrCJ8rvQdbjR9YC9ATA5TndHuXWniOlIFzRV0AUHaNm8+UK2z0VgD
	 nzAgNeeHmKCVAg0sHxo7ZvdXrRJouS9bRkmeBM4yPSTvD+SPL0iSBDB8hPCRyvyyyo
	 z48IhpOtpzA/KF8w/XvuksRQtsUbCiPKB962C/DzYc+6RZSvFT9rFnBf+zhCN07MIv
	 6SgKOOABXzNTA==
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
Subject: [PATCH net-next v2 0/5] fbnic: Support larger RX pages
Date: Thu, 10 Sep 2026 20:09:00 +0200
Message-ID: <20260910180908.1506533-1-bjorn@kernel.org>
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

The v1 was out end-of-May! I hope you didn't hold your breath! ;-)
Here goes...

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

The selftest requests a buffer larger than twice the MTU and requires
a receive CQE to end past the first MTU-sized region. Drivers which
reject the size are skipped. Drivers which accept it but only use that
first region fail.

Changes in v2
=============

- Add generic netdev_config lifecycle helpers, and use
  netdev_reconfig_start() and __netdev_free_config() from both the
  netlink and ioctl paths.
- Store ring parameters in netdev_config and revalidate the default and
  each RX queue before committing a ring change.
- Preserve the distinction between accepted and applied HDS state:
  unrelated SET operations retain an accepted auto value, while
  RINGS_GET reports the state applied by the driver.
- Track the fbnic device-page geometry per BDQ and use it when posting
  buffers and decoding completions.
- Validate fbnic RX page size, payload fragment count, and the number of
  software entries available in the payload queue.
- Replace the manual-only offset check with a portable check run by the
  Python large-buffer test, and include the received byte count on
  timeout.
- Rebase on net-next.

v1: https://lore.kernel.org/netdev/20260522113225.241337-1-bjorn@kernel.org/

Björn Töpel (4):
  fbnic: Track BDQ device-page geometry per ring
  net: Revalidate queue config for ringparam changes
  fbnic: Support larger memory-provider RX pages
  selftests: drv-net: Test large zcrx buffers

Jakub Kicinski (1):
  net: Add netdev_config helpers

 drivers/net/ethernet/meta/fbnic/fbnic_csr.h   |  34 +---
 .../net/ethernet/meta/fbnic/fbnic_debugfs.c   |   5 +-
 .../net/ethernet/meta/fbnic/fbnic_ethtool.c   |   8 +-
 .../net/ethernet/meta/fbnic/fbnic_netdev.c    |   5 +
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c  | 165 ++++++++++++++----
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.h  |  12 ++
 include/net/netdev_queues.h                   |  48 ++++-
 net/core/dev.c                                |   7 +-
 net/core/dev.h                                |   7 +
 net/core/netdev_config.c                      |  75 +++++++-
 net/ethtool/common.c                          |   9 +
 net/ethtool/common.h                          |   2 +
 net/ethtool/ioctl.c                           |  24 ++-
 net/ethtool/netlink.c                         |  15 +-
 net/ethtool/rings.c                           |  13 +-
 .../selftests/drivers/net/hw/iou-zcrx.c       |  33 +++-
 .../selftests/drivers/net/hw/iou-zcrx.py      |   6 +-
 17 files changed, 374 insertions(+), 94 deletions(-)


base-commit: 0abe8777490ebc008635ecb20297761d1b317697
-- 
2.55.0

