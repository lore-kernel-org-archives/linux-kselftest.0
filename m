Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB336366825;
	Thu,  5 Mar 2026 08:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772698322; cv=none; b=MTV0ATM+HuSYAf1nZ9+p1R0SUACCcQl/BXUawi2NJMpxkBSaxK+/BX13H+YLIZWbqYzXSgc8/sO7ytuxWYPhO9yuxhQDqpE+WzQ9ko7htUkVdBnUJYopBysLBi6O4mgJl1b5IcxrNpix5Ies6Y0yLntVFSNWU8LbMVzwjBIC2Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772698322; c=relaxed/simple;
	bh=gYM2Zj2ofG3LWdNS0SxvUK4DdqDG+3smhyDoKNXighU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O5b3Zd4mkyZXsWbh9kjqoroAAZ9rsx05DrGBz+CCctxngoU3WkXphtRTmvGjr/9EwJ/aMyySEjp2FjgK/wxT84OKTfjrJCaGNRrG8BkoKwAYaIh8aB9IxXYEjJ+I/yNJNnwB9I5XYlwa0H2X/hiUzexN/QZOIqE8LXOiwmt9ZLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fVuKZbpR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fVuKZbpR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64A63C19425;
	Thu,  5 Mar 2026 08:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772698322;
	bh=gYM2Zj2ofG3LWdNS0SxvUK4DdqDG+3smhyDoKNXighU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=fVuKZbpR/SCWli137GX2i1vqFhCVAFrCn31/b6lVfrjRBkhvqNORr7TSMUvRCiPtz
	 dvgJKvqkRSfWDTKYpsrWJoBqvVyMrUcOJCXY40zQFjuCePPtu/p8MyOE3jMyXjITEv
	 bqR5aswsyyDvPmVm9iGHwIC6UoZGYLSciOW6aYFBDk+y5KK6UC+JwYf3nZJ0QuWTUz
	 7h0navUAQ/ElIUaqyuHitZ8+cRYkeOPdalZF/tgdFgcma9icX8scYEJG/IdYC+5ZKP
	 v786cD/hh0Q6X0r1WV3RFwjafKVypMZpzv6kYdCqFqLCMVTpSRSzs4h/lYKEM1L/aZ
	 fWq8EB2t2RQBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A46EEF31D;
	Thu,  5 Mar 2026 08:12:02 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Subject: [PATCH 0/4] selftests: riscv: Fix compilation issues for v_ptrace
 and cfi
Date: Thu, 05 Mar 2026 00:11:28 -0800
Message-Id: <20260305-fix_selftests-v1-0-61b62d23500b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALA6qWkC/x2MQQqAIBAAvxJ7TrAUg74SEWZrLUSFGxGIf2/pO
 DAzGRgTIUNfZUj4ENN5CDR1BWHzx4qKFmFodeu00VZFeifGPd7IN6tgovZo3WxCB9JcCUX4f8N
 YygelWIRYXwAAAA==
X-Change-ID: 20260304-fix_selftests-c3f0ae46b3c7
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sergey Matyukevich <geomatsi@gmail.com>, Andy Chiu <andybnac@gmail.com>, 
 Deepak Gupta <debug@rivosinc.com>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772698321; l=1099;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=gYM2Zj2ofG3LWdNS0SxvUK4DdqDG+3smhyDoKNXighU=;
 b=PbA6bULCrfF3E9C1MjDTVunh/nq3HMlB3jQAKG6i4ttiSAMfLj/Rauj0VuimmTEQnPJFN3VpG
 97DuiccqnPPBnFsyIt8UxxrkDrSyMa9qDznl0T9GHYkNCkMMkf6Zi3k
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=vpF2USrG+aB6CTbSt34rzJKsAVe/l+GAXo1IomCMETk=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/2026030
 with auth_id=663
X-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Reply-To: thecharlesjenkins@gmail.com

There are a couple of compilation issues of the riscv selftests.
Coincidentally two of the issues are independent problems with not
including the header that includes the BIT() macro and the other issue
is from checkpatch incorrectly suggesting to remove non-redundant
braces.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
Charlie Jenkins (4):
      selftests: riscv: Add definition of BIT() macro
      selftests: riscv: Add braces around EXPECT_EQ()
      riscv: ptrace: Fix BIT() compilation issues
      selftests: riscv: Add license to cfi selftest

 arch/riscv/include/uapi/asm/ptrace.h                     |  1 +
 tools/testing/selftests/riscv/cfi/Makefile               |  2 ++
 tools/testing/selftests/riscv/vector/Makefile            |  2 ++
 tools/testing/selftests/riscv/vector/validate_v_ptrace.c | 16 ++++++++++------
 4 files changed, 15 insertions(+), 6 deletions(-)
---
base-commit: c107785c7e8dbabd1c18301a1c362544b5786282
change-id: 20260304-fix_selftests-c3f0ae46b3c7

Best regards,
-- 
Charlie Jenkins <thecharlesjenkins@gmail.com>


