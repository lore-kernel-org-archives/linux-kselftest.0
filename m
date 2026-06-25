Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE152F0C74
	for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 07:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782371675; cv=none; b=lI3gswvGi4256wH4uZTgworecGxuV8p+fCqonzc4RkAY3cU38JAdrnpzK+d3qeMtlL6a1zZvLOkkJnT/DahJ2MkQ552XyU0b7ueBZT8slWXmwvy7zs0fncHvoR6qPoMt2AYnmzbZ6yCQtjMzDEe6aRkMSTeszEc9kSZJsU2lDc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782371675; c=relaxed/simple;
	bh=QbICK9wrh2gpYQdHnESuWJy8qhKdWhtOxHviZEvhwoo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pj1avvQJVCiwF4MR2PSPGWvL49jVscfiSRJDXemv8Roq1ehvzy2J5K/+RX3FrEznohooYLJFhRoUlmNnALC1RiklEuCSFo78qOqHmISJL5m30k7VdRacWF10mtC8FyyAczVwCcrQaAsJ91TPthOT4G4uENFiw4BhnW9VIVnrowM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f4KjwnTv; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f4KjwnTv"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-464192ab2e1so1321383f8f.0
        for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 00:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782371672; x=1782976472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dYsyNt+dNTSQfEixGcREuuIxjYdQa1txUX0tMR2AGPw=;
        b=f4KjwnTvJ6I3Bs/NOLIyWUbDoooMnv0Wa/qqKG5DzVSfvQCDxPrEJMfZGsbUYQlIdF
         MgnKc44Eq6JsTyTqxr5LsTzR6vPxI1xK3D8Zbqb+DdycC0IoTYSgcayLhA7Mtn8m4921
         rV8eq/o1FjXT0BcObkXr5MGNLQC9g4dHMfsBYqDMgECtznvp1iSt326wRCYjO5Q0usZk
         43v+p9KwOFx4LS3UXTK29qf2V4u3MZNDPb9H9NvholjWnKg8CmIfk9wV9h43UdPLZo95
         C5Vrz5hmjzdm7LUXL2FLJp3qb2EP9u5TZLMfKAtNcBvR+I3i+G2UY3nzxFgjRkXoiYtE
         yOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782371672; x=1782976472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYsyNt+dNTSQfEixGcREuuIxjYdQa1txUX0tMR2AGPw=;
        b=XGz9mNMGHF9S2o7R8o9Wx4mxtp4myKme14+QIernPckj0g96ce6vjy4/JBrkx+2a/l
         XI2q8PbcLQee20YD5KdyE2t1Hw2GD8tLqURZ1552wS44LzINMKLU9ovsdUwKD/TJUy2q
         EKsNl4onGDYKg/Jpmbqmbql1PLP1CCTFhp6e9HN/GmpfMSQdEbIDxFp477auYA3xF/8+
         7F2v42jd7B7IH9rFsfhyC5MjJI+DVBxR0qky0we9AdFGf1cwfHXgL8+3+ElHWsZmgJSp
         kuowNnxbrJ9pi/KmNYiBfgUnRKpjmsc7n+o5x1F5QBLxgUMITetGYJA+HmH79o+FfQGt
         bQdQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro04USjcVtI3sX7ow6lCD9zgiWamevkHv1e4a3ZZfkV8oFRNO4filFZvK76Fp7tlv6C5fap6nZDosAfzlUDq5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLOA2U82bY4AH2Qef/ehBOndjYIAHeVlAeyjS/abEBnpbgIKF4
	o8eAUZ+NkU4ji1JRGLqqu3hFm+nszeNa9t0NcNJ5kdbUXLmj6S1a20gD
X-Gm-Gg: AfdE7clmWaGQe6DSBzzKWSCmMe3sRchMfW7T03uP0LDEqnPnW+QYD7BACzzRTD6KKdG
	Vm5++wS73EBWmjF+0MMJd2xG5qdjk9DXTnh9bQIfwUlZAq5CWTUSoWXOCsqFm654CJm8nyIrRZ2
	i3AINd2jbRTYIATAHgPASBd3LPBaN+Qhb32xhA1IctCoVOg/piQaeQZZASrUFahplNnJl6XBDha
	IT1c1a3ZlFiTYJ9x1sPF2pk5kuF5azquEnJqi3AgPybvvRBwEi/bp8yBqmRndqgtOkCdVfHIvwD
	0wCwcctUIPd8zV6VGXT2dYi7e4ary6pGl3S1m3u/Bj9UnsAZBRKSnDw3W0AAIKJhkL7dUnQi/am
	AFXuCUyHdR5G3OxWWf1nWRkOeODVeKiX+ryedzfqfz2QD9nGh3KLZow1lVuYvtUDdyAV9kNXZ5f
	HlVinEKAUill/15oQ=
X-Received: by 2002:a05:6000:26d2:b0:46d:6051:15f9 with SMTP id ffacd0b85a97d-46dbef25887mr1528737f8f.6.1782371671435;
        Thu, 25 Jun 2026 00:14:31 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01c6csm13911865f8f.14.2026.06.25.00.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 00:14:30 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 25 Jun 2026 09:14:28 +0200
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net,
	john.fastabend@gmail.com, andrii@kernel.org, eddyz87@gmail.com,
	memxor@gmail.com, martin.lau@linux.dev, song@kernel.org,
	yonghong.song@linux.dev, emil@etsalapatis.com, shuah@kernel.org,
	laoar.shao@gmail.com, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf 1/2] bpf: Preserve link info metadata on ENOSPC
