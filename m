Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1064B2BDC28
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 01:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778548710; cv=none; b=k4BTmJqZn0f4FaveeoS1oyrXX2S4jKjMIyEE/Nsrb274aVYU26hiT2JwSwtSAku9zdIB/TZ6lGTCMgF3ZsYj3OW4pf4gNYSxRE2pNK6FNuiIG9qjiVnY01Ai9NYn84OSSF1nLK4xDMbTRW7Ib5UZNFM1nu+yXBOF5ak+kurtIvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778548710; c=relaxed/simple;
	bh=w3CtU+hYwk0vuDDvZWpVkcnsbUsLWI9bRzUE1HZQ2bs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=POphn0hNzagDCjNOj5GaPm8URNDVBkoyrVlMboxyEiWOlTo5XQtyzl08pHfqIKz4BCpKe4lMJNVDVpYbsxzvk9X5Hv5tfjOB13yLLzbauPBHRSu/V0GAatAiSIX6GM4AeuY0geMl4oILi+U5Vb6hkwmAcI+JpF6+ZF6/HMnDC3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tGD1xBAm; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tGD1xBAm"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50d876329bbso47261141cf.2
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 18:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778548705; x=1779153505; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4O7WaEUgH7uVF1t7R5QzWbPYxx8khqSIJzO/Wkups0=;
        b=tGD1xBAmuKbAf60hHbmrhLIh/GOC3eDjfW/1xR61lPL6YWmQkkF/rfbm/xJoxHjuZ+
         Qag2O9wajlRkgDpLU+V0ABhLAn4ILDcFiOp3tIy7mtnzBK0rqeF2qXptBJhbaNqR1jWI
         cMf648R7YQgT2p8Xg0+PakWlV6Czvj+ArGkxJVlNEY7mphYoQIGTP6C8LZykq0wRaxI/
         Y8Vzx+p8im7VdbfdHt6h7jb6TeGW7rJqOEtqWUw6Ia8+tJO/4omkHerzrzXsI2wzcoy1
         iBIPYRezCFtASQz5aN6YKXQjrFmzSc7HoUG2NfEzeHWBfKE4eESo2cMWmxhIR/LdjtwJ
         QM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778548705; x=1779153505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T4O7WaEUgH7uVF1t7R5QzWbPYxx8khqSIJzO/Wkups0=;
        b=JD2cosg+ibexIh77AYBvnVFAQaK11RhPDFjKWevlw5Qk0A3GjQCFIFLHJcAPQ0uQJE
         oQX6/om1XZkF7WqN4N7uPTVr7TYJxbLZUlrGREq5fmxkl+lYNi//fLvBCTSfNn+LNmsK
         dTT0DyhOpu1IyFakVzen4IGf10ne0tpsY2Y0EQuN4GYwdDEnO+olnz0YXe79aUYfLCrO
         HQj9SPbIz5095VjqN1hF6WGoi9P5NGcN7ncrM+VMyS6LJmGtBTMJWpEn5oBFhtIuwfch
         1cqfgyiFZLB6ZjRUfgzxipnPurghlZTf/3A6jioa8elpuKltvGg3nxHL6AeGFXtGVw61
         K/4Q==
X-Forwarded-Encrypted: i=1; AFNElJ8gj87gqZQZIuJ9ErwrSw2vbuFmoqF5LZSC5rDWPQBb1GwAS6EUwiOwr5nY9FK8TFev8tI0C4wm7+TzDW1XXB8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY8Z401RsQh8l72r0v2Ib+9uotjiQLXfyA4UHwkysH/ezAfEK1
	7vI2dc1NMIfEGaGJIGWcv90mOGIaWlylz6mewhTCLvgK+eIc5YNL1sbx
