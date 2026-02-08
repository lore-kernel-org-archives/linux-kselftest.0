Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA17284B3B
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Feb 2026 02:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770518964; cv=none; b=dFkdNmgUAK2373JnIwL1pp+jd+SOE6XCT06H9eU66RwkHKYZ2xFVMESYF8skPInZuTOpT7AYSqN668qMWphcSdPpNOlMI2If3JQLM6sm4FSuoCBRA1Z8tWA+Grylhie7XOzS5E5qTjyxCEecPiELJgJAKAtvVisGm96+4rcrTmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770518964; c=relaxed/simple;
	bh=/foDnsw9txtdA8j295ZjAzzfzsK+5/oJh72tn7OOjPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HpCrW5lxp46GPrO9YImbUN9VFEeVlEXXCSsvChvg6ksYyWGiBytXNVv2rcMY1RNiAtKqG4TvhD8qyb1S9kF/EwDfby08pjd/dHWChnq+byut71vExJSsrcMBO32iWMgH1r/KRM+OvF004I9piikwQlrq8t/AZRAx40yDj1LFE5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HW8alwmX; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HW8alwmX"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29f30233d8aso13635815ad.0
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Feb 2026 18:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770518963; x=1771123763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQ8kSHh93BFAAIINgkYl0/hpSL7dAAj2kQue7tV1qds=;
        b=HW8alwmXSd4s7gwBCEf4wYuu0QL2ntgiDE0FfIDFh7ZhbOECo9FH7fsVR2u8a+cu+b
         wtS55Yg57debJ5S5zDqiSO1hFeMuTSaHnl19pXIcc497Isruq9oIebZADEeEercVqplj
         t0FYKu7QbnROKJK6boLa5IuBxgk4G9ZKqyim7DaIVEVIx8Q/wim+9jWj4D1NljRiOhPs
         QjfZ0dP/ycKvysllyoIUA4MA464fL9a1YqLOqOtFBqJ/VIEq9W0Yd2HQrGHWR7UxbC9T
         uRHX9BQ4PBO0K1EkpsM+6ayy2irNmOpBKIG39nL06lgwxS27fTjhjDH9PRbcB6U1BkkO
         Nz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770518963; x=1771123763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OQ8kSHh93BFAAIINgkYl0/hpSL7dAAj2kQue7tV1qds=;
        b=PJgohbghhSJSdLaKFlVc2pvP9MMPLiupVl9JBskvKf0/eb3GPvaXIuT2a4d4n/+4BH
         XU8AGL0vu1xUqjhws7jCAxNnVVXNHhehfiey3mjXCSINZEwngYNrokeI84tThOYBmkJE
         G5jHUWLQeRRiXHhLSeAorhilx1qvGth8+r1UGUhvZW6c1dS6om8ZVCpjs48cwJZtKhTo
         JngBEpdYMrd2ZJeUGsy6U3WXBbj2CP7ip7LIuHddFmzO/bkYcfOYtkpnVB4DKxKnQJbG
         QhtwEmLtv838DEZKId3yblYxRXYyzjxYpjfs5pbzf+303Xd8Lz8Fb3rpsnfLgKy7Wzpt
         1cFg==
X-Forwarded-Encrypted: i=1; AJvYcCUwwb9JD59xWWrIXJjUcov2/JuAUR0wgDLQ+F/E+MZfJ34wQ2TkdALGZ3gIVXoPTopWwiukK/YA8q1WJUSgfG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLnFblA6PIPrNYD+ESTr9eIh5aqq8mbdZ5FzJAizpRTtt1wP0F
	qW9nGB39/eMf0HHQg05kIn1j6cBsBHikAhOOnXiF5DrpZGLdFtNnvtT3
