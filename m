Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BE93A6EE5
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 20:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781208922; cv=none; b=ftSKIWn5osM5k9oAhok6oM77Rw7l6hxqG8i4EwCcZ0R61C+gpmCKtY/XoOiHbqcuhk/R89zcBkLaBiv70+kbHxstcPo/Cno07iDiyzWqgosWlcmt0QY4viGrao9fbP2cMrrYDLRAkJgHUxUipeGpEgq6diblnPStzTmmoMw8+9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781208922; c=relaxed/simple;
	bh=ztCzluR5K1LOfYvJO2M/7Jb0AjscEHQ8dyRN17VY1U0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PIKfKVmXLoLAcNAVD3Cip+vNmQTKBNwNe9zWcxyOwACZtwZohKzfeGZGUF3gVdZMb6kWrCRUwjrqMn58PLhIiH5BrgU9rvEOguEhvHKwPTkY9G2uIPXxkP9c/EV6xG6/s2pD+Lg139bYXJY1MOP3TbrihGl0IOGUCJVwBopYBFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJoVYKLs; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJoVYKLs"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36bb3551f6eso308645a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 13:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208921; x=1781813721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXkT6PmbtXC0d/wtet81Vb0IYNXQoXYAymVUyoGXQ78=;
        b=TJoVYKLsmEB3/xdVj+baW2aOXHE8Z+uhjOPsflQKIlnhfb7bCoOuTV91/QLUg/xmz3
         wuAqPGHy4OnfoMn6xBcWv/F08oMElW/NZstUNe5ds8wghbg9u4Vahn5u9XMXsbzzq/hh
         2xVWSxaGpNrJYCe6VYmsb0vPiz2nAk2Zl9A+P6AXOLHTI3dMxaIQJpfQr0DS49lqnzSj
         Yg+vwSojvJO1bi/GwCyta044XIn6Y+R8nlDI7gYn4VygV6+1HGTgw4Ne7HuexJXCLROy
         QVtm8hA4F+dEXV2iWArrCQlf1ZOsjkQCyv5fd/eup62WDEnG0nwZf6oYizYXUR+JQTND
         94ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208921; x=1781813721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SXkT6PmbtXC0d/wtet81Vb0IYNXQoXYAymVUyoGXQ78=;
        b=nND6Y5q7pePrcck5Yz4ipdq+/Q96PSsKhDOicUuL+6z8QXTsgIF2/7LLq+WTR0DN5n
         OL8zB9xr24l3SacG3k/rBrMLjS53rXV2qPm/Sz9P+Od56bg/BweefxHL5g5HzpVxjKXW
         00vKENxpyFFT+Rm9Mb3GEFxnPcKXd+am+wwo4klxfT9J+aN+/MgKDY0zJBdQkcCLDkfm
         zqFzn0Ys1DLgHfw+jNZNtGxh1EG8j5G/X5i6lOS3Tnv6njFM8S2qSt5Cdk6YpvBBLRZ3
         lsYtJ7l8H7/lqlhaOnnliKpxorHaZNVUFxfjYWpSzTqcS2tjqOu0+mRP45Q+3PNQ+Shf
         uROQ==
X-Forwarded-Encrypted: i=1; AFNElJ8JqNtVoKCI3u0He/xBLM6Po+n1f8q45mZTWiAH7s5Ga0Xo66J7KTdrI5v/Ie6fQJP5uWqIv+gB+ajCec7FFSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfQnFo8mEoswHHPjrN330hYI0cCGLAkaL9SJNiv45zdG8StyCo
	3hwKrNM/KIDbVelOJ66St9+6V2UHMesa8aZ0FD5+FRtVN2XKHLON71Ey
X-Gm-Gg: Acq92OGyVqAZ+d7536D3bKRko25dF77COoKdCP8yeuiVy5+J0n30gVLB7Zl6cY6OuCW
	Z/T/xqslEKBXRkr1ek55F02sKkD8C0gfGHw1VmFlKchzeZIYVZKko3S6k8OC049uGtGQ75ICPzg
	21XsdYimWHhZQ66uvWCi1ip6UywDyJK9Lj8yfROOGPhEqRSKEAO9CxTlpwOOeRCPMZu6o2PVecZ
	Rto0FV/P0/6KnTAlW/0SgHU4keUGn6TBkjqmr9wbXa7e9Y63ANDUI6ksh1x25oXQ5mqSTD55OVm
	AweQTY5avupiTwasO1dmiwAVNGW0vbXjPpZnOWNOk62dYfO5y57KFvCZwFyRMN6lEsYPsJHvxHf
	SLj4MK6y+kGTNQv7NN6vLj5edZb1iTlC2pbH3ez8LRlGUaxFss9OifyrGQWzscNjjdpzpCX+P0Q
	==
