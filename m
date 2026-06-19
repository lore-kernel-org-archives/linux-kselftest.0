Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D45C3093A6
	for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 13:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781877312; cv=none; b=dNi5XyxOxrZD3zxbdsddTnpeatUL/R/c0ScDO4dbZCg+pEFXyU3fWw4TcLNFEabM4OiodljMAfqC9i+EvtAE/6qPrBfUqxAqNKTrarLVSgIWdqfB93/1MXTsVYq+7fjwe9y1+d5a/qRtLuM7qqBGlQ6OJO4Upr71vxREvbRg+FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781877312; c=relaxed/simple;
	bh=BMMqjb8y8tGxAQ2nHC3v/ZHVz6TbJa5TiPmEZ25STPA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kLes/EosK+J+8D5w58oj9g3sVYvCv+ibP9+scT9TMG7zVGw9gVJIaTeNK0UZnuwhiLV6qnXwouO4aLoerVyOPu5X1GH++TPq36AM3jPY9OxOrrmSNEsySgP2sPqkM61dkN/TvoY7ovpQxpy9xKZz9aUz9scVeNuh430gInBnnS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZsfN++J; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZsfN++J"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so1781013f8f.0
        for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 06:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781877302; x=1782482102; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mk2ExJ8mssbYqK4VLi0gGHsKPwoFv9NrzRAVNwNuOfM=;
        b=RZsfN++JLua5RPFZntKJPNvuhLSM+KaikSrufM/OGNSEz56yCMEx3oxTFnWn0j/6cL
         ryRee0ff0TQ4HfIvir87fhGkFwM+hFlBWQnyxZKldCw3cu4qezQX2svebSuuNpmHH32S
         o5IjhwFU0xijWxL1qDkflXZqxr523eji/5cLnd8sAzi5JQHMmA8AxhWGLza+cxlYbh2c
         qoCJx9OD9grACBMnu9tK4YM3mpYfMdAauzhLdRPVD0YrUdMLUtb3fFeiqY5jTXcrKIbA
         IRrD76fmTBzSKy3EcaBFnsQ3k/F7tqp2D3l1lpz0gEsgrJKSO5bZYm/Z9S4uXIu4SIkV
         4jGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781877302; x=1782482102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mk2ExJ8mssbYqK4VLi0gGHsKPwoFv9NrzRAVNwNuOfM=;
        b=jJ2flg0K0zbhUy/Xz6PGsMJM/RYliWnfSWkABqKHJbYQfO+XGO0+bbhUFghS8Mbj5r
         09STWyyYigENb/YT59rPeZBgRqLnz+w0yvmRfG7t842GmGThKlQcQuWNUrONubjpnKU0
         QekI8rdj9EnbBb1Dot0o0ydB1RUz3csne57IHUCioOaNCWBnAeHY6u3mfwGpyTRSjNfC
         B63iL0JTix3GsZie1hrBXqtjAMrMaiRpSRrhS2Z6v/Tgscy9UgFTkC6/xSJCbZ/FrGL0
         8kRhk5VcUJDOgZWmQz8WhWPsUXK+irjU6lDlZ9YE91F6BXw7ZGc2jyZS+cdxyAXNI20y
         sJsQ==
X-Forwarded-Encrypted: i=1; AFNElJ8+bJOC3/kwfD5vmZseVvUcShKriGOhQTbJIdYNauid/T8s155xgMP6kNDdjhpX+LQbM7sfJ5Y4EJcP51FsckE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuAK77L/x1GdQ4yl6NFIz3Y+knTLulKxW584DMOSNUVD/hT1M4
	EdR+Tm1uIvB1naG1ZsttKkwin32eD5TTTC4NSXNCsUzGturRUjGrd6N/
X-Gm-Gg: AfdE7ckXiQ7yPPViF0qZjZEsJ4F0ct5hJOyTErHcFyp9tHswfVhVtsrhpmAzKSetqCy
	OJG3E9Dg7NuMpg9rOlogIYWKhls3REtzRwtTzI2MWtPb+o1cToK2r4qhQzhae2iS3pf3uaseko4
	7My06cXbEjSCmyprWSHuwby7bknrFnmzs1G7ABcVJn82G6e+BXcmy0umHI3aUJ4rbQIObpe53DF
	4wShWRkfQn2G557v4Kl1J/tE8L8ENKQFeZP9t0MwywWybNMbq7Xg0w83uU51kkYCxmzyeu3c9UE
	ts0kUWlOUEZsvPSc2p+4nDQ6c1Hxw25xnQJVGrgPPDc/nqukJvBFqD2L6kzKtyJT2r/6cDTk2Ta
	oLWe8OKgupBOdUEKJLM4RhHUOVPXqBG+Pf1coQwTdsp05qJrztQ5ipEoPSw/1hLipsG5YztFIIX
	xU
X-Received: by 2002:a05:6000:2382:b0:45e:f2e1:9a20 with SMTP id ffacd0b85a97d-46501d44e00mr7036218f8f.27.1781877301982;
        Fri, 19 Jun 2026 06:55:01 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46508a04c15sm8545498f8f.3.2026.06.19.06.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 06:55:01 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 19 Jun 2026 15:54:59 +0200
