Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795203320;
	b=ghc9cs8msm/7orFDQY68BpisQtKABKZZtzzNo/NGlBzRuYD4AEH4gqmvSoe6ciO/pP4q
	 Z4EH5SWNKiTb8yZJiSvA6Ib3sMCZfWriN1YzeFTxvzAYHQQE9mgiujlX5yepUjg5whqu8
	 +SYqS2aGL8Babp/A0QM1ZK+5YBp/AP07Xu0hs5oRtpA/sK+8QmB9SMruf/H/pgE1STev4
	 6zzwW/zVnEyeNZg2ZYQoW/2xLtNuhli7P+o1BzlyMZC799ciptLX1wSKOpYSwou7lJJES
	 T/aw1JFp+YhBpLbVQDREUcZtewTE2BDrmS6pHuJ5ujeNJ1hwPj9CIfVn9KPiOH/65xg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rVJmHutVQZugQ3dWxOPlJ+2HDsz3aYGVNDsjIuC8ZbE=;
	b=ZmwBJ7VgsqpdhDVo3A53/HTVGv0dox6GEc4gj5husiE69IRImaOJ3QQRG9fmg1I7i+4n
	 YkACFnlcx0JYLJPpYoDoJshBkIUEvSIqMu2eRINzSN4Dv3IyeSm5TgiElBN/81TjGLD8R
	 cBxL+IHdcFjvquPV0h5FzS5nV8+i9KI8LmfvBfvevKMqFyJ9bMMs00yl5ocJgOvxgqZMd
	 0rCGYcH/yUcm6MXHPNJAGfVYZXMZXECsESfD6y24/INVX+VliMrtNZv9U7lhRXHNR1iG4
	 Ok/uxmg2L295PvGz/JfFund0R0AGcLAJ9jE7AufvCxCp5SXiGNCaIs8fYShoWZDmY/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mEayzNdI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C17260A2611
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 19:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C17260A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mEayzNdI
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so499012066b.1
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 11:35:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795203317; cv=none;
        d=google.com; s=arc-20260327;
        b=JSas7IoEZ1a+V3h29Jv+Z8fYd5um2azwnB4fiRRRvuk6t2PGZT9Sq6iwmTaYpnxbZI
         SoQeGFXIhPoqp0qYNEDh2XwJSA+zQdVIGLzncE0Y3iSDyXJ7O7SYEuZNfF7oL7Az1lyE
         2ia9YWQYLpWfgrB2VCFMx9vzVVkekjH9Q39A2kXAp61wfjvPFkqrval+xwr20TxWYYoC
         5QAt0DATCG1MqonMpHyvyv7FD7MJiIjMAvLKUcIVNuwmPj3ATjCVt81PfJ+vpQctQDUp
         2KcHUXeZF3JOXkj90yBIihcNfFtd9IU+2kg0drVFdNw82aw7CBBfp3RBjInrQ8e5rwH8
         6jnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rVJmHutVQZugQ3dWxOPlJ+2HDsz3aYGVNDsjIuC8ZbE=;
        fh=DkWkHMgSoFvtZrrgmk66l0TH8f47ZQ2EBVpy7v/yk9w=;
        b=FHdRrz6jUP6qiJlVdue1qLsA42cKlEqItIBMIsRjWxKkaf85QvWEVqaN7HUNvQnYat
         cHqUSscbCn7A9kkSfo53p6CL7u4m9FEAH1l5ZDiSXPHCWj4uaNiLUKGNLB72W641N6Qa
         MECO0QPZCX/4QbmGQOEATwmN027KOqbBZ45W19S/Hja01Ry0hhyv5u+jv4BoBgFg5Vw+
         sOaJIQuMXSQMutw1iH77mwPYAM8stXqi41fgLNHZH9JcN72cIwuZ+eUec8hp0LWcD4KV
         Tw8GBPMN5Bbi2FIQjNNLdwrLGgo/RCGwMp12qZZJDWdD2DobjHAtuwKJxR1KqNTOn31b
         yjlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795203317; x=1795808117; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rVJmHutVQZugQ3dWxOPlJ+2HDsz3aYGVNDsjIuC8ZbE=;
        b=mEayzNdI3RbBXowLZsBRN9QL9E85SiUM+2Zma239sU2Kh5ksSQzTSY0ziLpiHV59CM
         7SYo/SGHf9f/BuaQcw7L2iv8PrZbptbwejj5saAaosdugF+c/B6mu2N2VcFs3P0J30Xs
         iJONriwUSnCKSsvV3YNuTBiMdGh2ko87iKPSXKaspCKEn8Eg4sIKq9PASEMF25S3rqL+
         ikrtvub/lopTx+V9oIV7ULiuNbYeJREQZANEFrs6J/Ra/Ji6BEJHH9f6CAD3wgAgK2ZV
         tPPXZ4d3w3MMsU/kZaH+NVG54K7lHkycb/em4YaaXq8r36ZApv2ERWimswbtCLQ2nAOA
         NkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203317; x=1795808117;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rVJmHutVQZugQ3dWxOPlJ+2HDsz3aYGVNDsjIuC8ZbE=;
        b=NHNXHsIAcnqEMkq116xfzQCIPZ+xJuox3Ehx3qCkOB7YvgV506SHNcUAHauPnSM+6q
         bzoPF/hnpmrOpbNy9rgU5t2dFKR05opdupKF2ulBJDeF3Hv8X26Q+soXI30vLTYoSaFi
         rpmvOtsnKseVs8lhPX91NEL50Z3h+wCcEw3JVQX7oajFVXDpYG6VYi/PIM+P6P5t5I4I
         w42H9Elu1Yzvzhvt/r7lpGPd4dua7dsx3NAvrK1utv6lTVt+zkSCkw7knxfVWVarecc0
         BOLAyZ3ZhFGL5oN+lKHrVrCx0L5/O2MhzgYsyIEOPccdSzZAQ1OlzjlbHY5U/FMJxFHq
         JGBA==
