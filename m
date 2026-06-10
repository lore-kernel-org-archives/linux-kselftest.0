Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F5434D4EA;
	Wed, 10 Jun 2026 18:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.76.78.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781116723; cv=none; b=FuLOcG87eMhopYe1MfyWqHgyqge0kKhrPM9hrbcYkgdgwM2misseN4ZZ3gQxGOtVzbkir4CDVsrwIYye8bqttgasEnz/BsxUV2l9B4oF+YuTpFMAFYnfcpzBePbLfi56APzJ6eob54ZbK/1g1mDBoW2+uFYAdkPYV0fu4N7oQU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781116723; c=relaxed/simple;
	bh=VJuqabAy318tziQymx83eendKuZlFwi/OP2IQu9oNfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Imdqu9NbHCh0Y0DGgVGMn7/3OZv0M3p8GRxMliS+LsdOgxoF+AdGpXLIBJ6/bfpcBPlslrkQN1xIsoOXts3FxFyiFrVw1NkQOjIYrUTIYe1dq8MZWVHvJBTREVdQl7IUhXZAPZtPqGsjuXx80aRpGukLPvmsye2ZBMT9TxYkDOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lzu.edu.cn; spf=pass smtp.mailfrom=lzu.edu.cn; arc=none smtp.client-ip=13.76.78.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lzu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lzu.edu.cn
Received: from enjou-Legion-Y7000P-2019 (unknown [172.23.56.36])
	by app1 (Coremail) with SMTP id ygmowABXdb8WrylqK054AA--.36514S4;
	Thu, 11 Jun 2026 02:38:35 +0800 (CST)
From: Ren Wei <n05ec@lzu.edu.cn>
To: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: yotam.gi@gmail.com,
	jhs@mojatatu.com,
	davem@davemloft.net,
	xiyou.wangcong@gmail.com,
	victor@mojatatu.com,
	kuba@kernel.org,
	yuantan098@gmail.com,
	bird@lzu.edu.cn,
	edragain@163.com,
	n05ec@lzu.edu.cn
Subject: [PATCH 2/2] selftests/tc-testing: Verify IFE can handle truncated inner Ethernet header
Date: Thu, 11 Jun 2026 02:37:44 +0800
Message-ID: <20260610183814.1648888-3-n05ec@lzu.edu.cn>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260610183814.1648888-1-n05ec@lzu.edu.cn>
References: <20260610183814.1648888-1-n05ec@lzu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:ygmowABXdb8WrylqK054AA--.36514S4
X-Coremail-Antispam: 1UD129KBjvJXoW7tFyfCw1xZryrXw4xWrWkCrg_yoW8ur13pa
	4Ikr1Utrn7try7Aw1xG343WF45Wan7ur48XF1ftry7G34kCFyvqFZakF109FnFkrZ5Z39Y
	v3WDKF4xuF48AFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUB21xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
	w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
	IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2
	jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzx
	vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	JVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x02
	62kKe7AKxVWUtVW8ZwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaV
	Av8VW8GwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUonmRUUUUU
X-CM-SenderInfo: zqqvvuo6o23hxhgxhubq/1tbiAQEOCWopHlEJpAAAsm

From: Victor Nogueira <victor@mojatatu.com>

Add a tdc test that exercises the act_ife decode path with a malformed
IFE packet whose encapsulated inner Ethernet header is truncated.

The injected frame has a valid outer Ethernet header (ethertype 0xED3E)
and a minimal IFE header (metalen 2, i.e. no metadata TLVs), but the
payload that should hold the original frame is a single byte instead of
a full Ethernet header. Once ife_decode() strips the outer header and
the IFE metadata, fewer than ETH_HLEN bytes are left, which previously
let eth_type_trans() read past the end of the linear data.

Signed-off-by: Victor Nogueira <victor@mojatatu.com>
---
 .../tc-testing/tc-tests/actions/ife.json      | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/actions/ife.json b/tools/testing/selftests/tc-testing/tc-tests/actions/ife.json
index 808aef4afe22..ece7ec41bf99 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/actions/ife.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/actions/ife.json
@@ -1378,5 +1378,60 @@
         "teardown": [
             "$TC actions flush action ife"
         ]
+    },
+    {
+        "id": "4e6b",
+        "name": "Decode IFE packet with truncated inner Ethernet header",
+        "category": [
+            "actions",
+            "ife"
+        ],
+        "plugins": {
+            "requires": [
+                "nsPlugin",
+                "scapyPlugin"
+            ]
+        },
+        "setup": [
+            [
+                "$TC actions flush action ife",
+                0,
+                1,
+                255
+            ],
+            "$TC qdisc add dev $DEV1 clsact"
+        ],
+        "scapy": [
+            {
+                "iface": "$DEV0",
+                "count": 1,
+                "packet": "Ether(type=0xED3E) / Raw(b'\\x00\\x02\\xaa')"
+            }
+        ],
+        "cmdUnderTest": "$TC filter add dev $DEV1 ingress protocol all matchall action ife decode pipe index 10",
+        "expExitCode": "0",
+        "verifyCmd": "$TC -s -j actions get action ife index 10",
+        "matchJSON": [
+            {
+              "total acts": 0
+            },
+            {
+              "actions": [
+                  {
+                      "kind": "ife",
+                      "mode": "decode",
+                      "index": 10,
+                      "stats": {
+                          "bytes": 3,
+                          "packets": 1,
+                          "drops": 1
+                      }
+                  }
+              ]
+            }
+        ],
+        "teardown": [
+            "$TC qdisc del dev $DEV1 clsact"
+        ]
     }
 ]
-- 
2.34.1

