Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95D936682F;
	Thu,  5 Mar 2026 08:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772698322; cv=none; b=PwFrs8efyM7GL35/v4oiiMnZNKFskC5cUqqqPDdhrcqbmDlw8BF4d90qHZ/WaBDtZE+RnMC9j5woC7An35m4wUcisS24OhHXiAWg+IEVPBfaz03/G4JJ1yRR1/gydnG+uy433HBoZt0iyELWHY7mZtHSuMM6ucv/DYKMqhmnw1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772698322; c=relaxed/simple;
	bh=UDuJTfJFnSO3UuVkTPP9yX+tK1rRS0uC+sGgQyxBvZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=drj22AHwHiu3BIG27zZpHurUOCwaecovPip66hpV/NYgVfLeLa7Bmrasv6mBA8xCbw0NFJzTGh6XGuzceOisbmt/9ljFIzYEUPwoJTGHuvYqGvdg6z1jrZ5rx5tt70+635/ubd1ggGIV4yjZ7ujevhGexLnx7wd+cv/8AaKRP2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kXA4KmNg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kXA4KmNg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5C62C2BCB3;
	Thu,  5 Mar 2026 08:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772698322;
	bh=UDuJTfJFnSO3UuVkTPP9yX+tK1rRS0uC+sGgQyxBvZ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kXA4KmNgQnDgFEgl8BpriILqKTTUewg7gm5I1IzesRivYDxFhFGYwn/+emxgtrJhU
	 t2oWB/aIywVx9dsXSmAWy1bjX0+zKWApyMm2MgppPIWFBKyuEa0MZuF4r2Zt4FvUGn
	 Vo7bFO9EBQ+C6CSyJDlkeCgzmlsPf29dVKX4ofehUcNUXsK0jRLAFpEGY2IbqWzaeb
	 k/9WNOsGUFa12zGGNdKTkO/IOYNPA3j/MHc9nCeLZAASutWpzXQt3ydIEOmxBoOww7
	 ApGZkReWj6Lm3Qlgyi+GIG2uVvwDwIpjTkLFNJNBTK6H9deXOf6+Mftrqasm7Nq/x7
	 lVWC/KCoORyYg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC677EEF323;
	Thu,  5 Mar 2026 08:12:02 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Date: Thu, 05 Mar 2026 00:11:31 -0800
Subject: [PATCH 3/4] riscv: ptrace: Fix BIT() compilation issues
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260305-fix_selftests-v1-3-61b62d23500b@gmail.com>
References: <20260305-fix_selftests-v1-0-61b62d23500b@gmail.com>
In-Reply-To: <20260305-fix_selftests-v1-0-61b62d23500b@gmail.com>
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sergey Matyukevich <geomatsi@gmail.com>, Andy Chiu <andybnac@gmail.com>, 
 Deepak Gupta <debug@rivosinc.com>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772698321; l=1011;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=t37RqGcAuzbofdWiHpfRgZVkCDu2cWFOE4fQhY8Q/nQ=;
 b=pwecciV9DjRLq/2gHCdYoGcDPn1tWnba1BaX9qs7LAxqs0yHVratA1TL/I9YQ+2ZZd3/7VDVT
 PqwJHDwvVa9D+ZwzrENdIATzGGEn7e65aX7PX5Jot5MLvfHnRTIojpl
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=vpF2USrG+aB6CTbSt34rzJKsAVe/l+GAXo1IomCMETk=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/2026030
 with auth_id=663
X-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Reply-To: thecharlesjenkins@gmail.com

From: Charlie Jenkins <thecharlesjenkins@gmail.com>

BIT() is being used in ptrace.h without a definition, resulting in
compilation errors in tools/testing/selftests/riscv/cfi/cfitests.c:

cfitests.c:101:60: error: implicit declaration of function ‘BIT’ [-Wimplicit-function-declaration]
  101 |                      if ((cfi_reg.cfi_status.cfi_state & CFI_ENABLE_MASK) != CFI_ENABLE_MASK)

Include linux/bits.h to resolve this issue.

Fixes: 2af7c9cf021c ("riscv/ptrace: expose riscv CFI status and state via ptrace and in core files")
Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 arch/riscv/include/uapi/asm/ptrace.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index 18988a5f1a63..5b53cea14355 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -8,6 +8,7 @@
 
 #ifndef __ASSEMBLER__
 
+#include <linux/bits.h>
 #include <linux/types.h>
 
 #define PTRACE_GETFDPIC		33

-- 
2.52.0


