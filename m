Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4BC219FC
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 00:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782864630; cv=none; b=l20JoGvcKrwwGmVjhDFcZ5rRjhRYCQHSDrK9plHp/83cCzI0KqD2kIz1NFOQ0qWsbkjd61JlfUz8neSapfIlK1JQvmxCEwh0Yexa5pSCAhQAhnRpxY1Qxryr+mUzcrtbeCo8vBpSqT3oT7AqnZiu1haDJsvttzLNmg9s6K/AgVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782864630; c=relaxed/simple;
	bh=h3OPAHc6C1XvzxT6cx8e7622PtDg/GnQUlgHe9kP9os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PF8BFycJ9uHx9o02WQ8Q1mNo/dm1t7dfWl1KO9xzEQ8DHw4bwjTr6tNUw5cFQCU1SaC7mVbScyGxkc6KkHoD1fW5viy06VyCOmXwCcUNXgJ7AX13PAIERL3kP8aQehuDVVf2fU7dJW3Cog5XQBfTJCXuXgHDGEe6EpRP9p6dF3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sZnry86D; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sZnry86D"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-37defb2f231so41225a91.2
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 17:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782864627; x=1783469427; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5qbc/GpNfKXXWiTDBIO3A45WUQ8ek6nJfHhq11a1Wyk=;
        b=sZnry86DLFBVU4Yx86holz0W0Pn1Tgh9/UD1qG2Y7D0Km2njR33nHiDuI5c5Mf5YIQ
         kpYn/NaglyUFNJJXpM9xmpUrMXRpeVQW4CZ/EDKthWb6xKD+MhSa2lpxqs+jSWgXDW0C
         0t54qjCUuhDsQFdU3pwGXmdh0OSThbjA/MWJUE4P7uON/msuds+BixO31wIh0K1kg2xc
         Ug5GAOOaqwvk3/w7c4Bkj6fvn6nmC/qfrecLrH2q9X8/QemCRvri96a7E+DQBZ7rT2vu
         gofjkdPaFHgbuz4xrrIZdVC5XlU+HbyYe/mD6ZHeh9+rv5bVuVp79NNeXuQtlUt9vQhn
         ymDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782864627; x=1783469427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qbc/GpNfKXXWiTDBIO3A45WUQ8ek6nJfHhq11a1Wyk=;
        b=EWu/nbxh6Ozpjd2yQZSGM/AfTeZklUD33S5cdjNHvTJ79uRJOdSC42eiiEtcFyxh7i
         wRpcXPzhk4QXnZe9zUUyofgM/FdV+zgocUjC85aL1F9ge9dH8Wy6g5SiTQsHsr/UZJsx
         cp6/V8txvLBp3+uKHgbGzE1wgwrY3pEu51A3rFbatBTUazr83+f41c70YCYE11b8pEbo
         776RykTC52i15eh6WH/KLTLQjwciAQtIuPrbuXtOlJ46gS18ODeQYlEwtu5HuyoduPdF
         01MJ2LrDeVpyuv+VB9SetQO60WvJftjhu2nBNjCGD+mFkRJO6M6IKg+zs7cly2miMBvW
         mwVw==
X-Forwarded-Encrypted: i=1; AHgh+RpGxPH4ID5S3SVhg5RLzEIEaaE4+gX2mUpYfVGc5iXZxslynDznZk6pzXKzgYtZu4+bKWYbF01vgUMw9HIwKMM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/v4RpF8RsQoDvrujexEsqEj+6uVwJ0Nd3Q/QKSzYEpi8E9doV
	6fFmUEBF7i1rW1/3+gd0npKhxeewhxIe5GAcUpa2OPWwThjSgvcoCNEO
X-Gm-Gg: AfdE7cnp1Ja8GJYin/kq748O0AAFf8lGw6DkkiJMTtRPhSHXR8yYMJ2Rs3LcRylbC+O
	RS7BdU3RV+T7Uq7lJKeup/Pg0KDzg9g84felnbUXzuuygm1XgFegPXmaPhSXuBWzPkRRrQpXHbX
	E+1jrCwv3C75JhGUYyAgb6oltSAxs9/McptIFPBDTfV9eidjwm+qrOdA3QbklnY6q5Lu0mmCKKf
	chJVnTspp0Y3egscczAFRtZ+BUyhGwUYb4p1Mja5cus4v5Dyh/b/dfQy8K15fx9GRIfxu4zsuqz
	nAhOqZ27oYXWCftAj/qFjKv0uGZfVwJKCCmg+cjB3B3vl5lvT3eS93tRdrzgHtcTynkoaAi7rgQ
	KV1zaDplx+HRhNqjS8kAG06HV4jN8uXiUMk/IlFmWjbY+9s8WfRQtJpCQkSUvuU8PUtcNJGN23J
	2VL+eS/BW/dw==
X-Received: by 2002:a17:90b:390b:b0:380:540:d49a with SMTP id 98e67ed59e1d1-3808bd2ffe9mr2231773a91.7.1782864627409;
        Tue, 30 Jun 2026 17:10:27 -0700 (PDT)
Received: from john-p8 ([98.97.43.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3809646e38dsm675137a91.17.2026.06.30.17.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 17:10:26 -0700 (PDT)
Date: Tue, 30 Jun 2026 17:10:24 -0700
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
Subject: Re: [PATCH bpf-next v4 2/2] selftests/bpf: drop
 tc/xdp/flow_dissector/socket_filter sockmap mutation tests
Message-ID: <akRa2NjCanobYZSw@john-p8>
References: <20260630145410.3648099-1-rhkrqnwk98@gmail.com>
 <20260630145410.3648099-3-rhkrqnwk98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260630145410.3648099-3-rhkrqnwk98@gmail.com>

On Tue, Jun 30, 2026 at 02:54:06PM +0000, Sechang Lim wrote:
>tc, xdp, socket_filter and flow_dissector programs can no longer update
>or delete a sockmap. Adjust the tests:
>
> - verifier_sockmap_mutate: the tc, xdp, socket_filter and
>   flow_dissector cases now expect __failure with "cannot update sockmap
>   in this context".
> - sockmap_basic: drop "sockmap update" / "sockhash update", which load
>   a SEC("tc") program that copies a sock between maps.
> - fexit_bpf2bpf: drop "func_sockmap_update", whose freplace program
>   updates a sockmap in the tc cls_redirect context.
>
>Remove the now-unused test_sockmap_update.c and freplace_cls_redirect.c.
>
>Signed-off-by: Sechang Lim <rhkrqnwk98@gmail.com>

Reviewed-by: John Fastabend <john.fastabend@gmail.com>
