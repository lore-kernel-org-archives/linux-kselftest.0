Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985287;
	b=RQKzclhbo30P5DbHxR6k/jKu+6iOjs1YTI+IsCZOFzjXGpZc+B/YAIvCjetYQ2Yf+GMY
	 IuaxNuORV7f6zWHviKoLmuyeBz9mnd3ewn5IkVe+XShDLGC9+LIA3KJQrSmD/VpCXOh3M
	 Gpys2jJlezjpRvkbuhkSoAUypfkp5qRjgd8Z4wfPWIelzfnXuV2tPlSPZm/4e9Wny/mE/
	 qsOrMdsKENIKOuL3c/URBOqoyNCUpAHRoLpkToAVecfzR2/0WXKzb6yG6qEg+LufT5uq8
	 fMYN6olbevfXnQ6r3FgmhkwXXPR28ZsYExKYCEyy6F743GpjvSdtYY+m1rUXPAwR30g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=npSSNgqjeDjy8yeV7j2uv0PIl6Tg9TTaL41tLSP/LLk=;
	b=RHUfJTAx7o7vvcAFm5BNAYvtA6275zfWex17CQ/FixCkFvvGTa8gB74EkTcX4uPFKWpW
	 Hd0HpEM8ZIkySfkZfU9kLSCMWY0nrzdSeMcfw4rdrROobSD7J1cy6KuVNWaSG1g//3WWU
	 jA566WUjdyGk+CNbrHklwAa7kYD9B9Tpu5KoAwj2SRTMHyzrFAsfUQeMx1vgf7dyxEWj2
	 WiJ+VzOTOH0d5vPPsJVIuOwDJkWo19u6smL1AAVS8OoUePXnfEOr596B/7w0xdFk8ieO5
	 xO1LYZnSl7qO1MIndHYmArAosvCq2cKGMP9qu25yWXVC9JyuVjWBePeEPAT+a2GgOWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fzybGRN7;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4793B606A334
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 17:14:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4793B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fzybGRN7
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso8853085e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 09:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793985286; x=1794590086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=npSSNgqjeDjy8yeV7j2uv0PIl6Tg9TTaL41tLSP/LLk=;
        b=fzybGRN7Vrij7P5ZSgvy+kjz2qjkPQLHTUD+avlpUTUi+3GXQwFtpab7vPsfLxMvY/
         7G/t5jTCVR6KSoLIERkw6KsBaX5X1B017xkHIFQBVTi9QwVMS6d4O/GJE8WjL0w8fQyN
         F6lpO994JG1Saksrnbk0vIO01qesDJ1IK2z4astuNkvPORb7ElXGnXztH0yt9DiD7DNL
         HajcbBhwT53x0XMnEfNWA0uzRagFhJR+bXvl3QUoUD7RpAPMrRyHGLF4fesvG3AaHIAw
         IJHdHsAWxj80QNhhZ5VxyoqSS+LrZBMsjhhc0SQ/Y8bYjyxAi31m9TsdllbkzSolTel0
         YSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985286; x=1794590086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=npSSNgqjeDjy8yeV7j2uv0PIl6Tg9TTaL41tLSP/LLk=;
        b=pSthZv2uDBdXBah89JEOvJv7Y1oZPZSN0SVwWYv34pfR/r+LRh2+aBpn8ReOBtzM24
         uTbP3B+TnuJnEvrIN4r3mACMsJa0GUSd57yPTjPXw2FPaabImV8/tn1EG4gSlxXxedqK
         frWWYlM/PGfsdtgdcbtXnvI8IAzGBRJKvqApS2LNDLyoPXTncb0GEaARH5nhS1HYaM5W
         ou5QM4jQtGoKthhEC/opnPKGZmhclGr3RXQ71dy6AZSGMGh5devw576egJOs+juwTTBo
         FlLZ8eE7u4WXif61w0NltqaVwXnTCOP/2MvMvg0D3xACfQrleNObEHiDDmtsun9verSt
         QtVA==
X-Forwarded-Encrypted: i=1; AKwUvBybzemFUMHh23Ghu1Gles/nSCWtIqvvuG1nepY3cSlex33xWq/lO/VT/CG9Fd5+YltJqccXxrSA4nXtqQDB0fg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q5rjlCkRoTQ3GSBdwRMSgkQzlwdDJIOY+Ap8JcMNpbv949k5t
	3wjSkfLZ8qdRPsvSUVujUiLXquqZ8CPq2Y1c7dUIVwZ64h9ua3z4DPvg
