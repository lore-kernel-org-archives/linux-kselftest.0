Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D393E3A2576
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 08:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790324604; cv=none; b=X3QzYp6Igd2HAQ/YzhrAa+CKEVo3JPnRZjhqJvHRX+xRqhaRMQrLfgWXCMCG8hHn/xupiuC1WcwAz6g7ReQ+xsP5/+Dh8GFm1cdrv7ZPaMsQDe1qUpQ2PY8LOsEqpslyUBqTjQa2+ojB8XGkCGitpcCCqNd/ppKVEe2lPDru4t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790324604; c=relaxed/simple;
	bh=Dw4v6JTx0Usn/ZJ4sCYj1U150VDxILnbuKrTSzqE7i8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ee1lYwjOvxT2J7nfHgaM6U6Izytm/HFkqxbURYyBF0Ah0T279l3Ir+y/XXS3dMe6NQ2TOYgqMbVMuWMJ+AKjJAJIWK+ug0mOrgtfjmsiLxevoJJbx0heLlV8EJJmrjgLnaa9LZYJeGv2bsFfhIwNRHq/Hnd5heEd8rQntZVVYiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=gV5JhG24; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="gV5JhG24"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb767cc7fso7574971cf.0
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 01:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1790324602; x=1790929402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=47mRdp5lPPjFXCfKGuPUegA86O97/a2J/8sFoZV85O0=;
        b=gV5JhG24dUHMKl9akl5bXE/xMMbzn5psxLfC+RW/hkcM5iFiVBcFXr3qE/8b8K+H5m
         cYlZQPQvxZFftblIUa8QdvuqZtgQDZGeOkAbaFVHnqN4Br1RtFDHy7QFhHaFG8o8vOqU
         38PuRQL0RLo/kiMgVZ8EnkfsXxjE5+5eF/02g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790324602; x=1790929402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=47mRdp5lPPjFXCfKGuPUegA86O97/a2J/8sFoZV85O0=;
        b=Zs6yhbQlUOEqtLK+/uaOVn/sngT9GoZRRfFeg8P/0Dg2gCfOt6X/gBTwr7rwyffJvr
         DK2LDZqI9sqFRhsieNm217sKSafVucPP4O+IsWsf8P9shmd/JeTiDR5INfQyUhhweL43
         vcQvZ+6VuyQzMiAg+sBxqGv4cOaEWSVljEw5rL0a95z0pR7VhLI2J6dDVPgggxooyDef
         Sx0uNHv1lxNBFMutbTKFFK80pOwznOu7qADb0DKS0+cMCIkTHvUVDKJDTNK/DLA10aXH
         yYjdV0G43seKb+qn/HMSH3HOUYp1A836Hwd+H2o9j2DByZwQlnfQsJVJKVlfOvzDISKr
         LPLA==
X-Forwarded-Encrypted: i=1; AKwUvByCVvoz9go0FnfAW3a2jZ/40LEj8KjFo5E1ftGlsiWzLAFwK6zsjSP7exU1/LMExTrJ+g9fUww/A+D9KZCzSBo=@vger.kernel.org
X-Gm-Message-State: AFuF++naCppXv5d5NYjqrU1YV29orHSMrA/+CRbEM2NmyuUnruLV4Stn
	ZmlVm3NTHYj748bPuxra6IKJx6EDcb80voaDefCwPn7q13EXfGtj7xY63NHDrd0f8A==
