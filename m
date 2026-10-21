Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.60.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792611151;
	b=XSRLlWW2KI3sc4MG3bntywbS+lc2qaJzgLpqEYfKI1RNHfUDiqR8S0gQd0peSEGcN83q
	 xgXf1kDgVzu7InjSeiTijXkuRH7IDxHjeD4gjsxRTvqfdKlBSlZSRzkK8WgWM9wmE77VZ
	 DspqjZ2u23zhbQ7LEKLGHyaUm/mO4ePwS3yTETEm+lFflboXCNXHHoOfju1kWvdQZo/Vy
	 OfIPClHQEALSCDQgTO7rMlmrm+Fc/dn1qGLO2j2Om2gUujjb8fxCS+pZJvMuCLclFVO4m
	 m6wMe33uWGZ6ybIip2ndJJrtxbXaCyElyH2SqolG0+4J5aPhnnN5fcpOGyIp5TRoL0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792611151;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HfB8gb1K6eB7qErBRf5nApOb7SVOWRVqyXm7olVUNrE=;
	b=dY+uR9ozuiJQUTCRJ8He5qtZsu0Ua0UxXhee3AvJ9s4CUiB4R1H0zs2n4Wd3fUDuqoyd
	 qy1x0nGGy5CnsVsk2IZH5LKAD5cmqkSG1waesLD48A4BVGhuHdv0jj9+i7Ku3YRYpU1Ll
	 TGNM9iZHlQTooIfaDbjjn7NISzIXq8M+PShyG2B72oTLour83L8VXX61Udg6yFA/EE9m8
	 /3yC6QEm6lOvI7zDDHrCSEJaIwWxELYnK9RbzHYGUIxiZytKBb1W9+wH458jyXtq08XhC
	 y5Ahh8TVzYRXCvBEuh9Z82w4VWg2XNRZ8zy7oJ7oiXGzhl7LiRUTaxuvXK0zOsMdbdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=corp.free.fr;
	spf=pass smtp.mailfrom=corp.free.fr;
	dkim=pass header.d=corp.free.fr header.i=@corp.free.fr header.a=rsa-sha256 header.s=rcs header.b=CUL0C01G;
	arc=none smtp.remote-ip=212.27.60.169
Received: from rcs.proxad.net (rcs.proxad.net [212.27.60.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD60D606A31D;
	Wed, 21 Oct 2026 19:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD60D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=corp.free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=corp.free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=corp.free.fr header.i=@corp.free.fr header.a=rsa-sha256 header.s=rcs header.b=CUL0C01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=corp.free.fr; s=rcs;
	t=1792611149; bh=0UiKimNmd/soaTpaeRFysG5BHlACOaUPTiJRSadfkK0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CUL0C01GvepM6eqnGG+9wtxbhefWAkdxIvRRauSOrvKqtp7NwkG9i3sJf/EYBbbR5
	 c7pzLwbVELhDDu4W1642lZtuDZ/HWb4dnoIIbKGRZ1FijW4nkDGmFQfQAsnhflP0Dm
	 TF4UkHeM/5K9QXOBHnqFXL4V/0J2U7UfDAO4UYT1RVH6S0qy9EYSzq//lTRl6Q7VqW
	 RkdrO/vOq2u3Ww0lG85gBQsAJpM492JzFp2hCseN2riZEzMkoMdPQP4gBaqxlg4rMP
	 04ZoEMAnDbzl6LpwbOHNOZaPSVzBtawLtVjUasvlnHjDU1J3JJ2yCjfi8l0uOMEGYZ
	 tjilM7y3MeOBA==
Received: from lnxos-dev.home (82-66-150-212.subs.proxad.net [82.66.150.212])
	by rcs.proxad.net (Postfix) with ESMTPSA id 1A97F44C2B44;
	Wed, 21 Oct 2026 21:32:29 +0200 (CEST)
From: Alexandre Cassen <acassen@corp.free.fr>
To: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net 2/2] selftests: tc-testing: test offload flags of reused matchall actions
Date: Wed, 21 Oct 2026 21:32:19 +0200
Message-ID: <20261021193222.1318333-3-acassen@corp.free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021193222.1318333-1-acassen@corp.free.fr>
References: <20261021193222.1318333-1-acassen@corp.free.fr>
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

Check that a skip_hw filter leaves the flags of an action it reuses
unchanged, even when the filter add fails on a later action. Also check
that a filter without skip_hw still cannot reuse a skip_hw action. The
dummy device has no tc offload, so skip_hw stands in for skip_sw.

Signed-off-by: Alexandre Cassen <acassen@corp.free.fr>
---
 .../tc-testing/tc-tests/filters/matchall.json | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/filters/matchall.json b/tools/testing/selftests/tc-testing/tc-tests/filters/matchall.json
index f8d28c415bc3..6b3eea401fc8 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/filters/matchall.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/filters/matchall.json
@@ -481,6 +481,77 @@
             "$TC actions del action police index 199"
         ]
     },
