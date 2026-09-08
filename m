Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93731D54FA
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 01:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788829483; cv=pass; b=UBxfGbnykQwSjCiP3C7Og9NKBNkdmAwO8bs2WF4k+OXgfP14j4QL8AE4GNWUJ5r65LkYv0Ik0wtVeYW6b0uXYFpeB9u1hUVOJZUug5OFi+XREnySpzhjYAgzIjVXM6HDSRP0fSsjrszm8DRcELslDTLEAk8AiVM+egO1tUhiAQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788829483; c=relaxed/simple;
	bh=W4XdQovADM5RSeHI+/ZuPheISmstJfmeHSEtcR5uyzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ptabqB78YNHt7psxZKU2ss/FV9AQ3bgyle/Ta7L3NMCAildTxvqh3UfWWicUe+4fDQSkjByhCL3az3PYqURogoZXiMNKjEpSOrHykAkujc62sDr9yp90piQbJUdMa0FiGb1zSb85/91Hv68/tt2TuomIysdyCZg5xxKPCu59OuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S0MczrWG; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S0MczrWG"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5307425f44bso365281cf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 18:04:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788829481; cv=none;
        d=google.com; s=arc-20260327;
        b=arNYkW8BOl6CHhwPHM3YmxHtuCf7YjiSuS9S6v1qhUPBnmruRtDt/Cw4Shsni2tp0r
         n4huUtaSmO6FoE2I9mpCgW+l5Aw9M6/KqNX6Sh9hGZmK61hfO43wpXplP/NYu6R/5n7V
         GmGnLBZ61CyBde5YJCJyAGSAdAZDKr63tNSMszE78X2pbaW0B4eDnvmv7jiO477kLAz9
         ZD+j76Ap1YXkrdjzZkwKvXHaVaZ1Y+Z948iJzSiI50nv7XrRO5472FGPpEgU6pDhEGj2
         xZfCS0ENFntBq/22DdSiIu9slIH0+PpzrUlHZW88RHgb8uxxxCJ3ybtqpNtaYRpWQ3mq
         nYaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W4XdQovADM5RSeHI+/ZuPheISmstJfmeHSEtcR5uyzk=;
        fh=cbP6VxnBVSvvywc4t+weH6Cg1H3iyYlIb3eJl1QRnS8=;
        b=PfeZ3vPQTJBGd+4Z481A8TOFwGQYJZnmZ2kTlA/xtN3S1OjzshRWQ5zyOgH6HG+X3n
         ZvUgT31xaxavyaNPuIErTrdYHTPONRX+8amIcKbLS4zrz/XZ5BkBYpWQ59c65Qwrfa33
         7oXpS596Qa4pv5t9MYrxzt0mP6VLdflwNa+ZbhsL+tBzAQqZNP2JndOwQQ0BmfIGNrfg
         Wakn+00+ND5aPlm5DqeLGgVjFRN29Nvz6paExOo8Ot6NeYa41uu8dYPijzQb3l3QSxxq
         2OaTf8nk8/28p4FSsTrZCrBiKf2zXA/EDuwoZO1ppzkrZ/yL9YwOx7ofg/uDrdfgaCpo
         6y8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788829481; x=1789434281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W4XdQovADM5RSeHI+/ZuPheISmstJfmeHSEtcR5uyzk=;
        b=S0MczrWGpX30+x/4tSE0UhO7/5nIWkmrbcpR+tQLiGy1ecHuzC+1pydZy9SDALW+rU
         cXj7rb/em83lTsyENqxg2vFHRTQ6AV8UJWKIJo3KfoTYwc1YMYJaUwEi65hCN3wNe/3b
         qzsemCnkATfIguMgH0jC8hzs6fOXiXFI67FW/gAE1rF1jXht8shZXpZ+AVg0WFd+w8lW
         GnwY2oPYXN8lXGw7HM4tcJrCGNy4Yw+q2/gWYqephUhYGrJZxvecrpCXWsogsFlaSH9n
         l5x1CEkupBU+lQy9OJgN7x6J6MPkK+b4GSmlSN1ufSnSlmyrTR7pkbIFD2XUrfY0C2g3
         jF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788829481; x=1789434281;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W4XdQovADM5RSeHI+/ZuPheISmstJfmeHSEtcR5uyzk=;
        b=j/CuWB24kvSFnLd1SLuvp5sWFqT8T3YroFWieZyat09b/37LxlmPzm+c6jw1MPCCXP
         WVexwiSK/VupmEuWX4Hlk8IDzm1YRWT0VQ0sXxAtT6R8+dYjt2bnvPOpxkeaEN/pvCF0
         PSltZfv8EVSyATKYon/AYj2TI0ajkqxl2SvHOOI0bIwyW1tiEcFF58jAJxwYZ5AhM8oR
         IArkqxpHszEZGccbpHlV1mg+EJ63mH7w1wyd76i+7rreeyTyr9xhbtND35K+0LXcmK/B
         emIi/sD4ShvbumzrpKVh+JZIw2fADTpQ8B75X76PQFHGlMePTaqujCBRme6yZ64MftTo
         xcLw==
