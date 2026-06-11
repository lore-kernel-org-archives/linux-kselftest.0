Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D14E4192E5
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 16:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194638; cv=none; b=f8mbWGCHCjKxew/51e0jnGQKGn742NbzRZpBysEVQHEetEJhHQXSXM5qH894+4D2Tfc4GdpPGAI7GuNK7/99HrQoi5AnBg29b/0K7gcK4pk8ulgWHxYOKQnX7X/FZ8SaZW0pou3fml59WkpayzldzGEzHPq685T2vGIwUBWpBeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194638; c=relaxed/simple;
	bh=+pK8PkXLRnqlfW1AuEdNtKOaf6kjQ3HiGkOzGHRe5C4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K7fRidEGLI6lMExcXHc6iQzvzBs3c3eRng0x4jQTgKdx+paFWVAJW6D5kS4wawF39aY3tTbU0E30M+qOLOwTjgFoVy+aL6VZagUaMSIjxHa+4ISRUkreeNCxmmu0NKk0mFAJQv9sgblgmUFRWDsskykGdw86EK09+whTfCECjOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n/yPXPd5; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/yPXPd5"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c855599a77aso4213299a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 09:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781194637; x=1781799437; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=og57coQD3NKK4AOSZLfMT1CyFR6j8/1DFkBGKs1z5do=;
        b=n/yPXPd5fKWYFljiv9npmnDfA7llZ5FJuz3T/gf9avWp3kNLzQFy+LnAzi6UMOdSFW
         gg0lboINXqwkK0cnPGzoPk/2O75BhYU5tP6GEXi2VK7RcJQbvULZAd4g2Eo1aWZANQuk
         I3aHmkp/KCmy609Z3ShvCVsE7/kY1oKwmRxrPuTZ1FLem6qUnhM0lNnzkgZCXx2Sp3Xf
         RFuFezKaf9spzJ3FisBXJRN+nA+IwyE4b//YkGWOlV+ELCRnkRJ4MPdiaCh3vdFbpqiv
         ZXu0aqw07F3RHkdCSRpikMoZz7gdwvrKq4rMys56O3KSvRlEuXn38or8ixqvkVZTekUG
         3z0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781194637; x=1781799437;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=og57coQD3NKK4AOSZLfMT1CyFR6j8/1DFkBGKs1z5do=;
        b=F0CkXSdmg1F/Vc04g0Ccttb7gTWfLFUk1beqT5MRDVT1CdiUDqpWoR81bGVb2LQ32k
         1JLKTWxVOsQXwzaLS54qUiisjJguLusTa+Gtf4UXogGpV4I3DvuxjYq7HVbzbLBfPsbe
         TwPEFBbkSnFHcu28uwqsloywW6r4q1yvSNFl/ObUq4pKsU9AgDpySkCPxs7RrqAZoenz
         ObnSnjR9KCfoV0zYEk+yqAd35cL8Xs/sfCZ76RtmNkHSeOvd7T5B1/1kB9fu/51nYQc3
         q8uWq/WXmhcK2/BCkd4m1jHeT9OvsbOoVF+rcNkqvEKwdHEeNO3zp+IWEwsY0QhXrnz/
         BC3g==
X-Forwarded-Encrypted: i=1; AFNElJ80RWM7x/ev3n4h62HroIA+xZxabCWyV9uNoIRbCRWLiMmPLvqPoRoO+UVI/sHxPNLGQ2DsbJeYytFUs2tX5/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwQM6SyP2QnS75cfDoIaevCYBUFU8yL6ffGawca3kyM1zQLRCj
	pMq7aUz8sPiSG/S4//YNonvF/ijm1W1oOomLz1x8QrTVNCUXZ4dkcCe6
X-Gm-Gg: Acq92OEnhnkYb6/+sTGVdR4sizwNscWdPF6XvGX/kJ1Uen/Tgf2NOWJd54ZCOg6CKjj
	cnHkLf17i3K+m/wKrH5CohAR8idDME7CzUYgeUunoI6uISxpVhWdVBkAH6ubALsXFq21jeJ2Yhq
	DVUCoLbVuZpO0STYyd3HX8dpLexYmJumKWu7vsfjus0aa11jrXQjBA7SO/2XZMuHURdXCYqtUgW
	98InRLsj0rEQv69xksELT238bYqYu5i40DmhzXhav7+aLxh0dHlFYaoBWjxBLKDiWOHaGwqz3lp
	ezaX4S5WLcsBWP4SXpVUA9QX7BABefZwZ1DVeigiqJulg/qXStFhA34PcXfFckhx/EDuIbbw8Eh
	Pxg2ZX+MLwvi8DHWYlA8izaBXIukS6pPHkLdON1GnrP+r9ifoDR5HIgpxHeImrPuaJhXZsQa4Q5
	w+iGKr1mptpLmTp7Qv6lA=
X-Received: by 2002:a05:6a20:cc8e:b0:3aa:f9cb:d438 with SMTP id adf61e73a8af0-3b5e32c48ccmr4294917637.21.1781194636389;
        Thu, 11 Jun 2026 09:17:16 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:4f::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c865880a1aasm2190461a12.22.2026.06.11.09.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 09:17:16 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: [PATCH net-next v2 0/4] net: devmem: allow rx-buf-size > PAGE_SIZE
 per binding
Date: Thu, 11 Jun 2026 08:28:41 -0700
Message-Id: <20260611-tcpdm-large-niovs-v2-0-ee2bf15e7523@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACrUKmoC/23NQQqDMBBA0auEWTslJjUBV72HuAhx1IGaSBKCR
 bx7Qbrs+sP7J2RKTBl6cUKiypljgF6oRoBfXVgIeYJegJLKSCMVFr9PG75dWggDx5qxM53STrt
 WWguNgD3RzMdtDhCoYKCjwNgIWDmXmD73rLZ3/7n6j1tblDhr657OG6uMf21U3MPHDcbrur7y/
 TtwuwAAAA==
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
 tools/testing/selftests/drivers/net/hw/ncdevmem.c  | 49 ++++++++++++++++--
 .../testing/selftests/drivers/net/hw/nk_devmem.py  | 11 +++-
 13 files changed, 238 insertions(+), 43 deletions(-)
---
base-commit: 518d8d0199538a4d6d5e51064044ece71e0c42e7
change-id: 20260602-tcpdm-large-niovs-56523a3a1077

Best regards,
-- 
Bobby Eshleman <bobbyeshleman@meta.com>

