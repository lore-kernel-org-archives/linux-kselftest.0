Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9538366828;
	Thu,  5 Mar 2026 08:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772698322; cv=none; b=pMU0MS4Ks4kzTcMETT7Ow0Wadr2UpLSLRSCev/ideRfrZVd3341BEdIUb/SDbdU/lCGYl5v5qBDcR7mrNsAFEij19xZ52dAiN/iE1zAD6DgFHRgOpmyQafeHqSNhEcIxVvSs38noAhT/idw6AXNo825iXyM/Yj2ivBMTMG6rFZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772698322; c=relaxed/simple;
	bh=jKNMW1Kppp086xhKb9OmDqM3phfapbkFQYsfGDjd564=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h6DrLp7AdcHqBQVpUl1GTONn2NnZZ9m8sUNpCUXJCDNuAY1SMorqaJtqTZDhzZV661u44bGignIfo+3bcSWII7hhvkcxGJMV/uhsC7WIXOYcj2TDUZVaVik4Cw/Gowm1EXizghDoi16020Y9gvs5Fnp0XSRsAMd5ibUSh4/w8ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k4zk6MJU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k4zk6MJU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A78CBC2BCB1;
	Thu,  5 Mar 2026 08:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772698322;
	bh=jKNMW1Kppp086xhKb9OmDqM3phfapbkFQYsfGDjd564=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=k4zk6MJUbMhYHdS4LxlVYCT/aH0EX994s2aGHdUF/lRA587ZjUzPJuBmqqTJNAL7X
	 +1B1MmfdBkXJTtQUT0a2XlENQ/9BwgIGF8NCfkceoIrEyRP+LSx12jjs2BYtFWSwbN
	 YEnvtjihc7FG2A4O3CHKQqulge3DKLRgt9ykDGo53g9Kv/tFf7FGxaqEK7hx57MfrE
	 PL+j+66cIr6pipAOGtfR6C8mWkvdnXHQylF4Vuax0zHx7wER+kUqBjz6Iyk9hWU2Lt
	 7jK/HKWZpvzazFVVV5zKWAx862pQABtO7yem94F5mGu+fdLYx2Tjcwf80rL0LH8ivS
	 /TcAabkl1Gjsw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B2E1EEF31C;
	Thu,  5 Mar 2026 08:12:02 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Date: Thu, 05 Mar 2026 00:11:30 -0800
Subject: [PATCH 2/4] selftests: riscv: Add braces around EXPECT_EQ()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260305-fix_selftests-v1-2-61b62d23500b@gmail.com>
References: <20260305-fix_selftests-v1-0-61b62d23500b@gmail.com>
In-Reply-To: <20260305-fix_selftests-v1-0-61b62d23500b@gmail.com>
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sergey Matyukevich <geomatsi@gmail.com>, Andy Chiu <andybnac@gmail.com>, 
 Deepak Gupta <debug@rivosinc.com>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772698321; l=2373;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=7v3hKOxSt+L+8LtCfZh085q396U9Poj6cOIz6NZfRCU=;
 b=Sq295+AKQQFINYQEs3JVoWOvokFXidLJ16vqhMSgXrs+qeDEBg2Bsqzq3t3yeHAYLKFS8YzVI
 lMB1g2/JAyhBYHhOGkxarQsvqBREbStMSMkmw1hZ9HeKbCRxs/ZzXQ0
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=vpF2USrG+aB6CTbSt34rzJKsAVe/l+GAXo1IomCMETk=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/2026030
 with auth_id=663
X-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Reply-To: thecharlesjenkins@gmail.com

From: Charlie Jenkins <thecharlesjenkins@gmail.com>

EXPECT_EQ() expands to multiple lines, breaking up one-line if
statements. This issue was not present in the patch on the mailing list
but was instead introduced by the maintainer when attempting to fix up
checkpatch warnings. Add braces around EXPECT_EQ() to avoid the error
even though checkpatch suggests them to be removed:

validate_v_ptrace.c:626:17: error: ‘else’ without a previous ‘if’

Fixes: 3789d5eecd5a ("selftests: riscv: verify syscalls discard vector context")
Fixes: 30eb191c895b ("selftests: riscv: verify ptrace rejects invalid vector csr inputs")
Fixes: 849f05ae1ea6 ("selftests: riscv: verify ptrace accepts valid vector csr values")
Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 tools/testing/selftests/riscv/vector/validate_v_ptrace.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/riscv/vector/validate_v_ptrace.c b/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
index 257de36274e9..5724e6eb3309 100644
--- a/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
+++ b/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
@@ -291,10 +291,11 @@ TEST(ptrace_v_syscall_clobbering)
 
 		/* verify initial vsetvli settings */
 
-		if (is_xtheadvector_supported())
+		if (is_xtheadvector_supported()) {
 			EXPECT_EQ(5UL, regset_data->vtype);
-		else
+		} else {
 			EXPECT_EQ(9UL, regset_data->vtype);
+		}
 
 		EXPECT_EQ(regset_data->vlenb, regset_data->vl);
 		EXPECT_EQ(vlenb, regset_data->vlenb);
@@ -620,10 +621,11 @@ TEST_F(v_csr_invalid, ptrace_v_invalid_values)
 
 		/* verify initial vsetvli settings */
 
-		if (is_xtheadvector_supported())
+		if (is_xtheadvector_supported()) {
 			EXPECT_EQ(5UL, regset_data->vtype);
-		else
+		} else {
 			EXPECT_EQ(9UL, regset_data->vtype);
+		}
 
 		EXPECT_EQ(regset_data->vlenb, regset_data->vl);
 		EXPECT_EQ(vlenb, regset_data->vlenb);
@@ -828,10 +830,11 @@ TEST_F(v_csr_valid, ptrace_v_valid_values)
 
 		/* verify initial vsetvli settings */
 
-		if (is_xtheadvector_supported())
+		if (is_xtheadvector_supported()) {
 			EXPECT_EQ(5UL, regset_data->vtype);
-		else
+		} else {
 			EXPECT_EQ(9UL, regset_data->vtype);
+		}
 
 		EXPECT_EQ(regset_data->vlenb, regset_data->vl);
 		EXPECT_EQ(vlenb, regset_data->vlenb);

-- 
2.52.0


