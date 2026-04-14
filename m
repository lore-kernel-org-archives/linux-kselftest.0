Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DD230EF89
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 19:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776196291; cv=none; b=o4FawE+aau+HsbyDdhVeBkRnVrtl8mQwwAtcD6hzCDjPG5YI+ukcEltz+6o+tApkG4dYsjJpIETDytGBB0DuAYaLZ451e7TUfrsEZSBIWTR72fyXrSVmB1uiLsh46FLeC7SCK7RCNIDW4zbT1y2M84WHjVE93rJGDt9aKg0oYWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776196291; c=relaxed/simple;
	bh=Ktyo/tmwj8hKfjyIiy6TVXwWZHzA2TsM7aZHkNix6T0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GGCwSaUEYKExdjr3XYnL0v+vV8/7cZYFk0vGh7y78IHZy/Yn4yHELogIDdHLWghG4YTpOEgjIEvDcQDCpz2GoN6bALsTAgwzZSd7b8jZ0CUJlk6WiDWl+QEcbDUNFMev14yHYon7HGjCn/FSu9GNQucnaaMmbpgtG/61OByY1Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wKLGMMmp; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wKLGMMmp"
Date: Tue, 14 Apr 2026 12:51:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776196278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fEtLnsJn3BqMpUymKETuHSwe/D/AvMKw4t2nNlXY6lI=;
	b=wKLGMMmpP2+jRWxM5XMZBAgY1PXFs44BBFZiRRb2OJR67N5FlNbPPN9FTdV8yUz7Vzp61W
	lqqnWq6LS+Afz9W5flfgI18REp0fGymKsrGBmPiNE2FcBgo/G4jeSW8O23vdxirS0IhyVp
	AG66u7qKnwdnRL2Z+zsghjkdoJPhSKM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Martin KaFai Lau <martin.lau@linux.dev>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	David Ahern <dsahern@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, 
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/2] net: add missing syncookie statistics
 for BPF custom syncookies
Message-ID: <2026414194421.camy.martin.lau@linux.dev>
References: <20260411013211.225834-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411013211.225834-1-jiayuan.chen@linux.dev>
X-Migadu-Flow: FLOW_OUT

On Sat, Apr 11, 2026 at 09:32:04AM +0800, Jiayuan Chen wrote:
> 2. Remove the CONFIG_BPF_SYSCALL guard around struct bpf_tcp_req_attrs.
>    This struct is referenced by bpf_sk_assign_tcp_reqsk() in
>    net/core/filter.c which is compiled unconditionally, so wrapping
>    the definition in a config guard could cause build failures when
>    CONFIG_BPF_SYSCALL=n.

A typo and CONFIG_BPF is removed instead?

but the reason is probably not because of a build error.

> diff --git a/include/net/tcp.h b/include/net/tcp.h
> index 6156d1d068e1..570a8836c2ba 100644
> --- a/include/net/tcp.h
> +++ b/include/net/tcp.h
> @@ -598,7 +598,6 @@ struct request_sock *cookie_tcp_reqsk_alloc(const struct request_sock_ops *ops,
>  					    struct tcp_options_received *tcp_opt,
>  					    int mss, u32 tsoff);
>  
> -#if IS_ENABLED(CONFIG_BPF)
>  struct bpf_tcp_req_attrs {
>  	u32 rcv_tsval;
>  	u32 rcv_tsecr;
> @@ -612,7 +611,6 @@ struct bpf_tcp_req_attrs {
>  	u8 usec_ts_ok;
>  	u8 reserved[3];
>  };
> -#endif
