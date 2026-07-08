Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4E83859E3
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 22:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783551316; cv=none; b=B4n53fE6RV1K5x7nzX5gZOuGVAzJTXwg+KzhJMBOmmJaD+vqDo3f+R+o+PIYM3AP4Sz7rDwlzdPn4n3Hix9wsxS+GgC4H9kkB5QiIaZcPpEdhujFhaXBalZAvu7SGILbNbdKPxu1/rW7IVRz/qH2O5TaOD0H7ABLN2ET5gbO8MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783551316; c=relaxed/simple;
	bh=Avs+3PHRJZ6m7C0sYcesQHDLZVIwPPV3fD56A6qoBV0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TZJMTmN5O8tjO7SuEF7zzBrul/P7XlHP/vLDM52YjvW+YpLa7XZ1OknOc+KUyHFcjuVSoB6LVzunpdGmfstf/XYDQ6tV4xSMawFu+9znDTjoC7eVE0UzY6su2gSCfu+4gFvaKi6VYQ0VGekuJAozaS6jC6Jq2ABvRcBvF6b+MRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMSkVpcO; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMSkVpcO"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6a183eb9689so714946eaf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Jul 2026 15:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783551314; x=1784156114; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EzUjmP9XIEW9/Nh3Po0jQynHplRQUkqS1YMrmb8xU7M=;
        b=DMSkVpcO1P21BtGJUuf94UGxJBpptvPcQk/GQsj8JgB/eM02gTBuzTFUV6G1Yb2BAL
         t4z5bbsuMID2JERumDg2B8wpnxxRG86v2sz3ZmIeFz8WjHEiTXvLZ98JJ950fKgTRNrd
         oIlRSw5rd4BSTfuNLLPnj57oXqZFgLxaNYBpAzNwhintn47GxFnll1jcjvBL3lT5Sr8e
         zOvHPXNf62g3PDQwxLtvEwGtFvWtaSRDHp2d51zDOltAre982U+RmINm1YNEVNV02cs6
         EbaeKLJsabc+6NNvvLn3V9pnQBf85WY63C3rZML2uW3o78f7EdvRzy9MX2/VMRvimd7L
         wB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783551314; x=1784156114;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EzUjmP9XIEW9/Nh3Po0jQynHplRQUkqS1YMrmb8xU7M=;
        b=Xn9lx22JCCfKehRUOaVQ9OgNwJj24mAV6i0lLitL6Tn/FWfUvyPZxx6lotia1YERRR
         Kd3XUUmslS8iaFeF86sQ00AyF+YCLQRHcwxGOwevNqMrU/6NDSe6KIFLy9Ime2LLmBcM
         dqO2az13Gjj6I4TrugxeUGzILypVQmszXYCfGvmCzcXVgnW9bKue2GN0f7u5htWtoREK
         nibHF9M5RSI6Wwjgpty6nhU622Tme8DQdTmQ9cej1ogF9uoZxfpfrHLh2aQBF1cU9C6h
         MuNDlf6uQl4IedA3C6XSATj+WvAjlvmiru4qTPEHdeky8NeeNe1pkG+IMYo7WccYbJLU
         RM4A==
X-Forwarded-Encrypted: i=1; AFNElJ/B1qPX+YA0DG/OUbIEpBzCedADcE6JgeSc8qQ89v96c0cRV55u8iXFCwqeSPtfT7A19nbzx35g3D6iuYLZdTw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw98ix2aqLAC0HhAP3gTp6JOdbi11wxn8kCBBzyrVqoO0EMnk+U
	zLDauknNJ/NjMwypUvKUSQix90O6nBIcBJmXosdu8LYA1HBoTbGYjCAU
