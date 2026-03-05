Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D966036683D;
	Thu,  5 Mar 2026 08:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772698322; cv=none; b=Mq1AFn2IprH1crhjbT8e3st0B2COEDcvDE1JN3nud0QgvRHzS19IgPoqAK+aIrfszDzJOV3d1uEaktZ6XeF4b/sq5Y9UhbUR7dfgM/dwOCcvW/3riXc9/dIOnjULwJBrrTwZSaA04pvMg0hTYrDVvNLr0f6Q3Y0I177v+Wdo9OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772698322; c=relaxed/simple;
	bh=9LP7nlSjlZICynTt9XDTwozxYwtIquJTVqNP+9kcEYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jxcobixkGjLXB60FrOec1CWPCsYTGxBGKUXKQpB4ABNMNtwtctCS0q2p+7a1h93yD7ER/EG4UzLBKyoWkOIy+yVLLLzaWBGbJFrxmp+IMU48zfEr3C0B+/fdB+7797lhlMXQ3PHMso8zQRAm+pBZn0mbihxVFztCNfvDDM8OSIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ibK3WHUv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ibK3WHUv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C0B1C2BCB0;
	Thu,  5 Mar 2026 08:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772698322;
	bh=9LP7nlSjlZICynTt9XDTwozxYwtIquJTVqNP+9kcEYE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ibK3WHUvegVVAuH5880+YVhkyR57UzKG6AmrbSsbgkVfb4lrQ/Jss/cGOlWh77o6E
	 20cTghovAQb11XqwuWtXsIE12OclwI47ADHm6WnZpjBCxWk7RQTUEhTWa1FZGE8RO4
	 vjjHq3OwWJXxtvc0Bx6X0Q/i/eEPvE2MF64MTLNv67Yti3NyZCSdYXnOsnmQnSpSPv
	 BaE0kMxhn3Rjk9mjmyLxl7xpW/Umrbrgld4H4QiLJWB9Rf+gdZ7sYw7XsP7Rm82Ki4
	 71YK5XMV/eXd/cfGjQ+kkdyD6mW4CdaZp2h5NGCbwxymdNQw+MoieO8bgO+WYow510
	 n0hzAqJ9G5h9Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F31AEEF31B;
	Thu,  5 Mar 2026 08:12:02 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Date: Thu, 05 Mar 2026 00:11:29 -0800
Subject: [PATCH 1/4] selftests: riscv: Add definition of BIT() macro
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-fix_selftests-v1-1-61b62d23500b@gmail.com>
References: <20260305-fix_selftests-v1-0-61b62d23500b@gmail.com>
In-Reply-To: <20260305-fix_selftests-v1-0-61b62d23500b@gmail.com>
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sergey Matyukevich <geomatsi@gmail.com>, Andy Chiu <andybnac@gmail.com>, 
 Deepak Gupta <debug@rivosinc.com>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772698321; l=1614;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=M9wZ+QYEsaJi68PSnz9JK4iYBoPubDLiHbEPbHDQLxE=;
 b=C/Lh7aPi35cf9hAmcFgh1b97ibEZIit+zZ7krQ7MxKyZjRNMGPA3EN4xr5iSQAuxYwSAp5avy
 DU94JT+vRpdA54bpDp7gvH+4ZHCs365DiBiOlsUYE0XkeewVPJE35eJ
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=vpF2USrG+aB6CTbSt34rzJKsAVe/l+GAXo1IomCMETk=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/2026030
 with auth_id=663
X-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Reply-To: thecharlesjenkins@gmail.com

From: Charlie Jenkins <thecharlesjenkins@gmail.com>

The BIT() macros is used by the validate_v_ptrace() test case, but not
defined. Include linux/bits.h to pull in this definition. To ensure that
the header in the kernel source is used, add tools/include to the header
search path.

Fixes: 30eb191c895b ("selftests: riscv: verify ptrace rejects invalid vector csr inputs")
Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 tools/testing/selftests/riscv/vector/Makefile            | 2 ++
 tools/testing/selftests/riscv/vector/validate_v_ptrace.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/tools/testing/selftests/riscv/vector/Makefile b/tools/testing/selftests/riscv/vector/Makefile
index 326dafd739bf..92c4cfe5f34d 100644
--- a/tools/testing/selftests/riscv/vector/Makefile
+++ b/tools/testing/selftests/riscv/vector/Makefile
@@ -2,6 +2,8 @@
 # Copyright (C) 2021 ARM Limited
 # Originally tools/testing/arm64/abi/Makefile
 
+CFLAGS += -I$(top_srcdir)/tools/include
+
 TEST_GEN_PROGS := v_initval vstate_prctl vstate_ptrace validate_v_ptrace
 TEST_GEN_PROGS_EXTENDED := vstate_exec_nolibc v_exec_initval_nolibc
 TEST_GEN_LIBS := v_helpers.c sys_hwprobe.c
diff --git a/tools/testing/selftests/riscv/vector/validate_v_ptrace.c b/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
index 3589549f7228..257de36274e9 100644
--- a/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
+++ b/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
@@ -6,6 +6,7 @@
 #include <unistd.h>
 #include <errno.h>
 
+#include <linux/bits.h>
 #include <linux/ptrace.h>
 #include <linux/elf.h>
 

-- 
2.52.0


