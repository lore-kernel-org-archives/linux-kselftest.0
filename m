Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B12367B8B
	for <linux-kselftest@vger.kernel.org>; Thu,  6 Aug 2026 21:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786050253; cv=none; b=D9yxHMBymib1tov1fBVueQywhmC6lgyEqowrNgrY1X/Yp2KMGCiWgXEZs6HTpMfphbcCGDqxN/QuLJaOG0mpW6H/j+IKb1Flt4PqT+F3mddD30xSkOlTmcOFEQsyjNkr4BZcdjtBeOTn0ibRvlCx2zddfbO2o6K3ATOT4P5pjig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786050253; c=relaxed/simple;
	bh=CB+1xLwkkPoMj/WAzAO07A4vIbrEbMrz7Buj6Ol1Qug=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Kq+wPaf0/XvKaCCeenDqPLKHvw9Z9fM+5SDeU8kMoTk6lygiSTHxRfTryAh73xrJ8cq1oyvaUU9KYxROOxL34LDc2KxUZf24TJIHEayiMkt8aoyvOV2zcF85FpnmjIpNHTPhvk4Rk3/70YpT/H7iB0zVmljlvzXG7h50lMxYF1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=tRVDdd6m; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="tRVDdd6m"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6ae8445b7b6so1055442eaf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 06 Aug 2026 14:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786050251; x=1786655051;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=329wR/WnuEQZ6JzXMvX+Qs//qFHiPpx3GlVTxWmXXsc=;
        b=HYcVQPY8qDDOs2dHmU1QjB7cm9xXXrYYC5gSDXaPyas/t6JWrdtxSPsj8EEmPyyPyX
         95yXcXtV/w05FE+FIcZZ4AiqttqW5aElcpYig1v1U9UIKzW6VHtAbj5OSXzX01bnycG2
         SB3xOduf05t4cYMx+jyX6HvE1X9VbMuj8sfvCjS3ETahwBwNRTxc9e2dFVgXDZTE28Ts
         KuFMHN47O1WFBWbAc5UZQ6aCD0y6jmjZ3N34IRPfkRcP2I0xoyjN5X+r7ztlxMRJ24Vv
         n/zjgt3hWR+8reguek3kISFHzrGU/Dy+l51as8wQQItfuD85NE1EjNgjQxb3euLas4ci
         TyAQ==
X-Forwarded-Encrypted: i=1; AHgh+RrECzZ3cSaeRgRry26NnUmr6BraRJVU7fWZpLoC6CYP3WaLk8TYkTsxR7zrEDly9S6lYcoYU4EdX73dcpidWJg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJYDZAn3szw/Bma3it0L/hmR1gZZUGp7Put6zultwrluj35g2F
	nqmOTY4NcI4jCaNVrF8/LT49MrAi5WmX5Ml9Z4LPP0Dr/6LoS43lkpzn
X-Gm-Gg: AR+sD117Fh0w0qaYDSHHrBmbi/TqULC15FaeBZ9BQsgS9jcsk41ApMl12LobAp3bpRG
	FtSRBNFBVaocK8w5BahnMKtE4bZg0wfUjJRCnooDVzuJScTokOAKW4HUYjeL36zyeSu6IRSN5QA
	eX2+Y1zeHNmDE3M/X2Mr37piHIpsY8tNrkJxsFXi5DJ5KMNirmF1+C/9yj6zF+E9S8OxDMDDV4M
	otr5IxTj+WtZc3bb7OBGbW+F75bPJYZBDfr5BXl+92XHhSiUtRxfKhU0Ljnuw1nUXpPbUP7ETyX
	ZG1cSQZTwY/mxoUGJ0EArbLnEyv9cVT0yfWk9+2oJtviw3GHvA8KD81GB/cZVlmklTZ348XZ7Jz
	sbeiiF09IiNie+rzrCDFJr9ZPPmT4OL+R6fMfGSem1zm2ilQpAqxkEOCkQPmdSdi2a4oSQYMeeN
	lLj9ETIHPMo0e/nCFCFyWZPT+cZ0Lxx3Zkacz12Vyfzq5Eh1w3AE7P7PaUMbxVty5Ub7AfcUCWa
	tmm5/yAQwYFHUgy48/KcsAvzbwrt5fQ3ZdE1SS58Ppx/6+hI/wKJuC8RRWR5DR13g==
