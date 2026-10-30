Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361128;
	b=e981hKUJsu46bfOTPvtJhc8DkMaSBNO2yy1t4WZYBA3Ut4erYkldOUPJ0zVKT3VE3plu
	 V5N1H3XHicCQes+2d4USYE9ikDoWd4mtNk9P4uf5Tk8bIfPl27V3HbLs/vlaFnpNZZkkw
	 VnBPhiLOYrkI5lQLircAuGtY9Z9wzkqY6M1me9ifnktJItxHUtJaris3Kp+X1hGH+4XTo
	 spA4vkQF7i1+PTnMXlKO5lKEwWrls3VPS99tm2XZZuEJH+oYh6Wo9CiLW/X8gMYmh2pxb
	 TzWQg/D89sXrilfgGJPYr9PmQENtP+KjgQlQCiSHXszF7u4r7aPjde8MlrATIDETH3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=bg8z49bq7mHJrjEaBS03cZdttt/0WynaCaNHuuBDWWU=;
	b=uyf+DkU3f6vSeHXKT2+4Ey1q5Wo+HmNoLoz+qjaDaKpUMiKjbUm85Ed3MENdufWA2/9R
	 z2+ZYukl/ro1ENaf58fAnvJLOJb4msLqNU5C7WuhGCSc1GlPw1l9wwITBSFVrQSpvjP+U
	 S+5veJe0DvqtnGlczicl4OO5QPzRkRpF1ruqPV/dBjB/+YKC72/LY/AwUHSAO2e94H8OQ
	 IUUN1Ahz3/g9UdQI6NSmbDJI6J2x0Im+hj44CV3RbBWyMCVPu879AUvm9QhYkFLAxwmhZ
	 5ZXqsFSaWWkQGXvPpuwJFv84AqWlTsGX5YiI2nH/Dfv3t+e/hE8jmgGYaat3+tTXZJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LiUYlrvM;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3AD606A31E
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 11:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A3AD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LiUYlrvM
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15943c9c005so1060026c88.1
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 04:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361127; x=1793965927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bg8z49bq7mHJrjEaBS03cZdttt/0WynaCaNHuuBDWWU=;
        b=LiUYlrvM1Y1n/OcMST6U7xSYZLiv2K+LjKtZaBuRrJwt36VvtyMPBn+GMzFzZdXXLm
         uEIs+z2frshfDKs/T2lCfoCwNVFy+s/XUXDoSqee1zaV+5TkvZHo4jHHuXrN8jMHNQVV
         GbSrKiIxhUybUPa2fH7gYk00qpQyQMu8EGVetPuYsCvuc7QvghkyeLWps7rOvxKR/MdX
         S1FXS3cqIjlX4SvGWlJXDUkx4kHYcTb6fToaKdchXHDmPI6rm5uNYke3kMd3fTS33q/8
         7TWbefjZ8PmFjgNiwO2YfTVmVOoHvy7efDYt6qjonfgi+vsTqKVkYYguvR0+fuZXHZXr
         fJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361127; x=1793965927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bg8z49bq7mHJrjEaBS03cZdttt/0WynaCaNHuuBDWWU=;
        b=wXfI5ngGsrE6zpUjB25FMVCY8Ah8TRxmuEz9S9NkQJHbACn6g+XHAilWsGe+vIdWFY
         dupq7Xd2LkdfkScLR4cfGk4V6bHB4F6iSYLekb/OHSDMo5yRYpXfLnxD7JHXgcGwfjOt
         xiZyYejmEV7AJVJqt2CI/v7NQVRiEcIMWjt7iZgIoHzVI1wIdwnP0wqkGyA/vPbzZA8O
         P1i2TSkkJkSD/9Vh6vY6uQ8RrqhwY/x3sD1756R27WybPys2NgRv71pbjTHWzXhmMxgE
         c1aCzbq35kUQsL2ceHtgj4xBJKafS5+uY4dByz4CXEFSJJSd71NPIUT4t0yAMqOI6UNu
         wNeg==
X-Forwarded-Encrypted: i=1; AKwUvBx1mLfIrwfJ0lfLbVUxL/2I8tFAskt6weJB68Pipl9pxB0Uhs0AtKYAnv8RpdOp0Z092+25am/QA+ZtctsvZac=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmpEFFP5w6dci2aHOFg0wl6mQHXwys8e4BmnKJcvjTUph/XIOS
	1Oi2KipV4J036BrWdI7fNA1a3Ae3Jj9rItLr0JJkGMSEJdY2L97xnGEt
