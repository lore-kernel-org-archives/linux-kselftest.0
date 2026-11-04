Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793792451;
	b=pjV07i6sb+FybM6T3EpwpWa/17YHhDeZWdRjMAxOFh8zpFkyUCqZHxsYV0Ts3PvrYHM8
	 9crBTPZWjeBBZzaMW8jzZZDoc6ynd8sbUBTV6B4Mm0Yu45y7xtwsSvsbpADzuwZBZc2Mh
	 zTLp7lT94O+hRP7RLHnKV1r+FW6bjwmu4gaXdk4vabqnB9ovmXZYyJAAOhR+zY3pQ/OAJ
	 Q8EufBpW7WjmBdfC3RU2KYMqnElalV4xCTujjXziiTi+YINdWDpW6n6btB3ipeFEFBy56
	 QiNqKKDFOhEHStmEkdX7rOaKffhOSa7qyJ53ra6XeeLbMPkG17N79OMPydiWpEjFGcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=ZsCmj2Bd0zCOX9XIs7fgWNRdvJoAisSGzCFmbSIRZkQ=;
	b=iXsmfnXYbfeYQwhF0PMh3VtvLRPS/90Nlg9VUEuGRcX5dJzfUrF10JN5Z8GkL9XcqhYC
	 pg7TUwyuyFK1zQYZhc015xmAlpYGYZZT6isQUW1VIyOZHhHivwaVaJlvk9uaS2AfSWe5X
	 +JO9roJ1/tSYZI5Z4/8NSvmgoXD8AkLXWuV7k3ZRUVGUSddqXMkL9nQtipywpD5qx37uP
	 fvgJOx1bh3LD91Z6lBoQ2Bodl6elqBjtrd+iknrtAZWbYFYcijgP1/76+RDRHN5+6uZf4
	 5QNLzIArspJuzfktS1Hy5C9sA41twpCYQCgI1aFlEWXa+xGngYvZvZuw7F/lOd+H6yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hBwm9xd+;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F84B606D819
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 11:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F84B606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hBwm9xd+
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c45111bebso276615f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 03:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793792448; x=1794397248; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZsCmj2Bd0zCOX9XIs7fgWNRdvJoAisSGzCFmbSIRZkQ=;
        b=hBwm9xd+NzrXQ15nvYc7IXZyKTbKyi+gZB+RBYF7H4NhnJiOL7kOYbTV5GizeYbRBN
         TGaK7jYFhDREKzFjICLIdgsNrugXo+AoBC7ERADoEhuiFlXRUaMxH1M+cxqgZNmiKIvx
         jK4515YqOMdwfhKjMIySFjnkcteq9y0ZLL/RpuZ/UtxQdmp81oSM3sdSvrq2QolInnEJ
         sBCuu4intpYACXDvlA0okHE/AVfzLJb/JDfcDEpEjJIAvaBz3pU1iwVa2Eh5W8L6MhNK
         O0+5R5r140YrTo7yRdgmrRLKfgyspIGnSXHHlWuwy+ATSKnS8rKrExTnpk9TSep2b2Ah
         u8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793792448; x=1794397248;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZsCmj2Bd0zCOX9XIs7fgWNRdvJoAisSGzCFmbSIRZkQ=;
        b=KW6JGBUK0ZjSFM4ml4ShiXW0tDKYm6ryTCFBMOkIJ5Cyw5h+gdbITGXQUNADoN0WTW
         D1Wo3ku7e6NQT/RvUwic8LhkVWCauhPGQtzu8W4UeKNRbsqnc0S4vvF0qlLozs38FqRh
         MMxxr5+quVAj5ST6slhcd1OzCLB7ljeRX98o2sdORxHKUCyALJk9z/BKg3KWuSFjHd4y
         gVprInd97PnGYs7B9c3qPILyK0RYrBB5kPcRjp4TPhtSG4J/nRyV9fhpOo/Pca5yvSfg
         2fEu8tU+JOK8lShqQo7W4WNOa35z400+jcTb+U3nAh4ncZEpLlxyUy9ORCI75JacQK7X
         dm7g==
