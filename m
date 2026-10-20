Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478289;
	b=t5NscxH2eeAE2QybwnlYoFH1RR38NLluKg5G9D6uiMKfs35VuVB9f4A9bXNebz8duTuS
	 ouJIqD/LV0krOi4QkL4qU7mla9kzsjQS3Cxi6YAVWHAfFxJiuSaBu6FxpBB1SyRouM89V
	 xmjf4J1R3iXR67BdiTgsr83V34ZvNtWFI+JNaoujwiBaXyQrn5mwD/aDsZDjO5O7p17gu
	 NxXNtiBPHA3qx1LrBYQikTtHXwlQ+sE4r0SaGwNZhXSvx3/PFZ6NLcu5m5mfC1TSxv97G
	 JpNFCjg2oUo7mbhnk2WnyFysOWg0nbiU82SCurCLu/RjReBTuwFSkuWbGrT4l+zxTow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UzAZEenc0KxEq0x6RyPzYufxdEkxW9SFi1K+hoFFagM=;
	b=ItiBbhUbYFXp+pEr/ydLw4iYcVh13DZ2qTRZy/tF6Nz2RQFEyafdwaAUAy8AgU8QOeXb
	 /w3j65ClaZ8X0CLxoy8UcZWzAp5nxo+N1UBIAADk1m3Ob4iiAuG65kx0VtBGwzwYMHN52
	 n+FcWxb1z231Yl+zjlYzU7ovSoc3HZjk/tN7BkfntiUrGcsra2wdpmpCNJ9Y9ChZFOYDa
	 DBp/g9S0GGW7Ghg07k0YZNS6Yc/x0e1vJCtbfp84HzvGOf3c9AiSURfXHVBuP/KNUfZIl
	 JLQo5Ln1lwqTzfBjtLmv+BQhTQeZ9F6Ux0MQuX4Hbllny6YjXTpyXd4ubys8Ldb7vEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="KdI/M7KN";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD88A606A320
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 06:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD88A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KdI/M7KN
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so3450095e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 23:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792478287; x=1793083087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UzAZEenc0KxEq0x6RyPzYufxdEkxW9SFi1K+hoFFagM=;
        b=KdI/M7KNAmf+mbjijy9pL7ul3XOVYz1JSfuxwrGvg7QCBlvopedyQkPagbYjz51YCe
         N15kUbT93hEG+kS/QHuwQeHHTOJ7E2HCCehDRXEfDqyIbV7UVklz4dhhcmwFcgBwM+Vh
         KP6rfCjZG85ST4pwA1EhOL3soCxjpgg2GWhhk/5lDqW/zwGF6bSjUqblS0Lv0p0dRtAI
         L7s4sdZfzrIWA9G4PNKwEsTPFm5xfEfkvKvGdfmAw9ctvrbMVsWzGpzikCxtBB0dCaFM
         LzzLtgeCEtMv+3+dxohh/le6MTut5S4AVyrRy2JAVz69h7ewmKTm8GhLc5l2CAnjD93B
         t55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478287; x=1793083087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UzAZEenc0KxEq0x6RyPzYufxdEkxW9SFi1K+hoFFagM=;
        b=VC6i6SWNVpjViMlDwzXz4ELv/suCGkK+Y7GMMKi7RYZASekiR5/xec9iOrt3J1Bp5x
         cM/llkAEtzIJBc5BpKlBvL35cGbQsAIu4cdS4jmvVQhVHLSd8a3G1hJ2nO/JBzKDwoYi
         NMAc9WXW3izJdsL8z07rCh8FC6KWDWh1IPODeYXKkw4DQUSxIS3wkjpw2bAYzrsLO79G
         Hwv/uraFDXZWBpzbgEE3yUcP0PpjxTMK4TNnJx4cmrdqIlKci7LhyKcdQ408+i2asAyk
         j6hiYlqDHJtw/5Msp3SjGdC1gerQCB2QTi3rudpjcbPvytAk9SaMPLg0d0kplSG0fW4q
         Exhw==
