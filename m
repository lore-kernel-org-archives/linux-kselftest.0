Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6B42E4257
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 03:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775618081; cv=none; b=XqBBAu9madeJSJCK5mIYHQY2OSvf+v1xTj0sXLYzqRiRdiKygqLydflBEqjl0kgIeNAX5SxrGFAKLxWQ0VmMG+CbWkEDARB6K9DvJ3VP27IUMbIkmULri1zifP3JQx2VDX/btvu/+vBZLpWU6YuSrZkw3PPAesIPj5PdjvRJSos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775618081; c=relaxed/simple;
	bh=wW8+WCBgIrCEX56/SsdT2XQwxb/50iQNCug2jZFhLrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CbCcyH/MXRTYw+mi8S6kIvmD4iYCn4rH9iJAccaHYMjWQjviDBJ+OgCZxEU8OePosvGDsdg4+2mkue9+kSg6ifpJZW7hWsz4pgZ9Zw/0Ymwbop9GPAXbaykYZ0SXU3R8mvHeguMGxf98Eq2+bykiEp+AhsS70FnpFdBK/QdVq4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRSI9Wke; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRSI9Wke"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-35da1af3e10so5104796a91.3
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 20:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775618080; x=1776222880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeCg0Ef5NFNCG+pFZ483XFA+LTJBKt1oc3PUJbKPktM=;
        b=SRSI9Wkew9MyCjh74rjwrY2iVE123LqRFkpexTEXRI0tbKMr+udI6yXe9iwkBrW0oD
         +YRr2JuqJhsqk1kjW38EtSDpNU64eiOqibYWTfAJnDEkp3QkhtcSS1pWfA8JenIfpkty
         2it85ZCcNd4sybhefdZc0iitUz0EeeB12WYDCfL8QfQXPvt2NjFCsLtMIbkduhewWqBB
         6xjcshDuSgVARrobbYIta+piCGALQXHrcD3Wb0rN/h713sGtIp+npoIDDdMSbW7pI/xt
         gCgr8n9STFp3a5Kx8XqcGGz1IK82xQKui65nJOyyrzpEzplNkgj35dIUrZEgcYtX1/77
         fmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775618080; x=1776222880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XeCg0Ef5NFNCG+pFZ483XFA+LTJBKt1oc3PUJbKPktM=;
        b=CbTezYOLZdgVYAR5lNfPxXi9Q71hSziSQ2CMDMypPYUSVFLf2uVyUgu5/lJPle7Fmj
         LYlPaAa0v5Kt3Yp3YVQzi5RqoYaEtVkGiYyBlLuncEdUadzYF4HyeCPJ08mnxAsPChTd
         2eUpkgx7FB6f7j4fhAmIhcO+LtjygrSq8EJNC5yAY2ejuzlfVvZuQuSBZDnPhP3Yu7xL
         018gAD1W/uhLYerRyoc1YXjBskHSqkGiQDBfQ3k/OfMkfRARbR9tEbpmwkLEARAMl6AG
         cH7Tb0aevvqRePDjOwq7vQC+Zbjt8fehKWqBE5+Dxy514OXUX4qob7d4oCyOKlUSpJcZ
         B2pg==
X-Forwarded-Encrypted: i=1; AJvYcCWTIlYTrLyTorPuGw5tE0mJImNnlM+BgDjKkEbQxdkpIZzxpa/8r2+Nh4bDIiwJO1H25VZKU6GzyLy4Q97Hngw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW+HjKjri1joDiVm0/jbXRF8tcsGN2++ZVQOassVod3Cj0oOAn
	1P3c5Zr17tjMWi0TNYk3JbrkisIn7UTR6kBKAkt8A6L5au2s00OHaHua
X-Gm-Gg: AeBDiesjf+J8ZS9oKad14ujRbx4tmAhRFCDQHw6+xzh0/h3LnnwXNLWAX+ajZ6pEc3R
	gy3B/paKUpPAnHNfQvAPfh0IbwWYRf8x9pQrL3ssUk8+cp0swtGrRaxcsY6DiaycV0a+5UfXEp5
	kruUlkboZxVRDnyyAgy7BNl/ImquOh06CHWmjw/Okr16lZptqMQlawdVvzDyXtit+saJDn6gXsp
	UFHzE4hFEFPlB+c29u/rLGsjZ4pk/uuDnnptRl5pM/ekwjYNtiKbLCn6Vpzcf/X6zckCmzqFk5U
	JhFZ256s+7lgJvNDfh+PQywYzoWMjoYxaBv+zcZlkMyTChC4KQm6J0maRL+/s42zWsCYS/jNTbg
	DN465i8rAgZ8iUshtydNwHrnguHkO6jP39K1o/sv4BbD9ySnalGpNv7CAbD3bANnnLeMDO07hMo
	jYjkwbnGHk7673X7ecHcMs
X-Received: by 2002:a17:90b:3b86:b0:35b:a8cf:7960 with SMTP id 98e67ed59e1d1-35de678fa63mr18665076a91.3.1775618080003;
        Tue, 07 Apr 2026 20:14:40 -0700 (PDT)
