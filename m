Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1523358C2
	for <linux-kselftest@vger.kernel.org>; Sat,  4 Apr 2026 10:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775299114; cv=pass; b=rFspQppk/Ctq53fjPfHRgZ6HxAl2UU1w9rgqtdbODq026Ug9r2Oo6QLb8TxW4cY+QsxPVo75RHqorAuo5hq3PSovhKpqa5T0pPVmKU7NOfd5upkf6pZcHU7+An+lUbhy0VarYGk5CK6jTqC3RWSRnwv/lOTdp4kxoqWzQLfJV8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775299114; c=relaxed/simple;
	bh=rPYg7TpDFWwhe5RzRfbD5Fi94DA+blbzYv/IZpUpv7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L3N14fXQCffQZ7/Us+PsCpmpo6gkJwf+1Vq3AAbbTKgupDadBD1WIOUYcvT98ht9XfC7naRKgIzv3hw/hDoJLF/59rQT2cvl2zD8YuC6StT7KVmRRVU6ALr2nAP2IXGPw+Y8zcoLp0OvPa7g6nlLTie9Oe2K2LA/aScHuomw32Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PER6PPnW; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PER6PPnW"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82c28f0a4ecso1987021b3a.3
        for <linux-kselftest@vger.kernel.org>; Sat, 04 Apr 2026 03:38:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775299113; cv=none;
        d=google.com; s=arc-20240605;
        b=S4//qkl2HIJcxA4K5tA2yodSymXs1ZLEOa61bJ6qaJYMkUYenmwBQmaPU1SNrHUlCY
         H0/IPIml/NBqg0aK/EvixeGHHR+7e2G6tNaa2Qckm/AmqQaBezMWntMCkBjr3TRC8bH2
         FUZNk/SVA+d/Cl1JP8eEKgjG2AdehIGMj3pUpSTJMD24OAkB/q1UPc0pW3lyrGQJbQv/
         yztf99Te3AvoxsOAVXdokT7vmGY2KmOZOapnHphQ+xtyXVKmP44CfBq2r6n3KY9nN9FA
         RsWQsorAuCrRLnZfDIOloH5Eu2u/sDKn/vZqJ7Z37gjs+AV1chgG/ugttI2rvKVL/iQk
         WMdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bqvsUxiNr3YkUyIOE+Y6OHDSRkUfY+F/AiYEwjdurB4=;
        fh=xbB2KaQ4ANqbPdyc6OtDzGjV9Z46+yN7Q2he2u073P8=;
        b=I7acJlhQnGsJfWT5kidjzJ7J6BYQX3X8p9KouQ6WaLXgWp/gFBwgvtFKht0xsktVCn
         s/Yp0Y4Q9nEPdnm516VudriL6YyMqg6DyUyZNowI3nq9x4E92iwFLMmAphdpsCori9P+
         Ygi3CYc6hJeUxZ4J5Nh1ShBYVa2qY775KObaa35/E3oniHjlDM3DoZPg7jP8RfFiIGvv
         BZTyYNxm5KUJHUra+3qdz4Xu/kabx9HC0wYTO+1QyB4D9OfJuJM8iCkRzveZvgCqpx5A
         jsYI3hQUS0K2Mr/ZuRUl7IHaJLBmlfRXlMFCYZGyX/uIP7EzxFWOMM96TbtjV30U5Nu7
         9/dA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775299113; x=1775903913; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqvsUxiNr3YkUyIOE+Y6OHDSRkUfY+F/AiYEwjdurB4=;
        b=PER6PPnWSzc+H01zGgIQVMwZL+XRKLd3o08y+Uo/Kr60Yh3mGy4/SMgF5hIiepaIyw
         9pK7XZnRw2jaHl4wydckSnvkDZaGbqaWk9g+ctB7HtY2b88KdB3aULQ2KkHhBfKTQrCL
         TuUIgntI0AM8eVIrkuuJEPXH/Mlx9hCoGBok7tvg2sFqIphyFypIPMbfpI4v2Q4irqVZ
         m7arestqDVHAxkXmaiOUvGQ4UrzjKQYw5YBwMqDFU42Csx01QBrrqWgYvWzZ4LgAm2S4
         VogaGUrD2Oil2Qq3EAdKHMkvMyZA1wtyAbPji0dRvVFKAc14QjlO1aZUDWXP2II1zzHz
         YVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775299113; x=1775903913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bqvsUxiNr3YkUyIOE+Y6OHDSRkUfY+F/AiYEwjdurB4=;
        b=hJtsrASk7tANcBoXIBHFpgjxGqCl5O3EAJoPcSrnUDF65Q85nNwgLU3COwxyMm9XCD
         3z4G5prSE+2osVz1Qq8Gmclu2nTFHRlNTQaQAtLj44tf1gysprceE5lqns9iasR+TR4L
         /GPkLJcEbARX9ugBwuzT2Hu8PMD5dJy6gRgVuLkS55iD2E0UJo9RtIVDTHIO8Z2Ctiat
         ktnZNPPsAhKy6RDR6QkNOCW8Ld+eVpuYwQVdmmlKewzufCLlVbx2NTRlNyPJfBk5muq/
         sq4MDJnqoHOwFnGPXzRuxQ79f/rvz24rtNatdi6rl6wFjjMlwQf7CZSqcs09WY2fjKqT
         tFRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrurM0LT7X8thlRB5Tss2ckoiw9durk4fYbzxJ8SVh+2ZeUusI8z3ptRaFepAtQCQYmBfSKheZJtGVt3uggK4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy4B8posE2xwSZFyPL+dSyT1kUCOylMIzq8mvHs2OwV9c3R+mx
	XCdgxrZnelhn6DqIq3/tBhqDRjsOyJYpNbKtjxCHUFUyaVmYsdWOYSq9q56Nrecvv5wsCQoWEAq
	luoeuq1//VTou7kaRyQGjiw6C2gU41og=
