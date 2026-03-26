Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833D7405ADF
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 18:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774549088; cv=none; b=O27+vvKYD04FtGepCcJguCA811sM+o4FfNg+uDbQXiS9B8zF0AUqNYmFqpJ9C9yvFu3ML6UnE7rTPQ5C8/Im9f/eiov52PwsEIJAyY14S0QDDOnTxacjfB5XVsxjRP5RJrC4xk8GdCGdgEpCaUul0JRP2p3XGf2XE7zR3so3/Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774549088; c=relaxed/simple;
	bh=xdUhF/KwIaxp28zFidG8j9PibEk6X7fY9j02u2I9ywU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NXe4H7P09twxDzuemZJhPlqI6V3W+duLjOrEZbPdWMhgRHXA/G4+cDmUozh4zDzrXlQu0QniYf2gsV+APzB3al2WS71sd4bC+IPvASoPjXJUe2BDXBVNhjgaSHPWt2AHoIoaPnC6ZaSWz3ebqy55KupnCPYkLDStdrvhYbMsctQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org; spf=pass smtp.mailfrom=networkplumber.org; dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b=GvlHPH3V; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b="GvlHPH3V"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2aae146b604so7759995ad.3
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 11:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20230601.gappssmtp.com; s=20230601; t=1774549083; x=1775153883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dh1r6Pvg7BKd1OpHUecM5F37Mt8FqKX1fTxba/c1k+E=;
        b=GvlHPH3VS2eK6FMcRfsBctB8QtRxpXMNencF/+xB2IqcVHnr3i8tdWFwlhKDq1hftd
         KxoD8wtwHrUhS4zbqrd9J/sQbp/kXERVwE7bAoAmLyd/ckrGdP1SRrPT2JhaV9B6Pib3
         +Utf1vooiwFnCiKVPZ+FfSBvoX6ftZXtQajkZsXgMbLjhLM1uTP94zs9MCA8CA9Q2YNL
         mDygCVsXJpy+jdPZcwWxbbRL5ONPHI32J3ggP6gSS7Bm3oxSpq/e8qT1YcNNSKu7Tmiy
         IPpTos3xhP4w5m9Lq451yiaMSHg6PiYpIlFgnYkI4t2HYHRHiCwPf+lIoAZY/pR2BdlG
         3pRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774549083; x=1775153883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dh1r6Pvg7BKd1OpHUecM5F37Mt8FqKX1fTxba/c1k+E=;
        b=FZBcZkWPTdZFKm6g4MsT8atAzajkCulRXIlkqpCMQ9KmxoZITPa/dAbuLJPwOGkZyw
         NLcshr15pxuJ3YJrKirmVOjMZRJrSpPNwiQ5fcrJZzl1w1Hi8hEW/QkPyWZGbLHMoTm5
         2MA9ITSOn9MHCG4jFRDcZw2NWZoa18rXcJQETlMaCBvTeLGWeF1VblreGtEI1oiU2HjR
         Q/ab9sgtO0sEBPV9Th5SZERB9GI0IfflqEKDrU3I71ErEWVWt8b3X4/dqAoCNxrz5KKD
         SRrzYeZ7XAP0ILxWRpMDtSAnQnZOm4FhFl5Aua25tdX7m9a4xABCy4MkvBCrC6r8qhuH
         UvwA==
X-Forwarded-Encrypted: i=1; AJvYcCVWAH28ShV0rhVecaZlj4M7wC8+Wdt4OKnbjX+q+3PC0enQLzw5OvvdhO4wcAeqI/wQefi90FCcm5dtC7daL8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRiWSGllQ9HvhId4Qf0HFIteJrnBIjNy21ze0d/fLKQZLT3sMR
	yObupvhV0JwPETu+bDTSGamRfp8BC/3rwv6pXHzjufSykVfAKzN1bWA/6x1alfPx68w=
X-Gm-Gg: ATEYQzw/WMs0Qwv3hpNJDWs/jrfybbiUlHUL+dxTROnQSlcQVfhln1Uxc/eOLDUSytq
	XN52/n/uGoXysOuIA0dwxGSfaE8PMInFPhZucUV4QejO1nRyX0DDcmclw0+ycNC5MsFLVya4yAZ
	/xH9WSq6cbUkn6NK3WoCuXcd7kD+Vua26YdqW+bT3tjo85z2eJJDa7kcQdCEpBbRtlTPwNlCu/N
	B697hdyMIOmqZL3R239o06wDU3uQdKfPmdPZVLLjZgUguwJjkVgJnwDgDvmfCjiITya9s7zXH+P
	NF9hiucgRCmuIhv759FyvuL7swskLrm1uHt2UeHJ4Kl+USedRKPkSgYLR8fEL71faccAemuX5rX
	guMb2ceW4EuJCdXw8rBat46CYHW9aZlSZVPIpsEFA4RLQFrzDAWtbXSrnNn0bpIn7rjvxWczyZr
	6Tght2I7mnlN6Rc0uME+ONYj+cKdbhNsAe
X-Received: by 2002:a17:903:32cd:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2b0c59f3e05mr23546195ad.9.1774549083508;
        Thu, 26 Mar 2026 11:18:03 -0700 (PDT)
Received: from phoenix.lan ([104.202.29.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc8c4bd3sm38590245ad.63.2026.03.26.11.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 11:18:03 -0700 (PDT)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: Victor Nogueira <victor@mojatatu.com>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Shuah Khan <shuah@kernel.org>,
	William Liu <will@willsroot.io>,
	Jakub Kicinski <kuba@kernel.org>,
	Savino Dicanosa <savy@syst3mfailure.io>,
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 7/7] selftests/tc-testing: Add netem test case exercising loops
Date: Thu, 26 Mar 2026 11:01:06 -0700
Message-ID: <20260326181701.308275-8-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326181701.308275-1-stephen@networkplumber.org>
References: <20260326181701.308275-1-stephen@networkplumber.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Victor Nogueira <victor@mojatatu.com>

Add a netem nested duplicate test case to validate that it won't
cause an infinite loop

Acked-by: Jamal Hadi Salim <jhs@mojatatu.com>
Acked-by: Stephen Hemminger <stephen@networkplumber.org>
Signed-off-by: Victor Nogueira <victor@mojatatu.com>
---
 .../tc-testing/tc-tests/qdiscs/netem.json     | 33 ++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/netem.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/netem.json
index 3c4444961488..7c954989069d 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/netem.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/netem.json
@@ -336,5 +336,36 @@
         "teardown": [
             "$TC qdisc del dev $DUMMY handle 1: root"
         ]
-    }
+    },
+    {
+        "id": "8c17",
+        "name": "Test netem's recursive duplicate",
+        "category": [
+            "qdisc",
+            "netem"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            "$IP link set dev $DUMMY up || true",
+            "$IP addr add 10.10.11.10/24 dev $DUMMY || true",
+            "$TC qdisc add dev $DUMMY root handle 1: netem limit 1 duplicate 100%",
+            "$TC qdisc add dev $DUMMY parent 1: handle 2: netem duplicate 100%"
+        ],
+        "cmdUnderTest": "ping -c 1 10.10.11.11 -W 0.01",
+        "expExitCode": "1",
+        "verifyCmd": "$TC -s -j qdisc ls dev $DUMMY root",
+        "matchJSON": [
+            {
+                "kind": "netem",
+                "handle": "1:",
+                "bytes": 294,
+                "packets": 3
+            }
+        ],
+        "teardown": [
+            "$TC qdisc del dev $DUMMY handle 1: root"
+        ]
+     }
 ]
-- 
2.53.0

