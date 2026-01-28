Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186B22FC876;
	Wed, 28 Jan 2026 10:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769595879; cv=none; b=QQj4xV/XhkgQLbKCmJpe2y5gc/rsFG8Ld/tef7gfvCi2d6+VTWva8jsR//6uVw6RA5KslAO1Uo87xdH4aArngOnONcyxtae2lGYmSvCy2s8mqpTwcdawaNHsX26hXLRafny2JHou0axxYdiSenufzDxCmO72rz6g0LUxCbUm0QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769595879; c=relaxed/simple;
	bh=/bkZDOQNaL3Fri1YO7dGLMOOwtYGxYzR4x3dVKLNDJU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mP155NPI7A3eUTn5a5dLax06nxYZQv0Mvtx6NbTYh9kCe72RWNiFdZNpwAEHo4r5MsZ7SkfswW+5JBOsQBwPdTGV3KSx8xCW4wGL3DYhxU4p11YY6JxKZxAIVyOrrH5p1IQJvymPb5EpvhUhfhdw+tgmXXfmITx9JqBosDs/+C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mWECB+V0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6sKM5vtO; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mWECB+V0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6sKM5vtO"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769595876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y7lly/MpgfydjzmMZO7EBcQleAqFnsRK7QMGKkXiLdI=;
	b=mWECB+V0NnO+ldvZdE9r2NOTuiBi+c++PDq4tXW7QrzFZK7kzLBe2gtlyoKqHF5gAPfheT
	VbwivwUGutvIfj52f+izbomMtGomq1bThNirBDLdKgARjWbOsWjLweknAUOqRJxcdb6IBn
	XVukmeJVB5RNm3gStNKwB3TPuCOsWXfbkuOm69q5EVYnMkigkmtrIIe92p1E+FVv1DnqnG
	xtJY48V3042s/Sa3A5j27bD9V3rL+SiOyisDO8m4b6+UkOtUsWTLfw+qyC7HeWaLiPTjMU
	ZsW8e7Yz0U1AhkSlWhHGjhh3QJJGYeRGnu7Wnmqm8XDJMc3h5XF3gHKBvM/OCQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769595876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y7lly/MpgfydjzmMZO7EBcQleAqFnsRK7QMGKkXiLdI=;
	b=6sKM5vtOILQPL5RWB22GZeVdAYoFGVjeeo0ukZdLfQu4TBNXfIhJ5MMl67+JXCLJRc+gkC
	LmMYWRaf/wcgaQBA==
Subject: [PATCH 0/5] selftests: harness: Detect illegal mixing of kselftest
 and harness functionality
Date: Wed, 28 Jan 2026 11:24:32 +0100
Message-Id: <20260128-kselftest-harness-v1-0-cb259fa81cd0@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBG4avErBNMKKOrRAur3xwKCyciiO6et
 PwW7z0kSAyhrngo4WLhPWZUZUFTcHGB4jmbjDaNrkyrVsHmT8ipgksRIqqGtm7U1teto9wdCZ7
 v/9kP7/sBQWymfWMAAAA=
X-Change-ID: 20260128-kselftest-harness-5e07ab07f58a
To: Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Yuwen Chen <ywen.chen@foxmail.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769595876; l=1275;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=/bkZDOQNaL3Fri1YO7dGLMOOwtYGxYzR4x3dVKLNDJU=;
 b=aH6oQ/mL31D6U/9h618OSK50eiC93mMjBwWqpKiIhyCi7X7HXsYno9yAOrxfsIbqKedpv3ePx
 Saxxr003MnqBIIXNgmF1O3xow65sMxKzRg4Y6RVvatSMQgCMq62UqBv
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Users may accidentally use the kselftest_test_result_*() functions in
their harness tests. If ksft_finished() is not used, the results
reported in this way are silently ignored.

Detect such cases and fail the test.

This should probably only go in during the next cycle.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
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
base-commit: 6d6ad32e22f028c525d5df471c5522616e645a6b
change-id: 20260128-kselftest-harness-5e07ab07f58a

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

