Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263BB3F482F
	for <linux-kselftest@vger.kernel.org>; Sat,  3 Oct 2026 09:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021305; cv=none; b=ndGI2wi5QkMB4DLxgRnCxEJnHCTxu2fldz5YMZnaibcwPmTjyKni35U8jWQl/hsoW6dHNOx/zYErL9+i8jfK+XC7fiTOXxnaBJdrl7/LfnEPCCmCJCDc9ZK0i3g6jCFY09+6xVumnG4LnLuKup2vknIzZCLYNFGrqOvimKu0R2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021305; c=relaxed/simple;
	bh=cqoC/mpI00uBeyIZHK4KcDf5NQYVnPkZr/zaNcMKN1U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GsKMbce85eGwItJNOVTKWj+zImvG1u70uNPImtYrJ6Qqk2V4o9FT+oCs6x1oz/Z6+3vBQJIDi6Z3gtNfoDuiDonJqTHrwZvuVDK7DmC36UWYdwf40cuNXJFPYPpzET68/AHIijZc9sSeZX/yQ4EBfd+VYscHnegGgy91rTnUaak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=cNAvFfEv; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="cNAvFfEv"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5338f65913dso4222561cf.2
        for <linux-kselftest@vger.kernel.org>; Sat, 03 Oct 2026 02:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1791021302; x=1791626102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yXMN+/zb28CkK1fnScLZHRvDxt7URwPd+oZeBLTFd18=;
        b=cNAvFfEvJN3glHvogLgb/ErlbpKdYjEB8LMFyRIN7S8fjViCYfZ9rgaUBrf/oUcat1
         6QHZMz6yBI2W0rfo8lw3119KHPCY8aaswpbjmLfqSJFwyBHfJW1DT5Ag0NCxSLgGYEv3
         ql+pJHcsY0RddurdH9hzInm/dmCZAosLI8sKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791021302; x=1791626102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yXMN+/zb28CkK1fnScLZHRvDxt7URwPd+oZeBLTFd18=;
        b=hbPOFJH6KaFfz1RKHCdYDsXFAd+mF4VA/bKnKByWZmbVLDh+ZBZGIysI+XvQSJA5Xx
         8kO6w2RvbrZOBECfHjYSiXVG2d+2baccUvaAdYYleS/I9dJl7vIXYVAeT3Juse6zPZ8O
         SJEcg00cwFwt+HsAxgGzDhA/931M714CgPx+ok75ylQI/JB8sYUxQkCvGCXVZskYpIbl
         Y4c7qijAV72E8K5+67KEypt4LXRUSYZzKntRUWPQOnPAqK6emAfFEe1cNckIbSwfNFDY
         zX/Nfz9iK4BXFaQ8pvqKqXt+5yRmorHckWcBOZKwlgklf9WYqZ6QJt3oWhcc9gnhTaKC
         7ZbA==
X-Forwarded-Encrypted: i=1; AKwUvBz04zsiWLK9h7QJFVuQhrE9Q9FEb+3uyrlkZtSlruzbC6cSRQTfm4x6pXhp+Ptyyv2E+Mkx8TSBABdN+h4N5cw=@vger.kernel.org
X-Gm-Message-State: AFuF++lEW1UmChlSdxlMK1En7IraWakfH2Xj19Efye/z0nZ/LKIl48YZ
	ccyukKC4floo7NEg2ypAxw2tyQqP1+pgCYJzApL3SFD5L+SLDwJVXaGlM9LcLuSHpQ==
X-Gm-Gg: AYBFou1eCTJyFtD6tK5CgCmlqhTcr3daweQnoiZH/WfSz0bsanjtZ65mErvFczo6pBa
	vdVW6FtE7gcYYc0S2Z0Bf3UL/4FFRaJ9L9KCJAWR4e/wJHudsOumN0SPf83270xcEKJq1iX2stU
	llnDUnuB71N18wZPJQyKZ5ZsoFZTzdaktMBP9aEebpnLBfVSlYohf6gGkUzsM97hE8jFtUBFgZG
	JN83fe8+/UEy2XmHqKU5kT4vs8wHL/GVs7yGd9iUkHQH3z1JVVRwD5VRN0ykEq95GG/yT1VdMbV
	Bkx6aUTKepHS/orjOgAiXzrFr8+s80F5NsL7lIP/cA/4diy7UvtpWh9rpoIpALUDvoZcSiVA0Iv
	hAxsKyTdBhDQ08Gtscbukg3N1uNMZYyANqANjI/CZn7kIJR1wpMXGCKuF7v2K/DW4TwlthT5ONy
	LjUjcUp3GqJhqjcEbVTvNO9KwMDwNj7WSgGRTyuhT5UiiEGbO1QqhkcCoEUtwEB2bSrBxM+jF0U
	SmLivzkrDdpPIksLEuRn7p2nswfz5pOcO/XIU6I/M0wtZe1ndXknHQFlksc
X-Received: by 2002:a05:620a:29c8:b0:93a:2bdc:cd57 with SMTP id af79cd13be357-93e50e0820emr341771285a.2.1791021301991;
        Sat, 03 Oct 2026 02:55:01 -0700 (PDT)
Received: from mbili.tail33bf8.ts.net ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0c3e2bdsm40853956d6.49.2026.10.03.02.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:55:00 -0700 (PDT)
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
Subject: [PATCH net 2/2 repost2] selftests: tc-testing: add duplicate action delete batch test
Date: Sat,  3 Oct 2026 05:54:54 -0400
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
Message-ID: <20261003095454.A4i__8DE05M3wQB_gihs9BDHXVQXu0XpMHEs0y-k3Ow@z>

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

