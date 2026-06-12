Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B386735E949
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 16:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281693; cv=none; b=LTahgDIGIHiK0XjgS0NszeNzNvjuw2OnDis/wHLZn8WVRxlaAsWopCcnOyZcA0qCig12hCDc6DmhIEp39fVWpQu++JtgvF+6XdXiY3/MY/eNGcJlWGxqVN77yrItIap5U3l8e+vetOOtIU9CpEw99RFiYCeFRKOPVHR+QuMJAL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281693; c=relaxed/simple;
	bh=6ZE69KeYwSFR9ddLxR0MdZCFmLqvmyPcMNYBiJZYTEY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IkUpvrwwH/RKJW+FaX8Zf6Qj5HGYJZyZGChJh08weXut7JMxpOQyfhzt7gBPgY8SAhPp7dQT/1TofBmdAyoAir9QPqGTLmTZmtZD2jgFlVEevy9ScYuEFvg2n1WOrqpabPa7juTyj1UXdIAarBw3sPoMxOive9/m2iMmFmq9TiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q9m43Nyc; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q9m43Nyc"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84275887a3fso1627668b3a.1
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 09:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781281691; x=1781886491; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1gfCjqesfW4kvsUaSrLF2IXLSdKMNWo5TtK5P4zLV3s=;
        b=q9m43NycljZ/y+CWZ61pjHLdFLTXuVlI/oW+KYmP2poGJAgnHxs0rvM60ACrkHXvvL
         MKyFwI+geeecXZcFZyIEu5IKO2jOxbYB453eGeHyk0zWP6/S7d0aTxFu7F6Ixwdkszwz
         x9xoIIpkgKb+CrAKZclsjF3x6qp0bBpf7YQUzlk+JOPZTqN1An129SBRlI9NdgGgZzOa
         H7Mjsd+lRaiNamZ4nsTsDFEiUuiceip9VVKaMoNRgnjmHjdyCaPWTrkSEFErP/IIsCBq
         Jx8MJ9EK6pnGBuSkeqNAZ/npJxldBR3AkkjfFamla+LOYhXHm1tYkb6V4hgkyt294P6o
         usTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781281691; x=1781886491;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gfCjqesfW4kvsUaSrLF2IXLSdKMNWo5TtK5P4zLV3s=;
        b=r4D0sNTjuGZKXhHye25yV9i2a+XPoN8LNDg58PtAVNjFMA83g5RNcr30BJ+3c2g1Hq
         NjETG8KizFF0YQkzQPn6Nqqw3zt8zcpQbTSClP3vZl5cDPDbKGv4pWcOImKelGutJhnn
         HqY/JSYlHxVtvRegKkiWjlo5hS+1DT8NDWW91zzOJxWClzEn1bzH9yImHOJYf7eFmScX
         QV+Rj0xO88zKHRnKultGNa2gmIRMI2U13ka2UM7c4JotNndC9LN4+SfNOJMnPZrnmHES
         ZHSTpe7Jd+NwnMgFwb6e6gf+xr9vYm4k9wsigl0iKt5JPJesmChE09h3UFZwGFuoIDEm
         AUAA==
X-Forwarded-Encrypted: i=1; AFNElJ8xzLWAC1vhSrzeWgRmAOSSJ0WWe5BzS0S1IJLkFZoRzmBhT4/WV7JGs+IJtoL+5mXJJ6hGgNa4RuBkEi5Vxjw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYdsTOKmIf+M2x1yT7SU3h8jJqF31Qu2vGjk4T39Ee9X1citrm
	U2/CawkDzx//LKpge+asFaHiReMSt4W7ctbSoLqm3tnBfCPNXEXJwlm1
