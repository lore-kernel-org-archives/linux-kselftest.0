Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7203F448D11
	for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 13:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787666346; cv=none; b=I9i0IOeghIqLo4GQGycYYpo30dg6dOK8Eixrshhw+05Pkjns4OyOpCLE3f2xRd+MgtowkQ8YM5V3oXMg01NWLOdD4EYjcpQ5FrH1pqflW3TbtxnayJD0Vm9gXpHLG9GPGz522ysIw9vDp8qM91MXpG8Xthc6f+u05Dal3RZV1h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787666346; c=relaxed/simple;
	bh=nKM2TC2rTebBFdh2lSE9BNzST0jeewyQnSnCPDX0e4c=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u4Dt18oauPl84aBch8yOr0M9I6e79O72bpT2ilsHPXU5QfRHWE2drUXwu4ajDxxdS5YQubNmHeuGu3gy0OMN9TvKsZxTgKU5VR28WaQBApAhflJwpDQjJVEHe6Hwh+8J3f09/IrvfV1zFaewB1sBsSRzPcQ12X54qKcblKq4ikg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dmww3tVZ; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dmww3tVZ"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c214e625259so729936566b.2
        for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 06:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787666342; x=1788271142; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nbf2MfS3ndDcpGRywqsHpSvOZSKnXiwdsBEused24JY=;
        b=dmww3tVZ1LlE9TUkOgwSsvZyeM40TwOQQzhRkXLyWZrd6HHa9NRU7ke5xHQ5w9o1nM
         CtExxZw2xd7UUErjOXB9jcP4fr4QDCckbGEbXYmsnjVsWOUv9zoHUk24BoyIl+wxLfUa
         eB2/X17bq4f7lz4ebi1EoIVmJKCGS8TiepHotkY0uNG2ztllJVpIy84l3MXX/kWzq3FH
         kxCoWtTP+2rne0pyvdAtH36qDR6KAASDaElJnvs36T6RSxKBeMdCl5paek5svpfGWnUO
         KHut7pmvM7NKJzRYDGZQp54o0hWm6C6f207D1tlRCYCJZBSIKMPFzN0nCKoVTvAWcXgr
         ZnBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787666342; x=1788271142;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nbf2MfS3ndDcpGRywqsHpSvOZSKnXiwdsBEused24JY=;
        b=UcN/ez9kE5BvOwDqXPbg83evSkeMzH6/wsDLnaVM28maZWXlpqBlSgclJ4kE2TSj4v
         gm00QQ54J8lCwx3eHUo89nf4Z/KAIhGZ5opnBAStgE1KUMLmX9BhkngE3zdmTf20PBJ1
         0R2AKxqEHKwrBdwpyWJJON9uNmetsi5o7Ae3hgE4pQNV13vCcDW3Y12oTVGMPO1bg51J
         9HMSA4FHx6VCQMHmsSRRMsK5RNUsQLKVX3nXRKXBD6U5jErJBpiVs5MY52A1WH8EJEZo
         i4H45OXyl91K50K3N5VHmifSaitLnwy5xVImMysnIAFvtHwjTzSLi4yB5SkOiT74iZxB
         gC6g==
X-Forwarded-Encrypted: i=1; AHgh+RpW2m65VT9x/Q51CB5Ayfnw8W3OyLu8HvDqAOIyy2lpZNBruxNroAh8chFY6N8kSRli57Bu4+NPSdCiIft1GE4=@vger.kernel.org
X-Gm-Message-State: AFuF++kHKcXz5KJJgwRwztgJFuq95fxYdZPP6dTUYqmpqvNt4alQxcLl
	6lr4uBFd2UMK6VSfJm0EdSs5dJBNMSBRqGB8eS3u4pazXM4Bs2Tq4E5a
X-Gm-Gg: AR+sD13KLAGm+WmSsVHi8oX/l/Er4D4qIOOzdBOHtzK81VoVI2RIscp2W7kHDGQuss9
	Lr4LnFLfPiqhSM+Sb20UfUNYSqGXapsLSba0gS5xqP7D2h+MJ8Z4vBz5UbnKkgXXfc5OqmAjP25
	PmHYNpqWfMU1GHqlO7ce/gk1LssqEBYIIUYt7pvNMkIwT9PvGsGZHsnRJDxLimbEDWg822sk94D
	+4LpZekcu4NR5lWQLiRz+3mqK6lOtsDFoilevBC7gjNI6+Rt+FboYR9weW1mFRxLF2+Ejo2U8hh
	K4qTBl8PG3geoHDeoqzh0c/hI6ELlKdB5Q7zF1RddI6WfXl3DoQlV9APj89l/KiyoTKiGwy1SBn
	vnDvavtLp7Kx1+tTG80iBEiUAXEoYKQu9trYYJLHbMO9p6DKuILOAzQ/WmJfEqc/7zCa9MNjPpE
	TD5kM1VrBnEuGz50yJW6LSx/kSwt6g7OFN9dsdFqDHQZ2Q6/A=
