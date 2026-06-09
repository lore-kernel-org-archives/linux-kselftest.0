Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B314CA277
	for <linux-kselftest@vger.kernel.org>; Tue,  9 Jun 2026 18:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781031415; cv=none; b=AwjERPkH132CIfc/iYKCVq8Lm6qPVPtDDxTzqrJasS0RnzNfyyWRTkYa32zkBEBHkubVPYJKU4fl+UKsp5hJ+tIoehv50fGsBQ7lxvseEfiLCR0lhJXOhEeTwzAO2faatQO5hnCRQz4ojMvZrszdzzku7XNeR7uv1fP3VlAsJfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781031415; c=relaxed/simple;
	bh=eJrryJR7FC2wXcvBjW9Isaw+U5WrFzf+qgsOKVPU91Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m1RCBsacSCiYVXjh24Nc4txycRSlb8YAzV8kveszZrLpxcbp6Hsm/iuIrINnk3kRqv+CKR/zxG7kmXymPr5B3Z2L0U/lhW0lita27cPqwSNNaCsInIW9QVDg3/sODPSq3VRIe2CApLqEdWiT/+xTrgKkxhpeDUBOx93t3G2P7NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=P78xY7aM; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="P78xY7aM"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-9159477c893so733634085a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 09 Jun 2026 11:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1781031413; x=1781636213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UPa3Agakguu+yTP7S/VS7Anopqh6DOy/a2ofAVBPmuM=;
        b=P78xY7aMkl6+MYCnczOaIpAE/cmZfFqoGhah1y438V0079ncGNixFJgybKVAKJsbzB
         PBhvZZxgFxTTqz1knJ+2Y77dpA0lDvUuiNWFXQE4ZGBIwmx3HPgIcy4mc0mdExzfFU9X
         f4w5zQcNXlO2zXogSgyEBzzfoVQI8Eo2Kog4hMXWPUcGq4FqtURTaD1ew65JqOJkq+e1
         CK2wPLwB/Cw2ILrQhBudsNHEMpeQgYvZK2C7v5TuJxuep6uV+eu1GmiVwAiwrg77W9gY
         uajf0F8V1puv1nmWz3e6C4B8B/yOJOCFNkfw961pKCo/t0tPNWy3QsaLmE1TLXxO/24C
         nvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031413; x=1781636213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UPa3Agakguu+yTP7S/VS7Anopqh6DOy/a2ofAVBPmuM=;
        b=D9Mqw60JUZo+mGIpjsPfiymiNr8SULk5rp0B2DWUyt2tpnFsEySy8DyYjbRiBEG1Bo
         kOKK6K6Enzt95qv1iK/KOlX7lBSOCbI79fCaj5FZvfDzd4CYH7/Eq+i3kyxzCDMPW6b0
         cM1u3rmzz0Cqh3jZhiG5Wj16aQl6jZuUkQVgeG5l0roPuOAC9GsADiIcax1C8znBNkwE
         WCLU1uEBGrfZbe/G7SjmOY4jWBv3wEqAactE7xk2jabDM4tMkvP3LX9d3iwlsWTJHKaz
         CYSb0holE6H0iDCFcfaFTPPwP70DcqkbakL56NrCQ/jDSUJee/++ijitFI1B7T8yzSV2
         ch9g==
X-Forwarded-Encrypted: i=1; AFNElJ+YzoT8LILYJW1P3+nRDkK5LJcACxrdmwaOytC1RCN+Ps39U8uouZrAcIkGmuKCJq/SvZfs9rcO6sceH3V2/bE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJWvLY8je2uAsNyW8ku25IDW76wS+sijOqyEolugkLJVGMGsj9
	oSRKL61SwRVdmbwLep43zNIdoFm9hE8+wIMyVEVjVgs46uFCYz8qrkIb77pC0PnK5uw=
