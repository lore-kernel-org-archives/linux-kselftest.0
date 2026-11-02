Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650448;
	b=ErD5TnLGCA/7jNzhu6SI3O0OGZzEI7x11V+QxQxLOJj3Iap6u1sGKoJMZ0hcxR6kwLb8
	 oYA9NzsrfOw6VL6xCcmpAiSTwJ8gCCwmtrJAprLR4qSJxV5uHs6vKJ22eoiMOtrJhKg4R
	 qw+Q+QzFkb/c4ZLYPqpiaUwlP6w9d7T8KVBP77YVJXPV1A7p0hb4Elb/M25gZTmvJomE8
	 tlC0gWpIgmv9YRLoHRdDgZcPWOIsny9xgXiBGzGzipux7scdpE7Ex5ISMZu4y2gNkwYy5
	 tFWcExwIRtp0n2wjY3ifDNItPv67HKaxTt+jdolVHPCo8SHYerH1DS8bXOpqwe+fvlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=htn4OTSV3RXJ8bk+t/WPiEyS860b3TMcHwy5aqeFypw=;
	b=lo4IPR7IK5z4qZAD9M6rh30c7W6XOO6GwMdVZleBhKa1xcNIZF5n9qsZ0/6iD1VoILp2
	 CtMv6Hetb0M+vrF/7XlD4CbeNtOgHkRxKpISONWKCF8rmPMRfAQChuSCMS+hph7uNAlff
	 1oXJGWgANwGdFiy+I84gvB8jsXtbyeFngbpa944oT1Y/rmlCZVq5HCXnOWoxIAZx58+/Q
	 38PZenuVaSTFXvJPXg5bEyCHt8piJx5a7AfCPWI4cIovNc4S2H4/sNZRO8IGnM8hL5yA7
	 BSZRtJ5h8VKLldsaIFRr32UCdCCZBCDOmKvhdzNUncv0iOV04n5fRpOkeOphxiuB0dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cKtAcBGm;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E7D606D823
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 20:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2E7D606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cKtAcBGm
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c4be28b82so3658131f8f.2
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 12:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793650446; x=1794255246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=htn4OTSV3RXJ8bk+t/WPiEyS860b3TMcHwy5aqeFypw=;
        b=cKtAcBGmsjfzHFSxJPY8vNA2q8UutBLrzNHlisPyAMG5IEYnN/dqyc5rxHXGuZ2TEu
         Jpd6vfhZ2dkusdbt3KrcLvpVEIAdf3rZ2S0AVpICJ9MMa1fd90m45zvzPG2K2X4V08R1
         55ysxqn33RejOJCfYEttEXpdORNr9SZBvQC5fXLMPhq3dmUvTH5ER0RSG14r/gAMJWLA
         5Cx/Xi+MoJDCG/+twuyvS9Wp9c59aoupGYE7YwgItkFWyhEzw1QqCAnmnAijNmPfZtvg
         lVpwm35GADu63VU0gxOl3kAsoEIgdMpiQsa5C5Ds8U68M6J8WJeoKKCR+m+YdEQF11dG
         p7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650446; x=1794255246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=htn4OTSV3RXJ8bk+t/WPiEyS860b3TMcHwy5aqeFypw=;
        b=a2uDyOY6PpLhn0iO6k/akWlixh0Lg0U4O175CKL/y8Q1Ai/RkGMpN6zZPtGOEHsyMD
         q1hElzloFg4kxgz1pBMSF7+tMrpkzzp23740BFeVAqPqsJAiJstmNk3Hn9IIif4fO0hp
         E2gqsuc8g2/00OrGtu996kU8cJ58oeCl+tXVoABbqjWaWyROJOi/WP2AAH4mAcHUSxhf
         2FWirYpI9guoI8rMXqBHPMJTw1oqMrgkTZhEeR0Pn92Sfja9dqObou/9+2jFBc/fqsYz
         +p89gfzKCogV8KOg8/0A+GjgJ5AVCmtEabeHzIWRpP6pG3htwDwt9fuCJZq4Kp1q4mrM
         ApVw==
X-Forwarded-Encrypted: i=1; AKwUvByd4yNHTqV5V2QNE1P9OiBTkwI94YYtPwH5Wv0pnqdqOBiY06SqxmFEioBo/lJ/YPSs+OAZXXplAxJQ4VuSIak=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GQ6CtkhUvhEFxaUjWRtmyL7F2V0NnrdieSelvuGSQlGRQ6auB
	ekhxJW3fSJxd2mX7SsLUf2MNSHieWqw4SQQODeSOWh5zD4SDPqTiWq7p
