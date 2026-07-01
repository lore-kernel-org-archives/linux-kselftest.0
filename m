Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C4C38F259
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 19:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782933755; cv=none; b=UrCtWtrFvy4jBSSpUuAmeYGaFYGTYdmDPX+NA2m1ziEvM3BVNQVk9slQKt9I/sTMZ1J6C5YhDMBVy9t4XYdUEJ861bU7t7kAiJ1Z3DsYynSTKuqZgFa+vV5CmlW7ROV5axmB24RDy2jjfqA+BevcohN2ibyl3SQU43K671stZaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782933755; c=relaxed/simple;
	bh=bFvXqKJWkf5BMGbp45KpathPgCWSGtKn5GiWUSs9TkM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AygYGoX0RbJmjegULasfWpaoRo3Vxoybv8LIN2K/ZZhp+F07CpwKTpcS+TlwfFQv1vXaYhfLONmLcog2yv3+ZSDADnVlaQmFY76Xr+HoYpkxFC3n8gA3HEDwSWC0pymbQfffAt6/LSTCGwmwfEkf0hltsIfMBzc6hLY53sTrGgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mbX1VhFf; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mbX1VhFf"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-69d7cdd3b8eso432236eaf.2
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 12:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782933753; x=1783538553; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RTaa1f3vcFQz1JXAdbVo3mJ6YMjKrRzWYP+nH66vQBE=;
        b=mbX1VhFftg63RZBd3S1VodtO42JV89ky+dSTtXaoKBHcySBnfxRajHZDEOcGMGRckS
         SDP/HfudeCDc3VxJ0+NIWXQrkrmbc8tiFP4vdlG/ixBin6FqAw9Mk8F1lrMIUFrvCQ7d
         kCGlfNmQrpUpEweNTt3AsQ3hiY9dnrf7eC/7thxZPzvO9uYBYxw66YXZkg6I3szsTY6b
         Pg8ZZE3lyO/QgEZNeVkQbTlQh7JXjwH8Ac8MqEN1DMJWd1NHQTM3UL/07ibHcLsrMyAv
         Z79gS/irVJCGdnzMBDszR57DdPHwHo0qLMkFOPxDWnGOVbmg4EXKFFpCtBdOR0fljzUI
         Azfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782933753; x=1783538553;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTaa1f3vcFQz1JXAdbVo3mJ6YMjKrRzWYP+nH66vQBE=;
        b=SVhAKTT+pNF6qfOqPDuianFV9SwdNo5hqSjD1m9djHy5btMTp1ZlENaLwxiOqRMhMs
         NWekg7Y6BNW7XGDAbKLdO6fgp+NidaUvGHN7jwelYUnVY1wV2gCFd0E+uK5dEaR6G5XT
         wfG8AM6qjjTpY+DhDnJrwraLUDQh9twFjoVZkfy33lCZv9yoxPIXIF1Jv3p+XBzOTzRa
         J9YGQagdB0LHL5Gkr8430lZ+FcoOOrk+zkS0Wa1AG6zc2BDI+evy43gC0bQij3O4A8lF
         AoUriekcgrsbFPbR4CRxRZmB8jJNhoxqd8OOKAwz3l9TdqsK9CZOR0wI+ZFsDxynP8Ok
         X6zQ==
X-Forwarded-Encrypted: i=1; AFNElJ8rCLwShA0OElSAVODlQ+VXmGWzTHJ/4UyqzKBAMnHjO65d3zwAboUHvNRJcrBY66T113jWYXpM2juXFGs+4nI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEtGF/xn1lQq2tyYuG6ZetvrAKLJU3HbhzQp+G26RfwgO4GFRv
	36KXjla8G25WvpbnM/z9KwnMbHrHd/axPNmynezeIruUS97FNEQEYU+v
X-Gm-Gg: AfdE7cmjuJ+FCr2oT2GwEEc8R594yj9sMRDHVz48gFOxgHKjEUzqh68ZzrOMEcbPywb
	1JSLzxelJcG9zshodXQhW+wkf4Fd7Wuw5/xklUzzHwnSviX9PJzQQKz0/547s0XxzzSbYz/7U5M
	4RMU43DponXW02+W0tZ4XGkFpBMJh/doJz1/iXqbMGr8MljWKK8sKw5MIPLalpw3d65ewc1wQH+
	WLMZwr4nQOq4JhHdGfxwMtpkHIG4AhJwnfoCBHt9iZBVJD3mJMIz33DdNDQIvFByinOXLZSKtxh
	edNlSjoCsO/K1oo4tBqE6XtSn86ypSzrT/g3Lbzci72AUSdh7h687rII2E88BAt2XzqVmgoc2uD
	CjlGXJnwlVghiOEmbm05n9kT3cgit2dNpZEFryvnA0ZnqNln3iCco2yydTNrdd2CFX7qPU3VCd1
	0PLIIS9mLai+nBxlq2m60=
X-Received: by 2002:a4a:e904:0:b0:6a1:50e7:5c1c with SMTP id 006d021491bc7-6a309be5591mr1545058eaf.71.1782933752754;
        Wed, 01 Jul 2026 12:22:32 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:4d::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a3103cddefsm608995eaf.13.2026.07.01.12.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 12:22:32 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: [PATCH net-next v4 0/3] net: devmem: allow rx-buf-size > PAGE_SIZE
 per binding
