Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CD6339389
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 18:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791828582; cv=none; b=PUVu5e3iLYQPjK9maBVMK1evDVrEqFz6EyQz0w8h/XgtHpyHwUZsarOoCnYOhA3cvxThQlOb/eJWfPjRoPOJMoIi7Bc5eGLpnv3kqRQP8kBslZ4IT7axjUZeV/K3YU85k1FSrQnSesNbrzY3pxNUPhCpS8kxWWXBVJ0xcDVKl74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791828582; c=relaxed/simple;
	bh=7dL45bqoQHOpAqBjaboktIEncRFMXqYGop4CZl73qZk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j68OBP6s4jXca02qSCQeTRi5R8mAang98onuJ4/BySkYcWUuuagZjrXWhrlZ6gr2NUdR7WSHVuVy3Obbb7D+TcEmUZmY0Cnc5EAh6HPQpX7HCnpvrkzSAbg6IVVm5pNxsRrKbZh9aXWejDxXM53GYD6sbToF7fyTEaTxo/CKVJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=AwrPHoIf; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="AwrPHoIf"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5338c1197easo17468971cf.0
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 11:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1791828580; x=1792433380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l2panEO6FZ8rFQx3OSsMDR8OIAlR+sCRx07G93WCf38=;
        b=AwrPHoIf1Q6T20KEr5f/0TIEdCF7KIFK5bRmGISdBWIXxYAprDtC0Ij0s58Xf2a6QW
         DjXQneiz6g5p00Cq99MIP3Rc7CMH+re6bE8T4gUizOha+gzqRuKmXBLp4uak3c9Fq5xh
         BZxPpPxOc+x0qMnCsy3Jsi4LhyXsC7iRSy+NY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791828580; x=1792433380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l2panEO6FZ8rFQx3OSsMDR8OIAlR+sCRx07G93WCf38=;
        b=ry9Zzn7/i/zvidb04Zkd0GSI/Fbz7xX4wLP0H48N0Mk8J31KkvaPPxA/+ffO6TsBpH
         I4Z23vA9x3C16rreQ5A/wGOGj69DC1A+MaQugUhXP2yEFxRGbaIgIxF0I2YYfVIHm9m2
         g00J/zFZNttFqDGykh82YvdUn4Po0auqDOJOsLu26nRX3ivheHca0rkAJ7U5Pxe/J/fv
         iJm0qssU49PeX5RmZP0XrgzUnEop206WNmUM6D6GwhacwlBMeiPVH0Zyk5GXmyOZMOoQ
         dLrxKv9UaEyMG23uUehf/598zZucf6ViDXXMRK8Hgqt8NzcR3KrzqMbCfWE5MqZLY+xJ
         cqxA==
X-Forwarded-Encrypted: i=1; AKwUvBwvqIPMOT217iT2E3Wgdmza6Zk8ZhgUfXCfUfgL2d8gzeEcySmIIcEq6WvYhQSHkTuNXiRsgF1E74c4MmaGlIQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQsGS9YU6G/kS29EdFLWhhLbackPQNWxnzL1jpEfm8FJ5z7Z4d
	FpdZGElrFb6BdkIW9ylGdsSmHo37nsaUQWwGSOOBkshUpmNUldSTP89RikLhtSSDdQ==
X-Gm-Gg: AYBFou3ZGlt8x2gm69uw+7tG8R4p2y8rytEGsylcFAkQgWHurHRhwnAe8hT7/7l9mP2
	+URSWjdV6hzp/ExowYvfr1pRw9oYEhRLk0rLX+wh/xfpBZOuacYZQ+OzMf7SSH1PSat3pVNVs6I
	vvpUof+y8EIV+4n0C3bxzO7wh5s6ciLA/eLoqH2OOielSAX8Q4EiHQIkyEoIBcB9gKZbQUM1uNw
	nuIkU6pA8m65UKDA/H/7jLaLK0BfmSZ5n4N6P3IIxDCFu+hxEQZ1ThvbBMIUxWWgpoR9yL/m0dO
	OnT/Gxy5P9o4XF1kRsqoDYSZLVuoJSPjvUXPPZ3AZCRqPqPfYefkVwqowCWAtTlCXuKsaSyZDlI
	BBUC9GQmqzob5K6Z2TQPTDo7SAMARg04LcAkj9uYW5vBus7OPqkI0cmtNdbZM1XRlaTQ8HFhadg
	bilm5+a6+bqvssDtdG58ydrTN/kEsnYtcPzCN5LlKoFDHb0NGn5oMFihYzJidNGy/M7XZQgYuVR
	g+JtQWbWF3r3jdd4kfCKTN/CjhG08pzcct8lryAfInzfr4mF2NqRWs=
X-Received: by 2002:a05:620a:6501:b0:93e:a71a:5de0 with SMTP id af79cd13be357-93ebd21237emr1786785085a.26.1791828579786;
        Mon, 12 Oct 2026 11:09:39 -0700 (PDT)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef5086fe3sm43794885a.37.2026.10.12.11.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:09:37 -0700 (PDT)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Victor Nogueira <victor@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Vlad Buslov <vladbu@mellanox.com>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: [PATCH net 2/2 repost3] selftests: tc-testing: add duplicate action delete batch test
Date: Mon, 12 Oct 2026 14:09:26 -0400
Message-Id: <QDISC-K1TH.v1.r3.20261012134653-2@mojatatu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <QDISC-K1TH.v1.r3.20261012134653-1@mojatatu.com>
References: <QDISC-K1TH.v1.r3.20261012134653-1@mojatatu.com>
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

