Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793225898;
	b=qpTPa2XBdldwauTjk6vLTydaGc1DDj+bZ1C81chuvGeayJc2dJ6HBsTRNuwVgcESmF6s
	 tP09Y0sAOzjv+C9e5ntjj1b9iyiRp16TXYeblwqJZ/ZHC3lgQywKoX9UiuvQ31l2mTvz4
	 oacd7b9Db5fyLqbNsD7o3NQAjsByuYh8M+QKaWHzI1BuKFwwjXwcsJOqrjJXNsC1XxhhV
	 RUVvCxhNJyTOQkko4MJmu08/r4kF/gmtC20Yf2tW1+5gpnrAsGaXeNLivEPV7GEhXGGmh
	 JzSXcma+k1qywy28eVnBFEvh/+biJnrb7Gk81N22NF5DREz15WzB7Bnnv5aA12rwCTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793225898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=LuXjD7L3OcsNkkaeGIp4Cs+2/jEhkIJjHJvLaqO3j5k=;
	b=YyPa3YXAhETEYXn8AZq8pZVL4TDplPeFmrMnD84e4OtMDP9BTafgSwBMCKshR8xF9nzV
	 nuWT/3s0MrZzBASr98QId1pKlH+7746CPkThInFo8Kh5cmefyoxmCDHLFCgI0Ef2PvW5o
	 u1eFrHC4LIaG8bZ4AcMiTtDvD5d5K7PKccKU82ZDdREnQebUVfrare7j/xe7DChDQgw+k
	 FxgfLTDjN05cUmm/UGTAMGzjkFZudsN2hV7YeiWH9fGkv4mtt+XFIeVHMvGMQlbhGRKw8
	 dnYMSVgXbn8qeO9mn32deFiVQR5EDvCSC7u1n0Z3xlXxyKNJ+PLKZ4bNJ37LaiNpPGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--halg.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cG9MXphV;
	arc=none smtp.remote-ip=209.85.208.70
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D8F60A2636
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 22:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5D8F60A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--halg.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cG9MXphV
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6b493134703so1274755a12.2
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 15:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793225896; x=1793830696; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LuXjD7L3OcsNkkaeGIp4Cs+2/jEhkIJjHJvLaqO3j5k=;
        b=cG9MXphVliGfueSx2Z0NoNbYsnSXHOGHkWt5dQAGZ8EsOMi4HeS3qSTjFLd5X4KDzN
         08MKv/iUjqxQdb3ioitFUylTCyNYvndTExu9ZkmqFsRzBm7wEb3IZEO4xL1pFDB3ImtK
         bjLsaohZ8mCteV0cvwxrH6GRnOyss5cZ0+p1j0gBk3m+rSFw7K1Ac/tXCxXFwPrdqD6R
         QQRGpEQ9oOEFX4JQzcl8eO1/yaGbuzVPrg6TvUD2Q5QrbaB1gfUzlpHpj9FeVjOu0/PI
         GmsDP24gl5/0EwYUvv6Kf4qYid+2zDPhTQzM9gs+aVHSfDV3rLlvMp8Dl4Hu7ng56jjm
         XyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793225896; x=1793830696;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LuXjD7L3OcsNkkaeGIp4Cs+2/jEhkIJjHJvLaqO3j5k=;
        b=PCIzrESymC50emXsSIjcui1OcF0xDyCaH/EuBgXm5To4pFr/mbVyheqmAV1wIiZovk
         JgeXP6cuWsxDp8w7W6nf9q83jF5CgAUSDaD4TZHBOQ+wIXBFFUWJ4FIkN9AVoPFHpdiL
         Xwacg7qfKRFthza88JIEnjmwUTuuuVaC+kj+j4n4VZc6TiEcEPU+sa91+6Gjjxy62Ey7
         XWocCEsFzJ2CiL1ugyAVaZrSMpqWVFnFastX2rk6HPKO951OMKBX+XeB9uwmoOLfNAa/
         W2yBxqE+2uTUTJvy6oUtXiy3nn/XAqyJWxbStvsUnfW/4b7F9J356lTx4Rngh5z/T8LW
         1d1Q==
X-Forwarded-Encrypted: i=1; AKwUvBw2+36Ci3E20eudU0J1Dghibb/4XFj9nB+ifUt8FVhe0bC0LAuBUXD35dxeBn8osrvZtM4tL8rqejCOYQ4oKog=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrLEfy0dmC6FvND46pPI8XMXETHJntxFOek42B3ksUCq70Z/R0
	+aNe1LU+Y6gGvc+ePHwnGfGMNuEqjoYdvs9RPdTWyzRpArcQd7H6unv+XTTy2RR5UDGSJX+BAQ=
	=
