Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C1026E711
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 12:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773318286; cv=none; b=Vv6fWsyPtex3R6vfEZv6oAV4bBmj0bR+2DW1seGnXZW3YkvJa4P/GzDLK1ELqaOJkoa02FpK+stz6NXwN0R4XAWMxg0k3F/B2URsNlkIwpclTgrHx8brxDkHmpJhiF7dqnSpra04q6yh2SNEy4bQTxa55of2aDIgMF04fyH6J8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773318286; c=relaxed/simple;
	bh=thDU1lc0YZXHDnsXSBJjM7lkH/txuV9wpd4r0xFdGdg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlJyBUGD+mtg5sikBu/8eYhV/3I775Yg4HMaN3asKh63XBX2MBeZLyRpKu0Ti6vLwe4kbjYo91CypskcFSHQWILHG5rqkTh8J7YiitmM8lFrcjX4ZKbGtWOmLe8W6Jxu2SEUJA9Baj+ewG4QUBA5ceS8eDCtQDZAszezRJ8t+YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZHx1K8l; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZHx1K8l"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4853f2826f7so8588685e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 05:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773318284; x=1773923084; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O8rYdnhSYW1AF/6LzB31WRXHxUO9w4SQomrMEzPi0XY=;
        b=gZHx1K8l5SYgLcJAJueDdFbZ/bmQBY7W5JJlamnbDWX1r0r+5gWety4PbYkonTxD7X
         BtKlZTgNkO8dZTQjGsv7b88xXaPwUYEhISqH12rEMjih/kzqoAUKfuXt+Kf/wYO7Klkk
         4iiKydxl+1KBhhqcQGTFNh9InRleFmV3JAlr4ol//HUO0KbDqdEZl+mo41z2+HwpWA00
         q5908BUBrjd+xJXgavS5+bOaRU+jj5Tz4+e1buSWvmKdUSlK+jAH45nFbzDOBINJySkI
         nWAZWflnxN/IbaFo6CUIrUacPHsUGTRS5i+ReP7GX18CI5zr4Ksdu17eXMaOWk6kwzuD
         wvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773318284; x=1773923084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O8rYdnhSYW1AF/6LzB31WRXHxUO9w4SQomrMEzPi0XY=;
        b=Crsq9eL3h2N+icdgjTO9rS3Zd8XawXvsyjZgTxA1ebbK2jv/jp58jz7u1pmR/0r6GW
         7w7fNRW+9lkEoR3o7BCNd75juQTkwKOokgYLTThy000gRVPKDaoFk8q+3CQKP4CWgD/F
         qbGB/PnQP2tZOexqJPDQFt8IPTrMMy12N/l4+kn/iXIebBs+VCb4Odkhf5ysO6gWpe6u
         fQ6eddKl6WxgShmmNDQuJSiU2BfVkMUMaSPBXNjXHYQwpjoAv5QqxjtUgUoLZcapOv6R
         sAFpmnKLNG1Ht+x3xTyYutyGQJvVPwbHuPVUIIzzxT9PRlY1zvKxvsuy+/GB6P3HOiHO
         Cmpw==
X-Forwarded-Encrypted: i=1; AJvYcCUgZSKgVz4a7Lb9ERw/pkIlLUnnUjEGJKGc580XvnYuN11xK97ec4jncqvIC6EBum4OLhj8uEbmfOWxiiW9xlI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyri/SZ7S0fiNBgkKfSElqEGWIdo8e0WWm7vV4k2WxTjljRf6xN
	ILDtcKHRAwvuPr4zLIQl//r14Ce4XCHmTuUaie+bGhr3nVJ5q2ROYH62
X-Gm-Gg: ATEYQzyCcRZbbvlXMtKqD+uQgJPlkov4UgXwGA7P9+aFXIjXjT63RCykwSW7x1rhPO+
	8+crThILkN0139luMjWANRF4y7CmBF88AuWKun5W7qrZO4V5wxLDkeBEaNjRzjFWnPu46DBQkXR
	z25T0xQFojk9TtmsRixe+rhpWlrFngJ1t27kiwueDtiETa+SyQh3LsfuBgcP/BihMMgxQ92j+VV
	Jy6b8Yj1L6FvIy/AXF5Zv7WXHo6dyUFwqv2xn3E1F3X2PodsVPBlaRLpHWDmM1S2TqaS35OKdMk
	dyRmN+xejQEa3m3oyQz3ZzYpFG6qxTTH8swrMt/YEruoDfWJKXioRpQxN8Xj/M1h7E/aMLRSQZD
	yza7OMZr2HiMGEmDeSIHSqov92h7e3m9xo/tRCm7gT6DTWVSMYde8ydrum03HbRZdtCeu8DtB
