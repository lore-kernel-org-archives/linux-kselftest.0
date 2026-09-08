Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA78E39AD5E
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 06:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788850545; cv=none; b=kMVCQdalTv85Giw3Z6kArkzcNTKv7IJ8XM9a6C0URW2DHtA143g1b9o45NcHa+yHiP8wO5tgrzxj7lUttIZn137MpUoMCiol5VgVmoavccYPe3e7SrHc0DQ6lWmX0i0PpEKDP8yb9X40C02y/9XsFVFTbSu3BmlpLu97FTwNm4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788850545; c=relaxed/simple;
	bh=LHPzAlc8bILs7jY8teDdNipJXPplhcsjWjskBzf2tiI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=JQ67wyv1O///TyqnVZ+EciGkwey04vITOh0VcUsxMTTusot+dUa2q2bVUoG+2NYFfNoEUJwUxvdcKHOhGyEB8sik/UKPYo1n19P9i4bARM9En4Qzd7JJMbuN01PybckhrjUQ60XNNTn2M+wknWiD8cZO9k5IFu/PEk8qX1K6jf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tweek.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eQ51Qgxa; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tweek.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eQ51Qgxa"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86261e66700so467690b3a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 23:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788850543; x=1789455343; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jmwDSdN5PavmzgFMeFCPPTTofQkLr1hsp/PukBG6zPM=;
        b=eQ51QgxaT5FIh0+g6UOcTTiS2RWsr++CSD5Sj+xgYvCNMgJyq6n+bGeyr8+BTI72kT
         vyTkWx1ZLvGxSdM1vPyWj/nkoJ4GFSdFBW5OyDx1TwSBdXYpXBG/U4yS1sssszvIJO7/
         2As8MMF/UR6pmUInJ45w4yT42s+7wfMHkBLn+1QDpvFHuuyLfTkRLco8xYyYHZAXy+Hy
         fXMSu/fklhqb4KCjE4EdSaTK74OWtKAPCz46y3+cmYwOJVFGKRrhBIGdsQc7bomB9AhE
         OtTyOKANsHVTZvRPbjUGJVfO/yKcteUJmtnkJ/tO38FN4Sgelii/m+XPEZCEG9IadJdX
         W4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788850543; x=1789455343;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jmwDSdN5PavmzgFMeFCPPTTofQkLr1hsp/PukBG6zPM=;
        b=Ytv57U/IN8bMbrag6fwxFWm9wwCTJTGb7zIz3UN/u8p86UJCVEYx0GRND2/7XfRljN
         MTgz866bPyuJbU9BZnM6CvteZTpC8tu1U3YIV83RD6PlJluNGRjtNdHrAKRwUGoCHdRH
         KqWj9NeAUXCnC//kxEBMKBDOf84Dl3z5ggEYtJYwD6YMfvqXO6/FH5TVucJWLKf4w2U7
         fxPOwgq4pZa76Ifp5d74CDcMWumSgc/XvhchJw7A+pM2DIXZQGHV862tNuKfWWln6OXa
         zwUJa7bJ0D2tBtBioh+MZ/huv/VSbFCkKGdUmcxAaEd+0xpyzht93Y+ymmmRfwzwzW5D
         f25g==
X-Forwarded-Encrypted: i=1; AKwUvBzX+DvuWN3sJ0/W8dHf+KT5cCuJmdHUaZkKkyolksp9Y8+w31GtyE43f4bJwnHIbzuni36bE9swjA++EXH9xF4=@vger.kernel.org
X-Gm-Message-State: AFuF++mkC8DC3QiRX+R/uzAxw3a9hTw4yEa/4+3sLo5Lm4hK9P/hrODu
	fKg47mumijMG3qRfmc56lmKH4Sz6v+xQFE/lwXav/u2YPQ98pZ47OjS3yVivptcrvS2RQIYkeE7
	Brw==