X-Received: from ejblw4.prod.google.com ([2002:a17:906:bcc4:b0:c46:48a5:ea8c])
 (user=halg job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:e2cf:b0:c49:c76f:dad4
 with SMTP id a640c23a62f3a-c49c76fdf58mr174243066b.31.1793225895629; Wed, 28
 Oct 2026 15:18:15 -0700 (PDT)
Date: Wed, 28 Oct 2026 22:17:02 +0000
In-Reply-To: <20261028221705.3915340-1-halg@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261028221705.3915340-1-halg@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261028221705.3915340-6-halg@google.com>
Subject: [PATCH 5/8] selftests/net: add test suite for CLONE_NEWNET_LOOPBACK
From: "Hallgrimur H. Gunnarsson" <halg@google.com>
To: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Jan Kara <jack@suse.cz>, James Morris <jmorris@namei.org>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jann Horn <jannh@google.com>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, KP Singh <kpsingh@kernel.org>, 
	Jonathan Calmels <jcalmels@3xx0.net>, Casey Schaufler <casey@schaufler-ca.com>, 
	linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-api@vger.kernel.org, containers@lists.linux.dev, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "Hallgrimur H. Gunnarsson" <halg@google.com>
Content-Type: text/plain; charset="UTF-8"

Add tests in tools/testing/selftests/net to validate
CLONE_NEWNET_LOOPBACK and UNSHARE_NEWNET_LOOPBACK behavior.

Signed-off-by: Hallgrimur H. Gunnarsson <halg@google.com>
---
 tools/testing/selftests/net/.gitignore       |   1 +
 tools/testing/selftests/net/Makefile         |   1 +
 tools/testing/selftests/net/loopback_netns.c | 103 +++++++++++++++++++
 3 files changed, 105 insertions(+)
 create mode 100644 tools/testing/selftests/net/loopback_netns.c

diff --git a/tools/testing/selftests/net/.gitignore b/tools/testing/selftests/net/.gitignore
index c9f46031ac73..54919a8b3682 100644
--- a/tools/testing/selftests/net/.gitignore
+++ b/tools/testing/selftests/net/.gitignore
@@ -18,6 +18,7 @@ ipv6_flowlabel
 ipv6_flowlabel_mgr
 ipv6_fragmentation
 log.txt
+loopback_netns
 msg_zerocopy
 netlink-dumps
 nettest
diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 0f5c178bc224..7d7e88e6676f 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -184,6 +184,7 @@ TEST_GEN_PROGS := \
 	icmp_rfc4884 \
 	ipv6_flowlabel_mgr \
 	ipv6_fragmentation \
+	loopback_netns \
 	proc_net_pktgen \
 	reuseaddr_conflict \
 	reuseport_bpf \
diff --git a/tools/testing/selftests/net/loopback_netns.c b/tools/testing/selftests/net/loopback_netns.c
new file mode 100644
index 000000000000..03cc665fb502
--- /dev/null
+++ b/tools/testing/selftests/net/loopback_netns.c
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0
+#define _GNU_SOURCE
+
+#include <errno.h>
+#include <sched.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/socket.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#include <linux/sched.h>
+#include <linux/types.h>
+#include <net/if.h>
+
+#include "../clone3/clone3_selftests.h"
+#include "../kselftest_harness.h"
+
+static int get_lo_flags(void)
+{
+	struct ifreq ifr;
+	int fd, ret;
+
+	memset(&ifr, 0, sizeof(ifr));
+	strncpy(ifr.ifr_name, "lo", IFNAMSIZ - 1);
+
+	fd = socket(AF_INET, SOCK_DGRAM, 0);
+	if (fd < 0)
+		return -errno;
+
+	ret = ioctl(fd, SIOCGIFFLAGS, &ifr);
+	close(fd);
+
+	if (ret < 0)
+		return -errno;
+
+	return ifr.ifr_flags;
+}
+
+TEST(baseline_lo_down)
+{
+	int flags;
+
+	ASSERT_EQ(0, unshare(CLONE_NEWUSER | CLONE_NEWNET));
+
+	flags = get_lo_flags();
+	ASSERT_GE(flags, 0);
+	EXPECT_EQ(0, flags & IFF_UP);
+}
+
+TEST(unshare_loopback)
+{
+	struct stat st_before, st_after;
+	int flags;
+
+	ASSERT_EQ(0, stat("/proc/self/ns/net", &st_before));
+	ASSERT_EQ(0, unshare(CLONE_NEWUSER | UNSHARE_NEWNET_LOOPBACK));
+	ASSERT_EQ(0, stat("/proc/self/ns/net", &st_after));
+	EXPECT_NE(st_before.st_ino, st_after.st_ino);
+
+	flags = get_lo_flags();
+	ASSERT_GE(flags, 0);
+	EXPECT_NE(0, flags & IFF_UP);
+	EXPECT_NE(0, flags & IFF_RUNNING);
+}
+
+TEST(clone3_loopback)
+{
+	struct __clone_args args = {
+		.flags = CLONE_NEWUSER | CLONE_NEWNET_LOOPBACK,
+		.exit_signal = SIGCHLD,
+	};
+	struct stat st_parent, st_child;
+	int status;
+	pid_t pid;
+
+	ASSERT_EQ(0, stat("/proc/self/ns/net", &st_parent));
+
+	pid = sys_clone3(&args, sizeof(args));
+	ASSERT_GE(pid, 0);
+
+	if (pid == 0) {
+		int flags;
+
+		if (stat("/proc/self/ns/net", &st_child) != 0 ||
+		    st_parent.st_ino == st_child.st_ino)
+			_exit(1);
+
+		flags = get_lo_flags();
+		if (flags < 0 || !(flags & IFF_UP) || !(flags & IFF_RUNNING))
+			_exit(2);
+
+		_exit(0);
+	}
+
+	ASSERT_EQ(pid, waitpid(pid, &status, 0));
+	ASSERT_TRUE(WIFEXITED(status));
+	EXPECT_EQ(0, WEXITSTATUS(status));
+}
+
+TEST_HARNESS_MAIN
-- 
2.56.0.313.g2479322e68-goog

