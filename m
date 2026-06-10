Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CC1373BE7
	for <linux-kselftest@vger.kernel.org>; Wed, 10 Jun 2026 06:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781072571; cv=none; b=BrePyRTTbUpZ28kZPTUFkr+fHUXVJNYN489rc7KjhIjYAnjepIiCXd0f1iFsLMbIn0m9jVq/lpjVz2ZbIV3YVBLOVzqaIQ225IPVNEC4RyP9T9YrBJJ2sdhb/ZTLOJCDXo9vfp7ITnHLeXxINofsLnJt29pAKzz7wXuZn7Iknvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781072571; c=relaxed/simple;
	bh=1QyQvAXYVJy71eY5NpUQiaNaMBqlHkLtESVN6Cvr2PY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iv8D/SjrwodbaF974dQKzhl8iSBvboRP5bFWFSuceiov160PXmmV3VAuI31kIgGMECysRU/A8IbOCCrlIMb39EFPtziiuaPFMZ1vwYFK27OZzmwwdIqTiyIqmJcwzzpz9aJSW/ugS+3wK5SC/FCX2e4QwUDdCwS4qqqhurMtyBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=JTJqpoaT; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="JTJqpoaT"
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6DA2D3F640
	for <linux-kselftest@vger.kernel.org>; Wed, 10 Jun 2026 06:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1781072566;
	bh=mTx4NY7qLjc+5YNgdU7ctLoLzFygSrZ11YJM3IKDGP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=JTJqpoaT81VWsAWdEfxFPetuHwCFTym8JB5SJnsuodemHAPQ0IQUMYwFpOz+Jigvh
	 3XrJalR0d17a3JZsE9wsqz1qqf9k6oLLu7rjI51IzS64OrfuOATCt+7gMY+jly7VI4
	 InI3GvR7xJu5PyBoZAwter75i+0t5Py55s8nIXfS0R5pMhcFymxI+z0i7DWnvweRwa
	 beviSoqs/wmvGuCOunCyhohIWigX3mfz/c0KFiTiBdEagbdjdAIQAuSOcmMoGPzvHW
	 lzdxLCLlYSZNdqdFXrGoX2GCmik0XJ0v/+5XUl4ilgC402NJ04k4Kbfi+JrLRKzdkn
	 LsZWE3VbeQ76AjoTLONQ8RSxvVyFGKXCCN38oOmsdS2jHUlGBW5mWWh6KZaOe3ALU2
	 vYI+GfEWoBDJDaRQbPdWPNWiRpo91PmAfM4Gr2lWVwHJzN2aX+iePdrvRjlMYLYl1d
	 1Hp+lXYcM2c2yKQqj7lhvkIMV0csUz6W+j+sdrxyK589R423nb6x45STivnDzDILnF
	 CuJt9tdHqdRgcMKoW5jLqu/s2TWKbmFCFvKiBZXE0rBGJcm6uaI0kjcj1+/OwcDx70
	 f7NoUcjjl1EFeWEQBzzIhpwzqaB7XOvookaWSVQ1EuYZOrqN4cA+LNaflxUHzTXsdX
	 +h/fet9MaJ0Iv4RfxHJ3Pcls=
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d99181eaaso8600534a91.3
        for <linux-kselftest@vger.kernel.org>; Tue, 09 Jun 2026 23:22:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781072565; x=1781677365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mTx4NY7qLjc+5YNgdU7ctLoLzFygSrZ11YJM3IKDGP4=;
        b=FPMzHP0y4AFSlCSaHRyaH+nHRvKscni95mUCPz1Qq5FJO2URZP4XPbWk0f+Xt+ahNh
         Zz0BV4Byy1KpOzc1aRUGfMpaF93yZzSS144F6hGmeEjGsBcqLbaZuvNl+sekPS6vIKTy
         vjClpXuCr0pXunRpaDYjEkSYIQ7je15eWssjszmEqkQRxfd1zGqO0mUcGTt1ih+w81r1
         cAyULNSVSbZiYWQvPzzCg4Wr0Wh7rCWWl33/wyqYYwH7/p4uQCEshQev6ABibbTyhk95
         8SklTYmPI58OtEvF1QrKcZOo3Y45YCWjTXlrKZvpdE620lOHvFrj+4f1gdbL5mh+A6Et
         +4XA==
