Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208270;
	b=r5KxPl8yPdZR2/uX0lWbol7J+mey8v7Qtl/9DVNeXJzTUk7MwV61vsxRygU9Ce7Q8SFI
	 xZC1xWHj/GFZ7DqLsf6fLdnlShTMX+35ziGZds/y07A3rYQX0KpMmD3Qdvnq5g1bwlcRX
	 aaHu0eIatSpm+xnp3eA4tmCXQsiyi3PNM+F0SfPaP1dOcpUYxYL7m7p/ssCTv7AF6sp62
	 dzGMPoCOUgwGEJPZtuXDsicDieU5vYI3mbsFK1lJgi1xNRzL32nk7ezRXq2VbDgpBZyn+
	 MhSMVew75znEpxbCsSrNVTGlAqbc/5Ns3W2kJnYCRif2vwtyE8Dh0JlkN1jXJZEysCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LrXsda7Q/wV7+l2k+sGQxx8wXojvBKGw7M+uJmFtdYU=;
	b=3VfLPsyes+rb+g3hLhMQ/zMnA0qafqIlsf5AmnC/baQcccXdK7TQ4oLlLeQA9qQQJVQL
	 wptVU4V/KibdAaLiQgWWH8+pW/WhosdPg/lNfBB134zkcrbT2iTHCpHTAU+Ed81qs0ScD
	 2WXn4THtRROZ6AMtloG2Hmcsa5IqL2jtceusdxsXVFuHKAd+zHqeMLrX9m/Lr4vSzkXEB
	 OqSKDl66rO1+9PcBJUY+sD/YFn6G1u/4d5We/0xRb2pPJwREzQe+o/Dvdzka/lLBzIkct
	 go5ZwuIsys66dD0hqwGoFs4ZloRK4pX6ZEq6t7gW229ow1FAvRxiM060xEe2UeKMSXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a3coknYg;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C19606A323
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 07:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2C19606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a3coknYg
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b244fb7fffso583219c88.1
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 23:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794208269; x=1794813069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrXsda7Q/wV7+l2k+sGQxx8wXojvBKGw7M+uJmFtdYU=;
        b=a3coknYg0/9is928kAfp4u0Vmq7Q+SzLiFXZc9jUQ3rdzRY7S4pdGKN+LcYXzwTLkF
         nqvyRSUa1Z7NyIvwl9Ciu+wpnMeevbcig/AZL8Hez6ihonfDQheXaxWg7qv7P1z0hiAp
         Qia8bMGREQf5y9c0vmBMg6OGIKV4kZClYM0zmzuJok0RceLVJpdlNrR0Nazewt2SdD2j
         FmxpptP/USok37rRTtUZ64FVfZGYgbZtkiPCqpKGjqVS/e/qnSm1WW8A5u3/oO5xkF6u
         +5RzUcQfWG6WH2fx0icLfyYVR3iuKye7XL0lHfjZlJ2Pj4282DaIJv1D99eWm4jP6QJL
         nbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208269; x=1794813069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LrXsda7Q/wV7+l2k+sGQxx8wXojvBKGw7M+uJmFtdYU=;
        b=wuB8ddNg2ZFhDzAQ0AblpvEBlnzJOQ/T9Z1q6HrJqwRQTtq8Q2HYkvpLsNp47f2lt4
         JTXk/ctomlSltTYWyH95n9deOuAku7lGUWLsZf7B3g3Lw4a/+nRqrssjtnuTynzDX7e1
         U31DZkylG9E2mFxXWFDjnT17cc2K0ntMt6rALo9wpP8N9QnTBY8KzRoZKJgBd81WaMzG
         EkZp7GyK8WxpebbtCoD+kdwTVcmOItmO6w64UTDXRssCqvl8x8g7GwZcqX3xth53O05b
         b1cIQXjdOMPFNwKiqSNFc0Mdboe/HRzp1MJDyz+My67jrlJcFUeB3UsY/9Vc4tkQt/C7
         mJ3Q==
X-Forwarded-Encrypted: i=1; AL+hErE2X0shvSYd9n0Y3YRlS1ErLvICCXPUP/IhtKmnoBNC8w/JpcgNeiQT/SG4Lb2OYFp7SXmso0cq7C5MW+BAkZM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8y51sKVno56GgHYfjzZwa4nvWBuC1Vmx7ks2IgPeRK15R8V21
	670IPt5TfXo1fiYFc0coZvBug0R+xNYZk5JtRIUAkVaDEb8sXdw58ZCD
X-Gm-Gg: AYBFou2VluNdsFQGRpey3JylN35LPfHqt6sa966ugFLOHf3Ej89Bk4Qnx+FhSSWIXlU
	HqPA3XJ/QZX2Vq74uIc7hIJ4inr9PLWwWSl8IuzV54lmryMLYeA8FBOhrGVq2FO+c7Nij4DoIpg
	AwyWjOC1ZH1sILZP18jMo/EyUOrh1H9mA+jlm4qovaniS4EI7zhndilERBAc1s6Hw9CnO/Ms8ao
	bFrmW+W4WmwFMdfzNMIx0vU5XLLmZoEVHmQnxdZWshyvbimU8TvWNt5NKxIWQ9cxB+xXJ+ZASs0
	USiYQkuR+LUhIcKD/CUwf8dCVwE1MGuMwW72iHWX1RgD8Sb8SAjhgSaERH0VoKt+b/iKB6+3RZU
	Ccu8p24wPTTPNyziMuJgD3Zt+/N+m3PKfvwhPhgjH6AGaZ+gw7ORxXkRQqyWnOBhsurIWTITFw0
	ayXBaEw/WZC3tV1v0YJg7+mHO4ZR+/+oZ3iSP6DKYQU6Jk3q9UuOj0kAaJCQWbzkprTwGChwpIL
	0m1dVLCzPg9Q9MH+Ti/Qq4i6ZxRSe4uZTrbuQnKiC9fgBy9hGEJ6BycRMdzQq/IIzhC+q0Btllp
	jv8wtuz0Wx6HRh8/ljtyWj7Ad6CdUcuFYCXQmIT3s+eVNJD//QMyr1HJwQKhN1NN6u0uFIjohLq
	G2tr/VFUZZVzCghcQQOTo9Vv18U02
X-Received: by 2002:a05:7022:286:10b0:1ae:59d6:91cd with SMTP id a92af1059eb24-1b39fecaa6emr4913256c88.38.1794208268937;
        Sun, 08 Nov 2026 23:11:08 -0800 (PST)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:cc96:e14b:76e:f8f1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755eb6efsm13443513c88.4.2026.11.08.23.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 23:11:08 -0800 (PST)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jiri@resnulli.us,
	jhs@mojatatu.com,
	shuah@kernel.org,
	donald.hunter@gmail.com,
	ast@fiberby.net,
	toke@redhat.com,
	liuhangbin@kylinos.cn,
	j.koeppeler@tu-berlin.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH net-next v10 3/4] net/sched: pie: correct tc_pie_xstats field documentation
Date: Mon,  9 Nov 2026 12:40:16 +0530
Message-Id: <20261109071017.438478-4-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261109071017.438478-1-hemendranaik@gmail.com>
References: <20261109071017.438478-1-hemendranaik@gmail.com>
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
index fef848eaaab2..445a041cd103 100644
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