X-Gm-Gg: AYBFou1toAjoWizcnC5Fuu9ZW1JKPKldCP6wejVrCbPHTCtJX0xmJIDNt9wnjz1ybEf
	6EyPfs7n5SJEK6nTmY15UGXkAA0Y8JlpzM/wtNhfLDkxa3FSfMEBKYVwYkCT/XO5dGiqGQQYx5M
	y1FlJJKv/fXVViu0xRtEFV7mexvlVVBiggypoOL1gL/fNd42F+kmMJoxuZ3bFtfp3beRfqbr29w
	FR68ikdgzvEHA5uqsG/RZsNBpE9/3FEwiUUMr1mbktg7fJHzkOWu6jUyZG7ul9NXKmQ8pYEPeB0
	EJ+Yj6rDZOervcgGm0+E3VCC4cpSbEC1sNXmsLKPvYZjNlNQ5wOXyi9/+Swz4r4cgJyCqPM0NEd
	9rGM87p4R54hjEpp8+w79mHsKbf/bWRa0gyTOk/Ao72gNUdVc2srk/TfebXOYFH/2yY5SiD5db8
	GOsboHAp+XXwFj3ArGsGPBbyBHCTtRc2N8WVkOc+JDniY9azjMcP6wFG69aigCVEG196794P+us
	vPslYQLgeJHgv7st6jAcFkNvj4b7CQRDeB85Ddcs+hnWZM42f694jEAVVJz9jGmcikfsgFaEd8a
	emS13WhbHS0Hy1n0y086XFiivHprvYvN23/s4sXJiQWMa/Ik6117CSEV3Bp7mpHNBIjwxkjEz4E
	l
X-Received: by 2002:a05:6000:26c8:b0:48d:f014:63ee with SMTP id ffacd0b85a97d-48e6e3040a3mr24120814f8f.20.1793650446073;
        Mon, 02 Nov 2026 12:14:06 -0800 (PST)
Received: from mtardy-friendly-lvh-runner.europe-west1-c.c.cilium-dev.internal ([2600:1900:4010:1a8::])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71b8c6e9sm21471805f8f.43.2026.11.02.12.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 12:14:04 -0800 (PST)
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
Subject: [PATCH bpf-next v3 4/5] bpftool: Add attach option for light skeleton generation
Date: Mon,  2 Nov 2026 20:13:55 +0000
Message-ID: <20261102201356.5798-5-mahe.tardy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102201356.5798-1-mahe.tardy@gmail.com>
References: <20261102201356.5798-1-mahe.tardy@gmail.com>
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

Add an optional attach keyword to gen skeleton when the loader backend
is selected, and pass the request through gen_loader_opts.gen_attach.

Extend the loader context to receive link FDs, using zero for empty slots.
Generate attach functions that check the returned links, and detach
functions that close and reset the FDs. Document the option and add shell
completion.

Signed-off-by: Mahe Tardy <mahe.tardy@gmail.com>
---
 .../bpf/bpftool/Documentation/bpftool-gen.rst | 11 ++-
 tools/bpf/bpftool/bash-completion/bpftool     |  2 +-
 tools/bpf/bpftool/gen.c                       | 67 +++++++++++++------
 3 files changed, 56 insertions(+), 24 deletions(-)

diff --git a/tools/bpf/bpftool/Documentation/bpftool-gen.rst b/tools/bpf/bpftool/Documentation/bpftool-gen.rst
index d0a36f442db7..4bf8b0b99ea2 100644
--- a/tools/bpf/bpftool/Documentation/bpftool-gen.rst
+++ b/tools/bpf/bpftool/Documentation/bpftool-gen.rst
@@ -24,7 +24,7 @@ GEN COMMANDS
 =============

 | **bpftool** **gen object** *OUTPUT_FILE* *INPUT_FILE* [*INPUT_FILE*...]
-| **bpftool** **gen skeleton** *FILE* [**name** *OBJECT_NAME*]
+| **bpftool** **gen skeleton** *FILE* [**name** *OBJECT_NAME*] [**attach**]
 | **bpftool** **gen subskeleton** *FILE* [**name** *OBJECT_NAME*]
 | **bpftool** **gen min_core_btf** *INPUT* *OUTPUT* *OBJECT* [*OBJECT*...]
 | **bpftool** **gen help**
