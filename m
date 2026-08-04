Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B432391505
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 05:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785821380; cv=none; b=Ev/stY3Pha3MgZ9V2e1+WeInZvwKnhJrqG/FhGFdab5FOmcZ8noJKSll1uFX61PQAs2+9XJeahHnns7EE9JbJjjDE0Qg6UAgtR060K7j/Q7c4WAxUxNQNdy+mMYDJLgObSumCmJuiuVhEQ/iJIMXM9MuXBYM8VNXZBZkiZ9gbB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785821380; c=relaxed/simple;
	bh=NglNxf8i7Yx81CxH2eUvccUMa9Sz28wCZkiZV6qMfLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i27uMVe/MmzkiekUWM6HrE6FkwPUvC2FwB9LLHtq4sFD8wxWCwYZ+pcnombcXXWrVLUWG1Si1z+7WkTxIYQdjKMCRMjQ9Ro0ki8N2gkhcuumP1UGM41OdfzOeF2YNPNC6yfL7y7EkLdj0JvTj2+vYo69oLjNxu06XGHHbqKswrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFznf+/9; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFznf+/9"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cad8076b01so46426715ad.2
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 22:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785821378; x=1786426178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WOabnsO5f5oZy12R8uSYiJHJ+HxufIOfXMD6iLX07uI=;
        b=PFznf+/9OWc6d/ZGD+uB+gOHFCKcCXdJjsK6O+gRvVcxHwLN/eiXXRUGJRn+tnaXJ4
         3OyL3Zl8TzVJilIG5WI9bp/1I2vtJq8Pu1V4wA746u6vWukGgqqz8Zq4OEPT8aqraRhW
         fqr4NvcJM3ep4bX41ZsEGwfhnFCco32oOd7DC/kAEJib0fc3ORV9z5l3MJujei+S1GcJ
         BQS6e4BCNtD3UV0BBJHSpfMxz6IaCScEAfarwDSZZ8W4TI6d9lpVb5DH7uPHAQ1l7K0f
         Lld3E5fXrMZlDFVi6sY+jNldyI00BIIE1ni2A+MkucnlzZROIe5JSYk+MOj3pgWIPGhl
         ObGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785821378; x=1786426178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WOabnsO5f5oZy12R8uSYiJHJ+HxufIOfXMD6iLX07uI=;
        b=sxKSpvJ75BgrlmvMyKqLgJJtE/rnO437ICAXJfrTTwxoKF32D63Nvs/zucKBBXogC1
         RffrIb1JqAiA0dK9SDom7dXcUqeF6v6qMDdaWmcDLrBzmD8FMN1NOpfYM1ubHBHNc5Hj
         sUlx5bJRYkt0jOkE0TB9Y4MaqV7XNIbZybQ3ts0Oi2LT+W77ZB2qr2eVxkOwKMGQYwxp
         affs5IaI41OpbVjwy2VMtjWVUFXVcdnr36PCneuXm1aQ6WKLP4n4r26US3pmYqhmFaie
         M2YLHb9vQTf2CzAiHcswaDYot7/upkOqwfy6gTvRauAlETg9hmbuesuGb7fcrdVaSbuC
         Zcwg==
X-Forwarded-Encrypted: i=1; AHgh+RpqWofMfR+TbEyFUJBLJm1NL/Ehw76WAhJzBMhZrysquMkZrNDCqHXcrx8Xp+VV2lNkTjm1UlvyazNMJCOu8sY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKbUiJxIIfp5I9EfYeVwP9dnapWZswsfgVgPCRSPgbUOPaI8KB
	Pp694dUbv5ij/PdOkCcWuto/Bktor71s430RWWdasAEiWf8eKwpRbEtr
