Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4066D5616C2
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 16:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790094849; cv=none; b=UqdgHUYYedgBAg3Xr9+iUeXqkqcKHZg+bMnbNM6onmgP7c4tlf97kuctX3h99946rvjkp9Q/+FDR8vooMFWTtwu/QoF2fb5plVGMxRoroDQpIzJzQdeqymtWc4f7qEkgHO99LDSZo5QFbj+cRTuMZpyhLjMe2TsMm5d7/sbwCaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790094849; c=relaxed/simple;
	bh=Dw4v6JTx0Usn/ZJ4sCYj1U150VDxILnbuKrTSzqE7i8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hU47+F1x/1ibJErIeP39299zilWV2rDU5osUlNQ7XiuJrI8ewL5LAODIlw/F10Xa2jnRXWtsqwWvhinmaAOkMIMAM70pEGUoaqMzXAoGuuPzG2kn2jyQ/oVRkpjm9KP/oTOmkVgI2GUu0nwHx3B11uhXADmmfsEvlnhP4AIHac8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=TvVXMcHq; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="TvVXMcHq"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910a0cb7cso7877385a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 09:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1790094847; x=1790699647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=47mRdp5lPPjFXCfKGuPUegA86O97/a2J/8sFoZV85O0=;
        b=TvVXMcHqj5Xpoue63gH6PgeV/If0sHbl7UvVRoDquK4x78QvkIDUgPgTd1fStwFiJd
         l6G4mcAkrB3woNqfeeHgNxzhLJKc3McgSGqz1vW3Cms5RZXdlRQMQMYAZghGHRPHMgTk
         n6WObcpe/oKHv9FvMhOkASnn3PV1DfvYbNC0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790094847; x=1790699647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=47mRdp5lPPjFXCfKGuPUegA86O97/a2J/8sFoZV85O0=;
        b=OjB0UAAfE+1EA0pLzk2MdR0XwSkfrEAX9RqiCpg/ztEu8qDAgM7+UCIdvKF3d2TsEY
         ThtEToQBJUT17NOApOmc3wCQaYeUCgx2lT4dMcUM+N2/SDQVsXt/dVtir/dZKq/TFUod
         6GXzukMA7062R/3p3ifufa1FYPJD5CEHhkXpqwzwZLSAQZrybdlsN6OwH9D0hfvGBI9F
         WUzvgjMCxAs6r2TotbFUY28yDEVRo/ChB/zjms4HjiTiilNHbcT2Lewabd4AvryfPkif
         KKFs9bF1i3KhUuftEi3n6G8yXfwQa8FgZJ0GUu1wlChRouCPTQ6fHUdfSY40h4slxCai
         DZBg==
X-Forwarded-Encrypted: i=1; AKwUvBxnkCRmuxyg8ga3iV/xmsOtNi5zjnCyjZ6STP9gTlqPAaQiyqXjGzVoAj7A1uQPGo1BGEbkJjwv/foyBJZEjlU=@vger.kernel.org
X-Gm-Message-State: AFuF++lJ9ha1tqTO0XIoMiYeJQw2Nut/WZLNYNxyFK6S1fk1SZtPqsFr
	qlkXwXXMjUby6nniS2G/HDlwGUzE5lJNjs2sJWqv5OlGP3R8ki8Lvvx4gGnESKXJqw==
X-Gm-Gg: AYBFou1P6GEc9MSIjuLO6viDciKf5OMz7lQ7JwFc9vqkHdhoZMtRoFbCg6jft1ADZcc
	E2Imh3ZEVizNevE77rAVvS89F5OoVJbiO3Lciz5MJnbKj15U8Z5nY+g40eUdJyxrsveX35c1vnD
	YE+zXktMw7MGnWdAEEF/ESHft2b5AgzjpUYCKavFdhrE7/OyPtMNLYcAyPGwegrn8TFe/RSnqpc
	hiOnm/4vF+AW8g6kziQ1M1+xpbE0dRHLEkfPErujD5UKrIioJv2M0hDZvYR3AtwsTM27bOn6hPa
	AKFEJDfGqXCygGBKeCXtocCehf6/W/bCo1hKH8fwU+s24wco4hdOjOz5Bv5v6QbrjDfgZ0SmWVN
	3lAptGCBtzPPT4ti1/0dXHfCqLrQtTls+1xLzk4rEEN5Wdu5sSSWkMqGIqYB7S9wQ6dXDTja3im
	jYIpUqZkMWAAeCjS2flXEAEiJgqy9cJUnDtphtt8+l0iSjhjYVTgrfuVQgiWM+wivq7mqNozHi1
	SmyxaWoz9E664XaeG77CAYSwmrhGTJCovHOkJJz4NTn4IRNyg==
X-Received: by 2002:a05:620a:628a:b0:93b:e82b:a584 with SMTP id af79cd13be357-93c15e7be9amr598167585a.35.1790094846976;
        Tue, 22 Sep 2026 09:34:06 -0700 (PDT)
Received: from majuu.waya ([184.147.180.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c248bd54esm11220385a.38.2026.09.22.09.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:34:04 -0700 (PDT)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	Victor Nogueira <victor@mojatatu.com>,
	hybris <hybris@mojatatu.ai>,
	sashiko-bot@kernel.org
Subject: [PATCH net 2/2] selftests: tc-testing: add duplicate action delete batch test
Date: Tue, 22 Sep 2026 12:33:59 -0400
Message-Id: <QDISC-K1TH.v1.20260922072206@mojatatu.com.2>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

