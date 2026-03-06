Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C06F347527;
	Fri,  6 Mar 2026 08:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772785122; cv=none; b=ne1k0diGmpMwEuQZsN9dMhZcDQFHpLWlCfwvxl7EFtdQRdu6QKcsIc0tlpYAIytMPy4d3usF9mXb10lbXLKKbjXbLNYsLZFVyNMTUWqhoNYKxXfvLTADV/BIsP21UiOcFesZShqr3gtW3CRdRg4zljyfP7rLOZuGgqJCQlyuR0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772785122; c=relaxed/simple;
	bh=ZsPiOkn4S+Pt3awjJ44YVaY3mB0P1i9vZT1PllwFgTU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qBcym8Rssovtub/PhnSV1tumkPUS7NSgF5rB0/SM6xTDmk51iwVRj9iErbAm2foz+4//7Lbwy9XM6RhY+tYwwuQOyQdNKrnAGq3lrAEjtQwgS9+hj3KlatqztHvMQk5jhIghdGeroaLrD5qpzLXOuXJAade6rnOtjNYCnOBPFWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WiyH0r5K; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SrKIHjW9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WiyH0r5K";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SrKIHjW9"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772785112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cwe0s+wk7JN9r2Y/5QgA01swVhV362gvLVPL+cKTXkI=;
	b=WiyH0r5KPrk+feBzMmabP2agvivouSNqQGrqIoOi5CNo/2OkOAHima+BpMwdnqi2plNBhz
	TkZE/yz8LYSvHVJsnozqbupsoyUEYoXGwzdg78RAHZ8yCxuvP7NZe+vh6kefTkHXhexLzM
	Dj1Wo3k6ltXmQ2pSW+LW5QCsiJSC1SqN+ePOC0ooYbzH635YD+FxE6mM9mGE9xSnH+cqdM
	jtDF4Up27MLhTfhYYGNgzheHInVXJ2+C1RwcSce3ciDs0RnClbszlYhtHny/aIIPAu1rQl
	xjEIKoqg2dnM6qapRyF8mkMEyCxxKeIvZ/c29k4Gx2ZKCK0+r5hO6QzPx8AsYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772785112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cwe0s+wk7JN9r2Y/5QgA01swVhV362gvLVPL+cKTXkI=;
	b=SrKIHjW9+XbhnrI+bKfztvey1+ugyf+MtrI+p1vxM3DuWIRzcMz0xZCH9NyG7ai6id7bvF
	vfcZhtXCMLHqWWDw==
To: Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Clint George <clintbgeorge@gmail.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH] kselftest/coredump: Fix test failure due to __builtin_trap()
Date: Fri,  6 Mar 2026 09:18:24 +0100
Message-ID: <20260306081824.348426-1-namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Commit 673a55cc49da ("kselftest/coredump: use __builtin_trap() instead of
null pointer") changed the plain NULL pointer deference to __builtin_trap()
because LLVM optimizes the NULL pointer deference away.

However, this makes the test fail on RISC-V, because __builtin_trap()
raises a SIGTRAP instead of SIGSEGV as expected by the test:

 #  RUN           coredump.socket_coredump_signal_sigsegv ...
 Set core_pattern to '@@/tmp/coredump.socket' | 22 =3D=3D 22
 get_peer_pidfd: successfully retrieved pidfd 13
 get_pidfd_info: mask=3D0x57, coredump_mask=3D0x5, coredump_signal=3D5
 socket_coredump_signal_sigsegv: coredump_signal=3D5, expected SIGSEGV=3D11
 # coredump_socket_protocol_test.c:1125:socket_coredump_signal_sigsegv:Expe=
cted WTERMSIG(status) (5) =3D=3D SIGSEGV (11)
 # socket_coredump_signal_sigsegv: Test terminated by assertion
 #          FAIL  coredump.socket_coredump_signal_sigsegv
 not ok 8 coredump.socket_coredump_signal_sigsegv

Instead of __builtin_trap(), implement the other suggestion from LLVM
(volatile) to make the test pass.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 tools/testing/selftests/coredump/coredump_test_helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/coredump/coredump_test_helpers.c b/too=
ls/testing/selftests/coredump/coredump_test_helpers.c
index 5c8adee63641..2c850e0b1b57 100644
--- a/tools/testing/selftests/coredump/coredump_test_helpers.c
+++ b/tools/testing/selftests/coredump/coredump_test_helpers.c
@@ -56,7 +56,7 @@ void crashing_child(void)
 		pthread_create(&thread, NULL, do_nothing, NULL);
=20
 	/* crash on purpose */
-	__builtin_trap();
+	i =3D *(volatile int *)NULL;
 }
=20
 int create_detached_tmpfs(void)
--=20
2.47.3

