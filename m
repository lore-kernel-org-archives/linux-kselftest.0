Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D35B3AA50E
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 06:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774332270; cv=none; b=a27uRtSISj6dCO065MVhcnmgAeXIby/TvEWK50xKHTg1ByiTIhUn7B8DFe+A1MP7OWfSqlekfQN2euedDGcSZeHmILtEtBbmtTnWXYlt5qAb0rEf9H0FUDKeWtBs0DTU3z0lxGd/BnC4gV3879LQMGUDzwXeVRrWI/w2z0bvl14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774332270; c=relaxed/simple;
	bh=vDPZKHBUYge/g17hzmq5toRf4WT7oxJcyJZTa2pK1Pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N3mt0L342IK7jx0fRWh8f+80ndwJUt60A15I2gxTnal6fyMNsl+epDC8MbiNF6x5FyN5j1O9eTVq8s+IIFgchTVWrW4jyYNbA8cmfw1ZH/L1KoCQS4g+O+yqMPt/3/dtlI3Q1yaevZq5p68dDe0D2hAZxMFvqRIgsmfg4s+m9gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcpDzhpv; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcpDzhpv"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7d7eb85fb81so1006729a34.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 23:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774332266; x=1774937066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdUAuQeuJDXiY6t8B3u7gtUDmCHorI1qmUGWnWOYpWU=;
        b=hcpDzhpvPmhdFAl6MmhNCFrPgkhxrY1TUjfNMCVwhdI5v0o2XjqDHLuWXWhSux81T5
         phGLX1MQMrM4L3NDqBFcvfJds1JrpdWystuOuA0EQXaa2MSzUcdy/m7//32QJns2Ih1/
         7MJZ9ZS+YugO2rk4fFM+oHn/kc3xwqBy7Q5jyfBNvpUDnhGPsU/631hFoPsfBBK0c8Jb
         m97U2c8hmQw/Q7XNF+Dr7EoI9UF4Bp23LLKxiWDXt3/vK+WKUCoGbyEARIomzAo4iSei
         7OPCk+mYMINIO94vnpa8K7HBOEdl4TyzX8SgsOQxUYYB1MlCAD0QGtHz8st8NiIo+lt0
         ek2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774332266; x=1774937066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VdUAuQeuJDXiY6t8B3u7gtUDmCHorI1qmUGWnWOYpWU=;
        b=IfeEHE+Ip/Y26QcBoHXpn6FljgcSrRE9nqTOnvG5tqf2ezfetLUp2NAE1rM/VmRr0C
         ItDWBLdCskmDwr9ue9YOR76S9rA93cAn+XZHnTdDQ9h/IseRrvV/3FYM0zgL/2lLrzhA
         4NjDhzdcfVFFaIB7pa7DXe+9HftkSgo3dOBjKDHf+Edsx4Rcr8FkkptqmZ1b3K6RiIBs
         ajJ0fnbz/Cs2dSHRajrPS8j9LJxl2XRu91kWdJIidKTro35r2nHCDKleb+XSJth3oEAC
         jTYlmUXzbJxkZliGnG8aMgImfG4jnk9eMPcl/PgN52Kg/MkrU7NTy/XpCY+PHTY/xgtK
         pPnQ==
X-Gm-Message-State: AOJu0YyMgrn4azsyyhVyDiCt3VEdIZLjjxhyWxk9CapLveiA5NKprbjd
	OE45zCOJLsF2WKAXGKO5ZDt/SMRtEMXpnVWjJ6YX4MjBup+NUR5RrINg
X-Gm-Gg: ATEYQzyMWKSXZ2RXfWnZQ9wsvb41ubbE10Qb3ViJaTRFHwLOFzAVF7rVKOTzRUUEB24
	icYA9HVeSR8v+mdEJ8IT8eIfuESUoVOhJVRqHkvJu5zWfEjIr4oAsrJecBOakoRXdMVWmC120fp
	OhyqLs2riCfLR24MH0MfQvDD+i6o+OzrwRGtUsi6WIZsoz+Oxt8+0zpNkn4RRxwhsvnJ/4h62Oj
	+v1fiJveaS/WPaUqPVVmY1ZX4BG7Eyv60hhAPtFp5VbYxLmtHJCM2w8rExocgHqj7PThhZk66Aa
	JsbiuaJNxA/sSjoklqENQ9DfmfVU5sm6jD+vjzWuo/gU+QmmrZEqtGoxI9/yaPLZ16Td9R/qsYK
	5B+3WKqo5Yk20S7a/oikkbh0lmoAEBgWVFw7OG2t7GJe6dtrosbGHmQJvQMiYlRVFTw/pTgMDBZ
	yUiroAoWkMoZBPBE+EB0cclLbSUxbhobxsPaKHSqUi4bP+swNm0jvKtPdu4cX5vCGWWYV5PMdoE
	NNo4aKdMVTTR0iAMLc+mGNk3v+ay3b2ozCz6dSsXQ==
