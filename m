Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CF4373BF6
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 16:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780418570; cv=none; b=qOmQmd5zUlDWQ1ctpyGmdAm8VlmNbEx8dbeJBjTgIDzXa46bHl1O4T2ypzb2rJohLKZXveV1w0t+OjZ88/EI/TV7aAp+ICPxNwIOm9DlcGWvrlvZYSx0RvOPb/yx7UnSdt65CG+Yg1DcZ/7XMuXJlsKYOWn6CM0Xk20ifu3AndA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780418570; c=relaxed/simple;
	bh=1Q4E5ugLFeJeSqMTNmTxNJVKMeVqqoBkHh0j6q0NUic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K0SVlNh5+8dTIgHYHvIXb0yaPtK/8CMB5GRGvb68qJBaSxcOC+piPBUOSRyIqlPO4p9V1Ui8nyemYvAp0pDJIUu7E/dOY5IfsdiFO4JEphUAu4uIrVlesrGnCnwquWNGY7UFwBcWiuyEEgPJrZCBhvuEDadEZBEpl31YOc21KCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=r6Secql4; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="r6Secql4"
Message-ID: <7978c4f6-2833-45b5-80e0-c1eeb99cb646@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780418525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=32nvXdOr5Zqzm+JE/2T+z/XC4PoDSPmFWVa63PU6X6w=;
	b=r6Secql4R1wTjP2dRjDWrNBgz6GDVYBeLvcZbMPfCShcCgU9dWiNCjB3TIOtkq1tjs0z/e
	7qYTzhHRwpjeI2l2JJfPDuR1IWGAREqQKgppzhNmnXLjCJKlL9S1IHWX4eXJtOLqLYjeIf
	t/+Uq/ku3BYWX35ENxGYuEvCqe37rPY=
Date: Tue, 2 Jun 2026 09:41:51 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] selftests/bpf: Cover tail-call cgroup storage
 prog-array checks
Content-Language: en-GB
To: Lin Ma <malin89@huawei.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, bpf@vger.kernel.org
Cc: Andrii Nakryiko <andrii@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Song Liu <song@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 YiFei Zhu <zhuyifei@google.com>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Amery Hung <ameryhung@gmail.com>, Rongzhen Cui <cuirongzhen@huawei.com>,
 Jingguo Tan <tanjingguo@huawei.com>, cenxianlong@huawei.com,
 chenzhe@huawei.com
References: <20260602073539.1567846-1-malin89@huawei.com>
 <20260602073539.1567846-2-malin89@huawei.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20260602073539.1567846-2-malin89@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 6/2/26 12:35 AM, Lin Ma wrote:
