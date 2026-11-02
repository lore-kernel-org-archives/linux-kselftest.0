Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793579839;
	b=lT3043WF58/rEcSsq3AsxwvIPhuiKsKJdjKoEGaJSytnZCXQvUTjuX8pPuf3Ec87k9Fq
	 kuVcWr4ZW7n9w5Fv0IszYCHUQ0UZmjm7VY5ploa2chisFz9kWKm/y9kD/63YxVZgGygjv
	 aLFny16tW8wEYpgKfd8Iob0VGjquRVgtBUEw0OdWXsydpsOSa9Zi6+PqfbednJmEln2kx
	 liliEjDqdkmu8j1m5/S03EWk24P9pIXfrxBZFT5kqMghSgjhzdREHEEYv0wdvVe+pe3N6
	 cPv7d+xHkA/2tbhsDxUf5e/gN1JiGdxc0k6Hrw2H9o0rQu+L02g/boEhozAyqsgA2CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793579839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8U2P0iAh2BG7KjvPP6wqvmh3hv9L2W1VYLUEiGNWDRM=;
	b=WvyQgFc91BrhxT1g8z1Vco7aFUgG+rhTstaS11iek8FsqR0ZdRoduwlCy22Wc7b321pv
	 tR7d7WJSpIQmK0dAOzWnpiOd8RrOutcWyp+USyHXvEWn0bBP9OWYZnnTVcDzTu6vH7mzM
	 X44MA7dRWScXSFL5ax5PEElrEPKtwa3QMXw4lXOg/r8awoUNCXDE0hUrHL50z4RXjZ70o
	 QWLUq1KNDHThlkRDWcjg5jzFeWU82yEPdHA1lzDxip2JeEGp0NeSFBqrIHH+167qRdDM2
	 k+qSVRVW3vbKC4qTtfmq21iwNj4Ns+CUdMgsoVNRc4BD6VGyL8RLpUtsw+nP9x1sDcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=QcWYu3dF;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C08D606A338
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 00:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C08D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=QcWYu3dF
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91c5e31bea9so43983436d6.1
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Nov 2026 16:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1793579838; x=1794184638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8U2P0iAh2BG7KjvPP6wqvmh3hv9L2W1VYLUEiGNWDRM=;
        b=QcWYu3dF8fE5k6F25sAPvmrZihimPCxUbC4DFTVaeDf1sMJ7pYu2/tpkP8nXiDa1SB
         shV/LeeL4Y3hhZvtvFQb/YYYgk5J5HuSJOQWh22OoY47Kf/8wag8hjZsPj/eOEucflPR
         NWK6T/gRcP50O/9nH7z2lzsR+kwdrlHY+oo0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793579838; x=1794184638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8U2P0iAh2BG7KjvPP6wqvmh3hv9L2W1VYLUEiGNWDRM=;
        b=yXcdDVobZtldTajVAcR0IGblRl6CyX7ha4gMDNGZ7z7wEw2AqV13K2WI0h1b7q41x7
         qWI5hfLtScCsdRL9QXmH38qage8gx0IzPnvtPpo87i4wkrKNj4Xq87W5zJGP/i9of03+
         goxxMvnltT8RvHBQ4BKkf5OzUcZ7uR8qX3xjABIZtl4xzuhnEGGC2YO3qHWVeteK+Z0n
         vUOvAZSosw3gr6FxW7EGUWY1SNDgM0i+nIYYW3soh8YYvMzpgdlZuw5ILy0lmVX9zT+W
         5VSx9PfHKUw2Q/Ko6QADlfN62vsQf+sE/pbbwWue6ROYY9AIE3O8KgPsHPFtx6udG7hy
         3f2A==
X-Forwarded-Encrypted: i=1; AKwUvBxdtdw2+y8eeUtmhI86oumZ5mbZytcBXr0VaTaawPJli0E8fR5a82sIZwjMIPZyhmDdsMTvzUWffFuoCd5iz7Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z84LdlVN+v5QYvtUsUiR2B0aYvJP6uEbUI6ojeSjuQ3PWj8Iv57
	u4W6rdM62h+H8LLJMXXgZ6NrqYxInwTnLPJvsv8qwDWXXuA0eo28iG8+oAkjYfefQA==
