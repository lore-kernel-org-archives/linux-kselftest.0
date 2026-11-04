Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803586;
	b=ZecSLmMNnxRkTn8bQIFj835YN13agpGL/WqFKWhACBSyVGsOmWNG/4PR/0kQ8r/MOIUb
	 qJ3r0CtOJyNTsLqWPpUPq8JkZQjzFyk/AV6nJjci9AxvVWt5dWWspBwNKQfcQMYWwKKFw
	 zL4TGAsc425ebtpDp5+RRrCzacIvPm/OacQpxuWVE7KBT+376vPi9hnc6JYNVX6EUZhRh
	 dxIGL6+7NRljpT8P8+PfchqRDQ6jwM++iupVykHbrwOvpIZ8X3R9akdLu/31tMGIYh7uo
	 Hxb3bMrVd9E/2U8UreZrOPwNWME1Ub4nlK8QrxonJXDLgWNy0l7Odu5piai0vSNuKng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803586;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZmB0cOk9CeDJ4AVUd+j92L9AZOJTIyuo4so8WOnVl9E=;
	b=1dM+gHR9wDeZukbo9kM9tNItfIgIW3svMPV+YqIYDrhP3gfuyFQp4qylg3JJfwpBOHCt
	 z9QrlhAMe84B1HmKdh4RGH3+9uuR2Yw8G5knn7JoKyOTDz8AhcU5m3CWBZT5tNWU6O14o
	 2h6yS3UhBrfDBArg75+JGBH4+o9R1lZ2t9G5QzeBtSKZMMC5VbVeHmHXyuYV00KOxOoRi
	 qDBYf+K0PCYCmMwEkp6DwIDH1SOLuUpuk2YT5UJZTK+w0fZnxwQgrbwEx0UR/H3O839PM
	 5AvDdNiQ0vpIqCEtwF70WoMeorV2KD2Ip1v+vLYsklVKskBxxkWCMP81bvdCKLZZgqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nFjjaOIF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BB8606A32E;
	Wed,  4 Nov 2026 14:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nFjjaOIF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A7901F000C1;
	Wed,  4 Nov 2026 14:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793803585;
	bh=ZmB0cOk9CeDJ4AVUd+j92L9AZOJTIyuo4so8WOnVl9E=;
	h=From:To:Cc:Subject:Date;
	b=nFjjaOIFMBRsegOkw3+2nao5ayTBeNTVAr5+T460q1LEQa8fCE3nu+f/nkZv7jMwO
	 6gODodh3kL9NphnW5LcXXCa6U5arTCYp2VzDWFOl31kZoSxHlFQ185ZvY2Xvoszf2/
	 yF+ULoSHW+8H88impaRvlV8B/k0Nvs90zsg4TlgLj1z+cz33oIdn1N5qNBN2h0ZuHh
	 Z2Hk3uhj9JhbzVYP3/lY9NxqdRjofRKSS7o5UUc07quDN2eW4gimxnQIWfTBpkuiMC
	 zzhiAHX26uzL+CaSpvvUabCkhWNkNHr2irYj06YQUFVdOcm1VrgAO+611HHgotPhMJ
	 vQrPpA31pe70w==
From: Sasha Levin <sashal@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	Breno Leitao <leitao@debian.org>,
	io-uring@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] selftests/io_uring: cast optval through uintptr_t in mini_liburing.h
Date: Wed,  4 Nov 2026 09:46:23 -0500
Message-ID: <20261104144623.3803717-1-sashal@kernel.org>
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

Cast through uintptr_t, and include <stdint.h> for it.

Reviewed-by: Breno Leitao <leitao@debian.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
v2: include <stdint.h> for uintptr_t (Breno).
v1: https://lore.kernel.org/r/20261103163926.641431-1-sashal@kernel.org

Found with 32-bit builds of the selftests (gcc 16 and clang 21 with
-m32, with and without -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64);
KernelCI's 32-bit arm builds show the same warnings. The changed files
build without them now, and the x86_64 builds don't change.

 tools/include/io_uring/mini_liburing.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/include/io_uring/mini_liburing.h b/tools/include/io_uring/mini_liburing.h
index 44be4446feda5..6afe7efb44978 100644
--- a/tools/include/io_uring/mini_liburing.h
+++ b/tools/include/io_uring/mini_liburing.h
@@ -3,6 +3,7 @@
 #include <linux/io_uring.h>
 #include <sys/mman.h>
 #include <sys/syscall.h>
+#include <stdint.h>
 #include <stdio.h>
 #include <string.h>
 #include <unistd.h>
@@ -269,7 +270,7 @@ static inline void io_uring_prep_cmd(struct io_uring_sqe *sqe, int op,
 
 	sqe->level = level;
 	sqe->optname = optname;
-	sqe->optval = (unsigned long long)optval;
+	sqe->optval = (unsigned long long)(uintptr_t)optval;
 	sqe->optlen = optlen;
 }
 
-- 
2.53.0

