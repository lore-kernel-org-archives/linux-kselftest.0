Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A191335F61E;
	Fri, 20 Mar 2026 19:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774036042; cv=none; b=tKc0ApyWz6oi0uhxBf13ha38Le1RnENG4k7H7hTNOnHZS51ISdWruP2RDd9mnQA2ADs0OYGgCsiSvrUcQTD2ecGNSKQ00dzyo8U9V9zJxuO3pT0BbGm5V3ZuNHU5qRfLZvns0VGI9I9kJ/S70Av+Z7P+yal7b+oS+X1JD8GzDOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774036042; c=relaxed/simple;
	bh=luQp34YqCJQJMr1YdZuIjYAPSkHmmtEPxkVN1w1TxtU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UgaM04RwkHB4jk/a84uc31kVDaADL2/yBLrSPM7o01Vqonlut0SR09+y6DY/K43GjMQEhrma6BWKqOr3qu1lsawPoSaIWicI0nDWm3JqJd9jFODp8+1BYTkrBPMpetwLFophiB+5slir66i5Oq8FJyK5gTW1zdNwixuVUgbp6qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C3241596;
	Fri, 20 Mar 2026 12:47:06 -0700 (PDT)
Received: from NH27D9T0LF (unknown [10.57.20.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B772C3FA1F;
	Fri, 20 Mar 2026 12:47:10 -0700 (PDT)
Date: Fri, 20 Mar 2026 20:46:43 +0100
From: Emanuele Rocca <emanuele.rocca@arm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org, Clint George <clintbgeorge@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] kselftest/coredump: reintroduce null pointer dereference
Message-ID: <ab2kI0PI_Vk6bU88@NH27D9T0LF>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit 673a55cc49da replaced the null pointer dereference used in
crashing_child() with __builtin_trap to address the following LLVM warnings:

 coredump_test_helpers.c:59:6: warning: indirection of non-volatile null pointer will be deleted, not trap [-Wnull-dereference]
 coredump_test_helpers.c:59:6: note: consider using __builtin_trap() or qualifying pointer with 'volatile'

All coredump tests expect crashing_child() to result in a SIGSEGV. However, the
behavior of __builtin_trap is architecture-dependent. On x86 it yields SIGILL,
on aarch64 SIGTRAP. Given that neither of those signals are SIGSEGV, both
coredump_socket_test and coredump_socket_protocol_test are currently failing:

 get_pidfd_info: mask=0xd7, coredump_mask=0x5, coredump_signal=5
 socket_coredump_signal_sigsegv: coredump_signal=5, expected SIGSEGV=11

Qualify the pointer with volatile instead of calling __builtin_trap to fix the
tests.

Signed-off-by: Emanuele Rocca <emanuele.rocca@arm.com>
---
 tools/testing/selftests/coredump/coredump_test_helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/coredump/coredump_test_helpers.c b/tools/testing/selftests/coredump/coredump_test_helpers.c
index 5c8adee63641..2c850e0b1b57 100644
--- a/tools/testing/selftests/coredump/coredump_test_helpers.c
+++ b/tools/testing/selftests/coredump/coredump_test_helpers.c
@@ -56,7 +56,7 @@ void crashing_child(void)
 		pthread_create(&thread, NULL, do_nothing, NULL);
 
 	/* crash on purpose */
-	__builtin_trap();
+	i = *(volatile int *)NULL;
 }
 
 int create_detached_tmpfs(void)
-- 
2.43.0

