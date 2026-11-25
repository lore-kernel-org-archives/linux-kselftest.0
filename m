Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567771;
	b=eKaq4xnN5eGnc7kDpsUhA+4XPHBMBWBcQZ3yeWcC9x1lF7rW8V+jI+o0/2Awz9I/0Hf6
	 2EUhObZ0rtaLDLp4D3/edXx20pY3VoAv6G929TQSjhuOfYtTBnvzWgK/kZ1iy5tPUNvPz
	 fXMBwWNhyYcMDfFd4ec8umrePv1d7C6jVD7XFGDNVqdm2jeFzIPl2VpD55M1TvM6TgIjV
	 w4c30cilZEgeJkV4m80NzZ7/NPwazHjjOpr8yTztFd3YXibXLNTUkKZgCX617Vi0nj8sa
	 QAYT/mTiBRyIrsDjFMGdXuQk6JTwXG05Q8GaVlUhrYg6GGPn1PwZt6G9fPUzPcN6CqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=w4G6B/mWI8ZgGjP7I6YiDnRtvuJFbnGKluXV1rpIeDM=;
	b=n+GbgOBShTAuh7R3/nys9j4kJw0miKUk/H/L2tbdJwlEzn3nAiZELbpM3vI1LoY3weG4
	 Mjdwm3lbi0VuPPezg0YL+07FQe6kNoGuNBboAKskG8DB3coGS2tPB7A2k8YHgqYnkbV6p
	 kTDWY0/lCnwZqjkgn8rQzaUhE69rlICmRwfDjDGBk/l6phaRHdKWKvI26fV1B070y16Pb
	 /wihLgXrL/hRHog7p+M7bNBblsLDKOcmQW9bId9x5RTFob8k5YwjzdMjKUqJrTwNH08FL
	 Zth9ndDdjsmivVMRZe397EG5SX1F0gceITFfL/lw1IDPiOhHrWan66gTAsABPoR/DEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tweek.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nn5h1eRG;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC99606A321
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 00:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EC99606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tweek.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nn5h1eRG
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3f3e256e8so5150489a91.2
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 16:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795567771; x=1796172571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w4G6B/mWI8ZgGjP7I6YiDnRtvuJFbnGKluXV1rpIeDM=;
        b=nn5h1eRGLtxPOcN5k4oLp9qqvVxxH2lE8gQ7wPFy4GwFBeSb/fR1oYt0oEEq25qzmy
         36ZdCAa7QEX4TnQRyVjjxFYCpFv7e8LVZbp84rEQ6k2M+vdexXSP62ASoTsapfHiKYNa
         t8ErZuXKt4tH8yd247vS4EXlHDAr4tL/9NILpe9/N0ybMYAxQJKg725MM75wG3URbaiM
         Ia1E4WorVH93DpbENZm0X9kGfkSk1Ovm+rDtjF0GxPDE3ZLwBCW4jGVgH9E5B1gZ/Kua
         UZ5P2dEqfvDB+XtfUytFXi9QJR8ny26lCx3fY5/NpvGKf5ZnUCPcuifWTGJ2fYWTLF9d
         W56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567771; x=1796172571;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w4G6B/mWI8ZgGjP7I6YiDnRtvuJFbnGKluXV1rpIeDM=;
        b=OvYdRXYWVrKQIqzKBg3eBDVAssxFCJUUCLpt1xomOfF8QUd70JREkGkjjfdCvV7Wgk
         nD1H9v6nF7OCm/JwetJtc3SOZP5ab2Y46hdDVfCd+tDNLmvM7+rd8XCZTyY/KQyoSt04
         Enfs0nU14DmD2RZjDHxCh5Ufl0GWDbflMyvzVFKkEc5Yx53LIB5nGPUplJQ5UCrbBoRo
         fVGuDhwueFO69/vGsJCOPmW1hXInxeaGsvl5EukVNHluY7wGGOBW6rUonsYeNKuIHXNY
         KbpIykiC9CUZNEEtJDrIe3+XiqMNksyLSIaKys94sfLcesSTnvyxneTc7KwXp8MxTSUy
         cZeQ==
X-Forwarded-Encrypted: i=1; AL+hErELD/tZH3jDE7SIOTPsSaZGL1AQmu7RyUCGPVIQEjYAx+Rq9E3Rft95/uZbc21biROag/au0zODgpntv8QaDcA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wgIqCdePkR2xGWOi4QtrTIiutPti7KzNRQWRKP3oj6RHlBxRZ
	XkqhcsVCfw5LMFODE+om93FpN1nT5/3uMXvqGoRbgGUwzafELq4rTfVhnkRwkHG4fU7d5YNvjLZ
	oKQ==
