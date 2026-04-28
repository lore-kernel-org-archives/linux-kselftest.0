Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEE13A3E60
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 22:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777416149; cv=none; b=tDr1OE74kimVSQWnfuaWIu+EnzdArKOAVArhiaRe6wWZCOJ2njStso6sulng3LEv4NlIxtBlemG6G7zdhJPqXAhHJ9ufBq/y4Rrfa6CbHA2c28+cT3HnZO70alSftJGUuWEDjCWwhSt6JRjFDjpWQwnHTfjvu+scvoYbQFtROxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777416149; c=relaxed/simple;
	bh=9CfxHHUrdkC2HOcb/TS/DNlnMmhpx5XoMYQJ/X3bIM4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SGJ4+IZiw9kEyhWpk1ZfaVNfp3/NBumoRD3xFY48jhWUmG6NYAbTOFwXh01fzKC1/NHTlZdu7shouOOvkse32IMjYcplrs+lxD54C+FfzEPmUGFAPWQ1oG55OGxhSWCPib5411dirZuRANjT33+WPkx66os6qDgACStLT7FgAKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mkCBgfK8; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mkCBgfK8"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82f33d28c1dso6583672b3a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 15:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777416147; x=1778020947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zt/Ht0RhxHPOrumBmtiIhgjoCgVfyyPmVo07gYfbsYg=;
        b=mkCBgfK8IZCr029gch80jB56L0daRQ0xrq+mlojAk5EoADEJaBGZsLeSiqbKv9WNoh
         NqmoegMAZekTc4FYJzsrNMxDQSB9BgDL833cykHXh1GmO+4XAXSbWjHp3lXfen50X2MN
         M+fVOpsfIqIK2lsppRsl0085WaUYd8rqQQfpak+6nPnOQGQ4iZ838I7/aLGmrmzQ7s6B
         cN/WDOS270ZL2FP/E061dEy/QgmTJilrnHhb0VlZpkO2nsCo0g/1m5DIhfD78un31WD5
         GtbouO1ZfLTdddCmyRF9dCsCW+cpIIzRjHTxX1oMg7Z1phoBmVrO98tcDBXVUOcDtTMu
         NxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777416147; x=1778020947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zt/Ht0RhxHPOrumBmtiIhgjoCgVfyyPmVo07gYfbsYg=;
        b=NySAd+RSwtUlueXlvFKpMASpk+lqwUFglGXcxw6Jv/Ai52ILaxPO2CHHsc6rJZpbwG
         L799FovhNR4HRlITpmmt4tIJnr3wCOSZezudgAcybadel6F9u+i5z1oBR9WNcU+FkMiV
         AOlYZVwuH9b6m/uT4wFezOq0v/TowNf++LWxVRqthYk7WAopicicaShUZ9WsutuwB8B6
         irSkv8pfAccaWR1iM2FJWVR7Eg9hfLtj7t4gSapIzWpqS75yU0NgBh3JKNc2VY//GSuz
         mywmhf32lOMfFsDnUczWJzP2U0uXkiHzNIU3J1QnUUTBWvQqa5xmtIinpLFQ60QXl6s0
         q/RA==
X-Forwarded-Encrypted: i=1; AFNElJ/KNRtVB4XosHMIRHjwaRATNqg1EWgr+QXUUoaqd2EftaQqlHKiRxHEVWVpB2POdnB7GnaowdFRnY140t2n43o=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj8uREkcQS8vPBcmSkAYtcQvL35DxoUvDibqnVk2eEcoKxepU2
	y0jHBHqNZ5eG2cMUN42xfLStdPmGARDNy3dSAndPHZ6CK3MUBcmhOMiA
X-Gm-Gg: AeBDiestu+MF/6gnuCUcCvp3F4C8sZ52Mvm2CVp/ZtrDDDvvRdWhKGuOEhZxMlSPkxT
	QAl9XQIms8i0S7tsj9Fdti7NJI5DZ6wUtIzgeLbpSjE1hqaOuoFlqb/Vp/40I9azNAvgzO7N/Ed
	8+CyMMwlQeUNV256ZhbkaZhhDxQU21MzSGyQcnZ6honwtH/SGmHX0YCKDdqSaNBS9B8fHrXU1rG
	Tl3pJnYBu+3RrihYow8MSb+mqmpECfLkezLvb8VSDMhVGgX/yuHOKeggZqaw8hUcQcb2p1CJGsv
	IyDD+0MAyAn7eThMJlWl8cXfhs+yc4TlW6woowWYUaSJB/fHLJo9YWU78EkuSXuAURpt7FA7A7D
	hPn4tS7soXpXTq9XBvbefJG8WixfH1jbkri2NCQNQ6j7WPo3gBk2r4qD9SlSOHIbKdCoSbbzGnL
	p1qyJ5Bp/+7K69cF+E+mC1fIwJPpzGsQ==
X-Received: by 2002:aa7:88c1:0:b0:82f:1973:4b96 with SMTP id d2e1a72fcca58-834ddc14602mr5517283b3a.26.1777416146426;
        Tue, 28 Apr 2026 15:42:26 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:70::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed80f906sm96681b3a.60.2026.04.28.15.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 15:42:26 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Tue, 28 Apr 2026 15:42:08 -0700
Subject: [PATCH net-next 11/11] selftests: drv-net: add netkit devmem tests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-tcp-dm-netkit-v1-11-719280eba4d2@meta.com>
References: <20260428-tcp-dm-netkit-v1-0-719280eba4d2@meta.com>
In-Reply-To: <20260428-tcp-dm-netkit-v1-0-719280eba4d2@meta.com>
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

Assisted-by: Claude Code:claude-sonnet-4-6
Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 .../testing/selftests/drivers/net/hw/nk_devmem.py  | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

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

