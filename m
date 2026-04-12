Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2833D347508
	for <linux-kselftest@vger.kernel.org>; Sun, 12 Apr 2026 06:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775973846; cv=none; b=aBqRlAp01paJbtsxMI5SfcOuepKuiboJe2vat23FRqQ+qgy0iIMgAkT1tR7ptgKpUyrv7eGHh9vPj/6dLfRn9yognbLqEKBAdm0+pBj+su1giGAmANAO8xCbuhZUiJgcjsd2aM6mZ4VX+OjZM798niTByo+TUrn5hNr5IjJa7wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775973846; c=relaxed/simple;
	bh=tH97OV+P0DlPe6LxB5CgjEjvpu/auSFpJ5iJ63eCf6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DOnKf/g9evX9NFtuqueYxVmAyF0zCg5VCYGvyvTyOyeggmjEiVVYSUBxTa+tS1LAUqnH8eftmt/Vd9m6QFh1m5a/H/TY0t511QdMiWGnOxU3tqBepCftp7yryhoviPjzIFjLlq5GHVnNsR6Qr1PUYsGMoNIQ5k/euQvdWDc0wu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQA5EHdJ; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQA5EHdJ"
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-c736261ee8dso1259645a12.1
        for <linux-kselftest@vger.kernel.org>; Sat, 11 Apr 2026 23:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775973843; x=1776578643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LFbAgBrmlqnGRPpGIwv5xn3IZvtUwanJPAMvMFafaIA=;
        b=dQA5EHdJzKce4LlD2AF4qe+U/IRwLoexGwlia43aE+mTBnoi5PIpU2lKRh/wTFfjCC
         V3VlMPxsJhzBfaFdkC9pDQ2/MdKr74kQz+8U3jjkExM5TjvMMmZ7RymdacW64lnb1mk7
         /vYBs4hb4q2s/6GsrH4gGkjJF7Ky831je0e2A5vErFzRdYpSaCSxmHN5oXan+IW2tDa8
         tKkaLBmpW7OMelSBvrBJgSalcMjQmMSkPrwrsDG1t5JWODdH45X050RkPSKiJXel+TDr
         ze/eCvQ4x8CUODCRUbs9GKZln3rpxco55cERlcDjLeRL4MqQ/45wvM/KOFd7yn0ntyPH
         ufug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775973843; x=1776578643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LFbAgBrmlqnGRPpGIwv5xn3IZvtUwanJPAMvMFafaIA=;
        b=ENcoQbnBDTUZyf9ztg4uPX5KmCR3cINUxfhC80hQZLLd9hVzgLR8CH3iMC18cF7M7M
         pTsxEkPqIEWdIHCelg9claJZAJRB5nUMOIKhX/kxzKA418ah9n2waQ5PWQ2dy5O6b+4A
         8eMJCcdsR6R5W+xANgDn1kVkoCoiQ7496ennemZVF99AACEeF7WRu2UGV/25SPErAW6C
         cche4ate9VgHAAzQShZKFYnTcO0VkHltTfwWihPvE6XQh5HtWpr3h/154HjbTGmrtRO+
         JgTYZnYfMm4mejqlmwEEP8ZJuAWta79WIDlSbyJaWHTogseUVjU3ZRWAtmvNOQ8HgDgZ
         ziHw==
X-Forwarded-Encrypted: i=1; AJvYcCVfYzFgj1KFUsujSAMArMnvC1dhHMCv+yL0SjY1aSW8OjPC53VTuzqWkptLOTo/VzcyXePPn2d5C4NnlpnJ8sA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDJISUIwzxZ4Mx5UrbXHtWrTVH5ioGhk2PeRnoIxJy+ofOgirZ
	2DcHT89bgfQyIfySLxlg5cBD91MfRhXGd2tRXza8hUpD+ZrL7ha9Px59
