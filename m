Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648515;
	b=xJsTF0cuhoMGJfoBwsF//xgSwY54iOhYVx2eRgL0Z+R88khbsdT3WUTRS00I1CwleMiP
	 1B/FWx3fVxyoTgUIzf7ouj8O0yn4YKBUAJPevpeKZkrbYKUurThqyg0OpDhecTjRLYHE8
	 I2QhasvewkXzDu2FNVlK++QJW0ugiKZAzRzngufYQ3iefXNaSmbJLHmgZ6cmWgsuGW5j0
	 jOx/0LB8le6IyqhEzplpyTARt/hneeiGeSlTrtKh6OGLpfGbzQ3LLuiQVCDjSkWSvRKov
	 YZ1HQQR2qV1SMSPRuoNrg6tgky3QEqb6hp495wz2ZmNK/JgWTDzsRBBQJcFW9lXUhJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MlxGrO4qVY13JT+narJGH0GFq85Jy87gUAILKXGl+Ms=;
	b=SvOp1sLP867M/vc5Bo92fm2GHsp5meu3VA45zDTwebeWesNYoOQPReSdOm92zL6E9dS7
	 nP7KwrGM6YbwGtwh2LwsKfLZPMTgsSSlwQCIvA4vhxPXi8WUFwCsa1KYwHq9IZ28x3lsJ
	 tP784HFnL2xWRV+/pKS6jrfGqaZZcasx0wmaDzTM5K47MiXvP+iGi2odvT4b8WD6iGx/p
	 umLq9VT5FY9ljGdsvg/DlfgO1QS1YTBgj0AMonrsW7CeLq2MY4QnzYZo++CVoYxuo7PXR
	 zT40qnx2QBuvQpzyUi41Ydbyt00aFv20v+tjqDddb7uxevxjysaEWR/mi460pEDcOqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QcDzCNWM;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AAD606A337
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 19:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8AAD606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QcDzCNWM
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so30550785e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 11:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648513; x=1794253313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MlxGrO4qVY13JT+narJGH0GFq85Jy87gUAILKXGl+Ms=;
        b=QcDzCNWMmAKVwvWckR04y20Nz6TYmmXMX2PW1oRXh4Tpc+tUqtSLgJpckrGxox0rup
         CLJYVKN8T8hcDixLwoHS0jKNBKVVF0MTwbBtxuA5sIsqNM6RuJeRKelGVY5pYVwH+4Ei
         y9JA/06g/3TS7/Fk4Pw+XAYR4TivKripWnddFnln0FoaZ1QtSlhqRcTo7CupZDm0OAEs
         RfzAxsT+B+/kS8SBeAJqGuT0ZNeRFFu0Hnt3bhOcR1FeQTWdub1qco5DPLj7TcSyhuVt
         YIzvoBOAzBj44pOPTgceTzl3aP+F8LeRDVjJoUTaF7da2uTX2Oycb9rKGO6SSoageuW6
         cgRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648513; x=1794253313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MlxGrO4qVY13JT+narJGH0GFq85Jy87gUAILKXGl+Ms=;
        b=JPQRtBWcRuIoIK2ZogqvE0Q7p5LNzcblw16HaDxbw61dmeHFNZLutFKxOdqUMrV2Ps
         rY4tIH2LECvRU5GGN8y2o6C0jbCj0Ye5WnEfLBG5Xs2CJPMrwusrAboqQqptBgiPGa0P
         n3T40WQ4/4nvaihTcyMeeQireG9UwXwWufBNOKy2pO488eh6FqpqQS9Jdivo9TEY93Wu
         gUuJ0+N4XzRcD+Qkso8uLOvJwif+ovftAx7EbspYjSKGbaCq2IDj2r/Xu3v30QQePszj
         KRz1GTry2yj7w6SkCjJbao+P7g/C4UfA6S7Iv4MneC99R8eUGOEUXatM5jkKtTWWJAME
         G29A==
X-Forwarded-Encrypted: i=1; AKwUvByvPIABmph3Rnwz3IdRusdWuve21BHYq1f5rBJIyH/z3RUq7+H3iQhNAyv7rmTI/EngBZck/52onZVAP5mw+MI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK61KKwSY+g0oNrfTK6OiPNcTp9eSrK5anfmrIkcV8Opbw/Fajb
	sZgLHTBDlQ4c1ABo3rsaZ9JY4aVrmWlYfliOEa22KRRH2FCQAsScuCTl
