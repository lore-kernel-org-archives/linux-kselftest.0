Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E951335F603
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 17:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775238105; cv=pass; b=T9sfdX8bd1ncFQbf3vQtfG6VzxgT+OhaQDu7HifvhC21MudidP9HhIHPVsJ54XJ7e9sWFOJ/wS1AU4TGGeeI7b4laF0dO6iNbZrilTYzWcguMsSSRiqfwXBq9XSPkWPaUXWkOlLVw98CgWDQSZVKriKWHDxOLP7j5CXl5SgMvJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775238105; c=relaxed/simple;
	bh=5lWVn8YMvYAwRs2zR285cHCiDnPH0plenXQD6VjDk7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NWQdVA2U2jjey3uTuFbcnNJhCjRZyZzdboO3WNS63eMpvr2v2hGURpbWWcxvqwPnBT+zqvsqMyK6hW64nf026FzTj60N1oAOb1eyY03yNHDPiolGWeLa1CTYmFCQ0wKMGGWvLTAPHCSCotc4TUQaF2u85YnT4Wo61o2joExY8i0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HSpv9MDk; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HSpv9MDk"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c76bc3e8de3so832472a12.2
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 10:41:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775238103; cv=none;
        d=google.com; s=arc-20240605;
        b=foLGhMHx4WawV3H1yLe8vqcFlXw/9zaTMN5WrTklubESIAEKNj1EH3ILGvfld9DNsN
         LkSgJnSbu5zdzX/L8jo33OrEqdALthxCpIdX54Cp3BEPiBA9C9DzfETIRlHtbXiGtduT
         ekhpS/NHftrQFQ21kdLZSD3R4ZgwlZ9kEY21T71xZkoCx+JBdS+0VP8T1a+IPa0AbB3b
         C56lnUWj2CjZho+cEIUHY1lA75aBCakk4IYbTXht8We9c3W8UFttTUMIYNBMpbxph/Rk
         3xRSM7l5aKXddJ5sesK1vbsOw0fw4YFNqR/J5YalLHjfubLO9j/pGclJsweeP0d29oQk
         Tirw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0W7mSWaqi0MOT0pMvqxQVOJ9twswqNKYzff6Qr8i4JI=;
        fh=rgzhWmPmIVmyllZu6jY6T9RMIDkxkb8U6xIiPEfrox0=;
        b=hLu2lDiLVqSEucPjZR61WT+KPjmtE/Qy5go7lzMa/Wb/PdMts0hrc2EAkFLCH0kBjy
         +SdDiH56mRESME/xBydXo1WXFwES24HVaqah/4RXvkO7LDANUAGRdBdvImg76m88R/GT
         HhuT4WfX3MoFeSuw8os1Kf9DWpElB/zGl0QOVPR5s+SmF3yKQRqdXeIFW+G69MKKb2UC
         ZX6TB/OKkCBYBscHBqgNeLLOWdcNYK8W1QUz1pLtgS8sZm9DsiKgSC+54T04tghwMiqL
         IUZCVXzTVKim9FODRbO7MCiZ+Chv69A49IGXH0aIEvYenfS84ROHJkXjiW69zgEMr12G
         IV2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775238103; x=1775842903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0W7mSWaqi0MOT0pMvqxQVOJ9twswqNKYzff6Qr8i4JI=;
        b=HSpv9MDkKT/viPLD0hFieh7xKUWoJGWqEL4KzchnVZm/cet9S9gFXgbUsl1JVDWB+F
         sczg1985a16tvcxoYeurl9bj3T9tSN+GSSn+u7m6vY9EEZ2jKBuO/nddnNnZy4+u6yU4
         BC3edVGDzPG23s6SbMqU6KiJcVeUWhWnKu80FN79xRQ96yWVQB2Sv/dImD47tIAb/CkN
         d8dhgo6mpb79RF9/WufLOqPMTK82zv2YS++IpInoInWJ6RigAYum/tBAYLdQWZ+vVTA+
         C/c1ziEuiN1tERPZ4ka0TJbcKa9QHCOCVd3JqkgSK4d0rq9wfpCsQibgLJC0P7fTDAfZ
         +sUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775238103; x=1775842903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0W7mSWaqi0MOT0pMvqxQVOJ9twswqNKYzff6Qr8i4JI=;
        b=LO92B4n+4JdIre8ATH5h1kJbNmx9egYtq8ARSUxqag/HNZ1yQG/H7ICxuXxCqMh+Y1
         tfJbrV7aJYIdjRbQUbkio6Xij5VbboJyrHgDrAghOs8JhBAdZ25GLM2NNXnSlX1tGIOx
         1e3PekZBfiJoKv2vlBQRv/MdHv/TqxnQ3xpbTTHNPZgIUxCBJ2N3mBO725VrIqntuCrt
         U3urLVThFBq0PrkaJYyqJvJTlRTNWy8UMLTv+INopfsZt+Fd6J0Li8z9eGzC0tyrKR1B
         zB7ZQTOTrJRgcNOr8oMfgcQ40WhAd+J9aNC0HOA8HKqKll+ZH1W7rPBwICg9XlmGt/tE
         h1uA==