@@ -51,6 +51,15 @@ bpftool gen object *OUTPUT_FILE* *INPUT_FILE* [*INPUT_FILE*...]
 bpftool gen skeleton *FILE*
     Generate BPF skeleton C header file for a given *FILE*.

+    With **-L**, **attach** requests attachment during execution of the
+    generated loader. Supported programs are ordinary LSM programs and
+    BTF-based tracing programs using **fentry**, **fexit**, **fmod_ret**, or
+    **tp_btf** sections, with kernel targets resolved during loading.
+    The generated **__load()** function loads and attaches the programs;
+    **__attach()** checks that the links exist, and **__detach()** closes them.
+    Reattaching after detachment is not supported in this mode. Without
+    **attach**, loading and attachment remain separate operations.
+
     BPF skeleton is an alternative interface to existing libbpf APIs for
     working with BPF objects. Skeleton code is intended to significantly
     shorten and simplify code to load and work with BPF programs from userspace
diff --git a/tools/bpf/bpftool/bash-completion/bpftool b/tools/bpf/bpftool/bash-completion/bpftool
index a28af31937ad..9247a9fdcaef 100644
--- a/tools/bpf/bpftool/bash-completion/bpftool
+++ b/tools/bpf/bpftool/bash-completion/bpftool
@@ -1021,7 +1021,7 @@ _bpftool()
                             return 0
                             ;;
                         *)
-                            _bpftool_once_attr 'name'
+                            _bpftool_once_attr 'name attach'
                             return 0
                             ;;
                     esac
diff --git a/tools/bpf/bpftool/gen.c b/tools/bpf/bpftool/gen.c
index ee680f7c2116..62e21bd773ff 100644
--- a/tools/bpf/bpftool/gen.c
+++ b/tools/bpf/bpftool/gen.c
@@ -566,7 +566,8 @@ static void codegen_asserts(struct bpf_object *obj, const char *obj_name)
 		");
 }

