Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758A0352F95;
	Mon, 16 Mar 2026 21:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773698339; cv=none; b=tGM1bbAOCGgcsREhUK+hw/4tXhEPiamMZjZmvYvKYBhcgSpv6Uc/R3hwWXUcE8lq2khzrYvWi3m+dYob6udqraWUFHJ6kkeubMn5U74ELK1yxQ/TUjRal73q0ALQBJucsSq34iO0ClPWbEeb3ixMfQ2DTE8Divt+osiozE1KVCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773698339; c=relaxed/simple;
	bh=09UBJof3B5Uo2cvsJCIOyv678r1epMItyfkRl7UeRuA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gQX55clQXRTzq/a5MKOJZHOO7eLbmzsTzjcQi8U+36cE2NTc5CZ+4/YWqLLwgFU9vFRkZJFfptLtCpdVeZG9y49vMOLWY8WSP6nf2uYN1vIQlA22P9LCsMbQZEKcrfBoUeu0APji7mYDFZdv5Uhe9vTEla3A8IPwnbZjvzdtNZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=TsQtIku0; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="TsQtIku0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773698335;
	bh=09UBJof3B5Uo2cvsJCIOyv678r1epMItyfkRl7UeRuA=;
	h=From:Subject:Date:To:Cc:From;
	b=TsQtIku0XblRLVpA7szwqi4IIxffhc9sxdlUKKmJgIVEvflbT+vkkD22NFD6RXPSG
	 iyP20QP8KHcTid/R2mLrHvxV/slDi8C11orcKnDwkFO1xlP2dOgCvQBHEVuZLvkf/h
	 nOjXe3hEsYNvotnQ8V6Ff3PtoMrtNKC0TywWylSU=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v3 0/2] tools/nolibc: add err.h
Date: Mon, 16 Mar 2026 22:58:49 +0100
Message-Id: <20260316-nolibc-err-h-v3-0-6ef80c051ab7@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XMSw7CIBSF4a00jMXwKKU6ch/GAS0XuYmhDVTUN
 N27tCOjcfif5HwzSRAREjlWM4mQMeEQSshdRXpvwhUo2tJEMNEwyTkNww27nkKM1FPrZGO0sta
 6lpTLGMHhc+POl9Ie0zTE16Znvq5/oMwpo1oqc7CgHVf29ABMKfX+7vcBJrJqWXwK8ksQRXB13
 XKmZMe0+RGWZXkD6XDANu8AAAA=
X-Change-ID: 20260311-nolibc-err-h-df36a75dddf8
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773698335; l=1356;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=09UBJof3B5Uo2cvsJCIOyv678r1epMItyfkRl7UeRuA=;
 b=GOCla33X3gDehpNDeavTye1hqwPmZcIoPQXKK+rcp+tdiJCpGNkogMYtiBdkDJQhrMreVGbD4
 cymndFc84fzC1O3FOvVQ8kLNEgx8rAT7RunVQmapFxnMB28FgcXo8iu
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Add a few convenient helpers to print error and warning messages.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v3:
- Make sure program_invocation_{short_,}name are never NULL.
- Provide dummy definitions of program_invocation_{short_,}name
  when NOLIBC_IGNORE_ERRNO is set.
- Drop Ack from Willy.
- Link to v2: https://patch.msgid.link/20260313-nolibc-err-h-v2-0-f4481053b07a@weissschuh.net

Changes in v2:
- Fix program_invocation_name test to handle test execution as /init
- Drop already applied patches
- Link to v1: https://patch.msgid.link/20260311-nolibc-err-h-v1-0-735a9de7f15d@weissschuh.net

---
Thomas Weißschuh (2):
      tools/nolibc: add support for program_invocation_{,short_}name
      tools/nolibc: add err.h

 tools/include/nolibc/Makefile                |  1 +
 tools/include/nolibc/crt.h                   | 26 +++++++++
 tools/include/nolibc/err.h                   | 87 ++++++++++++++++++++++++++++
 tools/include/nolibc/errno.h                 |  4 ++
 tools/include/nolibc/nolibc.h                |  1 +
 tools/testing/selftests/nolibc/nolibc-test.c | 33 +++++++++++
 6 files changed, 152 insertions(+)
---
base-commit: 745dadd6d3d984feafb96f27b60d74b29ade4957
change-id: 20260311-nolibc-err-h-df36a75dddf8

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

