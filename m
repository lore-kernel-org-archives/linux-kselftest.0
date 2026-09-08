Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BD13749F0
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 05:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845192; cv=none; b=ofRvJtUtBUl5ly5MyCMwhItccdacA57TRHZBAgH4wBXd10kOS/uxAJSPARVumKvjHn7O5i72ZKINnKROmrDc0dJ73PP3HPN4n4O41M9U47Y1pQ1TvtzVIfKKgZd34zjqRJ+tP1ztD/nVBCnd7mRzgkc+g49lePEESnSt1b5R70A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845192; c=relaxed/simple;
	bh=RMRnGzO8/TbwuDMSTIK1s6BTAtz1u1sEH9VEB/wNKf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EjyYtHnZvM0339loLpDXE+z4PMzExFb8i7wnvpbpskEMZj1wDiUrLWMFg47xYO9x3hcW5NSHGcHwosnVICXtexoGv5R0mcSM9oc1vJEWtm0XuWU6h7QxLKLPF75h6j2Y3ScaBZ7g0Oz5Xsk1k1679IprOlKdCjM4XJq7jWQjCkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lOSS58Aw; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lOSS58Aw"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d032846c95so47465245ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 22:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845190; x=1789449990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zu9iHcXdizDpFWecT5UwdG94ytd2R6b1yXHPwbk4xyI=;
        b=lOSS58AwI1LKQ6Sw3eqZ/J9QQ9aJt0if1zwTvRu3waclLSBNfq3qLlZL+WrqItKevT
         sUrErOTfWWVXDYZzjOBGf+KTRSqoy9dQM0YGnW//+hSsZ6QMT8yDe5gFEcM9DF9LihFt
         FnLqLHpjTOB0OGr9HHQniikaBCXAh9Kbme91cwcID63aXQ3J3nXNwbdbKJFshDxafuI9
         FjQJEREOkv3oui3rRq5dqYXpqJ8q6IcudoKj3XyxY04vEz7xc0SxfBcuuyjuSnity7at
         jvLH30SAHGTgNe3VHVEI6SazPuwAUk6qiZ9C5RI5ccJ9NVu3yPF/rYxPYAEWesBWKng2
         j99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845190; x=1789449990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zu9iHcXdizDpFWecT5UwdG94ytd2R6b1yXHPwbk4xyI=;
        b=oKHiaAYzii7hzj8ohev6OtT+qsnt0a6VKuiFHmKqfOHIqzEYLKjq486hJXiiZfEOhS
         jjudoCXAMoujjjlIljH5L1mgd1jOMhaqZf4WICWnUzODUawq2xdJ9cAOfACvPZ1VwZxZ
         HT+LgbWWa34x6oi15ogfuhX9FSbo7s+/oErDtgqdD2LGNzBl8UqgOlPKIASntONGS0XL
         wyrwwlGAbdImapycbfkVk5R1pX+h9j4OAOX0pSJbfqh8GLSUzwn2fBMYUuyveMzqR10v
         xgJoCmPcAig9Hz1sqI24PBXAFqL7JzBxXxWG2n2nQykiAVYZns76NZV5dPpFToaggz/8
         Mxrg==
X-Forwarded-Encrypted: i=1; AKwUvBw/L2hlMOS5wm14L/X8Oi8ti5/ALptLyj3GKJU32KitZLM82z6IhvTBYCQu6Dg+7+TfTBsmzF4y6ifpe9T0qt0=@vger.kernel.org
X-Gm-Message-State: AFuF++lRkYv+xbLXZtvRY9GeSbX5gpU7Xl5+Y7evkLGOhG5/pnOrNizK
	VcGfc8TA30MrPC4mDpCzvQnJLDQ1TJpcsQKiwo7r0IY4wqtFkWzb+Kup
X-Gm-Gg: AYBFou1ZkyP7EfYmA2gOgQtLRQw7lRYoWbYm3ddf5rjW9LTch+jjMyXAzMQ5nFnOp0U
	kFdRQVEzeg82F/UoAlpJOxy8J2Rh38ziEgeKEcglQeoQm7D5WYq/vZ1PjLiGxLTIWTCP6AuGuav
	NY1p2PwdZUCgOesozaHYvbPB+LnamjUOM2IAQxsxC4B/M73u6tIm+mTTXwEtkEcohajiFzjakLB
	oV/z9imJqGsdu74jwAxMOdwgQ4cOwIgY5t7CP5ZP36NHI3LiDdZ8Li85LCpa4iIF5pv9Tinb9Sn
	RnJyGTGNu3DmPD6VcLul34BlhZVAM9cPdLy3o+prK8wxAfHOMbvDflWLkMnRn/RVOayJi8QGv8X
	/Imbj56N1tfKa1LUBBCh7cx+RvSAjmSkWceMTsp9cfhz8KD2xpz8l6LuXNqWWHgPNtm2eTfbwlt
	nLeQZCdPBXcdw3fAUg/dx6GNpADwnQBCYeS9i41AP2o17FxiXT9DA9NQN5FT1UEllCK2iecPPgj
	7m0LzPmKgbY9g==
X-Received: by 2002:a17:90b:1d45:b0:398:9bd4:d1a with SMTP id 98e67ed59e1d1-39b262995b8mr40136940a91.25.1788845190456;
        Mon, 07 Sep 2026 22:26:30 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm11720586c88.9.2026.09.07.22.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:26:30 -0700 (PDT)
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
Subject: [PATCH net-next v3 02/10] selftests: net: fix repeated word 'use' in comment
Date: Tue,  8 Sep 2026 10:55:54 +0530
Message-ID: <20260908052602.27497-3-hemanth.selam@gmail.com>
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

Drop the second 'use', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 tools/testing/selftests/net/xfrm_policy.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/xfrm_policy.sh b/tools/testing/selftests/net/xfrm_policy.sh
index 3eeeeffb4005..6294e49a46e0 100755
--- a/tools/testing/selftests/net/xfrm_policy.sh
+++ b/tools/testing/selftests/net/xfrm_policy.sh
@@ -242,7 +242,7 @@ check_exceptions()
 		echo "PASS: ping to .254 bypassed ipsec tunnel ($logpostfix)"
 	fi
 
-	# ping to .253 should use use ipsec due to direct policy exception.
+	# ping to .253 should use ipsec due to direct policy exception.
 	check_xfrm 1 253
 	if [ $? -ne 0 ]; then
 		echo "FAIL: expected ping to .253 to use ipsec tunnel ($logpostfix)"
-- 
2.48.1

