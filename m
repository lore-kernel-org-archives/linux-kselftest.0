Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736059;
	b=20JDDikcVk6UbHtC17k862KOUaSDO2CRkC1ZDqCoQ3AoASRQdArEZ8Cmh8PXOheCdkay
	 Ag574IyTU0RL/uJWYhV1ELBYL0TlHOyptPl7nskvWUfrUrlQ2C1jlQU7eXCHcdEnc8HAG
	 6IxWxU1KxUBhcs6BDhV1ZMi4u+CVRxw+NCcCdPI0kxA+YLMlV47qVNurQqM24WTvNPuDq
	 Wh5EEx33gakMy6jnLdOzPjtBR28EHq/pRjvpVwiR9QaI7KyR1p/uRwQb7YnZNY3SHfcBk
	 L7LNFKkqeofyux5cte0Kbytg+RXDbSVL4T0aINulQy6sWkPDBP4bUrOUiEQLZrs6tRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wkydveF0zq5jAFEFr/DEfHBHOLC9wRiqiIlprBvXT0U=;
	b=I3ZAa/WSLXDH5qp5U/x1ZdpyAnXh8ldNJNeuFcCI9SaL48akUTzuOcsdR6FvXbqcX+92
	 YuFQFkVr35DC4OG/VsRNPh37k9+lb7wOH4JvCxrIy//p2SrO6NZy1wYGFb50VaQg3tNxw
	 5wo3sLzXLTzc3vdfYXqS7IGsxmJUIK+8+34gGAmql+aQtM2Nle+Pst6kA6sS9b1uJ8HUP
	 Sq98FsiqRtgw9qK/15BYPmgjojs+b33/vl/1p/BMgOgjQFubEPFXYC9tQOVaxRidT0cqz
	 7WueDGETxbow2laeALWdAkDoH4XZ4MvoDts4rEoMpRFKTEHD3rnNQ5V/0WifDk7+9gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b="F7FIs0/3";
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8B5606A31B
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 20:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B8B5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=F7FIs0/3
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so7053565a12.2
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 12:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1793736058; x=1794340858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wkydveF0zq5jAFEFr/DEfHBHOLC9wRiqiIlprBvXT0U=;
        b=F7FIs0/3+Ty6jo5zAhl0l4yDHXyXiG1N7o1sAt0wUS/AVTpd3WJFSFbtxNqjfBVZ/F
         BTb/33O8/v2FPTbLzj6815/tzeGrsxvkee8XbbNsxwMOC+XhJ3PKOzqbFLoydaQ0kfr0
         vntwPSg34Knm3kb3ehlKMDdh2om105Vbf1JhW8bfpiDmGJFRL7Wuq7iBHzwUQ5Q3lGRk
         OSH8zkn4mWYp+2BcjTJa6JrqIkWb41EGFuJ81VtOTmCOtGV3bsCDLBnVHN5BGZ1zmEfI
         LPvMW+pbjg4Gx0TriFAGdrLHOimaedt9Xv3kvmnmGRbtTekGJAs0Viis9pG1QysXVBh6
         2cVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736058; x=1794340858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wkydveF0zq5jAFEFr/DEfHBHOLC9wRiqiIlprBvXT0U=;
        b=D/TgFp7/uUi+LgxeGtlEY+6hFLBrXHUEfF9N+b+8H8jjADyvXCBujTgvMZ2oJ1i37M
         FJ5NphzCuCaNGci63RMRiShnoHcBKDlDQbpgbiNu5WfEjqUrj6QLU7dGbkSccI0AwPuz
         OJx9bj+Nyul8QPY+fsZNRty+YIOtvFGf1g/3URgmO0/UYxoYLQbMq6V1/1SeISachqTC
         fmH7dGnwOuDqoooGHSv/uy43k+J7MQc/Mdz39SAJp9FFa56DMSep06NTE2s7s0jEZvlr
         /HSidEwHoAjfP1R4vqmNZZm8hvh6LPwtTa1L0eeQYzom7wZKmZUqBH8EFCmMVYhEmN3i
         nN6g==
