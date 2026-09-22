Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0074BEE5E
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 21:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790110826; cv=none; b=pkfYSkEca7CCGfEOxYv9S9KEuKmndP+d/MMCAsbzkqnS19KH41lcIxgW3x4qxLB2390ezjwzh5mwpdclDIzvcWQIVRtmbcopMnHacwmqMgBSAw1O9+5VhqeIgtA0iVF/J556LWsmpyH1Twt1pm0WExJqevJdxJlsfgkU41tGIDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790110826; c=relaxed/simple;
	bh=3sf9YuBAZ2zv9t1g2dgGBjeM9ZfIN0Yd/tz3mo8MbxA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hVhwG9of8Y54EWGGPlU2WzeXEGz8saEC9UB3uh6XE0jEdJ8lSdcbt/kBqyUN/+tRk0FEHsRgLk77Wcqw3dyCm9JkU9W8o6LSDbmnkeDNUR1UYy53jiYmZ6HRxAkiv9CLAzVw/m7aDa4IigCSwFOeXS/IXebcTLjhtuN9ld0MvNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2nQsdrv; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2nQsdrv"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144efd1ea76so237506c88.1
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 14:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790110809; x=1790715609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ia2nV/eyt+q8ysG7SMAINIwAk3HmajymljLtHeWJQM=;
        b=Q2nQsdrvQlQpovCf1UpLwwn/Jy+a9y3Ay65lhysurWe5sGeHPBvz+ceXmmYHdNeFIz
         B5OJ/R7NeI8uFDPhayhQJkdvkTDFGmJPguQspWGP+TSXZj1bf48rMxzkIP7aiVovtqcK
         qDyK2cFZMEOal4k1L7t/dZnCtMWtLdoo3/Bi0KxF4phyGRK75SbImNT4a6H3OK+FRCIz
         dUxu6nSzZsLEGuCToXObsVnoFBVW0j7199S5zO+SCqFn5RA8wDGb3DhCHMvt+YxE4kFf
         xtU70QbnCX4ShALAuBvD1riHnrqUIZcsEYppCiYejJeiDgumjpFB0l5qEO/nxuIP1/jo
         wVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790110809; x=1790715609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ia2nV/eyt+q8ysG7SMAINIwAk3HmajymljLtHeWJQM=;
        b=EeeUPASHj4i/EHIZjkRtQSpW+kFIFoLOFnyal0Nbd3viUwGWPec/Oo4fYvshChLckB
         hez3847A1XdA3paRONn3Rp1LhcPhpXIHe2kR6CahfVjEU6bxFMBNncQ9tRZ3ycXlCCJm
         kfljpwUT40K72RhPm8QYIQoM0oSyzswFQaOzcx47vtOqLN6Db1HmN5oXgPFGEqzPTl8A
         DcHaYmOcaxTduonqlgZzUrhX+N0kTq710NGDgpFNZlhgdTdsgHz/bTwIQLBL0fyO+xCd
         z0orf/RndqH67qu6Ce3JG5XkZdPe4/XPoUP9rfQ6VC8rhYlPWBJcjpUYICVG/SAm4Pyf
         vksg==
X-Forwarded-Encrypted: i=1; AKwUvBxW8IIRo5qTnJHlmNBBf943+zF5s66r1FBNjwxiHdh9kjhfw10F7wugX6d7waCuvWr3tN5mq7cSytYVNdsXeTE=@vger.kernel.org
X-Gm-Message-State: AFuF++n6Yi3kIyEMHm+lXqr+fJrzXGUdp8VFOuj+ffEOmJgtBwl/tG9a
	6FG1GEm+8jpQPaibTI1A6WcePfkDLTAE7O7qSw5oBCgiFo75T6HD1qWCtRdDkYHH
X-Gm-Gg: AYBFou3ZpDXLdCbcGExjJ7DuYVx62azlyDjx4AuVaEW6yD6uAAtm11/OkHqXT0JauwB
	QxvRCUVZGsDOk3Srwqph9zHeRI8SzEuctkqoEXlolbJruwBfJDg583thS9q5Y3QT0Rm81BsBRYX
	3SVlD8Upwyt6u7e/yxIEe7aknT9vHZcL/iPe6RJDc7/XlwzlhM2n7lZmENyPFjqck8wyC0JkYbD
	xTZXv9PPeibPh3ns/c93y2B0tT39vE5fylJTK0EUoAikmNWye7fACnpcZ/RvuRZ48IAlKW1zBkM
	5UbTETl5neM8/xGaKXLOStvkacGB8wV+LXWuCPWI8OfXWvsGwaaKpFeT8Ct0VmFQMFlj5aaw5xt
	ajg8upecPys2+Zqd0JY0aRXmVhCzKapF9RcTZDTJRDIp9AXlTTTXfZjF/WKYfpiG/p20uS5jhv3
	aA4OBuil7i5BjmESsa7LE6tjQBCvfo2YN2UQQrsHfv/nHmvR2A+4I31LQX2suX647LgpY0ki9zc
	Y8MO0Ekh1mz+hmK6K59DUvbLjX3QycpV//1pJKLuk1WAF6dvzCNrIbd2GnXKq5zFS/bmH8oHi4=
X-Received: by 2002:a05:7022:e20:b0:143:2973:323f with SMTP id a92af1059eb24-144f9154f12mr1009905c88.28.1790110808584;
        Tue, 22 Sep 2026 14:00:08 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:f16e:2102:25ad:9cdb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96d497e1sm760952eec.25.2026.09.22.14.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 14:00:08 -0700 (PDT)
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
Subject: [PATCH net-next v8 3/3] net/sched: pie: correct tc_pie_xstats field documentation
Date: Wed, 23 Sep 2026 02:29:24 +0530
Message-Id: <20260922205924.32173-4-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260922205924.32173-1-hemendranaik@gmail.com>
References: <20260922205924.32173-1-hemendranaik@gmail.com>
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

