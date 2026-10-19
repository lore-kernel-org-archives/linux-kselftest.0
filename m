Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2891F4E1408
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 11:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408600; cv=none; b=WQTOhmnN5Ke5yDWl5tNwxancfsGiftEH1vc+qq5wHRXDJZbXZybZ44jLkFG4AUX1hg2wnPUYyWRU4XEE2Ll3PrSnMltYLan6OIBQQQgGjsrh9aBB2qaGbKngsk1bKOTFbwHQeBR1a8HvmxTKzUGdpoWnYtfURNPtFl2vl1Fyj/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408600; c=relaxed/simple;
	bh=EWf5c8ljj/09dklnGXsFMrD980MsIpsyxtjkVc+RqkA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AnWimgVQxicWJ+3VYt74T8B3v45zGPHUn0egjoh0shXio/r5eIcx+eWQJ4q3hE36HFb5a169uuSgJa//DXj1wjGDoJFLYnQMv1fwoApovek30mD8qAMepjN1I0agvUwWUlsdGqontNVjdY/azZ8/oA6wfvhN0K6ExVzVeLAXlMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=WsKynFkP; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="WsKynFkP"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso2282671a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 04:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1792408594; x=1793013394; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fGQ+9YD2bGTiX9CIhcjMfZ/cpyi6knaOi/h3v5oGsFg=;
        b=WsKynFkPeL99ECm9Gqb1tfUTap0V/zRLCWSnbmNpjJr3xgaY958BOuR5aUwvcRrtAK
         X6wJDFEAbXVYj1xDqgZDplKYnjPNfb7YbMNCfv/AMRmMybsl9Uh6dT8UfYqadrhm+uUu
         507BcFi74m51r591jRl1dUgQ0S4oskznqQTbhfiT+etWfDWuFN5ccGZJQdJfbQ2iYQ98
         6B3LF2wQCh9djcI3TcMYnE69W9usn+TAmTeVDItvoXpqNwS2qKYgCIbf6xPTXvePK8VA
         Q14xAg+EhwV+4mf/dSKpvkdZnNcjSYoYe0BfutMcDPazTvpVOUOIuPJm7z9BDRZOIa31
         mDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408594; x=1793013394;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fGQ+9YD2bGTiX9CIhcjMfZ/cpyi6knaOi/h3v5oGsFg=;
        b=m2caoakC2pYVKiIIOMPWqkhpQviqjREjlL/ocqXogqk3wLgSEmBVl640p9OHOyn7dw
         1Vr93FqmnUJgmoX+VY6KklMHl5WexP+tTPP8ULkuO0CyKo499CV2C+9rEUd92B0OeMik
         TI5nXrCkABStrnCzUVD9hcEHki8fDBpB2JZ5RiQu/Ia1J4DLLYOetu5uv8GYJmU9UZwA
         FXHELEFW3mttOSku8tRknL9Bj4NszF5S/tHH6IuuiGGkjuyJstl+xIh4/daHIC2uJdbs
         8E5sU+R9yeyit79Y/r2HOTKHWd7hPTxUF2OoSoCzMmtTGOBIynaAXi4FQZVSBkU9vJOz
         YP1A==
X-Forwarded-Encrypted: i=1; AKwUvBxFW84F7RZnIIHSUfOxhDijWmaowCJSdCgbispwY9rsIyHT4mHCbuwpsoMqVgr6I+6il7Pl0PPS/8Fq666NUfs=@vger.kernel.org
X-Gm-Message-State: AFq9FYI17M0Wn6LOI+Wf3NSlsmTp0wfXENHClqrA1GE/n5vqGBxEih/e
	fdlrlL9SJWrFaZ0o1WAdzKCutkUGmsqhT3/lBtBl12R0fw8xrDBudf99hL/2y/iuhTA=
