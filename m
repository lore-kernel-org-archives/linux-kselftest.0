Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6AA3AA50A
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 06:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774332268; cv=none; b=hAZIv7o0iiOAww/lJmj6poPxEHSELCv4dGR0d5mnA2DEszFp8WOdkoql5Al930gaUNQR7HZ3bU3IYONnBTYslnPAaTte77tq0kGXusMaiiM5Z7okwB39ljS+YWJmkuReI7Ucy5Zk/hR6XnQLhhmgGhVCTciLZ2iZq3MCmUF8nRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774332268; c=relaxed/simple;
	bh=2LpObmm0KAIiKn6ecbNp9DXCoG8E4+h39lkWKLmCI2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DEKhr4S0usJZ/NI19o3j98PyYn9wIyOff/6amwzXqkS4reo7FRZWz1y9BLVi3Xa9I171Sx5Idndvs1wiUrRyguRZE8Y4l3W84E49Gp72mNHvmkJKdpwU0Nq+fbNGyH66iQsmkNR0BlXGkQ9Tguo7qYggQLgCC2Co/kZz/Jeref0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5ka94dG; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5ka94dG"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7d75ed779bfso685721a34.2
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 23:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774332264; x=1774937064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/zbf91aM6LypdywPhicgkAJndZ/EFSfnS9FO2u56Vg=;
        b=T5ka94dGtnA4sHjcmIg2RoVWZniyqrGQE/AcDSKyAUwHdMapHi0QAhEPRkEawqCE58
         zGzHJcxah8raueTT28DsWPKT/Y0f9UnjQmsowXx/FnrteSjlGKAWiGDbgUlJJuzUdy5A
         BUQlNbPSMK76wHhR+QaK/7Z/TCnyAj4bK5pXruSPiJW8nVVOAU/gc9Ksg6qUIJLgoBdz
         U8+Y5tX8Pau6LQyafT0fMiLll4Fs8R/hIhePNdlvaXHnqmNv0Lqg+n6jMUsQrlLpFJy9
         1jc239h9jAnTikeEKUfXHsOWQaibOQciBCrhHAwVhvu+7uFcj4Q/arZnvV6gIAFzoqHS
         W9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774332264; x=1774937064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N/zbf91aM6LypdywPhicgkAJndZ/EFSfnS9FO2u56Vg=;
        b=JPfaFG6cYj193PjJHOW+1gbdI63AnjNh/PnLFc+lyAgfz3f+81947nj+92+KXlCf4B
         MTPLAJyBeDiqC1ckFn7+bVJ6HYE+cn9V75+1lPxw8LT6bIT//AcsOCBfErF5K+nV7onB
         WTofUF4yl1Dmh/TH4MP9m974pK0/wNNS0Nr0Wi+Dz+UWGeAu3C5Oukm0q1NzCsoOvcvM
         fxfNrpk04CSVeyVh3c6FIhWaOlKUyCK4hTbZJLeflFp2f9x+HpnfLy++gKxD/Hd0G8wH
         rXGGUZej2pxg9wIWBUUQIMVDRIX3zjZ2iImfamZQAGEb5Agr3gEGP5vIKv0i6vPjqv60
         FyfA==
X-Gm-Message-State: AOJu0Yw6cCx4k2x7a7BAzADqh5IcxQnzapyCap9LJTe2ts4me9gHVtqF
	E9JQGRXTpAQA7Jn/Wr7XyVhfN9Bl07aVGEOL9td2qxQAu91EVSIteoGH
