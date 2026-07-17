Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E9D3DFC67
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 07:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784273698; cv=none; b=rNkJJ3kvwQzK6slMA1l+An83qi7BcE01/ZRyFED8PRfBiGt9EwdNWf/GFH8ib2X+sIrxv7AdaOgghVdPcnNk871K/iaJRWpa52AAMDTxhxVRbvAHR332cmCfT567bICd+Wr9n7BJ5vKiWpYOc2dAPbUeR2cwspt4YJVpNUVD9kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784273698; c=relaxed/simple;
	bh=cO1IGSY2kR1S+CU8X47rMQseSu7VWEo8gGKPmpMe360=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VWDkufSKhc7k8nQI91mNqpoR+NbUbH9Ac+9ejQmsX57cyE8dOkub40OKFtDJUicLQ5qw0zsdBz/6RnU9JZPa1THQixnI4z4wa4KPr2V8NUJoz8JdXC9XdyMC/zlmGBatrYpUw9Atzm9dHBxrAjUEPrXzilTvGIt1P+T7oxcvR2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JsNy/F0U; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lqWDs/Il; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JsNy/F0U";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lqWDs/Il"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784273684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/p0wnuezKiJPh1zgcwZ/NKm0lJtDtQFy3Op/vB/faRY=;
	b=JsNy/F0UJxZaOiMHwedKCZkx2IC3oO97ds+c2FegF5HIRBejxJ37Gv/uv5mD3RyYFgBB8j
	v1F0OmuMsBNJQUrYLFEfgcLxeTYQnn5ycdkWTUPPohjNRoLmJbCY6KJJ+/ZZLB0lVBBJV7
	lwrMmV4DwA5V3R65dzGUAJaXkEA82PQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-SjMcTxSlMTqShpoEzb3zRg-1; Fri, 17 Jul 2026 03:34:40 -0400
X-MC-Unique: SjMcTxSlMTqShpoEzb3zRg-1
X-Mimecast-MFC-AGG-ID: SjMcTxSlMTqShpoEzb3zRg_1784273679
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-490a767b782so29697815e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 00:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784273679; x=1784878479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/p0wnuezKiJPh1zgcwZ/NKm0lJtDtQFy3Op/vB/faRY=;
        b=lqWDs/IlTYNup/Z0QBvzB9xC5LvqU4rTnfR/eEVsPPmp0BuW1jevkw5Cvtrbr4gC+c
         +F4nj4qI7175tUbjogIi1tzxbZm212LWwoMrbHitjo7/hz5h7pVTzjT33IZVOKUvENhJ
         WLTTRt/g77YjFOG4k9znPHMV/RcAfpukd/DcQBD9xHSninLOq7A+h3IUBWP2koaS8old
         a3pZB4sL1PbXJMP/8bLsPHiEK1gH/RR3CZiOHQJK6CZGl1o+Z3PnS3XyIzg7ekkdueIP
         pVAJsqAxZY1Gr4s+JkYOfmyfH2Sf1qNTg/2/fRBTXLsKvHfO+cyRL+4RENlqfJiu9tQg
         Bv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784273679; x=1784878479;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/p0wnuezKiJPh1zgcwZ/NKm0lJtDtQFy3Op/vB/faRY=;
        b=pWsqT9w8ysB/of5hKUqpO4cPrQXCbmIX/ZHktGuC45St6ktNZP+jZwrnS/yps4ViAF
         IFPcV5xF1iO46kLQefg89O/PnT3X/jtOOtBdescBE9PEFwPoypUBJwlNDF0j9l3NUKoP
         gfxXr96ukYhsBIv87HnCEG1iCm7LB9Q9jnH0+ry/z0ZaacHARbKKMKAJTYR8KQgbqnKG
         RKiXCvumwv5j06ImFZFeYvGp2lTI0ie1UVAGs+ttAd13BeTCoa5ahFFaSUkEh9QT7BHA
         o3HetzG5J7W8IG6ghXxIFPSpWSgxGYOhUrp0RB8tMg+3SjuFdo7p+vkWt1LGbNO1nFx2
         G/mw==
