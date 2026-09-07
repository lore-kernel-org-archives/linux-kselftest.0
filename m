Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C1237BE96
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 04:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756433; cv=none; b=ois1tgNVfi0sQ5VJXe3rd35nQSzYYSXsWHQ2C/UVx+qLaoUZ0ZqxISIs3lBn0av15SlWeANxF+m2+NSyKaxNkwndffsQXPZ9zbnkFI3HOJkDcus3mMjWEZh8kBxzwnSJJEOueKLGCNgYJKANKIFeEbBeX7WZH3d/Lx4Q8Cyx+1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756433; c=relaxed/simple;
	bh=28CwM7uG1p3vuCzKbtzlq/qDnwNKbf0LJtWSP4H0WpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LiBm1GqkvruwITbEPNu7CBsVJK4sPOA9LLNsFKoqa4RHtt6ozHqnfwqzc2cCRIEF/6F1SDOtr40dfxyIWsMqoQG6tcgbu36NnYDXuR9P5rpuiBCLtYMrDUs8WbEIJjaONfSMcSg5s0lBeROrUBynnr2U/M1FB4qeLKZ+HE/tekM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EowoqGdB; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EowoqGdB"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d71ae3455aso45281905ad.1
        for <linux-kselftest@vger.kernel.org>; Sun, 06 Sep 2026 21:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756431; x=1789361231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HKo7xCAaFCwynzSXE8UAxpEKoPZkRC4FGf6Fh0e3Vic=;
        b=EowoqGdBdKysovNE4nqQo5Qdu/Aj73V6UdiFK1+144eb3yMGvZ9G4aArLMjfmjhmR1
         q8Zcor6BW6lFmqQhdFkAQyxlQR+j7PW5BoVZJmZ8lFECFvYx5sBohUOI1GYB+xvOs73W
         1a72rrVIhPodvyyNGq3X7mf7rZ8haGOzzpSYOIDIEZVYc6WiB1NLIwCVjgHKkdtsDmCt
         fxU9oy00f6vXT7tIKkZGcH3zj7Lqe5zu/BClJsiwYuGy9TFX0vEgLeTKamwKItxrJDWb
         DSj19k410yemh3R4El+ttc8IbmxxldPDN1LYh/rxFidQCbavqq8I5hn4epzugN3szP9i
         lGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756431; x=1789361231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HKo7xCAaFCwynzSXE8UAxpEKoPZkRC4FGf6Fh0e3Vic=;
        b=Y2X4CMZk1DT/hI1fQD+AQo4voSX5QGlVYEsO2kbnYIeJjHla8LJ4OIpfpLZbIQrmsK
         59smDZRKnlImGju/EFI30EBMlnDCPgmBxbSY1jDXdcvxTTN7PLS2/cj80AtAn2V/5iyq
         KMpY0KRWtn/VkuxaX2/8nXHvCIe15o0h/qwY5ho+oHKJ62yWA0r8AWRjkA3ByQQJIddh
         bTreDR++0mR7/sHq2yjJC/kTV6wp91Wsp/LftPJSvyGUVPeFLUALc4Bnu1X2x/LRo2f+
         BMibdeGLYShylek8QTsl7CGyERfS38Zq9HE8+BSFzPtnPgXC1bSRGmwG6OoZanGdwHkY
         X3vw==
X-Forwarded-Encrypted: i=1; AKwUvBy9vEDQnUjefRlbXTALXMFXa8Gndh8CKpPvSBZwAqRrE+LHCdlWwwWDNYY6XLydRGBoZmEv7kLVc46vgZUiKp8=@vger.kernel.org
X-Gm-Message-State: AFuF++laJ93LPjadDGOPt8xAkoRdk19h8ysyf01TmKoEPfH06HzWdf9i
	l8xmh4KTIP9DX3LbHrB76l3sYe4/5t3BDeMxb90GtbDgG86lXkDLFT6I6imlZMxejog=
X-Gm-Gg: AYBFou0x8QOaJ/f7RrU5o9oNxaPwRUjPoEfMtk4QB+W/64u0u8wVug9IeReo4b6FaIm
	NwhGuZp8c/Ciwoaarou00ICs07Vqah6WyfXiFJxiRrOpFznKplieolGIHYHCnf7cVvA4xkHPcFu
	Ppq7WO3XMhJRIAJrZOpxiOxXJgJGtksF25ab1htHcXrtEfqshbjmZY9zCWBYdDIed5mMm5dWkpm
	LHE54Tm9jfH36XClyj3pqFRDGAWjARceT6JWYNuGW1CiD+5OstkpmStlQscRN7+qutz2vMb0xbh
	JfdbSO9rtc/asyRN87Yyk2vlAnNqAFDn1ggnqCLGLTH5eZBEA2wSSpG/8P9Ddk/7DQspoOeBNAu
	u6XpSGIIvMXbhyuaqm2h2gjpYxmjiFISZ0ubFmgUHJFv9L3/Gtqpici7DleGXw6fP4SGNtFBRHI
	xTD4pfzL1grEuLQ3GT6nZ2yWOguwOI11wYTQ9KNNm2uzXOI5CAlGiiQxWoRPkb5LeyLuuxCaU3l
	bYD9WozrIkYiA==
X-Received: by 2002:a17:902:c40e:b0:2d0:cc92:f7ae with SMTP id d9443c01a7336-2db125ce071mr279426685ad.3.1788756430578;
        Sun, 06 Sep 2026 21:47:10 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm37844565eec.16.2026.09.06.21.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:47:10 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Edward Cree <ecree.xilinx@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-net-drivers@amd.com,
	linux-kselftest@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 5/6] selftests: net: fix repeated word 'use' in comment
Date: Mon,  7 Sep 2026 10:16:34 +0530
Message-ID: <20260907044635.7141-6-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907044635.7141-1-hemanth.selam@gmail.com>
References: <20260907044635.7141-1-hemanth.selam@gmail.com>
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