X-Gm-Gg: AeBDievn+5G/jPcPeVsjIWhJvW2HNTxsUtENwyXU04RWoeKKWc/9bRub1/LFGN2tKS1
	UZ76knyCS9RtcxR/jLbjaUDsxbRMc6a9d5PiKf3iSHkcQEli/dDxgjQJ67ZRcy5QZ5HS9xqsTjC
	w17ekBJGbv5T9VkY8aoIUvJQ8j8ugPNuYcdmw9sYO000Usjb0wdi/3IwuBv2T1u1xqT0hyahIAX
	fqehmsvi39cnjl9gBG2oYQYCPxCcBW46I8XQQDLrJunWL5uELvEq20P+qD+/dDTlC5y4EUTsGUL
	lxm9FA==
X-Received: by 2002:a05:6a00:1804:b0:82a:768c:9a2c with SMTP id
 d2e1a72fcca58-82d0da6c2aamr6214084b3a.22.1775299112820; Sat, 04 Apr 2026
 03:38:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260329140506.9595-1-pilgrimtao@gmail.com> <20260329140506.9595-2-pilgrimtao@gmail.com>
 <CAADnVQ+xS4ti=cSqAnG4ePmjEZXUb-8Ss9cjkWiiWgtv-_NNVQ@mail.gmail.com>
 <CAAWJmAYxbEX0M3JFJn11WOfvRoLrxnuXtkDp5omt-FJYwc8mpg@mail.gmail.com> <1fcda49a-caeb-42b9-9727-d1ab3d07d84b@linux.dev>
In-Reply-To: <1fcda49a-caeb-42b9-9727-d1ab3d07d84b@linux.dev>
From: Chengkaitao <pilgrimtao@gmail.com>
Date: Sat, 4 Apr 2026 18:38:21 +0800
X-Gm-Features: AQROBzBVuir0D7nKBJ5AeyVjTwhlTc_NLfpWFV4-GAP2nVZvUQpLNOXZ8a-J-BA
Message-ID: <CAAWJmAYNS-NaY-57Pt=GC5qSpbfJLKwydVXfem6ckwgFW9aTnw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v9 1/9] bpf: refactor kfunc checks using
 table-driven approach in verifier
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Chengkaitao <chengkaitao@kylinos.cn>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 4, 2026 at 12:49=E2=80=AFPM Ihor Solodrai <ihor.solodrai@linux.=
dev> wrote:
>
>
>
> On 4/3/26 10:41 AM, Chengkaitao wrote:
> > On Tue, Mar 31, 2026 at 1:05=E2=80=AFAM Alexei Starovoitov
> > <alexei.starovoitov@gmail.com> wrote:
> >>
> >> On Sun, Mar 29, 2026 at 7:05=E2=80=AFAM Chengkaitao <pilgrimtao@gmail.=
com> wrote:
> >>>
> >>> From: Kaitao Cheng <chengkaitao@kylinos.cn>
> >>>
> >>> [...]
> >>> +
> >>> +/* Kfunc family related to spin_lock. */
> >>> +static const enum special_kfunc_type bpf_res_spin_lock_api_kfuncs[] =
=3D {
> >>> +       KF_bpf_res_spin_lock,
> >>> +       KF_bpf_res_spin_unlock,
> >>> +       KF_bpf_res_spin_lock_irqsave,
> >>> +       KF_bpf_res_spin_unlock_irqrestore,
> >>> +};
> >>
> >> I think it's a step in the wrong direction.
> >> I'd wait for Ihor's BTF_ID_NAMED cleanup.
> >
> > After reading Ihor's messages on the list, if I understand correctly,
> > our two approaches seem to target different problems. What Ihor's
> > work appears to achieve is the ability to remove the entire enum
> > special_kfunc_type. My goal, on the other hand, is to replace many
> > scattered func_id =3D=3D special_kfunc_list[...] comparisons with a
> > table-driven approach.
>
> Hi Kaitao,
>
> I appreciate your efforts, however after a quick pass over the changes
> you propose (both here and in the new series) with respect to BTF_ID
> macros and special_kfuncs_list, I don't understand what problem you're
> trying to solve.
>
> The inherent complexity is in the fact that the verifier must know
> when a particular BTF id identifies a specific kfunc, or whether it
> belongs to some pre-defined set of ids. This is why
> special_kfuncs_list and other BTF_ID_SET/LIST-s exist.
>
> And so there is no way around defining those ids and sets *somewhere*,
> and so far BTF_ID_* macros did a fine job of that, all things
> considered.
>
> AFAICT your changes simply move around the same definitions from
> functions with if statements to constant arrays with a runtime search
> on them (which is slower by the way). What is the benefit of that vs
> the current implementation? We still have to maintain those arrays in
> the same way we have to maintain the is_foo_kfunc helpers.
>
> Your newer proposal [1] takes the same idea to the next level, by
> introducing an entire new BTF kind, new ELF sections and a bunch of
> macros that are no less complicated than existing. And all of that
> just moves the same arrays "upstream" to the .BTF_ids section. Again,
> I fail to see any benefits to that complexity. Having differentiation
> between LIST and SET, and having to mark START and END is not a
> problem that needs solving IMO.