X-Forwarded-Encrypted: i=1; AL+hErGW6bWUDmjWYMU57XNIlNQRZF4Owqy4eCiTRLY4nspFrlKTMHxXdZ9WJ6f6W0JQRlgOHI228/l2NCUFYCECSuU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hxIPOUPwqxKLDgp+mPA19//5zoLoCjvMaj1+CirX0/mu2mi23
	ui3/AnqlbUOS/bElraVeh9nBc877KUvJQAYOPaGJMYwbCWHx28SI3wrQMhtTryOUHckj6C5bL2W
	bhP8kPyCoBKaq9YqmFAFpOS78qbE/YTHA29gJJ7qQ
X-Gm-Gg: AZFdTZfbSgJxdvBW/cRA3Gb0+tMSfkiP60IGTCdoqCp6ePBL4Po2YUKmJ3Nazh5cli5
	/BDRkhKuOdu9I0wtCciFkzJD0q587YRTa961GfP8h7zV1FZ+L2qgfmH4+lRzEBBGc8tofaQRIWt
	+Xi4K6AEklb+DcEzVHmi46CLUk/94ZjRHvWcdb+xIOcor+SR9qlmXwUkbYBzpLp+j0Yxm8xE8WP
	oXPqjRNUJQrYCzBEIMN9BLpV3FhcSOcf7RUv6JIUnIJIasaKIFFZMiyuOf2hVS61RXnLXYX2NvL
	th1nXyPksXNH/SSxv4n72AXydpPd0vN9KJYiN7RiX2aMayBbXuEEqiGpO+xfJnv1y3kiRYB47SP
	9G4sKkngByubpG0R3Mo7ROFpvQTnzICElcnupB17bwvXDT1SaPJ4Czc78vB0d2Klk3pYB
X-Received: by 2002:a17:907:60ce:b0:c25:5159:6a25 with SMTP id
 a640c23a62f3a-c51317e322amr590730366b.6.1795203316417; Fri, 20 Nov 2026
 11:35:16 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com>
 <20261113221248.3535369-12-wusamuel@google.com> <20261120-antitoxisch-flott-sense-8c2a09fc9679@brauner>
In-Reply-To: <20261120-antitoxisch-flott-sense-8c2a09fc9679@brauner>
From: Samuel Wu <wusamuel@google.com>
Date: Fri, 20 Nov 2026 11:35:05 -0800
X-Gm-Features: Aa3M54pZ23SffgU83N8qfNlS7foyPp12zk6Rc2qBKf5ucMmFiR6202xmw20UsI0
Message-ID: <CAG2Kctri9R6b-_OiKcsabdBmLdeWGVY_zmpqqFgDHLKKCDDezA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 1/9] Documentation: ioctl-number: Add
 PROCFS_IOCTL_MAGIC range 0x10-0x11
To: Christian Brauner <brauner@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	David Laight <david.laight.linux@gmail.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 2:23=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Fri, Nov 13, 2026 at 02:12:46PM -0800, Samuel Wu wrote:
> > +'f'   10-11  linux/fs.h                                               =
 conflict! procfs ioctls (PROCFS_IOCTL_MAGIC)
>
> Those are PAGEMAP_SCAN (16) and PROCMAP_QUERY (17) which are already
> in the tree. The two ioctls this series adds are 48 and 49, i.e.,
> 'f' 30-31, and they aren't registered here at all. Please add them as
> well.

Patch 1/9 here only backfills the existing PAGEMAP_SCAN (16) and
PROCMAP_QUERY (17) entries. 'f' 30-31 for 48 and 49 are respectively
in patches 3/9 and 4/9, where their functionalities are added.

Patch 1/9 is standalone, so it can be picked up independently (or I
can resend it separately).

Thanks!
Sam
