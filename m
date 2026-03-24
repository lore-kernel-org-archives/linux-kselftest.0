Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF76635B631
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 20:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774385594; cv=none; b=bUzIgOfxN4QJ4eE2syoAErKyGQLq/MMq0SsgEI1xt/HVa0tz8X4dAAjqDgj2cG01cZqg+3qISP5+V0yMJXMYU2+rhAKrHitoI95ka6O1pxOWfyDHpcDyNny0Is970zWei5KkL+lubiV/4KMhDXhpsNgPsdVTYA0EsuZqrr/Tmg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774385594; c=relaxed/simple;
	bh=4QGpcwp1qxPVf6ZUcecn/0yfhjD9Mu5cjlL/DeSgN9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q4r8Kou2pOFX9bdyvGTcs/ymZssHKE1a7BL+axi5D7wBD/zCgXB/uq3wdF8l7KH1j9wxgoNwRHb0spemT9JRrgU1P3fG+dYiMZ+sYUAuTK+aa4ygXv/RKj8ugRWLTEZJvZRev3xhHerMVkYdYf1Tg+ybthxMK4SelaikZk15IQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxkmaBfi; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxkmaBfi"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-67bad873c3eso981628eaf.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 13:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774385591; x=1774990391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBlpY7eubv7wZkuI5bb1efaRXZw3P7J6opPPvgxaNtg=;
        b=mxkmaBfiiys8Bxyv1jLPrcyliG/ecgKNNJ1J+m7TW71vVzX9cWmytPhu+6OVwnE3e8
         MyrZIV/B9MNEEBbAcuQg+Id4eokapaXXU54U/AYcPf7nvklixqEwmRbGBLICqq0Zc8QI
         qOyBHiUZ5FaYcw/GM4op/gnV5RBLERLpfIewwa02qrtsu12YnSje3yLTGtN4odoo6gor
         EnIth+NejuoivYyZccISs467oWk2ywisEJgnKkFXcrOYiJ58kM3FrmXEARrFJJ0F6c/D
         sgpE78gr5ak1ANM2TrTUYPxRZW+JZ8sB4k+P66tV8Gi6a9OPYC7Flb1VWq6EK04dOOR4
         2M1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774385591; x=1774990391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JBlpY7eubv7wZkuI5bb1efaRXZw3P7J6opPPvgxaNtg=;
        b=SAUtAHpmGuiL0qODnH9GlFG29D52FMoSADife/kROFGBuR81rWAwxzvjKbTpRm/w1s
         YCqRZdG7lccWp6a86VaxmvJRRNnkvbjRtUEwAMH0wu/oaA6UeFee4LXoskH612eRu4wo
         rzTXK5W6b3uZ25tzJkR3+HZy04msqKZCofvAc4E07Il31TUhVvlvibOSVTxUqwHQtcpB
         M10tGFgIiPnYVHM5+iOY+lnbAR7cxoCEUYJXkH7zy79a1Gd2WekcBswfASKqOJLjRvry
         LEfqWwM3oXTrr7Y57H3fPlmzQHxRrOra7gOUN24ZaRBCc+NKIYKYgK9lK/O3bKFTrMuf
         CPrg==
X-Forwarded-Encrypted: i=1; AJvYcCW503Su8UH4ycoPDjT+mL3OYZjm677tmY+iBx7NW0RCNOzT8CKI7xdKY8ON13A9F6VHe6h+OGFao2N7wcaxp0U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw942p0TmYfOmDEk9e8zgKvXGZnCCkhWXRVkQJNuivz9l3OOB0S
	zDmpjlN74NYDxFWLjmTtC15/KuulPrMYqTD/QD83M1nvtF2DbyVc0GEQE27TUIHi
X-Gm-Gg: ATEYQzz+KbFM7ND1DNRW8dR/pJJ4GXlIY3mj90sj+tdR5xJs6QL563MoAjHH8z2SGdO
	73ol9ktZ5xVKHo70QBeuK4geIrpWGfvgkfFXP7GMPp1C+7ZnI9gkcxj7D6NM5sud3CkDpL9TYnH
	8FP0UmO/88kzidy/9G9g4HrNAdl7mwlWGTvi8A1fBQVGvbNgAgf0sZz+3HdViF67aNsm4TkIGo0
	3fgsgGBDzXFUpNxpoH0kJuS7If5mxuBLNycoujaFjW5T/tzgbMaaZ2TN/MwIBZByLVGZGww0vEd
	KCGZhCirbZ+bRo0wBKeEGjAfFe0W84TszRiasCRMTHmdl1efPFmRfJQi/1rbZjadKl2XbXpy6mQ
	cdNliyp05Q8f1LnAqXtk/BZPnoua1jc7bHhJ3i0as90QTVK+E/+UNARgciZ3EzRyphD9y50uQYa
	zH5Q1nX2gbsmFpDM6bGqmwnGDIP9mUYrl6kpyB4dtUpMo3tuFbR5HTVo+7OuZMx5iUXBLTbOb6E
	fDBgNd917BN+J5YQYzQZw22HjBomVEEqun7MJ4Wfw==
X-Received: by 2002:a05:6820:4d05:b0:67d:fa1a:a660 with SMTP id 006d021491bc7-67dff5142ebmr685123eaf.41.1774385591560;
        Tue, 24 Mar 2026 13:53:11 -0700 (PDT)
Received: from Atwell-Laptop.. (108-212-132-20.lightspeed.irvnca.sbcglobal.net. [108.212.132.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67c252c91d0sm9125161eaf.5.2026.03.24.13.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:53:11 -0700 (PDT)
From: Wesley Atwell <atwellwea@gmail.com>
To: netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	David Ahern <dsahern@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Simon Baatz <gmbnomis@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wesley Atwell <atwellwea@gmail.com>
Subject: [PATCH net-next v3 2/3] tcp: keep scaled no-shrink window representable
Date: Tue, 24 Mar 2026 14:53:00 -0600
Message-ID: <20260324205301.1361608-3-atwellwea@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324205301.1361608-1-atwellwea@gmail.com>
References: <20260324205301.1361608-1-atwellwea@gmail.com>
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
v3:
- keep granularity in signed int space so the free_space comparison
  stays type-safe

v2:
- rename gran to granularity
- clarify why representable tp->rcv_wnd state is required across later
  no-shrink transitions
- clarify that this series still intentionally leaves the smaller
  longstanding non-zero case unchanged

 net/ipv4/tcp_output.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
index 35c3b0ab5a0cb714155d5720fe56888f71aecced..5fc0e0d22f10bf56ece1be536b75013768112acf 100644
--- a/net/ipv4/tcp_output.c
+++ b/net/ipv4/tcp_output.c
@@ -3375,13 +3375,19 @@ u32 __tcp_select_window(struct sock *sk)
 	 * scaled window will not line up with the MSS boundary anyway.
 	 */
 	if (tp->rx_opt.rcv_wscale) {
-		window = free_space;
+		int granularity = 1 << tp->rx_opt.rcv_wscale;
 
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
