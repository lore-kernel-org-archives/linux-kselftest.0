Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11312C11E8
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Feb 2026 19:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771098556; cv=pass; b=Qw2itB/wjGt8Zav1YKumQzXN8NG41UR6NH0maWxhfAUzApVsYHf0CDHoc2d78KK375IwH5PJj1t2cww5fSruNilDJtGeTJt2El7IkEqBy7PasgV8e+H6WVTAxBhl7G32xZ9xZhkHwG6K7rSnezyF1G6PkfmXqwb5AtFbLqUXiw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771098556; c=relaxed/simple;
	bh=GC+jahyn08TEzaCyFw4EljLb34TFRdxXPLg0f+cKCG0=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X+F8m7W/CsdCLgOZbaKqAsKBNMR9nfY9r/uV9bG/GRJA5A/eC5LTsbyMVgQofE7THmlIOH0b/4wJpJAivycvzN0H7ALMctP1w155HBRnV1WdrUm4Cft6sFmoSJEK7WCdD9uD5IN/bKH/9NCXFiFgMz0mYG3AfcSmH17UyPBBsso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v+nF1ENU; arc=pass smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v+nF1ENU"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5673fd077b4so864561e0c.0
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Feb 2026 11:49:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771098553; cv=none;
        d=google.com; s=arc-20240605;
        b=DpkJy+fYzSZdCTt6iDxlj5bcaZ5HJ4YzsToQz56qUkK26a3BvEXYKQCrS/KnlFDPT1
         WwwyygRkq8YpfClEfjhmkP7s40NJXwqWnsiGPkAYcBmfzfTv+1dGq48bl+0eMgiYNtZd
         UtvmJx4rK5zlWatDXBRB7ZNihx9+NCSgm1qqHIu98drhE+mil1Pocgrq7OWwY9HKNCO/
         bOBWHiKo4KOh8r3ZN8bQnQLEONR5QiNoXNbBAff8EW7cahfDOlBaLslJ+YZ0fFXMtzr9
         VwDxNPemjex5z2vlVlFpze1DnMhToGeUZLB3ujCyWk2a1/53wGdd3IQxTvnrYWgnbD5P
         C/hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=ZtvRpN/RyTbUwVvDF0717LJmDHhTx67+ZJt2k7G+yEQ=;
        fh=s0RDvvaYfoW5eSbvIjIBLMWLf1jjo2e8ya8x7PQdDfU=;
        b=lz9OxNwZ5pPZxW59DGnGFh+AKUdcZ/24Qff7SLCHclM5sRk2047kuz8MW8UOnNe0rf
         t5gkhCV00AxhlOD9ugp/G3/Azn29OT8eyqH5x1YzPEt1VMhg4jn7cpcZd9wkXb840MtV
         K3goBNQb0syaEHMM9BSxHNKeJBsbOV9UA9g0lSUDYN6sGs0jAxlx1clYFyVRz2ktIYHJ
         Jl33Bhe06aZPow/HuSHdlXA6K2Y+4EydOxcDLuJEV2MrtnEWcaXoqQw7coWHLrjIUVQ4
         3nMrDP5y9aPCfpX/JkHwHO2JmkWkiUYkHMlrAYvSsd1yC6YuloIjxs+Ohx7qdSOw6fnV
         hBnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771098553; x=1771703353; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtvRpN/RyTbUwVvDF0717LJmDHhTx67+ZJt2k7G+yEQ=;
        b=v+nF1ENUr21oPwBbnMwcXIhFYefKeTMhJR5EjCm1w3ircYOhwF3dMGDWR9JqHc1sAg
         YSSLd1Vh59Mcl5syECgCb8eJtD3k4h5qx+z65ix07/+ciARNcqOvAswEKGVAP31HoUSY
         vhyaG8DAGDWDE3PrKdHcQ6jm4AXEe23Vixzuv3eBxCOU0y0jOX1LmLTZb3c8yEU+9tkg
         yew9JK7XTeFJ65CpkoPt92hPal7tgfprKTCP7vN8VcVMJj2y0UfwBtQqGjTwnVF1bCli
         l3qyEE4Byo2zm8QYwJ10pCHEHT7OTcI0jia9IpcNJzrKlC79HNBpat1PgTLTrnS8n9iq
         CBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771098553; x=1771703353;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZtvRpN/RyTbUwVvDF0717LJmDHhTx67+ZJt2k7G+yEQ=;
        b=TIZ1HsB5Hcg76AgZXBS7e7KXVUwhsrTXFmvdSs3F5DTwn3RLsJme+IUOcugA0xkq65
         FyqzhRKhyM4d95EoRiX+BxnRrWSWHi4Rd0EZbI1E/R10mqFBl8t6Ws6dYrBv4+oXxAOy
         PJm0KNE1mcptATTyiOy7PG0yZJaw5GyMv4NOwKTXJBUkmLD8x4A0Gt+F+RHxrNHkkoj2
         NW4JVXDlG6vsFt4k1hap6fFOpJ+NPuRJ3VDkSmyTHgbLU0iB10JsF5JiWrSkUSasxc2G
         JMgeUyu/zyDjmmaKWw8FrNSoXpsqDiO9mFWp4vDaEaPTXcjvCc3M+kBlBwy+J8N/qHQN
         VZ3A==
