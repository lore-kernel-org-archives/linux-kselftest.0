Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F721378D78
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Apr 2026 16:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776703936; cv=none; b=Y/4SBI84gxrsISmkqrTQbCzyrQ1GBKAkzjk6JurI7qMTI5aG0sb1GLMy0ftvYc6W5Rd+1mfuWOflS7JT/3x6w82egTYWuhJvlZQrsjDYVx47TQNNiewOt7vKlcYt9rjXIblFJpYK7WiY7PvR8wqXFDBBZo2K6jRePsjxifokXW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776703936; c=relaxed/simple;
	bh=Kxi+WBS9YMy1saAUSaYtPzYaZTtXBUg1DFgRCzPc8ik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XErpBRH62BmoPpcUQrZedVUJZa7HbXbatEZTDaiG+obMPNUh4tAzre3NUnwvf5JcpXZBUQq/+B3blKENvxxg5al/Hlf3sigJou1HRRsN2hVYhYKu60ta/gKzPp1lscohhXjEo6IL3ABIr4eujD5bRV5d35ahx3rXq07bXZBURjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VrVUYNDz; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VrVUYNDz"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488ad135063so26481195e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Apr 2026 09:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776703933; x=1777308733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X7WVV2rXlZkPThmov5vqqJDurN8/X/UV4KgQra6/Gw8=;
        b=VrVUYNDzT9mAzVMIBiXkSuHzsGk8zvrEymZtR+ULtO3PDH3kkJmX1kSGN9VAL0+mpo
         Z/YoRwBTYeQ4covL8X1ewfWlmxi+TuEKKixKXzvLqU7ePkfeWUa7MoWSDwieSyVZbvPN
         vL3SRb7scVuXY6CEM5gVZZQ2Hj8XQIIE4rNJW+WyKOOGtiKb6VBpx8/LBlU4RqxlFO1T
         qtN2FWW7LG5Vq6m5o15mSjB2O6zJCVgn3ylXrzpWG/pBYHYTYp3S4pb9vPf0HbyK/xbz
         +7P1TKNCbumYoCElJZ+3f17sAw0Z+YuC1KtPuRsdm/PFWt/LqKryAOruuLAFU91Zi8ZH
         xUcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776703933; x=1777308733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X7WVV2rXlZkPThmov5vqqJDurN8/X/UV4KgQra6/Gw8=;
        b=CVhHf1RH/20/BmhVCJyuYq/+XKTmJm7uk2y9aBYGXMUOjdzav9KkewPiTT+22zEWMN
         ZtK95F7qoKYNDyjuvzLRXVSVg8fzzro3NtUbPNp1bxwRJw0+R8kbF2DBOY2rtVL9I57r
         cwwOEECRACEBfXGS1MSrBgbsZYH/CnMqdKTlUZQkFWKrm9aAKkk3UY8WxUdoe3iGq8ZQ
         yJcqSAZ679Afme3Wy1oyuDgzWJTJisI1RJPL4WSEPR3PdJ+31hb6a9/gGYFa/Yn6iase
         Xf7BU32a62EA72AFXUEu+og4qN60S1Sg/G8DC0QsE9BAJPHR/oRJpH57bLRKC6zU4w30
         Bq2w==
X-Forwarded-Encrypted: i=1; AFNElJ8wPqjVSYb4/47BsAO76/ADpBlwARj5Yzj2B8noO62p3/9FDhdFCMhLCx4XaUmSvGEoN70JN6U9lfmne0SP+qQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG4jQL2rDQslTFYseZFO/eX1y4LsOVVl+czUqKSUia5x8VqUPQ
	XGaquTCeY8+7+zVhUWNCr9jvmk3rKJyhmHeJQNzrl400NJKAHv+yYbB+
X-Gm-Gg: AeBDiesH/5W9akSYQ7Dc1/GgzrIFzclGnQyKi2Kvznw0l5Wkyy/WVZ8rX4NRpp4XB4p
	we/x4qPCM+WyYU6xPrHMx8OvP35kWL7hHwV5pInpsG8R9gGWoBhOk23hggTb6xyvrLpV7u9SsDA
	kMrDsihOI3SQOJVZ7YW2FDo8jGkrH9OxsIHSXCP5OaRCXRv3Rs7rTTJq51SwAZal9ibtm/OQMBg
	lr6lFVsjI0pn3b6OuSgAq2b5fc6Or5ToBUOoW2P4t7XJBqG3hA5slLKj7qSTxlnEMxVbz+cnl/S
	FFpSczrLxIBX4TsdgdJ3ZDSGOsLyMKqoy+9oKPXipcPrSttpP0g55lPyLcKePS/JoOEu4iHzS1P
	R0KaWyVYDnWR6kvFZY8lslAqbRQ1ucqusJXxY+sH85JL6QepYF2U0MyR7L1MfSqGVLqPr6ODaHk
	JzWx4AQJaW93MGeyl40oc9pPuA51eBN8PsZY6hWRSAsJDGT5iVzTIcFOEEa0BENkseya1DLw==
