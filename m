Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A97F3CB8E6
	for <linux-kselftest@vger.kernel.org>; Sat,  4 Jul 2026 23:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783208831; cv=none; b=gKo6D7vZWYTgS/I9DlmTKVYtb/t0KGtZNIS1P39PNq8Ws54sG+q4KGTJ+bfYsIVpOoDihMb5RbgcX8m27xtmFBKz9rtfpmqo91xtq3v2qLt4gEnrV50XWr4CLEl7sDgEg6wmmADhi0hsDArUXAdr5+zVUV54h5WRMoc9T7s7w9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783208831; c=relaxed/simple;
	bh=mOW7N46Q/GBL6wFqSLKyexT/4QDxmkuAh3ixiMKAJ4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sKz4R+YhJLqpxab1gwURx3CfrKAljq72NcFf9ASp6opEwSf64hnP4YaZVHC43deAhotH/zmZMhI0fNp6Gg8EnKhVU9CNLXvTRztJdYN79Xv4KvJItAASNrBL9UgxuXzUuzmlL+m0o39NbIAbz1BfUdDfoMBjgTGsX9RYVCqbD6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dIBF20ho; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dIBF20ho"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493c564ed4dso1953705e9.3
        for <linux-kselftest@vger.kernel.org>; Sat, 04 Jul 2026 16:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783208828; x=1783813628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JD+TaV9k8N7lOgvw5CoTEnXWsbsPS2ZPLVs5YvnIoA0=;
        b=dIBF20hoCMaEombgHAjAre5dzxFpZv8e6DcP1w1jWcBQF3tQytR6Z/Bgri4ChqChVN
         f6fy3bwgunLf7vLwi3Sy3gFhpA+fUDOL5YNIbNgunq+6dduYH9t0MuEmqWmrE4V1xcE2
         XqgVD/3BRZhyRpxXXgExmEygHkRJtgs75LGHocHlzz0b+jgGm5lRrLQ+qUEhVQbGnVMu
         njsIeYfFHzLYng+x1PQcQtaPqsE6alCHJYonMCi6Q2bE5lsuUhbbNKDorQ+i3v6PBqah
         n+d222coHGR1ZFG5jjCFkGJADmL+kaHMConPkR1yCs7hnf++YXiuRLAKNxP2XtXlqEZG
         9Mrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783208828; x=1783813628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JD+TaV9k8N7lOgvw5CoTEnXWsbsPS2ZPLVs5YvnIoA0=;
        b=XgzC6ve216igybLmPlWaTpjXvaolsMJosFlta9+C3UBe0oYncfJjikfc0/zSGIdqh+
         OrteyiG1T+1J2MaXn8Fz2Ch4gURvnIjmnNI2VZVfMst8WXYnScBiHAtlNjFP+7L3E/oz
         pUh3X4lumHobhY4rbFbFszMT8j24EZQE7AfRWAXQdeZ+4lISKCMHFVtVhZkLIO9v0BhR
         aeEwXpRnR2dL6SVeYl10dMA29zHa+gH0qBZrrgNdaYbryxGLYbATFgCIjudlKe6HeArw
         zJRKVeyubB4+AMbmr+vFdFFAUURJ7D7w1e+iSlAvPEFcjFAOPrpF3T3Z/moqOsIeTyB+
         u3Kg==
X-Forwarded-Encrypted: i=1; AFNElJ8RViFt++MgSx/9UeC9v6OXNRVnj6mmn18rwF5WUiQ0MU5nwBv3+p7bp+8Akky6PYyCYi7pp+6u/DAvfXEuNi4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIumiEXDKIJEaPB39Poi6Awgqxc+8ez2Zz7F60kmmO4xa9TWC6
	wv+UgzOLwyqatTer06M8nykPE6161/E5KAmQWJEHiSGBd26Z53/WJip9
X-Gm-Gg: AfdE7ckgF0befSHnWOPgskhAdx4Q5F6tMllQkoFzil+JD+OPvVKoPtKjTAFlLkfn4xL
	voBdioba38l+ZMpISbIBsDAVhnaFotbXX7N2WDZ1Zs1ipjQnoSmGMzmGGmQcAnb+mFJV4uLoYks
	mMpwDKKi19uflRRxEJSgyJNcI9l0VSjq4OKyVYQ4+GgBzg/XUOEWX1a6sXic3UUkKenCAYmEb9D
	6hporOtzk52BbtfBoobLKnVhQz9J//0pF9FGD3a/ptBgRkYA4cwYj30ks/D095xb9aAN/2AvTbk
	GHk6o6ZuUm68Zz5V7f/0+T7P3mV9TZQUdXwCduWsmx585nmZuUehvzJDMMh/+td3suyYkpeKWF3
	+HuImsKxtS2c1Vz9hI6JiNvWlf11jlZ6nhcjLWlB8d/gOmRJfcpSHltfs21ij89ImNWb7AihFO1
	JwbVij5YGL6zeyAHQbyJJlxDTnMMe9sUlmjctHw7iyGywOU0jbXVfMjEyVIgyszTEzJR0w4LtHA
	oqvfbD4depQOc5RxSPkcPXZ0CS6WYMKBKc1opXq1ksnChG/lg4=
X-Received: by 2002:a05:600c:a203:b0:490:b2f9:d9a4 with SMTP id 5b1f17b1804b1-493d0f09261mr21929855e9.1.1783208828517;
        Sat, 04 Jul 2026 16:47:08 -0700 (PDT)
Received: from hpubt (dynamic-2a02-3100-5cf8-ddfc-6651-06ff-fed8-72a4.310.pool.telefonica.de. [2a02:3100:5cf8:ddfc:6651:6ff:fed8:72a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm216014125e9.10.2026.07.04.16.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 16:47:08 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xin Xie <xiexinet@gmail.com>
Subject: [PATCH net-next 3/4] net: hsr: allow PRP RedBox (interlink) creation
Date: Sat,  4 Jul 2026 23:47:03 +0000
Message-ID: <20260704234704.4297-4-xiexinet@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260704234704.4297-1-xiexinet@gmail.com>
References: <20260704234704.4297-1-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the PRP interlink datapath, duplicate discard and supervision support
in place, a PRP device can act as a RedBox. Remove the rtnetlink rejection
of "type hsr ... interlink <dev> proto 1"; the feature is implemented
unconditionally by the preceding patches.

Signed-off-by: Xin Xie <xiexinet@gmail.com>
---
 net/hsr/hsr_netlink.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/net/hsr/hsr_netlink.c b/net/hsr/hsr_netlink.c
index 8099f2069..88940e801 100644
--- a/net/hsr/hsr_netlink.c
+++ b/net/hsr/hsr_netlink.c
@@ -121,14 +121,8 @@ static int hsr_newlink(struct net_device *dev,
 		}
 	}
 
-	if (proto == HSR_PROTOCOL_PRP) {
+	if (proto == HSR_PROTOCOL_PRP)
 		proto_version = PRP_V1;
-		if (interlink) {
-			NL_SET_ERR_MSG_MOD(extack,
-					   "Interlink only works with HSR");
-			return -EINVAL;
-		}
-	}
 
 	return hsr_dev_finalize(dev, link, interlink, multicast_spec,
 				proto_version, extack);
-- 
2.53.0