X-Gm-Gg: AeBDievMlKf91zbSNVhFag0u8NV/6kebYSrJdiLWKU8faarrA1cnGfwBuHEsAKm4zli
	GbOYa8hWDbX1N8zQXoLFnjTkc+gdcafuOpePTljuH2p538ema/0zX/68Zx08OfEBkRNmGEwwy2E
	e1Ityw7p3hrthLT4ECxPGB+W0ZSA/Pd0OBg7QOZkG+uKVZQ4l8aRSENF3VamirizRu/lW3cUR5+
	Uo+ob29O/tg7ogOy3V4r0rqTtjn6n7HDl7QzhraM5wbtqcgLCrfmEGCzpKToEho+N3lZcplonE5
	1wT1yYwiKDaV7AYXF6C6AsAPA5cGQ9vZ/yU9rrapgZvAklV2nvm48pzF4DfbhvvVGt5lPqUqDV6
	fFugib5ZEMRoEqWp2q2FMkeTy5EAmLupF/OWTQgU8rJOzxqTuiXLt5G4J+l55AcIZXpyRjN5A2P
	9+ZkQK5dKSMTIFmPgxj3yx
X-Received: by 2002:a05:6a00:302a:b0:82c:daa4:ce29 with SMTP id d2e1a72fcca58-82f0c2d93admr9215246b3a.47.1775973843395;
        Sat, 11 Apr 2026 23:04:03 -0700 (PDT)
Received: from 7950hx ([103.173.155.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4b251esm7072645b3a.37.2026.04.11.23.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 23:04:03 -0700 (PDT)
From: Menglong Dong <menglong8.dong@gmail.com>
X-Google-Original-From: Menglong Dong <dongml2@chinatelecom.cn>
To: ast@kernel.org
Cc: daniel@iogearbox.net,
	john.fastabend@gmail.com,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	shuah@kernel.org,
	emil@etsalapatis.com,
	leon.hwang@linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v3 1/3] bpf: add missing fsession to the verifier log
Date: Sun, 12 Apr 2026 14:03:44 +0800
Message-ID: <20260412060346.142007-2-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260412060346.142007-1-dongml2@chinatelecom.cn>
References: <20260412060346.142007-1-dongml2@chinatelecom.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fsession attach type is missed in the verifier log in
check_get_func_ip(), bpf_check_attach_target() and check_attach_btf_id().
Update them to make the verifier log proper. Meanwhile, update the
corresponding selftests.

Acked-by: Leon Hwang <leon.hwang@linux.dev>
Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
---
v3:
- replace "FENTRY/FEXIT/FSESSION" with "Tracing"

v2:
- add a missing FSESSION in bpf_check_attach_target()
---
 kernel/bpf/verifier.c                               | 10 +++++-----
 tools/testing/selftests/bpf/prog_tests/exceptions.c |  8 ++++----
 tools/testing/selftests/bpf/verifier/sleepable.c    |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 84699a428077..ac89ad992f27 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -11690,7 +11690,7 @@ static int check_get_func_ip(struct bpf_verifier_env *env)
 
 	if (type == BPF_PROG_TYPE_TRACING) {
 		if (!bpf_prog_has_trampoline(env->prog)) {
-			verbose(env, "func %s#%d supported only for fentry/fexit/fmod_ret programs\n",
+			verbose(env, "func %s#%d supported only for fentry/fexit/fsession/fmod_ret programs\n",
 				func_id_name(func_id), func_id);
 			return -ENOTSUPP;
 		}
@@ -25494,7 +25494,7 @@ int bpf_check_attach_target(struct bpf_verifier_log *log,
 	btf = tgt_prog ? tgt_prog->aux->btf : prog->aux->attach_btf;
 	if (!btf) {
 		bpf_log(log,
-			"FENTRY/FEXIT program can only be attached to another program annotated with BTF\n");
+			"Tracing program can only be attached to another program annotated with BTF\n");
 		return -EINVAL;
 	}
 	t = btf_type_by_id(btf, btf_id);
@@ -25530,7 +25530,7 @@ int bpf_check_attach_target(struct bpf_verifier_log *log,
 		if (aux->func && aux->func[subprog]->aux->exception_cb) {
 			bpf_log(log,
 				"%s programs cannot attach to exception callback\n",
-				prog_extension ? "Extension" : "FENTRY/FEXIT");
+				prog_extension ? "Extension" : "Tracing");
 			return -EINVAL;
 		}
 		conservative = aux->func_info_aux[subprog].unreliable;
@@ -25619,7 +25619,7 @@ int bpf_check_attach_target(struct bpf_verifier_log *log,
 	case BPF_TRACE_RAW_TP:
 		if (tgt_prog) {
 			bpf_log(log,
-				"Only FENTRY/FEXIT progs are attachable to another BPF prog\n");
+				"Only FENTRY/FEXIT/FSESSION progs are attachable to another BPF prog\n");
 			return -EINVAL;
 		}
 		if (!btf_type_is_typedef(t)) {
@@ -25885,7 +25885,7 @@ static int check_attach_btf_id(struct bpf_verifier_env *env)
 	}
 
 	if (prog->sleepable && !can_be_sleepable(prog)) {
-		verbose(env, "Only fentry/fexit/fmod_ret, lsm, iter, uprobe, and struct_ops programs can be sleepable\n");
+		verbose(env, "Only fentry/fexit/fsession/fmod_ret, lsm, iter, uprobe, and struct_ops programs can be sleepable\n");
 		return -EINVAL;
 	}
 
diff --git a/tools/testing/selftests/bpf/prog_tests/exceptions.c b/tools/testing/selftests/bpf/prog_tests/exceptions.c
index 84ab73e08b0e..e8cbaf2a3e82 100644
--- a/tools/testing/selftests/bpf/prog_tests/exceptions.c
+++ b/tools/testing/selftests/bpf/prog_tests/exceptions.c
@@ -128,7 +128,7 @@ static void test_exceptions_success(void)
 				       bpf_program__fd(skel->progs.exception_ext_mod_cb_runtime),
 				       "exception_cb_mod"), "set_attach_target"))
 				goto done;
