Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6001D6187
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 20:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774644122; cv=none; b=A3Tyg8ZIcbdSAwZevBVfSxH+MkIDrTXanxrnXxxCTpx8vsp+I/9kahjxGCe4DLx8pj3PmbIbvJe+nSwPLz5/2Rr86TcEXXwc7DU2oGaaopZkDLqKST19WgEDv03GxvlBl/NxjAv9KFxujrpwhtYC8Myex+GtSJBK+F6lHkmMfRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774644122; c=relaxed/simple;
	bh=OseZgolmzhAr4jFqxBRNN1L/7ggRloDkt++YOQpR2p8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U9q+p9fff2LcrY/GmJbZrxgxxJlVUmDr317kiM886itzd6yXP2HmPjX7f2Znas+CUWXcCM5vHj9cjDa+Lu5B/LWn/zicfleQKQ/BXx8hyD7Gq0IMu4/bx0w+Iix4bnWHzorcjLUI76b6xIgIs7GxuI+oiTixxMkKT+f6hl5VT/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nM/BfZ+Y; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nM/BfZ+Y"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486b9675d36so22186005e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 13:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774644119; x=1775248919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sZ/7XD1rJXQYlW2CUYI9bsXyEYg+8UaYCRyEmTmJK34=;
        b=nM/BfZ+YLMVvk5P3x54GwdFqdhKmNJ1Hx2r4zooAmkk5jyqty65BG5Z/uNElRCb6iY
         atigMkijN16Bg0MggWKJdpuEJizIgzzsHp8uWkf3jKGObwBow5TmIAnkXXrqS59Y+HyE
         hUaDJeb7L7MvoygWrNTlThnWgcILNdnwFIxHBmdrUObxwmUefmvY23WjhAsY3hLEmf3V
         rONqyr8uPLBAQt0hOQm9zA/WPdl8mxXYOXcdgzOLm3g5YAip4rEMTMXdKxwYDbKtdNF+
         59EkTsbwaWxSa4pz4TXedRnJ3xpRtQwB741vQE2mzx7GXYus9zCyOz5xX/f6uYz16fe6
         I6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774644119; x=1775248919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZ/7XD1rJXQYlW2CUYI9bsXyEYg+8UaYCRyEmTmJK34=;
        b=ija950fQlor2mK/8qZJEnbvYeg6YXTn8JeNGQyrwsFE+cL6OdMtvmjEPJSZoHMG7aw
         CcKhMt67b9/cO8AYeMJsek6M0K/Pe3wXRniX2a6MjBPmicu8qVBANLyawQnf4MhzzeyP
         bjuimcrch9vEvVSmPYc8ankXQIwgxWiYHqOD/oLa36xkKyjBrf49q6vB6d/m9Jh1bcYX
         9ZpQSD/kn/1RqK2OkIWlgT6Sk0xMsm0KRkAwoqERBigO991ShIFEdtSTGXH/dSUavzCW
         56fllZ5DqucSBRycKXSUzLazLNCuKFjAyQFJ/eubuissIflGeqTHzJyWpzigsJQMuTNq
         OiMg==
X-Forwarded-Encrypted: i=1; AJvYcCXjn5DTgI1pfqnuVMIJ+QCSfRYRvlk94ZvA6SznJQlXKZOjIRWS7KBn42/YpsObwYDuzyoMINbN45InGJ9YWAY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGQCw3CqttqKCNVqThuFyZL/TGvsazMJWnlnh0R1RRQcucYG6p
	SwvCOmrfbgH3Ty4VeTCcWd8urigYzIebummZ8fBlb845IE0iePrDtyVK
