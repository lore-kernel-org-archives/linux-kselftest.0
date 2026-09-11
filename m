Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3E88635D;
	Fri, 11 Sep 2026 23:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789168285; cv=none; b=YWiy8/L4zoow0zWUueW8iyvRw03vMneRYezJxlkBvjK/BGDW8YrRCkFC/3jcUEF2QiSLwbcLiJ92OvjQAgaDF50xutBAFT42sHfO4Yur1iMb3chmzv8HD4EfsmVTt2pqCTjUIbEzUm6DNf2xjV/0yy0tOXOUjK59nC7iulZ7lAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789168285; c=relaxed/simple;
	bh=Gm8deTUUq8SK2KfDTmxZ9wTG4dA0MDu2rhDhD3qrcgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qWOy1fLvcwufXvvWalq/YMTIJgmoDrpS+3rPQFbL4achMWR/y6bZA37bho1jslbBbl4P6HErt3ehICGAS3w5au8HaMBcl5IExMOyxVD20EfokSezuUzyLDBE0GsuXd4EZXlCD8KvccZmNvtMGu9x+acQDK1XbngZhKzZKb6Kroc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vO+7T5+4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vO+7T5+4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85922C2BCF5;
	Fri, 11 Sep 2026 23:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789168285;
	bh=Gm8deTUUq8SK2KfDTmxZ9wTG4dA0MDu2rhDhD3qrcgU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=vO+7T5+4H9kXr3jpX6euDk0la4aH9N9leU0n0E8tztXkFy5a5NxvpS44cHVMoj95s
	 9/IXBr9NfvxNAinoVCzsT8mt8aYMg/5LgK3L6VfdWPtKr/5B63zxKIEpGpb7qsLjf4
	 QHm9jvwAWg1FkIP0wEvn4Arp7PggQma7EII2u/Pkdmi5F+eqFXqzVfP5Ma+iJOi0ls
	 eGvCqxQvhz7Z++fVGnMUwVkCi94st4A7VOHkosMvBw2AaIwDFdithjTffQndM0yEXF
	 2SL8SV0FFX7uv0n7XcvdMBwA+YrumZmsZjyarvBeMgWOZ2L3MifJBLMs/RWp7m+gql
	 bxvJY/L1EIvhg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7500FC88E53;
	Fri, 11 Sep 2026 23:11:25 +0000 (UTC)
From: Mark Amirkan via B4 Relay <devnull+markdamirkan.gmail.com@kernel.org>
Date: Fri, 11 Sep 2026 16:11:22 -0700
Subject: [PATCH net 2/2] selftests: net: add RPL SRH loop test
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-sympwn-rpl-send-v1-2-1753993bb584@gmail.com>
References: <20260911-sympwn-rpl-send-v1-0-1753993bb584@gmail.com>
In-Reply-To: <20260911-sympwn-rpl-send-v1-0-1753993bb584@gmail.com>
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Alexander Aring <alex.aring@gmail.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Mark Amirkan <markdamirkan@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789168285; l=2121;
 i=markdamirkan@gmail.com; s=pscsi-20260818; h=from:subject:message-id;
 bh=oYolW/2kgmaKhTJtOnbVhNTitMeYR8kNTB72g56mfrI=;
 b=0qrhrLzhLU4s5WCOOGL+Sb8Y7nG72SoC7cAB0bpXuevjbeF4Nb744BtxjOSTiIYledauPAv+f
 pVCl44yEdPQARSt1BVeseREqX1K8mXPvx8PtvZMGIX8NsnlTjjkAEG4
X-Developer-Key: i=markdamirkan@gmail.com; a=ed25519;
 pk=/wb49ibt4gZFDncmhFQBYtjPvzT1tfJtvK4Mqt1P2Wc=
X-Endpoint-Received: by B4 Relay for markdamirkan@gmail.com/pscsi-20260818
 with auth_id=961
X-Original-From: Mark Amirkan <markdamirkan@gmail.com>
Reply-To: markdamirkan@gmail.com

From: Mark Amirkan <markdamirkan@gmail.com>

Add two local addresses to a network namespace and exercise RPL route
validation. Verify that adjacent local addresses remain valid, while a
non-local address between them causes the route to be rejected.

Signed-off-by: Mark Amirkan <markdamirkan@gmail.com>
Assisted-by: Symbolic
---
 tools/testing/selftests/net/Makefile        |  1 +
 tools/testing/selftests/net/rpl_srh_loop.sh | 38 +++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 3ee3378f8b26..7fe7e38b9c6c 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -80,6 +80,7 @@ TEST_PROGS := \
 	reuseport_addr_any.sh \
 	route_hint.sh \
 	route_localnet.sh \
+	rpl_srh_loop.sh \
 	rps_default_mask.sh \
 	rtnetlink.py \
 	rtnetlink.sh \
diff --git a/tools/testing/selftests/net/rpl_srh_loop.sh b/tools/testing/selftests/net/rpl_srh_loop.sh
new file mode 100755
index 000000000000..a2e9991d789d
--- /dev/null
+++ b/tools/testing/selftests/net/rpl_srh_loop.sh
@@ -0,0 +1,38 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+source lib.sh
+
+cleanup()
+{
+	cleanup_ns "$NS"
+}
+
+trap cleanup EXIT
+
+require_command ip
+setup_ns NS || exit $?
+
+ip -n "$NS" -6 address add 2001:db8:1::1/128 dev lo nodad
+ip -n "$NS" -6 address add 2001:db8:3::1/128 dev lo nodad
+
+if ! ip -n "$NS" -6 route add 2001:db8:10::/64 \
+	encap rpl segs 2001:db8:4::1 dev lo 2>/dev/null; then
+	echo "SKIP: RPL lightweight tunnel support not available"
+	exit $ksft_skip
+fi
+
+RET=0
+ip -n "$NS" -6 route add 2001:db8:11::/64 \
+	encap rpl segs 2001:db8:1::1,2001:db8:3::1 dev lo
+check_err $? "Adjacent local addresses were rejected"
+log_test "RPL accepts adjacent local addresses"
+
+RET=0
+ip -n "$NS" -6 route add 2001:db8:12::/64 \
+	encap rpl segs 2001:db8:1::1,2001:db8:2::1,2001:db8:3::1 dev lo \
+	2>/dev/null
+check_fail $? "Separated local addresses were accepted"
+log_test "RPL rejects separated local addresses"
+
+exit $EXIT_STATUS

-- 
2.43.0


