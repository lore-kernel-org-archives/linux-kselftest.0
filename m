Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA3942902C
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 16:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785170530; cv=none; b=ACiEVTuk+4z6ohzwFfg7pt5U7EktFrSY/pIeuTAtGHLFLpx3m54OUrPZFPH1to+uyjK3ahEJoKrkX9ZidYsYQFNC8teiD8XxUVcrabpYNFjWa5jeXaIfSjHl3yblgpmtlATnuAGpN8niwcuJqzvWziRjZxKjji+M0MCf+vbxFJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785170530; c=relaxed/simple;
	bh=yevM4t5lGA1loaNIC03oKIXXNdUzs4tCmtanqMJGyu4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S8MRQE9A3LFITW22Ct/4lz1gk0Cs4ytI7uoVbGTVu6R8U8k0RA+Hxx19zfuesMvISEHKbsj9yaQ0F3ztvAYbpoXhLZHmHu1cER1SUIQFXQyJ/FXf67SRWC9eeZthSOVcqaew/iwj56ojsvqqJvd9CjnLehAd8fPxmNCiEHyRNbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlWDAG1I; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlWDAG1I"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c9aea40d799so1503668a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 09:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785170528; x=1785775328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i0LWaGsCYUPNTy5HTUg6xeKDq64bmO3p7cVJSJv0HAI=;
        b=MlWDAG1I4tSKQkDeOXBd1PNv+RPkUXAhywnoUeL5hkO+wgTeoDuhasBJbOIgUdyhbq
         j1EO8PZZYbCxHgBjcU1IB3x11hWQast39RC5s8LtoWtGZRypOqnM6UvOEec+6RPLh9eu
         IPFuA974xmohiksUtKRD/Lky5yJchODVMXrOrOJ0YbBtQiewmrNejqzpsAU7WnpH45N9
         emleuN8ut9XpodrrBeEXhfhUyiYu5UZURCepqqQ8fe9nQcjMvuwlLX3cmEy626y71apG
         DzsYPb/PUAhsezsvusHSGSHR0W4HtyPcSYGrRQEY6+wMt49Ib1365sSc96Z9dzK6JY/u
         Z38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785170528; x=1785775328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i0LWaGsCYUPNTy5HTUg6xeKDq64bmO3p7cVJSJv0HAI=;
        b=tXuJaNJ78N5LZjvD8OpQbsdPc2jH2zwr/LDFHel1jc4mieikF6+GYektvUarxJX2Ep
         M0ydsfwi8xk6GotAIfnhrxdwOuYZ1YoACjxnYocXS8l3rABBVXx0WZGuef6M8NtMtiDf
         tFNGDR3YAuSvKScJN2ubI5+7JQpU84QVIjICI5uQm7ndoNc4Mm/aDp4RsYQ5DLVhLBxv
         NuS8ES6RwjaMC0ceLyRthQhCkLpyJDdZ7tiA5K3Hv3fiREzzzjuhISYzx0DB50892Azb
         Fb8f1lR7UfpcbYAipJa82GoqmTdpRElB0hXDqhsPsuURdsNKAgrmtOCK5UeokDnZ1N82
         nWfg==
X-Forwarded-Encrypted: i=1; AHgh+RrXG0/SpkQcHkwi7Revvug6BDrmsXwk1IW7k4VvaVN/Thnd4e96fOKa/M2oZXncI1Ve0dF7QW2ju5yFMZ0yTiA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx21rZSKef2gIY2yvM1gww+LMt0/mLxhRedF3cbjfnxWQc2X3aF
	FA6/BU7zDe8LhiddRJBDq5aqc1b3Er0covYR+sdiR1SZLAogeF8ZEHwb
X-Gm-Gg: AR+sD11Bxvx8TanhhRcojOXJcvukzJr+s23DLa0OqJfAMxHFvjZzxj0pk0+QZpfyfhJ
	eCp5+zsRhOG4FXqA2CgNtniJwj7evhLhc/+2RaywUkFhnyVHnw9J8SbtaYDZXNpT9sMX4JxHUo2
	unm8SwG7ozkSOzOkKpQULB+B4QK4v46e+E0lXBSEyPh4drQQeIWBqqqBzSRt9tceiatpH/tT/wb
	0q38c5Q6gMxbN1C6L0wo5IR4kY1hZdgAeq8YGT3iYDNRCv/8riLrqVf4AxAqL8TiLg4VVTeQQK0
	ylGsL8M1BHfm5qmi/S/fs3oa3YdGRprtpUn815Sjv2xqK4RhqR7XTaNSVm8NUVkOx7EzSs5lIqU
	1xMG0y8FRiRYFOAPGNCqDRKaLQLjbujje1n55nYOR2mGMzncN6ERQCtVhvBalAZecEmlxAZgwVu
	1f9w85+yTlfE1Qw1qsTqFP8rS8faylOGKIVOTSSftn2vqd20H0QVy9BIDa+kCYsU+aoP0p3fskN
	Q4cL18=
X-Received: by 2002:a05:6a20:5483:b0:3bf:c126:baf2 with SMTP id adf61e73a8af0-3c67df285efmr10464409637.47.1785170527730;
        Mon, 27 Jul 2026 09:42:07 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:8b84:a60e:2cad:e760])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc59cfb4sm33227566eec.26.2026.07.27.09.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 09:42:07 -0700 (PDT)
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
Subject: [PATCH net-next v4 2/3] selftests: tc-testing: add fq_pie per-flow class stats test
Date: Mon, 27 Jul 2026 22:10:55 +0530
Message-Id: <20260727164056.106203-3-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260727164056.106203-1-hemendranaik@gmail.com>
References: <20260727164056.106203-1-hemendranaik@gmail.com>
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