X-Received: from pjbgw3.prod.google.com ([2002:a17:90b:a43:b0:3b4:861e:fb4])
 (user=tweek job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:388c:b0:3b4:1877:8d35
 with SMTP id 98e67ed59e1d1-3b41c975320mr15803838a91.52.1795567770325; Tue, 24
 Nov 2026 16:49:30 -0800 (PST)
Date: Wed, 25 Nov 2026 11:49:10 +1100
In-Reply-To: <20261125004911.3937193-1-tweek@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125004911.3937193-1-tweek@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125004911.3937193-3-tweek@google.com>
Subject: [PATCH bpf 2/3] bpftool: Reject non-autoload programs for light skeletons
From: "=?UTF-8?q?Thi=C3=A9baud=20Weksteen?=" <tweek@google.com>
To: Quentin Monnet <qmo@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Leon Hwang <leon.hwang@linux.dev>
Cc: "=?UTF-8?q?Thi=C3=A9baud=20Weksteen?=" <tweek@google.com>, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Sid Nayyar <sidnayyar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

When generating a light skeleton (bpftool gen skeleton -L), there is no
libbpf runtime object or bpf_program__set_autoload() API available to
enable or disable program autoloading. If a BPF program in the object
has autoload disabled (e.g. via SEC("?...")), bpf_object__load()
silently skips loading it, while bpftool still emits struct
bpf_prog_desc fields and attach/detach/destroy helpers for all programs.
As a result, the loader program writes subsequent program FDs into
preceding skeleton struct fields and leaves trailing prog_fd fields
unpopulated (0).

Move bpf_object__gen_loader() and bpf_object__load() out of gen_trace()
into do_skeleton() before validating programs and emitting skeleton
struct definitions, so that any autoload state adjustments performed
during bpf_object__load() (e.g. for struct_ops programs) are observed
and no partial header is emitted on error. Explicitly reject any
non-autoload program when use_loader is true with an error message, and
document this restriction in bpftool-gen.rst.

Fixes: d510296d331a ("bpftool: Use syscall/loader program in "prog load" an=
d "gen skeleton" command.")
Signed-off-by: Thi=C3=A9baud Weksteen <tweek@google.com>
---
 .../bpf/bpftool/Documentation/bpftool-gen.rst |  4 +-
 tools/bpf/bpftool/gen.c                       | 68 +++++++++++--------
 2 files changed, 44 insertions(+), 28 deletions(-)

diff --git a/tools/bpf/bpftool/Documentation/bpftool-gen.rst b/tools/bpf/bp=
ftool/Documentation/bpftool-gen.rst
index d0a36f442db7..18106dcdd352 100644
--- a/tools/bpf/bpftool/Documentation/bpftool-gen.rst
+++ b/tools/bpf/bpftool/Documentation/bpftool-gen.rst
@@ -184,7 +184,9 @@ OPTIONS
 -L, --use-loader
     For skeletons, generate a "light" skeleton (also known as "loader"
     skeleton). A light skeleton contains a loader eBPF program. It does no=
t use
-    the majority of the libbpf infrastructure, and does not need libelf.
+    the majority of the libbpf infrastructure, and does not need libelf. B=
PF
+    programs marked as non-autoload (e.g., via **SEC("?...")**) are not
+    supported for light skeletons and will cause skeleton generation to fa=
il.
=20
 -S, --sign
     For skeletons, generate a signed skeleton. This option must be used wi=
th
diff --git a/tools/bpf/bpftool/gen.c b/tools/bpf/bpftool/gen.c
index ee680f7c2116..edb6f7ef508e 100644
--- a/tools/bpf/bpftool/gen.c
+++ b/tools/bpf/bpftool/gen.c
@@ -691,9 +691,10 @@ static void codegen_destroy(struct bpf_object *obj, co=
nst char *obj_name)
 		obj_name);
 }
