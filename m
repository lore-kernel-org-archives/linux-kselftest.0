Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872C9446C19
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 21:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792099601; cv=pass; b=cPPrCmBtJgXBaErr25jgmoNJoLoMmVWEIDP58cFHMHheYl4/DXBmwDG1/henKzvRlXsLDBUyAfymLQY11ZDZqMeIpk9jopBd88wEshzDbYuSoJxvBZWd7fQQkuPn6Eq4tdE8fXL9sndAo6cpo7mW/LaLlaiBmrxrALXpbJJd2CI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792099601; c=relaxed/simple;
	bh=S24dOVcDoMu01ibSOw1+bNFyN8uZ1WIV5X5lG+8sUTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ttcNj5MKmK9ioM+ErZyGhu6/6/7pjgwvPFo3IMP+c18/j1a3Y5OO/kuzFejVG9tinsiOjx9c6lK9+f0XTwowo6kd6o7ch0l0Uidrjy6/CYpX/BW1jWY6a4lE2jqnwVkaHPjQnkKIuGoq11HS/PTYQ2d8paaWkTVEXLT+PD8Ju1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oKrckloV; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oKrckloV"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-533202fe429so105591cf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 14:26:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792099598; cv=none;
        d=google.com; s=arc-20260327;
        b=bz28pUnh2DXa/RZ++jM6NFPK0CtIVcJ6Lrrj+lWyGEii7sLLBsyCBAFOsZ3sZsaPAN
         Yad5H99AeI//kBQe4JQVFL1/nhp3bYA9YBwpHGez5vNNVk1KHAcVnD7PqNfNsmFxQYSt
         TlsPQ/w7fTTr5o/5uOkHiSmr/JBccoDT+uqK0RwtUEyo7EIe0vsKiqpA9dI9TIF4sC3q
         7TxUXssZfP3bHbL9KdBP89HFgJGDo4FzdKX7Gd+yKkjIZKef9dh9AIulL2S/ZRBHu+M+
         /1Wh5eiwuyJksI1+yMnSCY+L5ugS3BgQu43KWpMt6W0IQVl+BKdwRFEUDIaqfCXRBFpL
         0KxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OgcgdziUoCAQVTSOyr0xkG5j6Rc5FznnZ78bB8A0JZM=;
        fh=LMJsKRRshrT9n2R7ortRKhCxGS9KyC5H53r0oglu9qg=;
        b=jjqQHnIFFEuywbbSp5IcH/PPUxb1rYMNSYk/rt329wcv3ADAoJKMZIhxzVA5MVJQyU
         VbNTQw/Oj42tnaF4MEL8wqiF4oILO2Z2rXQ1cciV+Lnyyt8dHXAfYJ4FLrq6jsFo1vlv
         o9+l6k/tuSGH5FtVgReA0Dajp9oRT6uivPLAe06k2gyRxlW7RCvy2P9cx3fc9OHU7swR
         Z80jfaoF9LB0ETY3TBnolTTviImkQQ7Jfs0KGRZmqLAMPYeNQy7lIchRaNkYzcSRK6Pa
         LpgezFdwV+anQksxJAP+K0QM2C1yMu+0vqO1qxWaOgB6trR2Wsbi4voltjWK65iAjXSH
         GoZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792099598; x=1792704398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OgcgdziUoCAQVTSOyr0xkG5j6Rc5FznnZ78bB8A0JZM=;
        b=oKrckloVPBkqU275fV0Dp0vswVpn9xI3pbBF0luDu5tSShg5dkG2YFZkgn8FRW6zce
         SC6ce0/U2RwBMT7UdzqImKj7Zwk5S0nhq6OPLHt7tgXeMAaz7CD4ePFHyCr43fJxXA0Y
         2jw5Oyrx7g+KPlc3TkA9w3oG2VFtEizziz3jHzVGNBWpDorHwNjHlbHymuYcu8CVQyzI
         mvaz+FJ/xCsHJnZ4uSZEhOWijfOu6wwnL3wJ1s+dxyrL6peIWJod70X2U1Wzemtm1L0N
         CFqg8wwGGvxXUvAYmKzgnxuDknpyeEjx5L1091lujDB82PDgTH1VZb4IgR3IDFsb64PI
         K/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792099598; x=1792704398;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OgcgdziUoCAQVTSOyr0xkG5j6Rc5FznnZ78bB8A0JZM=;
        b=iBW3VUqKgf/+XVSp7MFUw3ztlJhWpQOjH/bBE15I5oIMHvA2S/a5euY39wZGDPa3JH
         +FrHAmS0cs6hWeeiWa2UECvL59ladFMR+3Vg0P+p4Xwr40VCfMknCX8MhXGouVvgiOLm
         ImvvWKy6VmL5Kq5WsckXt3UXDOpNVERTfrAx9eoZtbdPRD1/5kCPhTBAWf0gLLp32QbD
         3PxNyaJv2zfPhffNv5q3AtIzyGIZTIVsiuFYzCJWpeYXmq1A9KZvW7dXVAFPru/rL/p0
         smgJY+NHsGxSwoxtz/CcLv0WJPvbVy03fNKjdQ4YBMx9N8QyMfVLcjhtGHSfWiprGJ7R
         Y+Rg==