X-Gm-Gg: AZuq6aJ7zioAhQK6iD5yZgTwYkZQ12rz7JEIhpdR8E8TqGo83ggrDXUUfqT+AoFhVR0
	tDUjihUev8uaVTcgh2VYNQnl28P+/i+wIHmL9pFZOxil99zhHMWSL6TFLDaGzcpdyYdUW0nEEHP
	knOBlpfXFW9f3/H2yKb16zQ07ntUjGhKIXtzG6ru23IkhoNnZUK87hAFt3wmpm1/tD2j783A/VN
	BMxG2RmtqlZNZi07YoKUQLnGo0qNmBlMtrJtoYdqZ71QZ85abqZmzgmnRGwumJZagAT3jGp8ERU
	zyY3JrLdIwn1I3PKBbMCB9YTH+SM5wnhyPW3nWMsVH2ttm4qPkASOJXL1ZLWdROLKHbeUDHFIEC
	cjSN9Ho0Kxzjqf3Gf3FaS1ifQuQjIL/9Wr0u92hJwolJeD50AnudfpF9CoO+Sa/cQevJ5xdUL9L
	f3Wi0SVpRCSIysaBpWK/2cF/jeoG8ltvt1mzlewMI8
X-Received: by 2002:a17:903:2b0c:b0:2a0:c1e4:e25 with SMTP id d9443c01a7336-2a95194449fmr73990145ad.54.1770518963312;
        Sat, 07 Feb 2026 18:49:23 -0800 (PST)
Received: from localhost.localdomain ([113.218.252.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9521b9f5esm67194715ad.51.2026.02.07.18.49.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Feb 2026 18:49:23 -0800 (PST)
From: Chengkaitao <pilgrimtao@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	shuah@kernel.org,
	yangfeng@kylinos.cn,
	alexei.starovoitov@gmail.com
Cc: linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: [PATCH v6 2/5] bpf/verifier: allow using bpf_kptr_xchg even if the NON_OWN_REF flag is set
Date: Sun,  8 Feb 2026 10:48:43 +0800
Message-ID: <20260208024846.18653-3-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260208024846.18653-1-pilgrimtao@gmail.com>
References: <20260208024846.18653-1-pilgrimtao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kaitao Cheng <chengkaitao@kylinos.cn>

When traversing an rbtree using bpf_rbtree_left/right, if bpf_kptr_xchg
is used to access the __kptr pointer contained in a node, it currently
requires first removing the node with bpf_rbtree_remove and clearing the
NON_OWN_REF flag, then re-adding the node to the original rbtree with
bpf_rbtree_add after usage. This process significantly degrades rbtree
traversal performance. The patch enables accessing __kptr pointers with
the NON_OWN_REF flag set while holding the lock, eliminating the need
for this remove-read-add sequence.

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
Signed-off-by: Feng Yang <yangfeng@kylinos.cn>
---
 kernel/bpf/verifier.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 05a6a6606b6c..bb3ff4bbb3a2 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -9260,7 +9260,8 @@ static const struct bpf_reg_types timer_types = { .types = { PTR_TO_MAP_VALUE }
 static const struct bpf_reg_types kptr_xchg_dest_types = {
 	.types = {
 		PTR_TO_MAP_VALUE,
-		PTR_TO_BTF_ID | MEM_ALLOC
+		PTR_TO_BTF_ID | MEM_ALLOC,
+		PTR_TO_BTF_ID | MEM_ALLOC | NON_OWN_REF
 	}
 };
 static const struct bpf_reg_types dynptr_types = {
@@ -9420,6 +9421,7 @@ static int check_reg_type(struct bpf_verifier_env *env, u32 regno,
 	}
 	case PTR_TO_BTF_ID | MEM_ALLOC:
 	case PTR_TO_BTF_ID | MEM_PERCPU | MEM_ALLOC:
+	case PTR_TO_BTF_ID | MEM_ALLOC | NON_OWN_REF:
 		if (meta->func_id != BPF_FUNC_spin_lock && meta->func_id != BPF_FUNC_spin_unlock &&
 		    meta->func_id != BPF_FUNC_kptr_xchg) {
 			verifier_bug(env, "unimplemented handling of MEM_ALLOC");
-- 
2.50.1 (Apple Git-155)

