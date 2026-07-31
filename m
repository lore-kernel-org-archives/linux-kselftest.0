Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71262222AC
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 00:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785457970; cv=none; b=ZXrsUcy3grK2Izv4u3c59kviwXS4ClgSCO7nSqwONIVe1wb3r8jm1gh2JsWVxgY4dO0qfVMGf4Gy2PeCkCIqwXojBjeWqZ525FNH9V/h1NELMXOZhubo4R3VSxHYwrVJmXs7I1oS8RFohcd23TE/HzJFAcPXtVBBxX/JBJU8eDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785457970; c=relaxed/simple;
	bh=hXdbEJ9UKAdAwK0XMJO7COwqFhMWbRDCgNNGwpFc7Go=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=af35ryiZgkCjaHt1cJBppTKS0EsSkkBpsLZ3kLawBtblH8uIABOHG0S9LJBGpp43cMAzFnJdTjo68hcMo502byjk/W9vUjp2syPa5IfcM5oUxt6tOvATolDbg+qKQinPNOD+KRka92+7dxpIfNjR3SNoY07LdXDs/FbhEfWowps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPfg05I+; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPfg05I+"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cea3004256so4480525ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 17:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785457968; x=1786062768; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LhNnV0kHpcW0IxYsW3OFfn9aH8v+VM0/atW7MEDCE40=;
        b=hPfg05I+EBWlvsKOZ5vC/C7bwHG/P3+wRu/tmtDMpJOXMtmddu/df8dNGOwGy7YCxf
         uGxvHniYMZ3fayd4mqQ5/iuIsieSk4ugJrghWnpKEBzEwWU0iyrLmUu+f8IjnGw5R7nv
         W2E7JSLaN4Bo8BZKCB8/BqvQX2auhdGqgL84m9Bl4E//UIqQPYMAAlCoD5Db8vunDfXR
         /NRp67w2ML4vqbCE7+3SNMF5QU30rSdjAN9dRUNJWzaB6ueR4AuKSP9K6fx2i2vtURYs
         ZsK+I1sSYSrK4Ik0ORnwzfyVuBKniVAYKGfL5eWiJZQMpNg+j878ZhS6Fu7G8G1UVe90
         PV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785457968; x=1786062768;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LhNnV0kHpcW0IxYsW3OFfn9aH8v+VM0/atW7MEDCE40=;
        b=jaLozWbRhp0D7q9Spl4tMEtQ78NzhCqttlBpRDVX3s6d3FL32qQfKMxF0lzR7+oio6
         7PgFxPkpv71wjTqLt5sWygbKeSsKZvqOOECvvchh+Ra4ojwSk44KiHtijarIby+QwEze
         6YXHapygtOcr24Z/wmoYyeR2oEMyjWkUiKvqc6uZ4a+Bf18ICXWzQFMtrgGr9ccvm+ee
         HTUl4tQ6wfJXF9FD3Ty98Y2J1v+22r/q9c8OsaveRVDpEdddrQeNIiax1RzHjF/aJgZy
         N7VwfNBND1XDRTrVvKF+yazeeZaY9CLlzoxLcp/hSvlwIFeiEmTASDXj/uVHuQ5AW7PT
         bCsg==
X-Forwarded-Encrypted: i=1; AHgh+RpQ/gQINSFwtAH8ILzzyF22jFv8ww74JqQfv8MnALDnnGd8QRn+23xF7lnMZXhpP/4y6+LAVNI+LwP63kgyxPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLHVZjCO4EZqaedP/YscD1lYOqBAYUc5dKas4hqGV3KdSXXa8M
	aANalY4rrMUgKxlfNtighAnr8JzBuofo358Cvx21xdzTj9E9y3bOZFdw