X-Forwarded-Encrypted: i=1; AKwUvBzXrpe8NuhhG5IytCGlOEXE7pkKdw0mjGPyZmFXu7A7jbtOi6bsbWIpxjq+E5XDbObu+dKww1OEbD4y/N/Viiw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Bo5pUEh+/kXfrkR3KxbHLvMzPsiAGFpFcMr7sbeuOYwNDxdWv
	qRLmz4mbL/LAWa8dz8W8EatmNGOpzoUpkjf9mDQJVvhNnZAToflI3uWEKGhrUShfMso=
X-Gm-Gg: AYBFou2Qo/CrA1HddaqLuWLqn07J9t9qk9puewdNZ+7JUk65sL5r5XDjrS6zx+huve5
	MQD1E/gZGerI3o0avRnZEbH2wr/xIyFIjygRQWvnUWeJFp6/wt9bW5IjCFlYDRHtU8O2GV3CmX/
	cUzVmSmdInbO5H+2lvEvZUzo1bRyOAq+2oTPPyxdaCVIp5t0PgVtTv+Z0PZxb65jQ/LdyypFNuz
	1FXmTR7Q/ukz3iK6q58oxjbYfVaR+X2KJVHPTI5ivslDA2n2itdLYEoL5jOhCFY9GmDJGztZ9/B
	dhOF1Z2iMyfQg5m4I5mreX0sNTCYh6Szgc0WPrDo+wHnwYbDuFgKNabATlV5n1yFwIIU1BNbX1f
	hAVPhb5Ny1rqM7NmiTQgr167vYJJspetEk2r1StMo4Hwk7gPKGuMCGsUzkR0NL1UebUy9Yry0gX
	FoPZqpkncb/UNqsieIw9UGo+28Sykqfbd7cr/LjRMVC2QEeE3LZX8SM4zufK78iGCDDiaeirGNl
	j3sd8EtEMO1B1Xgt7NKwOTfrD/1GztnQ+1YEO897AZiKqpcVGwN+a7obNhG7ILlJjOSzWn2KvYi
	subbwxIhE/No8VYSUqsHIk8RsvISACUFR4eEL8ZwXUqji5U=
X-Received: by 2002:a05:6402:234b:b0:6b1:df89:7e1e with SMTP id 4fb4d7f45d1cf-6b4d33aaff6mr10849177a12.1.1793736057694;
        Tue, 03 Nov 2026 12:00:57 -0800 (PST)
