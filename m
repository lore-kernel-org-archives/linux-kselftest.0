Received: from mail-vs2-f39.google.com (mail-vs2-f39.google.com [74.125.227.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A55284880
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 03:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790567262; cv=none; b=rftCAFkkSJCCcKNTyVueEr3w613U8gOsxQy2vsysOAq81AWPyGLePo2QmFjXXhTkC8xiFAf/UAdO42jx1tVYHoVt38AyGgIJaiyIeu2bdDn92+3vtPI82DE/NCkz+CjsjtbLxKCrsXpqBUsCdchivUF8TLNJrzHbCBUAbt560jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790567262; c=relaxed/simple;
	bh=rcMi8vC6nR1ZBut2wZQz7X3NIJIWWci1IHnHKbjCcG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=geHfKVFkxfmUggQebDLfr1VAUsSrk8vDqI1nQtZ/J+il/ZvSlQ+pGOVjSLK2ctJOlomwxvCl2tvuuMUGtcPabXz1atNrVT0m+BLfUmtNEUsuDkP4KLlr0iF3sHlj5rXVgz7iaKymZvBDdpXvpQOvUdJgkNbcsH00BHWN90pS+/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2kG+GQy; arc=none smtp.client-ip=74.125.227.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2kG+GQy"
Received: by mail-vs2-f39.google.com with SMTP id 71dfb90a1353d-5cd13e9ec34so931957e0c.3
        for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 20:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790567259; x=1791172059; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tcXl6Fa3snS7QY1nUGehz7eptADgZA98OKznWa3G7tc=;
        b=F2kG+GQyafsyrgKWvBpRS1DXaWF+yCKR23dPcZs1xcd9YgZM29PPfqbgUhcn8Goen5
         3031JjJKf+hxnj0RogK3CgML2ChiOfcXDERw71nbY8en7nwGptIgPG4g7TEug7cfvKQ0
         aNFxxmWYLBUZBIT1jXxyqGJi4wvl+bvHC3vidVV+DrwHSpAn2perP3o9pISL0wbxjZ/1
         chKahHVnPvrFPZ1HLpLDDfwTfiMaFS3el7QuNgn3LKhpXFNbtaLMxzQl7ruYO8eZyd9s
         KC91nq5lgAdsaQQt3WUWgzpmpqelxt8bs8sNRHbJzrnHOg9MccXiyJ1/X6l2DdoE1iz/
         4V6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790567259; x=1791172059;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tcXl6Fa3snS7QY1nUGehz7eptADgZA98OKznWa3G7tc=;
        b=Yp3LRXIZOUSCD8aVBYqUe8Nnqgi2JzPtpF4rSvcv+LvMFRbeqyUMKCv9pDpohX3dvy
         p+lEqnr/LXn2TzxRRlr9toXVE0moF/iq9V3t+QWNRgyxPw3/pbMXYFaYu8pEZQgL9f62
         GMF5hnQldjNIOBU2+DX6k9atlX9nCCQOq6X8e9mt3I5eFTeMo0auNEmi0N5Ghed6LIIh
         IZumd4iypatviAUcAKOq3U439uaOGMrCjAmcgDwW+cXbYD3SmLCFvLAQAn9qCKqPGt2O
         OgvblnpllrdliVBf0wJ23XVs5kfd/MMDrN835JKprEk/JFFxHkverbhSX0wWVlT6BTCt
         cP0g==
X-Forwarded-Encrypted: i=1; AKwUvBwVNjeqMsVlpVCEz27vJU7AZeL5bm2OjliJJcBVPiBWLqie8DALYvoZdUrGkg1a9Esp/kbCs6LEiQ+Q8DrzRV8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiR2pqVwsTnya1J1pIcQjYCExOPZACejLC9cYBvN8VLv6Dx9D+
	TMGCv4Kd15owq/DHcagj6Q4G+XlkoSFHbmZhnPmsvammh/GMQGJK+sl8
X-Gm-Gg: AYBFou0mYDSPjiA0vl4mk8S7tJHW+sXDwWKqSFNY3s8lvH+6Bnm2Hl4PgUdEA5bGTKs
	67Rrsi0B+EHx5EMHQXG86qvhsNHC8S7ZsPRAqh6ermeD4QP1hC3JSueBU0j0w+NopH9xU9PJubz
	LnYt8iNr6yKo7xH8eTwHR1vpqm5h0JeXRuBReU5+AevqDOviRKPpSJ7fFkGakk1szpIh3G3KPWP
	EMyqbPOeJqguUSKoEV8GxWJ+rSwSFL13O5bupAMWaaxUXDDbIQMuZjZmNSIHDrW8x7cxCnRgmyY
	2SZYTRN/yirvw8Pwu49PW7GVjMIn1jPJuuu9HISFbMtXi6xdO0Tbi9hVEVXiWHsyXy2qZxa9tkf
	ixnWmEaOpeq4eCbiXgtXlPsEUIn9tumk03y2c53FEcvgT3qQM8qfx7LNnAFrBn/5DQTbC+zZGVn
	8Ik1UM//pL5aJR6v5YZhdXy8cMn4FbzEatJ/TF5O+Bls9lJAJx9j8V6l53WRS7jXS4UI5ZMbugQ
	Tt5qPI/L/K+og==
X-Received: by 2002:a05:6122:8d5:b0:5c8:46e3:ec57 with SMTP id 71dfb90a1353d-5cb09027e49mr5251881e0c.1.1790567258905;
        Sun, 27 Sep 2026 20:47:38 -0700 (PDT)
Received: from [127.0.1.1] ([201.162.73.164])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde4f969b9sm7596010e0c.3.2026.09.27.20.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 20:47:38 -0700 (PDT)
From: Luis Vieira <luisflavieira@gmail.com>
Date: Mon, 28 Sep 2026 00:47:07 -0300
Subject: [PATCH bpf-next] libbpf: Fix struct and union zero detection in
 BTF dumper
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-libbpf-btf-enodata-fix-v1-1-56dae4cab778@gmail.com>
X-B4-Tracking: v=1; b=H4sIADrjuWoC/yWMQQ6CMBBFr0Jm7SRQsalexbCYKVMdYwppqyEh3
 N2Cy/d/3lshS1LJcGtWSPLVrFOs0J0a8E+KD0EdK4NpjW2vxuFbmeeAXAJKnEYqhEEXJG/PrrP
 9hdhBleckdT7Cd9iFKEuB4f/kD7/El70L2/YDOWsvUIQAAAA=
X-Change-ID: 20260928-libbpf-btf-enodata-fix-ac6381645ab8
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Luis Vieira <luisflavieira@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790567253; l=2720;
 i=luisflavieira@gmail.com; s=20260913; h=from:subject:message-id;
 bh=rcMi8vC6nR1ZBut2wZQz7X3NIJIWWci1IHnHKbjCcG8=;
 b=VUPd87UjtqOWywMsrdtsRG5QI5Jng9qSgdEbVU3NmWcWhcSRNN7+2g6C57h416rD8ERJP3VUV
 dugpV2S8lqQC0Y9cnoc4yug/iIThAAIqqp+tOroefFYvtGRtU0JdwTT
X-Developer-Key: i=luisflavieira@gmail.com; a=ed25519;
 pk=98MeC/NdrC6ah7zYpPnkWiQIoyj62iUP/rNuV3esCW4=

btf_dump_type_data_check_zero() uses -ENODATA to indicate that a value
is zero. The array path handles this sentinel correctly, but the struct
and union path compares the return value against positive ENODATA.

As a result, the member loop returns after examining its first member.
A nested struct or union whose first member is zero can therefore be
treated as entirely zero even when a later member is non-zero.

Compare against -ENODATA so zero members are skipped while looking for
a non-zero member. Add a regression test with a nested struct whose
first member is zero and second member is non-zero.

Signed-off-by: Luis Vieira <luisflavieira@gmail.com>
---
 tools/lib/bpf/btf_dump.c                          | 2 +-
 tools/testing/selftests/bpf/prog_tests/btf_dump.c | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/lib/bpf/btf_dump.c b/tools/lib/bpf/btf_dump.c
index fa995c02a170..dbf9f17e4b37 100644
--- a/tools/lib/bpf/btf_dump.c
+++ b/tools/lib/bpf/btf_dump.c
@@ -2474,7 +2474,7 @@ static int btf_dump_type_data_check_zero(struct btf_dump *d,
 			bit_sz = btf_member_bitfield_size(t, i);
 			err = btf_dump_type_data_check_zero(d, mtype, m->type, data + moffset / 8,
 							    moffset % 8, bit_sz);
-			if (err != ENODATA)
+			if (err != -ENODATA)
 				return err;
 		}
 		return -ENODATA;
diff --git a/tools/testing/selftests/bpf/prog_tests/btf_dump.c b/tools/testing/selftests/bpf/prog_tests/btf_dump.c
index fe04a955d46c..dd1241fcdb01 100644
--- a/tools/testing/selftests/bpf/prog_tests/btf_dump.c
+++ b/tools/testing/selftests/bpf/prog_tests/btf_dump.c
@@ -886,6 +886,11 @@ static void test_btf_dump_struct_data(struct btf *btf, struct btf_dump *d,
 			   "(union bpf_iter_link_info){.map = (struct){.map_fd = (__u32)1,},.cgroup = (struct){.order = (enum bpf_cgroup_iter_order)BPF_CGROUP_ITER_SELF_ONLY,.cgroup_fd = (__u32)1,},.task = (struct){.tid = (__u32)1,.pid = (__u32)1,},}",
 			   { .cgroup = { .order = 1, .cgroup_fd = 1, }});
 
+	/* nested structs with zero first member and non-zero second member */
+	TEST_BTF_DUMP_DATA(btf, d, "union", str, union bpf_iter_link_info, BTF_F_COMPACT,
+			   "(union bpf_iter_link_info){.cgroup = (struct){.cgroup_fd = (__u32)1,},.task = (struct){.pid = (__u32)1,},}",
+			   { .cgroup = { .cgroup_fd = 1 }});
+
 	/* struct skb with nested structs/unions; because type output is so
 	 * complex, we don't do a string comparison, just verify we return
 	 * the type size as the amount of data displayed.

---
base-commit: ea9358e1270ab2c3ba6f36bd9bdda68617665516
change-id: 20260928-libbpf-btf-enodata-fix-ac6381645ab8

Best regards,
--  
Luis Vieira <luisflavieira@gmail.com>

