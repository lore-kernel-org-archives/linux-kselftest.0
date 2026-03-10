Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DAD2F260F;
	Tue, 10 Mar 2026 01:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773107539; cv=none; b=kmwfc1kp76G1uTbfjxbaF3nG8/qLmXTC0ZVjNYeu8bUuWki3HE88hZ3vqg1RYS4+i6RTaJdMZTHvJ640iacvJdm6qCING5A25RKTGYdirNz0aGL1xSqxrIXCMOkIhJorFlL13r/0/h78eBdyIyKxM67ntdO6t5l2U6FXpPNxM9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773107539; c=relaxed/simple;
	bh=jKNMW1Kppp086xhKb9OmDqM3phfapbkFQYsfGDjd564=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I75ELKq231Qu+cBjwrYZtLz+CHlXH2V58JHUzYA0rJIVjtD1zmiUZjYn4lSj3ltruuEjcZUYKUPs8KsZDyyTG9oixCoTrkenWJMIPycvAt8UPG2ZUlAqfysoBYucN+qJeZkNoFCEYbi8IBSTorcJPL/RAKrhAcfd/VT+DTCcdco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRolZoT/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GRolZoT/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3CD8DC2BCAF;
	Tue, 10 Mar 2026 01:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773107539;
	bh=jKNMW1Kppp086xhKb9OmDqM3phfapbkFQYsfGDjd564=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GRolZoT/3lA+J+mDh+PZkIBLqUrY5Ps/rKs56UKlapNkRFs7DU4IVWvFUNHG4TPY5
	 r1EiBHvW9rMBCoXQxH63rmshPR1EMNSvmsJLHgrJkEroA018APIM/FFpPPLOyILISj
	 u5WjFVkXa6AUlnxoSfnPbtAX0if6s7cWBT8ci9VADZB1tdx8xCuWDpZKSGac4WGG9/
	 m4cHfqjX28FYf1+ghdL5YhI1bHfdKcPFQkoQIuOulReV5ok1yg9tBM/jJSfjyGs58U
	 m38Srt4Imu4YUDC5USHH26E2MUJeFrsiyutANeyLOWH7bLkdoAUxx/HZ9fLN/chL66
	 QQvL/VqH584Jg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FCEAFCC9AA;
	Tue, 10 Mar 2026 01:52:19 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Date: Mon, 09 Mar 2026 18:52:11 -0700
Subject: [PATCH v2 2/4] selftests: riscv: Add braces around EXPECT_EQ()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260309-fix_selftests-v2-2-9d5a553a531e@gmail.com>
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
In-Reply-To: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sergey Matyukevich <geomatsi@gmail.com>, Andy Chiu <andybnac@gmail.com>, 
 Deepak Gupta <debug@rivosinc.com>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773107537; l=2373;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=7v3hKOxSt+L+8LtCfZh085q396U9Poj6cOIz6NZfRCU=;
 b=S2N9TZ8zWVgCVD+QvRzprkQEUmAHkc0wdE0k32fG4zPv1gMn1F6ZCLgFxIaK3ZXubqJTZ9voc
 cIxu3B7Sm6hBEdbeQLlyIRpfWbeEc6tgeXvqabXhadGrbzqNGjA6diN
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


