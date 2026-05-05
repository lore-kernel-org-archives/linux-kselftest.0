Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AEF282F2C
	for <linux-kselftest@vger.kernel.org>; Tue,  5 May 2026 00:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777940879; cv=none; b=Z0+zWNLipjpWi3rfoBYkIbWeJfK+//3JryLXyIGtkcoeGk5gj+cwA8rBp+9M2Z7j9LQzIqd+Dts/wqcKQkzLl22TZLidtZpY8le/kZHSjhQ5+12MXB8cyMeB/Qxo0YRhrylMbCK7cOnd1OASSgn4lrq+l9aqVEATS3dPCMvFsJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777940879; c=relaxed/simple;
	bh=pNsIQOAsnUZLadZjxtsEIhlUHKk8eNroI5hNQSVKV1M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LPGH7UH5nyLma6pgSpdW9qvfp3e2lX+xjf2KmqlV4SP3eSsY9bNjl6N7n3sdDa2fjYHMG8qkkOltbYswdnX1i9wAt2pK0fs4dOjgKmBAnV1+z5GeeNZ4hoQkGsampz0gLcLwieLkMSykqDcG1RXDah/l1A8XB+umLYvEHneStc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZF5ujoyL; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZF5ujoyL"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8ee7ffd738dso577634185a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 17:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777940876; x=1778545676; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9ejfZ0eQkRqkBmGphamNmL7mRqqqgKWnD1nR5omUniw=;
        b=ZF5ujoyLwDRVqaSPvXnqPALE5hZrMeyHESmI+Vxy1FPFN4WJk9mjuNHebCOcZI40lh
         dbCKSydTpEAIGRRlW4x2uuXosITL+jttsgr8Xn7RpRnOPzyht050u0S2fS4RIhc3lekd
         TvXYTnuM+ISUnYpBz+wpUX+tvZqOMJKj4oY7cuC9FzxzqadJvfAuJZftWOMQ/9+aieOC
         FvwohwZ2vXaTHgitQqbzDqqU6X2LDOjhJLCD/ITYeMWxItyuYKdE97xvB5ptOK3bFmdu
         SIf1X6nBzH8VkPkQ1yBW2eMat5w8v7dJvWLq7MZi2eww3u4dgthiA4hDbLvGrEgxjhSp
         TmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777940876; x=1778545676;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ejfZ0eQkRqkBmGphamNmL7mRqqqgKWnD1nR5omUniw=;
        b=V2qui9td5EGYLhzrRgreNDGPlOJ2EMbTAr867UFLseJO6ufSI2iqnZ2nV1fqtGuMR4
         QGL4oBp+QLMtOCNDnv9z8ONpglN3quxU7neev7kAOHcbvB59Vf4EzDr1nqCCTyjWyDqM
         x9trL+F37ywuN4STckUxeKQKbEHr2er/TcXqWPvD1TxrY3l62zUOemqartj9DiyBq8tL
         vGbnyNesxC96fQeBcB+Cu3zt/jIXkN3p4ZnLtmaHOtQ1mqQPUIuUce51lh3vBJsH5YH1
         GxgtM/YnEsUvAtg8VEVQYN0vKw1YfKAI0ybjimhYQgJdb/P2KtfDkF3UMJAq/mq+mb06
         PDgQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Z1yJjjo7kocqA/btdLZTauHTc3bwhLlaLp9wIgZczc3mGm0w0Fj+o1aC8z6CvSCpN8zuuk5EcL86awv9OUXs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2wfQ7RPgW4glkNWwibPfCkXrsiKdjCHCfxuW3bc/7WU6siYVF
	ejwhbHTitjMMOUzFUyQUoMmG44alqxQEG/o9rRtr9atpUY8OkMKG/0lg
