Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D656248A2B3
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 12:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910440; cv=none; b=Z2A3Ixl7csh/+FiEf4ZHLy37Jeub1onuxZd5PB5dCkY/7uycXVjmq5XyPb+4qUYXqgn7BeOHvie0pZMbb+oO3Zdum0VPf2nVe/sw9ITDRJ1wJ+VpvJF102+W4xDFmjJTTRPJXV9S+Ieg8Qef0+bLLQ+f+/XqUmH6Wex4VouFpsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910440; c=relaxed/simple;
	bh=qUpQI6roeceadtMZx+l2gkdH7v1ZAYzyOmrKiTnQRwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V9SBKWGP3hQK07hRqDbNXC9TolgPajy8q+60Sq3gmHFrhqnngVzMAyAMmDeqlTKF8O+6RRvCldEZWsNPjlG8fGMQrC4AUCMZwmm9dJ8+U198ped01F1aF+pFreb8Tqx9p87z/F1VE1IqcbtYzVC6HFJevChnCrBcpF/zcb1muqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tFqaSibk; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tFqaSibk"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-842338c18e0so362496b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 05:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910438; x=1783515238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cf4ggToYkrlCapEBsvBHakBfX1zXebmGeq/ps06lv7Y=;
        b=tFqaSibkO/LnJt2Grjo50J/1DOsfWCmB7D81oitMZPQORju65myzOUl6KVwRDzg+6h
         dzOh7hfDEjeyXO2W5n2ynSj6gO7d8HBgb4Wh0WvJK1EU+WJnLf8fMGRg5cah509LVlMH
         V09xdH2rvuvCDU238HlaHsRd57Eldw0HL4zKhwxdGTDSeMwLSFVhHAj9uO/3zdlkURpY
         8D/C5O1NPeNKReQYBuwBQbFt0xI2NJw4zgPzUaEdGO3vCeAImD7r5Tx0FQqokJN+sw3p
         0M509RPkuQrNM9hanI0w8TV+kz2VrdrO4LW4dshH2ah9y+nbkJYu2uEKMNRqOtUuTdjH
         kE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910438; x=1783515238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cf4ggToYkrlCapEBsvBHakBfX1zXebmGeq/ps06lv7Y=;
        b=Rn2UtXe6rH/gutZTRHBBZEnXCouwMFHBukvMXSz804OcYyCiTnZQXt4buEAdmCpkyu
         EZuNVpHcApD6TLBC4eHK/Ah1vkvYAMH4GKgBwJi13nXTWps9dCglr45CkeBazF6EXo+X
         lvtVocOn8zr+6evsbb4NY3K9Jxh4GNKKJBHY4KxmjufwrAtHS/NRXM21aqpvbCEuxGqz
         kVoUIV3jyqogrXqjdEv9KkFWFVWLSuAoxWiI7aSFc7rILWhEm+M/03weKufI4bYgWblb
         IkYlRdWPWuaOophMGQJme443IchgcF4ypJbNy46xA+6TzwxlA0Tv8UpJhdX/tAu5RdHQ
         cfPg==
X-Forwarded-Encrypted: i=1; AFNElJ8ZjwnE04CkoPwWb/xNmj6SiUuWLBxMxzp4fo8uRVPYrGZQI/qWAXP44xCjtvuwrBjZjJRYtOE53rRxYGkcUJs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDHQkXBRZXf3+5EF77DkpQRmf1LYl5Oc9YTaI+pkGi/tVvWqs6
	bNA2J92301arB/ADGL1+1JvyQc7dZc3IOqEV2/hWlQjpMFxrRGn7JHGG
X-Gm-Gg: AfdE7cneRAZ3jkVs1lffSO0McdImwu7tdHUjr1+vM2UKexjddr69F5yLLA6aE7cIppy
	IrmYdQGbiN7ASnjZockAMcl6J4LCJawno6z5h5cwsYB9ceZY7o77lKTJmnZG9anwjt1oN3EkirK
	vJmBuGwp+5k3uDJttbRz5F2BxiCYCdtScnVqirY3uZ9aNnvMVnqD2UZgJi1Hrm2+wB8czNAPLxj
	g5b8AT5Y/oN3OmPNJ0iq9WJeylZq9Qa2U0WOpWhR6vlg12gsxlVfBv+ycgWsUpVUIpvnFFEzbfC
	nUhr/kWJKgHsSkE8B5Mwhuoc7riVS7J+7l9F3h+bZCr//JOOzqtUeJcpipBtNK+5JWbK81V/JHn
	kr+vZ5Y/hQIAJZPngsoqhzpey1vhj7frpwnXMYJ6woqCEIEkAc1BzYOOmj9TivLLOnrtihkab0X
	wYQwgFBuVmFpoFSiPk85Nc
X-Received: by 2002:a05:6a00:1807:b0:842:614e:cc94 with SMTP id d2e1a72fcca58-847c07c470bmr1460384b3a.26.1782910438134;
        Wed, 01 Jul 2026 05:53:58 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:53:57 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:21 -0400
Subject: [PATCH v5 08/17] dt-bindings: riscv: Require block-size for
 Zicbom, Zicbop, and Zicboz
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-8-2c61f94a695a@gmail.com>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Chen Wang <chen.wang@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Jesse Taube <jtaubepe@redhat.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Guodong Xu <docular.xu@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=qUpQI6roeceadtMZx+l2gkdH7v1ZAYzyOmrKiTnQRwE=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3tZJ0Su79v3RdX58lNmxpiXmJtcKlQyZK/LSqzvea
 TYzF0p2lLIwiHExyIopshw+2pK99ZVPtO9zzh8wc1iZQIYwcHEKwEQkuxkZOua7fZ3pvVejxeEy
 +4eeNdKc7+brz377VsVu1amK7kMbXjH8007YqzrX6+sFsXM73URmzGLLvRK68UNyxWSL+++Ufmz
 W4wEA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

Zicbom, Zicbop, and Zicboz have no default cache block size, so a
devicetree that declares one must also provide the matching
riscv,cbom/cbop/cboz-block-size property. Make it required so a
missing block-size property can be caught by dtbs_check.

Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 5ffc40d599c02..f4dd34d446c02 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -1142,6 +1142,32 @@ allOf:
           not:
             contains:
               const: zilsd
+  # All three Zicbo* extensions require their block size property as there's no
+  # default.
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicbom
+    then:
+      required:
+        - riscv,cbom-block-size
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicbop
+    then:
+      required:
+        - riscv,cbop-block-size
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicboz
+    then:
+      required:
+        - riscv,cboz-block-size
 
 additionalProperties: true
 ...

-- 
2.43.0

