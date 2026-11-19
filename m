Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.117
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795070988;
	b=5prnu83i3BgU8icRVMJ4fpybmURQi4LUEzJssmGI5DaDBzRJ/WmCsWTQ7JDjR3uoPK90
	 YCuYHXwjP24OMPTjqxgXCj3qT+Myx9N6XSZgxytkcCgMnLUSmXniQQ4Kh9TYlF22CJrcP
	 HZwFLCXqOazSWVmUK1RLmfY9JgZbqTs6A/ryQJL91NwKh3PBs+cN4gUWa/rL5pldhOXU8
	 AeLRik5WJhFrNGfrVMuocChzCFFBEVU0VszQec9Mige1DeaT+IBA9W7fG9OtoA4o1mJE1
	 /hCZ2j44W6ync4lJBx6k37zH9lh7Al+Wq77EMcI8PIK6r7aXkVDc5LyhIMV94SGb2kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795070988;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fFtNKWh5sCdTC+S0cGQWEyXMgW5g+xTd4hHCi9qN4EU=;
	b=2ydl7UeSWE9B/UR4iflX2Yk/mvRxuZSFwNLR8yHfY+t8o5PY+EgAymWPnKLzk1ixZBMU
	 CMYJ5kDfRkAdvjWQmAz2Iwhf7ghmd2EmzXCMGHIG+VMC66akqDcTkXdRRnpY3flQeueoy
	 MUMRocqvSCs1HePhmFEXn/OB/FEH6LNc9ZljLxwco39W0yfuOo3LXM4WgS3DGQ5v4Oy7w
	 zx52a9a5WpitbI6Q5yG86lzg6494LZuyUufx1DiDoknlg1k2cgwqx+YYPmisWdcl2KM+e
	 U1hiXMeyZbxe1VyQ9e7JVLc7L8IDz0ewAxglOGEsLnz+/t47AvEve9xxyAoWAlD/ocA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dhVp2N7C;
	arc=none smtp.remote-ip=91.218.175.117
Received: from mta0.migadu.com (out-117.mta0.migadu.com [91.218.175.117])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B34060A2600
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 06:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B34060A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dhVp2N7C
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/tGdPvwhxPFu63Kn0ZYWw898SW5K2Ud4dFBtURngO+c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795070985; v=1; x=1795675785;
 b=dhVp2N7CMC5DV45klPqWj7NK3D85UeOJIFFLgAuSSwn8+UfK2D9tJnPbnIQKRrn0nT0lUBvx
 DJLfQ/gi89BOdPf1fQlR/NLbDjFVYbvDzYAJsxe25RiI+f34/S0E+gfa/xt34FS0McYpntl6zgZ
 f6cO8+RE1ijZTlUq2DD1on8w=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a7cf3eda06a126e6;
	Thu, 19 Nov 2026 06:49:45 +0000
X-Mizu-Trace-ID: a7cf3eda06a126e6
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v3 2/2] selftests: drv-net: run tls_hw_offload on netdevsim
Date: Thu, 19 Nov 2026 14:48:51 +0800
Message-ID: <20261119064902.242502-3-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119064902.242502-1-jiayuan.chen@linux.dev>
References: <20261119064902.242502-1-jiayuan.chen@linux.dev>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that netdevsim offers kTLS device offload, let the test run on it
too: drop nsim_test=False so the default netdevsim pair is used when no
NETIF is set.

The only thing netdevsim can't give is ethtool -S: nsim_ethtool_ops in
drivers/net/netdevsim/ethtool.c has no get_sset_count or get_strings,
so the command fails and every case died taking the NIC counter
snapshot.  That is a gap in netdevsim itself, not in the TLS emulation,
and the NIC counters are optional in this test anyway, so skip the
snapshot on netdevsim instead of adding ethtool stats to the driver.
A netdevsim port passed in through NETIF still runs ethtool -S and fails,
that is not supported for now.

  # ./tls_hw_offload.py
  # Interface: eth1, driver: netdevsim
  TAP version 13
  1..8
  ok 1 tls_hw_offload.test_tls_offload.tls12_aes128
  ok 2 tls_hw_offload.test_tls_offload.tls12_aes256
  ok 3 tls_hw_offload.test_tls_offload.tls12_aes128_ip6
  ok 4 tls_hw_offload.test_tls_offload_sizes.small_buf
  ok 5 tls_hw_offload.test_tls_offload_sizes.large_buf
  ok 6 tls_hw_offload.test_tls_offload_sizes.random_buf
  ok 7 tls_hw_offload.test_tls_offload_record_type.handshake
  ok 8 tls_hw_offload.test_tls_offload_record_type.alert
  # Totals: pass:8 fail:0 xfail:0 xpass:0 skip:0 error:0

Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 tools/testing/selftests/drivers/net/hw/tls_hw_offload.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/hw/tls_hw_offload.py b/tools/testing/selftests/drivers/net/hw/tls_hw_offload.py
index e720ce6547610..1197f17caa13c 100755
--- a/tools/testing/selftests/drivers/net/hw/tls_hw_offload.py
+++ b/tools/testing/selftests/drivers/net/hw/tls_hw_offload.py
@@ -125,6 +125,9 @@ def read_nic_stats(cfg):
     # before/after-delta caveat as read_tls_stats(): these are device-wide,
     # so concurrent kTLS traffic on this NIC would perturb the deltas.
     stats = defaultdict(int)
+    # netdevsim has no ethtool -S, and the NIC counters below are optional
+    if cfg.get_local_nsim_dev():
+        return stats
     output = cmd(f"ethtool -S {cfg.ifname}").stdout
     for line in output.strip().split('\n'):
         key, sep, val = line.partition(':')
@@ -307,7 +310,7 @@ def test_tls_offload_record_type(cfg, record_type):
 
 def main() -> None:
     """Set up the DUT/peer environment and run the offload test suites."""
-    with NetDrvEpEnv(__file__, nsim_test=False) as cfg:
+    with NetDrvEpEnv(__file__) as cfg:
         cfg.bin_local = cfg.test_dir / "tls_hw_offload"
         cfg.bin_remote = None
         cfg.tls_skip_reason = None
-- 
2.43.0

