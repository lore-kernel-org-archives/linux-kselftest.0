Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44519CA6F
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 00:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782864464; cv=none; b=F9ahXpVT0WrhIAGO8JKK1+kfrw2f/UJYNi8E2JlsgJ3FjQ0oHtfFTyLON2B5clqRnzxC3+xzWVlctQvEuh6FUsx92mN0YG4jj1BFbHteYc020FU3R/plE/sThx/FfthFSf+oS6ArZbH9OWRNz3YWMohSgP7OyaZWSY82cf0pN1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782864464; c=relaxed/simple;
	bh=lC+k+6mNle6sj5AuGdZt4d9WTpneeUI+q286W11Koso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHi7Yu2+tOUFsMeA0gX8CneJHY3a7CKUm12Ed0b0xbHzt4nuq7EUmWNNJTUqaxkZmBVNTseMJae/mQvPopEaYtxUJCGH9NBJogrJJlI+jIgTDUft0HBAJsImCqxsRrryt7qfBwcf+7GMOJ7pdaS0TDbbYWdxjPjVICss+zAkxug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGxc+NpG; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGxc+NpG"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36b9d265355so62650a91.2
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 17:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782864461; x=1783469261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NRsFNTp0mbWr+vlnr7zhHF/IOCJEISt4xOaBSTIIlKc=;
        b=OGxc+NpGOmU5VBQR4YX7pojFZaMLGpqNMFoHHLKnEJR+aBWkcOJodtXepu6Px17Fai
         9zmaKf/MO3UruBNl+wrcOMTl+ng5o4RrsJBwhHZRiQ6yy+v3QrO+/JPFykYLnSyj0w0y
         PZOqSs5yuCoD24xfI1bd93ASt0ZzsvyL7e8Nmu4r3BE0y0uruswAk0Af3QeECDcMuDjg
         vCmrrCevNijsTNHS6+dTfGRNj2n6F1p+kDrg6Ejct6MtdSJGhUSbIqgO6XJLcll0z9tv
         LJRNowaZEdavi+2NE7KpNG8ASh9Wt4wk21Ftn5SCfm1gb33UTW35VTATHngmZihmHyfL
         8+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782864461; x=1783469261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NRsFNTp0mbWr+vlnr7zhHF/IOCJEISt4xOaBSTIIlKc=;
        b=ok2u0y1wjOLEwCZ8/6jrkrCEEP86qGrGflVb6TtPcWdrUgVK+T8kxZkoS3O9ISJ0ul
         qffXU8twwH+mjuSkvyuxnJZdONDCddF6ndtBFLmS5+G9FcZmf2TOwYkxDDuHVYoRQCfv
         zGFWtQc0gxq9nvB1KOxoKLWyt2T5IbcMCXAjYZuSqhtjo73lNK3Jm7VmNdWm6VhPgwXR
         yoqo3RjlqjLZcN/cZm6L/0DV4w9bFSx5R4rP0ZL/8PoL+HTCUsrdHHO52i6VI9reZZ0m
         LHi9L6asRIych3fXeKwU9TPJ2AqzTpeUhcSVRGXsYt9HE+TmcvpybhIMFjaZvyxJi09P
         VmAQ==
X-Forwarded-Encrypted: i=1; AHgh+RpneGDW4L64F6fP1i8bgqdguScnV65Nj55VszIu5uWDk2Fd0nbd0TNi/iph6w5KGzM1AmSSaJXS0inXY95G1BQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpaTb55AaJb0N55/E0XngWnNxn9Z2X4zLvq5ZbKSh0GvK6JXil
	7yekSNWo4rmtLaZf3fYfKRBUqeEJSt2mfLG43Q/kyi5Po09oTCyjjceF
X-Gm-Gg: AfdE7ckxxLuPadUWoXNRSecI2AdgRgEVhX+tgxQ9tWLvWOmExb2YM8+IT5P5xaW1yIV
	UV5tG3+JJxdKp9im4J4F9XuFzjD6/vgs1sjaSM/8vKsvsWZgHGJgGYbM5N/TG8QuvK1aHiwltZn
	odeqtr3ITyhv/mzsN2B23pXMS7j4NuFc07z9sVu7J9wtASAaYKF3mtSTddPnhXtbCf0HFoW5Vg9
	7la0srMz4HXXPInPLvnPzHEKJ5LjVsxKJEsnmNWn5FI+fRyWvDJQ8nrqBN9kUlDHXR+I/0oskod
	sxHavAWN9wyueWIEONJVdXkIak1d07j4Jy8HBzetlLVmOhGwLAbhzNd2MCRVk/DTD+TP6OUOX+G
	H4z7LAFmn88TWLU8eTmb1z3cKEbFkZ/4SRFp3oU1YtvbMRL6+QEVTPNxaJkveumr2KXqmSxxx2t
	U+TQSR3Hsb3Q==
X-Received: by 2002:a17:90b:3944:b0:37f:7210:ccd7 with SMTP id 98e67ed59e1d1-3805272a521mr4755526a91.20.1782864461559;
        Tue, 30 Jun 2026 17:07:41 -0700 (PDT)
Received: from john-p8 ([98.97.43.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095ea2e2dsm737009a91.16.2026.06.30.17.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 17:07:40 -0700 (PDT)
Date: Tue, 30 Jun 2026 17:07:38 -0700
From: John Fastabend <john.fastabend@gmail.com>
To: Sechang Lim <rhkrqnwk98@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Jiayuan Chen <jiayuan.chen@linux.dev>, Varun R Mallya <varunrmallya@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next v4 1/2] bpf, sockmap: disallow update and delete
 from tc, xdp, socket_filter and flow_dissector
Message-ID: <akRZ_e7DJh2aP-2i@john-p8>
References: <20260630145410.3648099-1-rhkrqnwk98@gmail.com>
 <20260630145410.3648099-2-rhkrqnwk98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260630145410.3648099-2-rhkrqnwk98@gmail.com>

On Tue, Jun 30, 2026 at 02:54:05PM +0000, Sechang Lim wrote:
>sock_map_update_common() and __sock_map_delete() hold stab->lock and call
>sock_map_unref() -> sock_map_del_link(), which takes sk_callback_lock for
>write. That gives the order stab->lock -> sk_callback_lock.
>
>The reverse order comes from the SK_SKB stream parser.
>sk_psock_strp_data_ready() holds sk_callback_lock for read, and after the
>verdict tcp_bpf_strp_read_sock() acks the consumed data inline via
>__tcp_cleanup_rbuf(). The ACK goes out egress, where a sched_cls program
>deletes from the sockmap and takes stab->lock:
>
>  WARNING: possible circular locking dependency detected

[...]

>A tc, xdp, socket_filter or flow_dissector program has no reason to
>update or delete a sockmap, and redirect does not go through here. Drop
>them from may_update_sockmap() so the verifier rejects it. It also
>closes the matching sockhash inversion.
>
>Suggested-by: John Fastabend <john.fastabend@gmail.com>
>Signed-off-by: Sechang Lim <rhkrqnwk98@gmail.com>
>---

Great lets get this merged and we will separately fix the sockops
issue reported by the bots.

Reviewed-by: John Fastabend <john.fastabend@gmail.com>
