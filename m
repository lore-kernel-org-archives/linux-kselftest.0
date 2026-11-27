Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774969;
	b=zbrl96tcbss2zEpdGtd/rPR3SgYfod2fkzlglZ0KUVdEL8cVMsMcyUroveaq8fNv1HkY
	 f6VZkJkdBi7u/o9U1iyUEA5O7QOi4x1EG4wTdXYwvsPanxQz7FJ7I7Vd+XM/G9C/I1AX5
	 LXQtGTiR3nZBy+lyNyMUM4XZ60VCzAYxwNEO1wIWZkTIdRgmSX5Z+IA+cQtH+fy3nDTey
	 GmnUupjbSPWlHfL4msqufynGvWIRHhZ38PlLr6zXIuTvPNGPXoZD9XFeGaMcs3Cip209i
	 k8A9JqD/4Q7qClTNoMpExYQXpbuJKzx1TpLo8fWCh6DAKzJFHApNXWztNpKoEjywRJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7jTZ/KAYP4zd4AjB9WmJy6KqD+4+vtAh077IXDg85bs=;
	b=D55LKM8EKuDPrt3HDg6CA2QR3xpinwKWtYTZUb9FHFT4/qxlPSj/YomsB4vLsfb8GKx2
	 +WcmOgzd9knkcWlGF3oBJQ1ljfvQVsQPJpfVpCJgurIv5IuZjncCTwn/dLi4HMa64T8s4
	 9ViSrgH6khD7BG10t6CcLTb751NiGc8i0vcTqktv2LqDQoJhh8vvJadDrmS/H6KXHUgJi
	 Pn6bsPNxiM45MlSYvPjjMUzduZ1Ky0RyyIVTmP3T7GqhTYnMG12UwQDMLNUMghGI6mt5P
	 pGYic2Hc2b7riVK3I37zZyAQnFH9Apf3Xe3nTIVvoHxHK7QLERSpD5tCeIys7DxxrSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BFPPTm63;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28FB606A327
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 10:22:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E28FB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BFPPTm63
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6ba38c41804so9452547a12.3
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 02:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774966; x=1796379766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7jTZ/KAYP4zd4AjB9WmJy6KqD+4+vtAh077IXDg85bs=;
        b=BFPPTm63qo/CUmMUDO1sfX5o0I/6GwrjKcaJEq+rQWc+u3CQzW7axT4++sgiLHziHA
         lUiWtEHkhcq7ZCXOkv7AgWNa40ikJRDt6AJJaZOP13WNhfen5KIC22dJyGBbxHrqQsPl
         nriNVshxLF/yFFNUeCEVs5HqtcN+Jd1Fgkotx0M9QHnw2VDeV/UewNqSZZ59gv9irx3A
         2c3hZqPiO3L83M2EAE642cxPNtJpQpGL+f0LD0DGgQYYzfedsvIFik/zrA3F5dKx/IlL
         CmIr2VkXUGRh1asp3QgZlIAPuFNZIBd+CkzRAvo7XZWBVX806S/hOhZkPdh9j3jreGzI
         KvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774966; x=1796379766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7jTZ/KAYP4zd4AjB9WmJy6KqD+4+vtAh077IXDg85bs=;
        b=SYUViSDLAzu7HxFqa/Kbk6fApqZ1LfO22rngKzHzf4QjlAAcPASCZY6IGue9ad1gPh
         VDgKq9uz9Z5nfkbU4p865owMcGZF5PO9Uww4/Q7KoCztunErXjTIUKZiHg+l1ifc2K5H
         DhCNAqiCg9Vu6pN2piKylSsX6m8GtSm94kdOKexT8NKx3paiY7nSr7+AnyWFgxD04dfe
         I5ZNCKNxhQlQFCh4eFWlROKFVGO/kTAZZJEIxnxVECKvg8dHkXiouUtQpintSwMrBttt
         K6FNFYbeetPU3axbxeebQ5Sof35nWjFDRoz4DTjJMF8vFiqs7PBeBUsVFJdlE9n/jVv4
         CWNA==
X-Forwarded-Encrypted: i=1; AL+hErEnec8krncx/Tj8HwqvBcM0wBuiZLA+YzF9qXHyYglE+b2iCPf7jITTylZ5VCgUUaWtTggz/UEiqDcE9vx+72U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kIHPlShuCRNNLKGTT9ZkL9dxXVs/GDSaF62jenorTREepbV8a
	M5SRiGDCsbd0MA1i1xhPaUe/YUTcUWgofTFVkf455yH/vodO7aTXpC3l