X-Gm-Gg: Acq92OF5EhWR+xcQkY3meScgyeg/8B61uxxZ8oJfLuoo2ZS8b7qo1E3rJDjP/UNRSS2
	K/iJhg8P0YvX3vAk/BrTbDx+xZqGghfnh89bNItpqtHOrnLeUHWxTn7T0XbItK4nzVqdmHzEMHh
	+IvUjK7clXl86Tz48qJYaecEB7elFQc/7iTSrfSoqFzfsId3S13MZrmPj4rDzV0u0r3cn2MY/tq
	wYviO+ciptsLtk7NppcsAu3l0csDijghK3iLAu4pPKkvjMqDXzY+skjZ8MBn9aFwXrH2NmTVeGN
	BcMP+FKxjmfYr9GmcVvJaCSqziDKCxpAsICChBLMSGN7gQDVXr0y471QxDC7J79l2Evkyb0Kipa
	4LoPzdwe4Mxz96GusOaspjPzzmkysjmTnDNJ6iTYm580LlCi72+hKr79xptVtPx9eyJULP8zS12
	blfTbx0cGAdGZQ4WWuOnVnizF+qXs9p+c9sxr9ow==
X-Received: by 2002:a05:620a:a29b:20b0:90d:501c:50 with SMTP id af79cd13be357-915a9c75e55mr2470804085a.26.1781031413022;
        Tue, 09 Jun 2026 11:56:53 -0700 (PDT)
Received: from localhost ([161.35.96.86])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-9158a00a4f4sm2355139185a.3.2026.06.09.11.56.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 11:56:52 -0700 (PDT)
From: Samuel Moelius <sam.moelius@trailofbits.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: Victor Nogueira <victor@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 2/2] net/sched: act_pedit: require matching IPv4 L4 protocol
Date: Tue,  9 Jun 2026 18:56:35 +0000
Message-ID: <20260609185636.1599359-3-sam.moelius@trailofbits.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609185636.1599359-1-sam.moelius@trailofbits.com>
References: <20260609185636.1599359-1-sam.moelius@trailofbits.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Victor Nogueira <victor@mojatatu.com>

Add a tdc test that checks the act_pedit extended L4 header mode does not
edit a packet whose IPv4 protocol does not match the selected transport
header.

The test installs an ingress pedit rule that sets the UDP destination
port, then injects a TCP packet with dport 2222. The UDP and TCP
destination ports sit at the same L4 offset, so a buggy kernel rewrites
the TCP dport. A second flower filter matches TCP dport 2222 and drops
the packet through an indexed gact action; the test then verifies via
JSON that this action saw exactly one packet, i.e. the dport was left
untouched and still matched 2222.

Signed-off-by: Victor Nogueira <victor@mojatatu.com>
---
Changes in v3:
  - Add test

 .../tc-testing/tc-tests/actions/pedit.json    | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/actions/pedit.json b/tools/testing/selftests/tc-testing/tc-tests/actions/pedit.json
index 37c4103321749..d8b685cfc62de 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/actions/pedit.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/actions/pedit.json
@@ -1920,5 +1920,54 @@
         "teardown": [
             "$TC actions flush action pedit"
         ]
+    },
+    {
+        "id": "1a4f",
+        "name": "Pedit udp dport should not mangle TCP packet dport",
+        "category": [
+            "actions",
+            "pedit"
+        ],
+        "plugins": {
+            "requires": [
+                "nsPlugin",
+                "scapyPlugin"
+            ]
+        },
+        "setup": [
+            "$TC qdisc add dev $DEV1 clsact",
+            "$TC filter add dev $DEV1 ingress protocol ip pref 1 matchall action pedit ex munge udp dport set 18053 continue"
+        ],
+        "cmdUnderTest": "$TC filter add dev $DEV1 ingress protocol ip pref 2 flower ip_proto tcp dst_port 2222 action drop index 1",
+        "scapy": {
+            "iface": "$DEV0",
+            "count": 1,
+            "packet": "Ether()/IP(dst='10.10.10.1')/TCP(dport=2222)"
+        },
+        "expExitCode": "0",
+        "verifyCmd": "$TC -j -s actions get action gact index 1",
+        "matchJSON": [
+            {
+                "total acts": 0
+            },
+            {
+                "actions": [
+                    {
+                        "order": 1,
+                        "kind": "gact",
+                        "control_action": {
+                            "type": "drop"
+                        },
+                        "index": 1,
+                        "stats": {
+                            "packets": 1
+                        }
+                    }
+                ]
+            }
+        ],
+        "teardown": [
+            "$TC qdisc del dev $DEV1 clsact"
+        ]
     }
 ]
-- 
2.54.0

