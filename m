Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE52349AF4
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 06:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773730313; cv=none; b=NiRoXpc7EexGvtx/DKLbrlVrRgoh8rvnhdB5uYS7vOud6c4x+C0cwrKQ30H9YMMWFGL3l0RGYsbZjfxm3wmmAhtzwHrGP8aIqE2ZzjZYzt9W58hpJonRCXiNCTy28ptDs3SP2J6YOfl4OZbu/TTVz45hX2gmv7ZzH7QsTrmQm6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773730313; c=relaxed/simple;
	bh=evB/X8tNk78bHrQ/MFYt8wsGBWuU1gJMZqIau8s3uvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qUU/+OTlEtMjeqA0+xujPcF6gZmrPo53w5+RSDhm3Wb9X9TvyCAY4rz9SkqH/ZTdSFC2tsK3hE6of0jJ2jV0JUyopU5Mh721I2sMlvLWdOEf5Kqp6d0b1E1ap8tz9qXqj0j9bOHFBLEdHnu69/FJTslXn5+vBK47dnChD1P3HDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edP9a+/P; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edP9a+/P"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7d556c1a79eso5940811a34.3
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 23:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773730311; x=1774335111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Nu5fdG7ljOunxtDElL00N3RnG2qS7orERGCqEegHO8=;
        b=edP9a+/PyTUTASdPoNDae9hEmSrVrYiE3pYK+ouU7XZYN1Uoz8hmzs3m8hFmfksg9L
         PsMf8Zr8y8zP50ENDvqudplXcgjFFma/vRm0koa/UVv2O19db83cOReSAukJi1QLKsqr
         I4bnkrCHkMc/uVs9YI2Y4PCXYlgqJTIQN2w2zoxVYI6Bp7eW/cuT45+/HG55DRviOqVH
         6vvpjRye3yvNvgOTWlAcwRXIFDcyqWKHgTPyoH8Xu26VNXH8LiY61QysGfmk6YSAnyu2
         JPRsAM6pPyd/qpgxf7OtYuQ56lN7gtJnFZ+1NImZMeFckZNFTxYKNADZJslJ+aWlHYE1
         jbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773730311; x=1774335111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Nu5fdG7ljOunxtDElL00N3RnG2qS7orERGCqEegHO8=;
        b=kENmjYjZjBINhYGwnQxvBJYuaLo/GqF6xu9kOvCw8SqdlGWeJn+cGXwl6bfjTVFRDQ
         jcN9/dKE/+xurnNlwB+EtC+IKFbVt0fKS+gLrwdVrRtS5BeJR/uP9skBseiELLBk5YsF
         84B2Hw8T8ZCdllLtOuhJNPSvtV/D8nAPCuVrGo3w2WxB7jUwaT2XLc7hU+DSxXL3ENXY
         9NMR+0+rKgiPrAHS6bZ7BHFUBgZeHgLW080p8efUz/p6iQ8XVYbtBrDDpRksQCznhMxM
         OqMkTWxyjiECEcHlpVFVn8V6a9NpDqWBTvncYE+9sbugxWRe5ZrspuFM3Quj3nERsp2M
         daIw==
X-Forwarded-Encrypted: i=1; AJvYcCVEtPNNzNOMEUS37/iHhiWKOtQL/xvV16anubNIdwc1XiZ49O1CnsceGvowtfZOmWkn+uJxB4p57QI6itBDCaU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQU8ofqWHrvhKXGsih8YMoK2Ji8xNDQri6nSkO0PiREBO5ZV2+
	JxC04vCHMilCRgR4MnWmoyI15+fsYzGKv5Ccl1hy832Q8+vRx0Pm5ba0
