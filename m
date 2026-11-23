Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795409862;
	b=v2Jv6JWBqurqtJlUnSXNFKOQwitP/gRqNfNjhZgfkkUs/vGqW4Q9TCrJZyLLyuJnMPiR
	 IZzOUpDJRu2OYe3Y0AI1xgTZ+772otvPXTkb7HtAKkAi0zX9uwnhmqi1Jjm24xAAG9vxl
	 3B+Qdn7+KSnRHHmBESJzwgZvCQvVYRr5qAbtZ4gbkHpAvut4/CBLNTH+Yy6aPlvWB6Ray
	 U3dvpmZr9nRkC+ltheaeDi9/6Vbps/FYtfrRitc7Ls6yHubocKfF6c7+WgrjUJiEOGE2S
	 8fGl684VVLdqV2Ge/WvnAzSRz91cZSYQWtfhiDevDlpFhMiMOqI2o+yCyZVK5lKsEtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=d2RCGmDzrb5brbldUzpcvvEwJ92ts5K49mJH6OL4I80=;
	b=x0lfirEQLlOKY0TWi1sHy0TArPhxlpoN5ZERMXa61wyXvHXCnIRltsktuQYkWwev9Ecf
	 2FpyeFhfDui+QO/dDUarcrZv93XtQpoQgGzc4Gvh5nEOUMHb0hqRx56LQlMvjMW02uhkq
	 x58U+tUyQII/kbBo4Bh585gl4SQhtrN0GO0VuNm6+7ze/V2g9/jyaUKLGwVGhUR0Vz2gl
	 xQx/b9kt95MZ3KX6RhtlI8uWBQRPQ8tKfcBOKAzI8YSHuK26f3FHjaDQqDusfnaM/GyTS
	 odsJ0oN8x50nVGfO6oyU9UxDNn0brS93FxDA2Sx+/IFz+kpNX89sJRPQDyR/DjenCEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tweek.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Dpl/krmu";
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3E6606A31E
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 04:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF3E6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tweek.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Dpl/krmu
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a079256596so2083838b3a.0
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 20:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795409861; x=1796014661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d2RCGmDzrb5brbldUzpcvvEwJ92ts5K49mJH6OL4I80=;
        b=Dpl/krmumFWDZ8weJNtsc7VFttCu8/mywfOPbRZVNXnUX71YB63uuDbHO74K4ys2fa
         KuIA5+12ye35M9QY1u+YFLtdZzN9Iu3tnMnXeZRgosaytOxo1EfWlf9sGdVLnwn6+WKq
         Od5TaVgOdrxKOcVHPLxwVjRf+2sRTFESFJwlH4WthMcwgjdSdbbHXF21IJCailRQB6a7
         8VNBc+59Rc99Z0pUDUr5tJ6Ialg25li4avNJy9mQCmMPAFjLKdNe0Z+Vq2ZkiP/x3/AL
         0R+tFXzaXIcijylYk2wbQCrBcj8fwKgnwGAVz4wWHCdl1U/obHWLPpGIkSvhBiuGgkiG
         4hqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795409861; x=1796014661;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d2RCGmDzrb5brbldUzpcvvEwJ92ts5K49mJH6OL4I80=;
        b=00ZdCFLXu07yIrekclDMn6iHYOWhKceAnR8JCE6ucV+FaSZTZ6Suf4k02VwfVV65Cs
         e1ZKfUFWuyUD6FRxwApS5cg7BL8vGxgabzTr9p2TprzZwzCv8wTkrutpfnBNDzipXJJ+
         sr8gPx1O5R4oArTZqjPl2Xs6b1Nj+Ehp4ok230m6odighw5edQp3k63wq/rdDZaNEVi/
         2CgYQHjqgEYj30R3fWoB/0b1vQY4BKQUGH5by/3g3v/2An9RoVqqYUGQrA1f7wPJE3g6
         QZtk1NWoOkNC9O0+PsjnHoZSbJQyRld+IoE3V5VPlsJiXMhAiAV9gLpgOgLFxAIvD+iK
         w9rg==
X-Forwarded-Encrypted: i=1; AL+hErGh3PYt1gaBusKFW31F2qozVzMMRaBRa7VGDorlGd3fqRsW9dn3iCcOdKVU9gyKJG2vPvB8+lt6hYzTzA9urWk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SlCj7CxjpJdqZ2rTmPNUKsbjZITtdaq0QpDXsCWNApD0fjHwT
	/Fio/NypEmjSdGnWi3JxbKOFASVEAQoP0reZ3J+NqLMEgj4SgsbjbGONtFZiJfMBTnvSi/b3Y54
	zdQ==
X-Received: from pfud19.prod.google.com ([2002:a05:6a00:10d3:b0:88c:e369:e5a4])
 (user=tweek job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:c791:b0:3fa:162b:d209
 with SMTP id adf61e73a8af0-4014ae820a3mr9794641637.15.1795409860920; Sun, 22
 Nov 2026 20:57:40 -0800 (PST)
Date: Mon, 23 Nov 2026 15:57:29 +1100
In-Reply-To: <20261123045730.1960346-1-tweek@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123045730.1960346-1-tweek@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123045730.1960346-2-tweek@google.com>
Subject: [PATCH bpf 1/2] libbpf: Skip BPF token preparation when generating loader
From: "=?UTF-8?q?Thi=C3=A9baud=20Weksteen?=" <tweek@google.com>
To: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: "=?UTF-8?q?Thi=C3=A9baud=20Weksteen?=" <tweek@google.com>, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Sid Nayyar <sidnayyar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

When obj->gen_loader is set, libbpf emits loader instructions instead of
issuing BPF syscalls on the host. Every other kernel-interaction step in
bpf_object_prepare() (such as bpf_object__probe_loading() and
bpf_object__load_vmlinux_btf()) already short-circuits on obj->gen_loader,
but bpf_object_prepare_token() does not.

As a result, offline loader generation (e.g. bpftool gen skeleton -L)
probes /sys/fs/bpf and honors LIBBPF_BPF_TOKEN_PATH. Worse, if the build
host has a BPF token-delegated bpffs mounted, bpf_object_prepare_token()
sets obj->token_fd, causing bpf_object__create_map() and
bpf_object_load_prog() to set BPF_F_TOKEN_FD in map_flags/prog_flags.
Because gen_loader copies those flags into the loader blob without
serializing any token_fd, the generated loader fails at runtime.

Return early in bpf_object_prepare_token() when obj->gen_loader is set.

Fixes: 6b434b61b4d9 ("libbpf: Wire up BPF token support at BPF object level=
")
Signed-off-by: Thi=C3=A9baud Weksteen <tweek@google.com>
---
 tools/lib/bpf/libbpf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index fb8a1f07c5b6..388facd11c38 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -5212,6 +5212,9 @@ static int bpf_object_prepare_token(struct bpf_object=
 *obj)
 	bool mandatory;
 	enum libbpf_print_level level;
=20
+	if (obj->gen_loader)
+		return 0;
+
 	/* token is explicitly prevented */
 	if (obj->token_path && obj->token_path[0] =3D=3D '\0') {
 		pr_debug("object '%s': token is prevented, skipping...\n", obj->name);
--=20
2.56.1.750.gf70dc682cf-goog