X-Gm-Gg: AeBDieuBGflt/t5AqpH9Wgb341XeSo9v5Co1KEOErKXDu1LbBMygQiBkTUwFPxnDwFl
	sk/ZeC+mc47ud0frIcf50iP2ORFHJSq1EfulwJfaheu/tS5o1uAGthXeVGduNaSgUbxAe7bvO5F
	gIdr4vrog2RRkm7Yg3o4rn4622aa+xMm13LzL81D/uuNzq50M5VNDrYXk8dE4jCS7wwmK7Prtgq
	no0tdCcYOKbidCatZrVUL89pcDyZIilLJxpxumpGZj9MLH9MHcTAfQY0dzfIgURuw2lCASHuyvV
	5yI1lUtbKpEOY/UJ+AuqoJlnHzxr9MNzeWwTB0uf1T2u+CL/EUHQPQwKVUe6sTbLHj/cuFyTsla
	dzwkGijqyvuXZZR940roQ2PwZ6026IguTFv74xC6DXh/PggI/hV7g8kInQBiINxmD6K2eSrybGB
	vBG5UK4mo8lKvRNNNkOHlV8FfXe3ANApExtxhvZNnVlp4=
X-Received: by 2002:a05:622a:24f:b0:50e:61ea:d8e0 with SMTP id d75a77b69052e-51305333e7amr22940221cf.21.1777940876408;
        Mon, 04 May 2026 17:27:56 -0700 (PDT)
Received: from localhost ([2a03:2880:f800:2f::])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51040b5d1f8sm108925301cf.22.2026.05.04.17.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 17:27:55 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: [PATCH net-next v2 0/6] net: devmem: support devmem with netkit
 devices
Date: Mon, 04 May 2026 17:27:47 -0700
Message-Id: <20260504-tcp-dm-netkit-v2-0-56d52ac72fd4@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIQ5+WkC/x3MUQrCMAwG4KuE/3mBksocvYr44NaoQYyjDTIYu
 7vgd4BvR9dm2lFoR9Ovdfs4CslAWJ43fyhbRSFIkjGdJHMsK9c3u8bLgmWu52ke81RzwkBYm95
 t+38XuAa7boHrcfwAYs/y7mkAAAA=
X-Change-ID: 20260423-tcp-dm-netkit-2bd78b638d30
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

This series enables TCP devmem TX through netkit devices.

Netkit now supports queue leasing. A physical NIC's RX queue can be
leased to a netkit guest interface inside a container namespace. This
gives the container a devmem-capable data path on the RX side (bind-rx,
etc...). On the TX side, the container process binds to its netkit guest
interface and sends traffic that netkit redirects (via BPF or ip
forwarding) to the physical NIC for DMA.

Two things in the existing devmem TX path prevent this from working:

1. validate_xmit_unreadable_skb() requires dev->netmem_tx before it will
   forward a dmabuf-backed (unreadable) skb. This protects skbs from
   landing on devices that don't have the IOMMU mappings for the backing
   dmabuf or that don't speak netmem. Netkit, however, does not support
   DMA, doesn't attempt to read unreadable skb pages and so doesn't
   break netmem (it is pure skb routing and redirection). It is
   functionally capable of routing unreadable skbs, but there is no way
   for the TX validation pathway to distinguish between a device that
   will actually attempt DMA-ing the skb and another device
   (like netkit) that does not DMA but also does not break
   netmem.

2. bind_tx_doit uses the bound device as the DMA device.  When the user
   binds devmem TX to the netkit guest, the bind handler attempts to
   create DMA mappings against netkit, which has no DMA capability and
   no IOMMU mappings.

This series solves these problems as follows:

1. Extend netmem_tx to two bits, assigned to one of three values:

   NETMEM_TX_NONE   - netmem not supported
   NETMEM_TX_DMA    - netmem supported and performs DMA
   NETMEM_TX_NO_DMA - netmem supported, but does not DMA

   With these bits, phys devices can set NETMEM_TX_DMA and devices like
   netkit set NETMEM_TX_NO_DMA. The validation TX path ensures that any
   DMA-capable netdev exactly matches the bound device, guarantee the
   correct mapping of the bound dmabuf. The validation TX path also
   allows devices with NETMEM_TX_NO_DMA to pass, knowing these devices
   will not misuse netmem or run into IOMMU faults. After redirection or
   routing and the skb finally makes its way through the stack to a
   physical device's TX path, the above NETMEM_TX_DMA check is performed
   again to guarantee the device has the appropriate binding/mappings.

