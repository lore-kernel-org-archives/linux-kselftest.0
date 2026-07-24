Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228743CD8BD
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 21:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784928105; cv=none; b=Khglry0dKx8t44srnNhFZ7trkKSvdC8FQ6OH7lIGCcSknOid7lFHlUXYWXHZUpRJKV/fsAXdbOr/wkEV9cm+AJAnUdwsAmviyxuv0ZKT+RtID3YjXj0Aln6mEVyPXI+3ZMEM8ryVAS62IKdz7hgC3MOCF7AP8ooWY6rt/uyEBTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784928105; c=relaxed/simple;
	bh=/zOqAC4+Ompelo1IUkmo5yf1nOh1ERPexeypHOA/Xdo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=r7OEg/Kd3vETTyb74hNyEB1YgZlu2cmfZj3d/5VqSP3mIfZozbA9SghH/gOIeL12YeRbHg1U6mDx2deeQ05VdsSWkIUib0rE0+d0EHsz65r8kUTU7m0XC1cbz9Gqvou14rI5kKDxt2zYCMIWy+quy/UPOMoKCwkguKdHJzi8QYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iji/ohKT; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iji/ohKT"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so940469b3a.1
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 14:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784928103; x=1785532903; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FQ2nZV4mae9urUpcNtLvt+1onS2Wo4KozDXQHkgV0sw=;
        b=iji/ohKT0XeNR9LLi8SoEHdUJhLewki3GTVE/crz1pfwcOqK/eEkhRS9p7kepnnPMX
         dpncnF46Ir1otSG5LqIzET0R3CBrNqTUQmpyovFE/iT4324Tg1nHRWvYo5zFjqQ6++W4
         QBO+I0sUrNbC2Wbonz37c3GFpHq2SZEN9ffuu2lPCqCVcdDhfnYr1Nwf7MZz0caOyta5
         m928ffmqxi0+jCGWAO6o4HT4ceFsHrl37YHtl3phHe9hgYZDpx2BB9HmthOiTo9gwMZb
         cBX9OBytjGZWg1O3HZMaL+S9U2t+X3D8QNtw+3DG/8hj3XCizvK7GqKU+wz4Yr2f7dAZ
         yQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784928103; x=1785532903;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FQ2nZV4mae9urUpcNtLvt+1onS2Wo4KozDXQHkgV0sw=;
        b=ovDUXch8WrdTOC+9wBsu1dhOkEWTwluMZ1Apw8IN7FBJkFoJUQKxs/XybtdTIwgpvt
         CwcG1hkkpJfVYnO8i8L6kzfHgdUjAhQ7zfpFxeApj5AZfXUnkZFOzcoFawJqHJI9Wx1s
         zC9rcUH8HFaShhx7eq7aJQHZV92z5DFk8Sl0qLunh+Uv9YZtTvBRHawuhWgfJs2RDZ2u
         XXtkSjm6+k/tsDmU1UX/Txt0R4p/0PF70SrCdsp6U0Ede/6u1br2ENXq66Yj1UJUVbgV
         PqFUJaooyysJ3W8058IgFBQfQEEcnrRlic/l3dsZcKhsJAXKf5CRz9dhY+q235YBvR2T
         LEzg==
X-Forwarded-Encrypted: i=1; AHgh+RrqONI5Axo6LKNA3/EyH9LpFS384f7MI6KxATIGKPrEBqpWg5IVl7whnspT1jsg90+3+Yl0Vgqn6UwHhXBt5Hs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjimS7erBLSCjhg+59gooMTDlQGuSo0o3FbKo+kUrPLpfj57yO
	w/3+3lpxpQkQgOhQS91mxlymDGcIMDdz6dDyFeA4g444QM0JGI/U0gYi
