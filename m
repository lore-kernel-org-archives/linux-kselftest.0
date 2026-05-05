Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5169540DFDA
	for <linux-kselftest@vger.kernel.org>; Tue,  5 May 2026 00:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777940892; cv=none; b=BOmsH6zT3fTa/b+Eg9gtu4eqP+fW0iLv/vdVieJFryBow5X+uqdr7w7kS2TLX3fbmHXwkYA4AilcqA5bSLBqkRoJKIXFjmF02NnVqGfF7IeypuOeOLrw7/Wqsl8RrWSbCDDaBseUdRwIm0HlJuUeE2wnqFFdY+kwPe8EvAjQaOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777940892; c=relaxed/simple;
	bh=rz0GaQVWFC5Ldv7XCxhQcnrPcxM3OWUNdbw0/XWxahY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PTwmfPf9eiHhUb/0ADEWhMOrdIaUNctc19H2uuZYSmLsRDjJjuJ9ToXvpN3Ir8jO3nmKjMX6W+VrnM7je7TZ7IBrb3l8gh9xrF2Xt3ogjGZ2r/DqiakW5TelHiD0aYyHi5ncUmVHdFvXRO2QWQ0XxTjFPrb++ybo9StQK/g7cVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MDa2Dl2c; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MDa2Dl2c"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-65c2cd216c9so3505081d50.3
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 17:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777940889; x=1778545689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TSp2GUXkgxtGrFcBtn8vEntUxKtdvA3MvOWwc4dLMzU=;
        b=MDa2Dl2ca6GUYsU2a7xMr0ZWI0GwSUsx99y85UMGJrdr/6fezJxNDssw/37zR49cHV
         ORLgcwD0xL+9lxuvRmGoGXCAnAer/y8Tu2Fjf51Scpgp5RIBuhTn+Ou/Q8F0pwShjJ6z
         UnaHXDe9T2eSnyfO1KIHX26/+3VfeZfA8i7MCiJY+lPRrUhsagBE3cNCKSlhJ7jzlIS1
         guFPRzm+p18+GD5+ZkB+OzXCk/yy6IkBlDM4tieLvfG0HatfEolLYlQlo6P0DvgtRZvq
         cnux6lda/RdvmEtsoiBbYh3V++0EEVcc3WHwRFAJlKZRah5IbSNVmXPbAhIqGJyF7OAV
         eMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777940889; x=1778545689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TSp2GUXkgxtGrFcBtn8vEntUxKtdvA3MvOWwc4dLMzU=;
        b=B1kfUX24gMrmJRBCM8i+Y4EHjHFxgCHXi8JaK+KqvaLfgI07WL8KmQ2YMuPcIWEUP/
         Elp+ZhvEicIJKe3XaG+g+CsHqI7WFN7W02S14tZoeNJFp5Ni8ayE5AaxLAIVK6eHo0VB
         UbV5WyhQqRswKmkVB1snp52sirkIeWudbxrm5FOdp62JwfXLPcNTBg1foKoyDUgBmpwy
         VTXLa3pTPXJCLp/Zj3AtLIW8y/E/B4cGRgIOHp7eqfVdjlSSa4JDtyan6swTXgUaVitg
         LcDiW9MZiYhL6XA/3hH59zjkOkmywcvrc3klWV6XuuRLzApqwHJYFEQO1kqxzLaxYGZ5
         3B9A==
X-Forwarded-Encrypted: i=1; AFNElJ9Og0p0ivd6T2TZrq6/TkrezB/s6hiz3AIRtwPrljVEMpAb8iAKlMqScszL87iNt0mwbw1cYeS4FTOF/kcGSZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrSdVaG4D1b4CVB/KRWmYcSHY6gUGs74QpQzoXaHj56YYozDRz
	Zq3HMxuBpT778cPV1rwtsZsP6BW3/hH7wVY+itIqnDyh6XGl0v8/xd09