X-Forwarded-Encrypted: i=1; AKwUvBzwUR+3OWnEpdzcCas7IuTzQq9xDdPIjf/Lorc3AwhS8zh9xio1qzUgz9QVlyS5N1MQV3jWDssX4o5SIrxCGTY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXFd+4wTel3ab2jUfASCmNKy+nekhkOVvCVXgrM0yGJZqI/63d
	lscyrPPK+Nxiww9AdXxjaSYcyjP+8LFguvalFC3GQLBxWuOmUboWdj3UnG+myhbYhyuarKfxOAh
	5jI8OfBF3RNx7BT33L1xvV+KNfjTqUwNr4ddR4068
X-Gm-Gg: AYBFou3Kf/JBtWnIAcXjcFj/LRt1UveNvMdjEIr/oUowh0a0FSMxeTBKQpBo9WycLmw
	TMSKLNRRbbT+HVjU0z8DGN8NeGaNJv/DGSA637XZox3A3NOTN1OPZREUCh1AQ3g16QX2pQNKEV0
	ETToRzakY88pikQRcmmQG5o+5FNYCPyN5+WPRTXx1CZKWDg0aTQK0YjfexYJkMTSzdXUk3aQpj6
	AHG4ubzyzx8jqX08oElC7vVnLECLkYrdc2dkyxwB5iCmQWZaoUC0qn4kPudUdxfddYgBiaeLc0F
	Aule0qVVpgO3rPqkIzx1xQpmj+HCYxv/JRQOf+5+qz+KvhaECagKyw97xaL6SKsQJRlbo7NxigO
	eh3S7S0zxGA==
X-Received: by 2002:a05:622a:580a:b0:535:cee9:78ee with SMTP id
 d75a77b69052e-5362b4d91b9mr2154821cf.15.1792099597789; Thu, 15 Oct 2026
 14:26:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011233647.2454648-1-sashal@kernel.org> <20261011233647.2454648-4-sashal@kernel.org>
 <CAP-5=fWFY-tpJz2vcBZvurwdZY5gwd8cuTemE9q1rtZ0Vi0dng@mail.gmail.com>
 <20261013170854.647305-1-sashal@kernel.org> <as6SxXELnoIJenIX@x2> <atEo6aIQbgww4G0y@laps>
In-Reply-To: <atEo6aIQbgww4G0y@laps>
From: Ian Rogers <irogers@google.com>
Date: Thu, 15 Oct 2026 14:26:26 -0700
X-Gm-Features: AclHuK-FmTfmnNngMCTHGyBJ-W37rLbDe_VKRvUNDuHeCzq-aOwVNF9WYcEKmR8
Message-ID: <CAP-5=fVq9rpDm2v8EjrQBVz6aV7SLaYzAwncQBwut0QDnFJ-kA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/6] tools: build perf in tools_build
To: Sasha Levin <sashal@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, 
	Namhyung Kim <namhyung@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	linux-kbuild@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 12:26=E2=80=AFPM Sasha Levin <sashal@kernel.org> wr=
ote:
>
> On Tue, Oct 13, 2026 at 05:21:25PM -0300, Arnaldo Carvalho de Melo wrote:
> >Why is that difficult to run:
> >
> >make -C tools/perf install-build-deps
> >
> >To do a recommended perf build deps install?
> >
> >That would be useful as it is what we expect users to do.
>
> That's what users do, but it wants to install packages.
>
> We need a path for unprivileged builds on bots and CI machines that can't
> install packages, and many of those builds are cross builds, where perf n=
eeds
> the target's libelf and libtraceevent rather than the host's.
>
> >If that is too difficult, for some reason, there is a minimal build in
> >tools/perf/tests/make, that is tested since forever:
> >
> ># all the NO_* variable combined
> >make_minimal        :=3D NO_PYTHON_MODULE=3D1
> >make_minimal        +=3D NO_DEMANGLE=3D1 NO_LIBELF=3D1 NO_BACKTRACE=3D1
> >make_minimal        +=3D NO_LIBNUMA=3D1 NO_LIBBIONIC=3D1 NO_LIBDW=3D1
> >make_minimal        +=3D NO_LIBBPF=3D1
> >make_minimal        +=3D NO_SDT=3D1 NO_JVMTI=3D1 NO_LIBZSTD=3D1
> >make_minimal        +=3D NO_CAPSTONE=3D1
>
> I tried make_minimal on perf-tools-next. It still requires libtraceevent,=
 so an
> arm64 cross build without the arm64 libtraceevent installed stops at that
> check. With NO_LIBTRACEEVENT=3D1 added, it then fails building the Rust t=
est
> workload. Natively it still enables aio, libLLVM, libslang, libtraceevent=
,
> lzma, zlib and Rust when they are installed, so the result depends on the
> machine.
>
> I'd like to go with Ian's suggestion then: a MINIMAL=3D1 knob in perf tha=
t turns
> off every optional feature, which tests/make can use for make_minimal as =
well.

I can put a patch together for that. Just for discussion, I did do
some work to break perf dependencies with libraries using dlopen/dlsym
like:
https://lore.kernel.org/linux-perf-users/20260130233439.647447-1-irogers@go=
ogle.com/
An area of controbversy with this approach is that it is still nice to
use the header files for the library as library authors are bad and
will do things like change function APIs over time. If the build uses
the header files, why use dlopen when you can just link against the
library? I could imagine using dlopen/dlsym for libtraceevent, but it
would end up repeating this header file and library argument.

Thanks,
Ian

> --
> Thanks,
> Sasha
