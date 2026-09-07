Received: from mta0.migadu.com (out-201.mta0.migadu.com [91.218.175.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463644071F3
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 07:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766119; cv=none; b=YZJ96Mtr0u5dmetteQFpGHFKium2kBvsYreG8ZkJUP5INlruBb/x4KnDVlkCy06u4YezGSchR9RqPTiQhnqQLbe8Jxt9M9eXnC20V0D0z6wJngjcQEEnXZeg4lAGavbhcs/UVuAC3Kta89H8J3l4C9tsRr1ARzGB1qMlJda+Swc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766119; c=relaxed/simple;
	bh=U36+s7lt3j4odLOnhivVcwQ+iQNG4iZNIJVXSr//Roc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hsvrp6J/AMbKhNdY+kDFyPti6BdYjLXje+LPv7KXcux8pZn5kan4/kdMHntZuJEgWsckiN2rqfGvv4zKrjPhIdbyodaa+pn28KUCJVSx1sUk04Vox289dLDDZryg/cE4Q6W4fXHgBgQnnv//UE390zgPTQw1r947HFBVhlcROpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FBuLUvrg; arc=none smtp.client-ip=91.218.175.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FBuLUvrg"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=U36+s7lt3j4odLOnhivVcwQ+iQNG4iZNIJVXSr//Roc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788766115; v=1; x=1789370915;
 b=FBuLUvrg+56DhX1OuT66OkAsZwzzIlChtcUYg50YoclgRoMc3h8PkR8lxII0RfAjsHXCQmpK
 M+Xp9/lfVRW6d6Raa5AVP09RHYCSnBscy2i6hbaGqWHOxUD+g/amEV9SejgAuinJSYo/jEURJjY
 7xrYiEXqF7I5C4dcTt0HMabY=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 06bd02fb2dca1679;
	Mon, 07 Sep 2026 07:28:34 +0000
X-Mizu-Trace-ID: 06bd02fb2dca1679
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Mon, 07 Sep 2026 15:28:09 +0800
Subject: [PATCH net] selftests/drivers/net: include lib/sh/*.sh
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260907-selftest_lib_defer-v1-1-8af94645aaa3@kylinos.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBG4avIrA1EG9LqVUREzZ92QKJkggjBu
 ze4/BbvZRJEhlBfZYo4WXgPBU1d0fqbwxeKXTG1urW600YJNp8gadp4mRw8otLN26wwL+s+M5X
 wiPB8PdOBAhKN9/0HLM7MAWkAAAA=
X-Change-ID: 20260904-selftest_lib_defer-0174ce436d8a
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, Jay Vosburgh <jv@jvosburgh.net>, 
 Vladimir Oltean <olteanv@gmail.com>, Breno Leitao <leitao@debian.org>, 
 Jiri Pirko <jiri@resnulli.us>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Jason Wang <jasowangio@gmail.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Petr Machata <petrm@nvidia.com>
Cc: Matthieu Baerts <matttbe@kernel.org>, 
 Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 virtualization@lists.linux.dev, Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.14.3

From: Hangbin Liu <liuhangbin@kylinos.cn>

When I tried to install and run bonding selftests via:

  make INSTALL_PATH=/tmp/kself TARGETS=drivers/net/bonding \
     -C tools/testing/selftests install

Some tests fail because net/lib/sh/defer.sh is missing:

  /tmp/kself/net/forwarding/../lib.sh: line 5: /tmp/kself/net/lib/sh/defer.sh: No such file or directory

One option is to add defer.sh directly to TEST_INCLUDES. Alternatively,
follow the approach from commit f72aa1b27628 ("selftests: net: include
lib/sh/*.sh with lib.sh"), which pulls in all .sh files to accommodate
future changes to the library directory.

This patch adds a wildcard to include all shell files for drivers/net
tests that consume net lib.sh. TEST_INCLUDES is also sorted to avoid
ordering‑related problems for future modifications. The team driver is
not affected by this bug, but we use the wildcard for it as well, rather
than listing only defer.sh.

Fixes: a6e263f125cd ("selftests: net: lib: Introduce deferred commands")
Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
Since this is a trivial fix, I have also updated the virtio_net part
within this patch. Please let me know if I should split the virtio_net
changes into a separate patch.

Before posting the patch, I ran `make install` for each subtest and
verified that `defer.sh` gets installed.
---
 tools/testing/selftests/drivers/net/Makefile            | 1 +
 tools/testing/selftests/drivers/net/bonding/Makefile    | 3 ++-
 tools/testing/selftests/drivers/net/dsa/Makefile        | 1 +
 tools/testing/selftests/drivers/net/hw/Makefile         | 3 ++-
 tools/testing/selftests/drivers/net/netconsole/Makefile | 3 ++-
 tools/testing/selftests/drivers/net/team/Makefile       | 4 ++--
 tools/testing/selftests/drivers/net/virtio_net/Makefile | 1 +
 7 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/Makefile b/tools/testing/selftests/drivers/net/Makefile
index d5bf4cb638a8..ab39c2e508f0 100644
--- a/tools/testing/selftests/drivers/net/Makefile
+++ b/tools/testing/selftests/drivers/net/Makefile
@@ -3,6 +3,7 @@ CFLAGS += $(KHDR_INCLUDES)
 
 TEST_INCLUDES := $(wildcard lib/py/*.py) \
 		 $(wildcard lib/sh/*.sh) \
+		 $(wildcard ../../net/lib/sh/*.sh) \
 		 ../../net/lib.sh \
 
 TEST_GEN_FILES := \
diff --git a/tools/testing/selftests/drivers/net/bonding/Makefile b/tools/testing/selftests/drivers/net/bonding/Makefile
index 6364ca02642d..e337c099fb40 100644
--- a/tools/testing/selftests/drivers/net/bonding/Makefile
+++ b/tools/testing/selftests/drivers/net/bonding/Makefile
@@ -27,9 +27,10 @@ TEST_FILES := \
 # end of TEST_FILES
 
 TEST_INCLUDES := \
-	../../../net/lib.sh \
+	$(wildcard ../../../net/lib/sh/*.sh) \
 	../lib/sh/lib_netcons.sh \
 	../../../net/forwarding/lib.sh \
+	../../../net/lib.sh \
 # end of TEST_INCLUDES
 
 include ../../../lib.mk
diff --git a/tools/testing/selftests/drivers/net/dsa/Makefile b/tools/testing/selftests/drivers/net/dsa/Makefile
index 7994bd0e5c44..7893011b3842 100644
--- a/tools/testing/selftests/drivers/net/dsa/Makefile
+++ b/tools/testing/selftests/drivers/net/dsa/Makefile
@@ -19,6 +19,7 @@ TEST_FILES := \
 # end of TEST_FILES
 
 TEST_INCLUDES := \
+	$(wildcard ../../../net/lib/sh/*.sh) \
 	../../../net/forwarding/bridge_locked_port.sh \
 	../../../net/forwarding/bridge_mdb.sh \
 	../../../net/forwarding/bridge_mld.sh \
diff --git a/tools/testing/selftests/drivers/net/hw/Makefile b/tools/testing/selftests/drivers/net/hw/Makefile
index 78bb0169350b..17c7e878ca42 100644
--- a/tools/testing/selftests/drivers/net/hw/Makefile
+++ b/tools/testing/selftests/drivers/net/hw/Makefile
@@ -64,10 +64,11 @@ TEST_FILES := \
 
 TEST_INCLUDES := \
 	$(wildcard lib/py/*.py ../lib/py/*.py) \
-	../../../net/lib.sh \
+	$(wildcard ../../../net/lib/sh/*.sh) \
 	../../../net/forwarding/ipip_lib.sh \
 	../../../net/forwarding/lib.sh \
 	../../../net/forwarding/tc_common.sh \
+	../../../net/lib.sh \
 	#
 
 # YNL files, must be before "include ..lib.mk"
diff --git a/tools/testing/selftests/drivers/net/netconsole/Makefile b/tools/testing/selftests/drivers/net/netconsole/Makefile
index f0674c0017fc..c7972a40babf 100644
--- a/tools/testing/selftests/drivers/net/netconsole/Makefile
+++ b/tools/testing/selftests/drivers/net/netconsole/Makefile
@@ -1,8 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
 TEST_INCLUDES := \
-	../../../net/lib.sh \
+	$(wildcard ../../../net/lib/sh/*.sh) \
 	../lib/sh/lib_netcons.sh \
+	../../../net/lib.sh \
 # end of TEST_INCLUDES
 
 TEST_PROGS := \
diff --git a/tools/testing/selftests/drivers/net/team/Makefile b/tools/testing/selftests/drivers/net/team/Makefile
index 7c58cf82121e..e40c83a92724 100644
--- a/tools/testing/selftests/drivers/net/team/Makefile
+++ b/tools/testing/selftests/drivers/net/team/Makefile
@@ -13,12 +13,12 @@ TEST_PROGS := \
 # end of TEST_PROGS
 
 TEST_INCLUDES := \
-	team_lib.sh \
+	$(wildcard ../../../net/lib/sh/*.sh) \
 	../bonding/lag_lib.sh \
 	../../../net/forwarding/lib.sh \
 	../../../net/in_netns.sh \
 	../../../net/lib.sh \
-	../../../net/lib/sh/defer.sh \
+	team_lib.sh \
 # end of TEST_INCLUDES
 
 include ../../../lib.mk
diff --git a/tools/testing/selftests/drivers/net/virtio_net/Makefile b/tools/testing/selftests/drivers/net/virtio_net/Makefile
index 868ece3fea1f..df34e29b5680 100644
--- a/tools/testing/selftests/drivers/net/virtio_net/Makefile
+++ b/tools/testing/selftests/drivers/net/virtio_net/Makefile
@@ -5,6 +5,7 @@ TEST_PROGS = basic_features.sh
 TEST_FILES = virtio_net_common.sh
 
 TEST_INCLUDES = \
+	$(wildcard ../../../net/lib/sh/*.sh) \
 	../../../net/forwarding/lib.sh \
 	../../../net/lib.sh \
 # end of TEST_INCLUDES

---
base-commit: 38b6be101006d3e7af972999f45d4f1e8250587a
change-id: 20260904-selftest_lib_defer-0174ce436d8a

Best regards,
-- 
Hangbin Liu <liuhangbin@kylinos.cn>