X-Forwarded-Encrypted: i=1; AJvYcCXxpMp/eqsGmYxBs1YgzlDTfVMRT229HvjpGAeZ6KFilG2EBYCoEUm8HPjfOUehliyzS17OfjWHcWglZJX4kP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYY1zScPwYgpJ753UxiFvYZPicpek1GABsG/rQIU4IQHkO2ANM
	vjJXvLYTnC76hQreAYVHdhIhCg7EN28yGI1f+lOQH3Ln6fFi7zjQCCmCp1c+sfj8W2AzMTCEjvW
	YrSkwUh+/djzjqC5LEswSz/JXgI27CR10q2DKOMYl
X-Gm-Gg: AZuq6aKhO6NR+Xmxf3xh1sXPOutDz7uB4lGIO03CuDEU2+qg+gVqv6UV2C0K5L3xB05
	o/4SuV5UZhpKampxuGGpKDH1BTFkxwQSxx6PU95XkFZyfE1/5zDI/JdmKc35NZ9G83kwIqmDF6J
	FzAPfiYQFmnsMGOee5zMZ7bOPL08B18PAxtuh/E/gzdL7ftxjeua8GgzhppXKN+QPRYw4ccyDc4
	/m3KUD7l364fE+MsVI7JndOvb+4wjRcsOXRWzKff/acLjEWk5/guSWi5QZ7isYGjgYvxmRr9Hrt
	Rsj33jXZ+AxN98igXyzTQuhWYtyUAwjV8traxOgSO0I5PqJpepDV
X-Received: by 2002:a67:e997:0:b0:5f1:72a7:f879 with SMTP id
 ada2fe7eead31-5fe16ee32cbmr1706405137.28.1771098552104; Sat, 14 Feb 2026
 11:49:12 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 14 Feb 2026 11:49:10 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 14 Feb 2026 11:49:10 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <995398ca18fcb192444799a520cab5ea8e43df7b.1770071243.git.ackerleytng@google.com>
References: <cover.1770071243.git.ackerleytng@google.com> <995398ca18fcb192444799a520cab5ea8e43df7b.1770071243.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 14 Feb 2026 11:49:10 -0800
X-Gm-Features: AaiRm51Rsn2OYZ_XKS4QmK9tZorCQvqfnTm3HcOw4Q6pQqac2ibQJ7lRc1m0N7c
Message-ID: <CAEvNRgHcxjkE8OPVxYqdCs+HvbaYqhNPW1mnocoKOoy5d6FoZQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 33/37] KVM: selftests: Make TEST_EXPECT_SIGBUS thread-safe
To: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, x86@kernel.org
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	bp@alien8.de, brauner@kernel.org, chao.p.peng@intel.com, 
	chao.p.peng@linux.intel.com, chenhuacai@kernel.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, david@kernel.org, hpa@zytor.com, 
	ira.weiny@intel.com, jgg@nvidia.com, jmattson@google.com, jroedel@suse.de, 
	jthoughton@google.com, maobibo@loongson.cn, mathieu.desnoyers@efficios.com, 
	maz@kernel.org, mhiramat@kernel.org, michael.roth@amd.com, mingo@redhat.com, 
	mlevitsk@redhat.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	pbonzini@redhat.com, prsampat@amd.com, qperret@google.com, 
	ricarkol@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, seanjc@google.com, shivankg@amd.com, shuah@kernel.org, 
	steven.price@arm.com, tabba@google.com, tglx@linutronix.de, 
	vannapurve@google.com, vbabka@suse.cz, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng <ackerleytng@google.com> writes:

