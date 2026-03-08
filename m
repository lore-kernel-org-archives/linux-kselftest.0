Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E5C1E505
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Mar 2026 23:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773012979; cv=none; b=SlGSUoEYfNpYcr2+7LcFOSQVIznSQCNiA86Lfr/1TZYLBqd3wA9JgKJCW1NGcNG+eDNXbSkaOD6pMJaCPpPXRP9xY6XfGtb/iQPiFRpqieZDzDcXzZ3KEwAcIUnvKrtrE0h0nycsxZ5yqbnMPp/q/u6Rom8/N6S/GijOFG/XyK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773012979; c=relaxed/simple;
	bh=x9npoaLfCeHar/3I6WsNJMaQHqEWIQTQe42/jBEGN4A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=DGaPvgQ1sjvQIWd6gKgV0CH49JFozYOh1x6nUjJp/Ywf2/VUh530vSA/QBYiqO7sH19i2RdNvOgF7pA1X5DR23SgKT7lmmfRfKBfiB2J4Fi5g955C2dX5jpOQ8G/5SGfOH5VbdcrdqXnfSMK/OmT81AU+pbcjekVCP+3U6IEU0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kayrjOnZ; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kayrjOnZ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773012975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6fPiM/cdQVfoTSx89LgNlFNrwK4GbMUAluOiWsTZlck=;
	b=kayrjOnZho1im7CcPZ26qO1ctnB0v2HSmGb2q+tCseplarUzOS/gWQV/7doN+4ITQ4/M8M
	qIK6Hxn+CT21oA3RyvL7KGi1IkQNQFyQLZa7nMq6Bh49bc7CHxKpzFK65JxZ8TJTgfGC5/
	4h1Srww8Sp2kSbpYxPhcFRAZrZcyOsQ=
From: Zhu Yanjun <yanjun.zhu@linux.dev>
To: jgg@ziepe.ca,
	leon@kernel.org,
	zyjzyj2000@gmail.com,
	yanjun.zhu@linux.dev,
	dsahern@kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v4 0/4] RDMA/rxe: Add the support that rxe can work in net namespace
Date: Sun,  8 Mar 2026 16:35:36 -0700
Message-ID: <20260308233540.13382-1-yanjun.zhu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Currently rxe does not work correctly in network namespaces.

When the rdma_rxe module is loaded, a UDP socket listening on port
4791 is created in init_net. When users run:

    ip link add ... type rxe

inside another network namespace, the RXE RDMA link is created but it
cannot function properly because the underlying UDP socket belongs to
init_net. Other network namespaces cannot use that socket.

To address this issue, this series introduces net namespace support
for rxe and moves socket management to be per network namespace.

The series first introduces per-net namespace management for the IPv4
and IPv6 sockets used by rxe. The sockets are created when the network
namespace becomes active and are released when the namespace is
destroyed.

Based on this infrastructure, rxe RDMA links are then created and
destroyed within each network namespace. This ensures that both the
UDP sockets and RDMA links are correctly scoped to the namespace in
which they are used.

With these changes, rxe RDMA links can be created and used both in
init_net and in other network namespaces, and resources are properly
cleaned up during namespace teardown.

The series also includes a selftest to verify RXE functionality in
network namespaces.

V3 -> V4: Squash all the changes about rxe_ns.c/h into one commit.
V2 -> V3: Fix build warnings
V1 -> V2: Fix the problems based on David Ahern.


Zhu Yanjun (4):
  RDMA/nldev: Add dellink function pointer
  RDMA/rxe: Add net namespace support for IPv4/IPv6 sockets
  RDMA/rxe: Support RDMA link creation and destruction per net namespace
  RDMA/rxe: Add testcase for net namespace rxe

 MAINTAINERS                                   |   1 +
 drivers/infiniband/core/nldev.c               |   6 +
 drivers/infiniband/sw/rxe/Makefile            |   3 +-
 drivers/infiniband/sw/rxe/rxe.c               |  38 ++++-
 drivers/infiniband/sw/rxe/rxe_net.c           | 145 +++++++++++++-----
 drivers/infiniband/sw/rxe/rxe_net.h           |   9 +-
 drivers/infiniband/sw/rxe/rxe_ns.c            | 136 ++++++++++++++++
 drivers/infiniband/sw/rxe/rxe_ns.h            |  17 ++
 include/rdma/rdma_netlink.h                   |   2 +
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/rdma/Makefile         |   7 +
 tools/testing/selftests/rdma/config           |   3 +
 tools/testing/selftests/rdma/rxe_ipv6.sh      |  47 ++++++
 .../selftests/rdma/rxe_rping_between_netns.sh |  57 +++++++
 .../selftests/rdma/rxe_socket_with_netns.sh   |  64 ++++++++
 .../rdma/rxe_test_NETDEV_UNREGISTER.sh        |  38 +++++
 16 files changed, 527 insertions(+), 47 deletions(-)
 create mode 100644 drivers/infiniband/sw/rxe/rxe_ns.c
 create mode 100644 drivers/infiniband/sw/rxe/rxe_ns.h
 create mode 100644 tools/testing/selftests/rdma/Makefile
 create mode 100644 tools/testing/selftests/rdma/config
 create mode 100755 tools/testing/selftests/rdma/rxe_ipv6.sh
 create mode 100755 tools/testing/selftests/rdma/rxe_rping_between_netns.sh
 create mode 100755 tools/testing/selftests/rdma/rxe_socket_with_netns.sh
 create mode 100755 tools/testing/selftests/rdma/rxe_test_NETDEV_UNREGISTER.sh

-- 
2.52.0