X-Gm-Gg: AR+sD13xmv7U43ZWcbq0y5G/gs1HeZPHLhZsvSZki4VFi7tWHrUbZemJzmt1D9AcXN5
	9daZLgNHSophJr0/3iIa3wvC9cWhOl1a9XJQ3zCINoF7urXp6o48i9grKnLz4rOwcHoh7f+o884
	Ao4yrjBNBW6miMgmxIbgggXxRTr+DRZ4MYKBs/s74l6ztnepNHsrS0hLdyIs/sbZ4GIRlsviSLl
	Rs7lINDSuSYt785iJoelRBx33V+PY3Iq1k9vAm69C5dNvT1EbdQTBovFOjkXpdYwya+NQcIymsx
	nIorflzpJ+Ncvz+1J0lzZh4/2GZaB+Iw7hopO2AzlHMW4T9kaZAn3AYno7QIo6pdFwBYYQ8BL01
	6FUYz0c2IAJur6El23AAky6VUps6QQNppzLwerrVqG6Bt6N75gM+/8bqD+jIT8FORcEiaWMlJy5
	ehyZ8pm4cWjBf3k+CgXPQQKwivYdcTPbUvAeHak9Qg99in4pkR6ohQtQH9hBa95O/ZKFIRAUyo5
	n2Gf25SM7rh3eZtNBOvxH7JO7ROuKZd2A==
X-Received: by 2002:a17:902:f541:b0:2ca:5970:732d with SMTP id d9443c01a7336-2d0524810e8mr129449185ad.41.1785821378375;
        Mon, 03 Aug 2026 22:29:38 -0700 (PDT)
Received: from anna.. ([114.70.9.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae5a904sm47056345ad.20.2026.08.03.22.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 22:29:37 -0700 (PDT)
From: chanyoung <ppoo1220@gmail.com>
To: netdev@vger.kernel.org
Cc: Sabrina Dubroca <sd@queasysnail.net>,
	Jakub Kicinski <kuba@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	David Howells <dhowells@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	chanyoung <ppoo1220@gmail.com>
Subject: [PATCH net v2 2/2] selftests: tls: add a test for splicing onto a full plaintext record
Date: Tue,  4 Aug 2026 14:28:36 +0900
Message-ID: <20260804052837.49015-3-ppoo1220@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804052837.49015-1-ppoo1220@gmail.com>
References: <20260804052837.49015-1-ppoo1220@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Splicing onto a plaintext sk_msg ring that is already full used to wrap the
ring and make the kernel oops in the scatterwalk once the record was
pushed.

Only the copy path leaves the ring full without pushing it, so splice until
the ring is one fragment short, add the last fragment with a one-byte
MSG_MORE send, and splice once more before pushing the record.

CONFIG_MAX_SKB_FRAGS is 17..45, so that last fragment follows between 16
and 44 splices; sweep that range to trigger the bug on any build.

Signed-off-by: chanyoung <ppoo1220@gmail.com>
---
 tools/testing/selftests/net/tls.c | 37 +++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index cbdd3ea28b9..3d6f553eaf9 100644
--- a/tools/testing/selftests/net/tls.c
+++ b/tools/testing/selftests/net/tls.c
@@ -835,6 +835,43 @@ TEST_F(tls, send_and_splice)
 	EXPECT_EQ(memcmp(mem_send, mem_recv, send_len), 0);
 }
 
+TEST_F(tls, splice_onto_full_record)
+{
+	char mem_send[4608];
+	char mem_recv[4608];
+	int frag_len = 100;
+	int nfrags, i, off;
+	int p[2];
+
+	memrnd(mem_send, sizeof(mem_send));
+	ASSERT_GE(pipe(p), 0);
+
+	for (nfrags = 16; nfrags <= 44; nfrags++) {
+		for (i = 0, off = 0; i < nfrags; i++, off += frag_len) {
+			EXPECT_EQ(write(p[1], mem_send + off, frag_len), frag_len);
+			EXPECT_EQ(splice(p[0], NULL, self->fd, NULL, frag_len,
+					 SPLICE_F_MORE), frag_len);
+		}
+
+		EXPECT_EQ(send(self->fd, mem_send + off, 1, MSG_MORE), 1);
+		off++;
+
+		EXPECT_EQ(write(p[1], mem_send + off, frag_len), frag_len);
+		EXPECT_EQ(splice(p[0], NULL, self->fd, NULL, frag_len,
+				 SPLICE_F_MORE), frag_len);
+		off += frag_len;
+
+		EXPECT_EQ(send(self->fd, mem_send + off, 1, 0), 1);
+		off++;
+
+		EXPECT_EQ(recv(self->cfd, mem_recv, off, MSG_WAITALL), off);
+		EXPECT_EQ(memcmp(mem_send, mem_recv, off), 0);
+	}
+
+	close(p[0]);
+	close(p[1]);
+}
+
 TEST_F(tls, splice_to_pipe)
 {
 	int send_len = TLS_PAYLOAD_MAX_LEN;
-- 
2.43.0

