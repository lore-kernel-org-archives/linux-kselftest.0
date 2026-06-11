Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C071936A004
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 20:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781208793; cv=none; b=cO744rGeQYm7i1xn+fIiourAYI2QHjCvvmaMn1HqXc0XBlyqHy7AOvdOpEXnKY0kTRWRtEeORwJfDIoCkp0vUj/gl/6G38MgeZ0BUgrs8rD16ieYlhCw7PvFFA/HM1r5u77WL9ODN3nyr9+oEH+iPm/kMVxJpn/yyLb2g21LQDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781208793; c=relaxed/simple;
	bh=DXyH1dA5Y1+InWuS9/lc23H/uRLWrnjzX1jOIrUlARE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IkPDyrOeKWu68AJgBlTSn1NeLN8GXasUyFAuDFYvl902WSeu3zejkFgwp/LNhlxVDUUCwsPhZEcAB4o8iKXoY9xvTues+/CDkC2zllFuQG9csR03WfTshO4xau0ePQlPb5jJ62qcNiTfMVoiAdDTAxUqkzvhjIXKW1sW3kMiBis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdtixdkz; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdtixdkz"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2bf1f074a12so2863895ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 13:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208791; x=1781813591; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PislshUCfHCMEi1kW2QUXiEEtshFqI/HzbllE9LwpBk=;
        b=hdtixdkz4t/O9I/mYCY9KiWAc/sD5KxTnDOdjEQ7ftCKmP0gFl2V3P0bhIIfRMGkcM
         hV+IqRE6xqDDaelJiYF3WVh3tP0e0YAtIQX32thBLupNn2Sksuo35ZuKA9AGIpaOXvXs
         yvbY2cIqNjI0sUReev+VOK8PS2jMxk8zx4B19enntLIGPCWzLGxBMcQep5eHgpWjhS7v
         70DWktTqiZvv/gB4BcUOIrmTQu9hNoNA93yAtF+mlbi0c3yeIzmQ+dUQ+K/ckF54Cffv
         h9kG5zSEuBPWV30YUo79oJ1UBhNQcmtJXaCR60BCQKcC30Un8QOQAOcptZijsgMKkPGX
         pjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208791; x=1781813591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PislshUCfHCMEi1kW2QUXiEEtshFqI/HzbllE9LwpBk=;
        b=IAyIIz7X5bQxpKsRhKS9a4hh99iCkIZme//ayh3sOeyf5WooRt0mhz2opFGNZmY7so
         qJKmpXaL2pS7X32Ef/5PX7X4SplI0wnuXeBnYoM2+6TLwjv/svEmKqdLrbrJywenHV8L
         /kentujHbxL8aMheEWhlicE7DOR7QIYFfS//FWwD1lpKamfkLjrWqo2/J03reBaLKVi/
         3FCDpGtHG4NCi+WpDuk8vOj2bH1ClLUgfxdj6qh/ZbUW+YueQ3IfSvqn+/E83ilNPWyt
         zfSTY0MJnHYBmVtgMhkmoK1IqOo8QIWDnYQ12HwHTSCYoYWAzSTVDtfbC/9RF4qRWrHx
         860A==
X-Forwarded-Encrypted: i=1; AFNElJ9UTAhLgpIewz4S6NkhX1d3g03EwibR+ZZQmOcJP/tT0jhgdFN4MNayNLQfV7fdixqCW4TlTuVMdRmUKCLRZ9g=@vger.kernel.org
X-Gm-Message-State: AOJu0YynUndDkBb6XZSGILGKfC90fwqzVU7O2LQnDqHIUHdRMAobZneS
	ADstN/xHEtflx5TXhmMZ+4YDzoSNzNL4r8RPKX5053WdQ1fUzTKjKLFt
X-Gm-Gg: Acq92OE3ZTuLy0HUnbjX90b4T1e4mTI32srKefM6j75I94mm3yQ9TuOEcQPnqb0/cGL
	odlOP1e7Xbnrz6KcgK7dl1wP8BJlYLExR1W6YlqTKoXUwUt0FsB1oP7oCRei01n1dO86XabMNrv
	DrV78QKak2fSv9948BEs0wDt+KXwG6bQ6Uj1+y3i7wG2S/Lkl+2XzV5y/F+3TjIpvmzZxaF2Hvj
	Ui3smLi6u+7yyDJreErNXGXLm3D3LfpTpnH7I+63Gbd0g5Is8hs+ceq0XBTJHullKUTMk4dSyuM
	P/oVCFNwXynQmTZnpkVvyzOWtTRtb3B5G5Kpaa28PtAX3BWK7VTtj7PKzIKVhrRtbyzFScqEbha
	qNLLs+AR2SPcx+8+stY7xHXu5b3LjEivwNBhoNESBiShezQVRsGfumBHippRQ5oge0E2uvUGpUV
	FLQEBbWD1E
