Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66A3334C1D
	for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 10:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785063401; cv=none; b=fnOaWbnt2GlPwEdqv7fmOPbTJ2IrgddIRBQ5yeQfE0Qs0v6ridtQB4k5mECM682KePNTx7rWVI248XbbFLrFgFR2qYWx2HSYwImGMGmG6Kei8kHyOY/DXZVA9t4xWAdEZOjzUZaDkQTDQgd6DXDibWyEIRNSGXwRj/EARTuaYF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785063401; c=relaxed/simple;
	bh=FegCKW9FMF1/MnKnXvt8KmJF/dfU+PKJUGTgC6peWLk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sQbsRrfBhRHMpsedazAGWYIk9WlHkqyxiq9V6zKCS9Rdj+9hdHKSnbAh4Slq5sp42qUZdMfSj70POpPB5rJ+EtnCwEsIyJ2C2ylSuKZD+QvG7fY9XSm3JRQbbwb0sJc90GFA2jMd1i8qCdPWT4NxwGQ6wmGVz1aSWG/miaWtN4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPwoYxKL; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPwoYxKL"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e08baf860so1841922a91.2
        for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 03:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785063400; x=1785668200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6SnhdOfwsu7KEbWY+O+8re8x+bMH7YPIZLb0qYgvEHU=;
        b=TPwoYxKLSUiDbtlIPk66be8MBSy3nzhJ4Y66lLDzJD9utaiVPoGzoiCBVgn9yIBmDp
         vfBtgM5VyJutQvEpGWECSw7juWMZPNQ3AOXRkU0tGEA5ejfERIFDedjNJg43HrXkjIqD
         KQaZ3O9MyCzqe3+iQmktkazKZeULT2r2RlG+dtmh41EEImcBiXZQky0hoKsYwf18pogC
         kk61onX8jBrQvJH/ASdjXVnUuwGUXlVKvltcr46x2+OxVGb0kgSmEdEnMUuekIe3yvGd
         IE14acCWxWeZM57nXPF15/jSrx6JufDtqMAf98TL9KHW39lnwncaNZS6EROylF9C/4mO
         7veg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785063400; x=1785668200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6SnhdOfwsu7KEbWY+O+8re8x+bMH7YPIZLb0qYgvEHU=;
        b=mx0u9ZXag+PvDuHGtGsVncdhK/1bmie3AFi5BFHtXwCGGY+95f6JWQCG7oNTKsxBp7
         pq8yONn+ge3tODqeJJGDyC4KctwGXKib8qslhRRhHkJFdM3ft7tb4CJFJ9EwL9JVK3vt
         1+87vTPIMp6f9AXbIiBW9BMFaSrlfIqTYia2KceuGrNCVi3VnmgPe7jnzVVUgemsTz7q
         qnjHsVX/YVcYwIFPN+kzVq7z+3MJqP9P8J8rGpPTtYlCbNbJqKrhog4//2/dcwSTam7g
         ZH02qJSTPJzrezxJaiJhstUtdr1j4rSwHtwaamkVatvhlxN6S/BXZRzP3+EaoNQJtWvN
         xSiQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrj3ZHnRYz+AOCRdczMF1Rc8MXW7CWW7VpWSCtsxr3mVMgpI5HWAvncGTh4GmFtBWABlyKbc4LP9M8sCMitck8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHFFOTtCjoCCaV7MMFmDjgSpFaAyuwY3CkX209wJGt4KtDqYy/
	iarWvawYy5qLjbX+KEmxL5EthGEfznn5tweEDSi11wL1NEcLiqdhGI72