X-Received: from pfbgp6.prod.google.com ([2002:a05:6a00:3b86:b0:853:2b6c:80e0])
 (user=tweek job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:338d:b0:857:73e2:9104
 with SMTP id d2e1a72fcca58-8616be5fd03mr37247434b3a.20.1788850542626; Mon, 07
 Sep 2026 23:55:42 -0700 (PDT)
Date: Tue,  8 Sep 2026 16:55:28 +1000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260908065529.901593-1-tweek@google.com>
Subject: [PATCH bpf-next 1/2] bpftool: Skip non-autoload programs when
 generating light skeletons
From: "=?UTF-8?q?Thi=C3=A9baud=20Weksteen?=" <tweek@google.com>
To: Quentin Monnet <qmo@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	"=?UTF-8?q?Thi=C3=A9baud=20Weksteen?=" <tweek@google.com>, KP Singh <kpsingh@kernel.org>, Leon Hwang <leon.hwang@linux.dev>, 
	Emil Tsalapatis <emil@etsalapatis.com>
Cc: Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

When generating a light skeleton (bpftool gen skeleton -L),
bpf_object__load() skips loading programs marked as non-autoload (e.g.
SEC("?...")), so the generated loader program only records and populates
file descriptors for autoloaded programs.

Previously, bpftool emitted struct bpf_prog_desc fields, link fields,
and attach/detach/destroy functions for all programs in the BPF object,
causing the loader program to store subsequent program FDs into
incorrect skeleton struct fields when non-autoload programs were
present.

Skip programs with !bpf_program__autoload(prog) when counting programs
and generating progs/links struct fields as well as attach, detach, and
destroy functions for light skeletons.

Fixes: d510296d331a ("bpftool: Use syscall/loader program in "prog load" an=
d "gen skeleton" command.")
Signed-off-by: Thi=C3=A9baud Weksteen <tweek@google.com>
---
 tools/bpf/bpftool/Documentation/bpftool-gen.rst |  4 +++-
 tools/bpf/bpftool/gen.c                         | 15 +++++++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/tools/bpf/bpftool/Documentation/bpftool-gen.rst b/tools/bpf/bp=
ftool/Documentation/bpftool-gen.rst
index d0a36f442db7..1cdecf3e4fa5 100644
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
+    programs marked as non-autoload (e.g., via **SEC("?...")**) are skippe=
d and
+    not included in the generated skeleton.
=20
 -S, --sign
     For skeletons, generate a signed skeleton. This option must be used wi=
th
diff --git a/tools/bpf/bpftool/gen.c b/tools/bpf/bpftool/gen.c
index a50540ef6521..0fcfe20ff515 100644
--- a/tools/bpf/bpftool/gen.c
+++ b/tools/bpf/bpftool/gen.c
@@ -583,6 +583,9 @@ static void codegen_attach_detach(struct bpf_object *ob=
j, const char *obj_name)
 	bpf_object__for_each_program(prog, obj) {
 		const char *tp_name;
=20
+		if (!bpf_program__autoload(prog))
+			continue;
+
 		codegen("\
 			\n\
 			\n\
@@ -629,6 +632,8 @@ static void codegen_attach_detach(struct bpf_object *ob=
j, const char *obj_name)
 		", obj_name);
=20
 	bpf_object__for_each_program(prog, obj) {
+		if (!bpf_program__autoload(prog))
+			continue;
 		codegen("\
 			\n\
 				ret =3D ret < 0 ? ret : %1$s__%2$s__attach(skel);   \n\
@@ -646,6 +651,8 @@ static void codegen_attach_detach(struct bpf_object *ob=
j, const char *obj_name)
 		", obj_name);
=20
 	bpf_object__for_each_program(prog, obj) {
+		if (!bpf_program__autoload(prog))
+			continue;
 		codegen("\
 			\n\
 				skel_closenz(skel->links.%1$s_fd);	    \n\
@@ -676,6 +683,8 @@ static void codegen_destroy(struct bpf_object *obj, con=
st char *obj_name)
 		obj_name);
=20
 	bpf_object__for_each_program(prog, obj) {
+		if (!bpf_program__autoload(prog))
+			continue;
 		codegen("\
 			\n\
 				skel_closenz(skel->progs.%1$s.prog_fd);	    \n\
@@ -1339,6 +1348,8 @@ static int do_skeleton(int argc, char **argv)
 		map_cnt++;
 	}
 	bpf_object__for_each_program(prog, obj) {
+		if (use_loader && !bpf_program__autoload(prog))
+			continue;
 		prog_cnt++;
 	}
=20
@@ -1402,6 +1413,8 @@ static int do_skeleton(int argc, char **argv)
 	if (prog_cnt) {
 		printf("\tstruct {\n");
 		bpf_object__for_each_program(prog, obj) {
+			if (use_loader && !bpf_program__autoload(prog))
+				continue;
 			if (use_loader)
 				printf("\t\tstruct bpf_prog_desc %s;\n",
 				       bpf_program__name(prog));
@@ -1415,6 +1428,8 @@ static int do_skeleton(int argc, char **argv)
 	if (prog_cnt + attach_map_cnt) {
 		printf("\tstruct {\n");
 		bpf_object__for_each_program(prog, obj) {
+			if (use_loader && !bpf_program__autoload(prog))
+				continue;
 			if (use_loader)
 				printf("\t\tint %s_fd;\n",
 				       bpf_program__name(prog));
--=20
2.55.0.979.g7e5102b832-goog

