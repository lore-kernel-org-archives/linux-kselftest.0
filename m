Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778BF515968
	for <linux-kselftest@vger.kernel.org>; Thu,  1 Oct 2026 15:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790868740; cv=none; b=M2l2J+Xs6cFNF/mpt2XeyvEWSxwrldz2+G9V53jXHMyX1l8jRfU2dQMSXA7WlOhPEOLkJosCxwQR9zbvu/BST3IOSOMIUA60VKTXMES+kdUpBaYFyyrN2t35J8XMFsTYXFKYQ8P1avgfXmVnXsdvVUVKErQFSE5q8k8MOLd8Yvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790868740; c=relaxed/simple;
	bh=0NgJKro7+ay3ell043opk96SgIkwp3rFoIESVDypmpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bNQ+225u+YZrb6uYnkpFlLkJkqNkO5JqVRK1wCQbe3StezH7AU+w9BO0NG89O9HTzm65ZVJq0YBN7jFcVfLyVPO8br9pd/r2bJM6tPqDYjJZsdgQHy3xtSHnCj0n9C+UDh5qKyRJvu1lrov7VfAwuIshjXwp4lJNdl5tJgsmW2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=tCbVGoZF; arc=none smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="tCbVGoZF"
Received: by mail-yx2-f40.google.com with SMTP id 00721157ae682-8a87fe69060so57609077b3.3
        for <linux-kselftest@vger.kernel.org>; Thu, 01 Oct 2026 08:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1790868738; x=1791473538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XBC9cR5YJ0lwccbst7C+J0UlZRe88Kg57VsGwd5ApQ0=;
        b=tCbVGoZFhxw0i3BW11gScSjXACxmzEjHSGzL962muHULDreHtpAiSjZP1kDD3Y0Jpi
         4pv3z5J79xla5/twCrHpMHHvr9Unb5mnGFeufM0qw6SBjWJpAIfBjjFCMkJSf7v9u8l5
         vogOcFLmeL4R5u5dYkaLrX5fAHcgo0SjqABJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790868738; x=1791473538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XBC9cR5YJ0lwccbst7C+J0UlZRe88Kg57VsGwd5ApQ0=;
        b=XE2bDfeBZFOi/AdyzNK33MgIE0NDYVKEQOXeDVqS9ivrdPnP9UszLTDowDLhraR0fr
         NurtHeqactSMBGwPDnNok+aa+L+Q7F8vAS43cvxOoDTHoVWduosEvMVFeyTsPXcVXzqQ
         GZtMfsT+QCQhMEHPK55HM4tbPdVlEc6aBgDPborqZk7MLNkwoea0hcWadfsWEIbh8zkV
         YvSK6Ddo7ZBbTX88scgKqYCPTwXFaLG9Cul71Z3xpNcNfTSx487Bvu0TF3tIgWa0rtfj
         gtic2iHQ9sXgWUHP4J2xH7kAeQFjHkkl22eyfQVdjvFAinfy5BTCcnEXp0fE0m7+rDuZ
         DVqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxccjr7wTZabT56KhC2DCVDEoNjWcndM+RFHbasbRHh3Mo/q8PZt8w7bXOIKADaKuLCOArCBP9uZwHHiChezu4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqhmw0eUjONebeEKSCylxgDIA/YZYg0R/dHmVMTdJFNNtBHIbr
	+TVPnAPFfO8WR1zEL4oM82Wg3MuGpAokLfDzV4s+AKJmg0046hLSgQZWHVnG6X25JQ==
X-Gm-Gg: AYBFou1QZd4LeVT+v+CeTp0xvCLhF8OYvQNWEp8c8JFq7J5EFmbN20cZpcpYQhF4xk3
	AqVLvn66+P+XlRPfgmETLvMvNT4TLPXf7Mlr+HZvDPnMocZmMJ7f/jph5wz6yZku2jdq3zPBAhp
	TvrtFBgRtmotiyPJmpEVKmQQgJFh9rgbqG/p7Hq9WVtY9D0YW7jl3RvkBkSSnRJcvrrnS84G4pv
	P6Cc6crPw+2GR8TGtBxi/jFpabGNGiZhEZY6KBoxiyYLSiMx7cKEyPDcICypuMVxIcU2ibzDQmd
	7ERzDjtd+2tiqtwXT+m78wzuXIhDvTNYLNcA5Tjefaoji4N3TecSDWkr1ZcRRPktuzGVjYlUblo
	idQ/y3t9aEdz+EML3belPXue4rAFhLCoMY2fx8zSopmupq+mRynChR+dx2IAqKY2kPpvbDoaS1e
	Vm4esmPgUpdVNQurboDMSpWGrOcrOlXH6QJA1YAAcgrT1v9AhXMDC9ztU+4NChw8i7Sw6Wx7+qy
	OZv+LM8dvlPFp0=
