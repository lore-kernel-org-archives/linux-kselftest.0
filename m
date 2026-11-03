Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721287;
	b=YRAYTZPVni2FrtETU2oXpcIgEXreMuD948BgBKvRic0KbqTrQ7ynOFhGGKDkT2pqP+Hr
	 SA2uLkueFKf6NtOI58XQKgSlKm7MkTXAVzs/VYk2Lz0AAEqxDSQsAmRfuO82ysMC03P+u
	 HUTXzeumIjq+SxEB98CEV9a4tqYtKDVAp2gmQO/Rl3qXkFcGXFJFGfxKoX1YkgqkA/elB
	 /eotaLRgHQufVpKNnOy4ZvlasWa+B7OFSzwnfNduwlxP9vAJoN6mmR8eeGuERGhLaW+83
	 +5vvuU0nIEFVlW5JJdXM7RGHvXTVGKYgZVM0cv9SKXBfCjy4vSugtSPc2d/RM7hW0yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721287;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HfxINFPOuvxpeof55YGaIR8J1T8NROxwYVbT3QGvK+A=;
	b=Z3cDWNchimx04zQiY+WJWAc1JwZJ/ns3Yed0Psmfo75moLJwwbq+TXg5AnRFUydHh+L2
	 Hza27Ifxhldr6S8Kz0jFpYJg8ldM46xzGi4ZiZgAFOJRNF77WPgAjfjfMgIQszeczoGI+
	 f/T7L0j8PuCNG1JUD7rzRyVsOUJ7rNePrt7mvlGIYB84HwFUwzdHfiYy3HrvD84H5VaS+
	 o2hwepH19Q3SoVeHXsXwJjDkMfqY4LNtcI2bvnP6SdqbACWykqC5mw4+ojRA2Kvi0+ZcR
	 7MgC1Zvak/xOXD7k1ZqaZpX1QcyN8IK9JLTX27HuS8UKbvVL0B7YJa9T3oS2t3f6WVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Odq9cT6X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CC9606A332;
	Tue,  3 Nov 2026 15:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Odq9cT6X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4087A1F00A15;
	Tue,  3 Nov 2026 15:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793721287;
	bh=HfxINFPOuvxpeof55YGaIR8J1T8NROxwYVbT3QGvK+A=;
	h=From:To:Cc:Subject:Date;
	b=Odq9cT6XCc9cwUwwvN005FuqfOYwyMt8ELYopbEwENmcN4PiOVR4hn9NJx7IImJYa
	 MsycMpmJ8tcmEtl2MbXuUrUgx7ipFeFFpg6MrCJ9ZFuMubB8OsN399dVqOxRrXqjPY
	 iPATCIY2su4XKKxot6YjU3pdXyzPA7/CT9Rrh0yv7jSbEHosVZHzGlerhDEbiZWc4T
	 J3IAgR5Pk9KivaOtQyKFBZFeqcrmc+Z1f9jXVbzOjBfpb9m3Kg8vzWh7/ouYYcgHkx
	 gdmsFTcbafTx9njWSBqCi0tPqEko6R0J2qA+mRjXkXjXbBlikPIB+pJIp1ac8KHRtK
	 PrbdcNxxKVXcQ==
From: Sasha Levin <sashal@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests/futex: print tv_sec as long long
Date: Tue,  3 Nov 2026 10:54:45 -0500
Message-ID: <20261103155445.534229-1-sashal@kernel.org>
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

On 32-bit architectures with a 64-bit time_t, such as armhf in Debian
13, tv_sec is a long long, and printing it with %ld warns:

  futex_requeue_pi.c:351:30: warning: format specifies type 'long' but the argument has type '__time64_t' (aka 'long long') [-Wformat]

Cast it to long long and print it with %lld.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Found with a 32-bit build of the selftests with a 64-bit time_t (gcc 16
and clang 21 with -m32 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64);
KernelCI's 32-bit arm builds show the same warnings. The changed files
build without format warnings there now, and the x86_64 builds don't
change. The other selftests get the same kind of fix in separate
patches.

 tools/testing/selftests/futex/functional/futex_requeue_pi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/futex/functional/futex_requeue_pi.c b/tools/testing/selftests/futex/functional/futex_requeue_pi.c
index 65326cbef3a44..2530e6999f933 100644
--- a/tools/testing/selftests/futex/functional/futex_requeue_pi.c
+++ b/tools/testing/selftests/futex/functional/futex_requeue_pi.c
@@ -348,7 +348,7 @@ TEST_F(args, futex_requeue_pi)
 		secs = (ts.tv_nsec + timeout_ns) / 1000000000;
 		ts.tv_nsec = ((int64_t)ts.tv_nsec + timeout_ns) % 1000000000;
 		ts.tv_sec += secs;
-		TH_LOG("ts.tv_sec  = %ld", ts.tv_sec);
+		TH_LOG("ts.tv_sec  = %lld", (long long)ts.tv_sec);
 		TH_LOG("ts.tv_nsec = %ld", ts.tv_nsec);
 		tsp = &ts;
 	}
-- 
2.53.0

