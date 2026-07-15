Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E7648C3E4
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 15:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784129649; cv=none; b=TjWyDY0zvQiGW1BHEGW1+3e66BKD90AlpXyud4NBrft/SUDoeh7HkrhHzl0AF2vEnmqFnFTwj7Y90I0K162OhLKHZWWYgD72i9AkDoYT56XtjQ6t/ensZub95yGpOz4Ipzl14us8tfXLsLCoRHQFOsTcOG3uoji1nQFsX/mw9jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784129649; c=relaxed/simple;
	bh=me6OL90Ypr8Ilpx+65NnZrX1cBHotrcVrQNa58+nAzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fRs7A6EJAbjNtHVmi2mxcJ3cQv8yvRN9QXPdJjPO+/MkTORMYGhGMmjVxja9JENq15vIYmY+VMfRcHIOM2st2CHjbeR3FbnOXc78peUSicN7OOWQtXI/wDD0MHWSFdVU22xzIZis0wPa6Kcz8F+aopfXBnG2P2xCZy0wVCfb9vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XFJ+dV5w; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XFJ+dV5w"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784129644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GBQaFEoNYmmYAMbxysMsFS3t2NOHg74qWyOBvlWdFCc=;
	b=XFJ+dV5wcvW+d29dorS2wOOOorNuj4F8l6vB767X67LgtqdTXdYkMKa2nOGDTjEeK8F754
	N6hgNqXauiz/824ArhuyrMBnk+01F9Cl7MIRXZ8OlMch61MfLsIHpswbl7MD7VRDJFqK5H
	NUlLqf8yG6thCBb3e8oj/MrhjdO+kJI=
From: Leon Hwang <leon.hwang@linux.dev>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Quentin Monnet <qmo@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Leon Hwang <leon.hwang@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-patches-bot@fb.com
Subject: [PATCH bpf-next v10 9/9] selftests/bpf: Verify bpf_iter for global percpu data
Date: Wed, 15 Jul 2026 23:32:53 +0800
Message-ID: <20260715153254.92010-10-leon.hwang@linux.dev>
In-Reply-To: <20260715153254.92010-1-leon.hwang@linux.dev>
References: <20260715153254.92010-1-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add a test to verify that it is OK to iter the percpu_array map used for
global percpu data.

Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
---
 .../bpf/prog_tests/global_data_init.c         | 52 +++++++++++++++++++
 .../bpf/progs/test_global_percpu_data.c       | 25 +++++++++
 2 files changed, 77 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/global_data_init.c b/tools/testing/selftests/bpf/prog_tests/global_data_init.c
index 598b7dde6581..e5a40ea36ee7 100644
--- a/tools/testing/selftests/bpf/prog_tests/global_data_init.c
+++ b/tools/testing/selftests/bpf/prog_tests/global_data_init.c
@@ -283,6 +283,56 @@ static void test_global_percpu_data_verifier_log(void)
 	RUN_TESTS(test_global_percpu_data);
 }
 
+static void test_global_percpu_data_iter(void)
+{
+	DECLARE_LIBBPF_OPTS(bpf_iter_attach_opts, opts);
+	struct test_global_percpu_data *skel;
+	union bpf_iter_link_info linfo = {};
+	struct bpf_link *link = NULL;
+	int fd, num_cpus, len, err;
+	char buf[16];
+
+	num_cpus = libbpf_num_possible_cpus();
+	if (!ASSERT_GT(num_cpus, 0, "libbpf_num_possible_cpus"))
+		return;
+
+	skel = test_global_percpu_data__open();
+	if (!ASSERT_OK_PTR(skel, "test_global_percpu_data__open"))
+		return;
+
+	skel->rodata->num_cpus = num_cpus;
+	skel->rodata->offsetof_num = offsetof(struct test_global_percpu_data__percpu, struct_data);
+	skel->rodata->offsetof_num += sizeof(skel->percpu->struct_data) - sizeof(int);
+	skel->rodata->elem_sz = roundup(sizeof(struct test_global_percpu_data__percpu), 8);
+	skel->percpu->struct_data.nums[6] = 0xc0de;
+
+	err = test_global_percpu_data__load(skel);
+	if (!ASSERT_OK(err, "test_global_percpu_data__load"))
+		goto out;
+
+	linfo.map.map_fd = bpf_map__fd(skel->maps.percpu);
+	opts.link_info = &linfo;
+	opts.link_info_len = sizeof(linfo);
+	link = bpf_program__attach_iter(skel->progs.dump_percpu_data, &opts);
+	if (!ASSERT_OK_PTR(link, "bpf_program__attach_iter"))
+		goto out;
+
+	fd = bpf_iter_create(bpf_link__fd(link));
+	if (!ASSERT_GE(fd, 0, "bpf_iter_create"))
+		goto out;
+
+	while ((len = read(fd, buf, sizeof(buf))) > 0)
+		do { } while (0);
+	ASSERT_EQ(len, 0, "read iter");
+	ASSERT_TRUE(skel->bss->run_iter, "run_iter");
+	ASSERT_EQ(skel->bss->percpu_data_sum, 0xc0de * num_cpus, "percpu_data_sum");
+
+	close(fd);
+out:
+	bpf_link__destroy(link);
+	test_global_percpu_data__destroy(skel);
+}
+
 void test_global_percpu_data(void)
 {
 	if (!feat_supported(NULL, FEAT_PERCPU_DATA)) {
@@ -299,4 +349,6 @@ void test_global_percpu_data(void)
 	if (test__start_subtest("rdonly_direct_write"))
 		test_global_percpu_data_rdonly_direct_write();
 	test_global_percpu_data_verifier_log();
+	if (test__start_subtest("iter"))
+		test_global_percpu_data_iter();
 }
diff --git a/tools/testing/selftests/bpf/progs/test_global_percpu_data.c b/tools/testing/selftests/bpf/progs/test_global_percpu_data.c
index b852a0b07508..8b1f625017d1 100644
--- a/tools/testing/selftests/bpf/progs/test_global_percpu_data.c
+++ b/tools/testing/selftests/bpf/progs/test_global_percpu_data.c
@@ -53,4 +53,29 @@ int verifier_snprintf(void *ctx)
 	return 0;
 }
 
+volatile const __u32 num_cpus = 0;
+volatile const int offsetof_num;
+volatile const int elem_sz;
+__u32 percpu_data_sum = 0;
+bool run_iter = false;
+
+SEC("iter/bpf_map_elem")
+__auxiliary
+int dump_percpu_data(struct bpf_iter__bpf_map_elem *ctx)
+{
+	void *pptr = ctx->value;
+	int i;
+
+	if (!pptr)
+		return 0;
+
+	run_iter = true;
+
+	for (i = 0; i < num_cpus; i++) {
+		percpu_data_sum += *(int *) (pptr + offsetof_num);
+		pptr += elem_sz;
+	}
+	return 0;
+}
+
 char _license[] SEC("license") = "GPL";
-- 
2.55.0

