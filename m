Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB4837205D
	for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 21:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790026248; cv=pass; b=ST+gFpDVQ5rfdE/wWDpr769bJK1dBL953SD94Yyx2W7IfOf2ethC2bEG5UH6cU5SZk7gm1xJOMoAGcQlf1gerXAhRScTsUfd0zzjUINHyM+ZNTzideXMaRN0LNnm1Jam+7wTnPKf0DsrxZUvOc1WNXz+FWzevQXBJpGV29e1uUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790026248; c=relaxed/simple;
	bh=iaXTPIKH2D73T2js8KZyUAj+YswgCyg2dK6ubYpwlXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hG1zoWVaO6goZU2hH67eqiZKzOBSHoI2j33W6XnwX1SJSwWUqVd/IvLx0Z0AJS/sWbTEZUEub3lgZvYch+YXPMToIuls9r/7r7FTmzEsWsuUvCBph/fLW5mt78y5fYFeU86LkwVmM04yDTjJzH+8TR5Ea2e83nflXoBnWS126No=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h43xxRko; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h43xxRko"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398cb5615deso4073677a91.3
        for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 14:30:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790026246; cv=none;
        d=google.com; s=arc-20260327;
        b=N/4GgdBWQXXSXhR5lG47zgRDqhSoQdktB0mBKEZ/sP10bVK+NWN0zJUxsrGowG1edZ
         eTHzcx039JZ0/AwHQzIxavDciPdqK1IQMViOz5j7+BjIQeeWT13wl/nDKY4eK248YZFU
         RHGNkFAKobW2x2150ezKSBv/3NSTFflrkUfAkxq+Jvgx+rCeIcuMV9rWzWd8/036FLwd
         uW/7sLUAgIvA3lCoxuoDfs0VIVcALXimkUxB9HYu64XaPVoQKipTxipH/5q+na6o32zQ
         oZphjI5Syv/6R7xgs+Wo1X+vziavTFd7fwCRUlNU5jZ31dQ860oK9WwrvkFMIDZ3JKgl
         kndA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5UCNksm1oqsm+FKq1Whp9B5kNMlJu9ggUGVJnCzUXOA=;
        fh=PIEgkAwAqsHjMouW9TZ1J5+drY3uvfZ60M2kBNZnXqM=;
        b=RxiYBpESCDCANs1i4wpMSJf80KfTaiNKgxnQOWAciOrlUHvHHPDBYJ5+wIh+dveEAh
         2i3ClkYxvwqc65ZdtfVfTCYqsTASCAg3kANmKCmLl6exUNt0ss4CYwHzFqBfC+9wFGX4
         2qb05NSOOZ0pojnKhny0MxrTI5EboL5h/g7YbTTnasrLGNOWVYN7LOMAKLNbV2dLWwtM
         Os39DXpZoCiws6KPMNZNBYX/fNQEkQmEHxHWwpFrf2Eplo8XN4DDPur0qjR7vhoQSXAc
         Ak5bslFtQq1REUrKfYyPCVD8TbXHQojA2mPCHvX+AWtBbz97vsVh402em8bUuhnbGKXz
         0aHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790026246; x=1790631046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5UCNksm1oqsm+FKq1Whp9B5kNMlJu9ggUGVJnCzUXOA=;
        b=h43xxRkoWLubh3RXwVX8mcEXOYU2R7xBch6BiQsiMRaHVGS6J5kASrBJyTJ2O8vpQ+
         nT6Ai0akiRXwpez0og2+rzN5NsVysjgWLxQ11bPqnrD284FWpFj+UUgiiEVjtpgvlEIA
         44TBwmEXnENuLUUZ+6d09GKrHPBAyiDa9P/KS2On7EESxcJrglVhGejHJQsFpM+DcC9g
         8/SxKWNmul8XUufXhak6r++ulagL0+2Qez+ZT4qqG7rGau0Sae036hj5cvWpr+Mo1Ev2
         4Dl8GUQIw8IhMl3wAidhGCnzyC8eCcy3zn+8CQjbZV5julGyWAqQXp4jusFEEO9hJ3gs
         7/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790026246; x=1790631046;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5UCNksm1oqsm+FKq1Whp9B5kNMlJu9ggUGVJnCzUXOA=;
        b=Yjl3mnxcAFfSb7T8l7Q2upzUwaqSO+neRnIYI2xcqyUgSndql5MxrfmBmKeBAb3L0e
         PY0kXaz0Jn/51VSXBOzEhMmmXRW1Pe3lvuTNW84XD1UdDUL2V/ywacbarufg9NdAfNKK
         HGul5Rs0QPc/VKFYS20RlSxjftxwqtUnopH43Yb+fQaiOsgyBjtjICT49NgD59K2y4LB
         SNrLEtD5qnG359VGWzf9yTQN6JerCq3CiFlcPDBrLrk0xj7rQO1+sNPwwmz4jmMjxFyN
         IrPNgN92vIygcckd/u6n9QJEzZDwZhAxF/K2YkcfWXYLK1FQIlm8cChxb4iyZcE9dVsL
         JACQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0qaCH95B1dtvP+2DFJlqzbor9tEPIvJQZ6halJopf3inrFD5Cx3cA81HCJlJHpKW8LyESR9bZQwzqiOkaawE=@vger.kernel.org
