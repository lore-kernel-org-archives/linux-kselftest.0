Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5172D3750AE
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 22:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773700172; cv=none; b=BdQ2+T6ePNCVv/w1EFN1gf6QQoTCg5c1t156Fq6+kKE6bqcRFEzyiunJuqUjchCf1CFLVsk8PcDpYhK24VrOgGO3LY2DkYarn2CzTjnM+84W3UVAc6WQoHHz8P2Sdl2GLgerCpRyXm6oSASl1t5kLUHevSaTCf45u6gJTtRygG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773700172; c=relaxed/simple;
	bh=QLmJCoIEgk7bY1Etv2KHuHMRxJlYbMdrmYRAb1O/174=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pFr7sarDE0kHDpBSBx4OXp91vvhYpbl1PbGsh/L8bCW3OBs09+LtD0HQreSSR3GMUHce9aJU6Qjy96HULondQMtwvegrMCHV9qIMhB81Axk6ici1UnbfDbhmQgdWruTLy6qtewS+tJJlKQf/q7yTv1jzQh3luf6OYbFPA4aEJYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YU+4+DAK; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YU+4+DAK"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-78fc4425b6bso49272077b3.1
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 15:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773700166; x=1774304966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zGghREiBSn7MQCKj4TXr4KN+77lBvMCqoaCeBo9lJNY=;
        b=YU+4+DAKS0Xi1+S5LfgawBzAiOjfnQ1zadUoqKwnE3T0oo5zVn6j0chqDn4W514zX6
         IC7f0HDP/i5HIxgtJH44lVAe1THefFbTdXDB94DGKX2+FGi5NAjMUvYrDaMRocJfQ7Ua
         rcdkGczSUqXVgFN63quPo5fSowPBOzLFf4zUQWPv5eRYskXogfjkO+3ID5n+0ZciyBdU
         NWPflAKJ/hxEZjDKEn0p6zchzprqfIUm5EgK2kTqUmPG/ItIU5PGXMYYLa9JefgNsIQ4
         sbyMQdxlg8A5HK0E5Ku5Edg/z9DDrvH/95Yea0efpZ09SXHRBcAsw0uzfr1MvO1N4+4b
         uxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773700166; x=1774304966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zGghREiBSn7MQCKj4TXr4KN+77lBvMCqoaCeBo9lJNY=;
        b=GPA3/vMzbFYNSl8W/yKpiTX/+lnaxzrtevKGf8x5JIXxi6Lxsbz1TV0y6JY47qPv+S
         vJL28tZ3DTgQeqaub3ifuZv3ke1yKp+KftkRC7uMrXcn3JMnI1wibfwMSr+k+vG+cADN
         ympsU8M8HW1iobFig6KHwClaXBfhP30W/VXzpRmM9FiETbLsqLsJYqDDH7s90toIpPJL
         NccDwbyxxN4K1ZmG7PA+Kdy1n5r9ZY6cVwyb3Xh3nDYRPTKzhJx+YaGgFeD0RXCys/h0
         9DYtnAVjWWEkeyw/g0WrE61ypoEcId4CuvLq+w+tw2EHl8eygC+W4YtEu5lSAAwNwNrE
         VYkw==
X-Forwarded-Encrypted: i=1; AJvYcCUbzToxJGidTuj9PrWP0b+Mw9zJZbD0nP99anV/XlVL9o6tkbQChsxclewFTCzTll04RkgG8i6IkEcCVriJWVU=@vger.kernel.org
X-Gm-Message-State: AOJu0YztzNPSXiX8AvT9/dtRKt7kErSGAOz7KeNX7oSGmiapOj8ileM7
	Pz0GN1BpAjVWMBFqSVgzCVWLJG6dFggEKF6ZiEgQTT96LrBJ0Ppg9Cup
