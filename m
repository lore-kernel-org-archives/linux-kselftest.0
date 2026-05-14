Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45AC392C25
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 17:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778779382; cv=none; b=hLIdfjPKIymBwZvZq3QC2BsdcqGWUObGAbYJ1nLrFL/JFPZd4gDoSrNUVaE2hC/jZ8tCi0S296RS0HUwDvHdmn2VphI8XSAjJ4jeoFe15gDNcApN6W5edzKrNscR5UW/2/6IcqSKWm2RTDHgSlHdDc6FPSC917ajoade9QhTgpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778779382; c=relaxed/simple;
	bh=EDyBqkyN5bDm600u/I66EqsZzueKCojlerqIBUvyphs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ik4hY/FnwVG6gVyBmlM4HJ4ye33Iz5Pc4iRwCQalNM+bOJNO1KAdjFPxYLXnqCZ8CN0oKdeVOlB8vPPNKp6z5aZGqqiAX7P1X8CNiqIBAik1DAcRQO6Rn/zJ83dnktdgtj9P3cQUP7ufnNDkgg7byONUJREJcTMrAbHcuWPicFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EbNE0fqG; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EbNE0fqG"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-40ea36b56b7so6272414fac.3
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 10:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778779379; x=1779384179; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fK6Hgo3Ntm+Mk5vI9D7ReSoIcT5DoQh4kA5KdiywL8c=;
        b=EbNE0fqGgztfEhlDW8IO7XoiGkpsuYndZ6xw/l+/6KOaeGXducdM7IGPNHTwgx9Uyc
         IOnE3akvzeLJ/calq8q0VCT9+GIrxnoigU88AI5AqSKI7DkJOIyRAC0dym5wt8gQkuLn
         vYvkpL8oPwe1alB7ptzJD6B+WPBFT3G0ThHplSa7rZAHgkmGdWx1HWlx5ct6s+a6Pb+f
         pWBeolusN/C7fbIYzE/OrN10SjNljgi6j9FcGmD/zGXOxpDi2n41GKGXD5jrLoaGy6A8
         IDc21bQ3Rlh6YVmQ5Q8ytHLLq3jU2NLB/rFJ645f9dpU9cEpvvVP5lbyj+fPvBiJ9DSb
         NHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778779379; x=1779384179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fK6Hgo3Ntm+Mk5vI9D7ReSoIcT5DoQh4kA5KdiywL8c=;
        b=kcJ4biYJX94Q1MZccV1OHrzU5TANC+9a/6NJ0BITkGPWvt9CSNoB3R7LTFVyUxyRF7
         MbyapnyPwh7U6SOOmUBdsbGknaRddjVC6WEaRRmmBdOnYMF0VXkAYYzvgHW+dYenz/Nd
         ySy+EVM1Cl0/rzvbbh7AmkKVXpt7AHsOVTsGC+R0ulDpSiScMO/CLpEv+ub+P/KYVOnx
         bNHloJS3UqKjoCYw4aB5mQnO6o9XO4e7OSR/29Lai0etmeriGPukYjjq/b5dW6pCx8oo
         Y2uYdQUlLnjMmLzhEB4/HD+RHnjTPFnwfv9ldrmGEAZmpMNdOQEXY4gaJZNEozY1ZnDP
         WpIg==
X-Forwarded-Encrypted: i=1; AFNElJ8VTpdy3ISV9Tp6NnGX7cFnC69A+e9UDEQ4IjFd15sxOTbNWbehsoTAaipZnfnubr5DTskwsBCu7vNn5LQzPrc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqTsNjjlPVKc9beSHvPzondaS/SCrH8w2aHoY8WTMvGhgwJ9ZS
	zIaoC4PY7eVAHQINl4BU25s/QrLN31hI52IGrtUGiCo8JLelNZyNEwoR
X-Gm-Gg: Acq92OEuQbm1eFU02zjqaVhLRWiiIhR8qttZcaehuOdmRGrRVSbB93iS9hH74TE2oro
	oXo0yJUzZKjE+e9EUL+0M7DDWdPg1DFqVB8zdb8KVo1L69Le2XENFqms1U2OFY0g8A160/sKJqo
	uk05FOpe+zxzbyIuZUa5zmM0XSCmtKm83qCoWkYwB3hCQmiJElW+SoGuc9jy8zRwNaLqiwUqUUY
	1Rz0WnIXnMRGdqNVmxPfqV+uQ8hkAQBDO3E8GwH3KPhcbKx7LiY58m7XuWtT7TGd80KdXrCAj+/
	kiWgOE8qcDEXC09NOOldS1o5LX+rCblNKLDMovJmgVunuaKModBrby3igsQAFwNwyQB8EcbdxD5
	RpwBOyiWNlvmkj5Dix8U1CFe1WWBq05T1I/HLKGzgr66VCMo4Cbr8lerKqZyTOE6JUOr4ST+YVE
	LoWHiLbSjVAdesh49gzVopwA==
X-Received: by 2002:a05:6820:81c7:b0:69b:8c73:e921 with SMTP id 006d021491bc7-69c942ef1femr249405eaf.20.1778779379501;
        Thu, 14 May 2026 10:22:59 -0700 (PDT)
