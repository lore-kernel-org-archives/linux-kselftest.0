Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792977449;
	b=HX3DfT6A9WVnMaH+GSgPq7qG6TXSBzfHB1j2SSD5NkU/rBCCFvW75nUO/aKOMgVgj8qC
	 6AAzRAGmOkHk6wwRbJd0sB5TC0JHn4U1Vw896IBpVrXnLcpPVRY0YRkBN7TPBQG1rj1gj
	 KMTahXEUlET/Kf8f2po+YuAXba6SaCxY/y8WSLRe18wK8jzItZXDNyDtufvFJuM2vKptZ
	 /XhpYxrq9Vu9GXfyGkdeYhLTUKW573QNATLtCU41VLynejiFYEkEWG7iXVdh898JBcOzd
	 l+BTTUVfSK6O2IxeB46aIQPOnVgAbHyRIxwCNIfNKQLQKqllWNVhVEiEIYGl5vAEK9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792977449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=3JHKNZG3E5vHMpYqgouUpuv8xtxZ/WRsL+FJ8mE54ZM=;
	b=b0w94YCdNu2/9yzR4CWp2qxmpJzIPngGHhf1va7ojEKNXtrct4c5FTwp68UswjA8KbYx
	 mNIJhG6/bCoaZeLTi78jcy2x4Sexd0tDrzKR6g7LVDqrQINAU7L5pHNJcmJnGfZLaQvx/
	 1Etq5CpyedWECJCsL37Bw4ACbVeNGaNcR0q+7rutmVc6kBdJKlYg7HfnELVHtMLzJI/OE
	 Jh0SyHtsgw8og/HAFsXzLMMZLdwxBOYrHJ6QWVBat9uOM/1o8ILzs2NOj5qnt77qqO+7J
	 TX1yDiKxcpjsqCKTkaotWfQhYzfs5x2D9/edL+5tnrY7Z51Nwx3nKoyUn6vYt6aa+tA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=BQy1fTrT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD6B606A31B
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 01:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAD6B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=BQy1fTrT
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b2232d8ef5so4224026a12.3
        for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 18:17:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792977447; cv=none;
        d=google.com; s=arc-20260327;
        b=rejs3H2f6ih2+DYv28ZcJrlPk30qnjezk2yZcMpDpyj5yJSEsT4QfCBYytZfWIe4Xl
         YKhIF2nIVZSW56x2Rtgd9WynfJRcOj7preNwMw92unklLjftjSrAgKrUlUIw4uGiynk4
         7aYxgrXt5TpwYyLYRliZq1y717KgxxI+i+1p6nfrvblhnldJ8QgWqR9pVjEDl7GXBeKL
         qx3SWt91furBTcIuKuI/i8mhAZLFOO6knAWH4yCLbV4wHxWYBoYVPmM7j+H8GiZdkKP7
         4+6UIFiUR+3VmMzlONW0uaDdiwWMlyu1ukLLGqIQkcnyX2IwWkFwFbDgA/d/Xxp0fvEU
         QPqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3JHKNZG3E5vHMpYqgouUpuv8xtxZ/WRsL+FJ8mE54ZM=;
        fh=elwkcZ+AF1w498+e23eRN0mNQmKqnKJvEUc0Su2/kDw=;
        b=mYLiY3SUoX5FDWfgRES6mzKH4cbY0fpWcaPIocOZE1rObsB51d8kERkilJSdmIDfY3
         xYqDdHPDDoRgBxxuKwjf5/7QcC9S/+9Aweo5b0LqJJbMKxhWq7hpYYPI8rTxD0eYi60t
         GVDT6yng+o2D/DriaD+Z9VuR1HG+YkB1N9SyZgkuQ8J9Uw9NeivbRcfcpGlxe+fCYWkf
         WcSY+p5TL/Xco5QjZ5rHe7rr8alxs+fWtXKX+on4S4JzEScmBLp3VDed54kEfV9yNQdV
         PdBbjTfUU0XquawEpPv+aC5FSgAfiegGQoTP8Lt8XN35E8GxQ2H2NVFNRS15LPkqtAwT
         MDrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792977447; x=1793582247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3JHKNZG3E5vHMpYqgouUpuv8xtxZ/WRsL+FJ8mE54ZM=;
        b=BQy1fTrTJ2nFZ2mZPKWUnmKNciPcXdHliwxaU3A+xn+79lW5SUCZk+0xpyi6S2ZW+v
         amstcN1WQI5TZwT2t22w4cxM7a5K2qfU9UzvWyFV93IRpdE026go4TRj5Npvggxwms6K
         WMfItGr7lhebDSt3APxTpQP3THpxyXoR6nqb7UjIUoguYLiBi0eDTCVTNRnBmj49eUlu
         6rYo7fRFMAuFjhyIVixzBbe34XVo+Mf1bZ4yqRAjkFcb0EzTpOfhhV6D/BT4oLE5aSPE
         XRvNCaALYWZxLj4hDOb6LFtIK4iUvdS+asR8hBQ0i6VLg0B2Z2yC1mP2hg7Wk0RmCGnt
         3F0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792977447; x=1793582247;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3JHKNZG3E5vHMpYqgouUpuv8xtxZ/WRsL+FJ8mE54ZM=;
        b=v/VjFsBNWNz5cDf1KYRAvDEPircdQpQBZaTz5WZZ+yZpfHvo4JyllC+z7dI08kAsVp
         pfo0EvOuQn4LSXm1c0bb0mSjcwE8ca1Q95bSax+N6k9Oox/VXh8o/67meLAp7jDV8K3+
         bImM5jRIjYRxWdDj8lNZdjKQNj2S6SoCcLmr/QKpkkSumeeN5Ba7V7C4PoDe21sDX1y9
         ZnAt/6Ix7QdJLr4Spf3bZZAkq9itGkLgriqB0IXnoMpqOs9xguwLnHbEBnO2tikx3dBC
         aNW27ymow1/8vByBw2iV+R51g3fQSZnXE6ltY633FJDChow2LG0xSkaxdbp3MIIrEldp
         jgOA==
