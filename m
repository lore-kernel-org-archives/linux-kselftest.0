Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDFB395AE9
	for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 21:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782251459; cv=none; b=t4Up5Oep5FGC59duZ7u7rkbj+LZ9o1cpsM2wsrf69BZ8JgK4+0wmlggN4IZFgKt8pw6Ep5ftd36yUYxCaBI+SyroNFWYFDgCWB4VsO4nG09yaduhfqOKNNOtUiBIJ01ykoXV6FJMqD4Q93irQL4SKe+RXEwiHWKhEWDLhnqHLTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782251459; c=relaxed/simple;
	bh=AfKLgzwWQGEaXCQiwOYFEnHu532Ob2PVTdOP9IlN0+c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hvgPLK+8a4GLLJ+2mYWzwsjnRBt7aZQ7+px0l7oZgQ9nGOWhrIVTOqRrAy2RagQ5aCws/UNjfKJbpSlcmmmU7YbvugaJzfJSaa1JT7N6y7AQrxou8DzkZ4YCqHJ/wR4ql7YuU7lOTHwikXRrJ2F2BFwW6l+9WXKCajObfV/U4gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=CHFKymLZ; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="CHFKymLZ"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30c52f96f60so619500eec.1
        for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 14:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1782251457; x=1782856257; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CI0m2Bkca3T9X1wUQjN9Y3sphEwKAETg9MfJKMjr+2M=;
        b=CHFKymLZwff5cCj2b+xeC4NCzSVy6PxiCy64IMkGhBvk2tRgkGX5cclnXwLZG+f2/R
         +zOG+gqLo2KuDED2IBjwxrq6V5tGHCtaWaez1qYzisfPz+Nv/3gYBj1WYysxpFJfLI+G
         vClXBrc3xttcwFcnHvq2kjC3Izu3BC9On1v9CKtddDmv/XWPurifTj3KMrgfdCDDjpZO
         eG8RgJ+GB0Nbefz83l2pYp1jzt/ldFQ9W48uDgxpgg/7ugNLVgjKRU//zCQboYC5cMMb
         saDI0rd2E4BVoTXQ6Qdq1w5yDFJ14AVdWP18AMnr2Rm6aDRDDafsKV4LekBFotYz0/Ri
         KlUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782251457; x=1782856257;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CI0m2Bkca3T9X1wUQjN9Y3sphEwKAETg9MfJKMjr+2M=;
        b=LdKIX+8Df2CXpNV/o9+tZ87GC0Fypt4PkpHhK1G+EQ65MyjBV1ITrXmKIBpopnWDDq
         TWiE+J1QhjyWa5WPqR2L9StdOMwc6od7aIy9VtiQeL0Vvk032V+U0Yt1VCQtnrXjXPJ6
         4jfgdr51XV3LREfBC9teZGTDOVTtzXweSOdyx923cpEq+27a2COyrOfR2lP6GHp8FfVF
         VNza+gYTT/qS9HH6xCBLew56600l86ywM4zsDXCjz3Mo6mwEkpxWNhJD3LxedjZTNHSN
         ThloUJ7AFJiNluL+K2y1wyqt/2Bq4tFDxicM8prsYeX9y1UTJGquIyGZshKSy4ESFhSs
         Hiig==
X-Forwarded-Encrypted: i=1; AHgh+RoyunKFi4NiINB69WNVA6dm1yvBHQejZFfCQ7290sOK6jKU7xSiwRCsbsuDcFH473kgo9QNjZw0QBaHVOkgyFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT+6q5arrBmZZ1MzrzdRQcr3c/ZP4IGIS0N8gWmG6GNAYWdWIt
	1Q/Y1sDy84huIPuLECxn7flQfRT/yUX+WO6MFtl+C4luQ8lwKsLYuE5D//iwF+swFww=
X-Gm-Gg: AfdE7cnrA845rZGn8UgTpBd96ciSBZc8aAaS84Fe+Z7NneurQlbOGNmhg2H05HlC4SE
	EWmbSJhjWhD8ankPGmryUtTqB8yg9nzdfYR0LYWfhRcVLO1S5ss+GU/MzOJRpV8MHlvAvslzbbf
	gTMN8Nx9kyFR5tcqmCzz/pLs2Dv02AHKUxTm2ocYmG4doj/1P9slJA2ivxAAHBuXjtAYcgL+wum
	Cb+1nqMEjwI2V0XJyComgGDpyTmEKn/kipfrI3AoFnKSLLktmPHQEvbcY6oxxYqZoTEKR2fmbvp
	7i4WtjorJrtu4wnTixSTK31Eg3pb+zFewE7ZegGGZkig419gjYQxfsEzMO1h+FFohCVa18LHR2Y
	mH23bNkjNmEsysEBKhzvyjgiMaK+qSveHmUWu/IpeRbCm9rv7grxh/CXoxBHbbXYp+qrrzf8A2H
	hiF4ZZ
