Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28C6288505;
	Wed, 11 Mar 2026 22:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773266492; cv=none; b=or8xn5ZOZQqDW/ug2BJ231msiW+0lFYQlkNUffohBQbObUg6wigDjZKIbwN3D1rZjAybxnHoIX4EuDx2Lc4sTMlLcPIBqckf3P3UWrVCsQ2KoE/ohTC02WyCPA8iigITh4l+hDFCLjLvPAlY+bamI95bm3RTs1kYGXhE/4bzLTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773266492; c=relaxed/simple;
	bh=78BTdrVcibHfIVMHXW+6UBL/3BC+jZrGBnj/JndqAy4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W0Ont9cGL9DMMiwtXe5cjt5IyOz5Dwg0MGYiEyLm+kOel2qL47PkkLQw0FaWXiSQcO+sGP9JqPK2/+7HjphgMNFXiMVlQVRezbeLHVsYUs6hIW+w72dNPa3L6d5jQhT/YWJ8to7wOKOoKsACdugvAbqBYJ/x+NKK/2rtBjsrLvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=hgBOepK7; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="hgBOepK7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773266488;
	bh=78BTdrVcibHfIVMHXW+6UBL/3BC+jZrGBnj/JndqAy4=;
	h=From:Subject:Date:To:Cc:From;
	b=hgBOepK7hGBsCIwUyPyJH7PCjfQaMc9UwffNF2TfUkWumsSndn5T6ytKKH6MV8ie6
	 oPOw46C7fwOvU4Q1zhRmdRWQuOoQyCoWWLxbuAGdgcWay0cMN78m503GHnyKQ+Thuu
	 UNgSqticTkpV/7pJcGBJWa5LCPIT3W2E36zXiYxA=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/4] tools/nolibc: add err.h
Date: Wed, 11 Mar 2026 23:00:48 +0100
Message-Id: <20260311-nolibc-err-h-v1-0-735a9de7f15d@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0ND3bz8nMykZN3UoiLdDN2UNGOzRHPTlJSUNAsloJaCotS0zAqwcdG
 xtbUAtCXYm14AAAA=
X-Change-ID: 20260311-nolibc-err-h-df36a75dddf8
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773266488; l=1248;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=78BTdrVcibHfIVMHXW+6UBL/3BC+jZrGBnj/JndqAy4=;
 b=oTI0AiQE/mVVuVRwMybZneYO+h9ML1It4olYm7pApzu6xoKFhTyBnYX6VCvZk9nxfspVWHvkZ
 cmoikSnH7ioChK9TDq5MHYKqHWulnCoTB2DN3Vok7fX7Gb1z7BXgXqw
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Add a few convenient helpers to print error and warning messages.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (4):
      selftests/nolibc: add a variable for nolibc-test source files
      selftests/nolibc: validate NOLIBC_IGNORE_ERRNO compilation
      tools/nolibc: add support for program_invocation_{,short_}name
      tools/nolibc: add err.h

 tools/include/nolibc/Makefile                      |  1 +
 tools/include/nolibc/crt.h                         | 26 +++++++
 tools/include/nolibc/err.h                         | 91 ++++++++++++++++++++++
 tools/include/nolibc/errno.h                       |  2 +
 tools/include/nolibc/nolibc.h                      |  1 +
 tools/testing/selftests/nolibc/Makefile            |  4 +-
 tools/testing/selftests/nolibc/Makefile.include    |  2 +
 tools/testing/selftests/nolibc/Makefile.nolibc     |  8 +-
 .../selftests/nolibc/nolibc-test-ignore-errno.c    |  6 ++
 tools/testing/selftests/nolibc/nolibc-test.c       |  2 +
 10 files changed, 137 insertions(+), 6 deletions(-)
---
base-commit: db4f34cc063d68f329fc543a5808fe53e61fc796
change-id: 20260311-nolibc-err-h-df36a75dddf8

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

