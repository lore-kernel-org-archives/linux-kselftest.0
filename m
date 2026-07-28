Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FE83DDB0D;
	Tue, 28 Jul 2026 07:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785225386; cv=none; b=kHRKd0pFCvLMVukajGeLZtHW2uMQDZNTyg6xPOFe6AQ4K7NzcQHNlBeZC3MX3VVXT7QEnOvyf7A3FrZkrXt+Wz4qiYp7q1UtZ8XKtXZMgyScozyzuT0TJYZtwwi0cPnrd42G0DW8rwtt73ccB7R3n0j87roiscLXmpXKE5g/yGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785225386; c=relaxed/simple;
	bh=YejfwdLeOZgCNJrFK90ekwz/e2S2Wl8ySKQBB5Fb1ic=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OyqrLQHHtLgijTqG51k4uevk3URjlGmG1Nr5lLv3IGfWW119LUgMqYoQcdLOvGp/dBNW+k0lqxjPOH0y103Q1ojHTiwXXb5q1i8jCjwEoJwXRGVoDT9pv+r7TN+euId5iCTh28+w/H7Es/CT4XvEvA0dp6S9zbq3N3D7v6J8Vpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=219+MlWC; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Xq+sE6Zs; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="219+MlWC";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Xq+sE6Zs"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785225382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tqC6Sc3CXNZakHvNXt0MqGelML5TtCaduYHs8mYUhaY=;
	b=219+MlWC/dTWAQNQSKH7oV+iYxUyvFD0g4t19oyGNRWCe64GTJJWKHs2OGXQUNMyqLx1nn
	gyatciECelPQNtCkl16xs3rgx2ndt6cPKNjqaj8sSd0tgTafyTwEVRvKTcvt294AHGou3D
	UiWZOjJkuFthps9boP6lZ3XTumQobhqd/C5F207rOybB0xjlHQtp1Z0WlNcCTdvJKocUOZ
	htyvyK8wCoFJaLv7zgTad1cB8Dl97ZTRZu7s7teqHXZ5Xg5JsrXxvO1aMpge/VQvEJ7uCU
	r21JooOXVQ6Ab+xKhsm/6rJVuwWXSyxB5BomPPVoG+PTdJt1o2fJyziUZ1xp1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785225382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tqC6Sc3CXNZakHvNXt0MqGelML5TtCaduYHs8mYUhaY=;
	b=Xq+sE6ZsVeGDwZFMayOwPaFCPe9yMRZ2EoNzCTQ+dKsxpeqLlRLu2HZd8jHkIS+meMRxuc
	+ZgG+4SD8i/pvPDg==
Subject: [PATCH 0/5] selftests: vDSO: Add tests for auxiliary clocks
Date: Tue, 28 Jul 2026 09:54:26 +0200
Message-Id: <20260728-vdso-test-axuclocks-v1-0-2fcc883a2940@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyML3bKU4nzdktTiEt3EitLknPzk7GJdY1MT4xQDI4M0C2MjJaDOgqL
 UtMwKsKnRsbW1AE88wmRlAAAA
X-Change-ID: 20260728-vdso-test-axuclocks-3543d020f832
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785225381; l=923;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=YejfwdLeOZgCNJrFK90ekwz/e2S2Wl8ySKQBB5Fb1ic=;
 b=m71qDFx2tbJ9wQjS2Hw8fKMxkdWXWabjbiQrf8nc4XoI5eaVIM8FrSaGPhA6lbnWlF2QrVZ7h
 TjkYbLvJnZjBs2ww07BXwXcjgpAsaA9O9CrJQEMCITlZ9ANlfEXRQlT
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Extend the test to also cover auxiliary clocks.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (5):
      selftests: vDSO: vdso_test_correctness: Store the clock id in the array
      selftests: vDSO: vdso_test_correctness: Use symbolic clock IDs
      selftests: vDSO: vdso_test_correctness: Validate match for all returned errors
      selftests: vDSO: vdso_test_correctness: Add tests for auxiliary clocks
      selftests: vDSO: vdso_test_abi: Add tests for auxiliary clocks

 tools/testing/selftests/vDSO/vdso_test_abi.c       | 28 ++++++-
 .../testing/selftests/vDSO/vdso_test_correctness.c | 85 +++++++++++++---------
 2 files changed, 79 insertions(+), 34 deletions(-)
---
base-commit: fd22b44a474a791d78236c4aa40e0dd42f276941
change-id: 20260728-vdso-test-axuclocks-3543d020f832

Best regards,
--  
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