X-Gm-Gg: AeBDieuc00Bjoeo7ujTEwM2NzWhBpmXVs3+kbjZQEkkYOWlfTk4UGd8Dif/CQS1XUKb
	uQHWWFo+gpGPGjUWDRwswSU1QVrR9p49eUb8SZ7clrygVAG42yg8hjpo32MadGm2Ke+yQuw/y5u
	2dFjXRJyXHUBiy0fuYRYjAaM33pxb7htdCLESkpg3Qr568iajHIMD1moxVb3K5A5x5RcYtJDpMo
	ltSTKqI44ED5+6YcYeCnWgbscjAq8NiQxp58Ckt9+SpWFlZ7pv3AIPoNHpflXdaMX2iY4aw0ExF
	LXOvcRx0P2kF21liNwadq7VPI1qx5stAqkOD2cSm8TA09NB671tWidCf5LkRHHp2j68j5wgAh9o
	MRpMC4mQ3tU60xeZ0ZY6valr4dKxwtSnGw7a5fE68VnBFtHDoCq3FRJuRhZ/0wDRUi1MLhjjDBd
	4r6E1GMzH99znLFTGOq5l1qmHrOltWppzzMEfCFdtE
X-Received: by 2002:a05:690e:1c08:b0:64e:e896:a86 with SMTP id 956f58d0204a3-65c3db39b1dmr12329280d50.36.1777940888641;
        Mon, 04 May 2026 17:28:08 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:73::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65c2e8ae9c7sm6268726d50.19.2026.05.04.17.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 17:28:08 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Mon, 04 May 2026 17:27:53 -0700
Subject: [PATCH net-next v2 6/6] selftests: drv-net: add netkit devmem
 tests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-tcp-dm-netkit-v2-6-56d52ac72fd4@meta.com>
References: <20260504-tcp-dm-netkit-v2-0-56d52ac72fd4@meta.com>
In-Reply-To: <20260504-tcp-dm-netkit-v2-0-56d52ac72fd4@meta.com>
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
 Nikolay Aleksandrov <razor@blackwall.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Stanislav Fomichev <sdf@fomichev.me>, Mina Almasry <almasrymina@google.com>, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

Add nk_devmem.py with four tests for TCP devmem through a netkit device:

These tests are just duplicates of the original devmem tests, with some
adjusted parameters such as telling ncdevmem to avoid device setup
(since it only has access to netkit, not a phys device).

Each test uses NetDrvContEnv with primary_rx_redirect=True to set up the
BPF redirect program on the primary netkit interface.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
Changes in v2:
- Add nk_devmem.py to TEST_PROGS in Makefile (Sashiko)
---
 tools/testing/selftests/drivers/net/hw/Makefile    |  1 +
 .../testing/selftests/drivers/net/hw/nk_devmem.py  | 40 ++++++++++++++++++++++
 2 files changed, 41 insertions(+)

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
index 000000000000..c069d525798b
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/hw/nk_devmem.py
@@ -0,0 +1,40 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""Test devmem TCP with netkit."""
+
+from os import path
+from lib.py import ksft_run, ksft_exit, ksft_disruptive
+from lib.py import NetDrvContEnv
+from lib.py.devmem import setup_test, run_rx, run_tx, run_tx_chunks, run_rx_hds
+
+
+@ksft_disruptive
+def check_nk_rx(cfg) -> None:
+    run_rx(cfg)
+
+
+@ksft_disruptive
+def check_nk_tx(cfg) -> None:
+    run_tx(cfg)
+
+
+@ksft_disruptive
+def check_nk_tx_chunks(cfg) -> None:
+    run_tx_chunks(cfg)
+
+
+@ksft_disruptive
+def check_nk_rx_hds(cfg) -> None:
+    run_rx_hds(cfg)
+
+
+def main() -> None:
+    with NetDrvContEnv(__file__, rxqueues=2, primary_rx_redirect=True) as cfg:
+        setup_test(cfg, path.abspath(path.dirname(__file__) + "/ncdevmem"))
+        ksft_run([check_nk_rx, check_nk_tx, check_nk_tx_chunks, check_nk_rx_hds],
+                 args=(cfg,))
+    ksft_exit()
+
+
+if __name__ == "__main__":
+    main()

-- 
2.52.0

