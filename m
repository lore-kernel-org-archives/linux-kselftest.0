Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A675471D03;
	Tue, 15 Sep 2026 18:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789496516; cv=none; b=fIrXxQl4hUny52SCIvwNHcIksoi08LDrGDJtuYyt0LuAh3GFpKSbGiSzmXsx6QKvsDobu2am11D1IgbNFxziH6g0Bohq+Z6D5E9/5rVsU3XzTmQsrsJO2vkEwtoji7pDEi+2s1kANrUxU9I7oWQ3sCLDEpA1Y7SasEQ7M7DVG6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789496516; c=relaxed/simple;
	bh=9iV88Hl9O7LZDaM2gd46D7VetLz73zwNBDxyESd2SV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hZfVzv04sjCAsPVV98dhvMY2eU4ETnWova0IPBA9s0pDnhL2RYGIlas/WHSOYeAQkK1eZc2aM7pzi31gyeucT3+kbnH9+cSD62tbbnG67juLCU1t4z+r36GNR7TvojABy6AYCT6c7/yf/o+Q1rbpSJb5eIkBkBqlZuDHishjYZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fA77h469; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fA77h469"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA41B1F00893;
	Tue, 15 Sep 2026 18:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789496515;
	bh=jH9B+CxuBDilzrb+Dtnbx6ywilSHSOCZqVIvDjj7Szo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fA77h469KPZwygHT4FnigtSJJ1KSU8Hi74kDjJlUXvxukScVDG8LlZJWCUy7a8jlk
	 40EdEOlDenAkUGdWDr3dNJUIF+Ol9tVaXPjBoMIJfx542BC2avpVQJ6j6ECxllywfc
	 +IYLZna5cxR/nxlm/iox3Vr63H7bpSsyGlIoGm/I2FL9z4oHzSq5ivAteUAiXKrspR
	 UrRrlXqrALaLekl1uOljZerxSVuphLwxr8Hi+ptskQIEh+NsJXcPsE+JN30pnbO/5R
	 W6JDd/6E13acfrPyq/64R/HPGh+N/WDTekOCtjpei6g1R5QWDydxYV9sMzAVatjbwg
	 QEL9kJL1Javrw==
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
Subject: [PATCH net-next v3 5/5] selftests: drv-net: Request larger zcrx buffers
Date: Tue, 15 Sep 2026 20:21:03 +0200
Message-ID: <20260915182105.4162425-6-bjorn@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915182105.4162425-1-bjorn@kernel.org>
References: <20260915182105.4162425-1-bjorn@kernel.org>
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

