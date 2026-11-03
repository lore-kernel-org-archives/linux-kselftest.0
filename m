Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721306;
	b=U1IwRdyWMyGVN+rhFGjZSAScLtTdywPN4/ElcmmQRPouPx4es0ZF4Zt2uYpwkwZ8TUJd
	 DxpQ4IcGUOo1fpuoTniiawTVL451xmXRPbaQppLxWIfXQq+o5UiJxDRnUH6BvHm9vUYGE
	 2sZlluxZnfLDS7YNQo1kFiGkW4olIjJzmZ4HA56FC4eJKq0d6gFJR/OFNrieDxMhL6Wm/
	 4vtN/dmNa0mX6vvsTRy/aFZP9RUTCvQee7e27KgPvi9zS1rmeVm432JRHyS6dAhuSltif
	 /qztDEZdLb4kKsLGi4OZM1q3ls2kNRQ22Cwgjr2+1VZdNOagYbv+00qGsj3oyqI7jTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721306;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XREKEeftscoz1Hi8GedJ6sHaQ24A+16k7dbdppJWu+c=;
	b=ch+LeL3988ZNRxRCclZuXVcvUUFkvVe6F9x6F5J8UBdGPXxyjYs4Avi4Yypskep2VFD/
	 FSPpy/QQLXdayX6eSp+eS40d18b/kiYA6VdGrMclhgOhz69KQZPqFVEH74EkROB5zB9XZ
	 yAABHlg370iUvLb0XFFigogI8yVpEJcvewg+bDc5pWXPSC4qjLJtACiHORT7vys2OeQ8b
	 ta44dkRlNwh2jGYEvmL6U7nS2SfYGUm0pyb3WSw9zMMXbqnX209fCv4RjHq1T7px8uCm8
	 PKAnDHcBjR/ksschu5xz7rzi3eo1Yg4uJUU7xMu0RUFv4kNOK9+ZYpf7o5iz/H2wtmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c94PUqed;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C031606A332;
	Tue,  3 Nov 2026 15:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c94PUqed
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775281F00A1D;
	Tue,  3 Nov 2026 15:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793721305;
	bh=XREKEeftscoz1Hi8GedJ6sHaQ24A+16k7dbdppJWu+c=;
	h=From:To:Cc:Subject:Date;
	b=c94PUqeddn/1T6sh1Ph5uX9dXjXrVhLiuzaw8PGT8I5Bndy7Fuv5EokDK6a00EUUw
	 QPqp8XBih9PeVEHP+DQhZfEQfByb885n4IvpeuejxQftb+nRjCy7QgLEL5QUdaaHDD
	 dTZDcnMVTVbC1wojEFcroWovwRbZsOCw6jVMXtgpGS6vuwyy4zRp1QCDkDXN7lve5P
	 B7NCmtr074deIEYEQQ3py3459q9ooTwF2AWjSMQmSyaPSHAmqL4I8gZAtdjb1u8UIr
	 UhGNDPu6N58ccxPz73CAj2j7u9CM0JLDYJIfQ/digYaiqNf2fC91xeScgSOcHvatrS
	 30AHc4Fr9Wdbg==
From: Sasha Levin <sashal@kernel.org>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Jason Xing <kerneljasonxing@gmail.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests: net: fix format warnings on 32-bit architectures
Date: Tue,  3 Nov 2026 10:55:03 -0500
Message-ID: <20261103155503.534876-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 32-bit architectures ssize_t is an int, tv_sec is a long long with a
64-bit time_t, and uint64_t is not a size_t, so ipsec, txtimestamp and
the tcp_ao library warn when printing them with %ld, %lu and %zu:

  txtimestamp.c:191:42: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type '__time64_t' {aka 'long long int'} [-Wformat=]

Print ssize_t with %zd, tv_sec as long long, and the net namespace
cookies with PRIu64 as the rest of ftrace-tcp.c already does. While at
it, print tv_nsec, a long, with %ld instead of %lu, and cast it to long,
as it is a long long on x32.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Found with a 32-bit build of the selftests with a 64-bit time_t (gcc 16
and clang 21 with -m32 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64);
KernelCI's 32-bit arm builds show the same warnings. The changed files
build without format warnings there now, and the x86_64 builds don't
change. The other selftests get the same kind of fix in separate
patches.

 tools/testing/selftests/net/ipsec.c                 | 2 +-
 tools/testing/selftests/net/tcp_ao/lib/ftrace-tcp.c | 2 +-
 tools/testing/selftests/net/txtimestamp.c           | 9 +++++----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/net/ipsec.c b/tools/testing/selftests/net/ipsec.c
index 89c32c354c008..ba8c36a93f176 100644
--- a/tools/testing/selftests/net/ipsec.c
+++ b/tools/testing/selftests/net/ipsec.c
@@ -2030,7 +2030,7 @@ static int __write_desc(int test_desc_fd, struct xfrm_desc *desc)
 	if (ret == sizeof(*desc))
 		return 0;
 
-	pr_err("Writing test's desc failed %ld", ret);
+	pr_err("Writing test's desc failed %zd", ret);
 
 	return -1;
 }
diff --git a/tools/testing/selftests/net/tcp_ao/lib/ftrace-tcp.c b/tools/testing/selftests/net/tcp_ao/lib/ftrace-tcp.c
index 27403f8750547..cd93ff8965dda 100644
--- a/tools/testing/selftests/net/tcp_ao/lib/ftrace-tcp.c
+++ b/tools/testing/selftests/net/tcp_ao/lib/ftrace-tcp.c
@@ -504,7 +504,7 @@ static int setup_tcp_trace_events(struct test_ftracer *tracer)
 	size_t i;
 	int ret;
 
-	filter = test_sprintf("net_cookie == %zu || net_cookie == %zu",
+	filter = test_sprintf("net_cookie == %" PRIu64 " || net_cookie == %" PRIu64,
 			      ns_cookie1, ns_cookie2);
 	if (!filter)
 		return -ENOMEM;
diff --git a/tools/testing/selftests/net/txtimestamp.c b/tools/testing/selftests/net/txtimestamp.c
index f7bdf30b78d9f..be1452d73b303 100644
--- a/tools/testing/selftests/net/txtimestamp.c
+++ b/tools/testing/selftests/net/txtimestamp.c
@@ -188,12 +188,13 @@ static void __print_timestamp(const char *name, struct timespec *cur,
 		return;
 
 	if (cfg_print_nsec)
-		fprintf(stderr, "  %s: %lu s %lu ns (seq=%u, len=%u)",
-				name, cur->tv_sec, cur->tv_nsec,
+		fprintf(stderr, "  %s: %lld s %ld ns (seq=%u, len=%u)",
+				name, (long long)cur->tv_sec, (long)cur->tv_nsec,
 				key, payload_len);
 	else
-		fprintf(stderr, "  %s: %lu s %lu us (seq=%u, len=%u)",
-				name, cur->tv_sec, cur->tv_nsec / NSEC_PER_USEC,
+		fprintf(stderr, "  %s: %lld s %ld us (seq=%u, len=%u)",
+				name, (long long)cur->tv_sec,
+				(long)(cur->tv_nsec / NSEC_PER_USEC),
 				key, payload_len);
 
 	if (cur != &ts_usr) {
-- 
2.53.0

