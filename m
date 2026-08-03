Received: from mail-wm2-f9.google.com (mail-wm2-f9.google.com [74.125.225.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673A531B828
	for <linux-kselftest@vger.kernel.org>; Mon,  3 Aug 2026 02:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785724558; cv=none; b=KkZpUIrOn0Dl1448Zpx9E1m23pJfgU16P9XMyVBPlRSvjvgy5PTsMj+S6XMfA1vfLQNhwRQ951O1maegjCq7oJQybzKiQnufrcsQfw7+TAUgBdBKChs0v0OwaPoI1x/aTNm8ds4axI+Ouby4szw9nfonCGwtwUgBvvknigBMYRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785724558; c=relaxed/simple;
	bh=uqZKiZHMVjZPw+CxjElRiNNT+EUo0jNZI/pPcTeYGgI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=sXiNi30dWZFMf7G2EoYcpzIr6oAYQBHXwqoeXm2DKrNgDMo3na5fL0JjtZ5QJre/yh9GS4TdoJZfgXDbJoEd5kLJO3gcFyLE4ygCMMba71yymcqJ8l/kRfYkrfBgBT/NZ+Lk68RqHsu+YPbI/nscFXjLmkhUw9S5ta6tSOTN4H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AxAho6zT; arc=none smtp.client-ip=74.125.225.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AxAho6zT"
Received: by mail-wm2-f9.google.com with SMTP id 5b1f17b1804b1-49556ce3549so6640825e9.0
        for <linux-kselftest@vger.kernel.org>; Sun, 02 Aug 2026 19:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785724555; x=1786329355; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7ZUigbRxdElS5a4dCO5FnmZeNlzmT6argLucumOenwc=;
        b=AxAho6zT/KUTvRdIH5z69ZsnnRMS7x9vpaaK0DU4W+KCua551nIOfuGo7mJoIMNli3
         IxnKVPms95R6UKq7ybWF27v9FKYmDjXRD3GqrcisqmQiWR89v1DUzzso4/gJxei0rG74
         R1b1burennZu65j7abE1cHe0Dsmyk1UlVMpuiI7fBL/2pQSxx8iDPz153AAEmCQbSNqL
         cerPjStQWUEOn2q1LCVV4wcIo7Ch2ZgnXkcUaEdb/bncxRLBwUTkdqBnkZ6PVIPKHcQ3
         9aybBqVG4TO7QIaSbuOa48ga3MJyb83Rd1gZv3HM2rPYQ9YvJ78hr3joMFo5bk7TQL9f
         MKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785724555; x=1786329355;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ZUigbRxdElS5a4dCO5FnmZeNlzmT6argLucumOenwc=;
        b=UUq8YlJB6CVJFBb7I8FOJ1RZSSX+z59e9z8YC2IptLHOLev0v15nAKLWUc2wUw4A63
         cHRxsMTRCn4ZrzIK+mxY+IdzVofa6KWlaSTC9G2OLP6Nnmh/gV4gPrdoYxTFjRUr5Xo7
         Cox6cflull4l6QtVTOCVQ4TxXhdcWNKu+737UAsHad4AyyK+WnZLywdM9uYwLw3oby/e
         D/quQHUmGg8wzp+obtX2Zzt3xKggsyzkWUPj8OSPwYZRdOqHSZBbmUc0iOUZkQ32jqCI
         SEwERZqY3mMHv3v+9LyINLL9TUUigC8r2nTGM1Ct7qn2c0AdOcH18Zb/YUPMzeh36JVR
         StPQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMzhdq4924p32hfRiSv4N2iRdc1MKYhsPj3nNS8sGk03C+EdXI+2uz8cut7SXKFemz1wcBWMMH08002z/UHWA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXdEjwaC9Rk1G5KbV9lD6kKgoKo1jvCGWQZ+uu6Hx9qKrbNt10
	HjSsVaRDu/WsxGM+hFkCgMNnogDhzM4Csi8h6KLNonhw9qg5a7YI120i
X-Gm-Gg: AR+sD10KVHdvo5h2CNfWCvin4V8YpPtnwM0IUd2S/XARBpKDX8PgL8c4Ex2tVveTuR+
	kjEfWXibjdIMFEwQVfl7a8W7zbED2vaTREYgUy4QxXyBKa2HxN+HZjLOmFyoAdVlP5vdHGBoPpv
	Kk9xwPcRRE6uNP62hyWsArVoEk2UGrZwK80tGCREocFm6059vfz29fwI6E8pfDZzOWVTqdXjC4y
	UrC8FrN+xNv5bP49Iz0G9q5jsYiIHFqb6Q3HOqI+L+e8d2nJJC672JyOUZYG7YCE2ybYvqVhRph
	jnaVKqo5Fgiw75J8VsrugzpV0hV+tuiKKFmyaMQV3KcbLRvrdHhIB08HVvUIYTIacgUq5nCav2q
	dkAqqClL5SOqc+xFaXG1JkVEXabA6lOmzjHb6bB2seUxvNIXUjuGi3znhNLf/2CyrjLPUKAIttT
	Yy7rrcBdAkA5dQlKeSIu9a4HV+beKvvJpsuKSC+6HQpxc8UwGKD3ACUz6GX81XNE65fwgPbHTFZ
	xpyWg33yuTkN3KyOAtwlzBh4DkeMrMB11d5dGjVIZ6C9o2uUcAgQHuFlmPpef0zrw3Uhxl495/s
	sD0V6S9lupIny+5LxdQ3DDNTGvU0/wkzwFnBYg==
X-Received: by 2002:a05:600c:1f92:b0:495:7293:4fe2 with SMTP id 5b1f17b1804b1-4980c67af48mr128987865e9.17.1785724554503;
        Sun, 02 Aug 2026 19:35:54 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b85be7sm229421335e9.2.2026.08.02.19.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 19:35:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Aug 2026 04:35:52 +0200
Message-Id: <DKEYIUKP4IPQ.M7KVG0KIIU1E@gmail.com>
Cc: <bpf@vger.kernel.org>, <ast@kernel.org>, <daniel@iogearbox.net>,
 <john.fastabend@gmail.com>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <emil@etsalapatis.com>, <shuah@kernel.org>,
 <danieltimlee@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf] bpf: Reject writes through untrusted allocated
 pointers
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Ning Ding" <dingning04@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260726021304.97ED91F000E9@smtp.kernel.org>
 <20260728033837.1466123-1-dingning04@gmail.com>
 <DKEUME1DRKOR.2R2XVNQDZKVSR@gmail.com>
 <CAJP4iuumoLdD62rXf=3HexiKVoKbXHJka7tm9+Cw-LaKmuvC+A@mail.gmail.com>
In-Reply-To: <CAJP4iuumoLdD62rXf=3HexiKVoKbXHJka7tm9+Cw-LaKmuvC+A@mail.gmail.com>

On Mon Aug 3, 2026 at 4:29 AM CEST, Ning Ding wrote:
> The existing PTR_UNTRUSTED branch is after the access-permission
> check. It only handles the case where we propagate the PTR_UNTRUSTED
> flag to a field pointer loaded through a BPF_READ. For a direct write
> such as res->key =3D 42, no pointer is loaded and that branch has no
> effect:
>
> my_child =3D res->child; // in that case, my_child will be marked with
> PTR_UNTRUSTED, that is what the existing PTR_UNTRUSTED do.
> res->key =3D 42; // The existing check doesn't handle this.
>

First, please don't top post.

Second, I don't understand your explanation. WDYM by "after the access
permission check"? It gets invoked for BPF_WRITE, so should be rejecting
res->key =3D 42 if 'res' is a pointer with PTR_UNTRUSTED flag set. What am =
I
missing?

> On Sun, Aug 2, 2026 at 4:32=E2=80=AFPM Kumar Kartikeya Dwivedi <memxor@gm=
ail.com> wrote:
>>
>> On Tue Jul 28, 2026 at 5:38 AM CEST, Ning Ding wrote:
>> > A kptr loaded under an RCU read lock has MEM_ALLOC set. After
>> > bpf_rcu_read_unlock(), the verifier marks it PTR_UNTRUSTED, but
>> > check_ptr_to_btf_access() still allows writes because
>> > type_is_ptr_alloc_obj() ignores that flag.
>> >
>> > Reject writes through MEM_ALLOC pointers that are PTR_UNTRUSTED. Reads
>> > remain allowed and are converted to probe-memory accesses.
>> >
>> > Also skip the owning-reference check for these pointers, since they no
>> > longer have a live reference after leaving the RCU critical section.
>> >
>> > Add verifier tests for the rejected write and permitted read cases.
>> >
>> > Fixes: 503e4def5414 ("bpf: Replace open code with for allocated object=
 check")
>> > Closes: https://lore.kernel.org/all/20260726021304.97ED91F000E9@smtp.k=
ernel.org/
>> > Assisted-by: Codex:gpt-5.6-sol
>> > Signed-off-by: Ning Ding <dingning04@gmail.com>
>> > ---
>>
>> Same comment for this one, split kernel and selftests into separate patc=
hes.
>>
>> >  kernel/bpf/verifier.c                         |  6 +-
>> >  .../bpf/progs/local_kptr_stash_fail.c         | 58 ++++++++++++++++++=
+
>> >  2 files changed, 62 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> > index 7aa47342dc65..24c151ad2e62 100644
>> > --- a/kernel/bpf/verifier.c
>> > +++ b/kernel/bpf/verifier.c
>> > @@ -5804,13 +5804,15 @@ static int check_ptr_to_btf_access(struct bpf_=
verifier_env *env,
>> >                * program allocated objects (which always have id > 0),
>> >                * but not for untrusted PTR_TO_BTF_ID | MEM_ALLOC.
>> >                */
>> > -             if (atype !=3D BPF_READ && !type_is_ptr_alloc_obj(reg->t=
ype)) {
>> > +             if (atype !=3D BPF_READ &&
>> > +                 (!type_is_ptr_alloc_obj(reg->type) || reg->type & PT=
R_UNTRUSTED)) {
>> >                       verbose(env, "only read is supported\n");
>> >                       return -EACCES;
>> >               }
>>
>> There is a PTR_UNTRUSTED check already earlier in this function, why is =
that not
>> working or not enough?
>>
>> pw-bot: cr
>>
>> >
>> >               if (type_is_alloc(reg->type) && !type_is_non_owning_ref(=
reg->type) &&
>> > -                 !(reg->type & MEM_RCU) && !reg_is_referenced(env, re=
g)) {
>> > +                 !(reg->type & (MEM_RCU | PTR_UNTRUSTED)) &&
>> > +                 !reg_is_referenced(env, reg)) {
>> >                       verifier_bug(env, "allocated object must have a =
referenced id");
>> >                       return -EFAULT;
>> >               }
>> > diff --git a/tools/testing/selftests/bpf/progs/local_kptr_stash_fail.c=
 b/tools/testing/selftests/bpf/progs/local_kptr_stash_fail.c
>> > index fcf7a7567da2..d7b8cd6458bb 100644
>> > --- a/tools/testing/selftests/bpf/progs/local_kptr_stash_fail.c
>> > +++ b/tools/testing/selftests/bpf/progs/local_kptr_stash_fail.c
>> > @@ -8,14 +8,22 @@
>> >  #include "../bpf_experimental.h"
>> >  #include "bpf_misc.h"
>> >
>> > +extern void bpf_rcu_read_lock(void) __ksym;
>> > +extern void bpf_rcu_read_unlock(void) __ksym;
>> > +
>> >  struct node_data {
>> >       long key;
>> >       long data;
>> >       struct bpf_rb_node node;
>> >  };
>> >
>> > +struct plain_data {
>> > +     long key;
>> > +};
>> > +
>> >  struct map_value {
>> >       struct node_data __kptr *node;
>> > +     struct plain_data __kptr *plain;
>> >  };
>> >
>> >  struct node_data2 {
>> > @@ -31,6 +39,7 @@ struct node_data2 {
>> >   * [35] TYPE_TAG 'kptr_ref' type_id=3D34
>> >   */
>> >  struct node_data *just_here_because_btf_bug;
>> > +struct plain_data *just_here_because_btf_bug2;
>> >
>> >  struct {
>> >       __uint(type, BPF_MAP_TYPE_ARRAY);
>> > @@ -82,4 +91,53 @@ long drop_rb_node_off(void *ctx)
>> >       return 0;
>> >  }
>> >
>> > +SEC("?tc")
>> > +__failure __msg("only read is supported")
>> > +long write_untrusted_alloc_obj(void *ctx)
>> > +{
>> > +     struct map_value *mapval;
>> > +     struct node_data *res;
>> > +     int idx =3D 0;
>> > +
>> > +     mapval =3D bpf_map_lookup_elem(&some_nodes, &idx);
>> > +     if (!mapval)
>> > +             return 1;
>> > +
>> > +     bpf_rcu_read_lock();
>> > +     res =3D mapval->node;
>> > +     if (!res) {
>> > +             bpf_rcu_read_unlock();
>> > +             return 2;
>> > +     }
>> > +     barrier_var(res);
>> > +     bpf_rcu_read_unlock();
>> > +
>> > +     res->key =3D 42;
>> > +     return 0;
>> > +}
>> > +
>> > +SEC("?tc")
>> > +__success
>> > +long read_untrusted_alloc_obj(void *ctx)
>> > +{
>> > +     struct map_value *mapval;
>> > +     struct plain_data *res;
>> > +     int idx =3D 0;
>> > +
>> > +     mapval =3D bpf_map_lookup_elem(&some_nodes, &idx);
>> > +     if (!mapval)
>> > +             return 1;
>> > +
>> > +     bpf_rcu_read_lock();
>> > +     res =3D mapval->plain;
>> > +     if (!res) {
>> > +             bpf_rcu_read_unlock();
>> > +             return 2;
>> > +     }
>> > +     barrier_var(res);
>> > +     bpf_rcu_read_unlock();
>> > +
>> > +     return res->key;
>> > +}
>> > +
>> >  char _license[] SEC("license") =3D "GPL";
>>

