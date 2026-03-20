Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3792F3B19B3
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 12:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774010460; cv=none; b=R+2tLUuVqHJreI/TbAy3XwluU3DtywEYk92Bwo3xPAISHwgQhMaxSOM5aji0QOB2LSy76JkOCLS+hTxM17R0vSms9AOrCL48M8Oth0bC92hO3e5E5cxnzSVSjOfd6AkZOX0sGKxN+XHqsDo7PEcmmdk86RfGTUwfw39Qkvz9uC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774010460; c=relaxed/simple;
	bh=nlSLXtGJiwX9ZtMmKOu07rZzm0ootMaXdI2dBRIMygc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oJC2H/L75mONlgAkt4K150HgeCqKhfnkBGafzjHO1vXXBoFZ3Aci1dafzvBO647NI7Hdz3m+G0mhfbNSxdo6qMAvs4f35oq5g4WYtZ1EYGy4IPOBAxrYAzl7Ob6tij0R3DECAi2gQovsRvYNzORV/DkyP+gW1im1Cpk9CQxTIsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFRNvwg3; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFRNvwg3"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso16535445e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 05:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774010453; x=1774615253; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KKuF987lzPL37cu98t8t+5v0Gzw20cN38RF+tKv41j0=;
        b=CFRNvwg3LLe/nUyRzS5q+HRWcw0XLKLSI5ApbS7H7igYRGZZrz/HL4BDkJw+5Gu6sh
         BFDwwaRQejNyHG+ZV6n5lTTVJoDEaWQ3udFrpSAuq6HTI3svn0BCCHD61qaAjzWjjLRX
         hDlnUhfqnYLe091BXU+4zdVhGz+irylvUIG8UUE7I+tWwTiSQ7RhFue3i12fdSy6e734
         xtABMxXLNC431xxzaE1VEckPTILAc4y3VQ/PL9FSt/OUDNq9KQzWob8zGjE9jEeHIZeK
         GlxHlcJr4uqDS3buC+nzxUvzNNXcAiCqFCYQcVpOkzBkqOT9B7mNUIbnqHS9cO4QYYXC
         /Sdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774010453; x=1774615253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KKuF987lzPL37cu98t8t+5v0Gzw20cN38RF+tKv41j0=;
        b=GoRh/MGaTD3CPjJiPD1qRclMNALVTPiSZ8GvORAf0FWlXUnus0zypOB2lcRIJ/RtDh
         493mzbpzGUowQxI1KzmnrF7Rtf53gIjPXb7P1LpknYzqkzC9KpJ7CAqQduwFf+XeqZAm
         2OOBQEdDvz8nTQc0S0v/AjOLIQL+mhbh1Y+0K6t2DwPmoZFQkPvCq0uCX9qA/y/RBd8n
         zL1fogxYJ6w75vIvwRyOXaWYpxuQbWHa86oa4Q23q2hBl5xZxrMpiLdw+XFNEFz1NNu8
         i9k5kFVvYI0Glg/zTCTktz0psY6kJRyb5quMarD665nW55bU5pAyqsumeJuZkckl3sD6
         qC2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXAes8YpHPI01WGXi14HnX785CISnm41RlPRVLp1pwgVeOdGZ9YjVY5j7ZlygF38LTBU/wMMJ/X4qGP4lcNQOU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMhRS7ym5tSa5c/me2bJbtpyIQ10t76j/60ux1X58WAr14pSCf
	otYStiohgmXauJ8F9cnq590obbPFfr5fOrMn/H8lTjnYe4/tzF61R8aY