Your analysis of the code implementation for the new proposal is correct.
Let me elaborate on the purpose behind my approach.

****** Purpose 1 ******

As described in this patch:
https://lore.kernel.org/bpf/20260303135219.33726-4-pilgrimtao@gmail.com/

If we want to add a new kfunc, bpf_list_add_impl, we would today have
to add "btf_id =3D=3D special_kfunc_list[KF_bpf_list_back]" (or similar)
five times in verifier.c. Under the newer proposal, that is no longer
necessary: defining the kfunc and its verifier metadata in one place
is enough, for example:

__bpf_kfunc int bpf_list_add_impl(struct bpf_list_head *head,
 struct bpf_list_node *new,
 struct bpf_list_node *prev,
 void *meta__ign, u64 off)
{
/* kfunc implementation */
.......
}
BPF_VERIF_KFUNC_DEF(bpf_list_add_impl, list_api, graph_node_api, ... )

If BPF_VERIF_KFUNC_DEF is extended further, BTF_ID(func, bpf_list_add_impl)
and BTF_ID_FLAGS(func, bpf_list_add_impl) might also become unnecessary,
so the snippet above could eventually be close to all the code required
to add a new kfunc.

****** Purpose 2 ******

The kernel no longer needs enum special_kfunc_type to list every KF_bpf_*
entry. That information is folded into the .BTF_ids.##sfx section instead,
so kfunc authors do not have to touch or think about special_kfunc_type.

****** Purpose 3 ******

As described in this patch:
https://lore.kernel.org/bpf/20260303135219.33726-6-pilgrimtao@gmail.com/

In is_bpf_list_api_kfunc(u32 btf_id) there are on the order of eleven
"btf_id =3D=3D special_kfunc_list[*]" comparisons. As more kfuncs are added=
,
every is_bpf_* helper will only grow longer and the verifier will get
more repetitive. With the new design, those is_bpf_* helpers can be
removed entirely, including the awkward scattered "btf_id =3D=3D *" checks.

****** Purpose 4 ******

It pushes us to untangle messy verifier safety cases and make them modular,
so they can be expressed as parameters to BPF_VERIF_KFUNC_DEF

> The work I was discussing with Alexei [2] is targeted: get rid of
> constant enums that mirror existing kfunc symbols by making BTF_ID
> internals a bit smarter. And the benefit is clear and simple.
>
> If you could explain what exact issue you're trying to address with
> your BTF_ID refactoring patches, maybe we can try converging on a
> reasonable approach to it.
>
> Thanks!
>
> [1] https://lore.kernel.org/bpf/20260403170900.58659-1-pilgrimtao@gmail.c=
om/
> [2] https://lore.kernel.org/bpf/21e5333c-0b57-46ce-99c8-f6c414270e70@linu=
x.dev/
>
>
> >
> > That said, once Ihor's solution lands, my approach would no longer
> > be applicable as-is. So I have been thinking about an alternative,
> > please see the patch linked below for details:
> > https://lore.kernel.org/bpf/20260403170900.58659-1-pilgrimtao@gmail.com=
/
> >
> >> Kaitao Cheng,
> >>
> >> also please start your part of code reviews.
> >> Your patches are not going to be landing if you don't code review.
> >>
> >> https://lore.kernel.org/bpf/CAADnVQ+TKKptnNB25V3=3Dbcdybh5G6c2DyW2sYtX=
vyRaVnPN8MA@mail.gmail.com/
> >
> > I will do my best to carry this forward.

--=20
Yours,
Chengkaitao