X-Gm-Gg: AfdE7clLyvnnGgWaZfzEyojf+LPEWikohxhewn066PlRH9FBHDw7d+GVvLqJuHZ8LNM
	5Fg/J2gVso5qyt6km6WI7Ku2RK9HT8AOfASsHzbAF/1Clg1+PfhEbYLAv66hR+IcSvojnyesc5D
	TOKHX73oCRvWsOwGacGXgAr50wg3+NnMYyJvJtiGsgCrjO0gF1I3N3+WeKO87XyfvCMJtlUa0x2
	n9bl9l/ZgN4vDlxnVxuwV2xRThaFHtvLDKXiN8cQPym1X8M2+S68/K68a3MnjW0nWkYmDA/ja0x
	ZwFlA0Ny+PxYzQbGQBIP/rk1LrFznAtt5GNA9gEj3z3lEOZiLhygrj4YIavzBYbohXentxq7MA1
	CWLi6f8g65C20QtkeJKFIjuzC01/ADERBDPvTk0gr08S3DAefO3hBvMFlzJPdKIImPYcd++0z1h
	WPydVYeyY=
X-Received: by 2002:a05:6820:80cb:b0:6a3:89f:62b1 with SMTP id 006d021491bc7-6a36d9c95cfmr3040744eaf.31.1783551313607;
        Wed, 08 Jul 2026 15:55:13 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:4::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a36a83eb2dsm2784367eaf.10.2026.07.08.15.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 15:55:12 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: [PATCH net-next v5 0/3] net: devmem: allow rx-buf-size > PAGE_SIZE
 per binding
Date: Wed, 08 Jul 2026 15:55:03 -0700
Message-Id: <20260708-tcpdm-large-niovs-v5-0-34bf6fac941b@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEjVTmoC/23PzWrDMBAE4FcRe/aW1T/1qe9RepCVVSKo7SAJk
 RL87gVTqAk+D3wz84TKJXOFUTyhcM81rwuMwg4C4i0sV8Z8gVGAIuXIkcIW75cZv0O5Mi557RW
 ts0oHHSR5D4OAe+GUH7v5CQs3XPjR4GsQcMu1reVnL+tyz/9cfeJ2iYRJ+2BCdF65+DFzC29xn
 XesqwMg5RmgkJBZTUla9lbpF0AfgbNnXSNh0JN71+xditMLYP4BT6cLDBLGYJw1SXvr6QBs2/Y
 L/1iW2n4BAAA=
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
NETDEV_A_DMABUF_RX_BUF_SIZE, that lets userspace request a larger niov
size (power of two >= PAGE_SIZE). Drivers must opt in via
queue_mgmt_ops.QCFG_RX_PAGE_SIZE.

Measurements:

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
Changes in v5:
- removed unnecessary change from ssize_t to size_t (Mina)
- removed '--------' lines in the commit message (Paolo)
- removed commit msg about CONFIG_HUGETLB since that change was already
  merged
- Link to v4: https://lore.kernel.org/r/20260701-tcpdm-large-niovs-v4-0-ca4654f37570@meta.com

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
 net/core/devmem.c                                  | 51 +++++++++++--------
 net/core/devmem.h                                  | 13 +++--
 net/core/netdev-genl-gen.c                         |  5 +-
 net/core/netdev-genl.c                             | 19 ++++++-
 tools/include/uapi/linux/netdev.h                  |  1 +
 tools/testing/selftests/drivers/net/hw/devmem.py   | 12 ++++-
 .../testing/selftests/drivers/net/hw/devmem_lib.py | 59 +++++++++++++++++++++-
 tools/testing/selftests/drivers/net/hw/ncdevmem.c  | 36 +++++++++++--
 .../testing/selftests/drivers/net/hw/nk_devmem.py  | 11 +++-
 11 files changed, 178 insertions(+), 38 deletions(-)
---
base-commit: 474cff6868129755cf889edf40d7f491729fc588
change-id: 20260602-tcpdm-large-niovs-56523a3a1077

Best regards,
-- 
Bobby Eshleman <bobbyeshleman@meta.com>