X-Received: by 2002:a17:902:f607:b0:2bf:222e:455 with SMTP id d9443c01a7336-2c2f0059f50mr67453425ad.7.1781208791012;
        Thu, 11 Jun 2026 13:13:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:13:10 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 16:12:38 -0400
Subject: [PATCH v4 01/16] dt-bindings: riscv: sort multi-letter Z
 extensions alphanumerically
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-1-3f01a2449488@gmail.com>
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=10891; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=DXyH1dA5Y1+InWuS9/lc23H/uRLWrnjzX1jOIrUlARE=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixtsf0RC3eYvLzana13v1hu35/fK2QfObnoVt180hO+6
 N7sE/XPO0pZGMS4GGTFFFkOH23J3vrKJ9r3OecPmDmsTCBDGLg4BWAi52oYGQ7NZFvznHdpiVLw
 1n9GS0WmPtA+s+0k42QjzzuL5GTakqMY/vDuFb3N377bSX6ryLcg08Wlea7qSq2/rddtrfnJsZz
 vAwcA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

The multi-letter extension enum is documented as being sorted
alphanumerically (see the "multi-letter extensions, sorted
alphanumerically" comment), but several Z entries have drifted out of
order.

Reorder the affected entries so the multi-letter Z list is sorted
alphanumerically again.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v4: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 184 ++++++++++-----------
 1 file changed, 92 insertions(+), 92 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 2b0a8a93bb214..5ffc40d599c02 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -457,6 +457,13 @@ properties:
             merged in the riscv-isa-manual by commit dbc79cf28a2 ("Initial seed
             of zc.adoc to src tree.").
 
+        - const: zclsd
+          description:
+            The Zclsd extension implements the compressed (16-bit) version of the
+            Load/Store Pair for RV32. As with Zilsd, this extension was ratified
+            in commit f88abf1 ("Integrating load/store pair for RV32 with the
+            main manual") of riscv-isa-manual.
+
         - const: zcmop
           description:
             The standard Zcmop extension version 1.0, as ratified in commit
@@ -487,6 +494,22 @@ properties:
             in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
             riscv-isa-manual.
 
+        - const: zicbom
+          description:
+            The standard Zicbom extension for base cache management operations as
+            ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
+
+        - const: zicbop
+          description:
+            The standard Zicbop extension for cache-block prefetch instructions
+            as ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of
+            riscv-CMOs.
+
+        - const: zicboz
+          description:
+            The standard Zicboz extension for cache-block zeroing as ratified
+            in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
+
         - const: ziccamoa
           description:
             The standard Ziccamoa extension for main memory (cacheability and
@@ -514,6 +537,66 @@ properties:
             guarantee on LR/SC sequences, as ratified in commit b1d806605f87
             ("Updated to ratified state.") of the riscv profiles specification.
 
+        - const: zicfilp
+          description: |
+            The standard Zicfilp extension for enforcing forward edge
+            control-flow integrity as ratified in commit 3f8e450 ("merge
+            pull request #227 from ved-rivos/0709") of riscv-cfi
+            github repo.
+
+        - const: zicfiss
+          description: |
+            The standard Zicfiss extension for enforcing backward edge
+            control-flow integrity as ratified in commit 3f8e450 ("merge
+            pull request #227 from ved-rivos/0709") of riscv-cfi
+            github repo.
+
+        - const: zicntr
+          description:
+            The standard Zicntr extension for base counters and timers, as
+            ratified in the 20191213 version of the unprivileged ISA
+            specification.
+
+        - const: zicond
+          description:
+            The standard Zicond extension for conditional arithmetic and
+            conditional-select/move operations as ratified in commit 95cf1f9
+            ("Add changes requested by Ved during signoff") of riscv-zicond.
+
+        - const: zicsr
+          description: |
+            The standard Zicsr extension for control and status register
+            instructions, as ratified in the 20191213 version of the
+            unprivileged ISA specification.
+
+            This does not include Chapter 10, "Counters", which documents
+            special case read-only CSRs, that were moved into the Zicntr and
+            Zihpm extensions after the ratification of the 20191213 version of
+            the unprivileged specification.
+
+        - const: zifencei
+          description:
+            The standard Zifencei extension for instruction-fetch fence, as
+            ratified in the 20191213 version of the unprivileged ISA
+            specification.
+
+        - const: zihintntl
+          description:
+            The standard Zihintntl extension for non-temporal locality hints, as
+            ratified in commit 0dc91f5 ("Zihintntl is ratified") of the
+            riscv-isa-manual.
+
+        - const: zihintpause
+          description:
+            The standard Zihintpause extension for pause hints, as ratified in
+            commit d8ab5c7 ("Zihintpause is ratified") of the riscv-isa-manual.
+
+        - const: zihpm
+          description:
+            The standard Zihpm extension for hardware performance counters, as
+            ratified in the 20191213 version of the unprivileged ISA
+            specification.
+
         - const: zilsd
           description:
             The standard Zilsd extension which provides support for aligned
@@ -521,12 +604,10 @@ properties:
             encodings, as ratified in commit f88abf1 ("Integrating
             load/store pair for RV32 with the main manual") of riscv-isa-manual.
 
-        - const: zclsd
+        - const: zimop
           description:
-            The Zclsd extension implements the compressed (16-bit) version of the
-            Load/Store Pair for RV32. As with Zilsd, this extension was ratified
-            in commit f88abf1 ("Integrating load/store pair for RV32 with the
-            main manual") of riscv-isa-manual.
+            The standard Zimop extension version 1.0, as ratified in commit
+            58220614a5f ("Zimop is ratified/1.0") of the riscv-isa-manual.
 
         - const: zk
           description:
@@ -590,87 +671,6 @@ properties:
             in version 1.0 of RISC-V Cryptography Extensions Volume I
             specification.
 
-        - const: zicbom
-          description:
-            The standard Zicbom extension for base cache management operations as
-            ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
-
-        - const: zicbop
-          description:
-            The standard Zicbop extension for cache-block prefetch instructions
-            as ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of
-            riscv-CMOs.
-
-        - const: zicboz
-          description:
-            The standard Zicboz extension for cache-block zeroing as ratified
-            in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
-
-        - const: zicfilp
-          description: |
-            The standard Zicfilp extension for enforcing forward edge
-            control-flow integrity as ratified in commit 3f8e450 ("merge
-            pull request #227 from ved-rivos/0709") of riscv-cfi
-            github repo.
-
-        - const: zicfiss
-          description: |
-            The standard Zicfiss extension for enforcing backward edge
-            control-flow integrity as ratified in commit 3f8e450 ("merge
-            pull request #227 from ved-rivos/0709") of riscv-cfi
-            github repo.
-
-        - const: zicntr
-          description:
-            The standard Zicntr extension for base counters and timers, as
-            ratified in the 20191213 version of the unprivileged ISA
-            specification.
-
-        - const: zicond
-          description:
-            The standard Zicond extension for conditional arithmetic and
-            conditional-select/move operations as ratified in commit 95cf1f9
-            ("Add changes requested by Ved during signoff") of riscv-zicond.
-
-        - const: zicsr
-          description: |
-            The standard Zicsr extension for control and status register
-            instructions, as ratified in the 20191213 version of the
-            unprivileged ISA specification.
-
-            This does not include Chapter 10, "Counters", which documents
-            special case read-only CSRs, that were moved into the Zicntr and
-            Zihpm extensions after the ratification of the 20191213 version of
-            the unprivileged specification.
-
-        - const: zifencei
-          description:
-            The standard Zifencei extension for instruction-fetch fence, as
-            ratified in the 20191213 version of the unprivileged ISA
-            specification.
-
-        - const: zihintpause
-          description:
-            The standard Zihintpause extension for pause hints, as ratified in
-            commit d8ab5c7 ("Zihintpause is ratified") of the riscv-isa-manual.
-
-        - const: zihintntl
-          description:
-            The standard Zihintntl extension for non-temporal locality hints, as
-            ratified in commit 0dc91f5 ("Zihintntl is ratified") of the
-            riscv-isa-manual.
-
-        - const: zihpm
-          description:
-            The standard Zihpm extension for hardware performance counters, as
-            ratified in the 20191213 version of the unprivileged ISA
-            specification.
-
-        - const: zimop
-          description:
-            The standard Zimop extension version 1.0, as ratified in commit
-            58220614a5f ("Zimop is ratified/1.0") of the riscv-isa-manual.
-
         - const: ztso
           description:
             The standard Ztso extension for total store ordering, as ratified
@@ -809,18 +809,18 @@ properties:
             instructions, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
-        - const: zvksh
-          description: |
-            The standard Zvksh extension for ShangMi suite: SM3 secure hash
-            instructions, as ratified in commit 56ed795 ("Update
-            riscv-crypto-spec-vector.adoc") of riscv-crypto.
-
         - const: zvksg
           description:
             The standard Zvksg extension for ShangMi algorithm suite with GCM
             instructions, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        - const: zvksh
+          description: |
+            The standard Zvksh extension for ShangMi suite: SM3 secure hash
+            instructions, as ratified in commit 56ed795 ("Update
+            riscv-crypto-spec-vector.adoc") of riscv-crypto.
+
         - const: zvkt
           description:
             The standard Zvkt extension for vector data-independent execution

-- 
2.43.0