X-Gm-Gg: ATEYQzwoIi3OhJfXpZks5GL5/GdOIF7u6vA4F/xGkBVJeKIuXUpvhT6NmICbx+e5kaX
	9NqrYUJxGCALmwrTjsXLBEHKM4vPhYBOYI1ulbGueYRcMSVCEC/NXy35j8t0QNjn9th8+4muEV5
	fIGcEYD1wcOc3+jyjt7WkwvYm4QD1bHBTAqxRFOfXdgGJo2gNZZ7QmquNu/XrMNzY+8EWDAl+9a
	8hQ21rHg4yQB9lwnzvlCdNFLqas5bijWSRrhOkKO4ziVPATuqNDfzzFI5G8zcXdnQZ9YP8CVztF
	ygg4CinRSJxmmZrPJZV/GN6apG9l4PRk9kYRHPR7EZJUAM13+DKwbFAIjeXQONqR6mRz34CvfLK
	2G6lJ0Mu88O+/adFWZG6pC4A4B/PEXB4PbB+cicDCtC+21VMskfp+82k9LCj32G5NXcLSGBAGGO
	d44EveJL/L+RWol4XBshDI8hR+uzhsekKECtcbGld38ppp23+ulRFt/4Hx57gjzMWI06+63nX5A
	KkI2K49ziiqKi8hudsTdnl0aIqjX/jCmhk0jSndnQ==
X-Received: by 2002:a05:6830:81cd:b0:7d7:f15b:e399 with SMTP id 46e09a7af769-7d7f15be572mr9244399a34.16.1774332264220;
        Mon, 23 Mar 2026 23:04:24 -0700 (PDT)
Received: from Atwell-Laptop.. (108-212-132-20.lightspeed.irvnca.sbcglobal.net. [108.212.132.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d7eadcb757sm11429957a34.15.2026.03.23.23.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 23:04:23 -0700 (PDT)
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
Subject: [PATCH net-next v2 1/3] selftests: packetdrill: stop pinning rwnd in tcp_ooo_rcv_mss
Date: Tue, 24 Mar 2026 00:04:08 -0600
Message-ID: <20260324060410.1137199-2-atwellwea@gmail.com>
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

tcp_ooo_rcv_mss.pkt cares about the OOO SACK state and the resulting
tcpi_rcv_mss update.

Its exact advertised receive-window value is incidental to that test and
can legitimately move when unrelated rwnd accounting changes adjust the
ACK window.

Drop the hard-coded win 81 checks and keep only the ACK/SACK shape and
the tcpi_rcv_mss assertion.

Signed-off-by: Wesley Atwell <atwellwea@gmail.com>
---
 tools/testing/selftests/net/packetdrill/tcp_ooo_rcv_mss.pkt | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/packetdrill/tcp_ooo_rcv_mss.pkt b/tools/testing/selftests/net/packetdrill/tcp_ooo_rcv_mss.pkt
index 7e6bc5fb0c8d..0b19de9f9307 100644
--- a/tools/testing/selftests/net/packetdrill/tcp_ooo_rcv_mss.pkt
+++ b/tools/testing/selftests/net/packetdrill/tcp_ooo_rcv_mss.pkt
@@ -17,11 +17,13 @@ sysctl -q net.ipv4.tcp_rmem="4096 131072 $((32*1024*1024))"`
    +0 accept(3, ..., ...) = 4
 
    +0 < . 2001:11001(9000) ack 1 win 257
-   +0 > . 1:1(0) ack 1 win 81 <nop,nop,sack 2001:11001>
+// This test cares about the OOO SACK state and the resulting tcpi_rcv_mss.
+// Keep the ACK/SACK shape exact, but do not pin the precise advertised
+// receive window here because unrelated rwnd accounting changes can adjust it.
+   +0 > . 1:1(0) ack 1 <nop,nop,sack 2001:11001>
 
 // check that ooo packet properly updates tcpi_rcv_mss
    +0 %{ assert tcpi_rcv_mss == 1000, tcpi_rcv_mss }%
 
    +0 < . 11001:21001(10000) ack 1 win 257
-   +0 > . 1:1(0) ack 1 win 81 <nop,nop,sack 2001:21001>
-
+   +0 > . 1:1(0) ack 1 <nop,nop,sack 2001:21001>
-- 
2.43.0
