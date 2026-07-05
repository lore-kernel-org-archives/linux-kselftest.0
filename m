Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346B5268690;
	Sun,  5 Jul 2026 16:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783269585; cv=none; b=QixMTGvhCpDEXjbfbPHTLAlcJj1wMx4tKoSmCnsB0StivO5MXD4mjQ6MzWeA0vEsxRWvIAgEvlAVFOvY/PQaCdMtX+JkPSl4Y9XHTHzW4W6HlqlwjSqwAvtFMC3bmctMva5GhQkFXWhl1kQGqguCy+YSbijrOEWkS50F4+zNgiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783269585; c=relaxed/simple;
	bh=tZnA38eUrQxz/0kmNfFF0wKKAwVCWqpM+zF1iXd7S3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Op3mmMMY6djyFnQLX2Sv/EAsz34EBr5vBIcxyICpK0d3fKZBbOK7kwM4gr3B2XmbNt2lFD+HhFtkhj1vP6jDBCXYl+qHluKGZrBIGZMPhshq9nw+4RvZZEAV9L6i/eOKfEt9uWVASefkOXh8mvxXJFIJqzHAKYMHvp1swokI1ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GD5E00jd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GD5E00jd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C578A1F000E9;
	Sun,  5 Jul 2026 16:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783269583;
	bh=0R8ZtF3d9AgDnJGCnGoYgYb06PhewG8FwhZVxhgsbLw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=GD5E00jdHvxzhdtlFINuqEcMlH2ijqgSihmtGHLgxZ0+exSVDzLzMp9MXcQQHp6bz
	 v/XKwErxK51Ugn6rVHDvVQNqqRwcJy4LwD/VQVuomZHxh4ZzH1ZkTNZGl/lwZPmqA4
	 q7JrBqow63FVpg6/G9R+XDYD2d3o47FFH3MonMDKEEJqgWAGEPVOoqs9GepFFweMU6
	 BQxh7US/bpRwa+N2AHfb4Omwq8uolS0erKbrKJ+++ZmFcIxv003XbI/qs4zuMnHjk4
	 zbA+YHLz01Hy3E6Awh77MGARog6zvVv+w2JNGIr1FjQ21+cxRj69V+PgagVOww8Y2y
	 eMWJ6/PJjHP6Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 72D6ACE08AF; Sun,  5 Jul 2026 09:39:43 -0700 (PDT)
Date: Sun, 5 Jul 2026 09:39:43 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Ding Junlin <1746193727@qq.com>
Cc: mathieu.desnoyers@efficios.com, peterz@infradead.org, boqun@kernel.org,
	shuah@kernel.org, tglx@kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2] selftests/rseq: Fix spelling of accommodate
Message-ID: <feda4d15-f699-4ace-9e8b-4528bd88baa3@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <tencent_A20EAF9C0B2AC0D6DD97A4C2F250D9970406@qq.com>
 <tencent_BAB26179A92C5CE28657C0451540E6EE4B05@qq.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_BAB26179A92C5CE28657C0451540E6EE4B05@qq.com>

On Sun, Jul 05, 2026 at 11:47:46PM +0800, Ding Junlin wrote:
> The comment contains a spelling error listed in scripts/spelling.txt.
> 
> Fix it.
> 
> Signed-off-by: Ding Junlin <1746193727@qq.com>

Reviewed-by: Paul E. McKenney <paulmck@kernel.org>

> ---
> v2:
> - Use real name for authorship and Signed-off-by. No code changes.
> 
>  tools/testing/selftests/rseq/rseq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/rseq/rseq.c b/tools/testing/selftests/rseq/rseq.c
> index be0d0a97031e..1cd633923b1d 100644
> --- a/tools/testing/selftests/rseq/rseq.c
> +++ b/tools/testing/selftests/rseq/rseq.c
> @@ -73,7 +73,7 @@ static int rseq_ownership;
>  #define ORIG_RSEQ_ALLOC_SIZE		32
>  
>  /*
> - * Use a union to ensure we allocate a TLS area of 1024 bytes to accomodate an
> + * Use a union to ensure we allocate a TLS area of 1024 bytes to accommodate an
>   * rseq registration that is larger than the current rseq ABI.
>   */
>  union rseq_tls {
> -- 
> 2.50.1.windows.1
> 
