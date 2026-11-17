Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924450;
	b=116YMm1Zz7gd+7w6wWEXViY9YIeDspJAfHzp9s73aL8XpwoYZv9tTYGJHL642dFsyg6/
	 uz/sBOtxEZtTkVbm6yaB32l1enTUkhVXVGDFStdNn3bpeUFzeVCdzVAy711C9zPo+TOOO
	 GI7Cuxs/JWZP8XDF6BzQQ8zBPGQfDKkkf3qYiDlgp/oTsTUJCLM4VSI/oA+sS4P3jyPN1
	 Y5DXhXRlhrnXDG1rLLYQYhqUZ9403qYnsvMBkXSeuLyMLzucy4aflxGEKMi34vuk8gPTr
	 trrODbS116S+ReIdRFVcTZ9VJQc2+XazPyBF3KsaOnucC8XNIlp0fb8i5ciEboX+NpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924450;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iJaEvWg9OTe150EoeiisC+aMq2Yvr+r+9zDhXa6Y07Y=;
	b=l4PpPHNDONsBY0ip+3yvyeTN8wmwNmZakHdivxUZYrRYNAxSCYOE2mu1mO8MeqW18veN
	 5eYcp3DmpOD23xa9LF5VmlARnh7zSsByh12sWPEBBUETN/4MQlYr9pjPKOHY61rclM/oF
	 /9XNpthpB+abUde1Mq2UXNmFXVIOHfl2oOYTOQVmvcaT9VdTpCH4uTM8nsLdX9q73AA/m
	 Wk3/LcUi/ne8L0rFSo27A3MC3Cq05Ww2Inlw2Y0PYkxhGvcpv/1QexlctwayHJs5WlB82
	 OLlFp/nhww5LbC8ubkHIOdcLZlWin23GspuAMNgS+GPrUSdXIvyVRnhm5RI7AnfaItQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MYANFeEf;
	arc=none smtp.remote-ip=91.218.175.182
Received: from mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4773C606A31C
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 14:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4773C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MYANFeEf
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RtbqUEc0su7Puf8hCD/i/LQztiNRX0a2j2imIdT0dUc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794924447; v=1; x=1795529247;
 b=MYANFeEfvWOZoglkBKsSFhUP/qr3jEAqkGvFlCHnXTexwF6gOlXA/dMwGRvHYZk10D9UUrqd
 S+peDi8RmHwpOYQ7LCgFRPunBFf+FqetwgRMQ+EAZMIj+wXWbw+UtUk/pzemVyzt3inKTDoxMC8
 B4eYnX7A+B1Fvpe9UhekrPjs=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 237cc9b92867efc5;
	Tue, 17 Nov 2026 14:07:27 +0000
X-Mizu-Trace-ID: 237cc9b92867efc5
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org,
	kuba@kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 2/2] selftests: drv-net: run tls_hw_offload on netdevsim
Date: Tue, 17 Nov 2026 22:06:31 +0800
Message-ID: <20261117140642.4008-3-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117140642.4008-1-jiayuan.chen@linux.dev>
References: <20261117140642.4008-1-jiayuan.chen@linux.dev>
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
NETIF is set.  Everything the test checks on the DUT, device MIB counters,
echo data and record types, works there as is.

The only thing netdevsim can't give is ethtool -S: nsim_ethtool_ops in
drivers/net/netdevsim/ethtool.c has no get_sset_count or get_strings,
so the command fails and every case died taking the NIC counter
snapshot.  That is a gap in netdevsim itself, not in the TLS emulation,
and the NIC counters are optional in this test anyway, so skip the
snapshot on netdevsim instead of adding ethtool stats to the driver.

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

