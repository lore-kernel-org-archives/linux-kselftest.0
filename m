Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670DB35A384
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 20:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774385592; cv=none; b=k5VWxQE00jeLVXnu6x2SpXAOvnyghFVElgN3X2KsdaRpcDVaj6YgsMzVyPpO+hVi3Md0/By6U4gK8wdD9Z5fboykRkXCJlGb6ukC0oaV4s0NR/ZPhkxLkWlRqLtGhNgdd5R4PpSxwlgCh41FOknLbXBAzEsswcoZUnBuCVXWU9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774385592; c=relaxed/simple;
	bh=MecEpZvlRBPcpBi8sq+iqUvHanol5HuJ9vfTFHwBoEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hn/Kj41qsornRoo5knQTo7gydjXI6lYdW3mhcT4l/ePDcifYvGkdrRS5nyx+rFSa0rX+7jyv5tHgrw3SxiAR3rVXROPN4U0HVQDAGM0R/6RmDYeh3UgoK84v2ewdkj8P9QgBD216eT5Dlrgu5+YjevB2BHszcYimk7jzUfa6rhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MeVZW3Pm; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MeVZW3Pm"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-67baf20e8c2so1760228eaf.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 13:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774385590; x=1774990390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqQ3x3m7rF+rvEu9cT7z+2urBJztBsKv9f9L3zEtIa4=;
        b=MeVZW3Pm1xg27UmJWLQUrUnnHTY280fP2MZ6ucy6WffGaQsdsuUKBjIHsMWdvW8Egd
         ocJGMgPNvbkBAg3/OMnIkQlw0u5uu35My8NmJpo9r+N0Uvnat/tq0eVUbnZ1P4s8zidy
         05ufdadx5Z++tn4EolJW6JgD/gWOIDbbWsGgPsy1V3lYgl7E3P0FoWhQQm8BKN9s468Q
         yAYPSTm6S20hFefnbbI/1R6WJV9USGU9O/1Zgj25KATffuHputrdn148gYWoI7HzgcYn
         upEGNX6xaXYzvTHQfvRUjrrjXrHYZkZepHfUzxW+btOlwuhz5FRBbugqDO1sredMRgtZ
         AWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774385590; x=1774990390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WqQ3x3m7rF+rvEu9cT7z+2urBJztBsKv9f9L3zEtIa4=;
        b=pKhpn8lw9g1KGWqqHuk6pHF8+Z8C7Z2bhY3OdCktycAmv1o+YLvSHwYvei6sj1DAcr
         0WpWOu/6YqcHRYB1X0+ezRsrommhTyHvXO7axd1m/jlXEF0opyuTBOKK0QwKznvzMmQk
         ayqlfl/9qPSy5QKYNFaEvGK/zsyMWacSRbWqpT//ht3DfEjNvsLwMtilcAxJl1cTvBVL
         KWj1gRt5uARMrpcBJkreHAjLIiLvVzxBTc2l8NcJjEd4cLJXAP9OxwEXwygI9HIZlbEk
         sGAmtudrKXZQEYNJzgg1qK0O50Kfrbo0nxSk01qQwxXrBo6dhhzJDXawvGUzWptHJ4OU
         SY0g==
X-Forwarded-Encrypted: i=1; AJvYcCUa8bhYF002czu0xm3YBGY19AtHKe3JbHFxlnl+oT4cy6fVGe6aF89uIoez7pBauh+/yuFRK9ZDG3kjtohtmRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkDlSETkZ6pPzEVxtrAyiwEHdtciIHbWyO1QILFwgibe7Zw+iq
	KQpWHUQoyISmioH9XvR/Hyri9cu1IeGdrGmAdOQh/ZHAyWviyOfAq2Gb
