Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4B340148E;
	Mon,  2 Mar 2026 14:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772460827; cv=none; b=hJYUf4AERgfbb/07JUwaSNyORkeRytwYGZl5IOWQ7y8XHUUExFIqdsqrmF1lIqgR0Mp6jRjjuTGH98NX/znoPCPusFuCuaH0K+D1c4L4ZfPW5CD19NrH5Mab/Iqc2eIktxtJdf+a2jjZoiCH2JUAvXN/tJKH0A29MyDIbAFj1y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772460827; c=relaxed/simple;
	bh=ZYz5svphSOcq1mnWbZb1TUnOUS3ZGOoRzzBw7Fo1WlM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hwKY5SRsxl2wSRBAKYCK7YbFwa8Rb0cR4N+YqINrja4/GoTg/FWw8SyecUMyD9wL183GRJVt9IVmmBEdeUAFi+aGkHrt0Ydj9pYapki/UXZhY+e8KpKXUqDs1MgjNTWpnonBVGTSahnkVELL03qUM7UEvxzqHh6lRDaF4q1VmLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zdRsD3b6; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Qx8db2Mu; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zdRsD3b6";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Qx8db2Mu"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772460823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=n9aW19246i1CXMXXGC2xkqff1CInKkz6VFZkZAI7sYE=;
	b=zdRsD3b6mjQYbmypSQZ7HTQ3A4R/l8aOVK3tieOrBBV1vmwmFJk2Fhbv2yxW0JkL/D7g4s
	jgMZXpIIpcb6LNRltF4jyH3lQNVlnPwnnBmzQx3gJJntr1gUlolL6LIWwk9BsTguxUsP1t
	aBj+u5j2NQ+2yQUcqmPibZfQnrLG16bUj2eLqcaT7bP9XFUlItKkIWOqonPtwyugVXNn4u
	zPyHOUrVw5pBRlaXFq1jHHu2M5iKgsO6uDdNme27NwuSNH5eOSQHiMdWj7oOQmVZ0abnU9
	SOey0PkWQyB7xX387Pj06cjbGz8nElNLNX1Zk6au5teOS3nRSB1tqARhDts3TQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772460823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=n9aW19246i1CXMXXGC2xkqff1CInKkz6VFZkZAI7sYE=;
	b=Qx8db2MuSNqiK+SGC19W/TOhzQRGekpxMFbD3qcXrs3Db+3K1hZOi0vpvlBLqrMYh1uOiN
	zRPfkEs3F+p2QiCw==
Subject: [PATCH v2 0/5] selftests: harness: Detect illegal mixing of
 kselftest and harness functionality
Date: Mon, 02 Mar 2026 15:13:27 +0100
Message-Id: <20260302-kselftest-harness-v2-0-3143aa41d989@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ7CIBBFr9LMWgyQ1FZX3qPpgpbBTmzAMEhqG
 u4u9gAu30v++zswRkKGW7NDxExMwVfQpwbmxfgHCrKVQUt9kUr34sm4uoScxGKiR2bRouzMJDv
 X9gbq7hXR0XY0h7HyQpxC/BwXWf3sv1pWQop50u3VmV7NVt5X8u8Ug6ftbBHGUsoXnmlM8rYAA
 AA=
X-Change-ID: 20260128-kselftest-harness-5e07ab07f58a
To: Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Yuwen Chen <ywen.chen@foxmail.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772460823; l=1488;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ZYz5svphSOcq1mnWbZb1TUnOUS3ZGOoRzzBw7Fo1WlM=;
 b=Mtejos8H9cU+t4sWWT5BcHJisPw6PWJHy5tIqp+DfLAuXaRJW93JUKbQhZ4IOJKOEqMO+BLZF
 k3O7eEZ+sGYDDWNxPd6A5TEuGhjEcGCl3MqjQg4pCmRKxntm/vMBs5o
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Users may accidentally use the kselftest_test_result_*() functions in
their harness tests. If ksft_finished() is not used, the results
reported in this way are silently ignored.

Detect such cases and fail the test.

This should probably only go in during the next cycle.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v2:
- Rebase on v7.0-rc1
- Remove spurious comma after the definition of ksft_reset_state()
- Link to v1: https://lore.kernel.org/r/20260128-kselftest-harness-v1-0-cb259fa81cd0@linutronix.de

---
Thomas Weißschuh (5):
      selftests: kselftest: Treat xpass as successful result
      selftests: harness: Validate that explicit kselftest exitcodes are handled
      selftests: kselftest: Add ksft_reset_state()
      selftests: harness: Detect illegal mixing of kselftest and harness functionality
      selftests: harness: Validate intermixing of kselftest and harness functionality

 tools/testing/selftests/kselftest.h                | 12 +++++
 tools/testing/selftests/kselftest_harness.h        |  9 ++++
 .../selftests/kselftest_harness/harness-selftest.c | 40 +++++++++++++++++
 .../kselftest_harness/harness-selftest.expected    | 52 ++++++++++++++++++----
 4 files changed, 104 insertions(+), 9 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260128-kselftest-harness-5e07ab07f58a

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