X-Forwarded-Encrypted: i=1; AKwUvBwiVoue/icTzeI912HrJ8H8GX2g/rzk+8bgJSVb8nWX5w+rqog4sOheNmj7Jv9el8uBgp6hgfDdZs49v8CbT1g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aHO2/WF8QpfOmXP30tRGZA6V3KHBBgMjZ3JfYmP3B1PWd9w8v
	znwmoY2NgyV/Qas4u7B+NhSGFUBQf5dTJvIh+b5V54b0jhSYKVOMCI/F
X-Gm-Gg: AYBFou0InvKFIhsY+4W8ffqfM/pDZDqjbCxKyQGMwqTATWGqpDg9QvmcGadDGl44dHm
	6qkVEFa1ZiuCClCaRxPY8SqNMEvvS0q4YerNk2keVRI9Kh4aOdAZLj0e+DneOB0bkUOS3H7LohW
	nkce+kPgCf8SsRykBBuCsusjlUCDS2lLoMPRmsSPfX63rPx9gnXS8eB1cMS/fs2TK0kn+TEZFMJ
	khdvXuKlTW3nJGkRvoVoR8mXMEos/ajVXXAEeSjUYL7xML1wFo9i0R3Iuufk9Sddk+aRoW+/reS
	F4OJxhk8iet1dKgQndxKjMRXQxqOazoNDE1yVwOqj8tL1+nr+K97TBF2ykS41hrgEoXbDJ7RVCR
	z66nBC6K4YXpMUDPh4Ry7ISkBOuJgcyiFVIkQT/cVlQndRaNOKQyriozKs9h+WlIGYB7yLF0Ymk
	B5H7OmssxkEYTs2T2yTe4jy4IJtRejwT1NEKLDq+C4JVIglrrX/fiNS2Y2Bxp4ijSz4kt9uh8OQ
	VCm1PcCFIomjIPJJgxkjcoZ4fANPtkb8Soeu6hHaQ1arw5l94XuKV5Hd6D00IWYrmnYzoK/4rlQ
	q4s=
X-Received: by 2002:a05:6000:248a:b0:490:411a:1eed with SMTP id ffacd0b85a97d-490411a20c3mr2322400f8f.39.1793792448263;
        Wed, 04 Nov 2026 03:40:48 -0800 (PST)
