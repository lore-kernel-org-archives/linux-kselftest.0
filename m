Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFA7299929
	for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 04:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789704573; cv=none; b=lGD1lHb2gSVi2FdSfFZcyDNkbr+o27ukJAvEJZL6pquvXhgmgRk94xaJXZe1RI/Jmqou5/1n9W6EU6vDN0+dGUGbR2jNYYfzDk28pDrZz4lEVmOD6BAM2skHNE5R4QbA178efbLN7TqyU5fHQsJGhUKtHaigV8hcR0BcxqMfxbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789704573; c=relaxed/simple;
	bh=zHRha8kSbvprqxgzqwrDZm/I3JFWn1+ATP+5ygKNdis=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QfBI1DvXdyPAxRLvcd7IWUB5X7PM85ALUSA5ZqUU5K5jmuZNc16fHL1MvoxjWTFB792pj6qg0juY6imI8aeLjGxanJt7VcO68H9XNe1c68sS9qZ9C3VZYj4se1n+8eyzcjkugLr7FPNOT0/HYLPh0sKjA501Oi3rm5Cs0icL8do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tweek.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rC5awAvj; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tweek.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rC5awAvj"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d55d8cd938so6244085ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 21:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789704571; x=1790309371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cdr6BGq5m8ivC45DyzfYrbM1uNv3PXMpks3a7gvcYJE=;
        b=rC5awAvjVzy2unjET3085ebCgPsQ6UDnpUWm+uZuPUqXjPgObiYOKojqgzv7VuMGP+
         witHDp8kO01vSoeCf4iQ7n6X38qknPKKTLNJmlxgzGZ5ft0iH4cMoOJSWU76EfgwJmBp
         b2VJHRRWberxTpxR6IvXFYEPu+4mCbk2k9PiAcfrKAfxOGi2JjF7gfY9xDf/68h6b/Qd
         mc9axMM5Z2msuo9Oo7cQjyc2atRxQ3PkqiJHOO2gZAiyQD7kg3TkLGLaynmyYY5KHhta
         GUQxy7Vrl57pqe60d+NJOQjDM02ewwn+XibdEgdZtMNW49pmoHc21WeMCrLCLeGkl4l6
         0cLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789704571; x=1790309371;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cdr6BGq5m8ivC45DyzfYrbM1uNv3PXMpks3a7gvcYJE=;
        b=Bycp67syfaPi5oql70D/CAVnIOXB0tLg6OmsfqYxn7pOFT/+Y7fsaiDEyBGxz+g6fd
         fhuRe+Bor7dij8Y99hUpLCroCzr6fl5xrV+eQ62gadvDczQdTJvG7/c/yZF+VDkI7cLO
         WI6VdAvCunVQXu2tCZ37nvx7CsegIDEKa3yNeO9pgf37uY3CYNO6SQ2kbRO00wXLpvWc
         6zx9Wc278nnoxTEDr+aRr6Xh4jNC3EjxkHwJ0mf96qZbOA4wx1p7+WqAM65osX8kR5hL
         JRSxAIxBxh75AsBgpepMOMrLn9Z4DxGl5zmgjytqkhMWiPTLN86/7MUTnHu1Rp1ovr6B
         +6Wg==
X-Forwarded-Encrypted: i=1; AKwUvBztbm1mwpzNBpkwGldhXhoNnhOxSHd8zW01xKnnkoNcETHqRbfMmkSBw3QkrebYifEtGsGuE7GG9n1g3gxFbyI=@vger.kernel.org
X-Gm-Message-State: AFuF++liyqFfCU34FeXZrA/kTFeDBpTa+11bl7qbohC29hywyioTHzTT
	WX4jQxnGUHEUb+SiIOGkTDOhCVsQFCj18wVuWb75Oc0GEO6KZun12GIt2XbOU69K4/RWKoi9MDc
	BOA==