X-Gm-Gg: AR+sD11QkQ2lWNUh3ilmRk0v+GXhsqljqcNRlsqchs5rWqFMxXtfwYu7tEF+hht9cpV
	/CN07fHFaBCHXhM60NgLhL3IiQOsV7/W2Oa+2VAgngtxfsO1KpxhUeOtHjnK31WZKookWblP9Fj
	ehpGBQbtSWL+wzJtqFGxkYL5yk8xAopX+Pp5ArByx7+I4aMnqygnzYX/61vpbBuUY4Fw5j02aRQ
	FcNeoBJ0HlBa8oBYj4i4YvFyiDJaf+zv5IVV4eSKyp6T1PIW1JJdviZIbTAl6+mxqc9Hnsimf23
	UocJQkTF49cPVx+Mgg2wI2hb6OcoQ+G/yuzzn6DLjtvQUsE8Ra31EBqQt5LHOhDqOuPwH6WJfia
	oi+yf9HWoptblXWUAfbaDWMzvwOVo5q/TIFowt3yFc0P/fmawUkGId+i08A5Dp2DIMvMvmVxxMe
	oN+iOa22/EyOiFh5qRsxDzzKwI8xLkpzzmCWhg8yOPVq9fIGA=
X-Received: by 2002:a17:90b:1e47:b0:38e:b3fd:d582 with SMTP id 98e67ed59e1d1-38f29885079mr4486728a91.39.1785063399873;
        Sun, 26 Jul 2026 03:56:39 -0700 (PDT)
Received: from anna.. ([114.70.9.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f04175c1asm3645559a91.12.2026.07.26.03.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 03:56:37 -0700 (PDT)
From: chanyoung <ppoo1220@gmail.com>
To: netdev@vger.kernel.org
Cc: John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>,
	David Howells <dhowells@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	chanyoung <ppoo1220@gmail.com>
Subject: [PATCH net 0/2] tls: fix plaintext sk_msg ring over-fill in tls_sw_sendmsg_splice()
Date: Sun, 26 Jul 2026 19:55:54 +0900
Message-ID: <20260726105556.2719227-1-ppoo1220@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An unprivileged local user can oops the kernel by splicing into a kTLS
socket whose open record already has a full plaintext scatterlist ring.

sk_msg_page_add() has no fullness check of its own and
tls_sw_sendmsg_splice() only tests sk_msg_full() at the bottom of its
do-while loop, so a page is always added before the ring is checked.  That
first add writes the reserved slot and wraps sg.end onto sg.start;
sk_msg_iter_dist() then returns 0, sk_msg_full() reports the full ring as
empty, and the loop keeps overwriting live entries while sg.size grows.
Pushing the resulting record drives the AEAD with a cryptlen larger than
the walkable scatterlist, so the walk runs past the end-marked entry and
dereferences the NULL returned by sg_next().

The ring is left full and unpushed across a syscall by the copy path,
which does not set full_record when the fragment it adds is the one that
exactly fills the ring.

No capabilities, namespaces, io_uring, nftables or BPF are involved; a
plain loopback TCP socket with the "tls" ULP attached is enough.
Reproduced as an ordinary user (uid 1000) on stock production configs --
CONFIG_TLS=y, no KASAN, no LOCKDEP, no fault injection -- on 7.2.0-rc4 and
on 6.12.96.  Present since v6.5.

Patch 1 evaluates the loop condition before the first sk_msg_page_add()
instead of after it.  Patch 2 adds a regression test: it oopses an
unpatched kernel and passes with patch 1 applied (924/924 for the whole
tls suite, with CONFIG_CRYPTO_CHACHA20POLY1305, CONFIG_CRYPTO_SM4 and
CONFIG_CRYPTO_ARIA enabled so every cipher variant runs).

I found this with AI assistance, so per
Documentation/process/security-bugs.rst I am treating it as public and
posting here rather than sending it to security@kernel.org.  For the same
reason I am not posting the standalone reproducer; I can send it privately
if that would be useful.

chanyoung (2):
  tls: don't over-fill the plaintext sk_msg ring in
    tls_sw_sendmsg_splice()
  selftests: tls: add a test for splicing onto a full plaintext record

 net/tls/tls_sw.c                  |  4 +--
 tools/testing/selftests/net/tls.c | 52 +++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+), 2 deletions(-)

-- 
2.43.0

