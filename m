Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4873368B9
	for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 17:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774890314; cv=pass; b=BBgQML5rGVHTS5bBieMlHDFTrX14wOmUU8OEpO67ek0S13YApS+CfJsH0CJBHoZnhEUWEbmU+0Ju+xvZ8ANSdguJBr0zBXfkUGulJca1oaMq4ckZjhGOkNjXRMOstESf+fTA8mPLXwMCR0/2VAU1aSluvRd3vD0mn044m+li+Ak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774890314; c=relaxed/simple;
	bh=MxR6uUQzlU0L+1dtxBlkz4hJ9s/+L++FSIFIDeFs6Vo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y8B75ogOYFXfQBR6X4s4E2lTol/k0LXobJLCQ3/d8fAshlJfBrUa2raGMwkqT+9iWttLpddnE4m5wFaQQaE4PVvfdc0s6LREsWoPjwcxlRSfOyHgzQSAVBCfWnJqMWYOEe6NhhsyZ6Yo4KMiiaKEmRiC6P+nygyeKRbMorGMcA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rhBHb+PD; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rhBHb+PD"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43cfbd17589so1401657f8f.0
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 10:05:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774890312; cv=none;
        d=google.com; s=arc-20240605;
        b=fDDFF8xBiEm8kipwNr4j2XSWpOXsxRBYX3Dz8MXG4Di6ST7yonDi7KKLSG27j/PJwg
         Gd+a32lL53FMwMW/1XtlLzhlrfJZntur+L3CL08w9iUi5KSw1kqkcPyPQc12LvCPVnYl
         C6YeLlRVpgf381MOD2/hdBfBRjflKqavtAWjMrWtdKjJOEAU4nHSljpQbqIuIXxVFW5B
         kWd9BkWsAcRouXATSUK0wJfydXYM+ZEqN3pxVRaV97CV9OWXNLcYKchNxjjOp/XXHxMJ
         E7kbHfsgpixKqAqMCXOiSt4fvrHkrHc1nnAQQa5oDn0KoEjnVNIywlf6pU+4yVzUy5jT
         TjOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vcbw3WU+eCsstrggqb5GtyGeU7qDydEcN6TeUdnENQs=;
        fh=ch4KlJged5tCvhzAPKNJ8nK23goztgOZqOGwbiEm7Xs=;
        b=iCZE8HIiPNhZ2+5xXeVCzt4Z8kApwKS34h/jw6dP6+cGnA/Za4WSiRpEa7pGNzX0Qr
         16wXDv0zkUFvsJ7Nk6GrZm+ebaziQSLgECxqlMJhP+9NO/MwlkaLj51a/K1Gw9PmlWtQ
         QGzeWkIFlJyx80PrC1u3SBpjpddgWayRHBEGxA0T5A/nNmMp7kL63Me70HieGhTFCten
         EmN5og/pBtWejrAEx35GmnT1PNaNbvsNCDYjfmUWAjNrjvx1UwSkwLaXUcWyf6G3fXVG
         y0VIYy1CZ/ZctDGLJMeYovkihkGA9g39y9/UjuIfaqiZPb3s65AjegJKyLenjNlEZfm3
         aTWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774890312; x=1775495112; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcbw3WU+eCsstrggqb5GtyGeU7qDydEcN6TeUdnENQs=;
        b=rhBHb+PDq9V5TlQVncDS2lfVoFRbf9nYCdRpptF4yzVzhR2im+od/fiLkENq9urUca
         M7q08/5oiL7JVh7G0Xb+Z12AvU45QQ1GrGWHjjzPbeLaiRuZ9ieSA77ftsZmUK1wEu0K
         PxCHDw6dr1vl/QRj0eHmQ60W/4rsu01Nh8Yyegp+nn//BCl2NeogcvOZ5NHQ9bFKDymX
         ciboWeX6es47YWQJ7WZ26SHX5yn+CUzaN53xUXicPKE+ov0Kvp+5TOEw0QEyPPbTtV9W
         /IZZMDyLkLelGJSP4fRShT9A5TYzQlTI6YZBBvCN4g+0s2EZGxgYSE2fXXZ9PPIhe3Dm
         SBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774890312; x=1775495112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vcbw3WU+eCsstrggqb5GtyGeU7qDydEcN6TeUdnENQs=;
        b=AGuXXSjBSrjkOSYiJRxrwiERPzl+Sra6BnXvpbDqUIHhjlGMTxpGb9X+LQZgCMIDni
         6orz8KgPQNUThPek1gzELULd5Lyc+5++ahuQZyP/FCCU0yjbi4epTWNN19vPZ2imxzkf
         H0X2BkEtwFtznwIwoBl2Vsq7BaKIvWr0cv7qqaZySSFu+6JrC5y7aYESsO99o/ec/Js1
         M27TeuIkky/54F1SbZcGEUmFrV/cQsEhwlM3o//rmWAbImUnM9bWKbXBXpkl6OWJIsTm
         pBTizXYCqMKVCuB3i1hHMh8eC9n2q8AgPujbax9jNPDH8FZx3hCvjQ+xc7xuEhRNPtsC
         y9NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkXCdN7d4Zt8HYYkDMxAi5hLO/ghlQ2JZrChqvEQE3WkQHqK7PvSu8SJ+cfUZOG+3sxtlArQfC4rHoJsGX9/k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy93yqp6c3Wqoh6NUvm02nWEWsKMImEDiKDNXTpwHaO6p5AoSG
	B3AhLpWMZT4mnqlgsLcIcEDczqSYUwrzjxNOvJzFTbo6lSvHPfAY0CKMFEXKJKkUB/zjE9t68Zi
	BMJl46H5vKkL2t2pYLDXTCmQkLFNS7Dk=