X-Gm-Message-State: AFuF++kXehU3YQGZJoXXEITrpN6eHJlJgbP7+6uQYsabtYK5QeAr35jE
	SSjpWoBuJ6AyxDuizUmP78n7FL+wjUGXYFscmcRw9LBvfXLfa4iUb8xOy5rpolvK6fh05TIoU1R
	RWzRnhcVXy0nWAY0ASfM8knE02KhHUo4=
X-Gm-Gg: AYBFou3sml0K/5AYiSM/A22WNscZRETTrF2iLy7P/aQPR8+nrWukqvGP05zQK8r+WG9
	CcFEvJ9k2mL98oD2cLPhRJWv1cISfpp9nX5jYju+l6McfUfDn1SoW9Vyp8F8zKeBhrOElowzY5U
	PxFBpcefSsMTfY1TZIywO6wi1wEOWbXjGjvyIS5gQyZtO946MTKddHvwDgoshiVImV7Mit+TZQk
	79dRGwbWAqLKTvloT+rhyBpd11CrkbkBjd+TuoNeuHupVEEsGpDTVCmmRsVmW27FKxLT+JJwDoC
	rx+W6Zhbd7PWCNKjAvoMzhO+/LcSpja7o5vPkiXTt3C7pj6fRv6Ec0Q0FbwU6J6AtCotApy+Np3
	0oQrfbGvLUSTy405NAw9IwhW9/sq73ypKWTuWaq/0ML0tvneE0rEG
X-Received: by 2002:a17:90b:2709:b0:39e:6c69:9b8e with SMTP id
 98e67ed59e1d1-39e6c69b257mr10967181a91.51.1790026246328; Mon, 21 Sep 2026
 14:30:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918040919.3402577-1-tweek@google.com>
In-Reply-To: <20260918040919.3402577-1-tweek@google.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 21 Sep 2026 14:30:32 -0700
X-Gm-Features: AcwNN1UBLDNvhaONZR6woeBhYnn7wMW04jRG5L5QnSQolx_VpN1cA7taae-yCUA
Message-ID: <CAEf4BzaeKXEC-gBbxo36wdAGwwZxqkL6pV=oo0dke4S2BmuRmg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 1/3] bpftool: Skip non-autoload programs when
 generating light skeletons
To: =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>
Cc: Quentin Monnet <qmo@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	KP Singh <kpsingh@kernel.org>, Leon Hwang <leon.hwang@linux.dev>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 9:09=E2=80=AFPM Thi=C3=A9baud Weksteen <tweek@googl=
e.com> wrote:
>
> When generating a light skeleton (bpftool gen skeleton -L),
> bpf_object__load() skips loading programs marked as non-autoload (e.g.
> SEC("?...")), so the generated loader program only records and populates
> file descriptors for autoloaded programs.
>
> Previously, bpftool emitted struct bpf_prog_desc fields, link fields,
> and attach/detach/destroy functions for all programs in the BPF object,
> causing the loader program to store subsequent program FDs into
> incorrect skeleton struct fields when non-autoload programs were
> present.
>
> Furthermore, bpf_object__load() can update a program's autoload status
> during preparation (e.g. for struct_ops programs when resolving kernel
> BTF members or adjusting autoload based on map autocreate settings).
> Move bpf_object__gen_loader() and bpf_object__load() out of gen_trace()
> into do_skeleton() before counting programs and emitting struct fields so
> that struct field declarations and attach/detach/destroy functions all
> observe the final post-load autoload state.
>
> Skip programs with !bpf_program__autoload(prog) when counting programs
> and generating progs/links struct fields as well as attach, detach, and
> destroy functions for light skeletons.

This seems like error prone behavior to me. Wouldn't it be better to
hard fail if the BPF object has non-autoloaded BPF programs instead,
as clearly it's not meant to be used with a light skeleton that
doesn't support such programs? So why not emit a meaningful error and
exit?

Or I don't know, let's teach light skeleton how to support
non-loadable programs maybe, not sure what that would take, but worth
considering to bridge the gap?


pw-bot: cr

>
> Fixes: d510296d331a ("bpftool: Use syscall/loader program in "prog load" =
and "gen skeleton" command.")
> Signed-off-by: Thi=C3=A9baud Weksteen <tweek@google.com>
> ---
> v2 -> v3:
>   - Move comment from gen_trace() to do_skeleton()
>   - Add comment to do_skeleton() why the loader is called early
> v1 -> v2:
>   - Move bpf_object__gen_loader() and bpf_object__load() out of gen_trace=
()
>
>  .../bpf/bpftool/Documentation/bpftool-gen.rst |  4 +-
>  tools/bpf/bpftool/gen.c                       | 76 ++++++++++++-------
>  2 files changed, 52 insertions(+), 28 deletions(-)
>

[...]
