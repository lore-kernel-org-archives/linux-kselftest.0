Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209277;
	b=vlVOysNi5HL4PJlkrMVwUtXWA6o0xRzuiU2Gj9/JymOeyM/cN6y3l8FLEBGvA/NVcMfa
	 M4viQQ1irRlvgPFP5R5j4urhS+Y99h1N6ac5u2R9M5w8PtLsJbYSPJwGsfgvaZoC+mko3
	 QFfOkgJ02h6qRL4MjJn9xVQlwNI5rM7ub/cu3T6XauJw2j5cyqSoCoGOIfc17OOE03qOg
	 BvJBmdON0QExCgfpw9dIs4dor70Cgm/kH76IphJt8stYdpY+fX2Z45T9jPZwyMKunKaWe
	 l8NkfFhtC+rk+qqIPP8EA1TxWyI7ZFg0ndLcczqHdXgmaHCnEIeucS/BbKwoSI1Gkiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=q2F+hZ2s1FcQekhq0Mjm8g+vBV5buzDjQcFxUknlCCM=;
	b=z5mC5Qd0KQlemAUdTqqCsIfrJpqPnauB1TzFqpFc31NwrYGQTKbI94ORkM4MdCD1rGW3
	 qNRFfinq37Bh8Rl3jAaIvObWqNnTAWQTrhAjPXwyw50DEo4U1n4qHFfasHXkfxajA6QYQ
	 S3unz74WeRm0b+OzDAdPc+g3Q8YuuGWnfoHk0qjfyVpnhZ9Dpzvi4PNspxeGh0BagE5bC
	 r6dMc47jzxOxGYMabF+VjpuaVOCRHR8dbjI7+LpFMZOCpzXaR5JEMQmFWVXLKbb8hJ65R
	 1Eb6NSNMPoYpSyecS+PCeDc+2Bk0AUgtEGVNS3E/9DwgoF+S8lXcyxc/DxFNsRXHEdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QlyVTf74;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3B3606A698
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 21:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D3B3606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QlyVTf74
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33fb4680717so3378223eec.1
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 13:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795209271; x=1795814071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q2F+hZ2s1FcQekhq0Mjm8g+vBV5buzDjQcFxUknlCCM=;
        b=QlyVTf742k4U/rjm8UAn1WGc4emJ4bOl20MgQT+w8xAtAWUVeOBYs3F9k1SNDIeaQq
         /a2AYhoN4V/bSfcJhf2HHEBhMRyJrVPT3r2+m8OT7nKHJlfRdZNTFVLIx9H7UZAD5+YQ
         dgiA3E6NPwl3ipTAwLmWTMdTZFE3ygR4vQfEDT4+cY3yZvewKUr0D3fvwYEtAnK1VCf0
         7wGYM+LJyJKe4vpdgUaqq6LWRfNmy0FbVlSH7LdSZJrFldIxvXwZ3PCOPvKdt6CO9f0F
         VltEfyy6BUN9QTpAKrSq2J3GNJyGaB+afturQOKnQkc5J4jUV2u6TLS9hvNGVUcqWhZ2
         5CnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795209271; x=1795814071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q2F+hZ2s1FcQekhq0Mjm8g+vBV5buzDjQcFxUknlCCM=;
        b=MT/z7HIppyZwPeRawaofbN2Pbn4R7X5xvER4vkhoc0+mxZkygAppegni23X7l8dw1u
         sOehx2f0aqENz2kzenep/20D74Z4kptpPpE9THW9HMpZeAljQ7R0tRDyjk72R5DBLC9t
         2QST9PCThtvk7f5y9L9ZzxGcJ67IDalPISyy2+gCPhp4qGrH5nwzZYj7Aerbfk8ZYC4U
         /lI6j9HOmtJNVS+wMt8N8XNB8XIbAOrQs3WYqvhMmKxleMnC8cHsq3ye3NLPC30wbN1G
         caAAxT2pfxjVP33aydl0oupHcRvpFdxIOTWDgf0ZlNDvPM6LxfpcHztshz0c/wgnpv/j
         19iQ==
X-Gm-Message-State: APuU4Z+Wx1iDnyZL/7Y1D7VMMt1a6CtICef2i0fKzzxl2PUzixQJG0m0
	KR5ubMKCbA0y5zeTf7ikj8e7FLiHsTOW/5oGUObg1KlqibDGdE4WSgM=
