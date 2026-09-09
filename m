Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7233115BC
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 04:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788927882; cv=none; b=ELU5o4/e5ek4YAvA16qOiSE/W7UZfont5sIQLJUnSy0/XQsbwHp+q8i7h7dU3sar7ztJEG+nPKRRoqxw8ERUeO8YmgfsPUtctdGxWpDKYqb6k4/b6q/9jNs48pWS54Q374JELJ/en+gT4UBylpKfMLp8zwSV4T1v4+DyjEhI0fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788927882; c=relaxed/simple;
	bh=dZzvZvrldOHqYJkY1Z3xYueWymErA7+Y5x+W1FlWSDU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dHyWXf0/0gGCeQIKyAjvV6LQ49RLtzzaAwvmrBAvr5OcVNVSFAQDfZqA9ElbnYzMgLvrlzNMo89LbJ6mZYVChiyqYcQruaZWJNkgViwtIyK0TSXPkIy5YQ9PIwVvw9GfJTuaNitQCcJGxtbt2StNs8xFqtKmReeJTN46M10sutU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tweek.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Oq4VlbIz; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tweek.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Oq4VlbIz"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db8c152622so7669055ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 21:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788927880; x=1789532680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KnhJI+rKKo0KB69PekMjbT0jUwVFPsoq1/xJBf+QKyA=;
        b=Oq4VlbIz3hxmjDHHLArxQCQwVjx34V2hErP/KprO6373MGmkxUQPF+rWrArwQxJkba
         gp+xy0oN1If6eaS2cnEZpbmYD7hdAxaBopf+qV5f7E90ldYxg/MBMDuDPzUpHnNxlEGS
         DJNKFzzTOwTM/tvG4AGJt5Dcoc/3Wb85jnIFWOU+GFaVOLpAw/tpAzY0fRs7lA3miw9y
         44Vut9CmRo4tlg6ZcfrDkBfaIQoZhnMzMPskSHg1h9S3JhJZmy9FFPiOOm04YpAplyVw
         zO6BHcJJiFy7jOyPB98PQ8KFwzIYhCQ11bg3qKn4M1sUfnkeFbjAZncWShilqfqadeD3
         Wb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788927880; x=1789532680;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KnhJI+rKKo0KB69PekMjbT0jUwVFPsoq1/xJBf+QKyA=;
        b=hLFrBVLjBSQ+nLHDZ807Khqe9zfvZv1PCZ6pSFG0qtEkHIoFj8l0PVrkz9v7JdscdM
         PbNG+b326O2AmxrzYRS6Baz9o/zHjMVjFgVqJgsB/mKveo+GR/GnnhCmo4ctBYoF6YU9
         ff3VJnze442VTMOcJR/4qbJpkgZOPQOCM49LRPMnDTFgRT1fQmxNkTuHKRt4j7fsUPQY
         KUyvyzBCf7QFga+AOj49SxtNg7bwDq9IU78NQ/WJX7j7jM/ZuBOGyahPfNGPnn91CW94
         e+l7toWuAh8siZNR8E+kHZ5VP0MEbV7hYQei/IxcTUK8WUGlC7xsDQwtMp9cLpCO2hNJ
         vDMg==
X-Forwarded-Encrypted: i=1; AKwUvBxKGW//2hz1Q1ooSogPmKQEF54rlXUeOrzmNQLWJAYY4QsiMozP1CkqTTPh0ECM/M5+7aMDCXSD3Ufow4H6LXw=@vger.kernel.org
X-Gm-Message-State: AFuF++kB+s5JgQxFMYY1ON4/rg82OZyQWBoCms7juieYN53yBEcWPS+F
	X868WCCPo01BaJYaRgGhkGtmvaM9itvZcMQ+hHnZamW91UBucdwpAzgnjqk0PRkxoyVCu8I4N9P
	8Pg==
X-Received: from plme14.prod.google.com ([2002:a17:903:490e:b0:2db:5eae:a078])
 (user=tweek job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:289:b0:2da:e67a:87d4
 with SMTP id d9443c01a7336-2db1268128dmr488919855ad.19.1788927879966; Tue, 08
 Sep 2026 21:24:39 -0700 (PDT)
Date: Wed,  9 Sep 2026 14:24:32 +1000
In-Reply-To: <20260909042433.1775591-1-tweek@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260909042433.1775591-1-tweek@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260909042433.1775591-2-tweek@google.com>
Subject: [PATCH bpf-next v2 2/3] bpftool: Compute light skeleton ctx.sz
 without relying on links
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

When generating a light skeleton, gen_trace() unconditionally sets
skel->ctx.sz using (char *)&skel->links - (char *)skel. However, if a
BPF object has no programs and no struct_ops maps (prog_cnt +
attach_map_cnt =3D=3D 0), do_skeleton() omits the links struct, causing the
generated skeleton header to fail compilation.

Compute skel->ctx.sz from the end of progs (if prog_cnt > 0), maps (if
map_cnt > 0), or ctx instead of relying on skel->links. Also remove the
unused opts.data_sz argument passed to codegen().

Fixes: d510296d331a ("bpftool: Use syscall/loader program in "prog load" an=
d "gen skeleton" command.")
Signed-off-by: Thi=C3=A9baud Weksteen <tweek@google.com>
---
 tools/bpf/bpftool/gen.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/tools/bpf/bpftool/gen.c b/tools/bpf/bpftool/gen.c
index e9a1a018f270..4a93c392857a 100644
--- a/tools/bpf/bpftool/gen.c
+++ b/tools/bpf/bpftool/gen.c
@@ -711,7 +711,7 @@ static void codegen_destroy(struct bpf_object *obj, con=
st char *obj_name)
 }
=20
 static int gen_trace(struct bpf_object *obj, const char *obj_name, const c=
har *header_guard,
-		     const struct gen_loader_opts *opts)
+		     const struct gen_loader_opts *opts, size_t prog_cnt, size_t map_cnt=
)
 {
 	struct bpf_load_and_run_opts sopts =3D {};
 	char sig_buf[MAX_SIG_SIZE];
@@ -746,9 +746,16 @@ static int gen_trace(struct bpf_object *obj, const cha=
r *obj_name, const char *h
 			skel =3D (struct %1$s *)skel_alloc(sizeof(*skel));    \n\
 			if (!skel)					    \n\
 				goto cleanup;				    \n\
-			skel->ctx.sz =3D (char *)&skel->links - (char *)skel; \n\
 		",
-		obj_name, opts->data_sz);
+		obj_name);
+	if (prog_cnt)
+		printf("\tskel->ctx.sz =3D (char *)&skel->progs - (char *)skel\n"
+		       "\t\t       + sizeof(skel->progs);\n");
+	else if (map_cnt)
+		printf("\tskel->ctx.sz =3D (char *)&skel->maps - (char *)skel\n"
+		       "\t\t       + sizeof(skel->maps);\n");
+	else
+		printf("\tskel->ctx.sz =3D sizeof(skel->ctx);\n");
 	bpf_object__for_each_map(map, obj) {
 		const void *mmap_data =3D NULL;
 		size_t mmap_size =3D 0;
@@ -1469,7 +1476,7 @@ static int do_skeleton(int argc, char **argv)
 			goto out;
 	}
 	if (use_loader) {
-		err =3D gen_trace(obj, obj_name, header_guard, &gen_opts);
+		err =3D gen_trace(obj, obj_name, header_guard, &gen_opts, prog_cnt, map_=
cnt);
 		goto out;
 	}
=20
--=20
2.55.0.979.g7e5102b832-goog