X-Gm-Gg: AYBFou2XUv9SxW6Ym8NK9cK3TEu/XiS06GxiQLwdeYuitokce101zmrplFJQ3YlW9fi
	TR7TJlzzFIxcRezyi7KFQRFU3VvmKvk92RDsokx0ntiNwRNU3UAfhAIgvqf9ww+8pTwsbR15Sfn
	JBNW7IZsnnmatxLwCO0nzr0yjCXXJnt3rfvHa+yI2rK09aa2p6+NGT/H3nG8Qxh8e3mMol51Q57
	h4OF55LRg3qZeTa9JDohiIdIfjHSTHlnjkwunq4C7OMenOdUcfgMrLddIy2wFxjn+tHk8mN4pKz
	n/Ns+iCXZOdS3WPjuyXXIth1s1LYwTRMaCAvc7ZIB0i6eSv6X89JgTVorphNCmnainoBotl5720
	6ftrrpWgFvBMf8i5z0GgiNkRnI/eAY9XuG6JoHoF+jkbQ6uwSVaq491te+/TrwXUq7oivblodCx
	qP2nDJOaUTCjp4Zj920oG+2VDw5ZbF13MqzWvPbyuJiIh2W3XPQyLrDrZfe7FIsGWFPptCi14mf
	/5BwV3Fzz7s4DvlDlfyu8yRvZzwPtbuygK+wa02IPv8Bgudcs3ngXuTrk0HmrGrPT24Fn4/YXDO
	3N3qNw+dpl5+QGvgzk6ne+7T
X-Received: by 2002:a05:7022:160b:b0:196:e254:db24 with SMTP id a92af1059eb24-1ac5c64cf5amr3818603c88.21.1793361127129;
        Fri, 30 Oct 2026 04:52:07 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm6437304c88.20.2026.10.30.04.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:52:06 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 30 Oct 2026 07:51:47 -0400
Subject: [PATCH bpf-next v2 02/22] bpf: Remap the verifier state through
 the patch list
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-bpf-verifier-patch-batch-v2-2-55cd43439f7c@gmail.com>
References: <20261030-bpf-verifier-patch-batch-v2-0-55cd43439f7c@gmail.com>
In-Reply-To: <20261030-bpf-verifier-patch-batch-v2-0-55cd43439f7c@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

Besides the program, the verifier keeps aux data for every instruction
and tables that name instructions: subprog starts, function pointers
and instruction arrays. bpf_patch_insn_data() fixes all of them up
with each patch.

The image that the patch list builds leaves them behind, so verifier
passes can't queue their patches on it yet.

Add bpf_patch_list_add() and bpf_patch_list_commit(), which keep the
list in the verifier env. Install the new image on commit and move the
aux data, the subprog starts, the function pointers and the instruction
arrays along with it, filling in the aux data of patched instructions
the way adjust_insn_aux_data() does. Allocate everything before
installing the image, so that a failure leaves the program and the env
as they were.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 include/linux/bpf.h          |   1 +
 include/linux/bpf_verifier.h |   5 ++
 kernel/bpf/bpf_insn_array.c  |  18 ++++++
 kernel/bpf/fixups.c          | 151 +++++++++++++++++++++++++++++++++++++++++++
 kernel/bpf/verifier.c        |   1 +
 5 files changed, 176 insertions(+)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 580f89c450b55..9bb5e0c823627 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -4378,6 +4378,7 @@ int bpf_insn_array_ready(struct bpf_map *map);
 void bpf_insn_array_release(struct bpf_map *map);
 void bpf_insn_array_adjust(struct bpf_map *map, u32 first, u32 len);
 void bpf_insn_array_adjust_after_remove(struct bpf_map *map, u32 off, u32 len);
+void bpf_insn_array_remap(struct bpf_map *map, const u32 *new_off, u32 cnt, s32 grow);
 
 #ifdef CONFIG_BPF_SYSCALL
 void bpf_prog_update_insn_ptrs(struct bpf_prog *prog, u32 *offsets, void *image);
diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
index a56a996b3d953..49a6e443de75d 100644
--- a/include/linux/bpf_verifier.h
+++ b/include/linux/bpf_verifier.h
@@ -1154,6 +1154,7 @@ struct bpf_verifier_env {
 	bool signature;
 	u32 insn_aux_data_len;
 	struct bpf_insn_aux_data *insn_aux_data; /* array of per-insn state */
+	struct bpf_patch_list patch_list;
 	const struct bpf_line_info *prev_linfo;
 	struct bpf_verifier_log log;
 	struct bpf_diag *diag;
@@ -2061,6 +2062,10 @@ int bpf_jit_subprogs(struct bpf_verifier_env *env);
 int bpf_fixup_call_args(struct bpf_verifier_env *env);
 int bpf_do_misc_fixups(struct bpf_verifier_env *env);
 int bpf_insn_def32(struct bpf_prog *prog, struct bpf_insn *insn);
+struct bpf_insn *bpf_patch_list_add(struct bpf_verifier_env *env, u32 off,
+				    const struct bpf_insn *patch, u32 len);
+int bpf_patch_list_commit(struct bpf_verifier_env *env);
+void bpf_patch_list_free(struct bpf_verifier_env *env);
 
 int bpf_flip_opcode(u32 opcode);
 u8 bpf_rev_opcode(u8 opcode);
diff --git a/kernel/bpf/bpf_insn_array.c b/kernel/bpf/bpf_insn_array.c
index 92bbb71576ae3..dbfcf1eddb91e 100644
--- a/kernel/bpf/bpf_insn_array.c
+++ b/kernel/bpf/bpf_insn_array.c
@@ -253,6 +253,24 @@ void bpf_insn_array_adjust(struct bpf_map *map, u32 first, u32 len)
 	}
 }
 
