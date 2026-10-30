Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361224;
	b=iBgaEpbffHdln8I4V2T1Olj1PyIdxHh4hSCUmGYArWGgYK+fmA6gJGyZM2ZTBy+gB/rt
	 9rauuuDBE5uLpF9X3CKPNAAWGWz+MFOumljYgsE+2WKn8PXHltRs8lQALlSVLyqokRopf
	 D/vNFx7rFEvNQ76k7zFxzH+r5hAoabpdiSpkNNugtnwmQt8tfwnx3vBn98ft5RFpoHJZB
	 3aujcC1rRe+CxSQHmqLu9VCQW0+fBpfSSZgft2izKV1oVBU6Z+ijdKG3Ga2I1iV2h6qZm
	 YQYyLjWzfSWSLTGfhA2Jebzh1jjAQXpQFg1q5TVyMsFGdNK+txLKzta2oEP24ZxHkZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=6ruo65qqTejJkM60HrkQCd1JUBkgnydByGT5wOincoQ=;
	b=K/BOxJmKqPLrM9u2/NzDitMQ+9dZIaNoxiJa8Uiz9QOJ/IpvbJTt97gIJJyyf5OSVjt6
	 V19AalQgG5tmxetpdFth+DzBlbQZN0WZx7a5h5OwMgvNRTjtzJvO7I2eu0PqTGBxjOBwr
	 2J7nESpT1nuycmpNI8oQLnWI02SNBwyEhPzyoKNJZloR34+Bni+uNTdEk183u7PyLzZ+Y
	 +kNHR+EKBo2L4GiNMwiGA9a5dIk9TSPx7FJuvDdA1W33JwMwZzIXwKZPtQZ+o/LrGONR7
	 /t24ZGoODe9Cz+l1c4zlnxJp80526WKh+ssZfZ4sbr7MRxZDGX4foGbtk3rH2sUJ31Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F347P88d;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE85607085C
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 11:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CE85607085C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F347P88d
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-188406bb948so599688c88.1
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 04:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361223; x=1793966023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ruo65qqTejJkM60HrkQCd1JUBkgnydByGT5wOincoQ=;
        b=F347P88dkcNAwI/Py3aXKr3+GIgiMhP4IWCqBMWkNV7OXrzJ2M6pEPoVHM6sqTsaUm
         XD3pg/LaMNPZv3sPxiypCmqUB7mvFhieZnQ3uMqxCM04uVto9LUn58B1wIsAi9f5ETEI
         j/QbfrJeNkLI+V+SjFVhhufAkqxtCHXaHVMUvv/i4Tezyfe+uoFsXv4MGwcdObizxLZW
         xE9jFwFHDEE4lBlq0KV4ePg2oDqRbNpO4rQ3beNX2yPaOCWWKeDnS5gCLTaA9q4ql/v0
         euV+/1RoBqCqKFpGP2EJNp3zXpht0aB2Y5WecI6trv1GqOb9rj99mAvbV0gVgboQzIyh
         UWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361223; x=1793966023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ruo65qqTejJkM60HrkQCd1JUBkgnydByGT5wOincoQ=;
        b=tTCREFUbK6VWZu1K6Bk0QTTYygKggracKg2ny61EBM2iZxOSgRRiqPGSAYL31Zgegv
         Y84kQwqeS8fnl0ZOCEKJvH+sD4ffEgCMcSWBoaWSC0k5TNXzIO+Gk3fBnW1YWz0q8S5X
         z7MRBh+GPCkNlGD/FrjW3iNFnMUrXDXr6lFfXydWhlzLayTNS0v8ZeHUy+0lWKztSpOY
         UHwiPXWnojPzXxCgb0sNY0ZF6XEK6eIxKpdo4XS8PPyM7JXIfwqABfrkrfjUdfebEMl2
         EjaV8pneZBon37/alI9zCGDB1z6C/1WK4II2Gp6Oe6OC7OHHbN4L0eR8rvYhSfLeCehQ
         etHA==
X-Forwarded-Encrypted: i=1; AKwUvBwHRl4pJzakTZlT+/cmJr4WJIzCgvs9A46REJcU1CksLalsQu6y1R33qrr4XQwjFA/Fu45+cSa1v2g/Pf0NRdg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrTR4iYxpwoMJTULuj9estKc2lgO8kxYsraPXgoYx+a/9mMLwj
	kLf+PDAuv7IJbsVsrnuT/1XNVnzFeDibQ3GMLGBRU+L9GCqVoiRyc9E+
