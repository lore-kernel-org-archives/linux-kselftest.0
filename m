Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F232EBBB7;
	Tue, 10 Mar 2026 01:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773107539; cv=none; b=O4iPjMHwTAh3ZdLk3PWEFRr43g7WCSxM0/maTLoRRq6loyRHtmYiGp6XQivzhdyFadUcIHdBt2hfrePhROhezrwVLqTqv3X+k2bBbIhe/RivovkX7ScA0+CyBN4A++A6875YIPatRB4a3aegkJuAaMaugeC1yhqgICHPUAwGpkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773107539; c=relaxed/simple;
	bh=UDuJTfJFnSO3UuVkTPP9yX+tK1rRS0uC+sGgQyxBvZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MSWvbOtQY0cOakZysKUZkghn4i+R+nhCiQWz9rWl4WguAslPk7iCBIeyYkDNbkC4Arq5U0qgyYKzjg+sesZ2nSFtrCoMUd2ax1JDIF29ojgHBko+B3DVhy5+tUW0J71K3df8Tp74w+AJ10+6rsehXmd/jGaxuS61VWSqDYTO1Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y6SUeorP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y6SUeorP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47011C2BCB0;
	Tue, 10 Mar 2026 01:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773107539;
	bh=UDuJTfJFnSO3UuVkTPP9yX+tK1rRS0uC+sGgQyxBvZ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Y6SUeorP6ivVEjYpLhZRNwgvg09rNvezmJ85n4kocMdWSDfAkqEZaEk0xpv1ZRzrB
	 sVDOSGzvrFi5fVZj+sP0ue8+YcDznBa+sFEsalIm+4tVjRH3eOe7x9IiHrYdn3jLS5
	 rDVZY4u6+UkZzIcHxPUgjqyBiLIdhHVKe43iyrak56ffb71JDAzOo3TUMD2znmS9Vj
	 ENsHBxj3k2yVuRmu+febKbDHb3k/NdQiDCrZM18LNH3nUUaGaqbT9eecYJAdKnPk65
	 rUTlCwpt0/7tMgWZmCjbiJDoHWrXV1gKGa4Zj8e70iOkXyTQA5xSdiCF2XQYBJvPEX
	 Q4gV3yyZe3B7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD80FCC9A4;
	Tue, 10 Mar 2026 01:52:19 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Date: Mon, 09 Mar 2026 18:52:12 -0700
Subject: [PATCH v2 3/4] riscv: ptrace: Fix BIT() compilation issues
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260309-fix_selftests-v2-3-9d5a553a531e@gmail.com>
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
In-Reply-To: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sergey Matyukevich <geomatsi@gmail.com>, Andy Chiu <andybnac@gmail.com>, 
 Deepak Gupta <debug@rivosinc.com>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773107537; l=1011;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=t37RqGcAuzbofdWiHpfRgZVkCDu2cWFOE4fQhY8Q/nQ=;
 b=EI8VcUZbPHkHsqsClRktZ8hfeD9BASOVhAmdE/u72wSQVx2Hdb9Qy6AmxBjDvee7WSeD+BT5+
 2nzD/+cWGKwCs0vBwj8yDDdGiqYC0/qq/fbY5qXz+XY13nRK9AEyiyN
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


