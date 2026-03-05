Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77CC372ED1
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Mar 2026 09:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701325; cv=none; b=ZY2uXzj6RGi75nTn7Wn2Pd6FDV9jbWkKfXvI6G74pMAJbgBGYDbBgngcY4Do/8NJ3Te9Wtp3oT0YY+S+CVAtr2Ufbk1vAHVzOGAGY4gfXYzNPzx8w15Y9MtGC4hYac1t+veNRkajMQd7ErLX7jt19GqWDcNVlxMxp6xqsbx9kbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701325; c=relaxed/simple;
	bh=a5rBpBWOBS3wcPrS5p5QUXqWWF+XclPC5nE6V63Wxrc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cc0DXV7gYEKxjAfHS0az2TujY5ERWo3lYq9h5Uvon8gceukefqPQG0sdIkKAxDe2H3gBwF2xuJ7I29ViBkTf2tIYuP4OpP3TEC68ZT9y5Fuza8Lwwip72vE2OSRSDLVf8qpnrzuE3GOHk4GU7RYb8gLdfnBcW7J7hiNk9uy19+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQcFUspB; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQcFUspB"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4836f363d0dso68756535e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 01:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772701322; x=1773306122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S/zTahhn2CpHG1q5a+EKiLGuiWwzQcz0c+ixyqTUocs=;
        b=NQcFUspBceiKtC9AIrxTQ8dCEqD1SRQSOZnPQlNq5l3tCSREpYVPBjWrev4vkSz/bp
         0ilRXatFfncIO9v49teFORnMEypdk7Nykc4sFKtZoy9SNNwmNxa9+k1PBxQIW0dbCoDg
         G+AoKDxWlg/dm9DLfmRjpqhBDAYPzP1oa3KLpHs4z7YXWz6br6t5bT33qII42UgYS3gt
         zXL/YATqAxUw3hAiL3D5cCEoBypoovU2rxSlth0fQ5nfCDYy0klPsFEd2QdUG6Eu721a
         gKeKv2stdiUWZaKCQ8aoKH7uzCxTxYt6iBVGsAto1N8bESiOBikWAxC6j3sRFtqkQaXl
         +4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701322; x=1773306122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/zTahhn2CpHG1q5a+EKiLGuiWwzQcz0c+ixyqTUocs=;
        b=UNskNJoEDQFeDqi15CB0zjpo7Bzs+kCHGLV1eUXlhR3c84NSmtvvEgwKLK7HXMw7Mk
         B5Ugwr3KXZq8HbKWWkw2wDmYjxHnltQCS7QxsVekoaaN4SovSCwzCae+qu+2xzlH/k05
         LhO3pUZJUc3PcBF8zdxNY2MBljLGY6dE24lCoXnIG8Hfoz9TRoUS3oU1Nqe3jeNacX7f
         9a2jMwcGAZT3LK+FOaneYilJ4ct0vpVF2CdUQ0e7CsfClY1EOp6MNM2fp7H0t75u5sq6
         PkgcS61wy+SEnk5JIIvEewlR7Qq8tYkzmbwmedTgmwHrPf/JkUkt3N2tdWiqQNAmeHaC
         0Qug==
X-Forwarded-Encrypted: i=1; AJvYcCXEudNRukF8Jcb2npJes05uVo63GSuQSfQ5WlC7wpW8Lw/vfKdc4h0vlDFoGKXjhqUFpZKHSTpN2XpakLB1vgM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9C7zQVOjvS9lhIaWH7parFJcSQDIe9YRtWNk4CBaRpFfPXnJl
	d99OIV5mnx7EMuzQba429IjgxSmtgsGaoy1viAJEjEz9VRVvT3ec7EGH
X-Gm-Gg: ATEYQzz31rBRPcEgAhK7ldYJgzSpeAEpTFjlQM163oC2zOnzJto3yl7eDOEEjJzGRfr
	zBB3maGx7lunbPiyxg+ZA3TUc0HF+THzL7MGrdmnHzFea1yXpRJ+YloPje5WQSoKbR3TsZlgHdF
	hYoPAvo59MDm7Vimrw3am5rFwzZGhoJgdFKzk2SUoU5OAHKODpG6eX+Gqu7RUzF17HfNR58lcEf
	Oz7oUze1dbyHq+ig2UeP4zn/DduB5DCuM3xJmSYoimbmYkEaBWEYlVU6159lp2Q2YQfh73hqxg0
	QHGHTv6PLxt6unaPZScEEyDho2u+Yr8OcYKv2sT+RYupqxjXdldsd9/VqF62IxENBxa8YfKUFIv
	NPBTvyehKPuB7SUCafq5QD5659yRkxABwqiJjeLpQa0M5qoXC7jYpsXxXAKRN/BMFAiJMwNby