-static void codegen_attach_detach(struct bpf_object *obj, const char *obj_name)
+static void codegen_attach_detach(struct bpf_object *obj, const char *obj_name,
+				 bool gen_attach)
 {
 	struct bpf_program *prog;

@@ -582,21 +583,30 @@ static void codegen_attach_detach(struct bpf_object *obj, const char *obj_name)
 				int prog_fd = skel->progs.%2$s.prog_fd;		    \n\
 			", obj_name, bpf_program__name(prog));

-		switch (bpf_program__type(prog)) {
-		case BPF_PROG_TYPE_RAW_TRACEPOINT:
-			tp_name = strchr(bpf_program__section_name(prog), '/') + 1;
-			printf("\tint fd = skel_raw_tracepoint_open(\"%s\", prog_fd);\n", tp_name);
-			break;
-		case BPF_PROG_TYPE_TRACING:
-		case BPF_PROG_TYPE_LSM:
-			if (bpf_program__expected_attach_type(prog) == BPF_TRACE_ITER)
-				printf("\tint fd = skel_link_create(prog_fd, 0, BPF_TRACE_ITER);\n");
+		if (gen_attach) {
+			if (bpf_program__autoload(prog) && bpf_program__autoattach(prog))
+				printf("\tint fd = ((void)prog_fd, skel->links.%s_fd <= 0 ? -ENOLINK : 0);\n",
+				       bpf_program__name(prog));
 			else
-				printf("\tint fd = skel_raw_tracepoint_open(NULL, prog_fd);\n");
-			break;
-		default:
-			printf("\tint fd = ((void)prog_fd, 0); /* auto-attach not supported */\n");
-			break;
+				printf("\tint fd = ((void)prog_fd, 0);\n");
+		} else {
+			switch (bpf_program__type(prog)) {
+			case BPF_PROG_TYPE_RAW_TRACEPOINT:
+				tp_name = strchr(bpf_program__section_name(prog), '/') + 1;
+				printf("\tint fd = skel_raw_tracepoint_open(\"%s\", prog_fd);\n",
+				       tp_name);
+				break;
+			case BPF_PROG_TYPE_TRACING:
+			case BPF_PROG_TYPE_LSM:
+				if (bpf_program__expected_attach_type(prog) == BPF_TRACE_ITER)
+					printf("\tint fd = skel_link_create(prog_fd, 0, BPF_TRACE_ITER);\n");
+				else
+					printf("\tint fd = skel_raw_tracepoint_open(NULL, prog_fd);\n");
+				break;
+			default:
+				printf("\tint fd = ((void)prog_fd, 0); /* auto-attach not supported */\n");
+				break;
+			}
 		}
 		codegen("\
 			\n\
@@ -640,6 +650,8 @@ static void codegen_attach_detach(struct bpf_object *obj, const char *obj_name)
 			\n\
 				skel_closenz(skel->links.%1$s_fd);	    \n\
 			", bpf_program__name(prog));
+		if (gen_attach)
+			printf("\tskel->links.%s_fd = 0;\n", bpf_program__name(prog));
 	}

 	codegen("\
@@ -691,7 +703,8 @@ static void codegen_destroy(struct bpf_object *obj, const char *obj_name)
 		obj_name);
 }

-static int gen_trace(struct bpf_object *obj, const char *obj_name, const char *header_guard)
+static int gen_trace(struct bpf_object *obj, const char *obj_name, const char *header_guard,
+		     bool gen_attach)
 {
 	DECLARE_LIBBPF_OPTS(gen_loader_opts, opts);
 	struct bpf_load_and_run_opts sopts = {};
@@ -702,6 +715,7 @@ static int gen_trace(struct bpf_object *obj, const char *obj_name, const char *h
 	char ident[256];
 	int err = 0;

+	opts.gen_attach = gen_attach;
 	if (sign_progs)
 		opts.gen_hash = true;

@@ -726,7 +740,7 @@ static int gen_trace(struct bpf_object *obj, const char *obj_name, const char *h
 		", obj_name);


-	codegen_attach_detach(obj, obj_name);
+	codegen_attach_detach(obj, obj_name, gen_attach);

 	codegen_destroy(obj, obj_name);

@@ -743,6 +757,8 @@ static int gen_trace(struct bpf_object *obj, const char *obj_name, const char *h
 			skel->ctx.sz = (char *)&skel->links - (char *)skel; \n\
 		",
 		obj_name, opts.data_sz);
+	if (gen_attach)
+		printf("\tskel->ctx.sz += sizeof(skel->links);\n");
 	bpf_object__for_each_map(map, obj) {
 		const void *mmap_data = NULL;
 		size_t mmap_size = 0;
@@ -1249,6 +1265,7 @@ static int do_skeleton(int argc, char **argv)
 	struct bpf_map *map;
 	struct btf *btf;
 	struct stat st;
+	bool gen_attach = false;

 	if (!REQ_ARGS(1)) {
 		usage();
@@ -1257,10 +1274,9 @@ static int do_skeleton(int argc, char **argv)
 	file = GET_ARG();

 	while (argc) {
-		if (!REQ_ARGS(2))
-			return -1;
-
 		if (is_prefix(*argv, "name")) {
+			if (!REQ_ARGS(2))
+				return -1;
 			NEXT_ARG();

 			if (obj_name[0] != '\0') {
@@ -1270,6 +1286,8 @@ static int do_skeleton(int argc, char **argv)

 			strncpy(obj_name, *argv, MAX_OBJ_NAME_LEN - 1);
 			obj_name[MAX_OBJ_NAME_LEN - 1] = '\0';
+		} else if (is_prefix(*argv, "attach")) {
+			gen_attach = true;
 		} else {
 			p_err("unknown arg %s", *argv);
 			return -1;
@@ -1278,6 +1296,11 @@ static int do_skeleton(int argc, char **argv)
 		NEXT_ARG();
 	}

+	if (gen_attach && !use_loader) {
+		p_err("attach requires a light skeleton (-L)");
+		return -1;
+	}
+
 	if (argc) {
 		p_err("extra unknown arguments");
 		return -1;
@@ -1441,7 +1464,7 @@ static int do_skeleton(int argc, char **argv)
 			goto out;
 	}
 	if (use_loader) {
-		err = gen_trace(obj, obj_name, header_guard);
+		err = gen_trace(obj, obj_name, header_guard, gen_attach);
 		goto out;
 	}

@@ -2005,7 +2028,7 @@ static int do_help(int argc, char **argv)

 	fprintf(stderr,
 		"Usage: %1$s %2$s object OUTPUT_FILE INPUT_FILE [INPUT_FILE...]\n"
-		"       %1$s %2$s skeleton FILE [name OBJECT_NAME]\n"
+		"       %1$s %2$s skeleton FILE [name OBJECT_NAME] [attach]\n"
 		"       %1$s %2$s subskeleton FILE [name OBJECT_NAME]\n"
 		"       %1$s %2$s min_core_btf INPUT OUTPUT OBJECT [OBJECT...]\n"
 		"       %1$s %2$s help\n"
--
2.43.0

