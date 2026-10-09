Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F1F33A9CB
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 01:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791510602; cv=none; b=bBIT1bxcN44ZEk79uaB7HQRJVGvs0mCFKCcd1KjVykQj5RSDcy5DSBtJVY12E/ON2nd8TsLuqzqikLHpNJoDJgG++ruPxcjzAjmV9bVmn/VGqEVfnoDioisTMGC3+dhymwbDUh3i2uLheyb+ZhSfSSGS8MB+fmWCFNfR0f9CgwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791510602; c=relaxed/simple;
	bh=X0vtE7OZH4JLFTpicfwaCIuiPS6LueobfsdoRdEygVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B/YpGzJ7zj534iui4xG9zhxsxIrjDk2YU+bGcY3zh1SsM+siiUkl3J2VP15GwN2pvxh+oCy0RXDT0C8DC2WbFJnBVXiHxPweF2/pUAmhmqUEvmmQKsHPNmGgWERTf39ObjX+dag7j9eUiAcrc/fGFSVA5X/C40h+FLIGJ/T+Mg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kqa4H4dX; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kqa4H4dX"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3515f9a5d25so1917266eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 18:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791510600; x=1792115400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LhBtwauxvVTRUojS6sPANeKDuX63NmNWC78ZgjKXm9U=;
        b=Kqa4H4dXfgfgIK8Dxd9pUeb8nxhVaI7cNu5nzddv6A9wrkVDLHN+P3ZW4kJhMXODqt
         Y06eJPfnsqnUaNQ2GG/sEUmegu8pqlhqK627fhgkx5ec4XjWt/TmzXq8wI9F6QWV5I4I
         HhxYyEb9FQ3b8I0O2rDapGzVfNV738nVjQ9QU1mzjNyT1ht4qw70v9eKSXctUQiD73BI
         JDONm2GAxz5VH5W7wU6pkPK1lGjdtbtxCDixobojUa9OBySJ9KEPgrAxE0Uh9mqxOeIM
         oRQfnG801hdDSRt7r+PL3QbpJhI0QLmKiUU2rPeO7nER0BrLwUA/DjZjaFMjL/0ZBinK
         +d1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791510600; x=1792115400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LhBtwauxvVTRUojS6sPANeKDuX63NmNWC78ZgjKXm9U=;
        b=FcJq7VPRpfmH5DW3jVt43lbEhpM42pQUOZdgl07xKSldoMeKf/swIoWodgMxmrt8l1
         eB7l4SoM1eZtGUIMi6hx3A2TvO0crsqYz1CaJvPcIO8X2PaOSXjBM/Wo+o9L0DQp/8/Z
         dylTrVvyHw9Wu2B2bj+g0UUBWCzaSfxffQggf5WJrJcANxuRmKHeNcH83HfM9CdyjZpn
         DRFAupv1VgMm7SJyuEEx6K7zQflC+uS4ksZAm5DAHQbH/levHVFtYNQXnMsydPM7RyJd
         49ChMwXfhyoWNvgZi6Q6LiwBMR7337h+cjQ9Ikj+e2+qnD2FPEJni3/Q0tsJqo9efbBw
         V8eQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9PQSjEEnNmX97qDQ1iuL8bL9ZjdRgWPRc6IknUo3nqchleNvQLm9fbOR1EncR0P3sA9Ng1h8iOd3mlTTo2Tg=@vger.kernel.org
X-Gm-Message-State: AFuF++mHUojz7xohvWNQOeMkRWqCJ6chwe1BwBbYG9qH8X6e2VjEYBEv
	qqZkbQAtAiW0jhlOo4dplTWVlA9cXB9TawP1eT8nZfREBoeDd809l7Xc
X-Gm-Gg: AYBFou2uB8ffw+MlCUtQXvzttjVSVofbfVJEzU+WOvP+NDTSoyuiVSajpgB93MzL6fm
	29P7FkPnrJptzuE3IRqlwn54J09PIIumT2W3v1wRhivv4C43k6wOq/cKJCFiOrJFdIl0NH61GRW
	Pv4iF+UCPeBQ0SNlVYDT7cHaMHdba72chWSLglN1EI9gjFvEPYYVkbo23PkWg6stHu5OhI/Utiq
	wd1FuoFESHXFiFYOVUniQRbVFBKgnQfeMDya+EJ8yapUYcSWxjCNVzEgVVnqUJiK8AL6GYO0IMN
	DJhhWmKDRtBGdhsKDkxvM+Pzs6rzauMRJPoLZrEgRnMNs/MLfExtIvNvPpQxSBNXOb+HNWKdeq3
	EH1XMx602GSvcsk8q/kmFKnIuyYJZqJ2sucr1v+HJBRfcNO1mp/eaDFcMoQAYFlsha9K1GE5nMg
	/qXE3jyOGNhOU7gkrbeBfDb1DItB/gpQzgBpawYE+Q3/Kd9GF4TYI8Tj1qw2D7x84Dsw==
X-Received: by 2002:a05:7300:fd03:b0:351:4866:255c with SMTP id 5a478bee46e88-3537e058277mr1162820eec.32.1791510600015;
        Thu, 08 Oct 2026 18:50:00 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1d6e6sm1984845eec.24.2026.10.08.18.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 18:49:59 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 09 Oct 2026 09:49:51 +0800
Subject: [PATCH bpf-next 1/2] selftests/bpf: Return the lock error from
 buddy_init() of libarena
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-selftests-bpf-libarena-nr-cpus-v1-1-e726ccc66fc6@gmail.com>
References: <20261009-selftests-bpf-libarena-nr-cpus-v1-0-e726ccc66fc6@gmail.com>
In-Reply-To: <20261009-selftests-bpf-libarena-nr-cpus-v1-0-e726ccc66fc6@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

buddy_init() takes the buddy lock, an arena spin lock, to put its first
chunk on the list, and returns -EINVAL when it can't.

arena_spin_lock() fails with -EOPNOTSUPP on kernels built with more
than 1024 possible CPUs, where it has no queue node for every CPU, and
with -ETIMEDOUT or -EBUSY otherwise. Returning -EINVAL for all of them
hides which one happened from the caller.

Return the error of the lock.

Fixes: b1487dc1b181 ("selftests/bpf: Add selftests for libarena buddy allocator")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/bpf/libarena/src/buddy.bpf.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/libarena/src/buddy.bpf.c b/tools/testing/selftests/bpf/libarena/src/buddy.bpf.c
index 2490ab1396de0..7bb99a7cb63ed 100644
--- a/tools/testing/selftests/bpf/libarena/src/buddy.bpf.c
+++ b/tools/testing/selftests/bpf/libarena/src/buddy.bpf.c
@@ -576,9 +576,10 @@ __weak int buddy_init(struct buddy __arena *buddy)
 
 	chunk = buddy_chunk_get(buddy);
 
-	if (buddy_lock(buddy, flags)) {
+	ret = buddy_lock(buddy, flags);
+	if (ret) {
 		bpf_arena_free_pages(&arena, chunk, BUDDY_CHUNK_PAGES);
-		return -EINVAL;
+		return ret;
 	}
 
 	/* Chunk is already properly unpoisoned if allocated. */

-- 
2.43.0