Received: from localhost ([2a03:2880:f812:6b::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-439fc1e7bc7sm2229037fac.7.2026.05.14.10.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 10:22:59 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Thu, 14 May 2026 10:22:35 -0700
Subject: [PATCH net-next v5 8/8] selftests: drv-net: add netkit devmem
 tests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-tcp-dm-netkit-v5-8-408c59b91e66@meta.com>
References: <20260514-tcp-dm-netkit-v5-0-408c59b91e66@meta.com>
In-Reply-To: <20260514-tcp-dm-netkit-v5-0-408c59b91e66@meta.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
 Michael Chan <michael.chan@broadcom.com>, 
 Pavan Chebbi <pavan.chebbi@broadcom.com>, 
 Joshua Washington <joshwash@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
 Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Nikolay Aleksandrov <razor@blackwall.org>, Shuah Khan <shuah@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
 Michael Chan <michael.chan@broadcom.com>, 
 Pavan Chebbi <pavan.chebbi@broadcom.com>, 
 Joshua Washington <joshwash@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
 Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Nikolay Aleksandrov <razor@blackwall.org>, Shuah Khan <shuah@kernel.org>
Cc: dw@davidwei.uk, sdf.kernel@gmail.com, mohsin.bashr@gmail.com, 
 willemb@google.com, jiang.kun2@zte.com.cn, xu.xin16@zte.com.cn, 
 wang.yaxin@zte.com.cn, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Stanislav Fomichev <sdf@fomichev.me>, Mina Almasry <almasrymina@google.com>, 
 netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.13.0

From: Bobby Eshleman <bobbyeshleman@meta.com>

Add nk_devmem.py with four tests for TCP devmem through a netkit device.

These tests are just duplicates of the original devmem tests, with some
adjusted parameters such as telling ncdevmem to avoid device setup
(since it only has access to netkit, not a phys device).

Each test uses NetDrvContEnv with primary_rx_redirect=True to set up the
BPF redirect program on the primary netkit interface, then calls a
shared run_*() helper which probes for devmem support and configures
the NIC (HDS, RSS, queue lease) before driving the test. NIC state is
restored per-test via defer() callbacks registered inside the helper.

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
Changes in v5:
- Move require_devmem() inside test functions so ksft_run() reports it
  as a SKIP (Sashiko).
- Drop the inaccurate "mirroring the nk_qlease.py pattern" claim from
  v4 (Sashiko).

Changes in v4:
- Call configure_nic()/cleanup_nic() once around ksft_run() rather than
  relying on per-test configuration inside the run_* helpers.

Changes in v3:
- Reorder os.path expressions
- Drop @ksft_disruptive from check_nk_rx_hds to mirror the original
  check_rx_hds in devmem.py

Changes in v2:
- Add nk_devmem.py to TEST_PROGS in Makefile (Sashiko)
---
 tools/testing/selftests/drivers/net/hw/Makefile    |  1 +
 .../testing/selftests/drivers/net/hw/nk_devmem.py  | 46 ++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/hw/Makefile b/tools/testing/selftests/drivers/net/hw/Makefile
index 5e49d7bffced..c7a1206880ea 100644
--- a/tools/testing/selftests/drivers/net/hw/Makefile
+++ b/tools/testing/selftests/drivers/net/hw/Makefile
@@ -35,6 +35,7 @@ TEST_PROGS = \
 	irq.py \
 	loopback.sh \
 	nic_timestamp.py \
+	nk_devmem.py \
 	nk_netns.py \
 	nk_qlease.py \
 	ntuple.py \
diff --git a/tools/testing/selftests/drivers/net/hw/nk_devmem.py b/tools/testing/selftests/drivers/net/hw/nk_devmem.py
new file mode 100755
index 000000000000..300ed2a70ab4
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/hw/nk_devmem.py
@@ -0,0 +1,46 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""Test devmem TCP with netkit."""
+
+import os
+from devmem_lib import setup_test, run_rx, run_tx, run_tx_chunks, run_rx_hds
+from lib.py import ksft_run, ksft_exit, ksft_disruptive
+from lib.py import NetDrvContEnv
+
+
+@ksft_disruptive
+def check_nk_rx(cfg) -> None:
+    """Run the devmem RX test through netkit."""
+    run_rx(cfg)
+
+
+@ksft_disruptive
+def check_nk_tx(cfg) -> None:
+    """Run the devmem TX test through netkit."""
+    run_tx(cfg)
+
+
+@ksft_disruptive
+def check_nk_tx_chunks(cfg) -> None:
+    """Run the devmem TX chunking test through netkit."""
+    run_tx_chunks(cfg)
+
+
+def check_nk_rx_hds(cfg) -> None:
+    """Run the HDS test through netkit."""
+    run_rx_hds(cfg)
+
+
+def main() -> None:
+    """Run the netkit devmem test cases."""
+    with NetDrvContEnv(__file__, rxqueues=2, primary_rx_redirect=True) as cfg:
+        setup_test(cfg,
+                   os.path.join(os.path.dirname(os.path.abspath(__file__)),
+                                "ncdevmem"))
+        ksft_run([check_nk_rx, check_nk_tx, check_nk_tx_chunks,
+                  check_nk_rx_hds], args=(cfg,))
+    ksft_exit()
+
+
+if __name__ == "__main__":
+    main()

-- 
2.53.0-Meta