X-Gm-Gg: AYBFou1+oDwflywH5NIARrMLJATHRGGv/syh8pLkuXvwYCoLuEsDv4xUbJo7nmauaMf
	7rKsKuXvEIqLa0Deac1cZjHpVU4MjkJkkW893k9EI3B0WL7Bu0HgHPXs1tGQlM1B9SOn8YXTIfh
	QZzFthUoJqVihVYyLIDWvNeWDgWFj99HKmWzyq8iCr5vxI6HT4fS2Zwt48CqPgBg6ZFQPlBsFcJ
	yfrV/8qrMdmjDSjKen83UGchsghH9+7lDeHDHvWeieGHi7vFP0w+Un5q75xz6HZwtQL+SdqeCPv
	X0Q4RQugc7qgy/O/OvpWlpga7zjX47OyR3ZnBt2EZw6wDJdrE6rtg0cwIwTsCnhQ8v0k2fA+BD0
	BOwun5Zq6RiFI8llCKqX/9Pdwhie08GTqaPoIDy54gpaY/sqM/Z9DYGh321bO1EYPW6uS49qlSH
	C2uSOi0f00aVqkV4McFg0kYUt7E4TiupzPfI28c+x9eGmF2Y+kCtCEgAcnmv6hbXSLhPI/Gb57+
	1QpvbsajmrltLumAlpixi/gBCCd9xN6m8SBODzEVm8RVHRF5g==
X-Received: by 2002:ac8:5f88:0:b0:530:f44b:5404 with SMTP id d75a77b69052e-5330b5b15f2mr30745391cf.14.1790324601795;
        Fri, 25 Sep 2026 01:23:21 -0700 (PDT)
Received: from majuu.waya ([184.147.180.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5330c0aae6esm10554481cf.26.2026.09.25.01.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:23:21 -0700 (PDT)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Victor Nogueira <victor@mojatatu.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	hybris <hybris@mojatatu.ai>,
	sashiko-bot@kernel.org
Subject: [PATCH net 2/2 repost] selftests: tc-testing: add duplicate action delete batch test
Date: Fri, 25 Sep 2026 04:22:38 -0400
Message-ID: <QDISC-K1TH.v1.20260922072206@mojatatu.com.2>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <QDISC-K1TH.v1.20260922072206@mojatatu.com>
References: <QDISC-K1TH.v1.20260922072206@mojatatu.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <20260925082238.ApYMOyeo4f2cyHtNpBH4bmakwqO17BYdV-HiDQLVM3s@z>

tca_action_gd() takes one reference per nested TCA_ACT_TAB entry while
tcf_action_delete() consumes two per slot, so three duplicate
TCA_ACT_INDEX entries in one RTM_DELACTION free the action mid-walk and
the next slot dereferences it.  Assert a duplicate batch is rejected and
the action survives.

Conditions to recreate the bug:
  tc actions add action pass index 1
  tc actions delete action gact index 1 action gact index 1 \
                     action gact index 1

Testing:
  Case 8135 fails on the unfixed kernel (tdc_8135_unfixed.log) and passes
  with the fix, alongside the batch-delete family (tdc_8135_fixed.log).

Tested-by: hybris <hybris@mojatatu.ai>
Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
 .../tc-tests/actions/batch-delete.json        | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/actions/batch-delete.json b/tools/testing/selftests/tc-testing/tc-tests/actions/batch-delete.json
index ef7ca4a6775b..7620e927ae2c 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/actions/batch-delete.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/actions/batch-delete.json
@@ -111,5 +111,38 @@
                 255
             ]
         ]
+    },
+    {
+        "id": "8135",
+        "name": "Reject duplicate action in a delete batch",
+        "category": [
+            "actions",
+            "gact"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            [
+                "$TC actions flush action gact",
+                0,
+                1,
+                255
+            ],
+            "$TC actions add action pass index 1"
+        ],
+        "cmdUnderTest": "$TC actions del action gact index 1 action gact index 1 action gact index 1",
+        "expExitCode": "255",
+        "verifyCmd": "$TC actions ls action gact",
+        "matchPattern": "total acts 1\\b.*index 1 ref 1 bind 0\\b",
+        "matchCount": "1",
+        "teardown": [
+            [
+                "$TC actions flush action gact",
+                0,
+                1,
+                255
+            ]
+        ]
     }
 ]
-- 
2.43.0