X-Gm-Gg: AYBFou2bsfKzYU8DT3qCTd3r6UJ2fI8/b5ocSNmo9GGsRwjVVxyudFcrwoPCi29hoQj
	Ian9SDePQYkdm1gO7EedARySQI+iKrh709d9D1tIIniUUhLlU+obU5jhNWtuhh1YgooauyQi3un
	b3r6cxo60AK2mWewTaeGEvNVrjEs8xMUNHsUoBRGjVfEOF75X7UlHEWNTdUyUP1IBemxLUIhMni
	KIx3GpU0zLiRi/7z2PxTtPlcNEbraU7LnHqA0Q0rzkGMxcbmgivZyWiogFnOL885yXPhPkmv7qi
	gaPdkHqIm+/JjKmZ/uQptwO0x3zCbMJ5soIh+5+X3cLdKxr1SX1toTTisrf1r4eiNndqN+36GhS
	FD0hig4Uu0Bosx8QXLPLguwx7QOduZa7UhfIUqi2GS4NfhgEzz+rpxeRX07G3tu6k4aenBik6uH
	EyEZwo9cQnyqfI5IY+SeMIvs4OewVvn7QCSh7CpkI6/axF0WM22ZgUMg3ef066wAU1SoBV5GdAT
	QvatnzSQktBZc1uEkrzj57Lc1hLSLbGHqwaBLQ/Sh0z4XCRiu47eDIisFekhK65eCMrL/VdxeeI
	QXbjwqKqc3reyOhaZ+bpJjw1t128LepBp76BxB8ooaCyicgJZzSGC9XMISQkxEk+yMrdapENTf3
	v
X-Received: by 2002:a05:600c:8116:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4ac17e10724mr259459885e9.16.1793648512913;
        Mon, 02 Nov 2026 11:41:52 -0800 (PST)
Received: from mtardy-friendly-lvh-runner.europe-west1-c.c.cilium-dev.internal ([2600:1900:4010:1a8::])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4ac0a0a3495sm231386345e9.4.2026.11.02.11.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:41:52 -0800 (PST)
From: Mahe Tardy <mahe.tardy@gmail.com>
To: bpf@vger.kernel.org
Cc: Quentin Monnet <qmo@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Mahe Tardy <mahe.tardy@gmail.com>,
	Tianyi Chen <hi@tychen.cc>,
	Gyutae Bae <gyutae.bae@navercorp.com>,
	Hui Su <sh_def@163.com>,
	Josef Bacik <josef@toxicpanda.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v2 1/5] libbpf: Count entry programs for bpf_gen__init()
Date: Mon,  2 Nov 2026 19:41:40 +0000
Message-ID: <20261102194145.620210-2-mahe.tardy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102194145.620210-1-mahe.tardy@gmail.com>
References: <20261102194145.620210-1-mahe.tardy@gmail.com>
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

Commit '259172bb6514 ("libbpf: Fix gen_loader assumption on number of
programs.")' explicitly mention that we may pass a higher number of
progs because we include subprogs and autoload=false to bpf_gen__init()
generating a bigger cleanup section which is harmless.

This is in preparation for the next commits that will introduce cleanup
of the link_fds to bpf_gen__init(). We don't want to overallocate but
have the correct count of progs in this situation so that the
program-slot count matches the programs exposed by the skeleton.

Signed-off-by: Mahe Tardy <mahe.tardy@gmail.com>
---
 tools/lib/bpf/libbpf.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 02e75b183ed0..a7cbe7204043 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -9800,7 +9800,7 @@ static int bpf_object_load(struct bpf_object *obj, int extra_log_level, const ch
 	 * permit cross-endian creation of "light skeleton".
 	 */
 	if (obj->gen_loader) {
-		int nr_func_ptr_maps = 0, nr_progs = 0, i;
+		int nr_func_ptr_maps = 0, nr_progs = 0, nr_obj_progs = 0, i;
 		bool text_has_callx = false;

 		/*
@@ -9815,13 +9815,16 @@ static int bpf_object_load(struct bpf_object *obj, int extra_log_level, const ch
 			if (prog_is_subprog(obj, &obj->programs[i]) &&
 			    prog_has_callx(&obj->programs[i]))
 				text_has_callx = true;
-		for (i = 0; i < obj->nr_programs; i++)
+		for (i = 0; i < obj->nr_programs; i++) {
+			if (prog_is_subprog(obj, &obj->programs[i]))
+				continue;
+			nr_obj_progs++;
 			if (obj->programs[i].load_strategy != BPF_PROG_LOAD_STRATEGY_DISABLED &&
-			    !prog_is_subprog(obj, &obj->programs[i]) &&
 			    (text_has_callx || prog_has_callx(&obj->programs[i])))
 				nr_progs++;
+		}
 		bpf_gen__init(obj->gen_loader, obj->log_level | extra_log_level,
-			      obj->nr_programs, obj->nr_maps, nr_func_ptr_maps * nr_progs);
+			      nr_obj_progs, obj->nr_maps, nr_func_ptr_maps * nr_progs);
 	} else if (!is_native_endianness(obj)) {
 		pr_warn("object '%s': loading non-native endianness is unsupported\n", obj->name);
 		return libbpf_err(-LIBBPF_ERRNO__ENDIAN);
--
2.43.0