X-Gm-Message-State: AFq9FYKWnrQP81TlilHlGSkvG3N8QhMYAY+U+Lpkh5blPGZm5GalLpMq
	x1kjC3Qumdf4fP3CeZwaBZmjChOMiZlInWHZy20TV/oaVFihG7gBe75nEvN6x2j/27P2UnSdSKy
	Pd3CU5y9LpGDwoIvuQDn1EcI9tXI/WnnHnfgGUNRB/Q==
X-Gm-Gg: AYBFou3cTqnYGhGOGRUbDz6XYKPsO5jPdjed+xCZ4J2rYQmYIJx0uDLu7zcYZQ3lgKW
	3STniJOLRC+Vj853jVGzpGZhm9uJQSjFLTqzXEOhrWgi7xBXkwBfwe+c61PiHWkXAWVeih4YF/c
	Lyl5MhOnT9YbU9RDTd/7sqejtTkj9R7dg464d3kkNi3dTI47Oek39Tk4CsQPOySrRudNy9s7Bzu
	jD1rJzvXi24uh7kp6QarZXCi2j02M1vsg0mtI1pgGsnFExjU+5fWk5sYbCTrrVqdK2XEmwV0ibV
	kTAw/z52DFfrKuYOt4VA+ZqbZF/nUiUuHng7ZdTzFLX3N1xbh23oLoOrBIqZhPEq9pY9Ec1hro6
	HTTlxeZJSyRncAWI+gMh5ZNTOtmtt8vPRAYDvJSW+gMnaPuhG8vMDXMNE2bTZFwo+T7Vx
X-Received: by 2002:a05:6402:234e:b0:6b4:31c5:bb2b with SMTP id
 4fb4d7f45d1cf-6b4430016b5mr6666492a12.41.1792977447040; Sun, 25 Oct 2026
 18:17:27 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020144710.4154339-1-pasha.tatashin@soleen.com>
 <20261020144710.4154339-3-pasha.tatashin@soleen.com> <atsM_WTjuZNl1EGG@kernel.org>
In-Reply-To: <atsM_WTjuZNl1EGG@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sun, 25 Oct 2026 21:16:50 -0400
X-Gm-Features: AclHuK98Gj1W6ZSJdFU1t2f67xVGq0_oZ919Xy4QT-Ox4HmUEuoqqii467TmLm8
Message-ID: <CA+CK2bBXCPBiZ+ek3+PiOHR_8obXkpJmJ=iqcXC4kxO23b8yuA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] selftests: liveupdate: Add tests for LIVEUPDATE_SESSION_FREEZE
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kselftest@vger.kernel.org, shuah@kernel.org, 
	akpm@linux-foundation.org, linux-mm@kvack.org, vipinsh@google.com, 
	linux-kernel@vger.kernel.org, dmatlack@google.com, kexec@lists.infradead.org, 
	pratyush@kernel.org, graf@amazon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 3:30=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Tue, Oct 20, 2026 at 10:47:04AM -0400, Pasha Tatashin wrote:
> > Provide luo_session_freeze() in the liveupdate test library and add uni=
t
> > tests in liveupdate.c covering the LIVEUPDATE_SESSION_FREEZE ioctl. The
> > tests verify that non-zero reserved bits are rejected with -EINVAL, an
> > outgoing session with preserved files can be frozen early, freezing an
> > already frozen session returns -EBUSY, and attempting to preserve an
> > additional file descriptor into a frozen session fails with -EBUSY.
>
> Please teach your LLM to use shorter paragraphs :)

For selftests, I usually let it express itself :-)))

>
> Do we need the entire list of what the test checks in the changelog?

Will fix.

>
> > Also freeze the test session early in luo_kexec_simple.c to exercise
> > LIVEUPDATE_SESSION_FREEZE across a kexec reboot, and verify that
> > attempting to freeze a retrieved incoming session returns -EINVAL.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  .../liveupdate/lib/include/libliveupdate.h    |  1 +
> >  .../selftests/liveupdate/lib/lu_utils.c       | 10 ++++
> >  .../testing/selftests/liveupdate/liveupdate.c | 49 +++++++++++++++++++
> >  .../selftests/liveupdate/luo_kexec_simple.c   |  8 +++
> >  4 files changed, 68 insertions(+)
>
> --
> Sincerely yours,
> Mike.
