Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CAD372EFA
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 05:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845184; cv=none; b=rFqE55pckAfNfS7FLERfea78x4ugQRaggsr02WMMAOJE4FReaoABet2EFU+wBbMnPKNpTIr63OjTsWTSfVsRVVkIlNndtGiUx/01JPDX2qvmWRuG0j27WZ/pMR1wx0gcVf3t+uY5dZboXy4WUbiCp5p6vIQiPkqxFJdTiHbaaxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845184; c=relaxed/simple;
	bh=Wu4MFNvM9+B3qaLFMlJBJ7B2feraxxXczXPfqfNWxOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Su0iU+i8S0OpKYqIc12C7lgNX5BsQ3g250/XueTFN3+RulCi73tGp048EJof9pi8zETw2ayLT36ndADx70KeLuLNEU4ehcy73Xj1hw8dgcEmBXQJr/uacMi8bKzQB0H7oQgVRVMbPo/gP/zDRrRbAz1Qa7pETk8a2xZRC5TlkuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z44fveco; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z44fveco"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so3409814a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 22:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845182; x=1789449982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSn4eHKtRzspZgNVVCdMYZdE8RSN993BlWf0kOF29tw=;
        b=Z44fveco7Kmdjwu0kZEnjeyJqOkjZYgYaveyyw4PqXJhWpJIPJXxtKz7Prbfj+ggRo
         PBET7I1d9lJjsEVsOCxT5st7fhG5bQJ6kCGWU6iSP+3Qw4aZFtvXhofyJgv4xho4p+KL
         LMJsEexbhI03F6syK8xbNXVW//4zr69QcPZ7UQ/lqOpBC4ue/m2DaDdXIlBm6r8qBUjk
         AwsAwyysVubByEEbIw1mT7NSZhGkFw0ZEbJ87DY1F4u5834Tvli+EoNPDiTuVl+GlFO8
         UsGF7Z4oJMrdmzX+mU9ntdt8EV5wwBcCjPjJ4Is+SImHfoU2h4ZEhI1O/Lx9vJ3+P/FT
         le1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845182; x=1789449982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tSn4eHKtRzspZgNVVCdMYZdE8RSN993BlWf0kOF29tw=;
        b=Uf/nMYzYhfWDpZlJBgUDJST6rK74mbNU0aBGoY9Ps6g9U0lGP7uqmSnIKoz8WHowtq
         5462QG7G/2Nh+/iTBXuqZR22QUMTvcQKNw2PqT86fyEdcUWsxpsKm4d/jAGOoz10s2th
         Y7EC7HFeAcYD0l/RW6OwixBmojZHGva0gT2d3Bwy0YAbhpssKI8Yw3/5GdJW1NOku8GG
         iMHZFoZc7DsuUgq3dzVq8LVKuk0TQHH4b5KZ6jj5L6GbGEfBJms/6+gSysSMmjBYke1s
         VYfrqLIbil94U5UlWaDmODjR7AlhMBl3lXn9sVOgkFrF2Q2nyFIEPxSnWbft0DOsQ0x5
         mqUQ==
X-Forwarded-Encrypted: i=1; AKwUvBy77Xt434nY/HwaNQ2RjWARZPQn6AIz9PAfBPTt6wtHlcF9+/vD2CvPre/Hkgz4Yg8YydpkK7dO8enPZn1NEPI=@vger.kernel.org
X-Gm-Message-State: AFuF++kZWPxICfEMuxKHuwZefCbcZiZTgEbPvlblLtrZhU07lUQbMXL4
	RI1eDdRpGzQRzIve8kVq0V912LxyJHMBebZ7RgZcMlgGAvl54DxA/Zzn
X-Gm-Gg: AYBFou184j+7SR/hQdjSgrZJrsSZtBThKyYdEuAPQB5XFPLsctmmtwYatfmpDrZhJCn
	qKLeYGccr0DfTYTWIzhjMK6MbmC/H5V0L0RoPXP9Jq/SgRgGLv70kJKAop8bjFt+NJx6bVrLeFR
	b7X+hewiHrqMK+Iua6ZXCHC69AAsu8NBQDtVbsWo9BIWOXr62r1unbS6MN3D1bW1DbHs6NhnT63
	Dobm5TsmWzboudZPdRZsz2L72d47cJ8ugadGpQq3M0Cm9MoF7PCzsiAjxS+0nbI1K5q5H3sTW7i
	fzZTTcsU8dkP/iP2YFbXALk5FP3TlyAkWDSZO0y7roRcAH9Ma+W8xRuF5gnachRJkG7r3pK07VP
	at0BRoU1Z1WgvWefENTtMAGNXiEPPU4UGZOAKoLxfP7qBFxk/poaR4J9gHo6iTI9SraQDSe/R4n
	gRle9GCkMc9X6g3OIZFRxsZs5b2bY+YwrhQVoW54Cu1c+NIrMA89e73uwYqnOPPVJ5FKcqCKzzQ
	UgTzEpBuK7LjD/CSfdIP1KI
X-Received: by 2002:a17:90b:2542:b0:398:9beb:a2be with SMTP id 98e67ed59e1d1-39b08969b5dmr36864640a91.32.1788845181942;
        Mon, 07 Sep 2026 22:26:21 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm11720586c88.9.2026.09.07.22.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:26:21 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chris Snook <chris.snook@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Geetha sowjanya <gakula@marvell.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Manish Chopra <manishc@marvell.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rahul Verma <rahulv@marvell.com>,
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Russell King <linux@armlinux.org.uk>,
	Shahed Shaikh <shshaikh@marvell.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v3 01/10] net: llc: fix repeated word 'all' in comment
Date: Tue,  8 Sep 2026 10:55:53 +0530
Message-ID: <20260908052602.27497-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260908052602.27497-1-hemanth.selam@gmail.com>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'all', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 net/llc/llc_conn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/llc/llc_conn.c b/net/llc/llc_conn.c
index 260460d50f54..4b6fe9a473cb 100644
--- a/net/llc/llc_conn.c
+++ b/net/llc/llc_conn.c
@@ -193,7 +193,7 @@ void llc_conn_rtn_pdu(struct sock *sk, struct sk_buff *skb)
 }
 
 /**
- *	llc_conn_resend_i_pdu_as_cmd - resend all all unacknowledged I PDUs
+ *	llc_conn_resend_i_pdu_as_cmd - resend all unacknowledged I PDUs
  *	@sk: active connection
  *	@nr: NR
  *	@first_p_bit: p_bit value of first pdu
-- 
2.48.1

