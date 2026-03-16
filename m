Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA691378D8D
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 11:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773660580; cv=none; b=p9Kk/L4mwbng4+KWTFzxwj4KkTQ9x28P68PJCgx3qDoxumXaN1NpqRnXBOVMCzLv5PJUBS4xA0O3nzbsVYOCcd/BLroGiDKdrjeM9q8YM8+1CDuJE4NTb8P2i4jPXzzCqJgSHdad6ujdnv6IuzwQJQ0BwT8BIe+vfJZQeVA+H4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773660580; c=relaxed/simple;
	bh=La0oxEXQHp19d2nfILBob+w4HOT1QdSwN6buq4oJMss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PL1Ajew80mEeXOCtbO+SKJSq4fgSl9oULjPlH5thzLTmbGiPath3FZFRKJEOw16qnXbMuL0ZInANXhA5ToJWAfJ8P2Wj4UVJBzl2GexuRtMKwve+Ji+mOd//rUt/8gkUB1tLckYO2R0rOc1Lu6eiS7NKmwL2K3k1htcWG3N7KeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLtOWS+g; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLtOWS+g"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c7393c6832bso1487260a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 04:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773660578; x=1774265378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbAiNsDyIMAUQsD2xc40hS2bONCwm72xxTw7O95hbw8=;
        b=GLtOWS+gxB0+/9R5HXYsnUJsT5nYFt+dfG5i1Ixsq/cSjtFZRhu0lZ7mDosAcpcwEc
         5231JfNKHzMA9VHusbBs8EwmPkvZjAQfXOk2UEwZZ99qCxdpOasNw+bGKk+wg72W2msq
         Yjh09Z5M+rik487o1bbqbymlhAa/74WoLPFcE2Hx0NmBkQiaLLUacdG67U1uX58L3vIh
         HYDD0q+TSqOL+N28koFeB4ynQDVKZfl4gLQKYvFGJWSK1xn/KaxEESSVt7MhRt4FHWTI
         x5O+JV03Iv4AzDiiXTzk/B4LTNuh5tVlbr+PS946hkzWyINX6Btu9RGMX6AWTi2e+6uU
         +CAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773660578; x=1774265378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CbAiNsDyIMAUQsD2xc40hS2bONCwm72xxTw7O95hbw8=;
        b=H2VlRW/ZvkeOl+TmMTd5km5ynVs8/g/mykd5XFIdA1Qxn9tZ7Gbynk0u0X51EOL0cY
         BwQ5pnbYNs3RQqfLD8cZz8QGJJ5W6Zigkv3IdBxFVEMamAb8q3+cT0hih7VZMcfVOBJA
         4ybvW0MC8Xy7PbJXl9cHIDtLJB1Xig7VQ6X/BDITiCL71ccvCQP2db2xfU0/sPXJ/cK7
         ivjK3pirGz1539IsfAX1yO6/e5kkkhUOTfDwMXrWl1+venmLVEdrHQ39bRLNYSIuQ3fZ
         w+IygrQ8OD9fd+9zoKA7tTZxTcA/BYvZ9lX4AMzB1uQb4+U6VSSmkdvMjrAr1ZeSqzc5
         /tVg==
X-Forwarded-Encrypted: i=1; AJvYcCV1nANrT81VH15zi3hmU5io35KHorWckTH7BiCzgAhQxTTLvgj1TyO0SXhA8+FBxG85tb6tB13qgTIFoe9i1BA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTRZIKUjle1jKd0OPfhwPe+N19o7QLHXKdAdYdzZjC7JfKty0C
	+P0GjAMb3uix4mnBpZ6M1KRX7z03/7D2Cnp16LNXRshs0XcX4Vk4ZsPR