X-Received: by 2002:a17:903:41cf:b0:2b4:656b:aeb0 with SMTP id d9443c01a7336-2c2f4fd8bbemr50216465ad.35.1781208919538;
        Thu, 11 Jun 2026 13:15:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:15:19 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 16:12:53 -0400
Subject: [PATCH v4 16/16] riscv: hwprobe: Introduce rva23u64 base behavior
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-16-3f01a2449488@gmail.com>
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
 Guodong Xu <docular.xu@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4843; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=ztCzluR5K1LOfYvJO2M/7Jb0AjscEHQ8dyRN17VY1U0=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixtsSM//PujPG/o5C1988NFUFrlz3OZHb+sFHZukhbJ4
 gmQWDGzo5SFQYyLQVZMkeXw0Zbsra98on2fc/6AmcPKBDKEgYtTACZyvoWR4Yvq2kdr86/OeP4u
 qMp8S+LZV3N353cxPzBS0t6YmX07+h0jw50MkaNquufeZAvdUuY5IyOsvCP6GE9UwXfZPrNulv3
 drAA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

Provide a hwprobe base-behavior bit so userspace can check RVA23U64
support in one call.  Without it, a consumer needs five hwprobe
calls and four prctl calls, which is error-prone to require of every
caller.  Most software treats RVA23U64 as a new base anyway, so
expose it directly.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v4: No change.
v3: No change.
v2:
- Detect RVA23U64 by reading from the cached hart_isa[].isa_bases
  bitmap populated by riscv_init_isa_bases() at init time, sharing
  one source of truth with /proc/cpuinfo.
---
 Documentation/arch/riscv/hwprobe.rst               |  8 ++++++++
 arch/riscv/include/uapi/asm/hwprobe.h              |  3 ++-
 arch/riscv/kernel/sys_hwprobe.c                    | 23 +++++++++++++++-------
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |  2 +-
 4 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 32a14331eb9de..dc70470093b1b 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -67,6 +67,14 @@ The following keys are defined:
       programs (it may still be executed in userspace via a
       kernel-controlled mechanism such as the vDSO).
 
+  * :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64`: Support for all mandatory
+    extensions of RVA23U64, as defined in the RISC-V Profiles specification
+    starting from commit 0273f3c921b6 ("rva23/rvb23 ratified").
+
+    The RVA23U64 base is based upon the IMA base and therefore IMA extension
+    keys (e.g. :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`:) may be used to probe
+    optional extensions.
+
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`: A bitmask containing extensions
   that are compatible with the :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`:
   base system behavior.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 36ec8ab470423..50733d3db7633 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -21,7 +21,8 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_MARCHID	1
 #define RISCV_HWPROBE_KEY_MIMPID	2
 #define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
-#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	(1 << 0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA		(1 << 0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64	(1 << 1)
 #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
 #define		RISCV_HWPROBE_IMA_FD		(1 << 0)
 #define		RISCV_HWPROBE_IMA_C		(1 << 1)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 3e80e5551ae0d..3f66f2e99d41a 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -226,6 +226,17 @@ static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 ext)
 	return (pair.value & ext);
 }
 
+static bool hwprobe_has_isa_base(const struct cpumask *cpus, unsigned int base)
+{
+	int cpu;
+
+	for_each_cpu(cpu, cpus) {
+		if (!test_bit(base, hart_isa[cpu].isa_bases))
+			return false;
+	}
+	return true;
+}
+
 #if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)
 static u64 hwprobe_misaligned(const struct cpumask *cpus)
 {
@@ -308,14 +319,12 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 	case RISCV_HWPROBE_KEY_MIMPID:
 		hwprobe_arch_id(pair, cpus);
 		break;
-	/*
-	 * The kernel already assumes that the base single-letter ISA
-	 * extensions are supported on all harts, and only supports the
-	 * IMA base, so just cheat a bit here and tell that to
-	 * userspace.
-	 */
 	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
-		pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		pair->value = 0;
+		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_IMA))
+			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_RVA23U64))
+			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64;
 		break;
 
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
diff --git a/tools/testing/selftests/riscv/hwprobe/which-cpus.c b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
index 587feb198c049..f8c797b1d0fd9 100644
--- a/tools/testing/selftests/riscv/hwprobe/which-cpus.c
+++ b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
@@ -105,7 +105,7 @@ int main(int argc, char **argv)
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, };
 	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);
 	assert(rc == 0 && pairs[0].key == RISCV_HWPROBE_KEY_BASE_BEHAVIOR &&
-	       pairs[0].value == RISCV_HWPROBE_BASE_BEHAVIOR_IMA);
+	       (pairs[0].value & RISCV_HWPROBE_BASE_BEHAVIOR_IMA));
 
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, };
 	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);

-- 
2.43.0

