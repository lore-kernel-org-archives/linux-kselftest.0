Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A056CE571
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 07:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775460435; cv=none; b=BuImpG1u3bvPenTjE9PmkLZIyMkfYlrv9GpQTzQV/xeIgVpOI8iAc2cuZi7MZKE+Xy92M/SPVnFPSXioRtGsXnLhTLZRbUuIdqYnr04e3cKAPLoJbu/pzJfcT9WPYRSI3iEtjBhYokKjjPl3vP5kJLkIYjEmuy7NuPB2z8scA9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775460435; c=relaxed/simple;
	bh=5xf2bbceAjrL9Kn0yXbZUdc9u2qLSvuJAqr0yCPb/MY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bBnMZqIhjY+0B+7kx5lfEOdLagblGH1rx59k/iF42IlCIben0mwSFQPY1lsK1Fh9JkZkIDMagg0Jn0FIsC//dFsa6tJsa1o0CjtiRj9kFD7nhJE0TWcYPre1Ou1SpcOBAq0ZDDHlTI6AoCBywnCQTc+VIIxYKt7RjzMP/OLdy/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com; spf=pass smtp.mailfrom=shopee.com; dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b=fhl4ULzz; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="fhl4ULzz"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35c124d2613so2026322a91.2
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 00:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1775460434; x=1776065234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/+l8xdJ81rnHVCDBCC4cOrkEDKbX4zpmL1qqNzt32Zg=;
        b=fhl4ULzzM3JxbZouxPkKN/7rTjYPN3YEpC3ZB6OYTyX4Eb7eWdz0InUBJR2eUpHwBT
         GM9n+s2IF8A8NQVlD4smGaMYzKRMZyryUeJCwH9cr5CXCNOTL/oJn/c2MLV5NJ8MsnH1
         iGWWSCazM5+HYYH5YwgAqQt4dCjkwGCzGeYbQMoF7dlr5z2fJvhglH6j6TV1NdLvJBFo
         lDoav5ssTuxyaOwadCG4QEu0zGH3Oqc/GNH96JjwPpBDcfKQKIAgOlVFn+FDSV0NbiPN
         HL4dLsekBNrbAKSdbSxN9NCMwQQgP6JUAzECK7g6yZZfhpa0F9avoVHZrnmph4zfBLF3
         BKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775460434; x=1776065234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+l8xdJ81rnHVCDBCC4cOrkEDKbX4zpmL1qqNzt32Zg=;
        b=gsT0Uh2VG5/rRbxO4/cmBRh4QyAU2LeYsmYrwAkxyF76wsVH1RIQRKj/lYS/tu4B3/
         p4qyc5a2f71wxt23GNV+o8KKVE+Uuwq8lFCrrl2AkjJjrNY1113DMSI9GOJC1bzSS5M7
         SyxVF12QSxd1JYikH721h/1u2nXbb5WimKLsoZouu+A6lhxZTUGvfIOagWtFx6RDNGSt
         DKnEy1CNu1EfQuy0zgViZ7g+aQ02+kfLTCAEUU4H1k29pCERMPVStsTabjE0DD65Gqrg
         dvRpKjtpZj9vM2H3ViIvyB3X8zl6jwHlN1sifbEmgBFQ6PZdH70q91Un3fOI9megTJDl
         f00A==
X-Forwarded-Encrypted: i=1; AJvYcCWiF265bX3pzAb1EyJ4rL+honWt4a61rJi5haI2351+/Q1FTp3FAO2Jd8j8BEFyeDNV2kbYEi3afFUA0mnApO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYWCkh5ReFFNvGxH9XB53Jq61haLp2YOFL417MWkUypeBtX0QG
	cbLcAbD0CZXhRYlG/IbVVAK7v1WDUEHzW2uYFpEdRp58grOUZO7kD9d8nxKvCMNah+s=
X-Gm-Gg: AeBDieuf/c+tbkUAQ7T7SlMKW6TBTJ2yRmBdnfCZ/h0xMt1kn3rJGju7tIwnOsyyTIq
	UTFqqX+4dpvXCvYF1H1NqW82kVn7+zz9oTKoNz2hyBLMGIECFLRJjYSnvNpsdPK0cevCs6RgvBN
	PG6Cf2Uox5WrdlwKgH/BMGpdvah8z6gcWfTHAXKNeXNku10n73WQYLbSyzA28nWNohDBhNGDBy2
	tsWS6juD0gp3f3gnobnDDf6WM8hx7pf7hsIvSm09Xug153NQKkgDHVoEFatpsj23E2ETgZJZJMN
	czQE2V5gMHT8qZD/4XPj/Gbbw1Wzux0dvFCc1KF7YkltlU8wW8GAnr5gH2t4ZWn7oAGwm8hvwTg
	rcSbm4shto1CqOLI7/i/v4Wgjk5/UcwV7OK16kmRga6u2WskOM4Bierw+C3NCh4UoYINtO2PI6z
	796H3tH/bI/kCvPwhIXUqJ5NAbZr4bE/1wZ6/ABVP6xE8MOYy00g==
X-Received: by 2002:a17:90b:384e:b0:35c:d01:d3dc with SMTP id 98e67ed59e1d1-35de68ec479mr10327576a91.18.1775460433873;
        Mon, 06 Apr 2026 00:27:13 -0700 (PDT)
