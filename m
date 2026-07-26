Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E50B37E5C8
	for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 10:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785063417; cv=none; b=oH+0RcKXyUi9VUYPooCbt9DPYmtOJEGyh3lhp02CCS7pW4ACVj58ikWYYxH395BNB6BE2hapWLlTn4M8iogZ5MRA2/Njo31iPDvVydg5/qyzUJoRwOAr2/sp8V/apRr03KG1oyO9jKO/Fo/vIddGq/x4/WBI4B/NE2k7rT/hjVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785063417; c=relaxed/simple;
	bh=Lu5byszqUlnGfnfigbQHSkOtoVaUePJpDeishqMwxpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B8Bvgq9gBeIxR7Sy/8e9a2/sCj7UMitAAHFSp0JwLR9fnPj0iD1886++IEUJAiUW1mmCv0xkc0qImw93KUsRgMbsni5UJEOxrWl1RfEA1hZnYHiJiswhG8H5oTdG1lge+mUVLV2NO8bnCK9jaiJWK/Bc98lVVj635/QsLEFjOGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxRL0+se; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxRL0+se"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e08baf860so1842007a91.2
        for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 03:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785063416; x=1785668216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJsViFdITFUa0GcW8Cpp/CcYnvssYDAfSDQp/+OuXPI=;
        b=fxRL0+seP9OgSm+FGj3qp4oBjELOzUqBF/TSnuK8SF0MmB7KRlDg84isnKyzxgsYlg
         l+UaSsBW0JSgZajs4D2nB73DbHrUWnpelOvikFQlid3pXe3Ks6WOvBleiVX7Z1oDW/hG
         R3Ah1XCbUASjAhoG1/dMI+QxKpNDTXO3tm9gArFiVQGAjvHHN7Dwds7T1z/EqrB0ZFpg
         BLLr36xvC4xb+jJlPy3deVy5MoJplB4lIYoO8V4xA89nE23NKMP/BuCpfiDGmlYcWiKu
         yv9rks1ZLTdsh/xfqVQsvvSJWOGXTE2FGyG7iMVaxLVpZ37SB9KKvhhTg54eWghHgkOh
         PYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785063416; x=1785668216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fJsViFdITFUa0GcW8Cpp/CcYnvssYDAfSDQp/+OuXPI=;
        b=dZx2UQaRaMWY1kxf7AqeBglWuFD/XjcDqwR4tEUy7lmUZkZvFEpyQRDsOZVqlcvl9n
         JtftOPQNA3SFJMyBO6WKt6put+UOvg2AdgQP+QmzkkY1DKSeuU2wFY3oiIoKlHnR6qzr
         4zct/LGGdZk2kgMqgv/JrGZx5/JQPxWv6HxWpxxqpaJL3D7Swg+lFY61kDpm3WAnMcSR
         BiT9W1qCENP69gEPYvwY6Gp7TioiR3Qf796Da42CVXr3uWtLnGOLu9B4WGy9tGnrHyrZ
         gC2sHdaoX5yNAS9t052qrAZY4kFgxwSGMSfD5IUnr6sCN5qOkdQgcX8iwTHPUBtqAH+m
         mINA==
X-Forwarded-Encrypted: i=1; AHgh+RptpK4I+oFgNzyXvAMx1FCPe8lj7XpY/QE3kNSiqhQ7cgOTK/+1sKGS1m8OxcsRSHRfMCdPYOoazFcFzEfQoy0=@vger.kernel.org
X-Gm-Message-State: AOJu0YySK3YNrw7kQwFA79UVigFa2wGZgZMrHmbctVaVLYXn9GCrfBet
	qGuw+WvW92753cm7hUks71u4GJBbn6w1eRGLoiLQjjxnaizeDgz+I3KM
X-Gm-Gg: AR+sD1351I+4m9NtW8f9Dc0rzm8CKsKjViKpJnw59oJ8b3nzEr91xmPVjVzR4dtynYT
	bJ/kp1T2QZ4FjlIX0JoxlpYFo5t3iVi1AnI8cHmISfPcGhEd2yTZXK8YHcE/FI3vAmQk5nsG9EG
	zaYFHJxdw0l84cBLe19BL3YCDLIKwxUlXnDNY5+ROmmZGvJ3F3tzl+XOykgoDJ7ds5a6GSEKv0K
	UI9EQrvPVCTUpu6U6ckXmPsWKGP56R6y2gOndtSpFFpB0LvAhOAfQkMPSrr0fYTbomF211nGFE7
	o6ogOmVQEAmWFQV6pCYiMUTjGOsSJnDuGgW3NvI331kjnmOrqakan5pM1HjtUWBgZZtOw9GKAU4
	7FwOcRdLwjGaYQpJbILyx14Nso1xycrdGrVmWMzgUC3Bm3zEw5olbmiBvBlftZQCN0+Er/gOuyJ
	TreukD3oNzpCvz2MwoOZt1AnoymmfpDWIuCvMuvdLMide+IEs=