X-Gm-Gg: Acq92OEiNW5LfhrEM9CR6COxin3Jw60InEIJomQfZ/9C4efOfUqE9EMO4d5/2cDlQfy
	mCnKzFpjlqihtj4BFz2irIr+zcm9K5SV4k2d4Lnet8zbSQcoCUZDnxDZd1TLUEGhd0Ux34/TxpI
	zAH/TwwfWK843os6QjRjSp6anbNdz4CyGxqG4upFuYP9bJ67iRY7+nyyOge4S3MgSh6rXA1NHzn
	wVRxfUAKp0ZV8cGYutikqsVJh6qKq2iPUVIhWB7kcseTBupJtcz7iGE4yKp/HCQFdhPZ+5Cnalr
	/018zpB6njIH89+lRDSOWVG0Z67UXTk6nZJbCkLDk/Way91BmIzZ4d2Ea73TjSTfpQqnDobgXjY
	6PboddqO2p1IxxMDOS0STY9XdJ1svbWi++wvLSy7GYm+6rGJ5Kbxs5JWqSHWOH2tezs7jNe70NQ
	p0LnqoJIHbnC7wFllamWo=
X-Received: by 2002:a05:622a:92:b0:50d:770f:ad23 with SMTP id d75a77b69052e-514d1c943c9mr15635691cf.26.1778548704810;
        Mon, 11 May 2026 18:18:24 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:72::])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-514a956cad9sm71871261cf.9.2026.05.11.18.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 18:18:24 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Mon, 11 May 2026 18:18:02 -0700
Subject: [PATCH net-next v4 8/8] selftests: drv-net: add netkit devmem
 tests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-tcp-dm-netkit-v4-8-841b78b99d74@meta.com>
References: <20260511-tcp-dm-netkit-v4-0-841b78b99d74@meta.com>
In-Reply-To: <20260511-tcp-dm-netkit-v4-0-841b78b99d74@meta.com>
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
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

Add nk_devmem.py with four tests for TCP devmem through a netkit device:

These tests are just duplicates of the original devmem tests, with some
adjusted parameters such as telling ncdevmem to avoid device setup
(since it only has access to netkit, not a phys device).

Each test uses NetDrvContEnv with primary_rx_redirect=True to set up the
BPF redirect program on the primary netkit interface.

The NIC (HDS, RSS, queue lease) is configured once in main() before
ksft_run() and torn down in a finally block via cleanup_nic(), mirroring
the nk_qlease.py pattern. This avoids re-toggling NIC settings around
every test case.

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
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
 .../testing/selftests/drivers/net/hw/nk_devmem.py  | 55 ++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/hw/Makefile b/tools/testing/selftests/drivers/net/hw/Makefile
index 85ca4d1ecf9e..2f78c6aec397 100644
--- a/tools/testing/selftests/drivers/net/hw/Makefile
+++ b/tools/testing/selftests/drivers/net/hw/Makefile
@@ -34,6 +34,7 @@ TEST_PROGS = \
 	irq.py \
 	loopback.sh \
 	nic_timestamp.py \
+	nk_devmem.py \
 	nk_netns.py \
 	nk_qlease.py \
 	ntuple.py \
diff --git a/tools/testing/selftests/drivers/net/hw/nk_devmem.py b/tools/testing/selftests/drivers/net/hw/nk_devmem.py
new file mode 100755
index 000000000000..0e36a0fa9688
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/hw/nk_devmem.py
@@ -0,0 +1,55 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""Test devmem TCP with netkit."""
+
+import os
+from lib.py import ksft_run, ksft_exit, ksft_disruptive
+from lib.py import NetDrvContEnv
+from lib.py.devmem import (setup_test, require_devmem, configure_nic,
+                           cleanup_nic, run_rx, run_tx, run_tx_chunks,
+                           run_rx_hds)
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
+    """Configure the NIC once, then run the netkit devmem test cases."""
+    with NetDrvContEnv(__file__, rxqueues=2, primary_rx_redirect=True) as cfg:
+        setup_test(cfg,
+                   os.path.join(os.path.dirname(os.path.abspath(__file__)),
+                                "ncdevmem"))
+
+        require_devmem(cfg)
+        configure_nic(cfg)
+        try:
+            ksft_run([check_nk_rx, check_nk_tx, check_nk_tx_chunks,
+                      check_nk_rx_hds], args=(cfg,))
+        finally:
+            cleanup_nic(cfg)
+
+    ksft_exit()
+
+
+if __name__ == "__main__":
+    main()

-- 
2.53.0-Meta

