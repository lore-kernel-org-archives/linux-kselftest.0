Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F023A6B6F
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 21:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784323792; cv=none; b=HUk5AaEz7BATyQjFCqWQp65fe1szt1QZF6arxKHmoeW43UCmfScmgEsnX87HElwVzF+mohqrzGL4Y6PMRjXgA4jWCX9qiqfh0iFcy3ULRlZmU5g4Pqykt8hcNAK7XUpK0giVt3vRpR3e2+u+j6ndaBvOugRLtsf1v498xQNo47o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784323792; c=relaxed/simple;
	bh=RRLtR05HNO2eA17V+2WFivh4U+/1LOnvCIY75vZfKTw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject:
	 References:In-Reply-To; b=dH5YWYVXwcQxfqGT/dlVlqKQCXL6Sgmg6pNex5IKiSx3EZZKRs/JSNxytHk7xmzp/2nZCAoloKL6QwoCWhV0JvF5gTj0KGZbJ7CNyJ0k9wMuJsqXG8h4adN+o1mJnFQgMTVZyEi72M2P7tCF/G6Bda6G6uLiI0/yYfIjPjUXd7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=ZckQouxQ; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="ZckQouxQ"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e58e0e2d2so328637a91.3
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 14:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1784323785; x=1784928585; darn=vger.kernel.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oQDBUUIw0bVYgL4afo7WU2+Ju65SJHJpkDkSaUZ9qZY=;
        b=ZckQouxQCFJMAhrHhX1SI8d2PnWUtgtR5zCiNzubnwKQg427u++0fUmpQO3uAIM5su
         26NIBwaawn0tHhRz8WF1Wkcbi4bWqrEft6UJtTUDUayPOxP3ug1purxOGL5b4E7bZTk3
         LjYjvJ2qU9fsf0HazDoPeScmssRKkA2V4w8p9f3VhIuwRSlReBRVKAAZCDxDbv1Q9MHR
         13RT82vyctWfjsm6HN+QaHFCN3huK3juu7jUQ4C8a2Stzy2qw1CabP+Y5eoOFcJR5UVT
         wdb/mtjyaAU7TGIbP9y01P6UBTHqzWdw9Zlt3dQiP7DrXp3NyQHyvRJjhXfwGf+hVl6i
         8eHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784323785; x=1784928585;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oQDBUUIw0bVYgL4afo7WU2+Ju65SJHJpkDkSaUZ9qZY=;
        b=iV3T1e2kkU6ZNTmmcp3uxrD+qoBXRmBV6i9MEeBSkeGzkf20KXhGE9EpV2p8TfhExw
         oJNkJKoUcuBSnDeMdQEEhUbfXV3y4SDdEPJ+/90Qh5/DySji3k11dhn4+wfpQMFJMsAc
         OG2BKC9YXfkB4Izp4TcRFk+INXtFPkH9KljDl/mSbjyj5AgxurjFVUqarsAWI8iUzmT0
         FoB+UrC7CisnmqoybK21pfL2KLkgKVNdUGD7Z9Gd0z2UAsfhqOkebNeC5II1bkAIs8QV
         4dOi5ERYG1uKyG9lfnf7DEWxHR3cQRa0W4aW/xQG9s3g6Xv/RM8FBwlpouILiWlAQDnS
         kC3g==
X-Forwarded-Encrypted: i=1; AHgh+RofmqhQYpA1eAP4xvW4EXSj6ZED57h2JVPhpI1suI/b0DZGhLtWhKWE0BU9aZ3GHLeUtl7MUdHCCA09A8VVnB4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxun97icwUw/qr/fB9LdbMkyg3UMSpmcKn6G829+E5dbdRENbDS
	iLcV8ShyodG0+00X5ITXqVTKeN4K66TRLp4ZA9I9J1PbQJTGidt8nOzcT+8La7o92+DmcLis4lF
	ujL1q3fplVg==
X-Gm-Gg: AfdE7cm+ieDvQaIhBV+I4kxAHQRYA9FXPflVs4uWu5CYXsZeOJaKJN79tzHPh7/PIBU
	6zYiZcRxvUPBuJ9QqrZt7m3xMO/WLDgdDIwamDYBGXUxo5IG0lwfi1JGvnzTRlJ/9zmEgbe88MG
	azf58yZuL4sMrHDtnh2uNDE6UkNeBEknzeoqi/cwYg3tdV2/XL2dhbQR59HHB9pxN8KPaif004k
	SR9oP2/A75L6yg6EhYLeb4KFJ1C0x7edVVr8ee35SK5sKYzFdwC34VHvY9chst8IZsB9kY2vZqs
	lkL0PuEVtkSxJgW+0vax+dpAHHJWbeHbmZR4bisFShlAQhz//w5zN6PX7RhTYkBbskdLr/ldXsa
	NWqe82/1z77Js3e8Rz/YRIDQBLIQmVWUgi19rVnTb4O4B7aoTzvAIrDWekJFK1PU6BgjJHw==
