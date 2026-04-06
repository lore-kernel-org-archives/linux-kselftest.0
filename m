Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C763A389447
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 16:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775491931; cv=none; b=i1v9LdnjqvD0RADYe3RLe51KTiNv5WB1h+55NWAQ6svoz9EYe+uj7Z/jt5jt+yf9MfbyJQIEaBXN2mfVal0W1ICTkDW668k9ZVwwejTmL7R2x5JdJHl4EJ7eheR31CNXCqewdAWr+pYEQ8vE1CuWhN56liNfG9CWAJT1C/Wdx6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775491931; c=relaxed/simple;
	bh=/+Gi/l9wdVUQGM5LCHXWoaW6E/VYQSmnTSa7McD1NPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NX738m3vvmvBBpsr50ZBtksWrSXczwkUh5kCpRN0KKAKJOyOO0Fzb9KFNCYTh/E44eD6/V9ponRqS6tDG+Wuk7wdV3eG3B2blPwsCWPnEauyUQMI6LqawaaW+XXzJueewaoUpsaKt4n69Oz+kKsCQ6a0zPSmll1i1PrcaJrRYnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gSDcfB+f; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gSDcfB+f"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488ba840146so1877905e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 09:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775491928; x=1776096728; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sTBYFNqkxGFNopGVGZu2b+8zsPm9XVKJaoqPGL19kgM=;
        b=gSDcfB+fs1ibC3LJY76gBVv8YOYKuojWwXoWtP9JCUEO70L/X57iv1S6B+SHmXEvH7
         e90RQRJTKcZ8Udbhzl5jzz+GDJcIRwjLjDhdnQIxLRVGp1WjLVHpyWqDNqlmI0SUnbmM
         7XsVdUrCxF1RnPglpX/6KnzgaJ7UKthzHL3OiFSaOL2DerDWDbagIlk41JOSmyIQgwAE
         mjVEYV26YU22vyTGhxjXk/J2JXy/9MVClJzLnSe1cKYEfON4tcZLWuayDA1S5MZz1v1O
         /ZFHUrQxtrWDRKRy3OkAV62fhoUGkAVxU3aTQuyuHGtCEx6UPZ6a+a/Oda+ha+0WDvb2
         dcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775491928; x=1776096728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sTBYFNqkxGFNopGVGZu2b+8zsPm9XVKJaoqPGL19kgM=;
        b=d/h4MiyuzYcrh5h3sZcOfGS9qPW61J+urwRueEbiJvPrA1ILtGpRTFtwvcAL8KRJdR
         LWFkxFNyLKZjMT0YkA6LNcA+z5FPXJe4PnyHDm5v+SD9L/mos90T/Gdnye10GKB4qZsy
         gloy/K7LLqXIZjZY9y91EeU5piy4VYw1SvPJvuSQNMTun99PFBQEpFYoaCf63ytoJh/L
         5nBOle8UqfNa2HlOVXrsJJfc1Ee79KlE01nxqmmLTRUMmD1iZamZUybPTr17yGnLms7Y
         LX1tPJNKb5+yPRy6O8O1NJHJICgWFtPAhfJrb0uzViJgqaUkcc/3ZOX6u8xOqwUwRTrQ
         8NaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4BYVxl0knV54j3elKrBqNPHZV9kbLFvOgvF0CvI6ix6quGBhSDMcLJs3FmxcavqPb28lY1tvF5HuOa9c+a3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwdeybfGw3LEmyjyrSUrQ7OuCBBpAxkt2dKfYcFUiR5sJss3Ly
	Qdh9sdI+pi7zQ0uK7G6X6u5hnKpMqcV0VlsVzOUHE2ICShjyvBvxNVpS98SZ8RsQDlo=
X-Gm-Gg: AeBDieuTF0JRrrWwbaOw1DpFBCoHXHb3RGQ16+e/HtPtlowLHiZ3lOgYAhcU3T2dBCq
	EnGdji2kD0olA4RGwtYGZxiy46g3kclrTk02R8u22TdtX5z797pnYoIg5mAD43xwTK3O/IzPrIc
	8osy699ZR0lY3njh1ZUUhgxdrDV2BSCwFBnk2STamShMU6SqOUq6hxFDmbI8YCELF8TfuIWQDyK
	+E41kzbIwu7AidRmW+BrmLuusYTjiJ1y2jBQhQ9XJX4U4iKXC4DW/YCqR5+rSSpBeO77pNYEElo
	7x6yYSMbPZFAoNxv1h7y67G/XAChRgMbfuXq7dIwGWfAyQYEZyIRH9DDDXesGG7vMelVgekYDbg
	CjMW822gP7onbX1xJ6DZf3tOVUwuQedzuM3gHGG7lLTFMzs9Y4cLh70yUWLUK59GZsHWKokmY4G
	kqMCJSJaVMQYLq
X-Received: by 2002:a05:600c:3f08:b0:485:3ff1:d5ed with SMTP id 5b1f17b1804b1-488996d22f4mr213373435e9.1.1775491928345;
        Mon, 06 Apr 2026 09:12:08 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-605b214b45fsm11120032137.5.2026.04.06.09.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 09:12:07 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Apr 2026 13:11:33 -0300
Subject: [PATCH v3 11/11] selftests/bpf: Tolerate missing files during
 install
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-selftests-bpf_misconfig-v3-11-587a1114263c@suse.com>
References: <20260406-selftests-bpf_misconfig-v3-0-587a1114263c@suse.com>
In-Reply-To: <20260406-selftests-bpf_misconfig-v3-0-587a1114263c@suse.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openssh-sha256; t=1775491886; l=1301;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=/+Gi/l9wdVUQGM5LCHXWoaW6E/VYQSmnTSa7McD1NPI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKu/i+AikVkWXo/wn7tgFrAS1mTmlvuJI5hDj9PkQmbAfqICG13gCJninE/aPi5oGYthBnNByBU
 gNGnMc+RAJgM=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

With partial builds, some TEST_GEN_FILES entries can be absent at install
time. rsync treats missing source arguments as fatal and aborts kselftest
installation.

Override INSTALL_SINGLE_RULE in selftests/bpf to use --ignore-missing-args,
while keeping the existing bpf-specific INSTALL_RULE extension logic.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 1e1da26153a2..209bde90c3dd 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -949,6 +949,13 @@ EXTRA_CLEAN := $(SCRATCH_DIR) $(HOST_SCRATCH_DIR)			\
 # Delete partially updated (corrupted) files on error
 .DELETE_ON_ERROR:
 
+# Some generated files might be absent when only a subset of BPF objects
+# could be built. Tell rsync to ignore missing source arguments.
+override define INSTALL_SINGLE_RULE
+	$(if $(INSTALL_LIST),@mkdir -p $(INSTALL_PATH))
+	$(if $(INSTALL_LIST),rsync -a --copy-unsafe-links --ignore-missing-args $(INSTALL_LIST) $(INSTALL_PATH)/)
+endef
+
 DEFAULT_INSTALL_RULE := $(INSTALL_RULE)
 override define INSTALL_RULE
 	$(DEFAULT_INSTALL_RULE)

-- 
2.53.0