=20
-static int gen_trace(struct bpf_object *obj, const char *obj_name, const c=
har *header_guard)
+static int gen_trace(struct bpf_object *obj, const char *obj_name,
+		     const char *header_guard,
+		     const struct gen_loader_opts *opts)
 {
-	DECLARE_LIBBPF_OPTS(gen_loader_opts, opts);
 	struct bpf_load_and_run_opts sopts =3D {};
 	char sig_buf[MAX_SIG_SIZE];
 	__u8 prog_sha[SHA256_DIGEST_LENGTH];
@@ -702,23 +703,6 @@ static int gen_trace(struct bpf_object *obj, const cha=
r *obj_name, const char *h
 	char ident[256];
 	int err =3D 0;
=20
-	if (sign_progs)
-		opts.gen_hash =3D true;
-
-	err =3D bpf_object__gen_loader(obj, &opts);
-	if (err)
-		return err;
-
-	err =3D bpf_object__load(obj);
-	if (err) {
-		p_err("failed to load object file");
-		goto out;
-	}
-
-	/* If there was no error during load then gen_loader_opts
-	 * are populated with the loader program.
-	 */
-
 	/* finish generating 'struct skel' */
 	codegen("\
 		\n\
@@ -742,7 +726,7 @@ static int gen_trace(struct bpf_object *obj, const char=
 *obj_name, const char *h
 				goto cleanup;				    \n\
 			skel->ctx.sz =3D (char *)&skel->links - (char *)skel; \n\
 		",
-		obj_name, opts.data_sz);
+		obj_name, opts->data_sz);
 	bpf_object__for_each_map(map, obj) {
 		const void *mmap_data =3D NULL;
 		size_t mmap_size =3D 0;
@@ -785,22 +769,22 @@ static int gen_trace(struct bpf_object *obj, const ch=
ar *obj_name, const char *h
 			static const char opts_data[] __attribute__((__aligned__(8))) =3D \"\\\=
n\
 		",
 		obj_name);
-	print_hex(opts.data, opts.data_sz);
+	print_hex(opts->data, opts->data_sz);
 	codegen("\
 		\n\
 		\";							    \n\
 			static const char opts_insn[] __attribute__((__aligned__(8))) =3D \"\\\=
n\
 		");
-	print_hex(opts.insns, opts.insns_sz);
+	print_hex(opts->insns, opts->insns_sz);
 	codegen("\
 		\n\
 		\";\n");
=20
 	if (sign_progs) {
-		sopts.insns =3D opts.insns;
-		sopts.insns_sz =3D opts.insns_sz;
-		sopts.data =3D opts.data;
-		sopts.data_sz =3D opts.data_sz;
+		sopts.insns =3D opts->insns;
+		sopts.insns_sz =3D opts->insns_sz;
+		sopts.data =3D opts->data;
+		sopts.data_sz =3D opts->data_sz;
 		sopts.excl_prog_hash =3D prog_sha;
 		sopts.excl_prog_hash_sz =3D sizeof(prog_sha);
 		sopts.signature =3D sig_buf;
@@ -1240,6 +1224,7 @@ static int do_skeleton(int argc, char **argv)
 	char header_guard[MAX_OBJ_NAME_LEN + sizeof("__SKEL_H__")];
 	size_t map_cnt =3D 0, prog_cnt =3D 0, attach_map_cnt =3D 0, file_sz, mmap=
_sz;
 	DECLARE_LIBBPF_OPTS(bpf_object_open_opts, opts);
+	DECLARE_LIBBPF_OPTS(gen_loader_opts, gen_opts);
 	char obj_name[MAX_OBJ_NAME_LEN] =3D "", *obj_data;
 	struct bpf_object *obj =3D NULL;
 	const char *file;
@@ -1316,6 +1301,29 @@ static int do_skeleton(int argc, char **argv)
 		goto out_obj;
 	}
=20
+	/* If we are generating a loader, load the object early (before
+	 * validating programs and emitting skeleton struct definitions), as
+	 * bpf_object__load() may update a program's autoload status (e.g.
+	 * for struct_ops programs).
+	 */
+	if (use_loader) {
+		if (sign_progs)
+			gen_opts.gen_hash =3D true;
+
+		err =3D bpf_object__gen_loader(obj, &gen_opts);
+		if (err)
+			goto out;
+
+		err =3D bpf_object__load(obj);
+		if (err) {
+			p_err("failed to load object file");
+			goto out;
+		}
+		/* If there was no error during load, gen_opts is populated with
+		 * the loader program.
+		 */
+	}
+
 	bpf_object__for_each_map(map, obj) {
 		if (!get_map_ident(map, ident, sizeof(ident))) {
 			p_err("ignoring unrecognized internal map '%s'...",
@@ -1329,6 +1337,12 @@ static int do_skeleton(int argc, char **argv)
 		map_cnt++;
 	}
 	bpf_object__for_each_program(prog, obj) {
+		if (use_loader && !bpf_program__autoload(prog)) {
+			p_err("program '%s' is marked as non-autoload, which is not supported f=
or light skeletons",
+			      bpf_program__name(prog));
+			err =3D -1;
+			goto out;
+		}
 		prog_cnt++;
 	}
=20
@@ -1441,7 +1455,7 @@ static int do_skeleton(int argc, char **argv)
 			goto out;
 	}
 	if (use_loader) {
-		err =3D gen_trace(obj, obj_name, header_guard);
+		err =3D gen_trace(obj, obj_name, header_guard, &gen_opts);
 		goto out;
 	}
=20
--=20
2.56.1.831.g720f3f5937-goog