X-Gm-Gg: AYBFou3HY7bc+JrjYHABUJqmVUsJ3cSPB7SQifrBjj4gETZXsJjw9FNn6hNNubcHE0o
	h9bmDJpf631RTj0P4pwx4ACWsvIH7Xh9o5Qsk/KxDwOslV4TpzhpDM8aQ3FdnvRQxA68+M9DMSy
	UCfqOvMo8t/bDpmyHtesbS6BKIJx8SKI1gaKekzPvDP5CTJXj+Dh8ap+qHAT9+CK2+4T707ipWF
	89d9d10deYEk4EJSgxExk5GWJhz+31r7a0TLChY+eO5hYcXOAQl2jAA8djjXDWnN7+ObgIFEUIj
	BQ6oFSncEAXQiLsj5kc2PRRlTchEa24KgmPuzYOMpxYL3mB/iqb3NkebvzH2OCfX2a5M43XjEth
	PwQGO43WDMZLgF7RE0CKs5rLoLxl59WFV4jJzjA24ni1xRrCS/QKzD/AcuE9hSpTYG59yWrcCDd
	jsNV/qJDyAAl8kgShP0jpo5No1vpj7XLrHuKS3HxdzKOzgSRYCKesGEWzGfsr7JlKRF/usUp73W
	GtLnUpuBFO57ukPmJ3kI+tYZbZ6SPPN30t1IylPgq5hHJBAa1alC+GF55uBz1zmQGuBAzKHCqCi
	PDEX4UG2tlit1AAkOpdvFfzcF2dvQhAOjZF4gsogHATKf4HImST/HmDGTN9MrU9zp4KLNm6W38p
	c9GY3EDhYR2SDJvo=
X-Received: by 2002:a05:6214:3d0d:b0:90e:8221:f1c7 with SMTP id 6a1803df08f44-91ca49e9c82mr156416236d6.1.1793579838604;
        Sun, 01 Nov 2026 16:37:18 -0800 (PST)
Received: from mbili.tail33bf8.ts.net ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7f23754sm77043066d6.9.2026.11.01.16.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 16:37:18 -0800 (PST)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Victor Nogueira <victor@mojatatu.com>,
	Sashiko <sashiko-bot@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v2 4/4] selftests: tc-testing: teql: reject attach from another netns
Date: Sun,  1 Nov 2026 19:37:06 -0500
Message-Id: <SER-NSBD.v2.r0.20261101171325-4@mojatatu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <SER-NSBD.v2.r0.20261101171325@mojatatu.com>
References: <SER-NSBD.v2.r0.20261101171325@mojatatu.com>
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

Found by Sashiko (nipa) while reviewing the previous posting of the
cross-netns rejection fix:
https://netdev-ai.bots.linux.dev/sashiko/#/patchset/SER-NSBD.v1.r2.20261031160050-3%40mojatatu.com

The issue:
Case 124e covers the root-only rejection, but nsPlugin moves the test
device into its own network namespace, so the namespace check answers it
first unless the two checks run in the other order. Nothing else covers
the namespace rejection: the teql0 master is registered in init_net, and
a root qdisc attach from the test namespace must be refused with
-EOPNOTSUPP. Without a case of its own, a later reordering can make the
namespace check answer 124e and leave the root check untested.

The Fix:
Add a case that attaches a root teql0 qdisc from the test namespace. The
attach is a root qdisc as well, so only the namespace check can refuse
it. Without the fix the attach succeeds and the master is mutated from
the foreign namespace.

Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
 .../tc-testing/tc-tests/qdiscs/teql.json      | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/teql.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/teql.json
index 0179c57104ad..3df315629d2f 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/teql.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/teql.json
@@ -106,5 +106,32 @@
         "teardown": [
             "$TC qdisc del dev $DUMMY root handle 1:"
         ]
+    },
+    {
+        "id": "6a06",
+        "name": "Reject TEQL attach from a different network namespace",
+        "category": [
+            "qdisc",
+            "teql"
+        ],
+        "plugins": {
+            "requires": [
+                "nsPlugin"
+            ]
+        },
+        "setup": [],
+        "cmdUnderTest": "$TC qdisc add dev $DUMMY root handle 3: teql0",
+        "expExitCode": "2",
+        "verifyCmd": "$TC qdisc show dev $DUMMY",
+        "matchPattern": "qdisc teql0 3: root",
+        "matchCount": "0",
+        "teardown": [
+            [
+                "$TC qdisc del dev $DUMMY root handle 3:",
+                0,
+                1,
+                2
+            ]
+        ]
     }
 ]
-- 
2.43.0

