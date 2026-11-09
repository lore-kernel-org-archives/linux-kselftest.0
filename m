Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208281;
	b=CEe+RD/OsVCi2HuUklYGRQi0cvepVYCPC6ZLSyhJaFNu4pnqTzjwHKcYhzTxP0lLK+ME
	 mC4Q7Pjzaj7WDRI30gJapbAP2l/k/sk0Ep5EtwQS5IGqReO96GIoEG32gH88eY6zuPpqe
	 ibKf1kPZW+XXOlEqmiVnUUdR2rVSRSnIMKukJAkvC+L4+3QG3opb5EEPDsyFNZ6KFIUg0
	 gNmJiLbJcrxY2PDQLH0UaSqFI1N2r9b94ENtykTutAdRoWoWva0+4VHO0ZyV/GqDpdBYu
	 FtiL5vL+tZnc3jsMoS7G95gofa5hOdrw1HqWEQ4LdQGXge6gpBpvnGRp4z2hRnqRNSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7mHMsCDVeycRBqs1waIeg/qc9zHDhufgZN4r24QbNvY=;
	b=CQSBwX19eRhKC98SfnkssLOJi7x464U2VALz8yYoAisNmljy4LTb2PtB/CksnikztqC9
	 aiM5v7VWld7D5lsXYFqK7MHcDIP6wRJ3dJPfSeCgYE6bHKMLrfeIMYiWtsyQWoVHs99IE
	 gQFpvGTfo1p6BMcrg1a3GtrnELAm9aDvavKCEhxRt/rT/XZDKZ8SMonRiAqzaLzfyh2ZX
	 Nh0GMG1puGzvVbd7C+IDU5NDGP44Gadq5mLrlMMOCC1677K3Lmz/4CnnKiBdl4B4wJPMk
	 cZVg9GTmIxoTzM1LdNDOnVDVBdnNuXupMS1CPzZT1SpzlB2i50LMg2WEiOYI4EyehWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yrqxFb5P;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D85606A321
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 07:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86D85606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yrqxFb5P
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so534369c88.1
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 23:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794208281; x=1794813081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7mHMsCDVeycRBqs1waIeg/qc9zHDhufgZN4r24QbNvY=;
        b=yrqxFb5PaoQQpJVCeHWMecfV0DneFMtWF/GXOqRhI0nEu2oGg9szux5pv/edWk9+Sk
         +ppyrwclcOxV+2mENRlj/4KIDweTwG+EqIRER130x0e7FLSpReLt0D+07OrhFl/CNj74
         jTfLsmKQpgXRDkQHRHSLcePJ+ey/araaccry5l8QAO1xfFWqYunFSq2awtolqAN/Skd9
         VdCI0eB415MTrBz3FRGDOx+Oixe8zNqL+9dGEYxBHJtja7zk700Cxfo3aveVGV43hd1c
         Zb0PptMUKNJE7zcrXz34xw8SnuWKiy1n526v3PxdxA2SX3TU0f6GIh6CJ9aDoxgSHHRM
         R44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208281; x=1794813081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7mHMsCDVeycRBqs1waIeg/qc9zHDhufgZN4r24QbNvY=;
        b=yugm8irJqJ1nTOmy71S1xGdjo4wTb7cDVftesNs4QKnnRf0hs3kwiKu0pnA7C6lG6a
         s34lpkhb8j6BqJuU0/7TdA4MyPXCwI0OfOwh99GlK197BP+aGpv/n+xU0YfCqY0SqKkF
         QspMeUxNi9h5gdjkR6T0xRhL8F07+zI/fp5atLvkc/2tbITCxZzWGnSkcX3h5AkV16k8
         5OT80SwZ158JgeA37vKZO0UawKY+9DeIg+Y1Je+7MiDdCrJ4Yr8Rd8HdcLdfchDBPPnb
         +FgtlUnDPm/QkDuXSuKdAT6ZkHVlNK/pGFcQC+GPzR8bKNTrU70hBvu2vjx0Ta/bNzG0
         fn1Q==
X-Forwarded-Encrypted: i=1; AL+hErF7041NKgoK7Y6DE29MuQYPDZ+PqVyRxrENmCgks23usCHSYP+hGqiOy76CJnRDNBnGHmjf+u8C56QcgnqoScs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OxSYbaP80lAvYfiYcKmRPnBaOMKQC5+4PqjVgIeHDMzgjc3O+
	opHh6ZSePk8r//aU9yASnrd0LC/FNGtjl8fszO0HgLrtj7qbacL6h76D