X-Received: by 2002:a17:90b:2f85:b0:37f:b0a9:1a68 with SMTP id 98e67ed59e1d1-38e4b3e0fdfmr4516542a91.7.1784323785486;
        Fri, 17 Jul 2026 14:29:45 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::f5f9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bbab9sm12249333eec.15.2026.07.17.14.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 14:29:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jul 2026 17:29:42 -0400
Message-Id: <DK15ZPPHBWGS.12AEC4957Q8NL@etsalapatis.com>
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "longlong yan" <yanlonglong@kylinos.cn>, <andrii@kernel.org>,
 <eddyz87@gmail.com>, <ast@kernel.org>, <daniel@iogearbox.net>,
 <memxor@gmail.com>, <martin.lau@linux.dev>, <song@kernel.org>,
 <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] libarena: use ARRAY_SIZE macro in test_rbtree.bpf.c
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260717073237.1048-1-yanlonglong@kylinos.cn>
In-Reply-To: <20260717073237.1048-1-yanlonglong@kylinos.cn>

On Fri Jul 17, 2026 at 3:32 AM EDT, longlong yan wrote:
> The ARRAY_SIZE macro is more compact and more formal in linux source.
>
> Fixes: 6c3e8a4d4765 ("selftests/bpf: libarena: Add rbtree data structure"=
)
> Signed-off-by: longlong yan <yanlonglong@kylinos.cn>

NACK, please see the exact same comment I made on the other thread
that made the same change for the ASAN buddy selftests.

pw-bot: cr

> ---
>  .../bpf/libarena/selftests/test_rbtree.bpf.c        | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/libarena/selftests/test_rbtree.b=
pf.c b/tools/testing/selftests/bpf/libarena/selftests/test_rbtree.bpf.c
> index 856c484a009a..2b4f519d6c4b 100644
> --- a/tools/testing/selftests/bpf/libarena/selftests/test_rbtree.bpf.c
> +++ b/tools/testing/selftests/bpf/libarena/selftests/test_rbtree.bpf.c
> @@ -4,6 +4,9 @@
> =20
>  #include <libarena/asan.h>
>  #include <libarena/rbtree.h>
> +#ifndef ARRAY_SIZE
> +#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
> +#endif
> =20
>  typedef struct node_ctx __arena *node_ctx;
> =20
> @@ -275,7 +278,7 @@ clean_up_noalloc_tree(struct rbtree __arena *rbtree)
> =20
>  int insert_many(enum rbtree_alloc alloc, enum rbtree_insert_mode insert)
>  {
> -	const size_t numkeys =3D sizeof(keys) / sizeof(keys[0]);
> +	const size_t numkeys =3D ARRAY_SIZE(keys);
>  	node_ctx nodec;
>  	u64 key, value;
>  	int ret;
> @@ -373,7 +376,7 @@ __weak int test_rbtree_remove_one(void)
> =20
>  static __always_inline int remove_many_verify_all_present(struct rbtree =
__arena *rbtree)
>  {
> -	const size_t numkeys =3D sizeof(morekeys) / sizeof(morekeys[0]);
> +	const size_t numkeys =3D ARRAY_SIZE(morekeys);
>  	u64 value;
>  	int ret;
>  	int i;
> @@ -394,7 +397,7 @@ static __always_inline int remove_many_verify_all_pre=
sent(struct rbtree __arena
> =20
>  static __always_inline int remove_many_verify_remaining(struct rbtree __=
arena *rbtree)
>  {
> -	const size_t numkeys =3D sizeof(morekeys) / sizeof(morekeys[0]);
> +	const size_t numkeys =3D ARRAY_SIZE(morekeys);
>  	u64 value;
>  	int ret;
>  	int i;
> @@ -434,7 +437,7 @@ static __always_inline int remove_many_verify_remaini=
ng(struct rbtree __arena *r
> =20
>  static __noinline int remove_many_alloc(struct rbtree __arena *rbtree)
>  {
> -	const size_t numkeys =3D sizeof(morekeys) / sizeof(morekeys[0]);
> +	const size_t numkeys =3D ARRAY_SIZE(morekeys);
>  	u64 value;
>  	int ret;
>  	int i;
> @@ -482,7 +485,7 @@ static __noinline int remove_many_alloc(struct rbtree=
 __arena *rbtree)
> =20
>  static __noinline int remove_many_noalloc(struct rbtree __arena *rbtree)
>  {
> -	const size_t numkeys =3D sizeof(morekeys) / sizeof(morekeys[0]);
> +	const size_t numkeys =3D ARRAY_SIZE(morekeys);
>  	node_ctx first =3D NULL, last =3D NULL;
>  	u64 value;
>  	int ret;

