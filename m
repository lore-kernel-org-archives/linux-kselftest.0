Received: from mail-pj2-f15.google.com (mail-pj2-f15.google.com [74.125.227.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0316C4F392E
	for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 20:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789677838; cv=none; b=KEwvtf7G69qsuUJ1+us+rw3tsVBTCFJ/k1Wg606wLHLjUkU3LYTzd7iC9S0saAGIlO1+cbUD76Ckf8gZFJr1SHjfVwQhDX5ajlq3TSJ7rNT0ug2t2hEHk1johfbMQcZBJgIPQ39zq27s99sjTOnDLrvNDtxn5aBCg0Hu6PbLTYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789677838; c=relaxed/simple;
	bh=3sf9YuBAZ2zv9t1g2dgGBjeM9ZfIN0Yd/tz3mo8MbxA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QHz3dD8vkeZqXuz7J8oUOsFlLXW1qi74xVexRGErDTxbIx8naisJ5nnA64LDHEKxffAoUiXQfaE1MqCughcEJsWWEqmfso+4JSG+K54/KAwChLvREuSEhdJiQ6tQwUg/yeJUYHT8EIp9KSQGupfIgpvJ61iInjuRIN3fcKuxUfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ryFXBWcT; arc=none smtp.client-ip=74.125.227.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ryFXBWcT"
Received: by mail-pj2-f15.google.com with SMTP id d9443c01a7336-2d747f01363so400195ad.2
        for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 13:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789677829; x=1790282629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ia2nV/eyt+q8ysG7SMAINIwAk3HmajymljLtHeWJQM=;
        b=ryFXBWcTYawFB3BGv/pfWTAIDdTh29wQg6jfqCyPuJV0AVPE754oH8c5KPuT2lcB2u
         WvDdv0z11q4lrB9Ul0zcyv6HzN0cMrGVOY+R48cUvjatKoAZhHtJOA3lDpRBZrTjer3W
         ZgimzYwE9sEZw07NDOq/NkrnN/s/Vbb/9zOmHfllM8/JqklzbYog+cDrKhEqbcmZXumX
         fjwn+aNMNiN8vBEBfU5zP0UX+Uv81A8XA+onB6AHk/DFhlUiuGfWWJmwRQUCilZBFl02
         6LLfxI0FMgrGoc0pcJ3FL/i2hDprFh3DIXwBRwbegVujtTWym8/kltGrIthkFl28bVqt
         q7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789677829; x=1790282629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ia2nV/eyt+q8ysG7SMAINIwAk3HmajymljLtHeWJQM=;
        b=1aYjrk/xIUDfy4mc9IAbUFhQJT7N9nDAx3N0msXsLnEBMOTXGg6cF8T9jpxRlvLR8j
         AUbx9zGr3gvarW8qi6lCV3iJ6gmzQ/NzJ0ZVP83SAqqmlRwVDmjGG8rPtgbQXWayr8eV
         Bvp6O9kjhpXJH2Zuh5gUqPEEOk9Ec5TotVVocmxBX4teXYaogvKbdaJCon11luKlXi7n
         qnk3rUPBFuvfEjZZsh1yrva0pFzw63DI20fdlmFKYuFKdLwZDBLh0yGswqxtxxzd74H1
         8I5L5NlVhk6CPf4jFTroOmhdyd8iaH8uJbyEOVcsHERLuqbLOYOniDnoDSC4p037OcJT
         PeGA==
X-Forwarded-Encrypted: i=1; AKwUvBwGPBcNvKmONvEBvKE1pC+p33WeSiVTIZszO8SsvZ0NBpcx4psTSqUfVRhr/RXMwKpdc886FwmAhS6mA4+JHTY=@vger.kernel.org
X-Gm-Message-State: AFuF++kxRQeBxFxrCXzTaJ27yG23MBIfo58Hz4tbzMVJU8MShMWwLsa/
	X2V3pbS7HqXBi0VqdjfG6wp8WBzmKoe9hLQLoEBVy77TuOhL6dJKbVsC
X-Gm-Gg: AYBFou1iVJQh6YKH9QgbxxqkoZ44qssUFJPlJViOkPnkncrtOVXEL37wIhy4g40mE8j
	SiHWP2RBjEolGI/77QSHF+H/SU6xQX9DJHVbVrgfzYxyS47ABaxvq26pNzKiKJhykmjT7NPeMtC
	TAvL7cd+7HX5qmXc8KygAz+w9oTxvTP8LZdZhOJResET/HeNZjfj76XgEeOitlNPzso9PNDBz91
	GmE68OP0hKTxbRTD8j7VQZUO1vQ76KrQSGMhTIHk8vEb0ZPXM5bO0Hlwnmjifm/oaEEfPAd/XIE
	ObwO9idbcZKyu1i3Cp3z1iBUFjZjet8lZhwYouTRxl0+IiREsqlDHh68NKBV/cx/vr2kkQ32irC
	FG1+ZaHDBiVYuy+P5fVgm8U6aZIWloO1NO/OReq77V4cB//xXZUrqHJdhDBDF/mM2PsGxWXUPbi
	t7QwaYW12Amh/eRaW2B4vGPf06cHQLfbi7J6KXjDbTyihN0KrAXEg9zkpiy9ECYAaqW0gu4FQpR
	hwbXB83cKAmC+BEnB5E30EIa9ljZGCs0Zu/DSywb/8/1qUSh+ySKPMV8wRKKiMtRdDpmNwEWu4=
X-Received: by 2002:a17:903:2312:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2ddb1b899famr7318915ad.14.1789677829118;
        Thu, 17 Sep 2026 13:43:49 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:6248:69c:ea81:be26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c1943f4bcsm3620046eec.21.2026.09.17.13.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 13:43:48 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jiri@resnulli.us,
	jhs@mojatatu.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH net-next v6 3/3] net/sched: pie: correct tc_pie_xstats field documentation
Date: Fri, 18 Sep 2026 02:12:25 +0530
Message-Id: <20260917204225.275251-4-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917204225.275251-1-hemendranaik@gmail.com>
References: <20260917204225.275251-1-hemendranaik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comments describing struct tc_pie_xstats do not match the values
exported by the kernel.

Update the delay field comment to microseconds (PSCHED_TICKS2NS() /
NSEC_PER_USEC). Update avg_dq_rate to bytes/second (avg_dq_rate *
PSCHED_TICKS_PER_SEC >> PIE_SCALE).

Documentation-only; no UAPI layout or runtime change. Touch
include/uapi/linux/pkt_sched.h only

Signed-off-by: Hemendra M. Naik <hemendranaik@gmail.com>
Signed-off-by: Vishal Kamath <vishy0777@gmail.com>
Signed-off-by: Mohit P. Tahiliani <tahiliani@nitk.edu.in>
---
 include/uapi/linux/pkt_sched.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/pkt_sched.h b/include/uapi/linux/pkt_sched.h
index 9c0c9787f0c3..969fa30efae7 100644
--- a/include/uapi/linux/pkt_sched.h
+++ b/include/uapi/linux/pkt_sched.h
@@ -920,9 +920,9 @@ enum {
 
 struct tc_pie_xstats {
 	__u64 prob;			/* current probability */
-	__u32 delay;			/* current delay in ms */
+	__u32 delay;			/* current delay in microseconds */
 	__u32 avg_dq_rate;		/* current average dq_rate in
-					 * bits/pie_time
+					 * bytes/second
 					 */
 	__u32 dq_rate_estimating;	/* is avg_dq_rate being calculated? */
 	__u32 packets_in;		/* total number of packets enqueued */
-- 
2.34.1