X-Gm-Gg: AR+sD10se+Ctcyfn+JObSCVE7r0Fd8NhWPaS1LtxgRopTvBDuh5j0CqCYLYOiiWkVQE
	/r4f4VWAnRSTH3naknr+P9xqvT0rkb4HFJFRFp4zISQWg6nUpGP5t87iXP+15tn4o382fJ+/kgx
	XdkpWiBpmQ1lWNW+D1g0XMle4bY7xeI7voFF19JHE7jNZIKe3SqceeYUCX7Q/wxBxaG2vxZXk1g
	bm+fmoJ0UNFUD9clSan4KIznYRPof8D9PiIUHRUlijgXQ3yUD6HUz3qyKJs6erajEIitwRvxtKv
	zaLboFqV9mxv3OR0B+1DSCXqnN1rld4pX3rO1c54FNGaDO+OJcGAFrYcSM0G8ZTnmoY4P3CRxz7
	lsYIwk3TwxiHIoF8EvN1DLBtkqd2V6x2N/+p19KTf9kONukQFZj6ycIY6wU4v/SVi9MSjlLaekV
	gphJ2HcutkMcqSRr9GlGykRrRWuTWosBL4z3rTXO7P3j3FjteEcTygthM=
X-Received: by 2002:a05:6a00:4213:b0:84c:241e:9070 with SMTP id d2e1a72fcca58-84e4e915478mr1649451b3a.17.1784928103363;
        Fri, 24 Jul 2026 14:21:43 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:4::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5327f7cesm453963b3a.18.2026.07.24.14.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 14:21:41 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: [PATCH net-next v6 0/3] net: devmem: allow rx-buf-size > PAGE_SIZE
 per binding
Date: Fri, 24 Jul 2026 14:21:14 -0700
Message-Id: <20260724-tcpdm-large-niovs-v6-0-7975f62cdfbb@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAErXY2oC/23PzWrDMBAE4FcRe/aWlVY/jU99j9KDrKwSQW0H2
 4iU4HcvmEKN8Xngm5kXzDIVmaFVL5iklrmMA7TKNwrSPQ43wXKFVoEh48mTwSU9rj1+x+kmOJS
 xzui8Mxw5agoBGgWPSXJ5buYnDLLgIM8FvhoF9zIv4/SzlVW95X8un7hVI2HmEG1MPhifPnpZ4
 lsa+w2rZgdofQYYJBQxXdZOgjN8AHgPnD2rjISRO39hCT6n7gDYfyDQ6QKLhCla72zm4AIdALc
 H3s8Ah4Rsu+xzTBer9wvWdf0F0DtiCr8BAAA=
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
Changes in v6:
- Rename rx-buf-size to rx-page-size (Jakub)
- Move the >= PAGE_SIZE check into the netlink policy; doit only checks
  is_power_of_2() (Jakub)
- Drop @ksft_disruptive from check_rx_large_niov() (Jakub)
- Link to v5: https://lore.kernel.org/r/20260708-tcpdm-large-niovs-v5-0-34bf6fac941b@meta.com

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
      net: devmem: allow rx-page-size > PAGE_SIZE per dmabuf binding
      selftests/net: ncdevmem: add -b option to set rx-page-size on bind
      selftests/net: devmem.py: add check_rx_large_niov

 Documentation/netlink/specs/netdev.yaml            | 17 +++++++
 include/uapi/linux/netdev.h                        |  1 +
 net/core/devmem.c                                  | 49 ++++++++++--------
 net/core/devmem.h                                  | 13 +++--
 net/core/netdev-genl-gen.c                         | 11 +++-
 net/core/netdev-genl-gen.h                         |  1 +
 net/core/netdev-genl.c                             | 18 ++++++-
 tools/include/uapi/linux/netdev.h                  |  1 +
 tools/testing/selftests/drivers/net/hw/devmem.py   | 11 +++-
 .../testing/selftests/drivers/net/hw/devmem_lib.py | 59 +++++++++++++++++++++-
 tools/testing/selftests/drivers/net/hw/ncdevmem.c  | 36 +++++++++++--
 .../testing/selftests/drivers/net/hw/nk_devmem.py  | 10 +++-
 12 files changed, 190 insertions(+), 37 deletions(-)
---
base-commit: 89d8006259b81dd25c962f6cc8d7ab268d6ea426
change-id: 20260602-tcpdm-large-niovs-56523a3a1077

Best regards,
-- 
Bobby Eshleman <bobbyeshleman@meta.com>

