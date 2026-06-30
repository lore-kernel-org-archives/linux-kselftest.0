Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA81E3DE44B
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 18:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782844670; cv=none; b=mbzOkiz0wbZc+aymvRipe9GdC3RzkrwsHoM00isr4UkTKLvYqvYTWqlvBixI8F26ycPn278SQ1YAcnTMmVLlVQ0JE/Qg4576r2YN74aScOINLmA9eEJXpd0KCNeH2RE8RRmIrHsVJZUoJMSRahy1XiwUxcjH0BGR1K7+jhI8iEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782844670; c=relaxed/simple;
	bh=YEzjTaQBibg82naQrx8wYRELkM2GgBKDfMPzgkCv/68=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O5fQJ9REvhkeFl3DcDA21Oi//s6c9Xei1NbKsQ6lxXu3cTTmkjwXQny/mXabSiFOZb0g2UD4KR2UE3DrksAVYF1cZ4wlOkIMelyz7nrH0JZq5Www7z7Kqjor9bbsZvDvzVCLmebbkvqhWDF3RR57IE5XgpZ2m9OT6d2c343CqMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iccfd43a; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iccfd43a"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30edbb0dc5fso3715175eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 11:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782844668; x=1783449468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ES4kCJ/i10bD1lFE1QxrqtkTCTeoqYvCpnKF0vygSpE=;
        b=Iccfd43a+CCH17kOjZG1phFkTveNCf/fMBYoula3s1GA245dsNSm9aeRgfQ+UiHTVe
         Em6aQINfEKzgk2ZG3e6UPIEIYQ2sPjc0GxWZZ+XRPsCN6i2Ttg/5ZeXcyzqKg8F6us3D
         8MPjbAYAGHkBaf5m8AiqhdwzyMIeEaZp07FVJzUgcnugdKrZKDJyj42n3lgml8UGaeU0
         2TBT52Ng1u2iH/du6MLYaRQJu4vhmVevGtj0huBQXP2sOaNya+7Ddb+CPFsOq2nW9QN1
         M/mgKuLWDQ2txVCPtio6bIGisFZRu6iZ6F8fPq5MGv38iMe6Rm0bU+8Sj2uZ4lUAqgMA
         ySaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782844668; x=1783449468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ES4kCJ/i10bD1lFE1QxrqtkTCTeoqYvCpnKF0vygSpE=;
        b=c7czn0iBjSQ6URSyNWGDJ3YMNlOLdDPdl48nO8lEQ0rGQrO/lgvPsQI/DfrAKPheCv
         DOXyQSPLJXiWDBLpiekF+6e1UV30NG5yOndiHRYLmTmwpHXrHN+7m/9K55x6qRZ23/Tp
         krdcAbyWPw0xU+bE3bTDT+lMZ+7oUvgfJGMrCsNnmlJoG8ueZiHFbn7FKE8a0pnfxARZ
         GonPfUv0JxIhnT+OQu/BqqarOnxH+LAM6rDBQ9FLW+gsaZWnZRqgZrNFZsiWNNkqfO61
         TCgwYuWLAcy0R7gPS/beYRhTkv485LjQTOtIkiRKMy8cxtxOux1HWaIQjiwEs7fh2DFk
         Ct0A==
X-Forwarded-Encrypted: i=1; AHgh+Rohj8XdywUgtIZjqSRc0AJsOYbLd1Pf+3MCoVF2mlG6gM11xtkquVGpFdzCJndlu1JDzXZhyi7MdzIIKzIsLnE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTEreIpHheQtQ/+xMfYMsP/CEsKkoUpsZZD6AXNSA4cgLxLxtk
	EVqdgdcHGcd0soquYIWrnoHwwCbRjXbRY+Gndk7I95L4J234wRYn/CKk
X-Gm-Gg: AfdE7cm4e5sLAESOIpgVMTlDZ/itA4bAM/XJ3ELKJ103W/vmJ8n2Wc3VhfGLdMNickL
	zDhJuhL/zhMIa4RF8LIWPnxq0qaN/3CAIlv2x+Xl1dx8MAfFE6hxFOppKCNIXlseSQsGWSx8fzu
	Ph5Pio1vEl9PmRM7maNkEvF99XfoCTK5CwWSwCAGId2syN99OCtY0iojJ7J0qgGSlVytcQRavCt
	JvJlzR53p+SFDB/ZQzlRGQTD+viqHTtemxGz4nvbQkXMikRUDaJkKPrawaclq02WEKR/ZW8TXP/
	8v2mmIBwyvyHq8XvqGawAIOltMBGuc+YfmwZ71nByWcVQtrER27WwDqRIRxVX/YiYDTKSpO4Ovg
	N0ZW6AtVPTcLLkzhTeFPcbSQSWbxxoJSnSDySjFw/pxp17jwp7j4+idBl4dPO1/eRhNyjqucQCE
	P5N2VK9/Wqs4y5KzOl1Z8AqUDLnK8=
X-Received: by 2002:a05:7300:509:b0:30c:38ed:46a5 with SMTP id 5a478bee46e88-30ee147e97emr3855167eec.30.1782844668077;
        Tue, 30 Jun 2026 11:37:48 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:b5a1:965b:86fd:756])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee3205993sm10888191eec.24.2026.06.30.11.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 11:37:47 -0700 (PDT)
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
Subject: [PATCH net-next v3 2/2] selftests: tc-testing: add fq_pie per-flow class stats test
Date: Wed,  1 Jul 2026 00:07:02 +0530
Message-Id: <20260630183702.170798-3-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630183702.170798-1-hemendranaik@gmail.com>
References: <20260630183702.170798-1-hemendranaik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a tc-testing entry (id: 83c0) to verify the fq_pie class ops
wired up in the previous patch do not crash and integrate cleanly
with the tc class show path.

The test creates an fq_pie root qdisc on a dummy interface and runs
'tc -s class show'.

Signed-off-by: Hemendra M. Naik <hemendranaik@gmail.com>
Signed-off-by: Vishal Kamath <vishy0777@gmail.com>
Signed-off-by: Mohit P. Tahiliani <tahiliani@nitk.edu.in>
---

Changelog:

v3: 
 - No changes since v2.
 - Resending as the previous submission was deferred when the net-next tree closed during review.
 - Corresponding iproute2 patch updated in response to review comments; no changes required for this patch.

v2: 
 - No changes since v1. (https://lore.kernel.org/netdev/20260614125000.6058-3-hemendranaik@gmail.com/)

v1: 
 - https://lore.kernel.org/netdev/20260531125314.22492-3-hemendranaik@gmail.com/
---
 .../tc-testing/tc-tests/qdiscs/fq_pie.json    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
index 229fe1bf4a90..88139f429430 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
@@ -40,5 +40,27 @@
         "matchPattern": "qdisc fq_pie 1: root refcnt [0-9]+ limit 1p",
         "matchCount": "1",
         "teardown": ["$TC qdisc del dev $DEV1 handle 1: root"]
+    },
+    {
+        "id": "83c0",
+        "name": "FQ-PIE class stats accessible via tc class show",
+        "category": [
+            "qdisc",
+            "fq_pie"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            "$TC qdisc add dev $DUMMY handle 1: root fq_pie"
+        ],
+        "cmdUnderTest": "$TC -s class show dev $DUMMY",
+        "expExitCode": "0",
+        "verifyCmd": "$TC -s class show dev $DUMMY",
+        "matchPattern": "class fq_pie",
+        "matchCount": "0",
+        "teardown": [
+            "$TC qdisc del dev $DUMMY handle 1: root"
+        ]
     }
 ]
-- 
2.34.1