X-Gm-Gg: AYBFou12LrhpsdM15WtPu7EhC9uIXl8j8A9frNLx1w+BWv7KOPKY3xlEDo6G0k7He/3
	7odnikYfaR0fJmGnvvNsKt9ehXZCz4yT3Ajsno5fG6KIV9pKmmtJmaknzTJkBj6PssUuYaQko00
	i0dX6L93hw0bEt93/am8iqNoiT8CDLp2UXw77v+leh2t+s6rcBzNpFmwhXlFTuz6Tq0mQKdzz9M
	QZlrJfakICfO7bkx6wsTxwXV/We/ztDiurR9yKkh18GUF2Rv7H8WIyHhpQuk/4G2b9TEJ4gi+o/
	RKvgrIuLChETCQbt/eWfGEDBBXhtYYyas8COIYC/eaQJYy/v0bpSXrDvzVtG4mDsEfQ6AJYQp6o
	iU1LlNVW9hsw4PMyq//paOzuMP2uMl2lVK28Y+EK2quI2qwhDvelt7KRozCU2Rve0FcQwn+S/4o
	fjz/v1rQviVIbAQxdVaTuu6skx9Dm8rj6ek271Q203ye1pbupBccTZLyXRwTaU
X-Received: by 2002:a05:6402:270d:b0:6b1:c7d9:b631 with SMTP id 4fb4d7f45d1cf-6b3a8191a46mr4712969a12.23.1792408594035;
        Mon, 19 Oct 2026 04:16:34 -0700 (PDT)
Received: from cloudflare.com ([2a09:bac6:5067:2dc::49:220])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1e9e44sm3663824a12.32.2026.10.19.04.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:16:33 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: Alexei Starovoitov <ast@kernel.org>,  Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>,  Eduard
 Zingerman <eddyz87@gmail.com>,  Kumar Kartikeya Dwivedi
 <memxor@gmail.com>,  Martin KaFai Lau <martin.lau@linux.dev>,  Song Liu
 <song@kernel.org>,  Yonghong Song <yonghong.song@linux.dev>,  Jiri Olsa
 <jolsa@kernel.org>,  Emil Tsalapatis <emil@etsalapatis.com>,  Ihor
 Solodrai <ihor.solodrai@linux.dev>,  Shuah Khan <shuah@kernel.org>,  John
 Fastabend <john.fastabend@gmail.com>,  Lorenz Bauer <lmb@cloudflare.com>,
  bpf@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH bpf-next 2/3] bpf, sockmap: Restrict iter-context
 sockmap updates to iter/sockmap
In-Reply-To: <20261016-sockmap-update-limit-iter-v1-2-23fa946db59e@rbox.co>
	(Michal Luczaj's message of "Fri, 16 Oct 2026 23:09:14 +0200")
References: <20261016-sockmap-update-limit-iter-v1-0-23fa946db59e@rbox.co>
	<20261016-sockmap-update-limit-iter-v1-2-23fa946db59e@rbox.co>
User-Agent: mu4e 1.14.1; emacs 30.2
Date: Mon, 19 Oct 2026 13:16:31 +0200
Message-ID: <874ieiey9c.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Oct 16, 2026 at 11:09 PM +02, Michal Luczaj wrote:
> @@ -10341,7 +10342,12 @@ static bool may_update_sockmap(struct bpf_verifier_env *env, int func_id)
>  	 */
>  	switch (type) {
>  	case BPF_PROG_TYPE_TRACING:
> -		if (eatype == BPF_TRACE_ITER)
> +		/* iter/sockmap only; type check rejects a freplace of any
> +		 * iterator's bpf_iter_sockmap() subprog.
> +		 */
> +		if (eatype == BPF_TRACE_ITER &&
> +		    env->prog->type == BPF_PROG_TYPE_TRACING &&
> +		    !strcmp(afname + strlen(BPF_ITER_FUNC_PREFIX), "sockmap"))
>  			return true;
>  		break;
>  	case BPF_PROG_TYPE_SOCK_OPS:

Explicit bailout when prog->type == BPF_PROG_TYPE_EXT might be more
self-explanatory.
