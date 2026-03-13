Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73E63D411A;
	Fri, 13 Mar 2026 20:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773433592; cv=none; b=BvhIo1KwIxWanzpX1Ig9JTGHyecP2CFs4CkFI9eG9XvwV1XcViNUxtauxc/V7Pd5+yBSqmQWwvSGHEVyYX9TaIVNDKTR3bW8oYv4+BDEQYro2bJiXBYYstPKqCbvg16waMitsMjmByX1845fWgfHVK7DPMni7s6IBkoKzQ7j294=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773433592; c=relaxed/simple;
	bh=B+VdflPR/v130rnJMbw4n/QrV5uAQqX4VVgUEssEAnU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aEXCRARFHaU5fazRpa6YJ8MUjV+RD4nexDu0LSJXo6aWBmWQ8rzDFOFI+TCMpBuidkeHICuKrEcMlnGoQegrfbDtitIWMcc1UVb0fsuWipXADpKus8cOZUiNfkcQE1fAEuIFWuc8tRHrJA0EnSilM0GJMDFaxUC/D1gMjp9hAl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Wx9nQFjD; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Wx9nQFjD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773433589;
	bh=B+VdflPR/v130rnJMbw4n/QrV5uAQqX4VVgUEssEAnU=;
	h=From:Subject:Date:To:Cc:From;
	b=Wx9nQFjDQ5SiAdatOcBuiMMqBgCcxGutQNXZ4H4H6z5CaY0gKIz7O90Ys5rnQv+oa
	 rIuDZMcu1izxWWIbn9iCKKZ8c7ZRyfkJE5TcwU7YEb5E5zAb3FVhqi/zsxcVVKdlV2
	 poN7UOnPk6Y5PdpFRwBV9PFTnawpUm1dLvRgV820=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v2 0/2] tools/nolibc: add err.h
Date: Fri, 13 Mar 2026 21:26:27 +0100
Message-Id: <20260313-nolibc-err-h-v2-0-f4481053b07a@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XMQQ6CMBCF4auQWTuGQgrqynsYFshM7SSmmA5WD
 endrexd/i953wrKUVjhVK0QOYnKHEo0uwomP4Ybo1BpaOqmq1tjMMx3uU7IMaJHcm039paI3AH
 K5RHZyXvjLkNpL7rM8bPpyfzWP1AyWGPf2vFI3Dtj6fxiUdXJP/0+8AJDzvkL1kcRfq0AAAA=
X-Change-ID: 20260311-nolibc-err-h-df36a75dddf8
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773433588; l=1053;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=B+VdflPR/v130rnJMbw4n/QrV5uAQqX4VVgUEssEAnU=;
 b=HRq+cs2StDM0+/IeegBz7SiIEL3d9tqAgxsS3XAm+PlOMDUHqV5CDjauAy90QiLWnmNDucFad
 BWUcBzr5OjFBfuRLHr7HKAzpeqJLQzvTp02iOMpUer6Aa4hYODjeFjd
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Add a few convenient helpers to print error and warning messages.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v2:
- Fix program_invocation_name test to handle test execution as /init
- Drop already applied patches
- Link to v1: https://patch.msgid.link/20260311-nolibc-err-h-v1-0-735a9de7f15d@weissschuh.net

---
Thomas Weißschuh (2):
      tools/nolibc: add support for program_invocation_{,short_}name
      tools/nolibc: add err.h

 tools/include/nolibc/Makefile                |  1 +
 tools/include/nolibc/crt.h                   | 26 ++++++++
 tools/include/nolibc/err.h                   | 91 ++++++++++++++++++++++++++++
 tools/include/nolibc/errno.h                 |  2 +
 tools/include/nolibc/nolibc.h                |  1 +
 tools/testing/selftests/nolibc/nolibc-test.c | 33 ++++++++++
 6 files changed, 154 insertions(+)
---
base-commit: 745dadd6d3d984feafb96f27b60d74b29ade4957
change-id: 20260311-nolibc-err-h-df36a75dddf8

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