X-Forwarded-Encrypted: i=1; AJvYcCUC2ivH8IEqYwXTJPwD+0hAWCHNjX9vKru9A58wrFaNJy2lYyK3EDqu7JAgdJUnF5Oz2JYAfJtZJf/nnX9Irmw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOz0DfDfHaNBDXVTkkQ91KPAKjpLq/Ucoo/NicXTa3esWA1nNq
	8pTtjB32gy+dKzCTBKp5fSXUMDLz5RH+4tWKzAhQzD2/fh4fmm54BbdS3wu7ZTkaeh7IQ4TJfd+
	6rK8fs7TNdcQAksilz+M79lf9GkKDVtc=
X-Gm-Gg: ATEYQzzngGbZwPI4Mf03A6pmj8Q43lgySIjfkxxGtBFoHBNPadPDPOpnMd77eAJm/5i
	0jLdhiPnLK2NQ034ZkHpMk73y8/Fs/LMn4HiJGV3kMJFCmCLNpH8kfVtSZB8ly/D7cp5k0oeYCs
	B3wJygfJZogzRCzFJJ557/cTkPiO1buyfXZxVbT1dTJKXAd+uJD1SzCcE34upRRCAAK5on56HYv
	VtZAYLy8XD9kX/E7rhV0K1OAXMI2il8g4GwDHkNa2PXzlasKizrTTfLqgce0FHf/+lbGWT+ZMuG
	edK7QQ==
X-Received: by 2002:a05:6a20:12c5:b0:39b:835f:1730 with SMTP id
 adf61e73a8af0-39f2eff3fc0mr3843834637.15.1775238103105; Fri, 03 Apr 2026
 10:41:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260329140506.9595-1-pilgrimtao@gmail.com> <20260329140506.9595-2-pilgrimtao@gmail.com>
 <CAADnVQ+xS4ti=cSqAnG4ePmjEZXUb-8Ss9cjkWiiWgtv-_NNVQ@mail.gmail.com>