X-Received: by 2002:a05:600c:a40a:b0:489:1ba8:5bf0 with SMTP id 5b1f17b1804b1-4891ba85dc1mr67435325e9.21.1776703932396;
        Mon, 20 Apr 2026 09:52:12 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:5432:2d05:ea5:f7f7? ([2620:10d:c092:500::6:8ffd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb11b4sm31219009f8f.2.2026.04.20.09.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 09:52:12 -0700 (PDT)
Message-ID: <f02fd939-85f7-414a-8b03-a9ebe56c7660@gmail.com>
Date: Mon, 20 Apr 2026 17:52:11 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/bpf: Page out as late a possible in file_reader
To: Jerome Marchand <jmarchan@redhat.com>, bpf@vger.kernel.org
Cc: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman
 <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Mykyta Yatsenko <yatsenko@meta.com>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420134637.2513867-1-jmarchan@redhat.com>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <20260420134637.2513867-1-jmarchan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/20/26 2:46 PM, Jerome Marchand wrote:
> The file_reader/on_open_expect_fault fails consistently on my system.
> It expects a page fault on first dynptr read of some range the exe
> file of the current process because it has paged out that page range
> earlier. However a lot can happen to that range (which depending on
> the actual memory layout could contain text section, data section,
> sections )related to dynamic linking...) between the moment it was
> paged out and the moment the bpf program expected to hit a pagefault
> actually run.
> 
> A bit of instrumentation with mincore() shows that pages from that
> range were accessed several times before the program is run. In
> particular the call of file_reader__load() seems to fault all the
> range in.
> 
> Move the call to madvise(MADV_PAGEOUT) to just before attaching the
> program to minimize the risk of having those page pulled back in from
> under our feet.
> 
> Signed-off-by: Jerome Marchand <jmarchan@redhat.com>
> ---

Thank you for the patch, the change looks good. Does it fail 
consistently on 4K page size?

Acked-by: Mykyta Yatsenko <yatsenko@meta.com>

>   .../selftests/bpf/prog_tests/file_reader.c    | 22 +++++++++----------
>   1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/testing/selftests/bpf/prog_tests/file_reader.c b/tools/testing/selftests/bpf/prog_tests/file_reader.c
> index 5cde32b35da44..48aae7ea0e4bb 100644
> --- a/tools/testing/selftests/bpf/prog_tests/file_reader.c
> +++ b/tools/testing/selftests/bpf/prog_tests/file_reader.c
> @@ -10,6 +10,7 @@
>   
>   const char *user_ptr = "hello world";
>   char file_contents[256000];
> +void *addr;
>   
>   void *get_executable_base_addr(void)
>   {
> @@ -26,8 +27,7 @@ void *get_executable_base_addr(void)
>   static int initialize_file_contents(void)
>   {
>   	int fd, page_sz = sysconf(_SC_PAGESIZE);
> -	ssize_t n = 0, cur, off;
> -	void *addr;
> +	ssize_t n = 0, cur;
>   
>   	fd = open("/proc/self/exe", O_RDONLY);
>   	if (!ASSERT_OK_FD(fd, "Open /proc/self/exe\n"))
> @@ -52,16 +52,6 @@ static int initialize_file_contents(void)
>   	/* page-align base file address */
>   	addr = (void *)((unsigned long)addr & ~(page_sz - 1));
>   
> -	/*
> -	 * Page out range 0..512K, use 0..256K for positive tests and
> -	 * 256K..512K for negative tests expecting page faults
> -	 */
> -	for (off = 0; off < sizeof(file_contents) * 2; off += page_sz) {
> -		if (!ASSERT_OK(madvise(addr + off, page_sz, MADV_PAGEOUT),
> -			       "madvise pageout"))
> -			return errno;
> -	}
> -
>   	return 0;
>   }
>   
> @@ -90,6 +80,14 @@ static void run_test(const char *prog_name)
>   	if (!ASSERT_OK(err, "file_reader__load"))
>   		goto cleanup;
>   
> +	/*
> +	 * Page out range 0..512K, use 0..256K for positive tests and
> +	 * 256K..512K for negative tests expecting page faults
> +	 */
> +	if (!ASSERT_OK(madvise(addr, sizeof(file_contents) * 2, MADV_PAGEOUT),
> +		       "madvise pageout"))
> +		goto cleanup;
> +
>   	err = file_reader__attach(skel);
>   	if (!ASSERT_OK(err, "file_reader__attach"))
>   		goto cleanup;

