Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F13284884
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Feb 2026 04:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771043815; cv=none; b=lSbxH3DWsJH7T3UaxlqCbW1XciN+0TZz3UjUoFq8p9n1RlB7c7Eyi7ajMCqoGdrOSc3mcu7kF9eS1B/5mNWmsRk/PROHr36zGWDdP95CT62agZ2vl7e0i2xfq2ogINlBhWUOQH1BhARJsvQQf7kSkTduVwAl2h4r+q2ShHhSojU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771043815; c=relaxed/simple;
	bh=aJnFa1Hsewgi8H7YxpRPpFYJuripGJ/a5ZfAUhM+lFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QOOivpbqNFfeP7V3nj0p76eUX1V5kUzUfMuU0t9uE6dWk9XOFdzwGzBcF/qG1jOQlLNRdPxENFIoi7lynEH1OoH8FJjsBZunRTeg2E/TlSILtvci9IeDuF+LztdZU22OllV/7DeEutKghcNel4ez8i7Cx3jfIirju2nKayA0pXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=giMlgTPQ; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="giMlgTPQ"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3562212b427so683593a91.1
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Feb 2026 20:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771043814; x=1771648614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6tCm1dSlSN76Pq+BKvxzLO0K4J3qy/k2J9RReSkTgE=;
        b=giMlgTPQ6tF5SG6kv5BESCjypDlC8y+vMkAPyZdTOwkiR0dMB3Za16DVqlHARdjowR
         Ipa64ElCJR3ukNnzJND4K/ClnGXtH3HrG9kOCPzkWgxwfvkj8ns7zixUZI0vunM1NMNA
         VoGech0SplzdhIvEeJXbMYI/I5xWTinRFfN+U+N41vwYnq9I1WR/BH/jdjInmxAbTim3
         94biW4aXg2LLS6eS8fdyeDK/C05O3/fD++lhv0Ukpe99HWZwampUGuL7XAzeY37BQpcG
         IbZoGBdj02OKSP+Ffdgp5FBaN3q34UOhA+HIeu9DdRL4Ngl8Sp930xJcdU+BF/jZrqHB
         DYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771043814; x=1771648614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L6tCm1dSlSN76Pq+BKvxzLO0K4J3qy/k2J9RReSkTgE=;
        b=bA1nlc/9HUAIHJ7v/pAEP7vRyJ3CRi1b9OHqxkDSy1r+f9PwdhIPaE2MRbSdSx47aA
         hiLpFL1XU7SFtOLRPMvMJi5mXzpryfvdpIIhfdkK6D0IDfspWd3DC5LiFWQPOV6DUB96
         Jw3TJUCFIG1ZyaIl+tOhzoYhKZyQCFhlx8fJvRyXuKmbhyI8Wg39lKY/UtcgqL2+FABq
         KjDXnv8PD4UDd38qhLfzrSwAklXnZ7UK55xae58Thom7PAEhFDCu7XzYdR594aJo3G9u
         xSQT1qxWUloqUWmBEn8bNm908eObqpno0wjiwDwJnmwo5wV7hFnbB0I1gT5HY0K6bIH1
         hA4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3uWN+G7vf14LOn9E6Zu6yzDkYdHIays1wB8lk8g/2h/t1S2HWYv7qF7dXxacGoyX8r+XnRrF0My8bPakXfjY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzywo4WSRPP/h0Pezwz+PoIBP10h2UQHu2RZN765NQiO+yxkkHt
	WkhknwuFReI/vE1iNCiiitEv0pnuSKEnirdOFgtHIhjlwaqFdS5cAzq6
X-Gm-Gg: AZuq6aKvshGvVOzoIRP956lhYbr6JtFHmDcAIoh+/PdYJ0/AmtbN4thHEbXufrmZ0wc
	Hg4gUFdKuxYFZcKBNzf1pqaFDOuY6zxNk3PpyKwB+j2Ac7rqYlZ7dNV9KqynzPj+D38A7YEPIjf
	wzMkzLTx2VC1P6tVASKBwuk68DYu1IevD64kRwV39B3gCIxgpD9+XWKzI0k/RSO7kh3XIbNRKLO
	Q/cGN9TBzJxzpahTERi7PkaqzfuqVMQiDdTusLiz5Gjg6DwyP59d3WewTRAH9RwYgvMRw4dmWdN
	7Ui3uXLtGg83jKUFK0Yw2lJhh5Sr/XTPysbdIxwkH1rYJ746h7KPqulzVq3FUDyQ0JRUq26rCvW
	WZRtUUme9uXqAZ242w4XB5nJamJ/S2sEc+qh1a1+5WSa4ViOnH4XIsaf5fYfSmaiFiYEjc7L0X5
	ue9Z1hCKvYjLWiGU+xZ4rhREUxrS6rj0Vq+AfLqxgnDTKxtSelXhhg
X-Received: by 2002:a17:90b:35c6:b0:356:23be:7ecb with SMTP id 98e67ed59e1d1-356aabddce6mr4123718a91.12.1771043813796;
        Fri, 13 Feb 2026 20:36:53 -0800 (PST)
Received: from localhost.localdomain ([113.218.252.61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662e53936sm13519815a91.1.2026.02.13.20.36.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 13 Feb 2026 20:36:53 -0800 (PST)
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
Subject: [PATCH v7 2/5] bpf: allow using bpf_kptr_xchg even if the NON_OWN_REF flag is set
Date: Sat, 14 Feb 2026 12:36:27 +0800
Message-ID: <20260214043630.38644-3-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260214043630.38644-1-pilgrimtao@gmail.com>
References: <20260214043630.38644-1-pilgrimtao@gmail.com>
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
index 2927a4622ff8..3536a91ff8c7 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -9329,7 +9329,8 @@ static const struct bpf_reg_types timer_types = { .types = { PTR_TO_MAP_VALUE }
 static const struct bpf_reg_types kptr_xchg_dest_types = {
 	.types = {
 		PTR_TO_MAP_VALUE,
-		PTR_TO_BTF_ID | MEM_ALLOC
+		PTR_TO_BTF_ID | MEM_ALLOC,
+		PTR_TO_BTF_ID | MEM_ALLOC | NON_OWN_REF,
 	}
 };
 static const struct bpf_reg_types dynptr_types = {
@@ -9489,6 +9490,7 @@ static int check_reg_type(struct bpf_verifier_env *env, u32 regno,
 	}
 	case PTR_TO_BTF_ID | MEM_ALLOC:
 	case PTR_TO_BTF_ID | MEM_PERCPU | MEM_ALLOC:
+	case PTR_TO_BTF_ID | MEM_ALLOC | NON_OWN_REF:
 		if (meta->func_id != BPF_FUNC_spin_lock && meta->func_id != BPF_FUNC_spin_unlock &&
 		    meta->func_id != BPF_FUNC_kptr_xchg) {
 			verifier_bug(env, "unimplemented handling of MEM_ALLOC");
-- 
2.50.1 (Apple Git-155)

