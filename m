Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EAA38E5C5
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 17:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778779363; cv=none; b=BrR4kKThEcDu6FXELkBvzU46eMoJvqXJtAWSUEhijHv74MJgeDRvRsicvl5daMe+5mT/SYELkX+I5OKNb21I0VS/BbGJvqgkmzW3/ZB5qF5B99MF5SpDPIV/3a64aGMw1YpKv4qyQ4DPh9ZFyCjmBlOPnmHDKtZ6+CeJuJWXJA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778779363; c=relaxed/simple;
	bh=WaURA/DNPPwOj8kBu247T1AUk4Ywg+Oqa+t268ORM8E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F6OH7zVyQMPE9Vj4Qc36h1Lfv2Qsi2KVpuXdFo6hgsAQvl62eL1n+wI5JRdHUkdSOYOqhXIkuJbiUGqchx836ZRyyCsi+D8R3Z2f0WGZUXVIAh7tcLxsVpqYRTmUckjn1PHAJE1ijc+yiVy6Yweq/Th3B77PEdwtZz1px6QF7l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h7XA7KV9; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7XA7KV9"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-435153d9b68so5147880fac.3
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 10:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778779360; x=1779384160; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wcw+cHjZfdX91JnE70m1FMdTq5GVKmXsz1C+2FwOHb0=;
        b=h7XA7KV9BUu6UKpiANcUa7EKP34ZIQ3q+4AwXs9czWyBKUGGKOVjuYNhtE+aIwXpwX
         XmhJsYjenqeHfW9kni63j4HW3inQB2r+I3eNMyHZhkKhSP9nl55r6jYAHczujanVr0xA
         auyB0JSGrhoMRucnQL87bThIvFuZJf1vE7tBLRTs3MpsYOyfdm5T9/HYt2OZmb9aSM6T
         b+hQhxdclxmW79ilHM9bUfh1l10wQ1YoO1gAGaNdt1YAr8PpVIx7KSauF1l5/z1u+Rmo
         nnBZNC71QD9P/123j9oWOJO/JTjvRzJveTLCB/RrQf/UbLX342L/DNepg1c4FhiH1+NO
         f36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778779360; x=1779384160;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wcw+cHjZfdX91JnE70m1FMdTq5GVKmXsz1C+2FwOHb0=;
        b=YpDFVpKEFBrGHXTBvJF0aoG1C8sy56KVpd1iCdrV0lCIJPLP4rK86Qmtw7hQ2sysGc
         nCZZTQ4BNp3FV2w+4v0dYSNbp9w0XGdZGhgLidousAgCAJ2xdX/ZqLmL8daR32ECuJbc
         WqU7gTcUY/MMP6fsZtgllArhL655UcYA6Uc1brFnc2wMjH8f0r8DcTkjwh+pbwrIp/eR
         tz8eLBDbjiOcy0GRpTOXYN9bxU3U6FhyPEe6InAbgqD8S/WaUA5aPryZTXEyTTJfJNmh
         4MTIOjz3oV9Qo1d7wGfdVe3HVI02XR8rJCp4dH6PYopRLOQOVu/5Mgn3vUnTEZHBmH00
         tiLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/IcK2J4uskX31zFZENHsW0QijJ05CNcLNNBwOUWUKvn2kfGSWTeRkPLYFKyX8ZvhE3QgcvE0ZVZBalxFpqOks=@vger.kernel.org
X-Gm-Message-State: AOJu0YznGllSu49YzCaFp5XN6oOi/v2RcGTQhgrcfLKwQf9Hwi6/6urg
	G/TS0YLwH5w+fnDu/9F9BrGRxHp7I83do8NlmXII6tYl1ODnQD74W7vz
X-Gm-Gg: Acq92OG3mQM/n42BjhJ+zNR7SGqa4keUL5m/PK5HJJgJBWhQdvRUPyAXia2U/W12l2V
	ZgKIooG7ifjlBLGQCDQJdpunN20BfvPKX52JW87uJzAf1stIZ+XWysYwIUkROjHgGVoZ1MYFSQ+
	oK1l/EsfCc0EflCMyIqJRz6OAM4HUHOq9GR/2DfB93r9+RtvQ7fe1KdKX1lSStCn9dlrKBemnKy
	u7FwiLGxm4ZAr3J9WS+Ww23SrHdIQDZiA9OIB4bgIrlLp118maJbHqr2X/cu5G3lzSK3GtiI9EH
	1EEFRxtekvrg3pTyWrG3JLm/hQ+ivcJpGuoVY86idhOb3FilZLyHY3T9DShdv2tW1wtKAHw5j/A
	5a/37rX+q1AVxsKA0Unyag+dI/x+lkHKJt9icDJfYzS3omoLyYCadCLH9bjuVYt4hWyLPiBMQKr
	ykW1mhXuz7tY81fRScrEbVRQ==
