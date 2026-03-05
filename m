Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359C7366DDE;
	Thu,  5 Mar 2026 08:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772698323; cv=none; b=RFEH/9WsINPMDBdzMAQbLRUGtmjxki7D4xyNvqGdwlBG/CyIK6Xyo0h7KCp2lRPYy3thepRtWzPfkh7fx72TI+GFJGzYU5qAPm3kNayzYmTq3LeS5rrx1rV29hF3KWxbJnfCR1LzvdJV/sFH5X8FKN9GHwgj/lNkHyjP/UhVkjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772698323; c=relaxed/simple;
	bh=nnM2zjvYkKOyj9s5ooMFB4/ffFs14ySMOoYr/6UGGu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ViaU6qNIgKsbRg0dnj4iGahI9AOCPkfYowIjXDDe0e6vDAZEvoxDfG3a52rCySrRDqQkMxmZHzP6dWqMHFy4l+qKPrAxD7ycJE+XWbJrrtXH2c+Kms3Q4bXsBe3QlA5J2QA2JQf5UVRHTc0DN+UNkSM5kOaDBcP9raKR0Q5Hf2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GnqTYgNY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GnqTYgNY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1295C2BCB6;
	Thu,  5 Mar 2026 08:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772698322;
	bh=nnM2zjvYkKOyj9s5ooMFB4/ffFs14ySMOoYr/6UGGu0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GnqTYgNYa7dLqlZLdlp9wbgllkgI69NpZ227nMPQkneMQuhPyzt25/YEcUVVcxiDu
	 G7jony0ea89QL8V4mmq0OdfGWhQXOZ3YimDmNf1JNgJZRRiGdvuhsX8DsQ8veDGVl5
	 aX2oPCyj0OHNZL3b2OIZCB/L7u/DzL7gl++CQRZnUPo4rnMV0mmA4HUCX4pbTVGZnw
	 72wLpm1P0ugcJgBbQ+9VmZNapGi/YTjws6ddUd9ALUNQSTO46OI1dkoXyKXs1MgJke
	 PmowGO2QlHe3c/qFX49xx6Xc5Pvc1oXfsdl645MVipFPn4kU6Ut3f41kpMq7vyxo7Y
	 5iRy+bcYLWhmA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C43EEF31C;
	Thu,  5 Mar 2026 08:12:02 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Date: Thu, 05 Mar 2026 00:11:32 -0800
Subject: [PATCH 4/4] selftests: riscv: Add license to cfi selftest
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-fix_selftests-v1-4-61b62d23500b@gmail.com>
References: <20260305-fix_selftests-v1-0-61b62d23500b@gmail.com>
In-Reply-To: <20260305-fix_selftests-v1-0-61b62d23500b@gmail.com>
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sergey Matyukevich <geomatsi@gmail.com>, Andy Chiu <andybnac@gmail.com>, 
 Deepak Gupta <debug@rivosinc.com>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772698321; l=597;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=BASghyhUbPQR3TaCTFC1Bxb1DJuKTtAvjw5yHhn6X94=;
 b=lJ0mzQxUxYW7xpr4ssXjgSI8+lMx7NSdTsAffUyoUAlkm3NsAqEX0NnmwgQl90DM5nKUkE2Ol
 iwQ51FDEMj1BmgGXixIaUwyqZuUjPg4nvPFvJoh8E5HgBpvT4rK4KgZ
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=vpF2USrG+aB6CTbSt34rzJKsAVe/l+GAXo1IomCMETk=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/2026030
 with auth_id=663
X-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Reply-To: thecharlesjenkins@gmail.com

From: Charlie Jenkins <thecharlesjenkins@gmail.com>

The cfi selftest was missing a license so add it.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 tools/testing/selftests/riscv/cfi/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/riscv/cfi/Makefile b/tools/testing/selftests/riscv/cfi/Makefile
index 96a4dc4b69c3..93b4738c0e2e 100644
--- a/tools/testing/selftests/riscv/cfi/Makefile
+++ b/tools/testing/selftests/riscv/cfi/Makefile
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
 CFLAGS += $(KHDR_INCLUDES)
 CFLAGS += -I$(top_srcdir)/tools/include
 

-- 
2.52.0


