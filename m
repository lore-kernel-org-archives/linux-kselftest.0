Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E4A497B81;
	Fri, 25 Sep 2026 10:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790333068; cv=none; b=My9xPM4zYDx7vlYIf6RNh6IxYHk6zL3QQXKBWLDqao1P6hD6HvjNl/n5KB9WrcX8/uO+sHmhwK6HeGvNcevZup3XXzHEc1Agz4EYgvvG/bJjYDaQyu4gntGg2JrfRyb8Bqwk/disikVB0j1vicuaENm9Hsxt0LRsgMYXvTg4doM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790333068; c=relaxed/simple;
	bh=OcZ/H5VbX5rV8SaKdTzwQ6H/xkR6BFDJ3mqQSmVV9oU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G6Eq0hTVvZhgmaIVV0VHQVfOJ839myeFH8OHbJcAPZGTz63Ur1bfW45JOHF8pjcM6sHD/jkEgMTgQuZE+3IwT3XExuWe2AsBIO5sb+oYvAlU1Lct7XgNU47MXr+qFJ7TVk9eoQoKiKXZVIiM8kCDp5HxWCHiPGg9R6yXsW9oPnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JICC+xGP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JICC+xGP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8ED11F000FF;
	Fri, 25 Sep 2026 10:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790333066;
	bh=9elvgz5ZgXTGvxeikDMflzLeR6nob/gpH+bHTa7KCJY=;
	h=From:To:Cc:Subject:Date;
	b=JICC+xGPUEtk40NNnHxb10WtvQRwzoZNT0DGCK8TBncdwfEXaNWI5swRho9P1M115
	 8vn1a24Mlp6ut9CE5XLUzRAp/iRg7kQiKPMGc6gOi9C5CyZpF6zVxQhpxIW0XXSxkU
	 k+RxWt+87Ac0x45ZrfKanIR98A+mi92geOwuNWVjSnp3tcT4d+M/nuJ9Z1wmZsTj+Y
	 J2SiVWFawzNXFMFmNqwHeJ+mWb5CVsSEDc1xmWxYLwR3x5IpJL0H+7gKtZaQjGjxnU
	 qOSsq4hShDNRchSDd+jvS9Hv+ldAQ/dE+xJqU+F5vO7MbZBlSkwotDzqxUZWdKV4Eg
	 6ZQvfe4wOdDHQ==
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
Subject: [PATCH net-next v4 0/5] fbnic: Support larger RX pages
Date: Fri, 25 Sep 2026 12:44:07 +0200
Message-ID: <20260925104417.2325213-1-bjorn@kernel.org>
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
invalid. Store RX ring depths in netdev_config, stage proposed values
in cfg_pending, and validate the default and each RX queue before
committing the change. Both netlink and ioctl use the same transaction
helpers.

The selftest requests a power-of-two buffer larger than twice the MTU,
checks the reported buffer length, and verifies received data. It does
not assume how packets are placed within the buffer.

This series depends on the fbnic real-queue synchronization fix:
https://lore.kernel.org/netdev/20260924191817.1843726-1-bjorn@kernel.org/

Changes in v4
=============

- Document that set_ringparam callbacks must report normalized ring
  sizes through the in/out ethtool_ringparam argument.
- Drop the unused stored TX ring depth; only RX depths are consumed by
  queue-configuration validation.
- Document that drivers consuming RX ring depths must initialize them
  before registering the netdev.
- Note the dependency on the separately posted real-queue
  synchronization fix.
- Carry Breno's Reviewed-by on the BDQ geometry patch and Tested-by on
  the selftest patch.
- Rebase on net-next after the net tree merge.

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

- Add generic netdev_config lifecycle helpers for the netlink and
  ioctl paths.
- Store ring parameters in netdev_config and revalidate RX queues
  before committing a ring change.
- Preserve the distinction between accepted and applied HDS state.
- Track fbnic device-page geometry per BDQ.
- Validate the fbnic RX page size, fragment count, and PPQ depth.
- Add automated large-buffer test coverage.

v3: https://lore.kernel.org/netdev/20260915182105.4162425-1-bjorn@kernel.org/
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
 .../net/ethernet/meta/fbnic/fbnic_netdev.c    |   4 +
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c  | 173 ++++++++++++++----
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.h  |   7 +
 include/linux/ethtool.h                       |   4 +-
 include/net/netdev_queues.h                   |  56 +++++-
 net/core/dev.c                                |   7 +-
 net/core/dev.h                                |   7 +
 net/core/netdev_config.c                      |  75 +++++++-
 net/ethtool/common.c                          |   8 +
 net/ethtool/common.h                          |   2 +
 net/ethtool/ioctl.c                           |  24 ++-
 net/ethtool/netlink.c                         |  15 +-
 net/ethtool/rings.c                           |  13 +-
 .../selftests/drivers/net/hw/iou-zcrx.py      |   6 +-
 16 files changed, 350 insertions(+), 90 deletions(-)


base-commit: 42a9fb3382fc2573e92f41d203b095d9a372cfc9
-- 
2.55.0