+/*
+ * Move each offset to new_off[offset], new_off[] covers [0, cnt]. Offsets
+ * past the end of the old program only move by 'grow'.
+ */
+void bpf_insn_array_remap(struct bpf_map *map, const u32 *new_off, u32 cnt, s32 grow)
+{
+	struct bpf_insn_array *insn_array = cast_insn_array(map);
+	u32 off;
+	int i;
+
+	for (i = 0; i < map->max_entries; i++) {
+		off = insn_array->values[i].xlated_off;
+		if (off == INSN_DELETED)
+			continue;
+		insn_array->values[i].xlated_off = off <= cnt ? new_off[off] : off + grow;
+	}
+}
+
 void bpf_insn_array_adjust_after_remove(struct bpf_map *map, u32 off, u32 len)
 {
 	struct bpf_insn_array *insn_array = cast_insn_array(map);
diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index f062ef7dd943d..0697f66b1ffc1 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -380,6 +380,157 @@ struct bpf_prog *bpf_patch_insn_data(struct bpf_verifier_env *env, u32 off,
 	return __bpf_patch_insn_data(env, off, patch, len, BPF_PATCH_KEEP_TARGET);
 }
 
+/*
+ * Queue the replacement of insn 'off' by 'patch[0..len)' until
+ * bpf_patch_list_commit(), see __bpf_patch_list_add().
+ */
+struct bpf_insn *bpf_patch_list_add(struct bpf_verifier_env *env, u32 off,
+				    const struct bpf_insn *patch, u32 len)
+{
+	struct bpf_patch_list *pl = &env->patch_list;
+
+	if (bpf_rewrite_must_abort())
+		return ERR_PTR(-EINTR);
+
+	if (verifier_bug_if(!len || off >= env->prog->len ||
+			    (pl->cnt && off <= pl->patches[pl->cnt - 1].off),
+			    env, "insn %u patched out of order", off))
+		return ERR_PTR(-EFAULT);
+
+	return __bpf_patch_list_add(pl, env->prog, off, patch, len);
+}
+
+void bpf_patch_list_free(struct bpf_verifier_env *env)
+{
+	bpf_patch_list_release(&env->patch_list);
+}
+
+/*
+ * Fill the aux data of the 'p->len' insns at 'slot' from the aux data 'old'
+ * of the insn they replace, the same way as adjust_insn_aux_data() does.
+ */
+static void patch_list_adj_aux(struct bpf_prog *prog, struct bpf_insn_patch *p,
+			       struct bpf_insn *patch,
+			       const struct bpf_insn_aux_data *old,
+			       struct bpf_insn_aux_data *slot)
+{
+	struct bpf_insn_aux_data *last = slot + p->len - 1;
+	struct bpf_insn *orig = &p->orig;
+	u32 i;
+
+	*last = *old;
+	last->zext_dst = bpf_insn_def32(prog, &patch[p->len - 1]) >= 0;
+	memset(slot, 0, sizeof(*slot) * (p->len - 1));
+
+	for (i = 0; i < p->len - 1; i++) {
+		slot[i].seen = last->seen;
+		slot[i].zext_dst = bpf_insn_def32(prog, &patch[i]) >= 0;
+		if (!memcmp(&patch[i], orig, sizeof(*orig))) {
+			slot[i].non_stack_access = last->non_stack_access;
+			last->non_stack_access = false;
+		} else if (bpf_is_mem_insn(&patch[i])) {
+			slot[i].non_stack_access = true;
+		}
+	}
+
+	if (bpf_is_mem_insn(&patch[p->len - 1]) &&
+	    memcmp(&patch[p->len - 1], orig, sizeof(*orig)))
+		last->non_stack_access = true;
+
+	/* indirect jumps to the replaced insn land on the first new one */
+	if (last->indirect_target) {
+		slot[0].indirect_target = 1;
+		last->indirect_target = 0;
+	}
+}
+
+/*
+ * Apply all queued patches in one go. Everything that names an insn of the
+ * old image follows it to the new one, a patched insn is named by the first
+ * insn of its patch, like with bpf_patch_insn_data().
+ */
+int bpf_patch_list_commit(struct bpf_verifier_env *env)
+{
+	struct bpf_patch_list *pl = &env->patch_list;
+	struct bpf_insn_aux_data *data = NULL;
+	struct bpf_prog *prog = env->prog;
+	struct bpf_patch_image img = {};
+	u32 i, k, end;
+	struct bpf_insn_patch *p;
+	int err = 0;
+
+	if (!pl->cnt)
+		goto out;
+
+	/* Leave the program untouched until nothing can fail anymore. */
+	err = bpf_patch_list_build(pl, prog, &img);
+	if (err == -ERANGE) {
+		verbose(env, "insn %d cannot be patched due to 16-bit range\n",
+			env->insn_aux_data[img.bad].orig_idx);
+		goto out;
+	}
+	if (verifier_bug_if(err == -EFAULT, env, "insn %u jumps out of the program",
+			    img.bad))
+		goto out;
+	if (err)
+		goto out;
+
+	err = -ENOMEM;
+	data = __vmalloc(array_size(img.new_cnt, sizeof(*data)),
+			 GFP_KERNEL_ACCOUNT | __GFP_ZERO);
+	if (!data)
+		goto out;
+
+	prog = bpf_prog_realloc(prog, bpf_prog_size(img.new_cnt), GFP_USER);
+	if (!prog)
+		goto out;
+	env->prog = prog;
+
+	bpf_patch_image_install(prog, &img);
+
+	for (i = 0, k = 0; i < img.cnt; i = end) {
+		if (k < pl->cnt && pl->patches[k].off == i) {
+			p = &pl->patches[k++];
+			patch_list_adj_aux(prog, p, &pl->insns[p->start],
+					   &env->insn_aux_data[i],
+					   &data[img.new_off[i]]);
+			end = i + 1;
+			continue;
+		}
+		end = k < pl->cnt ? pl->patches[k].off : img.cnt;
+		memcpy(data + img.new_off[i], env->insn_aux_data + i,
+		       sizeof(*data) * (end - i));
+	}
+	vfree(env->insn_aux_data);
+	env->insn_aux_data = data;
+	env->insn_aux_data_len = img.new_cnt;
+	data = NULL;
+
+	for (i = 0; i < env->func_ptr_cnt; i++) {
+		struct bpf_func_ptr *fp = &env->func_ptrs[i];
+
+		if (fp->xlated_off == BPF_FUNC_PTR_DELETED)
+			continue;
+		fp->xlated_off = bpf_patch_image_remap(&img, img.new_off, fp->xlated_off);
+	}
+
+	/* NOTE: fake 'exit' subprog should be updated as well. */
+	for (i = 0; i <= env->subprog_cnt; i++)
+		env->subprog_info[i].start =
+			bpf_patch_image_remap(&img, img.new_off, env->subprog_info[i].start);
+
+	for (i = 0; i < env->insn_array_map_cnt; i++)
+		bpf_insn_array_remap(env->insn_array_maps[i], img.new_off,
+				     img.cnt, img.grow);
+
+	err = 0;
+out:
+	vfree(data);
+	bpf_patch_image_free(&img);
+	bpf_patch_list_release(pl);
+	return err;
+}
+
 /*
  * insn was moved down by delta insns inside its own patch. Operands relative
  * to the pc that point in front of the old position did not move with it.
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 5601d20562186..b6b120bf5433c 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -24158,6 +24158,7 @@ int bpf_check(struct bpf_prog **prog, union bpf_attr *attr, bpfptr_t uattr,
 	if (env->insn_aux_data)
 		bpf_clear_insn_aux_data(env, 0, env->insn_aux_data_len);
 	vfree(env->insn_aux_data);
+	bpf_patch_list_free(env);
 	kvfree(env->fd_array);
 	bpf_free_scev(env);
 	bpf_stack_liveness_free(env);

-- 
2.43.0