In-Reply-To: <CAADnVQ+xS4ti=cSqAnG4ePmjEZXUb-8Ss9cjkWiiWgtv-_NNVQ@mail.gmail.com>
From: Chengkaitao <pilgrimtao@gmail.com>
Date: Sat, 4 Apr 2026 01:41:32 +0800
X-Gm-Features: AQROBzAJduT_bxIDNRvRaGan1qOkkmaaMw5BmIuyvPDf4XREPWFaFbQgB8Axi24
Message-ID: <CAAWJmAYxbEX0M3JFJn11WOfvRoLrxnuXtkDp5omt-FJYwc8mpg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v9 1/9] bpf: refactor kfunc checks using
 table-driven approach in verifier
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Martin KaFai Lau <martin.lau@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard <eddyz87@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Chengkaitao <chengkaitao@kylinos.cn>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 1:05=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Sun, Mar 29, 2026 at 7:05=E2=80=AFAM Chengkaitao <pilgrimtao@gmail.com=
> wrote:
> >
> > From: Kaitao Cheng <chengkaitao@kylinos.cn>
> >
> > Replace per-kfunc btf_id chains check with btf_id_in_kfunc_table() and
> > static kfunc tables for easier maintenance.
> >
> > Prepare for future extensions to the bpf_list API family.
> >
> > Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> > ---
> >  kernel/bpf/verifier.c | 261 +++++++++++++++++++++++-------------------
> >  1 file changed, 144 insertions(+), 117 deletions(-)
> >
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 4fbacd2149cd..f2d9863bb290 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -544,9 +544,6 @@ static bool is_async_callback_calling_kfunc(u32 btf=
_id);
> >  static bool is_callback_calling_kfunc(u32 btf_id);
> >  static bool is_bpf_throw_kfunc(struct bpf_insn *insn);
> >
> > -static bool is_bpf_wq_set_callback_kfunc(u32 btf_id);
> > -static bool is_task_work_add_kfunc(u32 func_id);
> > -
> >  static bool is_sync_callback_calling_function(enum bpf_func_id func_id=
)
> >  {
> >         return func_id =3D=3D BPF_FUNC_for_each_map_elem ||
> > @@ -586,7 +583,7 @@ static bool is_async_cb_sleepable(struct bpf_verifi=
er_env *env, struct bpf_insn
> >
> >         /* bpf_wq and bpf_task_work callbacks are always sleepable. */
> >         if (bpf_pseudo_kfunc_call(insn) && insn->off =3D=3D 0 &&
> > -           (is_bpf_wq_set_callback_kfunc(insn->imm) || is_task_work_ad=
d_kfunc(insn->imm)))
> > +           is_async_callback_calling_kfunc(insn->imm))
> >                 return true;
> >
> >         verifier_bug(env, "unhandled async callback in is_async_cb_slee=
pable");
> > @@ -11203,31 +11200,6 @@ static int set_task_work_schedule_callback_sta=
te(struct bpf_verifier_env *env,
> >         return 0;
> >  }
> >
> > -static bool is_rbtree_lock_required_kfunc(u32 btf_id);
> > -
> > -/* Are we currently verifying the callback for a rbtree helper that mu=
st
> > - * be called with lock held? If so, no need to complain about unreleas=
ed
> > - * lock
> > - */
> > -static bool in_rbtree_lock_required_cb(struct bpf_verifier_env *env)
> > -{
> > -       struct bpf_verifier_state *state =3D env->cur_state;
> > -       struct bpf_insn *insn =3D env->prog->insnsi;
> > -       struct bpf_func_state *callee;
> > -       int kfunc_btf_id;
> > -
> > -       if (!state->curframe)
> > -               return false;
> > -
> > -       callee =3D state->frame[state->curframe];
> > -
> > -       if (!callee->in_callback_fn)
> > -               return false;
> > -
> > -       kfunc_btf_id =3D insn[callee->callsite].imm;
> > -       return is_rbtree_lock_required_kfunc(kfunc_btf_id);
> > -}
> > -
> >  static bool retval_range_within(struct bpf_retval_range range, const s=
truct bpf_reg_state *reg)
> >  {
> >         if (range.return_32bit)
> > @@ -12639,11 +12611,103 @@ BTF_ID(func, bpf_session_is_return)
> >  BTF_ID(func, bpf_stream_vprintk)
> >  BTF_ID(func, bpf_stream_print_stack)
> >
> > -static bool is_task_work_add_kfunc(u32 func_id)
> > -{
> > -       return func_id =3D=3D special_kfunc_list[KF_bpf_task_work_sched=
ule_signal] ||
> > -              func_id =3D=3D special_kfunc_list[KF_bpf_task_work_sched=
ule_resume];
> > -}
> > +/* Kfunc family related to list. */
> > +static const enum special_kfunc_type bpf_list_api_kfuncs[] =3D {
> > +       KF_bpf_list_push_front_impl,
> > +       KF_bpf_list_push_back_impl,
> > +       KF_bpf_list_pop_front,
> > +       KF_bpf_list_pop_back,
> > +       KF_bpf_list_front,
> > +       KF_bpf_list_back,
> > +};
> > +
> > +/* Kfuncs that take a list node argument (bpf_list_node *). */
> > +static const enum special_kfunc_type bpf_list_node_api_kfuncs[] =3D {
> > +       KF_bpf_list_push_front_impl,
> > +       KF_bpf_list_push_back_impl,
> > +};
> > +
> > +/* Kfuncs that take an rbtree node argument (bpf_rb_node *). */
> > +static const enum special_kfunc_type bpf_rbtree_node_api_kfuncs[] =3D =
{
> > +       KF_bpf_rbtree_remove,
> > +       KF_bpf_rbtree_add_impl,
> > +       KF_bpf_rbtree_left,
> > +       KF_bpf_rbtree_right,
> > +};
> > +
> > +/* Kfunc family related to rbtree. */
> > +static const enum special_kfunc_type bpf_rbtree_api_kfuncs[] =3D {
> > +       KF_bpf_rbtree_add_impl,
> > +       KF_bpf_rbtree_remove,
> > +       KF_bpf_rbtree_first,
> > +       KF_bpf_rbtree_root,
> > +       KF_bpf_rbtree_left,
> > +       KF_bpf_rbtree_right,
> > +};
> > +
> > +/* Kfunc family related to spin_lock. */
> > +static const enum special_kfunc_type bpf_res_spin_lock_api_kfuncs[] =
=3D {
> > +       KF_bpf_res_spin_lock,
> > +       KF_bpf_res_spin_unlock,
> > +       KF_bpf_res_spin_lock_irqsave,
> > +       KF_bpf_res_spin_unlock_irqrestore,
> > +};
>
> I think it's a step in the wrong direction.
> I'd wait for Ihor's BTF_ID_NAMED cleanup.

After reading Ihor's messages on the list, if I understand correctly,
our two approaches seem to target different problems. What Ihor's
work appears to achieve is the ability to remove the entire enum
special_kfunc_type. My goal, on the other hand, is to replace many
scattered func_id =3D=3D special_kfunc_list[...] comparisons with a
table-driven approach.

That said, once Ihor's solution lands, my approach would no longer
be applicable as-is. So I have been thinking about an alternative,
please see the patch linked below for details:
https://lore.kernel.org/bpf/20260403170900.58659-1-pilgrimtao@gmail.com/

> Kaitao Cheng,
>
> also please start your part of code reviews.
> Your patches are not going to be landing if you don't code review.
>
> https://lore.kernel.org/bpf/CAADnVQ+TKKptnNB25V3=3Dbcdybh5G6c2DyW2sYtXvyR=
aVnPN8MA@mail.gmail.com/

I will do my best to carry this forward.

--=20
Yours,
Chengkaitao