X-Received: by 2002:a05:600c:470d:b0:483:702d:2df with SMTP id 5b1f17b1804b1-485198a4a30mr80355445e9.32.1772701321968;
        Thu, 05 Mar 2026 01:02:01 -0800 (PST)
Received: from krava ([2a02:8308:a00c:e200::d99c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851a8955c1sm42249325e9.1.2026.03.05.01.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:02:01 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 5 Mar 2026 10:01:59 +0100
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, Song Liu <song@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 bpf-next] selftests/bpf: livepatch_trampoline: skip
 when prerequisites are missing
Message-ID: <aalGh2sjKl_mZp7G@krava>
References: <20260305030258.5273-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305030258.5273-1-sun.jian.kdev@gmail.com>

On Thu, Mar 05, 2026 at 11:02:58AM +0800, Sun Jian wrote:
> livepatch_trampoline relies on livepatch sysfs and livepatch-sample.ko.
> When CONFIG_LIVEPATCH is disabled or the samples module isn't built, the
> test fails with ENOENT and causes false failures in minimal CI configs.
> 
> Skip the test when livepatch sysfs or the sample module is unavailable.
> Also avoid writing to livepatch sysfs when it's not present.
> 
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---
> 
> v2:
>   - Add missing Cc's suggested by get_maintainer.pl
>   - Prefix subject with bpf-next to avoid Patchwork tree mis-detection
>   - Drop Fixes tag to avoid verify_fixes issues due to tree mismatch
>   - No code changes
> 
> v1: https://patchew.org/linux/20260227042354.20926-1-sun.jian.kdev@gmail.com/
> 
>  .../bpf/prog_tests/livepatch_trampoline.c     | 28 ++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/bpf/prog_tests/livepatch_trampoline.c b/tools/testing/selftests/bpf/prog_tests/livepatch_trampoline.c
> index 72aa5376c30e..75336d9c2313 100644
> --- a/tools/testing/selftests/bpf/prog_tests/livepatch_trampoline.c
> +++ b/tools/testing/selftests/bpf/prog_tests/livepatch_trampoline.c
> @@ -2,9 +2,12 @@
>  /* Copyright (c) 2025 Meta Platforms, Inc. and affiliates. */
>  
>  #include <test_progs.h>
> +#include <unistd.h>
>  #include "testing_helpers.h"
>  #include "livepatch_trampoline.skel.h"
>  
> +#define LIVEPATCH_ENABLED_PATH "/sys/kernel/livepatch/livepatch_sample/enabled"
> +
>  static int load_livepatch(void)
>  {
>  	char path[4096];
> @@ -19,7 +22,8 @@ static int load_livepatch(void)
>  static void unload_livepatch(void)
>  {
>  	/* Disable the livepatch before unloading the module */
> -	system("echo 0 > /sys/kernel/livepatch/livepatch_sample/enabled");
> +	if (!access(LIVEPATCH_ENABLED_PATH, F_OK))
> +		system("echo 0 > " LIVEPATCH_ENABLED_PATH);
>  
>  	unload_module("livepatch_sample", env_verbosity > VERBOSE_NONE);
>  }
> @@ -82,6 +86,28 @@ void test_livepatch_trampoline(void)
>  {
>  	int retry_cnt = 0;
>  
> +	/* Skip if kernel was built without CONFIG_LIVEPATCH */
> +	if (access("/sys/kernel/livepatch", F_OK)) {
> +		test__skip();
> +		return;
> +	}
> +
> +	/*
> +	 * Skip if livepatch-sample.ko was not built (same path logic as
> +	 * load_livepatch()).
> +	 */
> +	{
> +		char path[4096];
> +
> +		snprintf(path, sizeof(path),
> +			 "%s/samples/livepatch/livepatch-sample.ko",
> +			 getenv("KBUILD_OUTPUT") ? : "../../../..");
> +		if (access(path, R_OK)) {
> +			test__skip();
> +			return;
> +		}
> +	}
> +
>  retry:
>  	if (load_livepatch()) {

load_livepatch returns -ENOENT if we fail to open the file, we could
check for it instead of putting together the path again

jirka