> The TEST_EXPECT_SIGBUS macro is not thread-safe as it uses a global
> sigjmp_buf and installs a global SIGBUS signal handler. If multiple threads
> execute the macro concurrently, they will race on installing the signal
> handler and stomp on other threads' jump buffers, leading to incorrect test
> behavior.
>
> Make TEST_EXPECT_SIGBUS thread-safe with the following changes:
>
> Share the KVM tests' global signal handler. sigaction() applies to all
> threads; without sharing a global signal handler, one thread may have
> removed the signal handler that another thread added, hence leading to
> unexpected signals.
>
> The alternative of layering signal handlers was considered, but calling
> sigaction() within TEST_EXPECT_SIGBUS() necessarily creates a race. To
> avoid adding new setup and teardown routines to do sigaction() and keep
> usage of TEST_EXPECT_SIGBUS() simple, share the KVM tests' global signal
> handler.
>
> Opportunistically rename report_unexpected_signal to
> catchall_signal_handler.
>
> To continue to only expect SIGBUS within specific regions of code, use a
> thread-specific variable, expecting_sigbus, to replace installing and
> removing signal handlers.
>
> Make the execution environment for the thread, sigjmp_buf, a
> thread-specific variable.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---
>  .../testing/selftests/kvm/include/test_util.h | 29 +++++++++----------
>  tools/testing/selftests/kvm/lib/kvm_util.c    | 18 ++++++++----
>  tools/testing/selftests/kvm/lib/test_util.c   |  7 -----
>  3 files changed, 26 insertions(+), 28 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/test_util.h b/tools/testing/selftests/kvm/include/test_util.h
> index 2871a4292847..0e4e6f7dab8f 100644
> --- a/tools/testing/selftests/kvm/include/test_util.h
> +++ b/tools/testing/selftests/kvm/include/test_util.h
> @@ -80,22 +80,19 @@ do {									\
>  	__builtin_unreachable(); \
>  } while (0)
>
> -extern sigjmp_buf expect_sigbus_jmpbuf;
> -void expect_sigbus_handler(int signum);
> -
> -#define TEST_EXPECT_SIGBUS(action)						\
> -do {										\
> -	struct sigaction sa_old, sa_new = {					\
> -		.sa_handler = expect_sigbus_handler,				\
> -	};									\
> -										\
> -	sigaction(SIGBUS, &sa_new, &sa_old);					\
> -	if (sigsetjmp(expect_sigbus_jmpbuf, 1) == 0) {				\
> -		action;								\
> -		TEST_FAIL("'%s' should have triggered SIGBUS", #action);	\
> -	}									\
> -	sigaction(SIGBUS, &sa_old, NULL);					\
> -} while (0)
> +extern __thread sigjmp_buf expect_sigbus_jmpbuf;
> +extern __thread bool expecting_sigbus;
> +
> +#define TEST_EXPECT_SIGBUS(action)                                     \
> +	do {                                                           \
> +		expecting_sigbus = true;			       \
> +		if (sigsetjmp(expect_sigbus_jmpbuf, 1) == 0) {         \
> +			action;                                        \
> +			TEST_FAIL("'%s' should have triggered SIGBUS", \
> +				  #action);                            \
> +		}                                                      \
> +		expecting_sigbus = false;			       \
> +	} while (0)
>
>  size_t parse_size(const char *size);
>
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index aec7b24418ab..18ced8bdde36 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -2314,13 +2314,20 @@ __weak void kvm_selftest_arch_init(void)
>  {
>  }
>
> -static void report_unexpected_signal(int signum)
> +__thread sigjmp_buf expect_sigbus_jmpbuf;
> +__thread bool expecting_sigbus;
> +
> +static void catchall_signal_handler(int signum)
>  {
> +	switch (signum) {
> +	case SIGBUS: {
> +		if (expecting_sigbus)


Transferring/summarizing an internal comment from Sean upstream:

This assumes that tests are indeed using the catchall_signal_handler as
the global signal handler.

In the next revision, I will make TEST_EXPECT_SIGBUS() assert that the
default signal handler is installed, so that developers get a clear,
explicit failure if/when something goes wrong.

> +			siglongjmp(expect_sigbus_jmpbuf, 1);
> +
> +		TEST_FAIL("Unexpected SIGBUS (%d)\n", signum);
> +	}
>  #define KVM_CASE_SIGNUM(sig)					\
>  	case sig: TEST_FAIL("Unexpected " #sig " (%d)\n", signum)
> -
> -	switch (signum) {
> -	KVM_CASE_SIGNUM(SIGBUS);
>  	KVM_CASE_SIGNUM(SIGSEGV);
>  	KVM_CASE_SIGNUM(SIGILL);
>  	KVM_CASE_SIGNUM(SIGFPE);
> @@ -2332,12 +2339,13 @@ static void report_unexpected_signal(int signum)
>  void __attribute((constructor)) kvm_selftest_init(void)
>  {
>  	struct sigaction sig_sa = {
> -		.sa_handler = report_unexpected_signal,
> +		.sa_handler = catchall_signal_handler,
>  	};
>
>  	/* Tell stdout not to buffer its content. */
>  	setbuf(stdout, NULL);
>
> +	expecting_sigbus = false;
>  	sigaction(SIGBUS, &sig_sa, NULL);
>  	sigaction(SIGSEGV, &sig_sa, NULL);
>  	sigaction(SIGILL, &sig_sa, NULL);
> diff --git a/tools/testing/selftests/kvm/lib/test_util.c b/tools/testing/selftests/kvm/lib/test_util.c
> index 8a1848586a85..03eb99af9b8d 100644
> --- a/tools/testing/selftests/kvm/lib/test_util.c
> +++ b/tools/testing/selftests/kvm/lib/test_util.c
> @@ -18,13 +18,6 @@
>
>  #include "test_util.h"
>
> -sigjmp_buf expect_sigbus_jmpbuf;
> -
> -void __attribute__((used)) expect_sigbus_handler(int signum)
> -{
> -	siglongjmp(expect_sigbus_jmpbuf, 1);
> -}
> -
>  /*
>   * Random number generator that is usable from guest code. This is the
>   * Park-Miller LCG using standard constants.
> --
> 2.53.0.rc1.225.gd81095ad13-goog
