Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321050;
	b=ZEZWkcFp25Cg9Cs6U7eckAOcIfehKJoKO1tcx8ZNJMbRuB5uO+6/VXdtJE5puC+8glvP
	 9PupmarA/ZMHqobyXnoHNa9xHu4RuuGI7HHYnVVhACuc0tZQK4CbteChLoLjydHYwHAR9
	 nAbRdRDyRlwS4qztmUlXoS/XbxYJtdPnVAG1SU03luXA3Zob/MlI7VtkS1kRmLbxI3S4A
	 Fmq6iuqWIK6+JKi81zCcTrXsUngYk99dd42hiT7zGwce6n0wg61Q1VFk4HARBC+eWxKuW
	 v19Is2Z84Olt5+oG0i+M5d2/wfhSZtZzA4glMNCwblPMiyO3r0qV5qgSffxZAnS4VtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fNa1xdEpmbFyF+l7+hVWyqNLuHnz9gH2/3mfUuMmMKk=;
	b=uMhdIequxyhLwNImvWONhUDU9kkjCX/5+LhfjNEOK0aZaYa8zSzyU2PbrxR3vukZf16w
	 rmTiItbwdZJr+a8+2HGCAmeHb4cictMOpmCupnKliZqpYtwYXaZQFMNVMKY4afbSEm5xi
	 jduA2xhk0ouWQWJMY1pLYjEO4CVUVFrEivPjyuldt/7u+GtIZggJuaQLEHPqtx7yo+0Ja
	 5Xn3LmC6Ev+jSIx1qkY/Ajiud7Up4JIUPg1twubab9FOOgVKKy9WUaHg0z0XRkCA4WGJe
	 W6ZsARNenrX9Uji9K5G9Beho2evgUFLH6eGO6nQNa7sm2LtR0T+ZVXEVamgGq9X534g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=pitVaTKV;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99477606A337
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 14:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99477606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=pitVaTKV
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b31ca7e0bcso22495927b3.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 06:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794321048; x=1794925848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fNa1xdEpmbFyF+l7+hVWyqNLuHnz9gH2/3mfUuMmMKk=;
        b=pitVaTKVtNyOjILUZ9LLe19LzOT+Rx/o8gl01O0hWBF2qjOM4uS4GPoJL42N1pmf4Z
         gpvhEucurAn+uV23xQ6zy/AYj7RfIXF+qbjhtlIuEqkocn9moMaSz57t+zmTpEaF2jjL
         rBCUI06rNh+KzYqJbTHGB4GktBJo0sx+EDvgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794321048; x=1794925848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fNa1xdEpmbFyF+l7+hVWyqNLuHnz9gH2/3mfUuMmMKk=;
        b=FvMrqEM2zg5040EIeFeoYQ8wvJP4klMfdUNYNzLkXxXhveaAAC3YWryycA5lVJi3Os
         BWtrUUXNbRjLMYeeSkqevKF8rB1nN6KGp5DAjW/d4HNXzF8lthw+cYY7fCvaEJTdv6pk
         i0pku9uHNP/OXIl9L/IccrF5HL6niLLCKBEOzynvwW1OhUMIBEVdeXn7jRpMm70pUjj/
         dN1VgEkgOFsUJCQlw1NakPYN2j2vPNq/rfv5RESfRfbtLiOd0oa3a5Z1pUpf9O2/1dZQ
         01q5RVk7Q65p0SpOSFpY9kp+Jc9JOad04ARh4BsahWoevW9oK24prc560FOJd3eKnF44
         qC1A==
X-Forwarded-Encrypted: i=1; AL+hErHnk2W9us8gD3EdYPhbJwzaBWYUj/6Yfy6oJDZpZ1W9NTI7ql4R5+4TIo8figS1UNIGlnBnde0D9y9ep5D+KwA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BMNjZh/+GqXAf5r4oU9HazQJm+YIkJWSkLN5HAHj1ImiOhEWb
	7ZQ0gY2DoUGduqRAroXQ6dRN3/sOBh4UdeXUk0jkr6I7Uejz32e79a1Q488v9izLLg==