X-Gm-Gg: ATEYQzztZbSGiIyL5RGzUu1RAblyJ0he8tzxnAz+enx2njvdDGk5PPJ9FF4iYI+7jBn
	PHT+uwazagKs6uNG6mVG1oP9r5fTuDq8fLUHb4gGdgYzL0b4f3qNoKU/VTeKIzzXx0tPnjybLPb
	T4QQ+NqMrqeStbOY4qKBe51dirS2ft3KHPN1tMEAp8x6ssx8NWcwFWHPY/QA/fX/mHWdtwAfes5
	bstfXNpoOMfevxcGzMr24Qz/jCcTmfS+9ldd0pIbI0MaUhgYbDmZ6ApGZY91mrfHTQY5jSd5i4r
	rGh9j+ewsJFKOx04mUTrIHvGtWBLoR+hzqN0E/DhlsMgoJW8xz+VIX6MGVyctoYiZSgroR+6Dxf
	BQh6eiA8ytdFBKlWyQojuPIpOHuBCm/Xb0Thy+pe4Hb7GjvRXuJtJT/UtC9+nSm3Lrx+1+Q+0
X-Received: by 2002:a05:600c:c111:b0:485:3f30:6250 with SMTP id 5b1f17b1804b1-486ff024da8mr29812595e9.20.1774010452991;
        Fri, 20 Mar 2026 05:40:52 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200::d99c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe7d6c54sm146845355e9.4.2026.03.20.05.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 05:40:52 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 20 Mar 2026 13:40:51 +0100
To: Menglong Dong <menglong8.dong@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
	yonghong.song@linux.dev, john.fastabend@gmail.com,
	kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com,
	shuah@kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next] selftests/bpf: test access to ringbuf position
 with map pointer
Message-ID: <ab1AUyefoWABRs0T@krava>
References: <20260320084155.288417-1-dongml2@chinatelecom.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320084155.288417-1-dongml2@chinatelecom.cn>

On Fri, Mar 20, 2026 at 04:41:55PM +0800, Menglong Dong wrote:
> Add the testing to access the bpf_ringbuf with the map pointer.
> "consumer_pos" and "producer_pos" is accessed in this testing. We reserve
> 128 bytes in the ringbuf to test the producer_pos, which should be
> "128 + 8", and the "8" is BPF_RINGBUF_HDR_SZ.
> 
> It will be helpful if we want to evaluate the usage of the ringbuf in bpf
> prog with the consumer and producer position.
> 
> Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
> ---
>  .../testing/selftests/bpf/progs/map_ptr_kern.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/tools/testing/selftests/bpf/progs/map_ptr_kern.c b/tools/testing/selftests/bpf/progs/map_ptr_kern.c
> index efaf622c28dd..c3fa57ec430b 100644
> --- a/tools/testing/selftests/bpf/progs/map_ptr_kern.c
> +++ b/tools/testing/selftests/bpf/progs/map_ptr_kern.c
> @@ -647,21 +647,39 @@ static inline int check_devmap_hash(void)
>  	return 1;
>  }
>  
> +struct bpf_ringbuf {
> +	unsigned long consumer_pos;
> +	unsigned long producer_pos;
> +} __attribute__((preserve_access_index));
> +
>  struct bpf_ringbuf_map {
>  	struct bpf_map map;
> +	struct bpf_ringbuf *rb;
>  } __attribute__((preserve_access_index));
>  
>  struct {
>  	__uint(type, BPF_MAP_TYPE_RINGBUF);
> +	__uint(max_entries, 1 << 10);

do you need to set max_entries? there's already check below
making sure it's 4096

jirka


>  } m_ringbuf SEC(".maps");
>  
>  static inline int check_ringbuf(void)
>  {
>  	struct bpf_ringbuf_map *ringbuf = (struct bpf_ringbuf_map *)&m_ringbuf;
>  	struct bpf_map *map = (struct bpf_map *)&m_ringbuf;
> +	struct bpf_ringbuf *rb;
> +	void *ptr;
>  
>  	VERIFY(check(&ringbuf->map, map, 0, 0, page_size));
>  
> +	ptr = bpf_ringbuf_reserve(&m_ringbuf, 128, 0);
> +	VERIFY(ptr);
> +
> +	bpf_ringbuf_discard(ptr, 0);
> +	rb = ringbuf->rb;
> +	VERIFY(rb);
> +	VERIFY(rb->consumer_pos == 0);
> +	VERIFY(rb->producer_pos == 128 + 8);
> +
>  	return 1;
>  }
>  
> -- 
> 2.53.0
> 
