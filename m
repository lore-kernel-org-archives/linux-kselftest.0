Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D2A340280
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 18:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776365726; cv=none; b=ltK1Y+LJ5f0VXzC+5M1qpWVr/VFqEXETxN46VeCUt+ytFValSRttZ2xkyImZ5pVwMCxAbqIRFj10rWh8iUYjRotdqBOxZK1cgXNgZnc2OoDI2HQF78zZIZHQ0PV3XnZLlvxFsjEgJX73Q0bBI2OtIverIf54q3osztfU1Je+Brw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776365726; c=relaxed/simple;
	bh=/vtMgiw5QLUdNwiN05esofk6FTaIE2b9NYDtemrg3FA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=setmaSPCcaBCNeBCJyatWElQVhw3umPyvmgh3IrNIwiJfha9y1LoMYl4kUREq0QM7Yk51udKdUrLLb8iXndlkSB/pbyINB40RYz6IQVcTxQ68SPTPaagUl2xJUQyenKHeiwpYtUnFkc8DcyHpurXPV5M0EkzPqL2ac1fMT4lVck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezMrbCMA; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezMrbCMA"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82cd5c07f93so3757299b3a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 11:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776365724; x=1776970524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMiVlw5Dks3Rppi6Ek+IOA4onw9VFCFtvI5cTye7hR0=;
        b=ezMrbCMAn9gUtXcsz2oYGdr/JAixMjWdVqP755EZxTOuVd58AX4L53rmQQdOydiNAh
         nnVURwodITeEdSmcuSPVJ7ZUOlvhzo972GCr/r+NPpJqXw1R9DIA4AAF0vg66JIDEpcG
         67y2qRWhVxVbFdg93Nj/pS+J6MpCjHEwHXn+jYAm+7ESmk0y5ldXoMUhprzYbktatAKB
         tG9Z+kYd7jgduq6rBUXFzOw6T05wCFdhHbZbIWGi9RRKwLqhDMwStuxfFlCS0b+hKYIh
         Mn0BUx+vcQkAk0SGNBLFjPodxRDsVh9h9HfXTGNGWBGs2+g3JCc21EfSo/CzI/A85rCM
         uMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776365724; x=1776970524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JMiVlw5Dks3Rppi6Ek+IOA4onw9VFCFtvI5cTye7hR0=;
        b=eR9+Q4yn0DX/CDGpt20UQYjRpl4nEHH2u4PDcBxF3xwve6hvo38bnQpPvEv+Ly74I3
         ZLSeju1hqBhVmNzH1aBIGAWaJx++Vyx3/FB6TGgcdxJMnIfrZovcDt65kxBF2qfzHxuz
         N8QJ6Awy1NSteGcxckScmyYVczajAKAgebsjCkum3eCB/QynAUmWkQE7iNGPDaQ6HLxZ
         W6OEClav1ShO3wG3fKuZe9iV/XmElwBnKQ8WdInqm8AZM5V3GIDVtIIDDRUm18ndWsMX
         lF7XDr/SS4+YJ0PpsMEnf3FWhyGMvbJm/nUwW+imLq6Sv2M2goRhdNgOy8IV51z0pR3n
         Z52Q==
X-Forwarded-Encrypted: i=1; AFNElJ8CDKr9ffxujN5TT4dWlZTKs5NHO6PY44htIcCbc4BQuPxeduPPLZnOeGW/be0QgCqzLFOP5AWnVvBXK0d/84c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyyRKaiyxDmkm39x+MvxqIiQSM9qO7eKfeW6K8dPvX6FlOMcyV
	N8I5SCTEvQQQDU4eyXgVCk/JTT7Gi0+QOu9feNMLC2TkHRwWEkIZLGiD
