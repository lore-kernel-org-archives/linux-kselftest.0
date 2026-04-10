Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F0C2E3B15
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Apr 2026 02:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775789643; cv=pass; b=a2djivyUmVJaEwEionTf4MZs8C2BAQAL6axFLBcKCqg8DeuNOKV8qSxxgiuSZ+txKG/Frt5uaY7fqOC6YPBuo01cTmorF0cwXXy2uxacUdKNvWuqQ55VM7TgJ/zgi+070vt5Zk2GDk/kPL1xkl5i0FCbx5AtXQztBMJrM873kaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775789643; c=relaxed/simple;
	bh=+U8n9VxXQerj0YbIEJbEzjVe9qw9ti7gbbPDnGl5yrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ecTdLEqyXeU3vT/C7PG1og6Fu9DWQn1sPneGW1ZYybHybFWYb0XkXR76EFaqc7KbOd1inUBjkvXm692AuVvXgBwZnhxrAPToOho1As9kfQzp5b66ikDrlGYfJxuqiA7gHlzvTXX1iHtycillWShDrsWdWgN5nh55ppA3E6sti3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VlqAAExB; arc=pass smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VlqAAExB"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82f0fc82c76so50543b3a.0
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Apr 2026 19:54:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775789642; cv=none;
        d=google.com; s=arc-20240605;
        b=kRU3re9J2zgY4Su+3hsImf51P4DrzqDCH7Yuog4bUYggbIC9kRpakUfhM1HQBzdXZL
         kbbYkjiEgObv3eFV0qVFXkQeraVggGsaTUq529x/A2SE78HvnHBTNwq/syoB7EdavB2K
         HPnN6P3lFAY7zGI7B9zoXATQLaVdjc5m+E8SKH1ANwDE4jNrzXW+BabqqYqw1LczIKW7
         C9O0mEyu32HpdbJmOxWQks9gdZ4ARfNPq+HJplTZHT90j7/K5anRZax98g3qHPG/+tuW
         h4lmVkSSpVZIZoko7hSrh7zCFt0kqv/l4AlO2P14fEBp4XLqPH8kB7NG8/Bn/680yy0v
         BqhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5SJS/n4iIi0naoS3i40eqv9YxxpAjXCExGdo+g7IVjU=;
        fh=HIfsU+ax4xjkouCIMx9A+aJhWeSeh/teApV0KG/V4bs=;
        b=SHmF5A4lfDbBcnX82mNC637bxvxdpWByHVD9cTwSpFVsK1UwxSqerySdoPwauJ9t66
         RMsLpjNg+ZsBPXvzAtfGh8DZlw/6BHHHVNZnW8JFdTllj63+sPGT0SNTK6MjfdKFwvv7
         RiTk6l8KpKTnNhipttsiapRQ3RToCTtqEERM8HsM8gw94LFmCZdNN52SZcNY9E2pnhcm
         XS2fE7jusoTTrl4dDCogQfE8gibHzc3kY1lfLmPRirUF3SECi0PXrTTkrTfvDG3dvIwI
         zL96NWliS/JyTjCZEmR/5w3kWIm/wdgWOc7c+vCRTnNNbagwriNqZ0RY/sAIZZATe0tI
         8IVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775789642; x=1776394442; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5SJS/n4iIi0naoS3i40eqv9YxxpAjXCExGdo+g7IVjU=;
        b=VlqAAExBBL/FeM/5U0iEfNLpcfOD7w2rLKdd7SQfw4doii9etKrVp3veGCktK5hMdZ
         hJXELi9JHAPuA01ET+s505c58trHk7cnyZUh5en/e81JNUb8jgWJdzDfs9nzCyGWbRkw
         SOJz6pTaYGXObLh76K8UW88fdwxxHXJGMFcXJ02JGC1OrBMfnYOHUwNVyGgjuSU3k9J1
         CccQIOlp3V67aZp0Gw3P83zCvF/B7VSsWd8MXKAeiAN17N9ZEuH6dS2xnB0AI6DSr5hf
         9DkShi0fgUvZlnzXnHEEi/IgCVu/fjur6dN7cJ9J0Q/8Cf8DcyQNgAfWBarPu2TPpypb
         gmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775789642; x=1776394442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5SJS/n4iIi0naoS3i40eqv9YxxpAjXCExGdo+g7IVjU=;
        b=OKNYjkdzpOP+xjYB0FxCoKAY3u1uMFtfGrL9Lt0rtlHBuCXuFFmxTPm9U6SXSLkk1R
         osrzRezUkAilCrAtB0cyJpqKIy4CXPgJw9KH+x8Q016v5PiwWwMhFaN0DwHx9lemgl/A
         OJNNVHd67vw8VG3Y02z/Hehs4+dcqf25+xXTlEPiwEvc7Wi9k0bE1Al81NgBbxg5EOX7
         uR6IxX0tBvMlQM5N6T+ePEab3WdmdaVNHbix6R9sUAd5ssMT9xozcO/ew4k0E6VBSLrs
         ZScZW3IAvFSqZPcUDNYOwg5v45vOntybg5opg6HtZC1MpNkPjPwF0dIJi2kfhjkQqFYI
         /03g==
