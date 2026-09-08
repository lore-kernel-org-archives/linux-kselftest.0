Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8D0531AFB;
	Tue,  8 Sep 2026 18:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788892473; cv=none; b=OiCeKpOFB20glgWySioH5u6mVTUv8aQ9AMy+rHhCkFXq4ShZC9w3ptAhXDFauu6YdvtGgqh8DAGi7lrB/S74IkGB+u9iozF6QKLOFcAwN/MnB3Ks4RVAuHsHZDnLf4eKgSlpNXDpn6VbZfMdTGcs/rICtVvIyNrxtyUn0H5tQwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788892473; c=relaxed/simple;
	bh=KqaRe5oDXfofNA6aUa5ish15rWRHOikEUyWj3XVOvfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QyvPIpJDkSo7bAQ2s55mPCUBVRcL+HXYIPX/5EUaxuDaEqZR50w4Zom+ZGVIBnRgl1ZQ/G/UTqo36ETB88ovpqnPdtH01105JBwz4GfPqYidKKaYwCjjoI2eke0c+O7cwzfmZVH4TXhh0y83r40rRXyk/bnltukfYEETnBJTIN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IxXLA6fz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IxXLA6fz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 799611F00A3A;
	Tue,  8 Sep 2026 18:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788892465;
	bh=tj69CnV7/mQljGyQjdl9aN8WaNK7KVgTy6egIaCyen8=;
	h=From:To:Cc:Subject:Date;
	b=IxXLA6fzcQ3XVNZgw+8yHAQ8zO/Hb9mAVr5U+9/Dms8Bd0XZjIYHlkBkwiA6P7lH2
	 dKqhTX7KLhZSKURBnUqmPfViBkwSwTLl/5u2fMRtpsJKoG4JKGdCEkPbF0AXTVAZqE
	 x2+HDZ+5X6QdOECpw/0BgLJOZkwKmgLMl2zeuXxSm153MGGdSBrhr4mog+IDfg9+0o
	 D94V0yXSd7nyjrigdPdbuNz2CbILVNdnuDHr/BJpQQsVuwwpJpduinjlYpEs9N/KmM
	 hBOlRI3AxHeXYQynzvgPlk8rlBuFFPAz+9XeC66WMVxjBwfqEkRItzZCT01+OTflV0
	 QhK6ykbXIpshg==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	shuah@kernel.org,
	bobbyeshleman@meta.com,
	sdf@fomichev.me,
	leitao@debian.org,
	razor@blackwall.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next] selftests: drv-net: devmem: set reuseaddr on the sender's source port
Date: Tue,  8 Sep 2026 11:34:20 -0700
Message-ID: <20260908183420.1369630-1-kuba@kernel.org>
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

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: shuah@kernel.org
CC: bobbyeshleman@meta.com
CC: sdf@fomichev.me
CC: leitao@debian.org
CC: razor@blackwall.org
CC: linux-kselftest@vger.kernel.org
---
 tools/testing/selftests/drivers/net/hw/devmem_lib.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/hw/devmem_lib.py b/tools/testing/selftests/drivers/net/hw/devmem_lib.py
index 3554954a6691..b6e52fa9dda5 100644
--- a/tools/testing/selftests/drivers/net/hw/devmem_lib.py
+++ b/tools/testing/selftests/drivers/net/hw/devmem_lib.py
@@ -201,7 +201,7 @@ def ncdevmem_rx(cfg, port, verify=True, fail_on_linear=False, flow_steer=False,
     else:
         addr = cfg.baddr
 
-    suffix = f",bind={cfg.remote_baddr}:{port}"
+    suffix = f",bind={cfg.remote_baddr}:{port},reuseaddr"
 
     buf = ""
     if buf_size:
-- 
2.55.0