X-Received: by 2002:a05:6830:82e6:b0:7d9:b0d7:ffda with SMTP id 46e09a7af769-7d9b0d80e91mr5744843a34.11.1774332265864;
        Mon, 23 Mar 2026 23:04:25 -0700 (PDT)
Received: from Atwell-Laptop.. (108-212-132-20.lightspeed.irvnca.sbcglobal.net. [108.212.132.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d7eadcb757sm11429957a34.15.2026.03.23.23.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 23:04:25 -0700 (PDT)
From: Wesley Atwell <atwellwea@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	ncardwell@google.com,
	kuniyu@google.com,
	dsahern@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	gmbnomis@gmail.com,
	Wesley Atwell <atwellwea@gmail.com>
Subject: [PATCH net-next v2 2/3] tcp: keep scaled no-shrink window representable
Date: Tue, 24 Mar 2026 00:04:09 -0600
Message-ID: <20260324060410.1137199-3-atwellwea@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324060410.1137199-1-atwellwea@gmail.com>
References: <20260324060410.1137199-1-atwellwea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the scaled no-shrink path, __tcp_select_window() currently rounds the
raw free-space value up to the receive-window scale quantum.

When raw backed free_space sits just below the next quantum, that can
expose fresh sender-visible credit beyond the currently backed receive
space.

Fix this by keeping tp->rcv_wnd representable in scaled units: round
larger windows down to the scale quantum and preserve only the small
non-zero case that would otherwise scale away to zero.

This series intentionally leaves that smaller longstanding non-zero case
unchanged. The proven bug and the new reproducer are both in the
larger-window path where free_space is at least one scale quantum, so
changing 0 < free_space < granularity into zero would be a separate
behavior change.

That representability matters across ACK transitions too, not only on
the immediate raw-free_space-limited ACK. tcp_select_window() preserves
the currently offered window when shrinking is disallowed, so if an
earlier ACK stores a rounded-up value in tp->rcv_wnd, a later
raw-free_space-limited ACK can keep inheriting that extra unit.

Keeping tp->rcv_wnd representable throughout the scaled no-shrink path
prevents that carry-forward and makes later no-shrink decisions reason
from a right edge the peer could actually have seen on the wire.

This removes the larger-window quantization slack while preserving the
small non-zero case needed to avoid scaling away to zero.

Signed-off-by: Wesley Atwell <atwellwea@gmail.com>
---
v2:
- rename gran to granularity
- clarify why representable tp->rcv_wnd state is required across later
  no-shrink transitions
- clarify that this series still intentionally leaves the smaller
  longstanding non-zero case unchanged

 net/ipv4/tcp_output.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
index 35c3b0ab5a0c..e5c4c09101be 100644
--- a/net/ipv4/tcp_output.c
+++ b/net/ipv4/tcp_output.c
@@ -3375,13 +3375,19 @@ u32 __tcp_select_window(struct sock *sk)
 	 * scaled window will not line up with the MSS boundary anyway.
 	 */
 	if (tp->rx_opt.rcv_wscale) {
-		window = free_space;
+		u32 granularity = 1U << tp->rx_opt.rcv_wscale;
 
-		/* Advertise enough space so that it won't get scaled away.
-		 * Import case: prevent zero window announcement if
-		 * 1<<rcv_wscale > mss.
+		/* Keep tp->rcv_wnd representable in scaled units so later
+		 * no-shrink decisions reason about the same right edge we
+		 * can advertise on the wire. Preserve only a small non-zero
+		 * offer that would otherwise get scaled away to zero.
 		 */
-		window = ALIGN(window, (1 << tp->rx_opt.rcv_wscale));
+		if (free_space >= granularity)
+			window = round_down(free_space, granularity);
+		else if (free_space > 0)
+			window = granularity;
+		else
+			window = 0;
 	} else {
 		window = tp->rcv_wnd;
 		/* Get the largest window that is a nice multiple of mss.
-- 
2.43.0