X-Gm-Gg: Acq92OFXW/E2fITy1IAH9QP5kmNxdge3sbX46K3mx30Ea4DSvGLcOHvdm+eGj2uEbfl
	5nYq/h43qasx2tCFbHW5EhZdVkenzv4YdFmILSQlg+yzQMV32Hx8IClvRF9VKnUajL7CgIsi3mj
	OP3JQGkPrOjq/WQIO/9njoydUSgbn5dnvQcet+fd42NKgpRLNVSgWc0PsHAgg5NpSvMZ4zLd5sd
	W7CeIN1QOu6eQiqwfPE5vfIxaa4cZi1l4VcXZ9/f+WpgqZb6Q3ZI4LPCg8wsTnTzAfECsKcYS+n
	7ned25/kErMxbD3HyQVnO2lhpgDv6VxQzu+pihjtE1HpSuQPueme/vcRAOIkZtf7UvMraCPMMyR
	OTsIx+w9OjRNomclyTEnA1E4jrd161N3euheBTR+Jc/1vI9D9Onlu9djqez33XRQn6rk8W1YH1A
	H5WLLsHXo8AcCFI+UPzPo=
X-Received: by 2002:a05:6a00:2998:b0:82c:7420:82bf with SMTP id d2e1a72fcca58-8434d0b0bc3mr2959505b3a.19.1781281690860;
        Fri, 12 Jun 2026 09:28:10 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:4f::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b05d7d7sm2906069b3a.60.2026.06.12.09.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 09:28:10 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: [PATCH net-next v3 0/4] net: devmem: allow rx-buf-size > PAGE_SIZE
 per binding
Date: Fri, 12 Jun 2026 09:25:56 -0700
Message-Id: <20260612-tcpdm-large-niovs-v3-0-a3b693e76fcb@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABkzLGoC/23NQQrDIBBA0avIrDNFx0Yhq96jdGHNpBUaU1QkJ
 eTuBekii64/vL9B5hQ4wyA2SFxDDkuEQehOgH+6+GAMIwwCSJKRRhIW/x5nfLn0YIxhqRl705N
 22ilpLXQC3omnsDbzCpELRl4L3DoBz5DLkj5tVlXrP1f/catCiZO27uy8sWT8ZebiTn6ZG1bpA
 Cj1DyCUyEz3SfVse9IHYN/3L8Foqfj8AAAA
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
 dw@davidwei.uk, Bobby Eshleman <bobbyeshleman@meta.com>
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
Bobby Eshleman (4):
      net: devmem: allow rx-buf-size > PAGE_SIZE per dmabuf binding
      udmabuf: emit one sg entry per pinned folio
      selftests/net: ncdevmem: add -b option to set rx-buf-size on bind
      selftests/net: devmem.py: add check_rx_large_niov

 Documentation/netlink/specs/netdev.yaml            |  8 +++
 drivers/dma-buf/udmabuf.c                          | 52 +++++++++++++++++--
 include/uapi/linux/netdev.h                        |  1 +
 net/core/devmem.c                                  | 51 +++++++++++--------
 net/core/devmem.h                                  | 13 +++--
 net/core/netdev-genl-gen.c                         |  5 +-
 net/core/netdev-genl.c                             | 19 ++++++-
 tools/include/uapi/linux/netdev.h                  |  1 +
 tools/testing/selftests/drivers/net/hw/config      |  1 +
 tools/testing/selftests/drivers/net/hw/devmem.py   | 12 ++++-
 .../testing/selftests/drivers/net/hw/devmem_lib.py | 58 +++++++++++++++++++++-
 tools/testing/selftests/drivers/net/hw/ncdevmem.c  | 36 ++++++++++++--
 .../testing/selftests/drivers/net/hw/nk_devmem.py  | 11 +++-
 13 files changed, 225 insertions(+), 43 deletions(-)
---
base-commit: 518d8d0199538a4d6d5e51064044ece71e0c42e7
change-id: 20260602-tcpdm-large-niovs-56523a3a1077

Best regards,
-- 
Bobby Eshleman <bobbyeshleman@meta.com>

