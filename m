Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723968;
	b=DqLOT/O8Ns8FaclKYlrBnH8Bi5qZJSY0cI5HtDZEYWYCGXFAqccygYWLDx+I7nsiDS4c
	 pZE+0MXmyK/JxbMIpHywK21fbDpEHaers7ycQrouBEeJr8ArwdGNiJac32fPQ2+h5dBtp
	 NQ6nZJHYP6P4gFAbhHd2HYKfGCzNLOTPk4c12peWy789DRKS1vIbRE7ZMs72OYIPGbgGP
	 l+AHdr5VgSyUyIAh13cWOmlC1JLP5zpeSH/j9eLbL1Jd9RwnHnvY+z5DUykv74pxMK9Mf
	 r1vwPAIvkT0TRHrOA6xDsy5BKSbCDgDLbeo4x5Cem63T/F3cZyZdYM5DaIZRJnR6h8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723968;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ynLnvUTX6OUwI9Rad50F+oVa95c877fK+kIjaHq7gYw=;
	b=jQXCrctgf8vEpv1TW+9UhCsAfhKf4iwqqaye7ZDDlemEyXUKX9oEn9TTQ8heVJrn0Dm+
	 J380NPNqCKMJGlH9QOrmsnPaq3E3y2xQCLrQCC/MQkT5ON9HXh5NarLM8uZnpTOLEuT1w
	 COmWpaprchicatxgyVb4PBxPu7gQUixRr8Q/sA115cCzTxCKW76+yfgJ0MDt7IdoKshbZ
	 ba59B+lEZct6beCc4RX/m+Y00uQgVrOEjMmerLq9+DB6yLd+OIDNMTacSbo0aUjOjcf/z
	 rAPi7l7wu7TIqrSAqGqK1Ca5YIg4qHKEpIOzrMLVKlRx2jaFJ9yT/DYQLS0XLMARhZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V8vuVutf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5876860A2630;
	Tue,  3 Nov 2026 16:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V8vuVutf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40A5B1F0093A;
	Tue,  3 Nov 2026 16:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793723968;
	bh=ynLnvUTX6OUwI9Rad50F+oVa95c877fK+kIjaHq7gYw=;
	h=From:To:Cc:Subject:Date;
	b=V8vuVutfXAZH6lxPpst7Nso/NZVFQXGWTlZG6Hnt6pAcaR03kbKV/uTW6i9KyUqNE
	 O8R9bK3RnNPnc1/Ak82LSmvFHxWdufMp2MJroQ1o4T7lqNH8a9j2+hd8GxaIJHOXw2
	 xhr58iPYqG/HDPsINUPy9/zmZV9S1bjx6tV1krS9DXGeO9p4ZieTm3GVuYQhCHLYEF
	 9AD38ghGMYnJSiMoBvn7oX5fBj58p+76KMkzS8q5StBBf0Zrzqr9wHu1XAeE6PDVI5
	 +pkvEE6b1YAvaGsXPnewaMtHBgNSN4IUmtfL7wigzZIzxR+Ye4aEMGbgW46VNN/oWu
	 /87h1uzJbiF7Q==
From: Sasha Levin <sashal@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	Breno Leitao <leitao@debian.org>,
	io-uring@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/io_uring: cast optval through uintptr_t in mini_liburing.h
Date: Tue,  3 Nov 2026 11:39:26 -0500
Message-ID: <20261103163926.641431-1-sashal@kernel.org>
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

io_uring_prep_cmd() puts the optval pointer into the 64-bit optval field
of the SQE with a plain cast, which warns on 32-bit architectures:

  mini_liburing.h:272:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

Cast through uintptr_t.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Found with 32-bit builds of the selftests (gcc 16 and clang 21 with
-m32, with and without -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64);
KernelCI's 32-bit arm builds show the same warnings. The changed files
build without them now, and the x86_64 builds don't change.

 tools/include/io_uring/mini_liburing.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/io_uring/mini_liburing.h b/tools/include/io_uring/mini_liburing.h
index 44be4446feda5..1f5b0cfc1e5b6 100644
--- a/tools/include/io_uring/mini_liburing.h
+++ b/tools/include/io_uring/mini_liburing.h
@@ -269,7 +269,7 @@ static inline void io_uring_prep_cmd(struct io_uring_sqe *sqe, int op,
 
 	sqe->level = level;
 	sqe->optname = optname;
-	sqe->optval = (unsigned long long)optval;
+	sqe->optval = (unsigned long long)(uintptr_t)optval;
 	sqe->optlen = optlen;
 }
 
-- 
2.53.0