X-Gm-Gg: AYBFou3MECPhvw9DaK9KnOmEMRWceUq08HC/jigKm1bopbDR0grJwweZkdoZAAYnbPf
	D8krJUUkdSYvrA+MmlJV5KOo3VpVqOhwfkKIwui5+G9BGquQ1tfZv7cqH1J5ws/h7nNLmNTkltO
	6SMCnXxrMPnhNv3ncy/gRs5CKOrpvKXL5CZ1j8Om+n/JgNvtv2GDoTHKHas7Gn0/1YAYU/6aXCF
	xHWW5B3wRmUvFDRj57re5H1PZnCjFRGZRPNZ6X4GroErCbjUAHCuFmt/2DhVQRFZUGl8LYcGuzH
	vMGLAMYNYm/oBoMt3eT4tTp0nta9PxJpR7cTG5R6CNNQ5v4XJcqzNg1rd+0XB2fK4naZoC5B3E5
	V2NU8n2QEFLvkb2exGZj/IDQiMq5HCIOcX8bhfP5GixosgdhA9RVIyP39ceNdcItweZpmlv8E9i
	GIg+nlA1w+5aJoIC+5Ri/Rqxt9JngksFHKWboShie9geSU7sZK2WaY/zIPYYNRRU5yBTEy8i/CS
	EiGG88I9f+naN03w7bUvCsqjwhw210Qe2Hu+1OmbyYHtKLEDktIZBtXCfac+K7GJFCxYS4m0yU6
	9kg/Ea8ZVxrJ61SEY3F9j1cyeJh+OqLqhk7zrsBI/LQ8pw==
X-Received: by 2002:a05:7022:b047:20b0:16d:dd5c:4261 with SMTP id a92af1059eb24-1ac5e6f4e87mr3095742c88.46.1793361223437;
        Fri, 30 Oct 2026 04:53:43 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm6437304c88.20.2026.10.30.04.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:53:42 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 30 Oct 2026 07:52:03 -0400
Subject: [PATCH bpf-next v2 18/22] bpf: Apply the patch list without a
 verifier env
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
Message-Id: <20261030-bpf-verifier-patch-batch-v2-18-55cd43439f7c@gmail.com>
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

Rewrites outside of the verifier, like the blinding of constants in
classic BPF programs, have no verifier env, and core.c is built without
the verifier as well.

bpf_patch_list_commit() needs the env for the aux data and the tables
of the verifier, so these rewrites can't use the patch list.

Add bpf_patch_list_apply(), which builds the new image of a program,
puts it in place and moves its poke descriptors and line info along.
Without the aux data and the tables of the verifier, it can't remove
instructions.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 include/linux/bpf_verifier.h |  1 +
 kernel/bpf/core.c            | 31 +++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
index 9562665757a79..b133bbaf614ac 100644
--- a/include/linux/bpf_verifier.h
+++ b/include/linux/bpf_verifier.h
@@ -1118,6 +1118,7 @@ int bpf_patch_list_build(const struct bpf_patch_list *pl, const struct bpf_prog
 			 struct bpf_patch_image *img);
 void bpf_patch_image_free(struct bpf_patch_image *img);
 void bpf_patch_image_install(struct bpf_prog *prog, const struct bpf_patch_image *img);
+struct bpf_prog *bpf_patch_list_apply(struct bpf_prog *prog, struct bpf_patch_list *pl);
 
 /* single container for all structs
  * one verifier_env per bpf_check() call
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 0447e3b4cfa48..10d2c37f81280 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -880,6 +880,37 @@ void bpf_patch_image_install(struct bpf_prog *prog, const struct bpf_patch_image
 					      prog->aux->linfo[i].insn_off);
 }
 
+/*
+ * Apply the patches queued for 'prog' without a verifier env, which can't
+ * remove insns. Return the patched program, which may have moved.
+ */
+struct bpf_prog *bpf_patch_list_apply(struct bpf_prog *prog, struct bpf_patch_list *pl)
+{
+	struct bpf_patch_image img;
+	struct bpf_prog *new;
+	int err;
+
+	if (!pl->cnt)
+		return prog;
+
+	err = bpf_patch_list_build(pl, prog, &img);
+	if (!err && WARN_ON_ONCE(img.del))
+		err = -EINVAL;
+	if (!err) {
+		new = bpf_prog_realloc(prog, bpf_prog_size(img.new_cnt), GFP_USER);
+		if (new) {
+			prog = new;
+			bpf_patch_image_install(prog, &img);
+		} else {
+			err = -ENOMEM;
+		}
+	}
+
+	bpf_patch_image_free(&img);
+	bpf_patch_list_release(pl);
+	return err ? ERR_PTR(err) : prog;
+}
+
 static void bpf_prog_kallsyms_del_subprogs(struct bpf_prog *fp)
 {
 	int i;

-- 
2.43.0