X-Gm-Gg: AeBDietvpdVlcsTWG5bPpR2zFeHK+317xeaB0lj4sAiWeD2A3ZEYlaAY5p88H/lbZV9
	rO3eSqKMCIbebjkKxiA7/iGAvDlPthLsXLIxu8jKw0Ntzmm0GKuQOJ0SOs/X3Z55/G8tr/bAXk/
	ULYiB8XeXv3P/EmPAqla4+Q59D7c7XM0NeJNEtDJc1OOGmrxXqqeXDBvRavzjdYihARWmIyavpQ
	uAPH/4P7qwn+FweDgj5RTORtxCKcXltYFE0vQr+7Fbch9kVRN5TVL7L3xkFH30gXZbj8H8stbAd
	sjkHLbXmP7H0U/dfs/PD1nSNjYtGYHUp8BXwf01ZSeSfNrcEplZbGzlbnMOip7uAvFOElyQj8uS
	NRFGl8aFJ/l+ujbZ6RV1f2A1HFitbXF8WEyOoMl3VT7eYnO4LlNC0DND8FgmD29E7/yRKa0Kfvr
	skZXtvd6pYWL78OFytVu8SRSAy0fRt9MBVOHVuFGqpABTr6uqGuBk/Xcb986cIBlhiJQ7TXTdB+
	UaVh72uKrwz+b66Dzx+2xdfCP9F0ChBeQ==
X-Received: by 2002:a05:6a00:1406:b0:827:3914:f130 with SMTP id d2e1a72fcca58-82f888c9963mr506028b3a.36.1776365724466;
        Thu, 16 Apr 2026 11:55:24 -0700 (PDT)
Received: from SLSGDTSWING002.tail0ac356.ts.net ([129.126.109.177])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f6744b350sm5668181b3a.54.2026.04.16.11.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 11:55:23 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: jhs@mojatatu.com,
	vinicius.gomes@intel.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org
Cc: horms@kernel.org,
	vladimir.oltean@nxp.com,
	xmei5@asu.edu,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Weiming Shi <bestswngs@gmail.com>
Subject: [PATCH net v4 2/2] selftests/tc-testing: add taprio test for class dump after child delete
Date: Fri, 17 Apr 2026 02:55:02 +0800
Message-ID: <20260416185501.647884-4-bestswngs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416185501.647884-2-bestswngs@gmail.com>
References: <20260416185501.647884-2-bestswngs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a regression test for the NULL pointer dereference fixed in the
previous commit. Before the fix, taprio_graft() stored NULL into
q->qdiscs[cl - 1] when an explicitly grafted child qdisc was deleted
via RTM_DELQDISC; the next RTM_GETTCLASS dump then crashed the kernel
in taprio_dump_class() while reading child->handle.

The test installs a taprio root qdisc on a multi-queue netdevsim
device, grafts a pfifo child onto class 8001:1, deletes that child,
and then performs a class dump. On a fixed kernel the dump succeeds
and all eight taprio classes are listed; on an unpatched kernel the
class dump crashes, which surfaces as a test failure.

Signed-off-by: Weiming Shi <bestswngs@gmail.com>
Assisted-by: Claude:claude-opus-4-6
---
 .../tc-testing/tc-tests/qdiscs/taprio.json    | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/taprio.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/taprio.json
index 557fb074acf0c..cd19d05925e40 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/taprio.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/taprio.json
@@ -302,5 +302,31 @@
             "$TC qdisc del dev $ETH root",
             "echo \"1\" > /sys/bus/netdevsim/del_device"
         ]
+    },
+    {
+        "id": "c7e1",
+        "name": "Class dump after graft and delete of explicit child qdisc",
+        "category": [
+            "qdisc",
+            "taprio"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            "echo \"1 1 8\" > /sys/bus/netdevsim/new_device",
+            "$TC qdisc replace dev $ETH handle 8001: parent root taprio num_tc 8 map 0 1 2 3 4 5 6 7 queues 1@0 1@1 1@2 1@3 1@4 1@5 1@6 1@7 base-time 0 sched-entry S ff 20000000 clockid CLOCK_TAI",
+            "$TC qdisc add dev $ETH parent 8001:1 handle 8002: pfifo",
+            "$TC qdisc del dev $ETH parent 8001:1 handle 8002:"
+        ],
+        "cmdUnderTest": "$TC class show dev $ETH",
+        "expExitCode": "0",
+        "verifyCmd": "$TC class show dev $ETH",
+        "matchPattern": "class taprio 8001:[0-9]+ root",
+        "matchCount": "8",
+        "teardown": [
+            "$TC qdisc del dev $ETH root",
+            "echo \"1\" > /sys/bus/netdevsim/del_device"
+        ]
     }
 ]
-- 
2.43.0