+    {
+        "id": "230c",
+        "name": "Keep the flags of a gact action reused by a matchall filter with skip_hw",
+        "category": [
+            "filter",
+            "matchall"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            "$TC qdisc add dev $DUMMY ingress",
+            "$TC filter add dev $DUMMY parent ffff: handle 0x1 prio 1 protocol ipv4 matchall action gact pass index 199"
+        ],
+        "cmdUnderTest": "$TC filter add dev $DUMMY parent ffff: handle 0x2 prio 2 protocol ipv4 matchall skip_hw action gact pass index 199",
+        "expExitCode": "0",
+        "verifyCmd": "$TC actions get action gact index 199",
+        "matchPattern": "skip_hw",
+        "matchCount": "0",
+        "teardown": [
+            "$TC qdisc del dev $DUMMY ingress"
+        ]
+    },
+    {
+        "id": "1f7a",
+        "name": "Keep the flags of a gact action reused by a rejected matchall filter with skip_hw",
+        "category": [
+            "filter",
+            "matchall"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            "$TC qdisc add dev $DUMMY ingress",
+            "$TC actions add action gact pass index 200",
+            "$TC filter add dev $DUMMY parent ffff: handle 0x1 prio 1 protocol ipv4 matchall action gact pass index 199"
+        ],
+        "cmdUnderTest": "$TC filter add dev $DUMMY parent ffff: handle 0x2 prio 2 protocol ipv4 matchall skip_hw action gact pass index 199 action gact pass index 200",
+        "expExitCode": "2",
+        "verifyCmd": "$TC actions get action gact index 199",
+        "matchPattern": "skip_hw",
+        "matchCount": "0",
+        "teardown": [
+            "$TC qdisc del dev $DUMMY ingress",
+            "$TC actions del action gact index 200"
+        ]
+    },
+    {
+        "id": "9117",
+        "name": "Reject the reuse of a skip_hw gact action by a matchall filter without skip_hw",
+        "category": [
+            "filter",
+            "matchall"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            "$TC qdisc add dev $DUMMY ingress",
+            "$TC filter add dev $DUMMY parent ffff: handle 0x1 prio 1 protocol ipv4 matchall skip_hw action gact pass index 199"
+        ],
+        "cmdUnderTest": "$TC filter add dev $DUMMY parent ffff: handle 0x2 prio 2 protocol ipv4 matchall action gact pass index 199",
+        "expExitCode": "2",
+        "verifyCmd": "$TC filter get dev $DUMMY parent ffff: handle 2 prio 2 protocol ipv4 matchall",
+        "matchPattern": "^filter parent ffff: protocol ip pref 2 matchall.*handle 0x2.*",
+        "matchCount": "0",
+        "teardown": [
+            "$TC qdisc del dev $DUMMY ingress"
+        ]
+    },
     {
         "id": "2638",
         "name": "Add matchall and try to get it",
-- 
2.43.0