X-Received: by 2002:a05:7300:23cf:b0:30c:1865:d9e0 with SMTP id 5a478bee46e88-30c1dbd9a00mr15340344eec.16.1782251457361;
        Tue, 23 Jun 2026 14:50:57 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::2526])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c52daf89dsm8970595eec.31.2026.06.23.14.50.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 14:50:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jun 2026 17:50:53 -0400
Message-Id: <DJGREUPJQM5T.3H08R7F3GNYVR@etsalapatis.com>
Cc: "John Fastabend" <john.fastabend@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>,
 "Viktor Malik" <vmalik@redhat.com>, "Leon Hwang" <leon.hwang@linux.dev>,
 "Dave Marchevsky" <davemarchevsky@fb.com>, <bpf@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v4 2/2] selftests/bpf: Cover refcount acquire
 node offsets
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Yiyang Chen" <chenyy23@mails.tsinghua.edu.cn>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <cover.1782192383.git.chenyy23@mails.tsinghua.edu.cn>
 <bf2a2033ced272106292de4465b8ef3fb991c912.1782192383.git.chenyy23@mails.tsinghua.edu.cn>
In-Reply-To: <bf2a2033ced272106292de4465b8ef3fb991c912.1782192383.git.chenyy23@mails.tsinghua.edu.cn>

On Tue Jun 23, 2026 at 2:11 AM EDT, Yiyang Chen wrote:
> Add regression coverage for bpf_refcount_acquire() on graph-node-derived
> pointers.
>
> The rejected case passes a popped list node pointer directly to
> bpf_refcount_acquire(), which must fail because the pointer carries a
> non-zero fixed offset.
>
> Signed-off-by: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

> ---
>  .../bpf/progs/refcounted_kptr_fail.c          | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/progs/refcounted_kptr_fail.c b/t=
ools/testing/selftests/bpf/progs/refcounted_kptr_fail.c
> index 7247a20c0..024ef2aae 100644
> --- a/tools/testing/selftests/bpf/progs/refcounted_kptr_fail.c
> +++ b/tools/testing/selftests/bpf/progs/refcounted_kptr_fail.c
> @@ -13,12 +13,20 @@ struct node_acquire {
>  	struct bpf_refcount refcount;
>  };
> =20
> +struct node_refcounted {
> +	long key;
> +	struct bpf_list_node list;
> +	struct bpf_refcount refcount;
> +};
> +
>  extern void bpf_rcu_read_lock(void) __ksym;
>  extern void bpf_rcu_read_unlock(void) __ksym;
> =20
>  #define private(name) SEC(".data." #name) __hidden __attribute__((aligne=
d(8)))
>  private(A) struct bpf_spin_lock glock;
>  private(A) struct bpf_rb_root groot __contains(node_acquire, node);
> +private(B) struct bpf_spin_lock lock;
> +private(B) struct bpf_list_head head __contains(node_refcounted, list);
> =20
>  static bool less(struct bpf_rb_node *a, const struct bpf_rb_node *b)
>  {
> @@ -93,6 +101,32 @@ long rbtree_refcounted_node_ref_escapes_owning_input(=
void *ctx)
>  	return 0;
>  }
> =20
> +SEC("?tc")
> +__failure __msg("dereference of modified ptr_ ptr R1")
> +long refcount_acquire_list_node_offset(void *ctx)
> +{
> +	struct node_refcounted *node, *base, *ref;
> +	struct bpf_list_node *list_node;
> +
> +	node =3D bpf_obj_new(typeof(*node));
> +	if (!node)
> +		return 1;
> +
> +	bpf_spin_lock(&lock);
> +	bpf_list_push_front(&head, &node->list);
> +	list_node =3D bpf_list_pop_front(&head);
> +	bpf_spin_unlock(&lock);
> +	if (!list_node)
> +		return 2;
> +
> +	base =3D container_of(list_node, struct node_refcounted, list);
> +	ref =3D bpf_refcount_acquire(list_node);
> +	if (ref)
> +		bpf_obj_drop(ref);
> +	bpf_obj_drop(base);
> +	return 0;
> +}
> +
>  SEC("?fentry.s/" SYS_PREFIX "sys_getpgid")
>  __failure __msg("function calls are not allowed while holding a lock")
>  int BPF_PROG(rbtree_fail_sleepable_lock_across_rcu,