X-Gm-Gg: AYBFou2lJ5SmF4IrX5XgmqpdFBYfyvhLqIRz/ZvodSCut9O+eCHH7ougnC9tZJSLtis
	qU0QaGwbzODA9XNPUp1WpidsJvGqcHMBCa84HqDDPEWtD9ZH+pmd/l1nBmATXfHD0UiWo5K10c+
	B1HKEZtntBpuP2aCnqR4Depp5Iy0j/7eoRulDlDL8inRhyf7FzGLObhCtF0T/eWRRuVY9IpgIyy
	S7JfbtWUtbH3aaq73bIHR+0WmRVNM0UH3ftLz1DcR5QugO47seyHh7hkdYjyNkDR/ssSs6bZYEP
	z6eIS2oJHCAD5QGLaQLq/O4CAK24QAv17NPKmE8ENmZHovJAiSIoXbnlBszUIi7SnfSHQehUFtd
	OiqOK4FATOlUs0hr8wqjt75ANwJ0phFWUNKGYmCpabd6+oqHjlCf1s4Mgys+b1MfaeUsTnfoqPV
	9q7cVes+8jdXU7Ez1NtyWSjXq1mz9IGwBG/EneYge74F3FqrYitwZKEwccflYX1JYT4x3DKFY4p
	C50hykXFVlSfOWYQW0zDc6ogEAV2kFVu1jrHXNpoYrxFrzWStzLGNxGeZHgZmTplKzaX1/fdUd3
	sgXgy2ypafAeZcTOrZjN+4kiisM89YxuCBNmQOaOdsSk4+IirMpjxslHH1WPJPCiU/MC3JTm5Tc
	B6BSKw8grs1Y7ZG1AucoL15nPr3LF
X-Received: by 2002:a05:7023:d07:b0:1b3:ad63:b9c2 with SMTP id a92af1059eb24-1b3ad63ba53mr2044328c88.22.1794208280449;
        Sun, 08 Nov 2026 23:11:20 -0800 (PST)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:cc96:e14b:76e:f8f1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755eb6efsm13443513c88.4.2026.11.08.23.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 23:11:20 -0800 (PST)
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
Subject: [PATCH net-next v10 4/4] Documentation/netlink/specs: tc: describe fq_pie per-flow class stats
Date: Mon,  9 Nov 2026 12:40:17 +0530
Message-Id: <20261109071017.438478-5-hemendranaik@gmail.com>
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

Add the tc-fq-pie-cl-stats header for fq_pie per flow (class) stats in Documentation/netlink/specs/tc.yaml
with its five fields: prob, delay, deficit, avg-dq-rate, fq-rate-estimating.

Extend the tc-fq-pie-xstats fixed header with the type discriminator and the per-flow class_stats fields
that follow the nine legacy __u32 qdisc counters in struct tc_fq_pie_xstats.

Signed-off-by: Hemendra M. Naik <hemendranaik@gmail.com>
Signed-off-by: Vishal Kamath <vishy0777@gmail.com>
Signed-off-by: Mohit P. Tahiliani <tahiliani@nitk.edu.in>
---
 Documentation/netlink/specs/tc.yaml | 33 +++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/netlink/specs/tc.yaml b/Documentation/netlink/specs/tc.yaml
index b6ccc645b0e3..b159c4b563c7 100644
--- a/Documentation/netlink/specs/tc.yaml
+++ b/Documentation/netlink/specs/tc.yaml
@@ -894,6 +894,30 @@ definitions:
         name: memory-limit
         type: u32
         doc: Memory limit in bytes
+  -
+    name: tc-fq-pie-cl-stats
+    type: struct
+    members:
+      -
+        name: prob
+        type: u64
+        doc: Current drop probability of the flow
+      -
+        name: delay
+        type: u32
+        doc: Current queue delay of the flow in microseconds
+      -
+        name: deficit
+        type: s32
+        doc: Number of remaining byte credits
+      -
+        name: avg-dq-rate
+        type: u32
+        doc: Current average dq_rate in bytes/second
+      -
+        name: dq-rate-estimating
+        type: u32
+        doc: Is avg-dq-rate being calculated?
   -
     name: tc-fq-pie-xstats
     type: struct
@@ -934,6 +958,15 @@ definitions:
         name: memory-usage
         type: u32
         doc: Total memory across all queues
+      -
+        name: type
+        type: u32
+        doc: TCA_FQ_PIE_XSTATS_QDISC (0) or TCA_FQ_PIE_XSTATS_CLASS (1)
+      -
+        name: class-stats
+        type: binary
+        struct: tc-fq-pie-cl-stats
+        doc: Class statistics of a particular flow (invoked via tc class show)
   -
     name: tc-fq-qd-stats
     type: struct
-- 
2.34.1