X-Forwarded-Encrypted: i=1; AKwUvBx0Z+2MKuBrwgnOXPMhwEFf/I01sz9JcDzODLOezgQSKxJYw1ciNQE0dCycP8hCRTPBsWRTgA7+izFAypffqYo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7RQts8Ex+TEFInlY0IXkBR1ZtFPKKQ+CzadkshX+CUoOpFwp3
	iEZQbiQ1Eda1nl1qB5DS08P1hd5TMAkR4tIQZaNd7ERBMN8Qejd0tCLJ
X-Gm-Gg: AYBFou3RK2vZxBs3ACo6nduaqlWD4Z+KVw5HmAfqsLrNT16mTiluDFgSkhqyCImTWhX
	wI716AHk+FBrYTYGYgBanSKhNhcaBpb1X5FZiM6bK7ZG969qbxHVQqN+k0ohjpeNxLuVuCgJgSi
	8Bfu7uopo3UnSh3wyTjMdGJ4lrf8PkNAomI1sgzr6qPfzQiKz31QlTv0OXXSSEIOqOFJJqDT/dp
	g27ETPk4o4i1qVgRVs3elKtIBuaH5GmsqPlo/dMBOSGfMc9uO3mEQ1XVEbqgbirGzH0vdERRlt3
	yDArUgkGNFQrDzM+efVX2vnRg/gd+dFYZn1KPqneaHQMUeKOnGNeWKbPQASu2ZNTOr3UoG9rvYl
	P7W4YpXE8E5iFn6FHD1rSu343EikL4AVS0WsL4qb/CtvMN6VW8ToXS1AdclXE0rNwDUuV/mYHh1
	Qu3NC/90ZrWWzBcszyyAziDo++X3syl2zBYcthPLpsEf4R80Lzjv0G5DD3kWX3zKekR/t7+U5y9
	MimJn6ecBLgotGy03fgmbFK/hv/+hdx9DQZ33+Yq6Iiq/xD/yf8Cd7eEDhN03fqUr2HLGEDbq2C
	TxJMV6k1biFExFwgbdic19sykkSqwE9KU1oFhENjnAoz6MWXluA2s2w7jeoXLJBD1yTSD5wceNm
	ljJLi1j/t91c/