X-Gm-Gg: ATEYQzyVN7pgDu+e/IpSeC7GL139eKVB/atTcu+vQbIb4URsYW0Ub1LYlGlaf79GuCC
	eSyszg7Zu4DMGtwtEZY6BHVe15Zsuj7P+OSHxtshxy6yWbM5kwLl7AMzllVLnwr6YnfzXlFlbg2
	dfh+SG1en5Xxyp7VX+5LPvddGvKyPComCHIcob9wCWo9S74Yd4bCqdC7BwNjCHiEShhS6cBqd4c
	IPia+XQWu+77qmM44ABlgnxBYp64HKSIsi0ZrSB2rCsqbY1Zr5TNzqA3oxZUbm6BpZS1MTRG5m4
	SPxQ+5Ny2hpHeYuwBZ34nsra/C/V/CjpKjny3wvxUtkaj3jOg+VqYSOkkI+KPJi0J5DOimFtvhA
	qftS8V8SOdENzmgk1DcRZ1+3n3US8tPy+Ctc7ew+mSl2u5KEROp+r9o0RcoVdeXdVh5dK3BIOXL
	BZc9f+/72XWf4YcinHGWBrhv9tzJk1fb2E/cw+Jt20eW2srUuPfIcagaiVGCG9dKrfPAN+ztv5G
	XvuIzqD+kM58UVmUghjNQEXaDmH4PjuyHxeTT6RHA==
X-Received: by 2002:a05:6830:6619:b0:7d7:466f:b2fd with SMTP id 46e09a7af769-7d78246af9bmr10197156a34.2.1773730310733;
        Mon, 16 Mar 2026 23:51:50 -0700 (PDT)
Received: from Atwell-Laptop.. (108-212-132-20.lightspeed.irvnca.sbcglobal.net. [108.212.132.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d76ae68a4bsm14058432a34.19.2026.03.16.23.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 23:51:50 -0700 (PDT)
From: Wesley Atwell <atwellwea@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	davem@davemloft.net,
	dsahern@kernel.org,
	edumazet@google.com,
	horms@kernel.org,
	kuba@kernel.org,
	kuniyu@google.com,
	ncardwell@google.com,
	pabeni@redhat.com,
	shuah@kernel.org,
	Wesley Atwell <atwellwea@gmail.com>
Subject: [PATCH net-next 2/3] tcp: keep scaled no-shrink window representable
Date: Tue, 17 Mar 2026 00:51:36 -0600
Message-ID: <20260317065137.1533226-3-atwellwea@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317065137.1533226-1-atwellwea@gmail.com>
References: <20260317065137.1533226-1-atwellwea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the scaled no-shrink path, __tcp_select_window() currently rounds the
raw free-space value up to the receive-window scale quantum.

That can expose fresh sender-visible credit beyond the currently backed
free space.

Fix this without changing the meaning of the stored receive-window
state. Keep tp->rcv_wnd representable in scaled units by rounding larger
windows down to the scale quantum and preserving only the small
non-zero case that would otherwise scale away to zero.

tcp_select_window() already preserves the no-shrink guarantee from the
currently offered window, so later no-shrink decisions continue to
reason from a right edge the peer actually saw on the wire.

This removes the larger-window quantization slack from rounding
free_space up, while preserving the small non-zero case needed to avoid
scaling away to zero.

Signed-off-by: Wesley Atwell <atwellwea@gmail.com>
---
 net/ipv4/tcp_output.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
index 35c3b0ab5a0cb714155d5720fe56888f71aecced..bd3a43148a87e891bc632a47ffb5b82c475e8f6f 100644
--- a/net/ipv4/tcp_output.c
+++ b/net/ipv4/tcp_output.c
@@ -3375,13 +3375,19 @@ u32 __tcp_select_window(struct sock *sk)
 	 * scaled window will not line up with the MSS boundary anyway.
 	 */
 	if (tp->rx_opt.rcv_wscale) {
-		window = free_space;
+		u32 gran = 1U << tp->rx_opt.rcv_wscale;
 
-		/* Advertise enough space so that it won't get scaled away.
-		 * Import case: prevent zero window announcement if
-		 * 1<<rcv_wscale > mss.
+		/* Keep tp->rcv_wnd representable in scaled units so later
+		 * no-shrink decisions reason about the same right edge we
+		 * can advertise on the wire. Preserve only a small non-zero
+		 * offer that would otherwise get scaled away to zero.
 		 */
-		window = ALIGN(window, (1 << tp->rx_opt.rcv_wscale));
+		if (free_space >= gran)
+			window = round_down(free_space, gran);
+		else if (free_space > 0)
+			window = gran;
+		else
+			window = 0;
 	} else {
 		window = tp->rcv_wnd;
 		/* Get the largest window that is a nice multiple of mss.
-- 
2.43.0
