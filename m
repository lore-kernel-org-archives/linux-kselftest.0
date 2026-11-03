Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721301;
	b=JokfaC6t8sWXCDVj7i+7aEwZbpGA8SaGDWtYMwcgdQeJDfusbstLrrerRWD77MJ97jT3
	 qe54xUWLSLuLBhC1SJReYn/I6bzyVx95KLOH/fGyEVOqZL/PY8d5rS2wv7Qu90waxs6Kh
	 UWhDobJTwWhefIkyFuenPwOAUyuK8HBD768Vc2oCzZ8HhrsQzqXaMtx8/6/GzOsHUwg9p
	 rqE+N64NqVOS9PpZXCCMkJPhh4lFIxQlA2Q1sUMe5Vwx/GkQ2Yi2Gz4abBC8U1YYJtVSk
	 REEorqItzydt7WMootiui9bUhuDzA5HlP8FcPBp83ySBAAlKcjyJ9W2PW1zWDmoBuDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721301;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9oI+39KPSefDJAX6kpWWwyfL2A7o2EUE+Zm7n2vH2s8=;
	b=jnEBdkwVPW4MoBePmxbmDqsS74e+S08FGhS+z5YvQ6hKY5khwsoHXWvzDJ4hqvKolpmH
	 BXDQz+AxnOpDxvgX/9S5yLZqqKtnRr58/ZX3ez1NZFSeTRbPKcMSyWg+EBXixWNqRP7g2
	 SiLYBN4ij2nAJ5LRJPbrA5ARD1D9lvnmsAIdGoQ/CQ/1VcXRATwO8lfanTUywRbtXVve5
	 3MLD9nHMyu6rXrzLt3ez+Jydf99rxhqK71rhK9THlHHNsirL0wJDxHXchVZh1hvC/cCWu
	 xY3EjNrSPEV08S9oP3kQSRO6EVaD32j9PXm+g2eGhLY7W9pwVLKOJTWsMU4i71e+oRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VxLKm0Xp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9046E606D806;
	Tue,  3 Nov 2026 15:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VxLKm0Xp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11FC61F00A02;
	Tue,  3 Nov 2026 15:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793721301;
	bh=9oI+39KPSefDJAX6kpWWwyfL2A7o2EUE+Zm7n2vH2s8=;
	h=From:To:Cc:Subject:Date;
	b=VxLKm0XpRkMgxWDksOnroNDk3UvSJoO4QJ9r0n9YglpI+On+nE3urJ70ewW9eaLCh
	 4cBtwp3vTI3xgbbDoq5DzvqVucTw39IFI48XI8lkzhLxMYzKMnvvaAt2Bwl4iVUqf9
	 LZWkeNvG+Pu4mjqCgScZyTRkRYfzbzE2xe8jUKta0J6hYJO1tSBbkth46ERxmmTzh7
	 hjcbQnhRywh6vCH06HBNVQ1/Z6QUZgl7YsXGIop7SNHYjEZtGO2sCxpdVkNkZgE6ge
	 AzS1oNfh24dc4ohRkHhvCZtc+c8wF1sKIvtT2LDclwhvgRxCDIZJ68dGlW0ULmT4BX
	 4zZJ+EJx0VqqA==
From: Sasha Levin <sashal@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests: dmabuf-heaps: print size_t with %zu
Date: Tue,  3 Nov 2026 10:54:59 -0500
Message-ID: <20261103155459.534792-1-sashal@kernel.org>
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

On 32-bit architectures size_t is an unsigned int, and printing it with
%ld warns:

  dmabuf-heap.c:215:43: warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'size_t' {aka 'unsigned int'} [-Wformat=]

Use %zu.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Found with a 32-bit build of the selftests with a 64-bit time_t (gcc 16
and clang 21 with -m32 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64);
KernelCI's 32-bit arm builds show the same warnings. The changed files
build without format warnings there now, and the x86_64 builds don't
change. The other selftests get the same kind of fix in separate
patches.

 tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
index 1d49df6719198..c65efc088e88d 100644
--- a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
+++ b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
@@ -212,7 +212,7 @@ static void test_alloc_zeroed(char *heap_name, size_t size)
 	void *p = NULL;
 	char *c;
 
-	ksft_print_msg("Testing alloced %ldk buffers are zeroed:\n", size / 1024);
+	ksft_print_msg("Testing alloced %zuk buffers are zeroed:\n", size / 1024);
 	heap_fd = dmabuf_heap_open(heap_name);
 
 	/* Allocate and fill a bunch of buffers */
-- 
2.53.0

