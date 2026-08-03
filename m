Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAE93126A0
	for <linux-kselftest@vger.kernel.org>; Mon,  3 Aug 2026 02:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785724164; cv=pass; b=Sj77PHZM+klaTHmUfoXO2YVaDPhR4HuQyQt6rYcK/It9F15yE7R3QNBkdLj5QTt/Wu9q+3m9EgVOMzQ9VlC3D3Ybzm7Pr8A4rqzC2JCkXeF4j66k6yWutjQZbO7aHWhk8wqrXHWpc4GxhgKgB+KofwqnaE8cKWG+kxePD9kFzts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785724164; c=relaxed/simple;
	bh=6BKo6a/fZZgSNwGYMaNu4yAY6/Dm7GkFusN13Gumcu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qsRgnibROCLFP34GSgJYQFEBkOLMeeDsMZivGh/1o/GUJXVQi9KQoi2Lsn0+NtnMLSfSy3vVvD9D5vDqjfhUOdlstQMQIs6A6TedW7QjB9urJpFuZOibxv1m+bPV8wZiXCujJPItX9EAE7igqxGnAK/c9BreIl5iPhJXQXE7+kk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8YvpmWS; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8YvpmWS"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aec6360133so2609242e87.1
        for <linux-kselftest@vger.kernel.org>; Sun, 02 Aug 2026 19:29:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785724160; cv=none;
        d=google.com; s=arc-20260327;
        b=Jc2Zm2HSbPE+aJiBNF1gU8vjwpnI+QKYdQZ9cXKAyovy0OXf7EZ96UsFb2q0GJQdzO
         EmfnpGTLRhhtII1H4Pn7Txd1eOxmj7GvYoIHVV//rkpjxg2ODN1HL7XyPz68YNe70nF6
         /4KznmLOKtdbmjISXN6WIX3AEgVhP5mmOQshPBDoW8S/JU0XCp1p64ZmZw41OrLvgAbs
         h/PpSUr084B3GPb2jPPIqNvMSh5JqNdclCSGFdVIjhPj8WpVDiietJoxCwo/+X+YbpC3
         +9Apcu7AXKUZE/UbUyDKExpa7FeYpWjgFqm8/ZUciv8p1dtrM/BXuCI9OVMoCIOJMMjM
         1lCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yVhihwITAfz3n4uJB5RhPmF2OZxrlKktDDWd4HN0PXU=;
        fh=m4sVkcne0BkFSUnbvZlDsgLvMkHBQvqghUNUqr6rt70=;
        b=kbfBNqlplnI2kAbPJDbV/7hludJVqq36BWjsUw2xUh/lbOSXFIRrFvOocxBP95/aA2
         I78VqhvW/5RRMPLc96VSpWHUTC3OMP/l1aNXlE79O0pU87PnOa31kYDZGrpSOBp+PVqH
         S/QHSYd0E2Ec4g5ho7diTUVj9ea7KsLUC3VggM7nLftybBzfiWmXXU89kG2uWUwwB/Mj
         LnaWGbgjHLPdKXWhklH90N7TG2iVyiJ6eCP8QaFJ9voSK6+ACYqAF7Q42p92CBKv9fQf
         /Omz2oX1uAg1XDgiAazgH2NwfezB4ellkNs6g/MLUdMWFb65u0mnYLvn8Afce2n4ynn9
         dKAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785724160; x=1786328960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yVhihwITAfz3n4uJB5RhPmF2OZxrlKktDDWd4HN0PXU=;
        b=f8YvpmWSB6W49+J7o8rVOxTJ5sDwDnAUMyTIHUkUNAjyK/E7iF44FrCBZr3iSbR9Br
         OtbTIWd9nLlnR+DvosjDtKvT6QWaJkq6t27N/g+PFZVmqqIBbCW1jFMbezAmVUSkMT1f
         7Z/D0Jly2H4+2ZQP99Hi7DV9ZG9PEsXpBft5R+++b1o2GVx/6A+aNe+oo835/LQKjzjP
         mYR09zuogm47sQ4bjnhNj0AjR3v4XbGaw6mKvLw5hITyARCV88su/ZqsitOYAuNnXnv0
         r4uLrID9ECSiVWRmoPLe8FiVPT5zZLt2IVNUZdk7M+Gr9D2+JXZ4Mh+XEaI2GriLIO4K
         4g5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785724160; x=1786328960;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yVhihwITAfz3n4uJB5RhPmF2OZxrlKktDDWd4HN0PXU=;
        b=ZSit2RojzLkwRI3pVDtthdK8DsVoZBLvb9vTFlkgP5biBiu13dUesgt0smf3UbBD4F
         /dcN+CSIYNRBu2FOfYXCT0UsXdu6EjAtjrUtFgNeKEIITvfvVVtGV4qDhwbmJuZBzIvc
         4kIuF3UJZ/J683ksqLPkIxQzEmgN/KtzyXuPpHNapA6tKSy+8Op/6gKtT//691DFXVuO
         +qzhxJ9TMTvH/lkjyqKp5iyDohT4wOwMwEEJHLfDhONhFrtDr9/ee+J6nD3vdE5mfMZI
         +UYtYDtoWAkWke0IVezCI4gJvEDSCKLKL3qkFEJ8fRs+SiUou71TZapuhE6EQm+Fyoh8
         6hbA==