X-Gm-Gg: ATEYQzywZQSvr6sOcAbJrl3/cnAH0af7otQm2cFemuYyuXKCeThFI+mEMJhwYn0b6kB
	T8aTdND8vWIBxDT1FmZZ+b18O9yp148f0gBcNd+KvzGMA4dWMZL6JrbBFuNP+02UWnLoRZDINn3
	h8YI5zKySl23wwCJMDnYFGMNEQNojOa7rshayG+5/NP3vAlZrUF4iZ/b/THCjsxXRWFLZ7XqGwA
	G9L5c+jBYPNJkdWk+ddCTqlKEKLgqyXSbD2VOhXey+3aRYX/n+TFFJm3/8DqqEzYSqMew52GqPb
	B+PuK+fTdwbOT7IfU25TpztQz6cikcWVqMIoPnEGJStnFjwYoZtoM8DqAAR4iE1nsC8PcNiLLiu
	n01r/9C7AEQfAVJkhS1UWlDDlE6SUlp5AAwvVhI8WvaMw9jV2AgBXm8BunN+3LXK2cvTp4p0t5p
	QdZWHuxYlH41ZpTjHLDeqNf+nWQHc9fSgW8bZC5lj+aNmeGfoD4Xp2FtudZYfcherC5A==
X-Received: by 2002:a05:6a21:7a97:b0:398:78ca:c9d2 with SMTP id adf61e73a8af0-398eca24a5bmr11968023637.15.1773660578050;
        Mon, 16 Mar 2026 04:29:38 -0700 (PDT)
Received: from localhost.localdomain ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7401588ecesm4684940a12.32.2026.03.16.04.29.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Mar 2026 04:29:37 -0700 (PDT)
From: Chengkaitao <pilgrimtao@gmail.com>
To: martin.lau@linux.dev,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	shuah@kernel.org,
	chengkaitao@kylinos.cn,
	linux-kselftest@vger.kernel.org
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v8 6/8] bpf: allow bpf_list_front/back result as the prev argument of bpf_list_add_impl
Date: Mon, 16 Mar 2026 19:28:41 +0800
Message-ID: <20260316112843.78657-7-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260316112843.78657-1-pilgrimtao@gmail.com>
References: <20260316112843.78657-1-pilgrimtao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kaitao Cheng <chengkaitao@kylinos.cn>

KF_ARG_PTR_TO_LIST_NODE normally requires an owning reference
(PTR_TO_BTF_ID | MEM_ALLOC and ref_obj_id). For bpf_list_add_impl's
third argument (prev), allow a non-owning reference with ref_obj_id==0
so that the result of bpf_list_front() or bpf_list_back() can be passed
as the insertion point. When prev is such a non-owning ref, skip the
MEM_ALLOC/ref_obj_id checks and jump to the shared list-node processing.
Owning refs (e.g. from pop + refcount_acquire) still pass the existing
checks and reach the same label.

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 kernel/bpf/verifier.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 98ddb370feb5..0a6f2e6a5d28 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -13737,6 +13737,14 @@ static int check_kfunc_args(struct bpf_verifier_env *env, struct bpf_kfunc_call_
 				return ret;
 			break;
 		case KF_ARG_PTR_TO_LIST_NODE:
+			if (meta->func_id == special_kfunc_list[KF_bpf_list_add_impl]
+			    && i == 2 && type_is_non_owning_ref(reg->type)
+			    && !reg->ref_obj_id) {
+				/* Allow bpf_list_front/back return value as
+				 * list_add_impl's third arg (R3).
+				 */
+				goto check_ok;
+			}
 			if (reg->type != (PTR_TO_BTF_ID | MEM_ALLOC)) {
 				verbose(env, "arg#%d expected pointer to allocated object\n", i);
 				return -EINVAL;
@@ -13745,6 +13753,7 @@ static int check_kfunc_args(struct bpf_verifier_env *env, struct bpf_kfunc_call_
 				verbose(env, "allocated object must be referenced\n");
 				return -EINVAL;
 			}
+check_ok:
 			ret = process_kf_arg_ptr_to_list_node(env, reg, regno, meta);
 			if (ret < 0)
 				return ret;
-- 
2.50.1 (Apple Git-155)