Date: Wed, 01 Jul 2026 12:22:23 -0700
Message-Id: <20260701-tcpdm-large-niovs-v4-0-ca4654f37570@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPBoRWoC/23PQWrDMBCF4auIWXuCNBNLxKveo3QhK+NEEMtBE
 iIl+O4F04UJXj/4Hv8biuQoBQb1hiwtlrgkGNS5UxDuPt0E4xUGBaTJaqsJa3heZ3z4fBNMcWk
 Fe9sTe/ZGOwedgmeWKb428xuSVEzyqvDTKbjHUpf8u501s+3/Lh+4zaDGiZ0/+2Ad2fA1S/Wns
 Mwb1mgHGHMEEGoUoXEyvbie+APgPXBU1hg1eh7thcXZKYw7YF3XP7v7NSI9AQAA
X-Change-ID: 20260602-tcpdm-large-niovs-56523a3a1077
To: Donald Hunter <donald.hunter@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org, 
 sdf@fomichev.me, razor@blackwall.org, daniel@iogearbox.net, 
 almasrymina@google.com, matttbe@kernel.org, skhawaja@google.com, 
 dw@davidwei.uk, Joe Damato <joe@dama.to>, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

Every devmem dmabuf binding hands the page_pool PAGE_SIZE niovs today.
On NICs that consume one descriptor per netmem, this caps a single RX
descriptor at PAGE_SIZE and burns CPU on buffer churn.

In this series, we add a bind-time netlink attribute,
NETDEV_A_DMABUF_RX_BUF_SIZE, that lets userspace request a larger niov size
(power of two >= PAGE_SIZE). Drivers must opt in via
queue_mgmt_ops.QCFG_RX_PAGE_SIZE.

Selftests use udmabuf, but udmabuf sgtables were previously hardcoded to
PAGE_SIZE. This series modifies udmabuf to respect folio sizes in its exported
sgtable. The result is that when backing udmabuf with MFD_HUGETLB 2MB pages,
the sgtable is populated with 2MB entries, allowing devmem's gen_pool to carve
out large (eg. 64K) niovs.

Measurements
------------

Setup: kperf devmem RX/TX cuda, 4 flows, 64 MB messages, 60s, dctcp,
num-rx-queues=4, dmabuf-rx/tx-size-mb=2048, 10 runs per niov size,
mlx5.

   niov       RX dev Gbps   RX flow avg Gbps         app sys %
  -----  ----------------  -----------------  ----------------
     4K  300.63 +/- 53.21    75.16 +/- 13.30   54.15 +/- 10.23
    16K  321.35 +/- 28.20    80.34 +/-  7.05   41.05 +/-  8.87
    32K  347.63 +/-  2.20    86.91 +/-  0.55   44.54 +/-  3.51
    64K  332.11 +/- 14.26    83.03 +/-  3.56   35.47 +/-  3.11

RX app sys % drops ~19% from 4K to 64K.

kperf support (not yet merged):
https://github.com/facebookexperimental/kperf/commit/8837577f920876bce6986ec18869ac04439ebcd2

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
Changes in v4:
- ncdevmem: fix the possible overflow in ncdevmem (Sashiko)
- drop the udmabuf patch because the fix is now already in net-next
- silenced two pylint complaints in devmem_lib.py
- Link to v3: https://lore.kernel.org/r/20260612-tcpdm-large-niovs-v3-0-a3b693e76fcb@meta.com

Changes in v3:
- fix a bunch of non-reverse christmas tree declarations (Stan)
- remove extra uint32 cast for getpagesize() (Stan)
- remove overzealous strtoul checking (Stan)
- remove value checks that the kernel already performs on rx_buf_size
  (Stan)
- Link to v2: https://lore.kernel.org/r/20260611-tcpdm-large-niovs-v2-0-ee2bf15e7523@meta.com

Changes in v2:
- Use NL_SET_ERR_MSG_FMT for sg alignment failure details (Stan)
- Keep -E2BIG (not a direct ask, but seemed preferred, Stan)
- Update udmabuf commit message and comments explaining why
  "one sg ent per folio" is useful (Christian)
- Set/restore nr_hugepages in py harness (Stan)
- Link to v1: https://lore.kernel.org/r/20260603-tcpdm-large-niovs-v1-0-f37a4ac6726c@meta.com

---
Bobby Eshleman (3):
      net: devmem: allow rx-buf-size > PAGE_SIZE per dmabuf binding
      selftests/net: ncdevmem: add -b option to set rx-buf-size on bind
      selftests/net: devmem.py: add check_rx_large_niov

 Documentation/netlink/specs/netdev.yaml            |  8 +++
 include/uapi/linux/netdev.h                        |  1 +
 net/core/devmem.c                                  | 55 +++++++++++---------
 net/core/devmem.h                                  | 13 +++--
 net/core/netdev-genl-gen.c                         |  5 +-
 net/core/netdev-genl.c                             | 19 ++++++-
 tools/include/uapi/linux/netdev.h                  |  1 +
 tools/testing/selftests/drivers/net/hw/devmem.py   | 12 ++++-
 .../testing/selftests/drivers/net/hw/devmem_lib.py | 59 +++++++++++++++++++++-
 tools/testing/selftests/drivers/net/hw/ncdevmem.c  | 36 +++++++++++--
 .../testing/selftests/drivers/net/hw/nk_devmem.py  | 11 +++-
 11 files changed, 180 insertions(+), 40 deletions(-)
---
base-commit: 805185b7c7a1069e407b6f7b3bc98e44d415f484
change-id: 20260602-tcpdm-large-niovs-56523a3a1077

Best regards,
-- 
Bobby Eshleman <bobbyeshleman@meta.com>