X-Forwarded-Encrypted: i=1; AHgh+RrHWcQeIrnXziYGNMmnMKjq763chyjqvnsicj0IUkPsi4sktkZYOz1HCJirNsaBVchvlXdOx3kxSNRBpXxqkGc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzinhrMg3hMGVofMtI7hnEwM5BKdR6WpUJZLpk84Qxb+MYLDUr
	0EutomQLivTbyLZ7bANmL9Ks+4Sb9dnJ/MXrJvcztA8DZoa+YQyNKtkHB2m0bfSPUuHttCcIFnl
	gLsYr/7MmieezIPmHOAAInY1okJBzb6piGCo+/1Dy8IZZDTFk8sfrlDAAqtkoiBd2CPcU
X-Gm-Gg: AfdE7clF8f48/h1wRCbOWWsjwj9msHO0keVwE2c3vYUlYuwfYUB6l2qY2rDALv0S9Zk
	etVvsvM91ZugGVupYOxoBxWi6FwRx2vNoPMYqme8lTbHmTgDAjjN4536sgMMc5GEEiZ13nEkHm+
	qOX5zcNfRbUwpxObiILyiQRXMXZih67gkD37Rcp5gUByWVuOLD1HhOGm56QICTDJTnwK866HkgD
	SZajuJOt2vcrqYWVfI+8ZwYfaJo9+hBkthvhT2u8tYWUPOrxTpj2vmuXTJ+BOcRrQss9nAd/uUm
	LcsSYfE3uJ/ZWXVDcw4iqvPIakrIqcjXyQRArOZB/ACfd3oqT01tZ3kjBK/b4jEeRKRnfUVp53M
	tO917VzEDHSWNIun0MJeAggXiouLICIHVbMc=
X-Received: by 2002:a05:600c:150c:b0:493:bba7:e9f4 with SMTP id 5b1f17b1804b1-4954a402dedmr9340785e9.18.1784273678932;
        Fri, 17 Jul 2026 00:34:38 -0700 (PDT)
X-Received: by 2002:a05:600c:150c:b0:493:bba7:e9f4 with SMTP id 5b1f17b1804b1-4954a402dedmr9340415e9.18.1784273678340;
        Fri, 17 Jul 2026 00:34:38 -0700 (PDT)