2. On TX bind, the bind handler recognizes NETMEM_TX_NO_DMA devices and
   finds the phys TX device and binds to that instead. For the netkit
   case, if it has been leased a queue from a DMA-capable device
   already, then the bind action is performed on the DMA-capable device
   instead and the dmabuf is mapped correctly.

---
Changes in v2:
- Squash driver conversion patches (2-5) into patch 1 (Jakub)
- In validate_xmit_unreadable_skb() to check netmem_tx mode before inspecting
  frags (Jakub)
- Lock bind_dev around netdev_queue_get_dma_dev() when bind_dev != netdev to
  fix lockdep (Sashiko)
- Move require_devmem() into individual test functions so KsftSkipEx goes up to
  ksft_run() (Sashiko)
- Add nk_devmem.py to TEST_PROGS in Makefile (Sashiko)
- Link to v1:
  https://lore.kernel.org/all/20260428-tcp-dm-netkit-v1-0-719280eba4d2@meta.com/

To: Andrew Lunn <andrew+netdev@lunn.ch>
To: David S. Miller <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Alex Shi <alexs@kernel.org>
To: Yanteng Si <si.yanteng@linux.dev>
To: Dongliang Mu <dzm91@hust.edu.cn>
To: Michael Chan <michael.chan@broadcom.com>
To: Pavan Chebbi <pavan.chebbi@broadcom.com>
To: Joshua Washington <joshwash@google.com>
To: Harshitha Ramamurthy <hramamurthy@google.com>
To: Saeed Mahameed <saeedm@nvidia.com>
To: Tariq Toukan <tariqt@nvidia.com>
To: Mark Bloch <mbloch@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
To: Alexander Duyck <alexanderduyck@fb.com>
To: kernel-team@meta.com
To: Daniel Borkmann <daniel@iogearbox.net>
To: Nikolay Aleksandrov <razor@blackwall.org>
To: Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-rdma@vger.kernel.org
Cc: bpf@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org
Cc: Stanislav Fomichev <sdf@fomichev.me>
Cc: Mina Almasry <almasrymina@google.com>
Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>

---
Bobby Eshleman (6):
      net: add netmem_tx modes that indicate dma capability
      net: devmem: support TX over NETMEM_TX_NO_DMA devices
      selftests: drv-net: ncdevmem: add -n flag to skip NIC configuration
      selftests: drv-net: refactor devmem command builders into lib module
      selftests: drv-net: add primary_rx_redirect support to NetDrvContEnv
      selftests: drv-net: add netkit devmem tests

 .../networking/net_cachelines/net_device.rst       |   2 +-
 Documentation/networking/netmem.rst                |   8 +-
 .../translations/zh_CN/networking/netmem.rst       |   7 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt.c          |   2 +-
 drivers/net/ethernet/google/gve/gve_main.c         |   2 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_main.c  |   2 +-
 drivers/net/ethernet/meta/fbnic/fbnic_netdev.c     |   2 +-
 drivers/net/netkit.c                               |   1 +
 include/linux/netdevice.h                          |  11 +-
 net/core/dev.c                                     |  21 +-
 net/core/devmem.c                                  |   6 +-
 net/core/devmem.h                                  |   9 +-
 net/core/netdev-genl.c                             |  57 +++++-
 tools/testing/selftests/drivers/net/hw/Makefile    |   1 +
 tools/testing/selftests/drivers/net/hw/devmem.py   |  73 +------
 .../selftests/drivers/net/hw/lib/py/devmem.py      | 222 +++++++++++++++++++++
 tools/testing/selftests/drivers/net/hw/ncdevmem.c  |  58 +++---
 .../testing/selftests/drivers/net/hw/nk_devmem.py  |  40 ++++
 .../drivers/net/hw/nk_primary_rx_redirect.bpf.c    |  41 ++++
 tools/testing/selftests/drivers/net/lib/py/env.py  |  67 +++++--
 20 files changed, 507 insertions(+), 125 deletions(-)
---
base-commit: 790ead9394860e7d70c5e0e50a35b243e909a618
change-id: 20260423-tcp-dm-netkit-2bd78b638d30

Best regards,
-- 
Bobby Eshleman <bobbyeshleman@meta.com>