Received: from krava ([2a02:8308:a00c:e200::25dc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda1f100sm3457605f8f.46.2026.11.04.03.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:40:47 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 4 Nov 2026 12:40:45 +0100
To: Alexis =?iso-8859-1?Q?Lothor=E9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Cc: ebpf@linuxfoundation.org,
	Bastien Curutchet <bastien.curutchet@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next v2] selftests/bpf: port test_ftrace.sh to
 test_progs
Message-ID: <ausZvdHfmevg3mMZ@krava>
References: <20261104-ftrace_in_test_progs-v2-1-45363230d228@bootlin.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261104-ftrace_in_test_progs-v2-1-45363230d228@bootlin.com>

On Wed, Nov 04, 2026 at 10:59:33AM +0100, Alexis Lothoré (eBPF Foundation) wrote:
> Commit ff205766dbbe ("ftrace: Fix function_graph tracer interaction with
> BPF trampoline") made sure that trampolines generated for tracing
> programs did not collide with the function graph when we are returning
> from the hooked function. The series bringing this commit also came with
> a new test ensuring that the kernel does not crash when executing BPF
> programs handled by trampolines while the function graph trace is
> enabled, but this test is a standalone shell script, hence not executed
> in CI.
> 
> Convert the script to the test_progs runner so it can be executed
> automatically by the CI infrastructure. There are two main options to
> port this test:
>   - just enable ftrace during some existing trampoline-related tests
>     (eg: fentry/fexit tests)
>   - create a dedicated, minimal test with function graph
> 
> The new test adopts the latter approach, with a smaller scope to keep
> execution time reasonable, while reusing an existing
> fentry/fexit/fmod_ret test. Despite the few asserts in the new test, the
> actual goal is to make sure that the kernel does not crash because of
> some incorrect stack frame skipping when both the function graph and
> tracing programs are running.
> 
> ftrace is configured through a dedicated ftrace instance which is
> dropped at the end of the test.
> 
> With the new test integrated into test_progs, drop test_ftrace.sh.
> 
> Signed-off-by: Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
> ---
> Hello,
> this is v2 of a small series aiming to port the test_ftrace.sh script
> (testing that trampolines and function graph behave correctly when both
> are enabled) into the test_progs framework. The test is heavily
> simplified following Alexei's review and suggestions.
> ---
> Changes in v2:
> - use a ftrace instance rather than global ftrace
> - drop fgraph filters
> - drop custom ftrace helpers in favor of direct manipulation in test
> - drop custom bpf prog, reuse test_modify_return directly
> - move test in existing test file (modify_return.c)
> - make the test parallel (drop serial_)
> - Link to v1: https://patch.msgid.link/20261030-ftrace_in_test_progs-v1-0-aa50c5dd1ccc@bootlin.com

lgtm, it might be worth to add something like this also for
tracing-multi (maybe also kprobe-multi) and run some tests
with function or function_graph enabled

Reviewed-by: Jiri Olsa <jolsa@kernel.org>

jirka

SNIP

> +void test_modify_return_graph(void)
> +{
> +	char instance[MAX_INSTANCE_PATH_LEN];
> +	char *ftrace_dir;
> +	int ret;
> +
> +	ftrace_dir = access(TRACE_FTRACE_DEFAULT, F_OK) ? TRACEFS_IN_DEBUGFS :
> +							  TRACEFS_DEFAULT;
> +
> +	ret = snprintf(instance, MAX_INSTANCE_PATH_LEN,
> +		       "%s/instances/bpf-XXXXXX", ftrace_dir);
> +	if (ret < 0)
> +		return;
> +
> +	if (!ASSERT_OK_PTR(mkdtemp(instance), "mkdtemp"))
> +		return;
> +
> +	SYS(out, "echo 'bpf_modify_return_test*' > %s/set_ftrace_filter",
> +	    instance);

nit, no need for new line

> +	SYS(out, "echo function_graph > %s/current_tracer", instance);
> +
> +	test_modify_return();
> +
> +	SYS(out, "grep -q bpf_modify_return_test2 %s/trace", instance);
> +out:
> +	ASSERT_OK(rmdir(instance), "rmdir");
> +}
> diff --git a/tools/testing/selftests/bpf/test_ftrace.sh b/tools/testing/selftests/bpf/test_ftrace.sh
> deleted file mode 100755
> index f5109eb0e951..000000000000
> --- a/tools/testing/selftests/bpf/test_ftrace.sh
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -#!/bin/bash
> -
> -if [[ -e /sys/kernel/tracing/trace ]]; then
> -    TR=/sys/kernel/tracing/
> -else
> -    TR=/sys/kernel/debug/tracing/
> -fi
> -
> -clear_trace() { # reset trace output
> -    echo > $TR/trace
> -}
> -
> -disable_tracing() { # stop trace recording
> -    echo 0 > $TR/tracing_on
> -}
> -
> -enable_tracing() { # start trace recording
> -    echo 1 > $TR/tracing_on
> -}
> -
> -reset_tracer() { # reset the current tracer
> -    echo nop > $TR/current_tracer
> -}
> -
> -disable_tracing
> -clear_trace
> -
> -echo "" > $TR/set_ftrace_filter
> -echo '*printk* *console* *wake* *serial* *lock*' > $TR/set_ftrace_notrace
> -
> -echo "bpf_prog_test*" > $TR/set_graph_function
> -echo "" > $TR/set_graph_notrace
> -
> -echo function_graph > $TR/current_tracer
> -
> -enable_tracing
> -./test_progs -t fentry
> -./test_progs -t fexit
> -disable_tracing
> -clear_trace
> -
> -reset_tracer
> -
> -exit 0
> 
> ---
> base-commit: b0e67f50519538b1b4c6364edc7811f482703f75
> change-id: 20261027-ftrace_in_test_progs-d5f70a2330ac
> 
> Best regards,
> --  
> Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
> 