X-Received: by 2002:a05:690c:d84:b0:884:c81e:f868 with SMTP id 00721157ae682-8ac9321e144mr28272647b3.13.1790868738199;
        Thu, 01 Oct 2026 08:32:18 -0700 (PDT)
Received: from exu-caveira.tail33bf8.ts.net ([2804:14d:5c54:4d67::2000])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8acdad046b1sm12059277b3.30.2026.10.01.08.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:32:17 -0700 (PDT)
From: Victor Nogueira <victor@mojatatu.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	netdev@vger.kernel.org
Cc: horms@kernel.org,
	Eric Dumazet <edumazet@kernel.org>,
	hybris <hybris@mojatatu.ai>,
	Sashiko <sashiko-bot@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net 2/2] selftests: tc-testing: add cls_route no-routing-attribute change tests
Date: Thu,  1 Oct 2026 12:32:01 -0300
Message-ID: <QDISC-0JB3.v1.20260923100921@mojatatu.com.2>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <QDISC-0JB3.v1.20260929143022@mojatatu.com>
References: <QDISC-0JB3.v1.20260929143022@mojatatu.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a boundary pair for route4 change without a routing attribute:

- a classid-only change of a wildcard filter (handle 0xffff8000) is a
  metadata-only update and must succeed;
- the same change on a non-wildcard handle (0x10001) would rekey the
  filter to the wildcard bucket, leaving the handle userspace stored stale,
  and must be rejected with -EINVAL.

The change of a wildcard filter is the flow iproute2 uses by default
("tc filter add ... route classid X:Y" gives handle 0xffff8000).

Reviewed-by: Jamal Hadi Salim <jhs@mojatatu.com>
Signed-off-by: Victor Nogueira <victor@mojatatu.com>
---
 .../tc-testing/tc-tests/filters/route.json    | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/filters/route.json b/tools/testing/selftests/tc-testing/tc-tests/filters/route.json
index 2d5843aebd72..c3b6ff157d3e 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/filters/route.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/filters/route.json
@@ -412,5 +412,51 @@
         "teardown": [
             "$TC qdisc del dev $DEV1 ingress"
         ]
+    },
+    {
+        "id": "4000",
+        "name": "Change a wildcard route filter classid only (no routing attribute)",
+        "category": [
+            "filter",
+            "route"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            "$TC qdisc add dev $DEV1 ingress",
+            "$TC filter add dev $DEV1 parent ffff: protocol ip prio 100 route classid 1:1"
+        ],
+        "cmdUnderTest": "$TC filter change dev $DEV1 parent ffff: protocol ip prio 100 route classid 1:9",
+        "expExitCode": "0",
+        "verifyCmd": "$TC filter ls dev $DEV1 parent ffff:",
+        "matchPattern": "fh 0xffff8000 flowid 1:9",
+        "matchCount": "1",
+        "teardown": [
+            "$TC qdisc del dev $DEV1 ingress"
+        ]
+    },
+    {
+        "id": "907a",
+        "name": "Try to change a route filter with no routing attribute and a non-wildcard handle",
+        "category": [
+            "filter",
+            "route"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            "$TC qdisc add dev $DEV1 ingress",
+            "$TC filter add dev $DEV1 parent ffff: protocol ip prio 100 route from 1 to 1 classid 1:1"
+        ],
+        "cmdUnderTest": "$TC filter change dev $DEV1 parent ffff: protocol ip prio 100 handle 0x10001 route classid 1:2",
+        "expExitCode": "2",
+        "verifyCmd": "$TC filter ls dev $DEV1 parent ffff:",
+        "matchPattern": "fh 0x00010001 flowid 1:1 to 1 from 1",
+        "matchCount": "1",
+        "teardown": [
+            "$TC qdisc del dev $DEV1 ingress"
+        ]
     }
 ]
-- 
2.43.0