To: Tamir Duberstein <tamird@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
	Shuah Khan <shuah@kernel.org>, Andrea Righi <arighi@nvidia.com>,
	Xu Kuohai <xukuohai@huawei.com>,
	Andrea Righi <andrea.righi@canonical.com>,
	Bing-Jhong Billy Jheng <billy@starlabs.sg>,
	David Vernet <void@manifault.com>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Andrew Werner <awerner32@gmail.com>,
	Zvi Effron <zeffron@riotgames.com>,
	Andrii Nakryiko <andriin@fb.com>,
	Emil Tsalapatis <emil@etsalapatis.com>
Subject: Re: [PATCH bpf v2 2/8] libbpf: ringbuf: Prevent NULL callback crash
Message-ID: <ajVKM9tJskwg9OFa@krava>
References: <20260618-bpf-ringbuf-fixes-v2-0-33fde039ddf3@kernel.org>
 <20260618-bpf-ringbuf-fixes-v2-2-33fde039ddf3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618-bpf-ringbuf-fixes-v2-2-33fde039ddf3@kernel.org>

On Thu, Jun 18, 2026 at 08:26:40PM -0400, Tamir Duberstein wrote:
> ring_buffer__new() and ring_buffer__add() allow a NULL sample
> callback. When callback-based consumption reaches such a ring, it calls
> through the NULL function pointer and crashes.
> 
> Check every ring before manager polling or consumption so a missing
> callback returns -EINVAL before the manager waits or consumes another
> ring. Check the selected ring before direct per-ring consumption. Perform
> both checks before honoring a zero record bound so invalid callback use
> always reports the error.
> 
> Fixes: bf99c936f947 ("libbpf: Add BPF ring buffer support")
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> ---
>  tools/lib/bpf/libbpf.h                           | 11 ++-
>  tools/lib/bpf/ringbuf.c                          | 43 +++++++++--
>  tools/testing/selftests/bpf/prog_tests/ringbuf.c | 93 ++++++++++++++++++++++++
>  3 files changed, 136 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/lib/bpf/libbpf.h b/tools/lib/bpf/libbpf.h
> index bba4e8464396..9ba6b9ad3498 100644
> --- a/tools/lib/bpf/libbpf.h
> +++ b/tools/lib/bpf/libbpf.h
> @@ -1526,18 +1526,17 @@ LIBBPF_API int ring__map_fd(const struct ring *r);
>   *
>   * @param r A ringbuffer object.
>   * @return The number of records consumed (or INT_MAX, whichever is less), or
> - * a negative number if any of the callbacks return an error.
> + * a negative error code on failure.
>   */
>  LIBBPF_API int ring__consume(struct ring *r);
>  
>  /**
> - * @brief **ring__consume_n()** consumes up to a requested amount of items from
> - * a ringbuffer without event polling.
> + * @brief **ring__consume_n()** consumes up to a requested number of records
> + * from a ringbuffer without event polling.
>   *
>   * @param r A ringbuffer object.
> - * @param n Maximum amount of items to consume.
> - * @return The number of items consumed, or a negative number if any of the
> - * callbacks return an error.
> + * @param n Maximum number of records to consume.
> + * @return The number of records consumed, or a negative error code on failure.
>   */
>  LIBBPF_API int ring__consume_n(struct ring *r, size_t n);
>  
> diff --git a/tools/lib/bpf/ringbuf.c b/tools/lib/bpf/ringbuf.c
> index f2bb619d5a75..0dae4d95d309 100644
> --- a/tools/lib/bpf/ringbuf.c
> +++ b/tools/lib/bpf/ringbuf.c
> @@ -231,6 +231,26 @@ static inline int roundup_len(__u32 len)
>  	return (len + 7) / 8 * 8;
>  }
>  
> +static int ringbuf_validate(const struct ring *r)
> +{
> +	if (unlikely(!r->sample_cb))
> +		return -EINVAL;
> +	return 0;
> +}
> +
> +static int ringbuf_validate_callbacks(const struct ring_buffer *rb)
> +{
> +	int i, err;
> +
> +	for (i = 0; i < rb->ring_cnt; i++) {
> +		err = ringbuf_validate(rb->rings[i]);
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
>  static int64_t ringbuf_process_ring(struct ring *r, size_t n)
>  {
>  	int *len_ptr, len, err;
> @@ -240,6 +260,9 @@ static int64_t ringbuf_process_ring(struct ring *r, size_t n)
>  	bool got_new_data;
>  	void *sample;
>  
> +	err = ringbuf_validate(r);
> +	if (err)
> +		return err;

as Emil noted in first version, this seems like overkill, could you
just check sample_cb != NULL before it's actualy called?

in [1] you mentioned you plan to add some feature that won't use sample_cb,
it'd be easier to review/suggest the solution with more details on that

jirka

[1] https://lore.kernel.org/bpf/e384ef2f478093a70af11980d2d1cdeb@kernel.org/