Received: from bms-ytl-d1-app-10-251-178-27 ([147.136.157.0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd367bf24sm12920937a91.9.2026.04.06.00.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 00:27:13 -0700 (PDT)
From: Leon Hwang <leon.huangfu@shopee.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	Leon Hwang <leon.huangfu@shopee.com>,
	Leon Hwang <leon.hwang@linux.dev>
Subject: [PATCH net-next v2] selftests/drivers/net: Add an xdp test to xdp.py
Date: Mon,  6 Apr 2026 15:26:54 +0800
Message-ID: <20260406072655.368173-1-leon.huangfu@shopee.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In "bpf: Disallow freplace on XDP with mismatched xdp_has_frags values" [1],
this XDP test is suggested to add to xdp.py.

1. Verify the failure of updating frag-capable prog with non-frag-capable
   prog, when the frag-capable prog attaches to mtu=9k driver.

The test has been verified against Mellanox CX6 and Intel 82599ES NICs.

With dropping other tests, here is the test log.

 # ethtool -i eth0
 driver: mlx5_core
 version: 6.19.0-061900-generic

 # NETIF=eth0 python3 xdp.py
 TAP version 13
 1..1
 ok 1 xdp.test_xdp_native_update_mb_to_sb
 # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

 # ethtool -i eth0
 driver: ixgbe
 version: 6.19.0-061900-generic

 # NETIF=eth0 python3 xdp.py
 TAP version 13
 1..1
 # CMD: ip  link set dev eth0 xdpdrv obj /path/to/tools/testing/selftests/net/lib/xdp_dummy.bpf.o sec xdp.frags
 #   EXIT: 2
 #   STDERR: RTNETLINK answers: Invalid argument
 ok 1 xdp.test_xdp_native_update_mb_to_sb # SKIP device does not support multi-buffer XDP
 # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:1 error:0

Links:
[1] https://lore.kernel.org/bpf/20260326124205.1a3bb825@kernel.org/

Cc: Leon Hwang <leon.hwang@linux.dev>
Signed-off-by: Leon Hwang <leon.huangfu@shopee.com>
---
v1 -> v2:
- Update the category in subject from selftests/net to selftests/drivers/net.
- Drop _exec_cmd helper.
- Recover the original MTU using cfg.dev['mtu'] (per Kuba).
- Drop the unnecessary shell=True arg (per Kuba).
- Print error using ksft_pr (per Kuba).
- Drop the sb_to_mb case (per Kuba).
- Skip test when device supports sb XDP with mtu 9000 (per Kuba,Gemini/sashiko).
v1: https://lore.kernel.org/netdev/20260401052746.314667-1-leon.huangfu@shopee.com/
---
 tools/testing/selftests/drivers/net/xdp.py | 28 +++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/xdp.py b/tools/testing/selftests/drivers/net/xdp.py
index d86446569f89..864ca4097b87 100755
--- a/tools/testing/selftests/drivers/net/xdp.py
+++ b/tools/testing/selftests/drivers/net/xdp.py
@@ -13,7 +13,7 @@ from enum import Enum
 
 from lib.py import ksft_run, ksft_exit, ksft_eq, ksft_ge, ksft_ne, ksft_pr
 from lib.py import KsftNamedVariant, ksft_variants
-from lib.py import KsftFailEx, NetDrvEpEnv
+from lib.py import KsftFailEx, KsftSkipEx, NetDrvEpEnv
 from lib.py import EthtoolFamily, NetdevFamily, NlError
 from lib.py import bkg, cmd, rand_port, wait_port_listen
 from lib.py import ip, defer
@@ -693,6 +693,31 @@ def test_xdp_native_qstats(cfg, act):
             ksft_ge(after['tx-packets'], before['tx-packets'])
 
 
+def test_xdp_native_update_mb_to_sb(cfg):
+    obj = cfg.net_lib_dir / "xdp_dummy.bpf.o"
+    mtu = 9000
+
+    ip(f"link set dev {cfg.ifname} mtu {mtu}")
+    defer(ip, f"link set dev {cfg.ifname} mtu {cfg.dev['mtu']} xdpdrv off")
+
+    attach = cmd(f"ip link set dev {cfg.ifname} xdpdrv obj {obj} sec xdp", fail=False)
+    if attach.ret == 0:
+        raise KsftSkipEx(f"device supports single-buffer XDP with mtu {mtu}")
+
+    attach = cmd(f"ip link set dev {cfg.ifname} xdpdrv obj {obj} sec xdp.frags", fail=False)
+    if attach.ret != 0:
+        ksft_pr(attach)
+        raise KsftSkipEx("device does not support multi-buffer XDP")
+
+    # Verify updating mb -> mb program works.
+    cmd(f"ip -force link set dev {cfg.ifname} xdpdrv obj {obj} sec xdp.frags")
+
+    # Verify updating mb -> sb program does not work.
+    update = cmd(f"ip -force link set dev {cfg.ifname} xdpdrv obj {obj} sec xdp", fail=False)
+    if update.ret == 0:
+        raise KsftFailEx("device unexpectedly updates non-multi-buffer XDP")
+
+
 def main():
     """
     Main function to execute the XDP tests.
@@ -718,6 +743,7 @@ def main():
                 test_xdp_native_adjst_head_grow_data,
                 test_xdp_native_adjst_head_shrnk_data,
                 test_xdp_native_qstats,
+                test_xdp_native_update_mb_to_sb,
             ],
             args=(cfg,))
     ksft_exit()
-- 
2.53.0