X-Received: by 2002:a17:907:9814:b0:c21:792:8257 with SMTP id a640c23a62f3a-c24e5ad9556mr774163266b.15.1787666341366;
        Tue, 25 Aug 2026 06:59:01 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b208sm1670089666b.10.2026.08.25.06.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 06:59:00 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 25 Aug 2026 15:58:58 +0200
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Jiawei Zhao <phoenix500526@163.com>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf 1/2] libbpf: Fix usdt attach failure when nop10
 crosses page boundary
Message-ID: <ao2fomkGLiwm032U@krava>
References: <20260824092847.361683-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824092847.361683-1-jiayuan.chen@linux.dev>

On Mon, Aug 24, 2026 at 05:28:36PM +0800, Jiayuan Chen wrote:
> The kernel refuses to attach to a nop10 that crosses a page boundary,
> since it can't be atomically rewritten:
> 
> 	/* can_optimize(), arch/x86/kernel/uprobes.c */
> 	/* We can't do cross page atomic writes yet. */
> 	return PAGE_SIZE - (vaddr & ~PAGE_MASK) >= OPT_INSN_SIZE;
> 
> Whether the nop10 crosses a page is purely up to the binary layout, so
> this does happen in practice. libbpf doesn't check for it and blindly
> shifts the uprobe onto the nop10, and the attach then fails with
> -ENOTSUPP. Just keep the uprobe on the preceding 1-byte nop in that
> case, it works everywhere as a regular int3 uprobe.
> 
> Fixes: 41a5c7df4466 ("libbpf: Add support to detect nop,nop5 instructions combo for usdt probe")
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---
>  tools/lib/bpf/usdt.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/lib/bpf/usdt.c b/tools/lib/bpf/usdt.c
> index 2e56e3ab5b6c..c266ac93cbdd 100644
> --- a/tools/lib/bpf/usdt.c
> +++ b/tools/lib/bpf/usdt.c
> @@ -614,11 +614,28 @@ static bool has_nop_combo(int fd, long off)
>  		return false;
>  	return memcmp(buf, nop_combo, 11) == 0;
>  }
> +
> +/*
> + * The kernel refuses to attach to a nop10 that crosses a page boundary,
> + * as it can't be atomically rewritten. Page offset of the probe is the
> + * same in the file and in any mapping, so this can be checked statically.
> + */
> +static bool nop10_within_page(long off)
> +{
> +	long page_sz = getpagesize();
> +
> +	return off % page_sz + 10 <= page_sz;

could this be another check in has_nop_combo ? so we do not
need to introduce another stub

otherwise lgtm, thanks

jirka


> +}
>  #else
>  static bool has_nop_combo(int fd, long off)
>  {
>  	return false;
>  }
> +
> +static bool nop10_within_page(long off)
> +{
> +	return false;
> +}
>  #endif
>  
>  static int collect_usdt_targets(struct usdt_manager *man, struct elf_fd *elf_fd, const char *path,
> @@ -827,9 +844,11 @@ static int collect_usdt_targets(struct usdt_manager *man, struct elf_fd *elf_fd,
>  		/*
>  		 * We have uprobe syscall and usdt with nop,nop10 instructions combo,
>  		 * so we can place the uprobe directly on nop10 (+1) and get this probe
> -		 * optimized.
> +		 * optimized. If the nop10 crosses a page boundary, keep the uprobe
> +		 * on the preceding 1-byte nop, which the kernel accepts everywhere.
>  		 */
> -		if (man->has_uprobe_syscall && has_nop_combo(elf_fd->fd, usdt_rel_ip)) {
> +		if (man->has_uprobe_syscall && has_nop_combo(elf_fd->fd, usdt_rel_ip) &&
> +		    nop10_within_page(usdt_rel_ip + 1)) {
>  			usdt_abs_ip++;
>  			usdt_rel_ip++;
>  		}
> -- 
> 2.43.0
> 