X-Gm-Gg: ATEYQzxU8eAapTmz8wUwtQbKrOgnM15XpBL1UxnCqPMBH+6GAeBdMuoq9D0fRhSPx7X
	GZQLXp0k5xXdKRExlOwFaDAdIrz6kug9d+7s6d/LCcuABYjfLbHeBsCA531eCx5PKxOV59T8D5s
	76/bI9m2omJzt0+NUO5r+Jv0DzlwV1uNAKOCt957ohK0EDFPf5I1w4zOGsiuTA1MVlFf7H2Vm6M
	2doMHSzRGiZiD0FOqHZkaf22hdlWBPE/rQ8ZwvqKZ/ZJ/ZDJYYBob65N1bGzVgRB5Jfj3uM62Bd
	n8n+uFAHSFmX/Q6VcSa6wxQntrUOVDsmOBVurlbaK5KDjx/sMbr74mwhGN8wM1GJJ9I1g8jswtZ
	8lIN2b2SMZHLzlQ6rizZLYkxnQR9bW9UBarnK
X-Received: by 2002:a5d:4748:0:b0:43c:ef4f:79e4 with SMTP id
 ffacd0b85a97d-43cef4f7c0fmr13207151f8f.37.1774890311520; Mon, 30 Mar 2026
 10:05:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260329140506.9595-1-pilgrimtao@gmail.com> <20260329140506.9595-2-pilgrimtao@gmail.com>
In-Reply-To: <20260329140506.9595-2-pilgrimtao@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 30 Mar 2026 10:05:00 -0700
X-Gm-Features: AQROBzAfHCUSDXuIIL-jaIg2nAba48yfw0Wy23vmkt12STrtolsJ-ryxkM87QwY
Message-ID: <CAADnVQ+xS4ti=cSqAnG4ePmjEZXUb-8Ss9cjkWiiWgtv-_NNVQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v9 1/9] bpf: refactor kfunc checks using
 table-driven approach in verifier