X-Forwarded-Encrypted: i=1; AJvYcCUiFOMOv2nojefTVzZk1K3MAjawbVwHD0pMG1E70x/QfRPtN8U+o16MdengSYRZethvkoh79EE96iXvjUOtHKw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRpo+pPccdpkElPlDbJ5UUG1nykd1FH/cMjGwS71QmDeOWg/Ds
	bEfacwQw0e0zVvuxek78iFdcb3qV/EE/xdvPXxqFttKJliKlFiPYkqdZJApUxJMI8mqndQyDv7L
	EmfOwucteFNUFyj6h+wKaSPmpdRwReOY=
X-Gm-Gg: AeBDietbHPLqOgbpDrKFUg+EhRHKOYAydUenKwNymp4MqtMb0OmQZvmT2Yz9TxyPhVg
	2EJ5C+J2dydNm+Jr5gE5D8odt19nI2dghS+SIv+5b7X6pegam4dafQ8HX40IhCKezOOanYIslKm
	yVgjeRDVGQqybco2R/DgcRz4+z8ZdirPx6YzmRBZXpkmlhB92lpN562Q40iz+Nnql5pLc81vuCk
	duA4Sed0QsSWM/MxGDiWAIaRHpTrfDrnPFOyUHOS9HKfJm54+OeDKgrOzRlCarE5I1yv75MYFwy
	CNJM7lGh5qRtgLG2
X-Received: by 2002:a05:6a00:3e2a:b0:82c:e4b4:b04f with SMTP id
 d2e1a72fcca58-82f0c278753mr1652567b3a.47.1775789641934; Thu, 09 Apr 2026
 19:54:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260329140506.9595-1-pilgrimtao@gmail.com> <20260329140506.9595-2-pilgrimtao@gmail.com>
 <CAADnVQ+xS4ti=cSqAnG4ePmjEZXUb-8Ss9cjkWiiWgtv-_NNVQ@mail.gmail.com>
 <CAAWJmAYxbEX0M3JFJn11WOfvRoLrxnuXtkDp5omt-FJYwc8mpg@mail.gmail.com>
 <1fcda49a-caeb-42b9-9727-d1ab3d07d84b@linux.dev> <CAAWJmAYNS-NaY-57Pt=GC5qSpbfJLKwydVXfem6ckwgFW9aTnw@mail.gmail.com>
 <82148eb1-f270-48f1-8900-e0becc6384e8@linux.dev>
In-Reply-To: <82148eb1-f270-48f1-8900-e0becc6384e8@linux.dev>
From: Chengkaitao <pilgrimtao@gmail.com>
Date: Fri, 10 Apr 2026 10:53:50 +0800
X-Gm-Features: AQROBzAk4S_eu-LaCn6--bJXN3mHeRr3qnSGVSwJC9tEDVFcDAV1pKx9RIzY8lg
Message-ID: <CAAWJmAZQHmgKXgr0xN5sHWUGyu43xLyg4eG7yBrMDi7YALrKsw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v9 1/9] bpf: refactor kfunc checks using
 table-driven approach in verifier