X-Received: from plcm19.prod.google.com ([2002:a17:902:f213:b0:2ca:ceab:34a3])
 (user=tweek job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:234d:b0:2d6:e074:9cad
 with SMTP id d9443c01a7336-2ddb1acad2dmr29367075ad.6.1789704570493; Thu, 17
 Sep 2026 21:09:30 -0700 (PDT)
Date: Fri, 18 Sep 2026 14:09:19 +1000
In-Reply-To: <20260918040919.3402577-1-tweek@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260918040919.3402577-1-tweek@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918040919.3402577-3-tweek@google.com>
Subject: [PATCH bpf-next v3 3/3] selftests/bpf: Add iter subtest using lskel
 in global_data_init
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

In test_global_percpu_data.c, dump_percpu_data is defined after two
non-autoload SEC("?kprobe") programs (verifier_strncmp and
verifier_snprintf). If bpftool does not skip non-autoload programs when
generating light skeletons, dump_percpu_data.prog_fd is left invalid or
unpopulated.

Factor out a test_global_percpu_data_iter_fd() helper that operates
directly on prog/map file descriptors, and add an iter_lskel subtest to
verify that dump_percpu_data is properly loaded and executes correctly
when using the light skeleton.

Fixes: 4c9241bd731a ("selftests/bpf: Add tests to verify global percpu data=
")
Fixes: 1ed2294b31fc ("selftests/bpf: Test verifier log for global percpu da=
ta")
Signed-off-by: Thi=C3=A9baud Weksteen <tweek@google.com>
---
v2 -> v3:
  - Running the iter subtest against the lskel.
  - Factor out test_global_percpu_data_iter_fd into a helper.
  - Restore Fixes footers.
v1 -> v2:=20
  - Accidentally dropped Fixes footers.

 .../bpf/prog_tests/global_data_init.c         | 92 ++++++++++++++-----
 1 file changed, 69 insertions(+), 23 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/global_data_init.c b/to=
ols/testing/selftests/bpf/prog_tests/global_data_init.c
index 7c539cbcf3a1..797590127787 100644
--- a/tools/testing/selftests/bpf/prog_tests/global_data_init.c
+++ b/tools/testing/selftests/bpf/prog_tests/global_data_init.c
@@ -375,15 +375,43 @@ static void test_global_percpu_data_verifier_log(void=
)
 	RUN_TESTS(test_global_percpu_data);
 }
=20
-static void test_global_percpu_data_iter(void)
+static void test_global_percpu_data_iter_fd(int prog_fd, int map_fd, int n=
um_cpus,
+					    bool *run_iter, __u32 *sum)
 {
-	DECLARE_LIBBPF_OPTS(bpf_iter_attach_opts, opts);
-	struct test_global_percpu_data *skel;
+	DECLARE_LIBBPF_OPTS(bpf_link_create_opts, opts);
 	union bpf_iter_link_info linfo =3D {};
-	struct bpf_link *link =3D NULL;
-	int fd, num_cpus, len, err;
+	int link_fd, iter_fd, len;
 	char buf[16];
=20
+	linfo.map.map_fd =3D map_fd;
+	opts.iter_info =3D &linfo;
+	opts.iter_info_len =3D sizeof(linfo);
+
+	link_fd =3D bpf_link_create(prog_fd, 0, BPF_TRACE_ITER, &opts);
+	if (!ASSERT_GE(link_fd, 0, "bpf_link_create"))
+		return;
+
+	iter_fd =3D bpf_iter_create(link_fd);
+	if (!ASSERT_GE(iter_fd, 0, "bpf_iter_create"))
+		goto out;
+
+	while ((len =3D read(iter_fd, buf, sizeof(buf))) > 0) {
+		/* no-op */
+	}
+	ASSERT_EQ(len, 0, "read iter");
+	ASSERT_TRUE(*run_iter, "run_iter");
+	ASSERT_EQ(*sum, 0xc0de * num_cpus, "sum");
+
+	close(iter_fd);
+out:
+	close(link_fd);
+}
+
+static void test_global_percpu_data_iter(void)
+{
+	struct test_global_percpu_data *skel;
+	int num_cpus, err;
+
 	num_cpus =3D libbpf_num_possible_cpus();
 	if (!ASSERT_GT(num_cpus, 0, "libbpf_num_possible_cpus"))
 		return;
@@ -395,34 +423,50 @@ static void test_global_percpu_data_iter(void)
 	skel->rodata->num_cpus =3D num_cpus;
 	skel->rodata->num_off =3D offsetof(struct test_global_percpu_data__percpu=
,
 					 struct_data.nums[6]);
-	skel->rodata->elem_sz =3D roundup(sizeof(struct test_global_percpu_data__=
percpu), 8);
+	skel->rodata->elem_sz =3D roundup(sizeof(*skel->percpu), 8);
 	skel->percpu->struct_data.nums[6] =3D 0xc0de;
=20
 	err =3D test_global_percpu_data__load(skel);
 	if (!ASSERT_OK(err, "test_global_percpu_data__load"))
 		goto out;
=20
-	linfo.map.map_fd =3D bpf_map__fd(skel->maps.percpu);
-	opts.link_info =3D &linfo;
-	opts.link_info_len =3D sizeof(linfo);
-	link =3D bpf_program__attach_iter(skel->progs.dump_percpu_data, &opts);
-	if (!ASSERT_OK_PTR(link, "bpf_program__attach_iter"))
-		goto out;
+	test_global_percpu_data_iter_fd(bpf_program__fd(skel->progs.dump_percpu_d=
ata),
+					bpf_map__fd(skel->maps.percpu),
+					num_cpus, &skel->bss->run_iter,
+					&skel->bss->sum);
+out:
+	test_global_percpu_data__destroy(skel);
+}
=20
-	fd =3D bpf_iter_create(bpf_link__fd(link));
-	if (!ASSERT_GE(fd, 0, "bpf_iter_create"))
-		goto out;
+static void test_global_percpu_data_iter_lskel(void)
+{
+	struct test_global_percpu_data_lskel *skel;
+	int num_cpus, err;
=20
-	while ((len =3D read(fd, buf, sizeof(buf))) > 0)
-		do { } while (0);
-	ASSERT_EQ(len, 0, "read iter");
-	ASSERT_TRUE(skel->bss->run_iter, "run_iter");
-	ASSERT_EQ(skel->bss->sum, 0xc0de * num_cpus, "sum");
+	num_cpus =3D libbpf_num_possible_cpus();
+	if (!ASSERT_GT(num_cpus, 0, "libbpf_num_possible_cpus"))
+		return;
=20
-	close(fd);
+	skel =3D test_global_percpu_data_lskel__open();
+	if (!ASSERT_OK_PTR(skel, "test_global_percpu_data_lskel__open"))
+		return;
+
+	skel->rodata->num_cpus =3D num_cpus;
+	skel->rodata->num_off =3D offsetof(struct test_global_percpu_data_lskel__=
percpu,
+					 struct_data.nums[6]);
+	skel->rodata->elem_sz =3D roundup(sizeof(*skel->percpu), 8);
+	skel->percpu->struct_data.nums[6] =3D 0xc0de;
+
+	err =3D test_global_percpu_data_lskel__load(skel);
+	if (!ASSERT_OK(err, "test_global_percpu_data_lskel__load"))
+		goto out;
+
+	test_global_percpu_data_iter_fd(skel->progs.dump_percpu_data.prog_fd,
+					skel->maps.percpu.map_fd,
+					num_cpus, &skel->bss->run_iter,
+					&skel->bss->sum);
 out:
-	bpf_link__destroy(link);
-	test_global_percpu_data__destroy(skel);
+	test_global_percpu_data_lskel__destroy(skel);
 }
=20
 void test_global_percpu_data(void)
@@ -445,4 +489,6 @@ void test_global_percpu_data(void)
 	test_global_percpu_data_verifier_log();
 	if (test__start_subtest("iter"))
 		test_global_percpu_data_iter();
+	if (test__start_subtest("iter_lskel"))
+		test_global_percpu_data_iter_lskel();
 }
--=20
2.55.0.1082.g2b9226bbc0-goog