Received: from 7940hx ([103.173.155.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe41b11fsm23506913a91.0.2026.04.07.20.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 20:14:39 -0700 (PDT)
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
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next 1/3] bpf: add missing fsession to the verifier log
Date: Wed,  8 Apr 2026 11:14:14 +0800
Message-ID: <20260408031416.266229-2-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260408031416.266229-1-dongml2@chinatelecom.cn>
References: <20260408031416.266229-1-dongml2@chinatelecom.cn>
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

Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
---
 kernel/bpf/verifier.c                               | 8 ++++----
 tools/testing/selftests/bpf/prog_tests/exceptions.c | 8 ++++----
 tools/testing/selftests/bpf/verifier/sleepable.c    | 2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 594260c1f382..707eaf262307 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -11757,7 +11757,7 @@ static int check_get_func_ip(struct bpf_verifier_env *env)
 
 	if (type == BPF_PROG_TYPE_TRACING) {
 		if (!bpf_prog_has_trampoline(env->prog)) {
-			verbose(env, "func %s#%d supported only for fentry/fexit/fmod_ret programs\n",
+			verbose(env, "func %s#%d supported only for fentry/fexit/fsession/fmod_ret programs\n",
 				func_id_name(func_id), func_id);
 			return -ENOTSUPP;
 		}
@@ -25561,7 +25561,7 @@ int bpf_check_attach_target(struct bpf_verifier_log *log,
 	btf = tgt_prog ? tgt_prog->aux->btf : prog->aux->attach_btf;
 	if (!btf) {
 		bpf_log(log,
-			"FENTRY/FEXIT program can only be attached to another program annotated with BTF\n");
+			"FENTRY/FEXIT/FSESSION program can only be attached to another program annotated with BTF\n");
 		return -EINVAL;
 	}
 	t = btf_type_by_id(btf, btf_id);
@@ -25686,7 +25686,7 @@ int bpf_check_attach_target(struct bpf_verifier_log *log,
 	case BPF_TRACE_RAW_TP:
 		if (tgt_prog) {
 			bpf_log(log,
-				"Only FENTRY/FEXIT progs are attachable to another BPF prog\n");
+				"Only FENTRY/FEXIT/FSESSION progs are attachable to another BPF prog\n");
 			return -EINVAL;
 		}
 		if (!btf_type_is_typedef(t)) {
@@ -25952,7 +25952,7 @@ static int check_attach_btf_id(struct bpf_verifier_env *env)
 	}
 
 	if (prog->sleepable && !can_be_sleepable(prog)) {
-		verbose(env, "Only fentry/fexit/fmod_ret, lsm, iter, uprobe, and struct_ops programs can be sleepable\n");
+		verbose(env, "Only fentry/fexit/fsession/fmod_ret, lsm, iter, uprobe, and struct_ops programs can be sleepable\n");
 		return -EINVAL;
 	}
 
diff --git a/tools/testing/selftests/bpf/prog_tests/exceptions.c b/tools/testing/selftests/bpf/prog_tests/exceptions.c
index 84ab73e08b0e..94a62fcd4543 100644
--- a/tools/testing/selftests/bpf/prog_tests/exceptions.c
+++ b/tools/testing/selftests/bpf/prog_tests/exceptions.c
@@ -128,7 +128,7 @@ static void test_exceptions_success(void)
 				       bpf_program__fd(skel->progs.exception_ext_mod_cb_runtime),
 				       "exception_cb_mod"), "set_attach_target"))
 				goto done;
-		}), "FENTRY/FEXIT programs cannot attach to exception callback", 0);
+		}), "FENTRY/FEXIT/FSESSION programs cannot attach to exception callback", 0);
 
 	if (test__start_subtest("throwing fentry -> exception_cb"))
 		RUN_EXT(-EINVAL, true, ({
@@ -138,7 +138,7 @@ static void test_exceptions_success(void)
 				       bpf_program__fd(skel->progs.exception_ext_mod_cb_runtime),
 				       "exception_cb_mod"), "set_attach_target"))
 				goto done;
-		}), "FENTRY/FEXIT programs cannot attach to exception callback", 0);
+		}), "FENTRY/FEXIT/FSESSION programs cannot attach to exception callback", 0);
 
 	if (test__start_subtest("non-throwing fexit -> exception_cb"))
 		RUN_EXT(-EINVAL, true, ({
@@ -148,7 +148,7 @@ static void test_exceptions_success(void)
 				       bpf_program__fd(skel->progs.exception_ext_mod_cb_runtime),
 				       "exception_cb_mod"), "set_attach_target"))
 				goto done;
-		}), "FENTRY/FEXIT programs cannot attach to exception callback", 0);
+		}), "FENTRY/FEXIT/FSESSION programs cannot attach to exception callback", 0);
 
 	if (test__start_subtest("throwing fexit -> exception_cb"))
 		RUN_EXT(-EINVAL, true, ({
@@ -158,7 +158,7 @@ static void test_exceptions_success(void)
 				       bpf_program__fd(skel->progs.exception_ext_mod_cb_runtime),
 				       "exception_cb_mod"), "set_attach_target"))
 				goto done;
-		}), "FENTRY/FEXIT programs cannot attach to exception callback", 0);
+		}), "FENTRY/FEXIT/FSESSION programs cannot attach to exception callback", 0);
 
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