Received: from [192.168.0.135] (185-219-167-205-static.vivo.cz. [185.219.167.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63eeece9sm1470257f8f.37.2026.07.17.00.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 00:34:37 -0700 (PDT)
Message-ID: <0f252920-38a8-4280-81aa-67240f60cadd@redhat.com>
Date: Fri, 17 Jul 2026 09:34:36 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 2/2] selftests/bpf: Test
 bpf_strcat,bpf_strncat kfuncs
To: Rong Tao <rtoax@foxmail.com>, andrii@kernel.org, ast@kernel.org
Cc: Rong Tao <rongtao@cestc.cn>, Daniel Borkmann <daniel@iogearbox.net>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>,
 Yuzuki Ishiyama <ishiyama@hpc.is.uec.ac.jp>,
 "open list:BPF [GENERAL] (Safe Dynamic Programs and Tools)"
 <bpf@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
References: <cover.1784194024.git.rtoax@foxmail.com>
 <tencent_C7A5E27560540491DBE052682ACBE1F24405@qq.com>
From: Viktor Malik <vmalik@redhat.com>
Content-Language: en-US
In-Reply-To: <tencent_C7A5E27560540491DBE052682ACBE1F24405@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/16/26 11:34, Rong Tao wrote:
> From: Rong Tao <rongtao@cestc.cn>
> 
> Add tests for new kfuncs bpf_strcat() and bpf_strncat().
> 
> Signed-off-by: Rong Tao <rongtao@cestc.cn>
> ---
>  .../testing/selftests/bpf/prog_tests/string_kfuncs.c  |  2 ++
>  .../selftests/bpf/progs/string_kfuncs_failure1.c      | 11 +++++++++++
>  .../selftests/bpf/progs/string_kfuncs_failure2.c      |  2 ++
>  .../selftests/bpf/progs/string_kfuncs_success.c       |  4 ++++
>  4 files changed, 19 insertions(+)
> 
> diff --git a/tools/testing/selftests/bpf/prog_tests/string_kfuncs.c b/tools/testing/selftests/bpf/prog_tests/string_kfuncs.c
> index 300032a19445..460567ef622a 100644
> --- a/tools/testing/selftests/bpf/prog_tests/string_kfuncs.c
> +++ b/tools/testing/selftests/bpf/prog_tests/string_kfuncs.c
> @@ -24,6 +24,8 @@ static const char * const test_cases[] = {
>  	"strcasestr",
>  	"strnstr",
>  	"strncasestr",
> +	"strcat",
> +	"strncat",
>  };
>  
>  void run_too_long_tests(void)
> diff --git a/tools/testing/selftests/bpf/progs/string_kfuncs_failure1.c b/tools/testing/selftests/bpf/progs/string_kfuncs_failure1.c
> index bddc4e8579d2..973a6ba643d4 100644
> --- a/tools/testing/selftests/bpf/progs/string_kfuncs_failure1.c
> +++ b/tools/testing/selftests/bpf/progs/string_kfuncs_failure1.c
> @@ -8,6 +8,7 @@
>  
>  char *user_ptr = (char *)1;
>  char *invalid_kern_ptr = (char *)-1;
> +char kern_buf[32] = { "hello" };
>  
>  /*
>   * When passing userspace pointers, the error code differs based on arch:
> @@ -53,6 +54,8 @@ SEC("syscall")  __retval(USER_PTR_ERR)int test_strnstr_null1(void *ctx) { return
>  SEC("syscall")  __retval(USER_PTR_ERR)int test_strnstr_null2(void *ctx) { return bpf_strnstr("hello", NULL, 1); }
>  SEC("syscall")  __retval(USER_PTR_ERR)int test_strncasestr_null1(void *ctx) { return bpf_strncasestr(NULL, "hello", 1); }
>  SEC("syscall")  __retval(USER_PTR_ERR)int test_strncasestr_null2(void *ctx) { return bpf_strncasestr("hello", NULL, 1); }
> +SEC("syscall")  __retval(USER_PTR_ERR)int test_strcat_null1(void *ctx) { return bpf_strcat(kern_buf, sizeof(kern_buf), NULL); }
> +SEC("syscall")  __retval(USER_PTR_ERR)int test_strncat_null1(void *ctx) { return bpf_strncat(kern_buf, sizeof(kern_buf), NULL, 2); }
>  
>  /* Passing userspace ptr to string kfuncs */
>  SEC("syscall") __retval(USER_PTR_ERR) int test_strcmp_user_ptr1(void *ctx) { return bpf_strcmp(user_ptr, "hello"); }
> @@ -79,6 +82,10 @@ SEC("syscall") __retval(USER_PTR_ERR) int test_strnstr_user_ptr1(void *ctx) { re
>  SEC("syscall") __retval(USER_PTR_ERR) int test_strnstr_user_ptr2(void *ctx) { return bpf_strnstr("hello", user_ptr, 1); }
>  SEC("syscall") __retval(USER_PTR_ERR) int test_strncasestr_user_ptr1(void *ctx) { return bpf_strncasestr(user_ptr, "hello", 1); }
>  SEC("syscall") __retval(USER_PTR_ERR) int test_strncasestr_user_ptr2(void *ctx) { return bpf_strncasestr("hello", user_ptr, 1); }
> +SEC("syscall") __retval(USER_PTR_ERR) int test_strcat_user_ptr1(void *ctx) { return bpf_strcat(user_ptr, 1, "hello"); }
> +SEC("syscall") __retval(USER_PTR_ERR) int test_strcat_user_ptr2(void *ctx) { return bpf_strcat(kern_buf, sizeof(kern_buf), user_ptr); }
> +SEC("syscall") __retval(USER_PTR_ERR) int test_strncat_user_ptr1(void *ctx) { return bpf_strncat(user_ptr, 1, "hello", 2); }
> +SEC("syscall") __retval(USER_PTR_ERR) int test_strncat_user_ptr2(void *ctx) { return bpf_strncat(kern_buf, sizeof(kern_buf), user_ptr, 1); }
>  
>  #endif /* __TARGET_ARCH_s390 */
>  
> @@ -107,5 +114,9 @@ SEC("syscall") __retval(-EFAULT) int test_strnstr_pagefault1(void *ctx) { return
>  SEC("syscall") __retval(-EFAULT) int test_strnstr_pagefault2(void *ctx) { return bpf_strnstr("hello", invalid_kern_ptr, 1); }
>  SEC("syscall") __retval(-EFAULT) int test_strncasestr_pagefault1(void *ctx) { return bpf_strncasestr(invalid_kern_ptr, "hello", 1); }
>  SEC("syscall") __retval(-EFAULT) int test_strncasestr_pagefault2(void *ctx) { return bpf_strncasestr("hello", invalid_kern_ptr, 1); }
> +SEC("syscall") __retval(-EFAULT) int test_strcat_pagefault1(void *ctx) { return bpf_strcat(invalid_kern_ptr, 1, "hello"); }
> +SEC("syscall") __retval(-EFAULT) int test_strcat_pagefault2(void *ctx) { return bpf_strcat(kern_buf, sizeof(kern_buf), invalid_kern_ptr); }
> +SEC("syscall") __retval(-EFAULT) int test_strncat_pagefault1(void *ctx) { return bpf_strncat(invalid_kern_ptr, 1, "hello", 2); }
> +SEC("syscall") __retval(-EFAULT) int test_strncat_pagefault2(void *ctx) { return bpf_strncat(kern_buf, sizeof(kern_buf), invalid_kern_ptr, 2); }
>  
>  char _license[] SEC("license") = "GPL";
> diff --git a/tools/testing/selftests/bpf/progs/string_kfuncs_failure2.c b/tools/testing/selftests/bpf/progs/string_kfuncs_failure2.c
> index 412c53b87b18..38f0a5f326b5 100644
> --- a/tools/testing/selftests/bpf/progs/string_kfuncs_failure2.c
> +++ b/tools/testing/selftests/bpf/progs/string_kfuncs_failure2.c
> @@ -23,5 +23,7 @@ SEC("syscall") int test_strstr_too_long(void *ctx) { return bpf_strstr(long_str,
>  SEC("syscall") int test_strcasestr_too_long(void *ctx) { return bpf_strcasestr(long_str, "hello"); }
>  SEC("syscall") int test_strnstr_too_long(void *ctx) { return bpf_strnstr(long_str, "hello", sizeof(long_str)); }
>  SEC("syscall") int test_strncasestr_too_long(void *ctx) { return bpf_strncasestr(long_str, "hello", sizeof(long_str)); }
> +SEC("syscall") int test_strcat_too_long(void *ctx) { return bpf_strcat(long_str, sizeof(long_str), "hello"); }
> +SEC("syscall") int test_strncat_too_long(void *ctx) { return bpf_strncat(long_str, sizeof(long_str), "hello", 3); }
>  
>  char _license[] SEC("license") = "GPL";
> diff --git a/tools/testing/selftests/bpf/progs/string_kfuncs_success.c b/tools/testing/selftests/bpf/progs/string_kfuncs_success.c
> index f65b1226a81a..b24456ad3d43 100644
> --- a/tools/testing/selftests/bpf/progs/string_kfuncs_success.c
> +++ b/tools/testing/selftests/bpf/progs/string_kfuncs_success.c
> @@ -6,6 +6,8 @@
>  #include "errno.h"
>  
>  char str[] = "hello world";
> +char buf1[32] = "hello";
> +char buf2[32] = "hello";
>  
>  #define __test(retval) SEC("syscall") __success __retval(retval)
>  
> @@ -59,5 +61,7 @@ __test(-ENOENT) int test_strncasestr_notfound1(void *ctx) { return bpf_strncases
>  __test(-ENOENT) int test_strncasestr_notfound2(void *ctx) { return bpf_strncasestr(str, "hello", 4); }
>  __test(-ENOENT) int test_strncasestr_notfound3(void *ctx) { return bpf_strncasestr("", "a", 0); }
>  __test(0) int test_strncasestr_empty(void *ctx) { return bpf_strncasestr(str, "", 1); }
> +__test(10) int test_strcat_success(void *ctx) { return bpf_strcat(buf1, sizeof(buf1), "world"); }
> +__test(8) int test_strncat_success(void *ctx) { return bpf_strncat(buf2, sizeof(buf2), "world", 3); }

We should also add tests that verify that the string was actually
copied.

Viktor

>  
>  char _license[] SEC("license") = "GPL";

