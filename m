Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61B448EC9C;
	Sat, 12 Sep 2026 20:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789245068; cv=none; b=uFWnDkQwh8NweOGPsA/8r+mqZbK5k/TdqlU0jePaiqvWNCN99hL/OAYZuJA9vfbeR/QQibGvYs1kv8XA2UMpZlNvTMLDhdF3/p0Y5NSVXPDFvea/QenSAI1jZu9c4JBI8u/uDIzGhgitdcv8tGegVXrPeNyVNmBBBkh7d8EvJrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789245068; c=relaxed/simple;
	bh=i/DfboC09w1OoSYqpykYca25DQ6Iq39VCWLaXJTqN0U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pILN3m6VAe2ftwTm2iWYdIZmkMre0CaJC08cw5U+s2UBLy0IG6UjAxVN4gICjKsHPKOHf0fd1t9RAfDnGa4JX+c4t/ncr3Ss5Hgo+0X/LcvmfLkJKClRhBfSwWpinQEJIayoF+NrdssQRUEsiFhQNwnc0RqcbcQwNXyoT3lrIQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hn9rilXa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hn9rilXa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EF981F000FF;
	Sat, 12 Sep 2026 20:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789245066;
	bh=cU9HmdemJ3B7ystRAfLxAFc+xW8+msRkFwpaz+oYuTE=;
	h=From:To:Cc:Subject:Date;
	b=Hn9rilXaMWn1qUyG/bJ6Ia/kFFPcDD/hHnVAjqjGk7yYlzTFR7KRNLWNFY0Aoimq4
	 qIWirnnQK0E8R4pJp2wGrAIOl3t3W0Aop6HQiZHb1m4tX4wr7I2Fzpjv8gsCAvI1Cd
	 J/LK+1YlX8NgJzaSWMPjcJq27sk1/fTSmcF2cqnqlWsJf278/ifCW9BKJFj/Ok2fWe
	 tZ5A4/8VIYnzTZAxiCqClrxTasQ5gSdTfjwNPE6Emlfi2KWaeg8l5f+Ta3YWT7qar0
	 boWezJ8wKX+Q7K6KRB253oYSAcQO09CDSzq/ojBzqWyE2kGr1ADH9iQ0koEi84yy7j
	 y+PQ7NTcyshEw==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	shuah@kernel.org,
	sdf@fomichev.me,
	razor@blackwall.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2] selftests: drv-net: devmem: set reuseaddr on the sender's source port
Date: Sat, 12 Sep 2026 13:31:01 -0700
Message-ID: <20260912203101.153688-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devmem.py fails on the HW runners with:

  CMD[remote]: dd if=/dev/zero bs=512 count=1 2>/dev/null | socat -b 512 \
    -u - TCP6:[fd00:2::1]:50051,bind=[fd00:2::2]:50051,nodelay
    STDERR: socat[41018] W bind(5, {AF=10 [fd00:2::2]:50051}, 28): \
            Address already in use

ncdevmem installs a 5-tuple flow rule which matches the source port, so
socat has to bind it explicitly. The port comes from rand_port(), which
checks availability on the DUT - but we bind on the remote...
That said the failure rate seems to high to be random collisions
(~2% per sub-test). It's probably TIME_WAIT sockets on the remote,
run_rx_hds() alone creates 12 of them.

Set reuseaddr so a TIME_WAIT socket does not fail the bind. Collisions
with a live socket are still possible, we'll see if they are frequent
enough to care.

Reviewed-by: Breno Leitao <leitao@debian.org>
Reviewed-by: Bobby Eshleman <bobbyeshleman@meta.com>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
v2:
 - also add reuseaddr in socat_listen()
 - keeping the subject unchanged to help PW, even tho we now
   also cover receiver sockets
v1: https://lore.kernel.org/178897895866.219967.293435162679292319@kernel.org

CC: shuah@kernel.org
CC: bobbyeshleman@meta.com
CC: sdf@fomichev.me
CC: leitao@debian.org
CC: razor@blackwall.org
CC: linux-kselftest@vger.kernel.org
---
 tools/testing/selftests/drivers/net/hw/devmem_lib.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/devmem_lib.py b/tools/testing/selftests/drivers/net/hw/devmem_lib.py
index 3554954a6691..71b916c16196 100644
--- a/tools/testing/selftests/drivers/net/hw/devmem_lib.py
+++ b/tools/testing/selftests/drivers/net/hw/devmem_lib.py
@@ -201,7 +201,7 @@ def ncdevmem_rx(cfg, port, verify=True, fail_on_linear=False, flow_steer=False,
     else:
         addr = cfg.baddr
 
-    suffix = f",bind={cfg.remote_baddr}:{port}"
+    suffix = f",bind={cfg.remote_baddr}:{port},reuseaddr"
 
     buf = ""
     if buf_size:
@@ -213,7 +213,7 @@ def ncdevmem_rx(cfg, port, verify=True, fail_on_linear=False, flow_steer=False,
 
 def socat_listen(cfg, port):
     """Socat listen command for TX tests."""
-    return f"socat -U - TCP{cfg.addr_ipver}-LISTEN:{port}"
+    return f"socat -U - TCP{cfg.addr_ipver}-LISTEN:{port},reuseaddr"
 
 
 def setup_test(cfg, bin_local):
-- 
2.55.0