To: Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Alexei Starovoitov <alexei.starovoitov@gmail.com>, Emil Tsalapatis <emil@etsalapatis.com>, 
	leon.hwang@linux.dev, Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>, memxor@gmail.com
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

On Wed, Apr 8, 2026 at 2:41=E2=80=AFAM Ihor Solodrai <ihor.solodrai@linux.d=
ev> wrote:
>
> On 4/4/26 3:38 AM, Chengkaitao wrote:
> > On Sat, Apr 4, 2026 at 12:49=E2=80=AFPM Ihor Solodrai <ihor.solodrai@li=
nux.dev> wrote:
> >> On 4/3/26 10:41 AM, Chengkaitao wrote:
> >>> On Tue, Mar 31, 2026 at 1:05=E2=80=AFAM Alexei Starovoitov
> >>> <alexei.starovoitov@gmail.com> wrote:
> >>>>
> >>>> On Sun, Mar 29, 2026 at 7:05=E2=80=AFAM Chengkaitao <pilgrimtao@gmai=
l.com> wrote:
> >>>>>
> >>>>> From: Kaitao Cheng <chengkaitao@kylinos.cn>
> >>>>>
> >>>>> [...]
> >>>>> +
> >>>>> +/* Kfunc family related to spin_lock. */
> >>>>> +static const enum special_kfunc_type bpf_res_spin_lock_api_kfuncs[=
] =3D {
> >>>>> +       KF_bpf_res_spin_lock,
> >>>>> +       KF_bpf_res_spin_unlock,
> >>>>> +       KF_bpf_res_spin_lock_irqsave,
> >>>>> +       KF_bpf_res_spin_unlock_irqrestore,
> >>>>> +};
> >
> > ****** Purpose 4 ******
> >
> > It pushes us to untangle messy verifier safety cases and make them modu=
lar,
> > so they can be expressed as parameters to BPF_VERIF_KFUNC_DEF
>
> Again, I agree with the premise that verifier safety checks could
> become more modular where possible. But I think we should first
> separate two questions:
>
> 1. What kfunc properties should be declared centrally?
> 2. Where that declaration should live?
>
> While I'd like to answer (1) with "all of them", I am not convinced
> the answer to (2) is .BTF_ids or BTF. A better C side declarative
> representation would give us most of the benefit here without making
> the BTF tooling more complex.
>
> Here is how I think we should move forward:
>
>   1. Your bpf_list_* work is orthogonal to BTF_ID refactoring, so it's
>   reasonable to first focus on landing it without changes to generic
>   kfunc handling.

There is no consensus on whether the patch below should exist at all.
[PATCH bpf-next v9 1/9] bpf: refactor kfunc checks using table-driven ...

Should we drop it entirely, or limit its scope to the is_bpf_* helpers
that contain a large number of btf_id =3D=3D special_kfunc_list[*]-style
checks=E2=80=94for example by reverting to v8 or an earlier revision?
https://lore.kernel.org/all/20260316112843.78657-2-pilgrimtao@gmail.com/

cc: Alexei Starovoitov, Emil Tsalapatis, Leon Hwang, Mykyta Yatsenko,
      Kumar Kartikeya Dwivedi

>   2. I plan to send patches (soon) for resolve_btfids, and then for
>   BTF_ID macrology to eliminate the enum + array pattern. You are
>   welcome to join the discussion and review / test the patches.
>
>   3. After all of the above lands, we can come back to the general
>   BTF_ID / kfunc handling discussion. If you are interested in
>   developing this further, I suggest to re-think the approach and come
>   up with a "single kfunc metadata definition" that doesn't require
>   significant changes in .BTF_ids section layout.
>
> A slightly off-topic comment: the usage of `_impl` pattern for kfuncs
> should be considered deprecated. Any new kfuncs that work with
> verifier-supplied arguments should use KF_IMPLICIT_ARGS mechanism.  So
> the `bpf_list_add_impl` in your seires should only have one version:
> `bpf_list_add` marked with KF_IMPLICIT_ARGS flag.

--=20
Yours,
Chengkaitao