X-Gm-Gg: ATEYQzw3AiTQbbQwFBw4j0UjZODKvZ6mFlWPlgoWbt06BBodWdHz8FTnojLZlEVq9mb
	x53/eWxzPFshsVjySXSrAujcJQHu7wM8nwn7SdGA6aqioj93FTmf10Zh7KoeNfAvsAU5wArcFTa
	4UyHzzZw7tyWUZsWIaIN92ljpsxWnHlCcgZfvkq8KrN70YJwKeftDDuQncds2iv7mzJXO93i4TH
	YqVGV4ND6A0Z4tX/hVGi/nffYPWfwdvVm1lQ7PonWad4WRKaUPWKKllmLiwu0Y7dRcO48j+S/hb
	ZfXpziPHaRr+4Aw6FMj0om/oXlp59oOSAr8eGhXNT7ip2LxnhMmykTJzsRq8txY1CCIsvWAu9t1
	VWbkqN9/LZy92NacsqqjjPqZ3nBonfjPteEKvrdwA3328zM9FuCDK4WCGgl4bGOCORCLTlCT5nq
	F62ma+lg05+X4gAVhoza9rhw==
X-Received: by 2002:a05:690c:f08:b0:796:6da9:bf97 with SMTP id 00721157ae682-79a1c1c002emr149829567b3.43.1773700165699;
        Mon, 16 Mar 2026 15:29:25 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:5b::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917ee5757sm96813787b3.31.2026.03.16.15.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 15:29:25 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Mon, 16 Mar 2026 15:29:17 -0700
Subject: [PATCH net-next 6/6] selftests: drv-net: add netkit devmem TX test
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-scratch-bobbyeshleman-tcp-dm-netkit5-v1-6-b53c8cd72b23@meta.com>
References: <20260316-scratch-bobbyeshleman-tcp-dm-netkit5-v1-0-b53c8cd72b23@meta.com>
In-Reply-To: <20260316-scratch-bobbyeshleman-tcp-dm-netkit5-v1-0-b53c8cd72b23@meta.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: Stanislav Fomichev <sdf@fomichev.me>, 
 Mina Almasry <almasrymina@google.com>, Wei Wang <weibunny@fb.com>, 
 David Wei <dw@davidwei.uk>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 bpf@vger.kernel.org, Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

Extend the netkit devmem selftest with a TX test case. The TX path uses
the primary RX redirect BPF program to redirect traffic from the primary
netkit ingress to the physical NIC via bpf_redirect_neigh().

The actual TX path looks like the following:

 TX Path
 -------

 Netkit Guest (netns)     Netkit Host          Physical NIC          Remote
      |                       |                     |                    |
      |--- TCP send --------->|                     |                    |
                              |--- BPF redirect --->|                    |
                                                    |---- transmit ----->|
						   dmabuf

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 .../testing/selftests/drivers/net/hw/nk_devmem.py  | 23 ++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/nk_devmem.py b/tools/testing/selftests/drivers/net/hw/nk_devmem.py
index 0a66ff85db9d..0e3c5aab6423 100755
--- a/tools/testing/selftests/drivers/net/hw/nk_devmem.py
+++ b/tools/testing/selftests/drivers/net/hw/nk_devmem.py
@@ -89,14 +89,33 @@ def test_devmem(cfg) -> None:
     ksft_eq(ncdevmem_rx.ret, 0)
 
 
+def test_devmem_tx(cfg) -> None:
+    """Test devmem TX: send from netkit guest, receive on remote."""
+    configure_nic(cfg)
+
+    socat = f"socat -U - TCP6-LISTEN:{cfg.port},reuseaddr"
+    tx_cmd = (f"ip netns exec {cfg.netns.name} bash -c"
+              f" 'echo test_devmem_tx | {cfg.bin_local}"
+              f" -f {cfg._nk_guest_ifname} -s {cfg.remote_addr_v['6']}"
+              f" -p {cfg.port} -t 0 -q 1 -n'")
+
+    with bkg(socat, host=cfg.remote, exit_wait=True) as receiver:
+        wait_port_listen(cfg.port, proto="tcp", host=cfg.remote)
+        cmd(tx_cmd, shell=True)
+
+    ksft_eq(receiver.ret, 0)
+    ksft_eq(receiver.stdout.strip(), "test_devmem_tx")
+
+
 def main() -> None:
     """Run netkit devmem tests."""
-    with NetDrvContEnv(__file__, rxqueues=2) as cfg:
+    with NetDrvContEnv(__file__, rxqueues=2,
+                       primary_rx_redirect=True) as cfg:
         cfg.bin_local = path.abspath(
             path.dirname(__file__) + "/ncdevmem"
         )
         cfg.port = rand_port()
-        ksft_run([test_devmem], args=(cfg,))
+        ksft_run([test_devmem, test_devmem_tx], args=(cfg,))
     ksft_exit()
 
 

-- 
2.52.0