X-Forwarded-Encrypted: i=1; AKwUvBxymY1n1Jn72CUn9smRXR47AMOhM5NSb0QmII3xL3Skv+vsIMcEs0HkvUCeoZJxrB7sda0n9JYPC4lNDXJqBc4=@vger.kernel.org
X-Gm-Message-State: AFuF++lPW0YGgDXdhC3flpl9biltKYReIxhNlDsSjTY9bCrmjwX5BbJo
	xykFa9KxXx3Lt0bw78P9QYPCw1YHljy+yGHa6YJolnrt0heoiU78FVtH/umsuywKPafTL2SURmb
	YpQTbG5bNfhU38c+PhsSrfPH+m+5C/uG6yJTJZ+MG
X-Gm-Gg: AYBFou0mH9bg+bJeFMjkFLHoMJHcE8g3myst551qrhhZA06toTi3ugoFycay9k5T9TC
	bTq+5gOpgy5AxLEHbVbnbreKXxU6cWOSe2wUFLbpTc9Qt5+eaK5TiJm9LqTkopc5Sw6z75kUkw5
	nB3KWVdRpp/lBkZ+wXRNRsWLVCMYfXcV2hEZdJ4ju0mHtaZctA1+9C4wO8Ry7IsJkAS3gw1NAnA
	XA26SenjqztLyk0Azfe9g11wfUGxNgaMAjXdmC0xQzr4Fa4zvcywemPoeYFsC3QGIr/CNgBNWUV
	HZSYC1nVKGNEhecThWfIMOjUHC5rEmrbTmXy+/PgKAPRc5LeXV/0XHDNmwa0BrOS2myUluudEct
	w2kqivDfO3+hIYLHBR6IJr2/bokqJ
X-Received: by 2002:a05:622a:e416:10b0:519:b82d:fe62 with SMTP id
 d75a77b69052e-530810b149cmr15210511cf.7.1788829480213; Mon, 07 Sep 2026
 18:04:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904031912.2133476-1-tweek@google.com> <b965bb62-fcc8-4517-9947-24613650f1f5@linux.dev>
 <CA+zpnLc-WAqE9rA0PsjvOFe_YCZOdVj9YAzuayGXx0nhpqtw7g@mail.gmail.com> <534e5a3b-5160-4619-8b2e-27a81783e17f@linux.dev>
In-Reply-To: <534e5a3b-5160-4619-8b2e-27a81783e17f@linux.dev>
From: =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>
Date: Tue, 8 Sep 2026 11:04:21 +1000
X-Gm-Features: AcwNN1VZYaBih0XkaS7qOeRNbkcxHADyZeWVg_y6k7B5EJaVTTRllbZ02cIFTKY
Message-ID: <CA+zpnLeiZrmvNeatnbA1RSRUVFswXBsJc1S0=mZS6cF_g1UbSg@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] selftests/bpf: Move verifier failure tests
 out of test_global_percpu_data
To: Leon Hwang <leon.hwang@linux.dev>
Cc: Quentin Monnet <qmo@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Sid Nayyar <sidnayyar@google.com>, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 1:24=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> wr=
ote:
>
> On 2026/9/7 13:46, Thi=C3=A9baud Weksteen wrote:
> > On Fri, Sep 4, 2026 at 4:07=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev=
> wrote:
> >>
> >> On 4/9/26 11:19, Thi=C3=A9baud Weksteen wrote:
> >>> Commit 4c9241bd731a ("selftests/bpf: Add tests to verify global percp=
u
> >>> data") added test_global_percpu_data.c to LSKELS_EXTRA. Later, in com=
mit
> >>> 1ed2294b31fc ("selftests/bpf: Test verifier log for global percpu dat=
a")
> >>> two verifier failure tests were added (verifier_strncmp and
> >>> verifier_snprintf), both marked as non-autoload (SEC("?kprobe")).
> >>>
> >>> When bpftool generates light skeletons, non-autoloaded programs are
> >>> skipped during loading, causing the loader program to store subsequen=
t
> >>> program FDs into incorrect skeleton struct fields (e.g. dump_percpu_d=
ata's
> >>> FD was stored into verifier_strncmp's descriptor).
> >>
> >> IIUC, patch 2 will fix the issue totally.
> >>
> >> Better to add a subtest to verify both the issue and the fix?
> >
> > Thanks for the review. That's right, patch 2 will fix the issue:
> > bpftool will fail to build any program that is set up that way. That's
> > why patch 1 is necessary; otherwise, the existing test would fail.
> >
> > Just checking your suggestion: what I can do is add a new test to make
> > sure that dump_percpu_data is set up as expected (fd > 0). I can write
> > a new test_global_percpu_data_iter_lskel, that is similar to
> > test_global_percpu_data_iter, but for lskel?
> >
> > I can also write a test to ensure that bpftool fails when light
> > skeletons are set up with autoload=3Dfalse?
> >
>
> imo, the rejection of autoload=3Dfalse prog when generating light skeleto=
n
> is not friendly for users. Users should not care about mixing
> autoload=3Dfalse progs with autoload=3Dtrue progs, even for light skeleto=
ns.
>
> The users-friendly way is to skip those autoload=3Dfalse progs when
> generating light skeletons.

Good point. I agree. I'll send a patch with this approach instead. Thanks.