X-Received: by 2002:a05:6820:1c8f:b0:6a3:8303:bca4 with SMTP id 006d021491bc7-6ae96c84e79mr8983155eaf.8.1786050250906;
        Thu, 06 Aug 2026 14:04:10 -0700 (PDT)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b02bc2631esm548489eaf.4.2026.08.06.14.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 14:04:10 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6CAE60A0A;
	Thu,  6 Aug 2026 21:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1786050248;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=329wR/WnuEQZ6JzXMvX+Qs//qFHiPpx3GlVTxWmXXsc=;
	b=tRVDdd6m6RJq221WTJ6WGp9p4qxm7aq4vKjwbkG2m6YR0+H9y6KY9KG8qiC8x0gTUeACIO
	1y88wtFA8xAgjwem3NW29Mm4+WH1WrncZW5g7K3l1OMBeA9Qa9lPNrkHPAXMKHeYVYGHla
	rSK71AQMg1JJNf27/VBQJ5WlRjjiiOziYQuFN9T2rRNZ6pDU3npL95H/mDpH8iAtUnd8Dw
	59O4HS06Q584PiSWK6X51Qi6dFIX3A/0zBhPOx1GsbhWSQQ/saVwYC+d1t4+gI3vo6YZMZ
	v7vr1t9JdE5IbpAy3YtlvD75m7IQYtU21/S+YUEGkHS1psQzV9BL3ZjcqvqQww==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Aug 2026 18:04:04 -0300
Message-Id: <DKI5YZDA23OB.3DREMYJCCQ5F8@marliere.net>
Subject: Re: [PATCH 7.1.y] selftests/bpf: Add tests for sleepable tracepoint
 programs
Cc: <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <stable@vger.kernel.org>, "Mykyta
 Yatsenko" <yatsenko@meta.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?=
 <ricardo@marliere.net>
To: "Sasha Levin" <sashal@kernel.org>, <gregkh@linuxfoundation.org>, "Alexei
 Starovoitov" <ast@kernel.org>, "Shuah Khan" <shuah@kernel.org>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?=
 <ricardo@marliere.net>
X-Mailer: aerc 0.21.0-146-g87073a0460e3-dirty
References: <20260805-selftests-bpf-sleepable-v1-1-e29fa5af4119@marliere.net> <20260806131002.stable-0003@kernel.org>
In-Reply-To: <20260806131002.stable-0003@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Aug 6, 2026 at 2:49 PM -03, Sasha Levin wrote:
> On Wed, Aug 05, 2026 at 02:54:34PM -0300, Ricardo B. Marli=C3=A8re (SUSE)=
 wrote:
>> Hi, backporting commit 23b933c6223f ("bpf: Verifier support for sleepabl=
e
>> tracepoint programs") without backporting this commit breaks the selftes=
t,
>> as seen in openSUSE CI:
>
> Agreed on the diagnosis: 23b933c6223f went into 7.1.y as a Stable-dep-of
> and changed the verifier error string without updating the expectation,
> so the verifier/sleepable.c hunk is both correct and needed there.
>
> The rest of the commit is the problem:
>
>>  .../bpf/prog_tests/sleepable_tracepoints.c         | 142 ++++++++++++++=
+++++++
>>  .../bpf/progs/test_sleepable_tracepoints.c         | 112 ++++++++++++++=
++
>>  .../bpf/progs/test_sleepable_tracepoints_fail.c    |  18 +++
>>  tools/testing/selftests/bpf/verifier/sleepable.c   |  17 ++-
>
> The three new files use SEC("tp_btf.s/..."), SEC("raw_tp.s/...") and
> SEC("tp.s/..."). 7.1.y does not carry 0cd420a6f40c7 ("libbpf: Add section
> handlers for sleepable tracepoints"), so its libbpf has no SEC_DEF entry
> for any ".s" tracepoint variant, and sec_def_matches() will not match a
> ".s" suffix against the plain "tp_btf+"/"raw_tp+"/"tp+" entries. Every
> program in the two new progs/ files then fails to load and
> test_sleepable_tracepoints__open_and_load() fails outright - so as posted
> this trades a test_verifier failure for a permanently failing test_progs
> test.
>
> The runtime pieces are missing from 7.1.y as well - 439ebd5b5708 ("bpf:
> Add sleepable support for raw tracepoint programs"), 12628ffaf98b ("bpf:
> Add bpf_prog_run_array_sleepable()") and 57918341dd19 ("bpf: Add
> sleepable support for classic tracepoint programs") - so even with the
> libbpf section handlers the functional subtests would still fail.
>
> Could you send a v2 carrying only the
> tools/testing/selftests/bpf/verifier/sleepable.c hunk, with a note in the
> commit message explaining why the new prog_tests/ and progs/ files are
> omitted?

Will do, thanks for the analysis and review.


