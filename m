Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731984A3417;
	Thu, 26 Feb 2026 16:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772121935; cv=none; b=qhtRbHbqT1hkXh3Gd87xaOOuhgHxfTsvEvkadvw7ir7wY7bkBAVLcdQS1wRDghYZJl7THMhMab8kRjDMKPcjrxg5vdKG0tev4DXmJhCeOQ2IVKjTCOpfeHWvgozu+zVFxar98yTsOZTmXFsNyeBZabe7Zq0v3ule1kx4Zzq1Ic4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772121935; c=relaxed/simple;
	bh=aU7GCkUo/ZsRcxRPU/da+PtIdIAM6fuEw7wNtfZTPZ8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WT5GBZo8nhCp+dLdW1MMdEUVdRY6KBErZCV9ib6nwDXlAo+/9j6kespHveXznRC3cXuBLBvG2VicbPMnvMtgKDn2XrFI0NB1pGIDtwngn+PEHzdjaj3xUhEI8x8Sn6kXA55bm36wb3KjXPQegKNRjBIrQVNUTPiDrHVGOkjJaxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=txoBwxh8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="txoBwxh8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D16EC2BC9E;
	Thu, 26 Feb 2026 16:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772121934;
	bh=aU7GCkUo/ZsRcxRPU/da+PtIdIAM6fuEw7wNtfZTPZ8=;
	h=From:Subject:Date:To:Cc:From;
	b=txoBwxh8JyzBg13x4+BGLBUnx8Xb7iSjwAv6IP9I1lfR6HRoUccf6ZB9i8w1afX/Y
	 2z3qEGuy1wd9PbBhKVZVHGk2yeQSZ7BJdgqwGcLfQQ8BjZQhHdoBfapUab9Xh2gZ50
	 cer44KmdP6kNSe2EdTwu0RvvE/q1+SDvzTh0vnpVD25lIyp4vwaxSziqyFvDInG1q3
	 bTFcQogpjT0MrDy7iwAWJHSaHdAInbOo+64HWIvcIjgDuJjWj0C4wvnCIOfagDnCRP
	 4w+PUUZL+y89Q4y5hd+ONx3nuBOBkNLODtwv1bBKbnB2tTyDrWK4J2qkV/1pXO3k6M
	 aDYHvgHkN7B7A==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 0/3] selftests/filelock: Make output more kselftestish
Date: Thu, 26 Feb 2026 16:05:24 +0000
Message-Id: <20260226-selftest-filelock-ktap-v4-0-db8ae192ff42@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAERvoGkC/33OSwqDMBCA4atI1k1JYnx11XuULtJkRoNiJBFpE
 e/eaKGlFLv8B+abmUkAbyGQUzITD5MN1vUx5CEhulF9DdSa2EQwkbGcSRqgwxHCSNF20Dnd0nZ
 UA0WhoKpKxQwwEpcHD2jvG3y5xm5sGJ1/bHcmvk5fZMnLPXLilFEjucKiQJ5W+bkF30N3dL4mq
 zmJt8MZz3YdER3M0Ah+KzKdqh8n/Tjizz9pdHKhNIKqJDPmy1mW5QnUCzsYTQEAAA==
X-Change-ID: 20250604-selftest-filelock-ktap-f2ae998a0de0
To: Shuah Khan <shuah@kernel.org>, Jeff Layton <jlayton@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1185; i=broonie@kernel.org;
 h=from:subject:message-id; bh=aU7GCkUo/ZsRcxRPU/da+PtIdIAM6fuEw7wNtfZTPZ8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpoG9Ku+Xr1sSoWBBbM9iLwsTkq2dxby2B99+bc
 CUiQtovXq+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaaBvSgAKCRAk1otyXVSH
 0GEDB/99a+Il/TT0hpsTl/YbjL7LohFWQBB/s7XBmzLZbTbRse11vOkj5GHmFBNsFO/s73iEcrb
 vdoRmTH3nc0iTxGe+BqhxZ0+4N10rwlVqo0ZsyH9eimYvc3YUnldtUwCFy3AmNhXlNDTY4KFhuv
 CjvbAzK7JuYil4LtBb6dP4tUFDV313YCjmaXmzXYtLg1/qrzp4coeh06B1yp7d7tTnYq0CA4XsH
 v/a2Ekq9YpSlISG1mDteX9Bdl+KQCwV0eqi6vRDSAeltVaOmsqJ+3bzqxX0R88gvqfEwmCLilon
 91BK9cYI3iK+6r/m8dCqTxp0AylNoBc35X6xBxNlla0LfqGX
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

This series makes the output from the ofdlocks test a bit easier for
tooling to work with, and also ignores the generated file while we're
here.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v4:
- Rebaseo onto v7.0-rc1.
- Link to v3: https://patch.msgid.link/20251218-selftest-filelock-ktap-v3-0-62acfea940dd@kernel.org

Changes in v3:
- Rebase onto v6.19-rc1.
- Link to v2: https://lore.kernel.org/r/20251015-selftest-filelock-ktap-v2-0-f5fd21b75c3a@kernel.org

Changes in v2:
- Rebase onto v6.18-rc1.
- Link to v1: https://lore.kernel.org/r/20250818-selftest-filelock-ktap-v1-0-d41af77f1396@kernel.org

---
Mark Brown (3):
      kselftest/filelock: Use ksft_perror()
      kselftest/filelock: Report each test in oftlocks separately
      kselftest/filelock: Add a .gitignore file

 tools/testing/selftests/filelock/.gitignore |  1 +
 tools/testing/selftests/filelock/ofdlocks.c | 94 +++++++++++++----------------
 2 files changed, 42 insertions(+), 53 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20250604-selftest-filelock-ktap-f2ae998a0de0

Best regards,
--  
Mark Brown <broonie@kernel.org>