To: Chengkaitao <pilgrimtao@gmail.com>
Cc: Martin KaFai Lau <martin.lau@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard <eddyz87@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Chengkaitao <chengkaitao@kylinos.cn>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 29, 2026 at 7:05=E2=80=AFAM Chengkaitao <pilgrimtao@gmail.com> =
wrote:
>
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>
> Replace per-kfunc btf_id chains check with btf_id_in_kfunc_table() and
> static kfunc tables for easier maintenance.
>
> Prepare for future extensions to the bpf_list API family.
>
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> ---
>  kernel/bpf/verifier.c | 261 +++++++++++++++++++++++-------------------
>  1 file changed, 144 insertions(+), 117 deletions(-)
>
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 4fbacd2149cd..f2d9863bb290 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -544,9 +544,6 @@ static bool is_async_callback_calling_kfunc(u32 btf_i=
d);
>  static bool is_callback_calling_kfunc(u32 btf_id);
>  static bool is_bpf_throw_kfunc(struct bpf_insn *insn);
>
> -static bool is_bpf_wq_set_callback_kfunc(u32 btf_id);
> -static bool is_task_work_add_kfunc(u32 func_id);
> -
>  static bool is_sync_callback_calling_function(enum bpf_func_id func_id)
>  {
>         return func_id =3D=3D BPF_FUNC_for_each_map_elem ||
> @@ -586,7 +583,7 @@ static bool is_async_cb_sleepable(struct bpf_verifier=
_env *env, struct bpf_insn
>
>         /* bpf_wq and bpf_task_work callbacks are always sleepable. */
>         if (bpf_pseudo_kfunc_call(insn) && insn->off =3D=3D 0 &&
> -           (is_bpf_wq_set_callback_kfunc(insn->imm) || is_task_work_add_=
kfunc(insn->imm)))
> +           is_async_callback_calling_kfunc(insn->imm))
>                 return true;
>
>         verifier_bug(env, "unhandled async callback in is_async_cb_sleepa=
ble");
> @@ -11203,31 +11200,6 @@ static int set_task_work_schedule_callback_state=
(struct bpf_verifier_env *env,
>         return 0;
>  }
>
> -static bool is_rbtree_lock_required_kfunc(u32 btf_id);
> -
> -/* Are we currently verifying the callback for a rbtree helper that must
> - * be called with lock held? If so, no need to complain about unreleased
> - * lock
> - */
> -static bool in_rbtree_lock_required_cb(struct bpf_verifier_env *env)
> -{
> -       struct bpf_verifier_state *state =3D env->cur_state;
> -       struct bpf_insn *insn =3D env->prog->insnsi;
> -       struct bpf_func_state *callee;
> -       int kfunc_btf_id;
> -
> -       if (!state->curframe)
> -               return false;
> -
> -       callee =3D state->frame[state->curframe];
> -
> -       if (!callee->in_callback_fn)
> -               return false;
> -
> -       kfunc_btf_id =3D insn[callee->callsite].imm;
> -       return is_rbtree_lock_required_kfunc(kfunc_btf_id);
> -}
> -
>  static bool retval_range_within(struct bpf_retval_range range, const str=
uct bpf_reg_state *reg)
>  {
>         if (range.return_32bit)
> @@ -12639,11 +12611,103 @@ BTF_ID(func, bpf_session_is_return)
>  BTF_ID(func, bpf_stream_vprintk)
>  BTF_ID(func, bpf_stream_print_stack)
>
> -static bool is_task_work_add_kfunc(u32 func_id)
> -{
> -       return func_id =3D=3D special_kfunc_list[KF_bpf_task_work_schedul=
e_signal] ||
> -              func_id =3D=3D special_kfunc_list[KF_bpf_task_work_schedul=
e_resume];
> -}
> +/* Kfunc family related to list. */
> +static const enum special_kfunc_type bpf_list_api_kfuncs[] =3D {
> +       KF_bpf_list_push_front_impl,
> +       KF_bpf_list_push_back_impl,
> +       KF_bpf_list_pop_front,
> +       KF_bpf_list_pop_back,
> +       KF_bpf_list_front,
> +       KF_bpf_list_back,
> +};
> +
> +/* Kfuncs that take a list node argument (bpf_list_node *). */
> +static const enum special_kfunc_type bpf_list_node_api_kfuncs[] =3D {
> +       KF_bpf_list_push_front_impl,
> +       KF_bpf_list_push_back_impl,
> +};
> +
> +/* Kfuncs that take an rbtree node argument (bpf_rb_node *). */
> +static const enum special_kfunc_type bpf_rbtree_node_api_kfuncs[] =3D {
> +       KF_bpf_rbtree_remove,
> +       KF_bpf_rbtree_add_impl,
> +       KF_bpf_rbtree_left,
> +       KF_bpf_rbtree_right,
> +};
> +
> +/* Kfunc family related to rbtree. */
> +static const enum special_kfunc_type bpf_rbtree_api_kfuncs[] =3D {
> +       KF_bpf_rbtree_add_impl,
> +       KF_bpf_rbtree_remove,
> +       KF_bpf_rbtree_first,
> +       KF_bpf_rbtree_root,
> +       KF_bpf_rbtree_left,
> +       KF_bpf_rbtree_right,
> +};
> +
> +/* Kfunc family related to spin_lock. */
> +static const enum special_kfunc_type bpf_res_spin_lock_api_kfuncs[] =3D =
{
> +       KF_bpf_res_spin_lock,
> +       KF_bpf_res_spin_unlock,
> +       KF_bpf_res_spin_lock_irqsave,
> +       KF_bpf_res_spin_unlock_irqrestore,
> +};

I think it's a step in the wrong direction.
I'd wait for Ihor's BTF_ID_NAMED cleanup.

Kaitao Cheng,

also please start your part of code reviews.
Your patches are not going to be landing if you don't code review.

https://lore.kernel.org/bpf/CAADnVQ+TKKptnNB25V3=3Dbcdybh5G6c2DyW2sYtXvyRaV=
nPN8MA@mail.gmail.com/

pw-bot: cr
