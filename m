Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8745B2DB7A3
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 20:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784319311; cv=none; b=t92F3fW6mirooazxBgIp0Wwws+aX9rjNsmfixscQdfz7lE3erI2dGHtPN3A3FfQnpJ00+ICMVHLPslSwbkGvm6T2ZXUlePXGZrFzFrIF2ndVp0v4KlJCdVs2HU34TQ7Y2onkesZWirPmCwe8Dxs2lidWcoYGFiddwpiriskjnNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784319311; c=relaxed/simple;
	bh=fKe70vqmsSB7Sbpqp5Pwa9y18Qh7KEsEmm0Uen+uTFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OV0jGc9aMWMGo/DSF4K87mGdxPe60F5ewmMlN5PR8VgqJDUhJmTMmYk5wNEJ7Y5KaccxX1ZEs2kj8V7V9qlr9nrpKzPwqfbJ6LqrgvizuZDZda8OiaC90ing+wCX4GLE3qbAHUH6CfLc8my6vCM6thsrvrx8Jc+3y0IlzSAZPPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DG5YIEJr; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DG5YIEJr"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f307dd9d5so280233f8f.0
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 13:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784319306; x=1784924106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f9VRQMdG5mh4GbPjofS2MPnVG7awxExT5N1bUTExBEM=;
        b=DG5YIEJrcxqgXQuqgUTeekgqShXDHiGBfC7aElmm2s29YVh5VARPP80eTO1OQuziIJ
         n0LXuU1OYUen7BA8DgNSFxf34Tw6d2wgRbNWv4KwqIBSK9gH6TqmWKhMa2AGNxEHZlxr
         WvmX8yByXVD01yVyrWzFFsp4eg1GJdi6LafIv7msdJKpCUGl/Ks4CC3RgaM/ZvR47Tpp
         gGGHRKkxJMniDBGXbiTWrqcCxzNZ4ntjrPjPtjsdViWeN53ljiTREPbuvMvS1wVqMkRx
         LbLJvh3zkphxBM6dMXC8OisEFU29jp0r7A4FfDaf1jOEPWBXM6gfIh0PvjIp0ZBDY5jU
         7wwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784319306; x=1784924106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f9VRQMdG5mh4GbPjofS2MPnVG7awxExT5N1bUTExBEM=;
        b=SH1nwSt/FaFHS7qgGVGl9FL7k46MuHrjRSqBwPhQ6zQY3jfljGSO/ejg065ydcdck7
         rfJbhB2B2V206TpjURqVwNIuOPJTRH8h+jT/PO1h8IaF2MhUwTB+egASfz2oeESY/OYq
         w2G1kNweNx7BiJGmrwCN0WR7wWH6BKUuTim59eThdxTQ4yYF/fl0c2JQ7W1X0C5GlDFz
         nWH56Iee/Rl7OdbMLemw0ELW/1iP0hiHMkaeYzavzzvSqO+HvmHHyCNnH3poq4Ht9bjn
         fTudSgShl50Mz5Usuj4zUUZFpqato9m3om+1wsPfmmc9akfBfJDGm1CeoIRjUV5ANjko
         PVIg==
X-Forwarded-Encrypted: i=1; AHgh+RrbiKUw0wOhPmBaZ+tkyAChWL7Q9Hq933V1fndfI4rvfNWHcFOIPXirj/M5JfhGzNiyLrRf+AQ7mqoWvzm82W0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdag8RZJ5h+3wlpJ43X4QRibZVfctFOmtXT3CMw9hQvnDXY7on
	RzMNSSg7RRgWHeXka8frrgBVceQJODLSLhohvmnkvdKlSGFZ99HkU8+I
X-Gm-Gg: AfdE7cnFKmTYiTw4EwuXZOAlkB86InNHHWilJC2cNGfEG36hXVXElWMOC/es1/M/gV6
	w1vEZyjpvDQ40Y7Od+AkuGkVLDvqAMc2ws2riXAW5VOJYl3yh9H6eM1mwV15UwKp3iP/fel0zoo
	/9p/92zRPu7OUiGbFqU9bAg2XgEDirwxRH9vux/LM+J0lGuBNB9mwpE3LtBsmhsUxW/guUYihfA
	134cpA30tkq18i6iqdsJTeLaJ9cnPo1Y39KE4YNYnPbnCxiEWGsostCZYh3cqGH9THb2SS4mj6i
	IKjqIqIb1Pp7OxC2iLXFjZGTseOPuW6FTFsqC9JwKh+cD05SSMQOSOP4bZtGELq1HAKKiDUcWgq
	XhD1m9+EAwEFTuKOvqZpr9ivPRvQl7Ec5+OXdP7GD6rKyjDvKdIV//QjHEE1MvKYmyvjAk8MlLA
	5/g9IyYweavU5hNwNKNuoKL/Mew4RBYyqg08Oj1DLXYnGJpuEdZ8wJEVkB3ruPJx9Ub5zmTWG4a
	4Mp3UTvGDLx09BbIPvLns2x4+AyNI+pFk4UcAM=
X-Received: by 2002:a05:600c:1f8c:b0:493:f7ca:bd6a with SMTP id 5b1f17b1804b1-4954a50d080mr27318195e9.8.1784319305927;
        Fri, 17 Jul 2026 13:15:05 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-077-179-077-126.77.179.pool.telefonica.de. [77.179.77.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499a5847sm53179335e9.2.2026.07.17.13.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:15:04 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	wsa+renesas@sang-engineering.com,
	jie.luo@oss.qualcomm.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	fmancera@suse.de,
	bigeasy@linutronix.de,
	fmaurer@redhat.com,
	luka.gejak@linux.dev,
	Xin Xie <xiexinet@gmail.com>
Subject: [PATCH net-next v4 3/4] net: hsr: allow PRP RedBox (interlink) creation
Date: Fri, 17 Jul 2026 22:14:56 +0200
Message-ID: <20260717201457.54-4-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260717201457.54-1-xiexinet@gmail.com>
References: <20260717201457.54-1-xiexinet@gmail.com>
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
index 8099f2069a7..88940e8014b 100644
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