> Add tail-call selftests for prog-array ownership when cgroup storage is
> in use. Verify that loading succeeds when callers and callees reuse the
> owner's cgroup storage map, and that loading fails for a different
> storage map or for a storage-less bridge program.
>
> Signed-off-by: Lin Ma <malin89@huawei.com>
> Signed-off-by: Rongzhen Cui <cuirongzhen@huawei.com>
> Signed-off-by: Jingguo Tan <tanjingguo@huawei.com>
> ---
>   .../selftests/bpf/prog_tests/tailcalls.c      | 103 ++++++++++++++++++
>   .../bpf/progs/tailcall_cgrp_storage.c         |  44 ++++++++
>   .../progs/tailcall_cgrp_storage_no_storage.c  |  20 ++++
>   .../bpf/progs/tailcall_cgrp_storage_owner.c   |  32 ++++++
>   4 files changed, 199 insertions(+)
>   create mode 100644 tools/testing/selftests/bpf/progs/tailcall_cgrp_storage.c
>   create mode 100644 tools/testing/selftests/bpf/progs/tailcall_cgrp_storage_no_storage.c
>   create mode 100644 tools/testing/selftests/bpf/progs/tailcall_cgrp_storage_owner.c
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/tailcalls.c b/tools/testing/selftests/bpf/prog_tests/tailcalls.c
> index 7d534fde0af9..c1403ab20eae 100644
> --- a/tools/testing/selftests/bpf/prog_tests/tailcalls.c
> +++ b/tools/testing/selftests/bpf/prog_tests/tailcalls.c
> @@ -8,6 +8,9 @@
>   #include "tailcall_freplace.skel.h"
>   #include "tc_bpf2bpf.skel.h"
>   #include "tailcall_fail.skel.h"
> +#include "tailcall_cgrp_storage_owner.skel.h"
> +#include "tailcall_cgrp_storage_no_storage.skel.h"
> +#include "tailcall_cgrp_storage.skel.h"
>   #include "tailcall_sleepable.skel.h"
>   
>   /* test_tailcall_1 checks basic functionality by patching multiple locations
> @@ -1654,6 +1657,100 @@ static void test_tailcall_failure()
>   	RUN_TESTS(tailcall_fail);
>   }
>   
> +static void test_tailcall_cgrp_storage(void)
> +{
> +	struct tailcall_cgrp_storage_owner *owner_skel = NULL;
> +	struct tailcall_cgrp_storage *skel = NULL;
> +	int err, key = 0, prog_array_fd, prog_fd, storage_map_fd;
> +
> +	owner_skel = tailcall_cgrp_storage_owner__open_and_load();
> +	if (!ASSERT_OK_PTR(owner_skel, "owner_open_and_load"))
> +		return;
> +
> +	prog_array_fd = bpf_map__fd(owner_skel->maps.prog_array);
> +	storage_map_fd = bpf_map__fd(owner_skel->maps.storage_map);
> +
> +	skel = tailcall_cgrp_storage__open();
> +	if (!ASSERT_OK_PTR(skel, "tailcall_cgrp_storage__open"))
> +		goto out;
> +
> +	err = bpf_map__reuse_fd(skel->maps.prog_array, prog_array_fd);
> +	if (!ASSERT_OK(err, "reuse_prog_array"))
> +		goto out;
> +
> +	err = bpf_map__reuse_fd(skel->maps.storage_map, storage_map_fd);
> +	if (!ASSERT_OK(err, "reuse_storage_map"))
> +		goto out;
> +
> +	err = bpf_object__load(skel->obj);
> +	if (!ASSERT_OK(err, "tailcall_cgrp_storage__load"))
> +		goto out;
> +
> +	prog_fd = bpf_program__fd(skel->progs.callee_prog);
> +	err = bpf_map_update_elem(prog_array_fd, &key, &prog_fd, BPF_ANY);
> +	ASSERT_OK(err, "update_prog_array");
> +
> +out:
> +	tailcall_cgrp_storage__destroy(skel);
> +	tailcall_cgrp_storage_owner__destroy(owner_skel);
> +}
> +
> +static void test_tailcall_cgrp_storage_diff_storage(void)
> +{
> +	struct tailcall_cgrp_storage_owner *owner_skel = NULL;
> +	struct tailcall_cgrp_storage *skel = NULL;
> +	int err, prog_array_fd;
> +
> +	owner_skel = tailcall_cgrp_storage_owner__open_and_load();
> +	if (!ASSERT_OK_PTR(owner_skel, "owner_open_and_load"))
> +		return;
> +
> +	prog_array_fd = bpf_map__fd(owner_skel->maps.prog_array);
> +
> +	skel = tailcall_cgrp_storage__open();
> +	if (!ASSERT_OK_PTR(skel, "tailcall_cgrp_storage__open"))
> +		goto out;
> +
> +	err = bpf_map__reuse_fd(skel->maps.prog_array, prog_array_fd);
> +	if (!ASSERT_OK(err, "reuse_prog_array"))
> +		goto out;
> +
> +	err = bpf_object__load(skel->obj);
> +	ASSERT_ERR(err, "tailcall_cgrp_storage__load");
> +
> +out:
> +	tailcall_cgrp_storage__destroy(skel);
> +	tailcall_cgrp_storage_owner__destroy(owner_skel);
> +}
> +
> +static void test_tailcall_cgrp_storage_no_storage(void)
> +{
> +	struct tailcall_cgrp_storage_owner *owner_skel = NULL;
> +	struct tailcall_cgrp_storage_no_storage *skel = NULL;
> +	int err, prog_array_fd;
> +
> +	owner_skel = tailcall_cgrp_storage_owner__open_and_load();
> +	if (!ASSERT_OK_PTR(owner_skel, "owner_open_and_load"))
> +		return;
> +
> +	prog_array_fd = bpf_map__fd(owner_skel->maps.prog_array);
> +
> +	skel = tailcall_cgrp_storage_no_storage__open();
> +	if (!ASSERT_OK_PTR(skel, "tailcall_cgrp_storage_no_storage__open"))
> +		goto out;
> +
> +	err = bpf_map__reuse_fd(skel->maps.prog_array, prog_array_fd);
> +	if (!ASSERT_OK(err, "reuse_prog_array"))
> +		goto out;
> +
> +	err = bpf_object__load(skel->obj);
> +	ASSERT_ERR(err, "tailcall_cgrp_storage_no_storage__load");
> +
> +out:
> +	tailcall_cgrp_storage_no_storage__destroy(skel);
> +	tailcall_cgrp_storage_owner__destroy(owner_skel);
> +}
> +
>   noinline void uprobe_sleepable_trigger(void)
>   {
>   	asm volatile ("");
> @@ -1777,6 +1874,12 @@ void test_tailcalls(void)
>   		test_tailcall_freplace();
>   	if (test__start_subtest("tailcall_bpf2bpf_freplace"))
>   		test_tailcall_bpf2bpf_freplace();
> +	if (test__start_subtest("tailcall_cgrp_storage"))
> +		test_tailcall_cgrp_storage();
> +	if (test__start_subtest("tailcall_cgrp_storage_diff_storage"))
> +		test_tailcall_cgrp_storage_diff_storage();
> +	if (test__start_subtest("tailcall_cgrp_storage_no_storage"))
> +		test_tailcall_cgrp_storage_no_storage();

Since the failure is due to 'A -> B(no storage) -> C(storage)' in your commit message,
you should create a selftest for that. Current selftests are good but not addressing
the issue in patch 1.

>   	if (test__start_subtest("tailcall_failure"))
>   		test_tailcall_failure();
>   	if (test__start_subtest("tailcall_sleepable"))
>
[...]