X-Gm-Gg: AZFdTZepRfe4/S6sMntlSKOxHovNZMzs8QB/d28yqTkpFvrnq0hJ3uWbmeNgFsNwN6y
	hklUJ2MnDA8ZR8CtgG+dJJMlcR7woFbk/qXUVLrjGtmBxoJD3GsGcVfylvk335cAo8L+9U5iyaD
	HgIxQ+ZxXDd7g309aLABKEc+c+wD8gPUi70Wdi2VhX/FagHltyNfMTjr97kDOiBjL9eG+HmfuRs
	gixbWen+q4UQCoGI1VB7+6DF/VhurijXMwKKcf4Mui80kn03GFGyyOWm859T7Jp/t5vtGG7CYV0
	8Ca180q4fzDt6sOYWQc9/GOUfadxArZ7f7SLmmy5qpCP5Dhq0N3dObnFV2Fe2fB71Ka1ec4VKKz
	IJqGb6+gic8xSDiHIA0x1TghWb4SPZJ9mntL/s3cK6YOAYHIgpeTUBSjzIS9cafFJii2/7MfMGX
	hBGZQBCbfUq56w/iCL0H3TvvfVeU9JE4CGXZiYSwtJiSJwoSMOx2AOxX9idiSGBsHRh4+Pf20uP
	Tu/qyoG3FsbIbq2u/KvOXbNfzVaAsGi8t0Gs4wCaT3WfCxLFTR1AW6azllyKGWgV04d+YpBkJzJ
	d+kwcStDrUaRXLJUTkiCBJ16EA4Ai+MGKzeyooaryFFzOXoz
X-Received: by 2002:a05:6402:1e90:b0:6b7:245a:a509 with SMTP id 4fb4d7f45d1cf-6ba37ebe297mr15514613a12.40.1795774965920;
        Fri, 27 Nov 2026 02:22:45 -0800 (PST)
Received: from Air-pasichndev ([188.163.8.107])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbb80sm10886407a12.9.2026.11.27.02.22.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 02:22:45 -0800 (PST)
From: Andrii Pasichnyk <apasichnik9@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com,
	netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 0/2] wireguard: free receive queue packets on peer removal, and test it
Date: Fri, 27 Nov 2026 12:22:41 +0200
Message-ID: <20261127102243.49405-1-apasichnik9@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Removing a peer while its receive queue is busy can leave packets on
the per-peer receive queue. Each of them holds a keypair and a peer
reference, so the peer and the keypair are never freed. Patch 1 frees
what is left; patch 2 adds the test Jason asked for in the v1 thread to
netns.sh.

Tested on net e9e45fcb6 with the WireGuard selftest VM (x86_64 KVM):

  both patches, 4 vCPUs:                  pass
  both patches, NR_CPUS=1:                pass
  both patches, NR_CPUS=1, 200 removals:  pass, nothing leaked
  patch 2 only, NR_CPUS=1:                fail, a peer and a keypair
                                          "merely created"

Changes in v3:
- Patch 1: purge rx_queue only. The tx_queue purge in v2 could run
  beside a transmit_packet_work that was queued during the second
  flush, as the Sashiko review pointed out, and it was not needed: the
  leak is on rx_queue. The older comment in peer_remove_after_dead() is
  updated, the subject follows, and the commit message says how the bug
  was found.
- Patch 2: CONFIG_LOG_BUF_SHIFT is 21 instead of 20, which covers the
  worst case of the loop; the commit message says that NR_CPUS=1 is the
  configuration that checks for the leak.
- Rebased on current net.

v2: https://lore.kernel.org/netdev/20261126094722.73025-1-apasichnik9@gmail.com/
v1: https://lore.kernel.org/netdev/20261003201625.4572-1-apasichnik9@gmail.com/

Andrii Pasichnyk (2):
  wireguard: peer: free packets left on the receive queue on removal
  wireguard: selftests: remove a peer under load

 drivers/net/wireguard/peer.c                  | 25 +++++++++++++++++--
 tools/testing/selftests/wireguard/netns.sh    | 14 +++++++++++
 .../selftests/wireguard/qemu/kernel.config    |  2 +-
 3 files changed, 38 insertions(+), 3 deletions(-)


base-commit: e9e45fcb6d39bee9325e6a7dca72bd14e82760f3
-- 
2.43.0