X-Forwarded-Encrypted: i=1; AHgh+RplrCpWwW4E49e5GqOcIrrfj/MnDO5sYIgXvxfhsnMoDcdIihgkQnF7jjP/bmj1Fle71t3FmT1TTc4KxFmq4DM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVgOQlUBP8HxAI/18Vo757Z/RtfZC+4XvEgVeva4KbH1eI13CQ
	gaUzJD2TWYoVxpKoJcdIigx/fYaAQZezp2tXE9JqjxnbG1TRuObXGaRw/cEXUe2CAZthUP4xF0D
	KlBi9vomKfUHhzHtCO3axO3XXZZfdywY=
X-Gm-Gg: AR+sD11ZXI8B45PkgCS/QTevMyligu4OYYlQsyBnvkBgmdQd4Jh5ChIPwYynNEM6Y5i
	qh7BWYMPqp7abWQD3f0l9xwDW/qjNbC89yz6/ln+pNMkZUL6LAdhOH+EeWl8/BQ6AT8BRFa6lk5
	xILq/DwCU0g1iwSTxvZJfQBQpS6jKyHqv0S55uq7dfrdlA8xPmmPEwYV/gpNTlNBTQ+EW3rYpVt
	DjysYTTENuDP3EFjmFwOvKube05G0nnx6dt3dvnv6SJ3ctKCiLEOMh8BTr2OUzslBsEM+U/S6eQ
	ojI1utX+a8SVKoov+av/1Jo2mXENwgccrunsGYz4+aQ=
X-Received: by 2002:a05:6512:61c1:10b0:5b2:a3a3:f8bc with SMTP id
 2adb3069b0e04-5b2e4f34600mr1078603e87.24.1785724160105; Sun, 02 Aug 2026
 19:29:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726021304.97ED91F000E9@smtp.kernel.org> <20260728033837.1466123-1-dingning04@gmail.com>
 <DKEUME1DRKOR.2R2XVNQDZKVSR@gmail.com>
In-Reply-To: <DKEUME1DRKOR.2R2XVNQDZKVSR@gmail.com>
From: Ning Ding <dingning04@gmail.com>
Date: Sun, 2 Aug 2026 19:29:08 -0700
X-Gm-Features: AUfX_mwEwpHI-i2By8EjhZXHPmcGr0Ttv7R6KbGsYZWY-jR3VTn86BzlSh-gME0
Message-ID: <CAJP4iuumoLdD62rXf=3HexiKVoKbXHJka7tm9+Cw-LaKmuvC+A@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf: Reject writes through untrusted allocated pointers
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	john.fastabend@gmail.com, andrii@kernel.org, eddyz87@gmail.com, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, shuah@kernel.org, 
	danieltimlee@gmail.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The existing PTR_UNTRUSTED branch is after the access-permission
check. It only handles the case where we propagate the PTR_UNTRUSTED
flag to a field pointer loaded through a BPF_READ. For a direct write
such as res->key =3D 42, no pointer is loaded and that branch has no
effect:

my_child =3D res->child; // in that case, my_child will be marked with
PTR_UNTRUSTED, that is what the existing PTR_UNTRUSTED do.
res->key =3D 42; // The existing check doesn't handle this.