Message-ID: <ajzVVFmd_58zSt9a@krava>
References: <20260624111837.889209-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624111837.889209-1-sun.jian.kdev@gmail.com>

On Wed, Jun 24, 2026 at 07:18:36PM +0800, Sun Jian wrote:
> BPF_OBJ_GET_INFO_BY_FD for bpf_link copies struct bpf_link_info back to
> userspace only when ->fill_link_info() succeeds. Some link info providers,
> however, can return -ENOSPC after computing valid metadata when a nested
> userspace output buffer is too small.

we return the count/size/cnt value when the related user space pointer
is not specified.. we return -ENOSPC when user space pointer is
specified but thits space is not big enough

jirka

> 
> For example, perf event tracepoint link info can determine the required
> tp_name length before copying the name fails with -ENOSPC. The current
> top-level error handling returns immediately in that case, so userspace
> observes -ENOSPC but loses the metadata needed to retry with a sufficiently
> large buffer.
> 
> Allow bpf_link_get_info_by_fd() to copy the top-level bpf_link_info back
> on -ENOSPC, while still returning -ENOSPC to userspace. Also let perf
> event kprobe, uprobe, and tracepoint link info fill their metadata before
> returning -ENOSPC from nested name buffer copying.
> 
> Fixes: f2e10bff16a0 ("bpf: Add support for BPF_OBJ_GET_INFO_BY_FD for bpf_link")
> Fixes: 1b715e1b0ec5 ("bpf: Support ->fill_link_info for perf_event")
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---
>  kernel/bpf/syscall.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index 6db306d23b47..80ab02b1c813 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -4060,7 +4060,7 @@ static int bpf_perf_link_fill_kprobe(const struct perf_event *event,
>  	ulen = info->perf_event.kprobe.name_len;
>  	err = bpf_perf_link_fill_common(event, uname, &ulen, &offset, &addr,
>  					&type, &missed);
> -	if (err)
> +	if (err && err != -ENOSPC)
>  		return err;
>  	if (type == BPF_FD_TYPE_KRETPROBE)
>  		info->perf_event.type = BPF_PERF_EVENT_KRETPROBE;
> @@ -4073,7 +4073,7 @@ static int bpf_perf_link_fill_kprobe(const struct perf_event *event,
>  		addr = 0;
>  	info->perf_event.kprobe.addr = addr;
>  	info->perf_event.kprobe.cookie = event->bpf_cookie;
> -	return 0;
> +	return err;
>  }
>  
>  static void bpf_perf_link_fdinfo_kprobe(const struct perf_event *event,
> @@ -4116,7 +4116,7 @@ static int bpf_perf_link_fill_uprobe(const struct perf_event *event,
>  	ulen = info->perf_event.uprobe.name_len;
>  	err = bpf_perf_link_fill_common(event, uname, &ulen, &offset, &ref_ctr_offset,
>  					&type, NULL);
> -	if (err)
> +	if (err && err != -ENOSPC)
>  		return err;
>  
>  	if (type == BPF_FD_TYPE_URETPROBE)
> @@ -4127,7 +4127,7 @@ static int bpf_perf_link_fill_uprobe(const struct perf_event *event,
>  	info->perf_event.uprobe.offset = offset;
>  	info->perf_event.uprobe.cookie = event->bpf_cookie;
>  	info->perf_event.uprobe.ref_ctr_offset = ref_ctr_offset;
> -	return 0;
> +	return err;
>  }
>  
>  static void bpf_perf_link_fdinfo_uprobe(const struct perf_event *event,
> @@ -4180,13 +4180,13 @@ static int bpf_perf_link_fill_tracepoint(const struct perf_event *event,
>  	uname = u64_to_user_ptr(info->perf_event.tracepoint.tp_name);
>  	ulen = info->perf_event.tracepoint.name_len;
>  	err = bpf_perf_link_fill_common(event, uname, &ulen, NULL, NULL, NULL, NULL);
> -	if (err)
> +	if (err && err != -ENOSPC)
>  		return err;
>  
>  	info->perf_event.type = BPF_PERF_EVENT_TRACEPOINT;
>  	info->perf_event.tracepoint.name_len = ulen;
>  	info->perf_event.tracepoint.cookie = event->bpf_cookie;
> -	return 0;
> +	return err;
>  }
>  
>  static int bpf_perf_link_fill_perf_event(const struct perf_event *event,
> @@ -5536,7 +5536,7 @@ static int bpf_link_get_info_by_fd(struct file *file,
>  	struct bpf_link_info __user *uinfo = u64_to_user_ptr(attr->info.info);
>  	struct bpf_link_info info;
>  	u32 info_len = attr->info.info_len;
> -	int err;
> +	int err = 0;
>  
>  	err = bpf_check_uarg_tail_zero(USER_BPFPTR(uinfo), sizeof(info), info_len);
>  	if (err)
> @@ -5554,7 +5554,7 @@ static int bpf_link_get_info_by_fd(struct file *file,
>  
>  	if (link->ops->fill_link_info) {
>  		err = link->ops->fill_link_info(link, &info);
> -		if (err)
> +		if (err && err != -ENOSPC)
>  			return err;
>  	}
>  
> @@ -5562,7 +5562,7 @@ static int bpf_link_get_info_by_fd(struct file *file,
>  	    put_user(info_len, &uattr->info.info_len))
>  		return -EFAULT;
>  
> -	return 0;
> +	return err;
>  }
>  
>  
> -- 
> 2.43.0
> 