X-Gm-Message-State: AOJu0YzHeadtwfj0rk0g638RORhBNefd398zLhgAuPqrt2WXGvHuCdeE
	EaUxWufustI284Qvf2NFVcfmyFfCUWf/hWbCWCDSrcaSBHPmNDwuxObM57+be0b0cD9HQGDbGR7
	DTY5mUb5dh30VZcFmryzNGLT2uuRCoCX09ckCjk9GaVmhqRhAnbXrLwVmrvF6MY1LLgC6BtC5Ff
	9ZWVnJOlj20Yo2geKfSzDta0o=
X-Gm-Gg: Acq92OE/5WniBLB4taOgcWZbsIip/fXYpk41QsyStPqGkeJN7xYqfG0FqVQvu+2zkqj
	mD3dX/CPeYVOQYxiV9D8qqVGyZH8APXWfnparVZU6F3fGIpO9mNpbdR16bzMQpElLYMHzHg02IX
	aja4vM7bH45F+JKmdWFS9qnVtQOBxplqgd7ry8t5g/fSRd7tWOP0AaFMcStaOvHC9A5FXF6QFyW
	4A10ZYCqwLCpWCdNqI5ihqElgMxFQg0Veb/4QSA7FN9pgBMe5Ls3wUUVV7CH1evoeUrjhYM/FHE
	VtD1TmQsyljValB+lQ7myHhhhpwRw2/xc4hr+c58vyoAgr73nTuGVwJwk8a432WSaNBLnczR0Ye
	XvWfbbDy07PtVR7a+d2C7FZSzRAsG1vDU/+1Yg5CQXwBr9vY=
X-Received: by 2002:a17:90b:2741:b0:366:10f1:3d86 with SMTP id 98e67ed59e1d1-370f0b55ebbmr26002516a91.22.1781072565086;
        Tue, 09 Jun 2026 23:22:45 -0700 (PDT)
X-Received: by 2002:a17:90b:2741:b0:366:10f1:3d86 with SMTP id 98e67ed59e1d1-370f0b55ebbmr26002492a91.22.1781072564691;
        Tue, 09 Jun 2026 23:22:44 -0700 (PDT)
Received: from ross-pc.local ([2407:7000:b06c:d300:82a9:bf58:ce21:a41d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37645c1aeb5sm946176a91.2.2026.06.09.23.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 23:22:44 -0700 (PDT)
From: Ross Porter <ross.porter@canonical.com>
To: linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Cc: ross.porter@canonical.com,
	stable@vger.kernel.org,
	Edoardo Canepa <edoardo.canepa@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Oscar Maes <oscmaes92@gmail.com>,
	Brett A C Sheffield <bacs@librecast.net>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] selftests: net: fix file owner for broadcast_ether_dst test
Date: Wed, 10 Jun 2026 18:22:29 +1200
Message-ID: <20260610062230.71573-2-ross.porter@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260610062230.71573-1-ross.porter@canonical.com>
References: <20260610062230.71573-1-ross.porter@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure the output file is always owned by root (even if tcpdump was 
compiled with `--with-user`), by passing the `-Z root` argument when 
invoking it.

Cc: stable@vger.kernel.org
Reported-by: Edoardo Canepa <edoardo.canepa@canonical.com>
Closes: https://bugs.launchpad.net/ubuntu-kernel-tests/+bug/2129815
Fixes: bf59028ea8d4 ("selftests: net: add test for destination in broadcast packets")
Suggested-by: Edoardo Canepa <edoardo.canepa@canonical.com>
Tested-by: Ross Porter <ross.porter@canonical.com>
Signed-off-by: Ross Porter <ross.porter@canonical.com>
---
 tools/testing/selftests/net/broadcast_ether_dst.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/broadcast_ether_dst.sh b/tools/testing/selftests/net/broadcast_ether_dst.sh
index 334a7eca8a80..5e7a8fe23c7a 100755
--- a/tools/testing/selftests/net/broadcast_ether_dst.sh
+++ b/tools/testing/selftests/net/broadcast_ether_dst.sh
@@ -44,7 +44,7 @@ test_broadcast_ether_dst() {
 	# tcpdump will exit after receiving a single packet
 	# timeout will kill tcpdump if it is still running after 2s
 	timeout 2s ip netns exec "${CLIENT_NS}" \
-		tcpdump -i link0 -c 1 -w "${CAPFILE}" icmp &> "${OUTPUT}" &
+		tcpdump -i link0 -c 1 -w "${CAPFILE}" icmp -Z root &> "${OUTPUT}" &
 	pid=$!
 	slowwait 1 grep -qs "listening" "${OUTPUT}"
 
-- 
2.53.0