X-Gm-Gg: AYBFou2BoSjOC6cFsgONHTiMQG7hhOwNhYdtEWSMGL111f1CWh7KOro1hv3fz/BZpqB
	Zi0y5Lxz/YhdALe+RKKlR+BFoYZpPHQzAXVM3Pz6Gu+Dl4LfFoWJqw2YnlIHuQdfYm+ikH3zalk
	eZqVOD22tx7zjAg6NdkLCpU+eQFuOS43M5CN4ZqZJ5bw0wnDJcTQFDPWx8mZ7onwLOsVACFNkmu
	+dUAccvVIllIpBql7bL2J4Lha8O5vhNokmqO1oyC3OeATpL0MIPl51eOxJpL+oAwyhgkmI4Hybc
	peCrNnx+5R6o3NSvoQeprhU0GrbP5vSqJqMf035L/QjAW+8AIUSde15pJtbA/18fJ1jC+73KqIQ
	feGI7j/pCgcdpPMDN/3ISQy2MWZgOsSqf50/ORJHfdIUtbi6mWLFZqcHc4xU/kQ9MJeOizwf/KL
	x99WJmJaghmq9lWNmKM1csoV/7AgB4iOPMgEMWncn9MkSf2HnxZopI29Tu5KkyDsFnumkDSwalj
	vNxlYqPMo9gjWSeL/IZnFn2HjCJU4RfP5eIHHYAtnzL+imwD9v+7uNR1M6wKyREzVa91NsGwfHW
	iK23QFd7NZjTQg==
X-Received: by 2002:a05:690c:388:b0:8b1:1daf:a54 with SMTP id 00721157ae682-8b392a6f927mr16383617b3.40.1794321047453;
        Tue, 10 Nov 2026 06:30:47 -0800 (PST)
Received: from exu-caveira ([2804:14d:5c54:4d67::1c9d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393479120sm20091647b3.45.2026.11.10.06.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:30:46 -0800 (PST)
From: Victor Nogueira <victor@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	sashiko-bot <sashiko-bot@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v3 3/3] selftests: tc-testing: pin DRR and ETS deficit refill semantics
Date: Tue, 10 Nov 2026 11:30:25 -0300
Message-ID: <QDISC-TIAE.v3.r0.20261109173518-3@mojatatu.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <QDISC-TIAE.v3.r0.20261109173518@mojatatu.com>
References: <QDISC-TIAE.v3.r0.20261109173518@mojatatu.com>
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

Add tests that check the DRR and ETS deficit refill, so a change to the
refill loop can't silently alter the result.

The cases:
- 3f3e: one DRR class, quantum 256, sends a 1514-byte packet; the
  deficit ends at 22.
- 57a1: two DRR classes with 1514- and 514-byte packets; the 514-byte
  packet goes first.
- 2177: the same as 57a1 under ETS. IPv6 is disabled on the device so
  its router solicitation doesn't land in a band.

57a1 and 2177 put netem under the classful qdisc, so they log the usual
"non-work-conserving?" warning. All three pass with and without the
previous patches.

Reviewed-by: Jamal Hadi Salim <jhs@mojatatu.com>
Signed-off-by: Victor Nogueira <victor@mojatatu.com>
---
 .../tc-testing/tc-tests/qdiscs/drr.json       | 82 +++++++++++++++++++
 .../tc-testing/tc-tests/qdiscs/ets.json       | 54 ++++++++++++
 2 files changed, 136 insertions(+)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/drr.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/drr.json
index 2b61d8d79bde..d7ac32294738 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/drr.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/drr.json
@@ -86,5 +86,87 @@
         "teardown": [
             "$TC qdisc del dev $DUMMY root"
         ]
+    },
+    {
+        "id": "3f3e",
+        "name": "DRR deficit after refilling a 1514-byte packet at quantum 256",
+        "category": [
+            "qdisc",
+            "drr"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            "$IP addr add 10.10.11.10/24 dev $DUMMY",
+            "$TC qdisc add dev $DUMMY root handle 1: drr",
+            "$TC class add dev $DUMMY parent 1: classid 1:1 drr quantum 256",
+            "$TC qdisc add dev $DUMMY parent 1:1 handle 10: netem delay 2s limit 10",
+            "$TC filter add dev $DUMMY parent 1: protocol ip prio 1 u32 match u32 0 0 flowid 1:1",
+            "ping -c 2 -s 1472 -i 1 10.10.11.11 -I $DUMMY -W 0.01 >/dev/null 2>&1 &"
+        ],
+        "cmdUnderTest": "sleep 2.5",
+        "expExitCode": "0",
+        "verifyCmd": "$TC -s class show dev $DUMMY",
+        "matchPattern": "deficit 22b",
+        "matchCount": "1",
+        "teardown": [
+            "$TC qdisc del dev $DUMMY root"
+        ]
+    },
+    {
+        "id": "57a1",
+        "name": "DRR serves the class that fits its deficit first",
+        "category": [
+            "qdisc",
+            "drr"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            "$IP addr add 10.10.11.10/24 dev $DUMMY",
+            "$TC qdisc add dev $DUMMY root handle 1: drr",
+            "$TC class add dev $DUMMY parent 1: classid 1:1 drr quantum 256",
+            "$TC class add dev $DUMMY parent 1: classid 1:2 drr quantum 256",
+            "$TC qdisc add dev $DUMMY parent 1:1 handle 10: netem delay 3s limit 10",
+            "$TC qdisc add dev $DUMMY parent 1:2 handle 20: netem delay 3s limit 10",
+            "$TC filter add dev $DUMMY parent 1: protocol ip prio 1 u32 match ip dport 1111 0xffff flowid 1:1",
+            "$TC filter add dev $DUMMY parent 1: protocol ip prio 1 u32 match ip dport 2222 0xffff flowid 1:2",
+            "python3 -c \"import socket; a=socket.socket(socket.AF_INET,socket.SOCK_DGRAM); b=socket.socket(socket.AF_INET,socket.SOCK_DGRAM); a.sendto(b'A'*1472,('10.10.11.11',1111)); b.sendto(b'B'*472,('10.10.11.11',2222))\" >/dev/null 2>&1 &",
+            "sleep 1",
+            "python3 -c \"import socket; a=socket.socket(socket.AF_INET,socket.SOCK_DGRAM); b=socket.socket(socket.AF_INET,socket.SOCK_DGRAM); a.sendto(b'A'*1472,('10.10.11.11',1111)); b.sendto(b'B'*472,('10.10.11.11',2222))\" >/dev/null 2>&1 &"
+        ],
+        "cmdUnderTest": "sleep 2.5",
+        "expExitCode": "0",
+        "verifyCmd": "$TC -j -s class show dev $DUMMY",
+        "matchJSON": [
+            {
+                "class": "drr",
+                "handle": "1:1",
+                "root": true,
+                "stats": {
+                    "bytes": 0,
+                    "packets": 0,
+                    "backlog": 3028,
+                    "qlen": 2
+                }
+            },
+            {
+                "class": "drr",
+                "handle": "1:2",
+                "root": true,
+                "stats": {
+                    "bytes": 514,
+                    "packets": 1,
+                    "backlog": 514,
+                    "qlen": 1
+                }
+            }
+        ],
+        "matchCount": "1",
+        "teardown": [
+            "$TC qdisc del dev $DUMMY root"
+        ]
     }
 ]
diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.json
index d2eab61c099a..ea3adba2f06c 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.json
@@ -1007,5 +1007,59 @@
         "teardown": [
             "echo \"1\" > /sys/bus/netdevsim/del_device"
         ]
+    },
+    {
+        "id": "2177",
+        "name": "ETS serves the band that fits its deficit first",
+        "category": [
+            "qdisc",
+            "ets"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            "$IP addr add 10.10.11.10/24 dev $DUMMY",
+            "sh -c 'echo 1 > /proc/sys/net/ipv6/conf/$DUMMY/disable_ipv6' || true",
+            "$TC qdisc add dev $DUMMY root handle 1: ets bands 2 quanta 256 256",
+            "$TC qdisc add dev $DUMMY parent 1:1 handle 10: netem delay 3s limit 10",
+            "$TC qdisc add dev $DUMMY parent 1:2 handle 20: netem delay 3s limit 10",
+            "$TC filter add dev $DUMMY parent 1: protocol ip prio 1 u32 match ip dport 1111 0xffff flowid 1:1",
+            "$TC filter add dev $DUMMY parent 1: protocol ip prio 1 u32 match ip dport 2222 0xffff flowid 1:2",
+            "python3 -c \"import socket; a=socket.socket(socket.AF_INET,socket.SOCK_DGRAM); b=socket.socket(socket.AF_INET,socket.SOCK_DGRAM); a.sendto(b'A'*1472,('10.10.11.11',1111)); b.sendto(b'B'*472,('10.10.11.11',2222))\" >/dev/null 2>&1 &",
+            "sleep 1",
+            "python3 -c \"import socket; a=socket.socket(socket.AF_INET,socket.SOCK_DGRAM); b=socket.socket(socket.AF_INET,socket.SOCK_DGRAM); a.sendto(b'A'*1472,('10.10.11.11',1111)); b.sendto(b'B'*472,('10.10.11.11',2222))\" >/dev/null 2>&1 &"
+        ],
+        "cmdUnderTest": "sleep 2.5",
+        "expExitCode": "0",
+        "verifyCmd": "$TC -j -s class show dev $DUMMY",
+        "matchJSON": [
+            {
+                "class": "ets",
+                "handle": "1:1",
+                "root": true,
+                "stats": {
+                    "bytes": 1514,
+                    "packets": 1,
+                    "backlog": 3028,
+                    "qlen": 2
+                }
+            },
+            {
+                "class": "ets",
+                "handle": "1:2",
+                "root": true,
+                "stats": {
+                    "bytes": 514,
+                    "packets": 1,
+                    "backlog": 514,
+                    "qlen": 1
+                }
+            }
+        ],
+        "matchCount": "1",
+        "teardown": [
+            "$TC qdisc del dev $DUMMY root"
+        ]
     }
 ]
-- 
2.43.0