X-Gm-Gg: AZFdTZe8w4LOZvaCIyAWFmtZVQR21P8FQfSMMg3P5RxeQNLwFiw8J0HPO1HKy9uGzdh
	L7vbuOMIiI2rUB9l8o0NeoHD4TDFl58GB6EElKgvzN3fjis4mpNg0wCd1T4CCmGHtPeePdx9dSA
	Kqoj4VAys/a2bvbiKckIFZSVeSFjVLHuQ8pcySylqz3AwkKTpXkN6h/YYDQX+sXwbt7R2P93pSJ
	OPVqEhO45m8eURwYN3H/VYWVFUASuoI68h0stDcd3hn1Xrm0nXi4L8kXY/gRtdr7B2SweMvQ5Od
	DS5NXuvUEoAVcrk3fyRHi5pCTktDu8c1OvcUff7sqemh3w2lasD6bfdtE7Nl3cI1DDUCMeUoAWe
	yrutAJMYW8xmIe2vptRzKo49AaqWyVH473sT5MIaHKYBbtYbFMJjV7268xXw9wTzhpq7LeZZ7/Q
	UNnX0PctWrvVlqA7HfbY9asBKsD9x1WID+HR1nLW5/5jWnf5AbbdeG1AopH0uLoRDPSVsaRI/bY
	A5zi3oOMMg7Cueee18mRU6gBGv4abImQArSLkZKA7NO67cqswPnvlt97U/QHO7iuJGEAIiQb4WZ
	UaGy9TVDQF1+8e2TMaL0GXuAfVu/GNDA42cYurlyJm9dwGSV0Ksr0b0wTC7KExBD86l/o3XV3HK
	38wUmxbjMaDJZMqmFdg==
X-Received: by 2002:a05:7301:a0d:b0:368:2548:c08b with SMTP id 5a478bee46e88-3856f254a17mr4787099eec.21.1795209270227;
        Fri, 20 Nov 2026 13:14:30 -0800 (PST)
Received: from ryan.localdomain ([171.76.222.148])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm13843126eec.5.2026.11.20.13.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 13:14:29 -0800 (PST)
From: Mohammed Rayan <mohammedrah1289@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	Bamvor Jian Zhang <bamv2005@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Mohammed Rayan <mohammedrah1289@gmail.com>
Subject: [PATCH] selftests: gpio: Reject empty simulator names
Date: Sat, 21 Nov 2026 02:43:39 +0530
Message-Id: <20261120211339.79567-1-mohammedrah1289@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gpio-sim selftest checks that chip_name and dev_name are nonempty,
but the command substitutions in both checks are unquoted. If a read
produces no output, the shell removes the empty argument and leaves
"test -n", which succeeds instead of reporting the missing name.

Quote the substitutions so that an empty result fails the checks.

In a disposable QEMU guest, the original and modified scripts both
passed normally. With empty output or a failed read injected for each
attribute using a userspace wrapper, the original script passed and the
modified script failed as expected.

The issue was investigated with Codex assistance.

Fixes: 1d96b8f635d9 ("selftests: gpio: add test cases for gpio-sim")
Signed-off-by: Mohammed Rayan <mohammedrah1289@gmail.com>
---
 tools/testing/selftests/gpio/gpio-sim.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/gpio/gpio-sim.sh b/tools/testing/selftests/gpio/gpio-sim.sh
index bbc29ed9c60a..2c9e354fe9ed 100755
--- a/tools/testing/selftests/gpio/gpio-sim.sh
+++ b/tools/testing/selftests/gpio/gpio-sim.sh
@@ -181,7 +181,7 @@ echo "1.1. Chip name is communicated to user"
 create_chip chip
 create_bank chip bank
 enable_chip chip
-test -n `cat $CONFIGFS_DIR/chip/bank/chip_name` || fail "chip_name doesn't work"
+test -n "`cat $CONFIGFS_DIR/chip/bank/chip_name`" || fail "chip_name doesn't work"
 disable_chip chip
 remove_chip chip
 
@@ -196,7 +196,7 @@ echo "1.3. Device name is communicated to user"
 create_chip chip
 create_bank chip bank
 enable_chip chip
-test -n `cat $CONFIGFS_DIR/chip/dev_name` || fail "dev_name doesn't work"
+test -n "`cat $CONFIGFS_DIR/chip/dev_name`" || fail "dev_name doesn't work"
 disable_chip chip
 remove_chip chip
 
-- 
2.34.1