X-Received: by 2002:a05:600c:3114:b0:4a1:ac66:604b with SMTP id 5b1f17b1804b1-4a1f4c70117mr24583145e9.1.1792478286893;
        Mon, 19 Oct 2026 23:38:06 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9c92-6501-2169-eb9c-7ad3-f5db.310.pool.telefonica.de. [2a02:3100:9c92:6501:2169:eb9c:7ad3:f5db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d820714sm3916393f8f.35.2026.10.19.23.38.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 23:38:06 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	dri-devel@lists.freedesktop.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [RFC PATCH 0/6] iommufd: harden DMA-BUF PAL setup and release
Date: Tue, 20 Oct 2026 08:37:39 +0200
Message-Id: <cover.1792477872.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a narrow companion to Jason's unmerged DMA-BUF mapping-type RFC. It
fixes setup and release problems in the IOMMUFD PAL consumer and adds fault-
injection selftests. It is not standalone and requires this exact base:

  c37cf2824740d ("cover-letter: Add DMA-buf mapping types and convert
                  vfio/iommufd to use them")

I used LLM assistance while inspecting, testing and drafting this series.

I also tested DMA-BUF paths on a Raspberry Pi 400 and Pi 500+, using their
stock Raspberry Pi kernels (6.18.39+rpt-rpi-v8 and 6.18.34+rpt-rpi-2712).
Both passed offscreen CPU/V3D byte checks. The Pi 400 also passed five raw-MJPG
payload-prefix comparisons through V3D; this was not direct or zero-copy camera
DMA. Neither board ran this RFC or IOMMUFD PAL. The Pi 500+ connector state and
mode remained unchanged; the tested buffers were not scanned out.

RFC:
https://lore.kernel.org/r/0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com/

Jason's branch:
https://github.com/jgunthorpe/linux/commits/dmabuf_map_type

This series:
https://github.com/kmehltretter82/linux/commits/dmabuf-pal-lifecycle-rfc-v1

Diederik's RK3588 testing produced a useful trace through
rockchip_gem_iommu_map() and iommu_map_sg():

https://lore.kernel.org/r/DLYLA3WQNN3X.3FB9MO8ZWBQ5@cknow-tech.com/

Jason noted that this showed the same private-IOMMU-domain mapping need as
IOMMUFD:

https://lore.kernel.org/r/20261009125338.GB13920@nvidia.com/

That trace is motivation only. This series neither revives my warn-only
mechanism nor converts Rockchip. Jason's feedback on that mechanism is here:

https://lore.kernel.org/r/20261009124259.GA13920@nvidia.com/

Compared with Jason's branch, this series:

  - preserves dma_buf_pin() errors;
  - publishes the attachment and successful PAL list together under resv;
  - unmaps and clears the published PAL pointer under resv before unlocking;
  - keeps callback state alive until dma_buf_detach() returns;
  - calls dma_buf_unpin() while holding resv; and
  - tests pin/map failures, cleanup counters and retry on the same DMA-BUF.

Patch 3 follows an earlier forced-window arm64 QEMU/KASAN double-free report:

https://lore.kernel.org/r/20261016194022.62065-1-kmehltretter@gmail.com/

The proposed release order is:

  resv lock -> unmap and clear PAL -> unpin -> unlock -> detach -> put ->
  destroy the pages mutex

Questions:

1. Is that publication and lifetime rule correct?

2. Is c37cf2824740d still the right base for this companion series? If not,
   which tree should I use?

3. Can these lifecycle fixes stand independently of moving final mapping
   selection closer to map time?

   https://lore.kernel.org/r/20261016202653.97339-1-kmehltretter@gmail.com/
   https://lore.kernel.org/r/20261019184123.GR13920@nvidia.com/

4. Is the per-buffer selftest control acceptable, or would deterministic
   setup/release race hooks be more useful?

Testing:

  - arm64 QEMU virt: two boots, 24 selected cases per boot, zero skips;
  - x86-64 KVM q35: two 24-case candidate boots plus one focused four-case
    pin-failure boot;
  - a one-defect x86 control failed all four pin-failure variants on the
    expected erroneous successful ioctl return;
  - x86-64 GCC 13.3 built the exact head, headers and IOMMUFD selftests; this
    build was not booted; and
  - KASAN and lockdep initialized with no diagnostics in candidate runs.

The QEMU/KVM campaigns use mock IOMMU domains and the selftest exporter. They
do not cover a non-selftest PAL exporter, physical DMA/IOMMU, forced
invalidation races, or the complete IOMMUFD selftest suite. The x86 negative
control validates patch 1 only; the earlier patch-3 report is separate.

Testing with a non-selftest PAL exporter would be welcome, especially failure
followed by retry, invalidation during setup/release, repeated revoke, and
multi-range buffers. Please include the base, config, architecture,
exporter/device and full dmesg. A full IOMMUFD selftest run on another
configuration would also help.

Thanks,
Karl

Karl Mehltretter (6):
  iommufd: Preserve DMA-buf pin errors
  iommufd: Publish successful PAL mappings under resv
  iommufd: Clear the PAL list before dropping resv
  iommufd: Keep the pages mutex alive until DMA-buf detach
  iommufd: Unpin the DMA-buf while holding resv
  iommufd/selftest: Check DMA-buf pin and map failure cleanup

 drivers/iommu/iommufd/iommufd_test.h          |  24 ++++
 drivers/iommu/iommufd/pages.c                 |  24 ++--
 drivers/iommu/iommufd/selftest.c              | 111 ++++++++++++++++
 tools/testing/selftests/iommu/iommufd.c       | 121 ++++++++++++++++++
 tools/testing/selftests/iommu/iommufd_utils.h |  30 +++++
 5 files changed, 298 insertions(+), 12 deletions(-)


base-commit: c37cf2824740d833b21eb816e21f94836100291f
-- 
2.39.5 (Apple Git-154)