On Sun, Aug 2, 2026 at 4:32=E2=80=AFPM Kumar Kartikeya Dwivedi <memxor@gmai=
l.com> wrote:
>
> On Tue Jul 28, 2026 at 5:38 AM CEST, Ning Ding wrote:
> > A kptr loaded under an RCU read lock has MEM_ALLOC set. After
> > bpf_rcu_read_unlock(), the verifier marks it PTR_UNTRUSTED, but
> > check_ptr_to_btf_access() still allows writes because
> > type_is_ptr_alloc_obj() ignores that flag.
> >
> > Reject writes through MEM_ALLOC pointers that are PTR_UNTRUSTED. Reads
> > remain allowed and are converted to probe-memory accesses.
> >
> > Also skip the owning-reference check for these pointers, since they no
> > longer have a live reference after leaving the RCU critical section.
> >
> > Add verifier tests for the rejected write and permitted read cases.
> >
> > Fixes: 503e4def5414 ("bpf: Replace open code with for allocated object =
check")
> > Closes: https://lore.kernel.org/all/20260726021304.97ED91F000E9@smtp.ke=
rnel.org/
> > Assisted-by: Codex:gpt-5.6-sol
> > Signed-off-by: Ning Ding <dingning04@gmail.com>
> > ---
>
> Same comment for this one, split kernel and selftests into separate patch=
es.
>
> >  kernel/bpf/verifier.c                         |  6 +-
> >  .../bpf/progs/local_kptr_stash_fail.c         | 58 +++++++++++++++++++
> >  2 files changed, 62 insertions(+), 2 deletions(-)
> >
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 7aa47342dc65..24c151ad2e62 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -5804,13 +5804,15 @@ static int check_ptr_to_btf_access(struct bpf_v=
erifier_env *env,
> >                * program allocated objects (which always have id > 0),
> >                * but not for untrusted PTR_TO_BTF_ID | MEM_ALLOC.
> >                */
> > -             if (atype !=3D BPF_READ && !type_is_ptr_alloc_obj(reg->ty=
pe)) {
> > +             if (atype !=3D BPF_READ &&
> > +                 (!type_is_ptr_alloc_obj(reg->type) || reg->type & PTR=
_UNTRUSTED)) {
> >                       verbose(env, "only read is supported\n");
> >                       return -EACCES;
> >               }
>
> There is a PTR_UNTRUSTED check already earlier in this function, why is t=
hat not
> working or not enough?
>
> pw-bot: cr
>
> >
> >               if (type_is_alloc(reg->type) && !type_is_non_owning_ref(r=
eg->type) &&
> > -                 !(reg->type & MEM_RCU) && !reg_is_referenced(env, reg=
)) {
> > +                 !(reg->type & (MEM_RCU | PTR_UNTRUSTED)) &&
> > +                 !reg_is_referenced(env, reg)) {
> >                       verifier_bug(env, "allocated object must have a r=
eferenced id");
> >                       return -EFAULT;
> >               }
> > diff --git a/tools/testing/selftests/bpf/progs/local_kptr_stash_fail.c =
b/tools/testing/selftests/bpf/progs/local_kptr_stash_fail.c
> > index fcf7a7567da2..d7b8cd6458bb 100644
> > --- a/tools/testing/selftests/bpf/progs/local_kptr_stash_fail.c
> > +++ b/tools/testing/selftests/bpf/progs/local_kptr_stash_fail.c
> > @@ -8,14 +8,22 @@
> >  #include "../bpf_experimental.h"
> >  #include "bpf_misc.h"
> >
> > +extern void bpf_rcu_read_lock(void) __ksym;
> > +extern void bpf_rcu_read_unlock(void) __ksym;
> > +
> >  struct node_data {
> >       long key;
> >       long data;
> >       struct bpf_rb_node node;
> >  };
> >
> > +struct plain_data {
> > +     long key;
> > +};
> > +
> >  struct map_value {
> >       struct node_data __kptr *node;
> > +     struct plain_data __kptr *plain;
> >  };
> >
> >  struct node_data2 {
> > @@ -31,6 +39,7 @@ struct node_data2 {
> >   * [35] TYPE_TAG 'kptr_ref' type_id=3D34
> >   */
> >  struct node_data *just_here_because_btf_bug;
> > +struct plain_data *just_here_because_btf_bug2;
> >
> >  struct {
> >       __uint(type, BPF_MAP_TYPE_ARRAY);
> > @@ -82,4 +91,53 @@ long drop_rb_node_off(void *ctx)
> >       return 0;
> >  }
> >
> > +SEC("?tc")
> > +__failure __msg("only read is supported")
> > +long write_untrusted_alloc_obj(void *ctx)
> > +{
> > +     struct map_value *mapval;
> > +     struct node_data *res;
> > +     int idx =3D 0;
> > +
> > +     mapval =3D bpf_map_lookup_elem(&some_nodes, &idx);
> > +     if (!mapval)
> > +             return 1;
> > +
> > +     bpf_rcu_read_lock();
> > +     res =3D mapval->node;
> > +     if (!res) {
> > +             bpf_rcu_read_unlock();
> > +             return 2;
> > +     }
> > +     barrier_var(res);
> > +     bpf_rcu_read_unlock();
> > +
> > +     res->key =3D 42;
> > +     return 0;
> > +}
> > +
> > +SEC("?tc")
> > +__success
> > +long read_untrusted_alloc_obj(void *ctx)
> > +{
> > +     struct map_value *mapval;
> > +     struct plain_data *res;
> > +     int idx =3D 0;
> > +
> > +     mapval =3D bpf_map_lookup_elem(&some_nodes, &idx);
> > +     if (!mapval)
> > +             return 1;
> > +
> > +     bpf_rcu_read_lock();
> > +     res =3D mapval->plain;
> > +     if (!res) {
> > +             bpf_rcu_read_unlock();
> > +             return 2;
> > +     }
> > +     barrier_var(res);
> > +     bpf_rcu_read_unlock();
> > +
> > +     return res->key;
> > +}
> > +
> >  char _license[] SEC("license") =3D "GPL";
>