X-Gm-Gg: ATEYQzxDuolBEJd5THlqOmKdn5LXlvFNdCEMIG4dU3wcWv5d288k8m0QZGtWlMU1Lwe
	6aVCc7YekJ1r73za2Bt1U6w/BXSnQ6V2+42qkStWN2khJqSDMIa4nGGJFazhZA2lBEWuxkbNWNV
	YepvmGYKHmWLJO43xXxM4mViR+eM6HovMByPwCpNYPwrZNC7/s30mqPJgALVqVz3QIW97eBVl2h
	vkjvftLDL+wz4CBlEF0uvje68pINnXw/ieJnkhb1YHQmDm3s6H0zPu96Vtc2/+wj83AuEZ08NaH
	X1zKeDCf4VGl99hiMgpc6eK+HVZNvEbBSGA3lyILD2tmMkFrZl8/tkz6L4W/vUGcfVnu/xCsOlm
	kdXttEa69nFMIquxtksavT1R6anUZNDP0cV66prD5svRntcHi6S8Xl7VEm/ejBF9RB0pMkHY41b
	xBBEd9Ye6AWNNag0d1MWQ0hUwpQmHwvqv9+VZI12ybpmiySYPuwE+kQG0U5w==
X-Received: by 2002:a05:600c:1d15:b0:485:2fc5:3a5 with SMTP id 5b1f17b1804b1-48727edf4f5mr64539105e9.26.1774644118896;
        Fri, 27 Mar 2026 13:41:58 -0700 (PDT)
Received: from krava (cust-west-par-46-193-1-135.cust.wifirst.net. [46.193.1.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872712b3ebsm20378445e9.19.2026.03.27.13.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 13:41:58 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 27 Mar 2026 21:41:56 +0100
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Shuah Khan <shuah@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Toke Hoiland-Jorgensen <toke@redhat.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
	kernel-patches-bot@fb.com
Subject: Re: [PATCH bpf-next 2/3] bpf: Disallow freplace on kprobe with
 mismatched kprobe_write_ctx values
Message-ID: <acbrlN_n4Z684h9e@krava>
References: <20260324150444.68166-1-leon.hwang@linux.dev>
 <20260324150444.68166-3-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324150444.68166-3-leon.hwang@linux.dev>

On Tue, Mar 24, 2026 at 11:04:43PM +0800, Leon Hwang wrote:
> uprobe programs are allowed to modify struct pt_regs.
> 
> Since the actual program type of uprobe is KPROBE, it can be abused to
> modify struct pt_regs via kprobe+freplace when the kprobe attaches to
> kernel functions.
> 
> For example,
> 
> SEC("?kprobe")
> int kprobe(struct pt_regs *regs)
> {
> 	return 0;
> }
> 
> SEC("?freplace")
> int freplace_kprobe(struct pt_regs *regs)
> {
> 	regs->di = 0;
> 	return 0;
> }
> 
> freplace_kprobe prog will attach to kprobe prog.
> kprobe prog will attach to a kernel function.
> 
> Without this patch, when the kernel function runs, its first arg will
> always be set as 0 via the freplace_kprobe prog.
> 
> To avoid the abuse of kprobe_write_ctx=true via kprobe+freplace, disallow
> freplace on kprobe programs with mismatched kprobe_write_ctx values.
> 
> Fixes: 7384893d970e ("bpf: Allow uprobe program to change context registers")
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  kernel/bpf/verifier.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 12330466d58b..f8257bae6081 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -6404,6 +6404,14 @@ static int check_ctx_access(struct bpf_verifier_env *env, int insn_idx, int off,
>  		/* remember the offset of last byte accessed in ctx */
>  		if (env->prog->aux->max_ctx_offset < off + size)
>  			env->prog->aux->max_ctx_offset = off + size;
> +		if (env->prog->type == BPF_PROG_TYPE_EXT) {
> +			struct bpf_prog *dst_prog = env->prog->aux->dst_prog;
> +
> +			if (env->prog->aux->kprobe_write_ctx != dst_prog->aux->kprobe_write_ctx) {
> +				verbose(env, "Extension program cannot have different kprobe_write_ctx value with target prog\n");
> +				return -EINVAL;
> +			}
> +		}

would it be more clear to check this in bpf_check_attach_target,
instead of depending on actual write to context

jirka