-		}), "FENTRY/FEXIT programs cannot attach to exception callback", 0);
+		}), "Tracing programs cannot attach to exception callback", 0);
 
 	if (test__start_subtest("throwing fentry -> exception_cb"))
 		RUN_EXT(-EINVAL, true, ({
@@ -138,7 +138,7 @@ static void test_exceptions_success(void)
 				       bpf_program__fd(skel->progs.exception_ext_mod_cb_runtime),
 				       "exception_cb_mod"), "set_attach_target"))
 				goto done;
-		}), "FENTRY/FEXIT programs cannot attach to exception callback", 0);
+		}), "Tracing programs cannot attach to exception callback", 0);
 
 	if (test__start_subtest("non-throwing fexit -> exception_cb"))
 		RUN_EXT(-EINVAL, true, ({
@@ -148,7 +148,7 @@ static void test_exceptions_success(void)
 				       bpf_program__fd(skel->progs.exception_ext_mod_cb_runtime),
 				       "exception_cb_mod"), "set_attach_target"))
 				goto done;
-		}), "FENTRY/FEXIT programs cannot attach to exception callback", 0);
+		}), "Tracing programs cannot attach to exception callback", 0);
 
 	if (test__start_subtest("throwing fexit -> exception_cb"))
 		RUN_EXT(-EINVAL, true, ({
@@ -158,7 +158,7 @@ static void test_exceptions_success(void)
 				       bpf_program__fd(skel->progs.exception_ext_mod_cb_runtime),
 				       "exception_cb_mod"), "set_attach_target"))
 				goto done;
-		}), "FENTRY/FEXIT programs cannot attach to exception callback", 0);
+		}), "Tracing programs cannot attach to exception callback", 0);
 
 	if (test__start_subtest("throwing extension (with custom cb) -> exception_cb"))
 		RUN_EXT(-EINVAL, true, ({
diff --git a/tools/testing/selftests/bpf/verifier/sleepable.c b/tools/testing/selftests/bpf/verifier/sleepable.c
index 1f0d2bdc673f..c2b7f5ebf168 100644
--- a/tools/testing/selftests/bpf/verifier/sleepable.c
+++ b/tools/testing/selftests/bpf/verifier/sleepable.c
@@ -85,7 +85,7 @@
 	.expected_attach_type = BPF_TRACE_RAW_TP,
 	.kfunc = "sched_switch",
 	.result = REJECT,
-	.errstr = "Only fentry/fexit/fmod_ret, lsm, iter, uprobe, and struct_ops programs can be sleepable",
+	.errstr = "Only fentry/fexit/fsession/fmod_ret, lsm, iter, uprobe, and struct_ops programs can be sleepable",
 	.flags = BPF_F_SLEEPABLE,
 	.runs = -1,
 },
-- 
2.53.0