X-Received: by 2002:a05:6820:8185:b0:685:7678:b53c with SMTP id 006d021491bc7-69c9bfb085cmr188329eaf.46.1778779359904;
        Thu, 14 May 2026 10:22:39 -0700 (PDT)
Received: from localhost ([2a03:2880:f812:12::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69b8c7e0140sm1483053eaf.3.2026.05.14.10.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 10:22:39 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: [PATCH net-next v5 0/8] net: devmem: support devmem with netkit
 devices
Date: Thu, 14 May 2026 10:22:27 -0700
Message-Id: <20260514-tcp-dm-netkit-v5-0-408c59b91e66@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANQEBmoC/12PywrDIBBFf6W4rsWMz3TV/yhdJGoaKXmgIikh/
 17rKri83DnnMjsK1jsb0P2yI2+TC26Zc+DXC9JjN78tdiZnBAQEYUBx1Cs2E55t/LiIoTdS9YI
 qQwnKzOrt4Lbie6J8k++2iF65GV2Ii/+WoQSlL05OWOVMgAnmwnDotITBsMdkY3fTy1REiZ5hW
 cP0D4OChjGuhNQVzE5w09Qwy7BiTZ9/alsjz8vHcfwAOFy6kS0BAAA=
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
   DMA-capable netdev exactly matches the bound device, guaranteeing the
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
Changes in v5:
- configure_nic(): register cleanup via defer() and drop the separate
  cleanup_nic() helper, this avoids leaking resources init'd during
  setup. (Sashiko)
- Use sys.byteorder when packing phys_ifindex into the BPF .bss map (Sashiko).
- fix unhandle KsftSkip in tests (Sashiko).
- see per-patch changes for more details
- Link to v4: https://lore.kernel.org/r/20260511-tcp-dm-netkit-v4-0-841b78b99d74@meta.com

Changes in v4:
- remove enum list from netmem_tx comment (Stan)
- fold NETMEM_TX_NO_DMA check in validate_xmit_unreadable_skb() into
  skb_frags_readable check (Stan, Jakub)
- change binding->vdev to void ptr cookie with comment (Jakub)
- Fixed the bad change list version number (Stan)
- Link to v3: https://lore.kernel.org/r/20260507-tcp-dm-netkit-v3-0-52821445867c@meta.com

Changes in v3:
- Fix validate_xmit_unreadable_skb() logic for non-devmem
  unreadable niovs (should not be dropped) (Sashiko)
- Simplify lock handling in bind_tx, no premature release (Jakub)
- split NO_DMA changes into separate patch (Jakub)
- fixed some pylint issues, one required an additional patch ("selftests:
  drv-net: make attr _nk_guest_ifname public") to rename a variable from
  private to public
- see per-patch changelist for more detailed changes
- Link to v2: https://lore.kernel.org/r/20260504-tcp-dm-netkit-v2-0-56d52ac72fd4@meta.com

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

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>

---
Bobby Eshleman (8):
      net: convert netmem_tx flag to enum
      net: netkit: declare NETMEM_TX_NO_DMA mode
      net: devmem: support TX over NETMEM_TX_NO_DMA devices
      selftests: drv-net: ncdevmem: add -n flag to skip NIC configuration
      selftests: drv-net: make attr _nk_guest_ifname public
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
 include/linux/netdevice.h                          |  10 +-
 net/core/dev.c                                     |   5 +-
 net/core/devmem.c                                  |   6 +-
 net/core/devmem.h                                  |  10 +-
 net/core/netdev-genl.c                             |  65 +++++-
 tools/testing/selftests/drivers/net/hw/Makefile    |   2 +
 tools/testing/selftests/drivers/net/hw/devmem.py   |  77 ++-----
 .../testing/selftests/drivers/net/hw/devmem_lib.py | 222 +++++++++++++++++++++
 tools/testing/selftests/drivers/net/hw/ncdevmem.c  |  58 +++---
 .../testing/selftests/drivers/net/hw/nk_devmem.py  |  46 +++++
 .../drivers/net/hw/nk_primary_rx_redirect.bpf.c    |  39 ++++
 .../testing/selftests/drivers/net/hw/nk_qlease.py  |   8 +-
 tools/testing/selftests/drivers/net/lib/py/env.py  | 110 +++++++---
 21 files changed, 545 insertions(+), 139 deletions(-)
---
base-commit: 8ebd24a7822cbae25beeafba49b2159d6a68a5f2
change-id: 20260423-tcp-dm-netkit-2bd78b638d30

Best regards,
-- 
Bobby Eshleman <bobbyeshleman@meta.com>

