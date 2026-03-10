Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B2B2F25F5;
	Tue, 10 Mar 2026 01:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773107539; cv=none; b=q4WFWJ8MU4aqVcOl+XpB5h/mMgs/EmWJL71V1mWswD8rNTTkSOQI8Uaz61kIbOmJ/giPG52SK3yp7nJGnNEZw6Ld1GqHyGUF8BhPmbHyO7NRMMDgU62fa8JCldWqzBZMgGWDugYk2fJY9iRuWBvDYuXECdSEoBw1C/coCMCN7Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773107539; c=relaxed/simple;
	bh=DzKG948gcs5x9YgNVim780sUPGDP+fTXP+UFVdlqzwQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JWiXf8C0ORyP7IFFEhlirk2kAurO8TnualkF6uwPAZ1Sn1Kx9ZOJ+Bt1x6uKCEJV/bP3EGZTcRrN8xNj7w/Bqy1pCkDRkcZ04kQnf/P2Fvjw1E+5s9XVAL8keTOwNngyPemXFCJbIY9IZPAmj87IrisjVCQUJdOZ9cVW7M80Yvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VMr2Fyol; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VMr2Fyol"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 255A1C4CEF7;
	Tue, 10 Mar 2026 01:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773107539;
	bh=DzKG948gcs5x9YgNVim780sUPGDP+fTXP+UFVdlqzwQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=VMr2FyoleiSoAgr5GCbS2DsKpQypuNkJ0odP4CTSsyb3MCdj7DilVVtf6GfHRhoqy
	 VWwpp5783Do6EiOrvyPiN7DWdgpHayKLWKfViIGhjLdIczyvlZMzdI6PsN7y0qVj0v
	 aUI/udlVUbTmryw4xk4FXEwQFQu+2mGo8nA0S3WDCxg24kWFjQZLk4NkdL/t4NN2Wi
	 ajPgnVetcFuN+G1pGHvkLEL2LnNsiW1TV4/dGY5m0k84yA+sDCHG24v7Ku1uDC+FRn
	 cdF/8PuQKSiVsLgaqgQmfRtLzVUvws/5szReZWRpC4TN3weCOpBRli428k0MPNwhR2
	 SI0uq+EuYMtvQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17460FCC9A9;
	Tue, 10 Mar 2026 01:52:19 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Subject: [PATCH v2 0/4] selftests: riscv: Fix compilation issues for
 v_ptrace and cfi
Date: Mon, 09 Mar 2026 18:52:09 -0700
Message-Id: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEl5r2kC/13MTQrCMBCG4auUWRuZJm0EV95DirTptB3oj2RCU
 Erubiy4cfkO8z07CHkmgWuxg6fIwtuaQ58KcFO7jqS4zw0atUWDlRr49RCah0ASRDkzYEuV7Yy
 7QN48PeWHw7s3uSeWsPn3wcfye/1J9Z8US4XKlp3VvTY1Yncbl5bns9sWaFJKH8LiauKqAAAA
X-Change-ID: 20260304-fix_selftests-c3f0ae46b3c7
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sergey Matyukevich <geomatsi@gmail.com>, Andy Chiu <andybnac@gmail.com>, 
 Deepak Gupta <debug@rivosinc.com>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773107537; l=1204;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=DzKG948gcs5x9YgNVim780sUPGDP+fTXP+UFVdlqzwQ=;
 b=FLwvV3VuWbMYTOsNB8g4GlIeYcaaWljR8gG/AFM7wyZlqNAq5LMBFTbAVvehUzguocGXLf516
 udEBiYriGz1AGyHpt8l8MWcFqCDNTDkQZ98VWgwZXSgMPD6nLqi8ZgE
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
Changes in v2:
- Fix compilation issue reported by kernel test bot and Sergey
- Link to v1: https://lore.kernel.org/r/20260305-fix_selftests-v1-0-61b62d23500b@gmail.com

---
Charlie Jenkins (4):
      selftests: riscv: Add definition of BIT() macro
      selftests: riscv: Add braces around EXPECT_EQ()
      riscv: ptrace: Fix BIT() compilation issues
      selftests: riscv: Add license to cfi selftest

 arch/riscv/include/uapi/asm/ptrace.h                     |  1 +
 tools/testing/selftests/riscv/cfi/Makefile               |  2 ++
 tools/testing/selftests/riscv/vector/Makefile            |  7 +++++--
 tools/testing/selftests/riscv/vector/validate_v_ptrace.c | 16 ++++++++++------
 4 files changed, 18 insertions(+), 8 deletions(-)
---
base-commit: c107785c7e8dbabd1c18301a1c362544b5786282
change-id: ${change-id}

- Charlie