Received: from D90XRJJJNQ ([2a09:bac6:37af:1e5a::306:a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec91e2f2sm4499801a12.0.2026.11.03.12.00.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 12:00:56 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Shuah Khan <shuah@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Toke Hoiland-Jorgensen <toke@redhat.com>,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org,
	kernel-team@cloudflare.com,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net 2/2] selftests: drv-net: ping: test generic XDP redirect to cpumap
Date: Tue,  3 Nov 2026 20:00:37 +0000
Message-ID: <20261103200036.65764-4-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103200036.65764-2-tianyi@cloudflare.com>
References: <20261103200036.65764-2-tianyi@cloudflare.com>
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

The generic XDP tests in ping.py only cover XDP_PASS. Add a test that
redirects all packets to a cpumap with an xdp.frags program. It runs
the same ping and TCP checks as the other tests.

xdp_cpumap.bpf.c is a new program. It redirects every packet to entry 0
of a cpumap. It is not added to xdp_dummy.bpf.c. test_xdp_offload loads
xdp_dummy.bpf.o in offload mode, which would fail on a cpumap.

The new test extends _set_xdp_generic_mb_on() with two optional
arguments. The first argument, prog, is the XDP program file name, with
default "xdp_dummy.bpf.o". The second argument, on_attach, is a
callback function, with default None. on_attach runs right after the
program is attached. The new test passes "xdp_cpumap.bpf.o" to prog and
a lambda that adds the cpumap entry to on_attach.

Without the previous patch, the new test fails on netdevsim because ping
gets no reply.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
 tools/testing/selftests/drivers/net/ping.py   | 27 ++++++++++++++++---
 .../selftests/net/lib/xdp_cpumap.bpf.c        | 19 +++++++++++++
 2 files changed, 43 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/net/lib/xdp_cpumap.bpf.c

diff --git a/tools/testing/selftests/drivers/net/ping.py b/tools/testing/selftests/drivers/net/ping.py
index da3623c5e8a9..a0de9a98d906 100755
--- a/tools/testing/selftests/drivers/net/ping.py
+++ b/tools/testing/selftests/drivers/net/ping.py
@@ -7,7 +7,7 @@ from lib.py import ksft_run, ksft_exit
 from lib.py import ksft_eq, KsftSkipEx, KsftFailEx
 from lib.py import EthtoolFamily, NetDrvEpEnv
 from lib.py import bkg, cmd, wait_port_listen, rand_port
-from lib.py import defer, ethtool, ip
+from lib.py import bpf_map_set, defer, ethtool, ip
 
 no_sleep=False
 
@@ -75,16 +75,23 @@ def _set_xdp_generic_sb_on(cfg) -> None:
     if no_sleep != True:
         time.sleep(10)
 
-def _set_xdp_generic_mb_on(cfg) -> None:
-    prog = cfg.net_lib_dir / "xdp_dummy.bpf.o"
+def _set_xdp_generic_mb_on(cfg, prog="xdp_dummy.bpf.o", on_attach=None) -> None:
+    prog = cfg.net_lib_dir / prog
     cmd(f"ip link set dev {cfg.remote_ifname} mtu 9000", shell=True, host=cfg.remote)
     defer(ip, f"link set dev {cfg.remote_ifname} mtu 1500", host=cfg.remote)
     ip("link set dev %s mtu 9000 xdpgeneric obj %s sec xdp.frags" % (cfg.ifname, prog))
     defer(ip, f"link set dev {cfg.ifname} mtu 1500 xdpgeneric off")
+    if on_attach:
+        on_attach()
 
     if no_sleep != True:
         time.sleep(10)
 
+def _set_xdp_generic_cpumap_mb_on(cfg) -> None:
+    cfg.require_cmd("bpftool")
+    _set_xdp_generic_mb_on(cfg, "xdp_cpumap.bpf.o",
+                           on_attach=lambda: bpf_map_set("map_cpumap", 0, 2048))
+
 def _set_xdp_native_sb_on(cfg) -> None:
     prog = cfg.net_lib_dir / "xdp_dummy.bpf.o"
     cmd(f"ip link set dev {cfg.remote_ifname} mtu 1500", shell=True, host=cfg.remote)
@@ -192,6 +199,19 @@ def test_xdp_generic_mb(cfg, netnl) -> None:
     _test_v6(cfg)
     _test_tcp(cfg)
 
+def test_xdp_generic_cpumap_mb(cfg, netnl) -> None:
+    """Redirect all packets to a cpumap from a generic xdp.frags program."""
+    _schedule_checksum_reset(cfg, netnl)
+    _set_xdp_generic_cpumap_mb_on(cfg)
+    _set_offload_checksum(cfg, netnl, "off")
+    _test_v4(cfg)
+    _test_v6(cfg)
+    _test_tcp(cfg)
+    _set_offload_checksum(cfg, netnl, "on")
+    _test_v4(cfg)
+    _test_v6(cfg)
+    _test_tcp(cfg)
+
 def test_xdp_native_sb(cfg, netnl) -> None:
     _schedule_checksum_reset(cfg, netnl)
     _set_xdp_native_sb_on(cfg)
@@ -230,6 +250,7 @@ def main() -> None:
                   test_default_v6,
                   test_xdp_generic_sb,
                   test_xdp_generic_mb,
+                  test_xdp_generic_cpumap_mb,
                   test_xdp_native_sb,
                   test_xdp_native_mb,
                   test_xdp_offload],
diff --git a/tools/testing/selftests/net/lib/xdp_cpumap.bpf.c b/tools/testing/selftests/net/lib/xdp_cpumap.bpf.c
new file mode 100644
index 000000000000..150352343114
--- /dev/null
+++ b/tools/testing/selftests/net/lib/xdp_cpumap.bpf.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bpf.h>
+#include <bpf/bpf_helpers.h>
+
+struct {
+	__uint(type, BPF_MAP_TYPE_CPUMAP);
+	__uint(max_entries, 1);
+	__type(key, __u32);
+	__type(value, __u32);
+} map_cpumap SEC(".maps");
+
+SEC("xdp.frags")
+int xdp_cpumap_prog_frags(struct xdp_md *ctx)
+{
+	return bpf_redirect_map(&map_cpumap, 0, XDP_DROP);
+}
+
+char _license[] SEC("license") = "GPL";
-- 
2.55.0