X-Gm-Gg: ATEYQzzOBYGPJnyElQpyWZWS3mS+R5JJtCbddUIc53G2SdEqjPtN6k4fNwLMRDrGSBs
	G2wi6QMwqf6bq0SYkSvVZfQXB9ABYE/Hy6b0NS7hIGYo4/ZgdIT0I/VmzRRpnNfVyT+gfY1pfRl
	nxIqSHtKNjDSPwriMVkWjpK4P3eCN/z3MC7IdmSC88I1CJlxNoNWK2jK4OijS3BRiQx0PuzycLA
	la39hvzRokBohurnV7S90CIWT3dD093o/J4je4DB3PXmBNS40SpomEAjWit/5ZV3MAanuHqkqim
	S6dIgjaJ8/ZN9NbnbDtFdQAqqIEhxLdRkFFRZ3NZqzTt6BdEtg4xfZhsRN5cJiA75raF8sjAcoU
	3Mq6tfIjaB6KC0pXQSmVfQ4pPNGaztuRXUQz90ZkM6XYt0cDTUV9vKugzROXlsjoI51xEemIdtN
	GfwjWNyFCidn2m7N2hslwdX/e08ZdfITbk5N7rFoJEa3e0rO8BuivZiPN+1eu8DlFpp4pHAhUvg
	xEq7P+q8cVLsiafzb22A/xqSX9q+BMKiCHlha/J9g==
X-Received: by 2002:a4a:ec4c:0:b0:67c:27a7:8c4d with SMTP id 006d021491bc7-67dff55c413mr774454eaf.48.1774385590432;
        Tue, 24 Mar 2026 13:53:10 -0700 (PDT)
Received: from Atwell-Laptop.. (108-212-132-20.lightspeed.irvnca.sbcglobal.net. [108.212.132.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67c252c91d0sm9125161eaf.5.2026.03.24.13.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:53:10 -0700 (PDT)
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
Subject: [PATCH net-next v3 1/3] selftests: packetdrill: stop pinning rwnd in tcp_ooo_rcv_mss
Date: Tue, 24 Mar 2026 14:52:59 -0600
Message-ID: <20260324205301.1361608-2-atwellwea@gmail.com>
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

tcp_ooo_rcv_mss.pkt cares about the OOO SACK state and the resulting
tcpi_rcv_mss update.

Its exact advertised receive-window value is incidental to that test and
can legitimately move when unrelated rwnd accounting changes adjust the
ACK window.

Drop the hard-coded win 81 checks and keep only the ACK/SACK shape and
the tcpi_rcv_mss assertion.

Signed-off-by: Wesley Atwell <atwellwea@gmail.com>
---
v3:
- drop the explanatory packetdrill comment per review

 tools/testing/selftests/net/packetdrill/tcp_ooo_rcv_mss.pkt | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/packetdrill/tcp_ooo_rcv_mss.pkt b/tools/testing/selftests/net/packetdrill/tcp_ooo_rcv_mss.pkt
index 7e6bc5fb0c8d78f36dc3d18842ff11d938c4e41b..0116abd86093e1920f14d027d34ff5ad30ccaeef 100644
--- a/tools/testing/selftests/net/packetdrill/tcp_ooo_rcv_mss.pkt
+++ b/tools/testing/selftests/net/packetdrill/tcp_ooo_rcv_mss.pkt
@@ -17,11 +17,10 @@ sysctl -q net.ipv4.tcp_rmem="4096 131072 $((32*1024*1024))"`
    +0 accept(3, ..., ...) = 4
 
    +0 < . 2001:11001(9000) ack 1 win 257
-   +0 > . 1:1(0) ack 1 win 81 <nop,nop,sack 2001:11001>
+   +0 > . 1:1(0) ack 1 <nop,nop,sack 2001:11001>
 
 // check that ooo packet properly updates tcpi_rcv_mss
    +0 %{ assert tcpi_rcv_mss == 1000, tcpi_rcv_mss }%
 
    +0 < . 11001:21001(10000) ack 1 win 257
-   +0 > . 1:1(0) ack 1 win 81 <nop,nop,sack 2001:21001>
-
+   +0 > . 1:1(0) ack 1 <nop,nop,sack 2001:21001>
-- 
2.43.0