X-Received: by 2002:a17:90b:4f8b:b0:38e:7eb:d07b with SMTP id 98e67ed59e1d1-38f2975c750mr4543248a91.34.1785063415829;
        Sun, 26 Jul 2026 03:56:55 -0700 (PDT)
Received: from anna.. ([114.70.9.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f04175c1asm3645559a91.12.2026.07.26.03.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 03:56:53 -0700 (PDT)
From: chanyoung <ppoo1220@gmail.com>
To: netdev@vger.kernel.org
Cc: John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>,
	David Howells <dhowells@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	chanyoung <ppoo1220@gmail.com>
Subject: [PATCH net 2/2] selftests: tls: add a test for splicing onto a full plaintext record
Date: Sun, 26 Jul 2026 19:55:56 +0900
Message-ID: <20260726105556.2719227-3-ppoo1220@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260726105556.2719227-1-ppoo1220@gmail.com>
References: <20260726105556.2719227-1-ppoo1220@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Splicing into an open record whose plaintext scatterlist ring was already
full used to wrap the ring's end index onto its start.  sk_msg_full() then
reported the full ring as empty, so the loop kept overwriting live entries
while sg.size grew, and pushing the record ran the AEAD scatterwalk off the
end of the scatterlist.

Reaching that state needs the ring to be left full and unpushed across a
syscall, which the copy path does when the fragment it adds is the one that
fills the ring.  The test therefore fills the ring with splices, adds one
byte with MSG_MORE, splices some more, and only then pushes the record.

MAX_SKB_FRAGS is configurable, so rather than hardcoding the number of
fragments needed to fill the ring, sweep it over the plausible range so the
one-byte send lands exactly on a full ring whatever the kernel was built
with.

On an unpatched kernel this oopses in the AEAD walk; with the preceding
patch applied the whole tls selftest suite passes.

Signed-off-by: Chanyoung Park <ppoo1220@gmail.com>
---
 tools/testing/selftests/net/tls.c | 52 +++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index cbdd3ea28b9..d2666884ea8 100644
--- a/tools/testing/selftests/net/tls.c
+++ b/tools/testing/selftests/net/tls.c
@@ -835,6 +835,58 @@ TEST_F(tls, send_and_splice)
 	EXPECT_EQ(memcmp(mem_send, mem_recv, send_len), 0);
 }
 
+/* Splicing into an open record whose plaintext scatterlist ring is already
+ * full used to wrap the ring's end index onto its start, after which
+ * sk_msg_full() reported the full ring as empty: further pages overwrote
+ * live entries and sg.size desynced from the walkable scatterlist, which
+ * oopsed in the AEAD walk once the record was pushed.  The ring is left
+ * full and unpushed by the copy path, which does not push the record when
+ * the fragment it adds is the one that fills the ring.
+ */
+TEST_F(tls, splice_onto_full_record)
+{
+	int frag_len = 100, extra = 4;
+	char mem_send[5000];
+	char mem_recv[5000];
+	int nfrags, i, total;
+	int p[2];
+
+	memrnd(mem_send, sizeof(mem_send));
+
+	/* MAX_SKB_FRAGS is configurable (17 by default), so sweep the
+	 * plausible range to land the one-byte send exactly on a full ring
+	 * whatever this kernel was built with.
+	 */
+	for (nfrags = 12; nfrags <= 45; nfrags++) {
+		total = (nfrags + extra) * frag_len + 2;
+
+		for (i = 0; i < nfrags; i++) {
+			ASSERT_GE(pipe(p), 0);
+			EXPECT_EQ(write(p[1], mem_send, frag_len), frag_len);
+			EXPECT_EQ(splice(p[0], NULL, self->fd, NULL, frag_len,
+					 SPLICE_F_MORE), frag_len);
+			close(p[0]);
+			close(p[1]);
+		}
+
+		EXPECT_EQ(send(self->fd, mem_send, 1, MSG_MORE), 1);
+
+		for (i = 0; i < extra; i++) {
+			ASSERT_GE(pipe(p), 0);
+			EXPECT_EQ(write(p[1], mem_send, frag_len), frag_len);
+			EXPECT_EQ(splice(p[0], NULL, self->fd, NULL, frag_len,
+					 SPLICE_F_MORE), frag_len);
+			close(p[0]);
+			close(p[1]);
+		}
+
+		EXPECT_EQ(send(self->fd, mem_send, 1, 0), 1);
+
+		EXPECT_EQ(recv(self->cfd, mem_recv, total, MSG_WAITALL), total);
+		EXPECT_EQ(memcmp(mem_send, mem_recv, frag_len), 0);
+	}
+}
+
 TEST_F(tls, splice_to_pipe)
 {
 	int send_len = TLS_PAYLOAD_MAX_LEN;
-- 
2.43.0

