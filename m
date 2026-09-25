Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53EE49B5CD;
	Fri, 25 Sep 2026 10:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790333095; cv=none; b=sVkrZa6pbvCAu9znDzSQHhMhKcQ39bI15vQJeRDkVUOqG6N+NpFLQOg58ZpeMLtlabArHI0REDq61kKij5IQWPFyYAiil0wTNiquDRepPlQ/22V91/VXWKnQNaxNxkR5LVTvvOTSxdOwt7SribtRdsHIMCH/gA/mKCcNsLOajRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790333095; c=relaxed/simple;
	bh=qXEOEIA2jN/P8gXV5Njt3pBToPrw4adpGj9iLkIM/BI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ub7aXLQ7rKPDEahffuwEDizIbYFAcd4Jd3YQYT1XtpHTzbxm/mYQN6D9DvHZSNRuzLofkQQEh27Yfl8iUHSoRIclsklKpJ4jAz0k5eDMVhvqsojsZgoRXxJU5l8GWe1GagsqO6MDCo9BgVUSFHwb4p064H/uvIug5fE3BEfg4iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YsthqgIx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YsthqgIx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD8441F000FF;
	Fri, 25 Sep 2026 10:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790333093;
	bh=bleqDftiMRX6Ent78Vjw7qsXiSNenO0yuWkNjJTX5qs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YsthqgIxKB1L4nya2S52A9yDGKyQscnFVpgu11Kx8HaC2dVTuypl1jjO6aS97DOoQ
	 bEFZ1s/z426iKPfHW9UB7cvoPTP/qyEbFJjha0jSKhUILyBkFyMUrb7tiuGOFkaHtU
	 yvbrXIJQbe8bXOT9GPkjTt6zNFBnI+ZQS59gKVFepWk5+srXt/k3NI+qmmLcxqPzE2
	 Z0tlbeTfDGlnAl5nfM2dkrMd2e9v9pJlHtmaXiU7FLr37VsOfdI/2n2lven6yRjiPB
	 EbdlYxK5tQducoLuRN1+svRuoHlIcwzaUV6vcJ/Y2t3Vx6O1tYsSDxPjs7zdWmVWMq
	 USu/lT6gGqsag==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Dimitri Daskalakis <daskald@meta.com>,
	Weiming Shi <bestswngs@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Breno Leitao <leitao@debian.org>,
	Tao Cui <cuitao@kylinos.cn>,
	Pavel Begunkov <asml.silence@gmail.com>,
	David Wei <dw@davidwei.uk>
Subject: [PATCH net-next v4 5/5] selftests: drv-net: Request larger zcrx buffers
Date: Fri, 25 Sep 2026 12:44:12 +0200
Message-ID: <20260925104417.2325213-6-bjorn@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925104417.2325213-1-bjorn@kernel.org>
References: <20260925104417.2325213-1-bjorn@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The large-chunk test always requests two base pages. On interfaces with
a large MTU, that may not exceed two maximum-sized frames.

Request a power-of-two buffer larger than twice the MTU. This makes the
existing rx_buf_len check and data-integrity traffic exercise the larger
layout.

Signed-off-by: Björn Töpel <bjorn@kernel.org>
Tested-by: Breno Leitao <leitao@debian.org>
---
 tools/testing/selftests/drivers/net/hw/iou-zcrx.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.py b/tools/testing/selftests/drivers/net/hw/iou-zcrx.py
index c833535d8a03..5047fdb56005 100755
--- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.py
+++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.py
@@ -221,9 +221,13 @@ def test_zcrx_large_chunks(cfg) -> None:
 
     single(cfg)
     page_size = resource.getpagesize()
+    mtu = cfg.dev["mtu"]
     nr_pages = 2
+    while nr_pages * page_size <= 2 * mtu:
+        nr_pages *= 2
     rx_buf_len = nr_pages * page_size
-    rx_cmd = f"{cfg.bin_local} -s -p {cfg.port} -i {cfg.ifname} -q {cfg.target} -x {nr_pages}"
+    rx_cmd = (f"{cfg.bin_local} -s -p {cfg.port} -i {cfg.ifname} "
+              f"-q {cfg.target} -x {nr_pages}")
     tx_cmd = f"{cfg.bin_remote} -c -h {cfg.addr_v['6']} -p {cfg.port} -l 12840"
 
     probe = cmd(rx_cmd + " -d", fail=False)
-- 
2.55.0