X-Gm-Gg: AR+sD11m+W+BOUZR502Und9Ry8jSIVCMd62v4YlvhkQAHnrmTbtScj42c4HqpPTC4Hb
	Rm2kb+JxhV/axYrmLbU4Aug/JcYyokkFYmCZy7Caj1lqNaz3E9IoXN/e3K8fpfMPDs75mkezvpE
	g036KdGB9jSiXYqDCSB0pf+F+PnKLFbDFksuoBvrO6rS7JWoXp5shHClJ/vgSxmgwaGYDBSPBr+
	Mc2TpVpPgxoMnibsOwNogrUPf4+Rncerl9ms4JXDKgDnINEVWVpNT/sYsh5bznrPWmBR27Cbqz8
	8aoMT7IM0ooPRCwtS9ROr0lb+l06vgo7wZBk+RIPlmCpXocKS2KYLALDqsngLN/5tCPzNp0nwF7
	6dEi0Udj8szSdg2pRwo6SU1ik9Zk7K8DDyZ7XHCa8iLPyImIC2Ze/3+htrFj50DxsxPSRRiQQ6+
	OtGXNf4N9ZlFLKT0Zkj7QWsn3xZYQXLgXi4GfKbXTI0ROqIXRp2W50vXtwXsYYAj1u2a5OIzHWu
	nXvsQ==
X-Received: by 2002:a17:902:da85:b0:2cc:864b:539 with SMTP id d9443c01a7336-2d046d5b99dmr1073995ad.6.1785457968161;
        Thu, 30 Jul 2026 17:32:48 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:7::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bc5afasm33237945ad.46.2026.07.30.17.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 17:32:47 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: [PATCH net-next v7 0/3] net: devmem: allow rx-buf-size > PAGE_SIZE
 per binding
Date: Thu, 30 Jul 2026 17:32:09 -0700
Message-Id: <20260730-tcpdm-large-niovs-v7-0-033d580a619d@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAnta2oC/23PzWqEQBAE4FcZ+myHnv/oKe8RchjHnt2BqIvKs
 GHx3QMSiMicC76qesHKS+YVOvGChUte8zxBJ3wjIN7DdGPMA3QCFClHjhRu8TGM+B2WG+OU57K
 idVbpoIMk76ER8Fg45edhfsLEG0783OCrEXDP6zYvP0dZkUf+5+qKWyQSJu2DCdF55eLHyFt4i
 /N4YEWdAClrgEJCZtUnadlbpS+APgO1Z0UjYdC9azV7l2J/Acw/4Km6wCBhDMZZk7S3ni6APQP
 vNcAioTZ9cinE1sjrAncClKkBDgl9621yKg6pPwP7vv8CNyEHtgACAAA=
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
Changes in v7:
- require_devmem() skips if rx_page_size multiple of PAGE_SIZE
- fix long line in yaml (Jakub)
- Link to v6: https://lore.kernel.org/r/20260724-tcpdm-large-niovs-v6-0-7975f62cdfbb@meta.com

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

 Documentation/netlink/specs/netdev.yaml            | 19 ++++++
 include/uapi/linux/netdev.h                        |  1 +
 net/core/devmem.c                                  | 49 ++++++++------
 net/core/devmem.h                                  | 13 ++--
 net/core/netdev-genl-gen.c                         | 11 +++-
 net/core/netdev-genl-gen.h                         |  1 +
 net/core/netdev-genl.c                             | 18 +++++-
 tools/include/uapi/linux/netdev.h                  |  1 +
 tools/testing/selftests/drivers/net/hw/devmem.py   | 11 +++-
 .../testing/selftests/drivers/net/hw/devmem_lib.py | 74 +++++++++++++++++++++-
 tools/testing/selftests/drivers/net/hw/ncdevmem.c  | 36 ++++++++++-
 .../testing/selftests/drivers/net/hw/nk_devmem.py  | 10 ++-
 12 files changed, 207 insertions(+), 37 deletions(-)
---
base-commit: 2fbade66245059c78daeaccfce13ecf499fffb51
change-id: 20260602-tcpdm-large-niovs-56523a3a1077

Best regards,
-- 
Bobby Eshleman <bobbyeshleman@meta.com>