X-Gm-Gg: AYBFou3vYS1POo4IWSoR1Bj+ZIxVMXVVFimC9YgOeNHEe2iHrngiK5PIe/k8R62bReI
	uDvWapAoTE169Bt37LzBqzvAHkLALJZedKEGHPURyW+cGANuBlvrGP7VNN4eTVMdrHhuf6mbZrJ
	Rw528MIUK8eh1aBvObpKB2eAx7PnDkhGK/50lnmdJPIM5d93B9KGb9VloYAE8DwcdVNDP2TL0yu
	TPDzIQUs6/A9MYlRXXXhiXxwApSNcudPQv7gP3ii3mlnywWSVNbtg+Ds0WUnrz1ehYu6T5AMuL3
	6xR0ezKqKN7yn+vmBh7+vPR5y7dL2XOb8FqYkG5UnGE0d1mLkSJRwpLs3E0kGrPxYe66Pp8dWU/
	wQ6E3xCT8DvXcvb79vZvI6hy+io3N1BQb+lfsC83VLPQd3MLqqv3TpkyBorCnGHxn1b9QS4Zorx
	r+95QCnMoIHf/UPnv0mX+DoEQvxbz+NSb7hIRzXjS6mOCu+RWy/U407/GTeGZGR6P2D7awhk8rd
	Zg5Fu96OmHZQMInpBlGLVbVX/VH3uA19+30J9lt2hx235aYXQPAx/IQh7ZKNVi1Tzth3h+0UMMv
	Ha9lwXIYHCsxcTncxpqUGO5VmwTR/BnqHSUuJRfcTRBUPWJGlF7D4NNQBztFhCSgH7flm5UQR7h
	WH31Qa9zAreoaFp1/E27sV//LKy9xd7rRqRn679FYNrTmsgxedTa+vQy1hHKoVNPhk4bhbWRQdi
	SBVeOr7SV7CLrieGe57ls+A6NuYRDIo98KwSaxErT/27yWV0yLY+7tZXUiG6B8jQ==
X-Received: by 2002:a05:600c:c172:b0:4a3:59c9:a747 with SMTP id 5b1f17b1804b1-4b6df5e88admr49637345e9.17.1793985285709;
        Fri, 06 Nov 2026 09:14:45 -0800 (PST)
Received: from localhost.localdomain ([90.95.39.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46489sm148071985e9.3.2026.11.06.09.14.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 09:14:45 -0800 (PST)
From: Florin Badita-Nistor <baditaflorin@gmail.com>
To: netdev@vger.kernel.org
Cc: edumazet@kernel.org,
	ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 1/2] tcp: avoid false bind exhaustion with odd-sized port ranges
Date: Fri,  6 Nov 2026 19:14:41 +0200
Message-ID: <20261106171442.31811-2-baditaflorin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261106171442.31811-1-baditaflorin@gmail.com>
References: <20261106171442.31811-1-baditaflorin@gmail.com>
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

inet_csk_find_open_port() rounds the range length down to an even
number but keeps the original exclusive upper bound for wrapping.
For an odd-sized range, the two scans can therefore miss a valid port
and return EADDRINUSE while an eligible port remains free.

For example, restrict a TCP socket to IP_LOCAL_PORT_RANGE [40000, 40002]
and hold explicit binds on 40000 and 40001. bind(..., 0) always fails,
although an explicit bind to 40002 succeeds. Both IPv4 and IPv6 TCP and
MPTCP are affected. A namespace-wide odd-sized ip_local_port_range can
also trigger the failure without a per-socket range setting.

Keep the full length for the scan bound and wrapping. The two scans
then cover every candidate in an odd-sized range, with at most one
repeated candidate when exhausted. Even-sized candidate sequences
remain unchanged.

For odd-sized ranges, subtracting an odd remaining value when wrapping
flips parity. The first scan can therefore also select offsets of the
parity preferred by __inet_hash_connect(). Namespace-wide ranges with
same-parity endpoints already trigger a sysctl warning, while connect()
uses step 1 for a per-socket IP_LOCAL_PORT_RANGE.

This only fixes bind() allocation. The rounding in __inet_hash_connect()
for namespace-wide ranges is unchanged, so connect() can still miss a
port in an odd-sized namespace range.

The issue was triggered while developing port-range selftests with
Codex assistance, then confirmed using userspace reproducers on
unmodified kernels. No kernel instrumentation or fault injection was
needed. Booted x86-64 KVM kernels were tested against the regression
selftest, the full ip_local_port_range suite, and a Go net.Listen
reproducer. The Go reproducer fails 100/100 times per IP version before
the fix and 0/100 afterwards with a three-port namespace range and two
listeners occupying its first two ports.

Fixes: ea8add2b1903 ("tcp/dccp: better use of ephemeral ports in bind()")
Signed-off-by: Florin Badita-Nistor <baditaflorin@gmail.com>
---
 net/ipv4/inet_connection_sock.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
index e56beec43..755fcea35 100644
--- a/net/ipv4/inet_connection_sock.c
+++ b/net/ipv4/inet_connection_sock.c
@@ -343,8 +343,6 @@ inet_csk_find_open_port(const struct sock *sk, struct inet_bind_bucket **tb_ret,
 			low = half;
 	}
 	remaining = high - low;
-	if (likely(remaining > 1))
-		remaining &= ~1U;
 
 	offset = get_random_u32_below(remaining);
 	/* __inet_hash_connect() favors ports having @low parity
-- 
2.51.0