X-Received: by 2002:a05:600c:8b13:b0:485:30d4:6b9e with SMTP id 5b1f17b1804b1-4854b100b66mr105829985e9.21.1773318283507;
        Thu, 12 Mar 2026 05:24:43 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200::d99c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e9179sm125863655e9.3.2026.03.12.05.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 05:24:43 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 12 Mar 2026 13:24:42 +0100
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, andrii@kernel.org,
	shuah@kernel.org, ast@kernel.org, daniel@iogearbox.net,
	eddyz87@gmail.com, martin.lau@linux.dev
Subject: Re: [PATCH] selftests/bpf: modify_return: isolate fmod_ret hooks by
 pid
Message-ID: <abKwikMNfT0lhfl3@krava>
References: <20260312104219.1208802-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312104219.1208802-1-sun.jian.kdev@gmail.com>

On Thu, Mar 12, 2026 at 06:42:19PM +0800, Sun Jian wrote:

SNIP

> diff --git a/tools/testing/selftests/bpf/progs/modify_return.c b/tools/testing/selftests/bpf/progs/modify_return.c
> index 3376d4849f58..5ff18ddb3050 100644
> --- a/tools/testing/selftests/bpf/progs/modify_return.c
> +++ b/tools/testing/selftests/bpf/progs/modify_return.c
> @@ -7,16 +7,29 @@
>  #include <linux/bpf.h>
>  #include <bpf/bpf_helpers.h>
>  #include <bpf/bpf_tracing.h>
> +#include <stdbool.h>
>  
>  char _license[] SEC("license") = "GPL";
>  
>  static int sequence = 0;
>  __s32 input_retval = 0;
> +__u32 test_pid = 0;
> +
> +static __always_inline bool match_pid(void)
> +{
> +	__u64 pid_tgid = bpf_get_current_pid_tgid();
> +
> +	if (!test_pid)
> +		return false;
> +	return (__u32)(pid_tgid >> 32) == test_pid;
> +}
>  
>  __u64 fentry_result = 0;
>  SEC("fentry/bpf_modify_return_test")
>  int BPF_PROG(fentry_test, int a, __u64 b)
>  {
> +	if (!match_pid())
> +		return 0;

I think just simple pid check like we do in other places
should be enough:

	if (bpf_get_current_pid_tgid() >> 32 != test_pid)
		return 0;

jirka


>  	sequence++;
>  	fentry_result = (sequence == 1);
>  	return 0;
> @@ -26,6 +39,8 @@ __u64 fmod_ret_result = 0;
>  SEC("fmod_ret/bpf_modify_return_test")
>  int BPF_PROG(fmod_ret_test, int a, int *b, int ret)
>  {
> +	if (!match_pid())
> +		return ret;
>  	sequence++;
>  	/* This is the first fmod_ret program, the ret passed should be 0 */
>  	fmod_ret_result = (sequence == 2 && ret == 0);
> @@ -36,6 +51,8 @@ __u64 fexit_result = 0;
>  SEC("fexit/bpf_modify_return_test")
>  int BPF_PROG(fexit_test, int a, __u64 b, int ret)
>  {
> +	if (!match_pid())
> +		return 0;
>  	sequence++;
>  	/* If the input_reval is non-zero a successful modification should have
>  	 * occurred.
> @@ -55,6 +72,8 @@ SEC("fentry/bpf_modify_return_test2")
>  int BPF_PROG(fentry_test2, int a, int *b, short c, int d, void *e, char f,
>  	     int g)
>  {
> +	if (!match_pid())
> +		return 0;
>  	sequence2++;
>  	fentry_result2 = (sequence2 == 1);
>  	return 0;
> @@ -65,6 +84,8 @@ SEC("fmod_ret/bpf_modify_return_test2")
>  int BPF_PROG(fmod_ret_test2, int a, int *b, short c, int d, void *e, char f,
>  	     int g, int ret)
>  {
> +	if (!match_pid())
> +		return ret;
>  	sequence2++;
>  	/* This is the first fmod_ret program, the ret passed should be 0 */
>  	fmod_ret_result2 = (sequence2 == 2 && ret == 0);
> @@ -76,6 +97,8 @@ SEC("fexit/bpf_modify_return_test2")
>  int BPF_PROG(fexit_test2, int a, int *b, short c, int d, void *e, char f,
>  	     int g, int ret)
>  {
> +	if (!match_pid())
> +		return 0;
>  	sequence2++;
>  	/* If the input_reval is non-zero a successful modification should have
>  	 * occurred.
> 
> base-commit: 80234b5ab240f52fa45d201e899e207b9265ef91
> -- 
> 2.43.0
> 
> 
