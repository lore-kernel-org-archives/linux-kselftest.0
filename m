Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B98255F52
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 02:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771901007; cv=pass; b=Z7kt1lDeDT3CFQweudYjy8Ffq7Jqpsf92o3Nj+Fofp/ch4IJjgLYjvh8m0xT1Vgxh4L3tAGcWsAd5BZp2RrX7D63lLmySF4XAaiZ7eFRqW4dTwLao9Dqt939HM8qG5NSYuB9gfdH7dDCzGs0CcsSbXjlEzUbNLkuESAK/PbI0Yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771901007; c=relaxed/simple;
	bh=nXBvGOfNSt1H2LHuERmtCnhuO3EyKWr3OKWW1rux2EY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cA52imc0cBbouql3CtsdmJONTCEQxoFjYVHxPrgaobU+Kf1eEsEwLg7q9XOk1B+v3hCypE5FCZXO++5uzE0K8RPJ/WzSHmn+YZsIzUZ35jTtvOMZbeOFM1mFxPgKhEZyN+Rf/vIjyq1/ecilKFvjG0NpOBHsYJQo05TPWWEWisg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvMVMf+i; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lvMVMf+i"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7950881727cso35443887b3.3
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 18:43:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771901005; cv=none;
        d=google.com; s=arc-20240605;
        b=ZV1PAhY1kwWlbjJqgJeyPk7I0ldgMiuZUkFU048ZH590hNTzlDiHAJCQO3GTZJWWQ6
         N/XXtFnoQYPzMpopHZAsGkbV9bV+eH671/M+SITU/QToVLjSUyS3Zff8GJCEbhZ/8w/8
         hbdxvLTD7vpAJh9fE/wEhUIUM2a1+K9QoW2budbYX5sRCNZN+dmMbLiLIEeeXB2le0Wk
         cQGpdFSC+lV/0rDrBtYt4ctLFuKfHMM+K6r2Jb29q7mfTxlOH152s3KNvp3r92zcr3Lu
         841gKoenzn+b9hv2kxUalAwPQapxxo7aV6tingSMjh9FRZzU77zfyIw/QkqOcoONkZdS
         tKrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nXBvGOfNSt1H2LHuERmtCnhuO3EyKWr3OKWW1rux2EY=;
        fh=yej04bntI23TJMZq0Y82+ncZwg1IGM5vIEyjkLdJRh4=;
        b=W+nzrWPkZgt9HIYYiAnq9KXpLrTEx/vvgWeDhJ1xhlj6V9ZLLiXK0DmXuybynL8QHC
         fzr5TdYfr7ajXSh/eGZlLtu9wnDSWHBgmFRdSo7fs8p//xd+VtUWFLh5liLDHLpj7Jvu
         t1VCK+D2TswnwplpoSYsFjzPXtw/nihioKra7iW0wdM6GQIZI83xO67/aLQ8T3x11QGQ
         7nYygqVHe2Yv2C3x2pdty0BGlhxgCZKFApA4JffCnCsGHgwlk8o1HT/jDbmkPm3bE/HZ
         +HHSfRJZnH3fHts5a+LOkSVpVgEFzCIsXf/ji7jmNPqwtZJl+pqgj0HSak9IZMxPQmaR
         upuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771901005; x=1772505805; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXBvGOfNSt1H2LHuERmtCnhuO3EyKWr3OKWW1rux2EY=;
        b=lvMVMf+iOXn9Q0RB7clQPgRQy/xh10/PgI+6doPAIC2wfeAcWDrsxLNgNgIWdWIt0w
         YZ6aYiNPW5SHO2wrcPTW+NjFMisg24T8jXn7VUSTwSxulcKIV6e6t2V+rLOccQvupTJd
         yX1T22iBL7r8hYJuE+w89KkyJBeRzcuWNjpgKoZHqByxNPLRPeACIFmEStjloaG/HI2S
         rZvVeV5XIrgKWPOb5fhsaB75JCbzl5xbXkbImQKv+0JHNceg6T+6ay+5yIr6MxfHe3CT
         UP86CR3VXrFYZGabmhCPAkHumN79esDQPFQ2zvlITUE68Z/q1bPzgsR8aQD9ueDfTK9b
         HjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771901005; x=1772505805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nXBvGOfNSt1H2LHuERmtCnhuO3EyKWr3OKWW1rux2EY=;
        b=djjM1SNfbzJe53KGKw59qOwfQf0Cb5+Z3DyVu4bRqJWarX9Ja/WmlWdiE5O0yZ9xbs
         hIAe3G9FPehmcYKFxCK47RLrL61fL+E5fYdTOY4TTUZsnJSpsqbMVu3rP5KwOCVcApI4
         3pIMuISc8MXmZvnWJHTK/O8Ke4JUy7qOmxErEnGGJiQSHc5KVdVsh+/K1PgwpO0fsSdE
         6cJfuBGMRZtIGyB+oo5fI2sQSNkJA0SokpA+ZxYn668d/QupqMNr3w6gN2fT2JVokOoy
         /LcpwVv0lKR2faZwoi6AYZ+zQloiEMJkP+1tlyMO8lMGSBVwCtmVONGAcsuADl9RiKgt
         SfCw==
X-Forwarded-Encrypted: i=1; AJvYcCVEXgwR4iVpB+AvkEWOSYwbt14z8Gskfi52lQ+yOInIbIdzLrXHJwqBlUBoWzyU3t1SPfd8aEKWc3J40Nx3kjA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl9WvDdAwf4xts+tTX8NcP9tGvghgF1z6ILamk67KmGw/Y2vYN
	goKrTJNwUaV/Rv69xl9wHKMM2RzQq1J8b+hhYLpugpQsTcbppKl72Aofy/Wgi1QRt2LaTfisIRW
	j6QJuPx8FuYctd71Z3vfLwqbxlzFQOZU=
X-Gm-Gg: ATEYQzwUTRj+0ML/jtFHYcPgvNk5xb1PZaPs8fLjeDUis62Kmml0Sjv8N5PV2UCcbvK
	rNtYNIUJc5Alr29Zpeb2CnFStv4h3VnipiMkw6rC+ofDatELXPER8OWrhvorB7c70ZbVTqZXN51
	mD7Ilkn1XcB0FOVIVVGlBPLVH7CJ/3GtSy8exZnzQfwEPHyA275nKNl/MSzNs522/YCqXW0Mbro
	RT9+bhZaXAYYDN+YGPbGCivk1c/C3a8MAdIAMqttmwCsl0mqd5bV+vPDQ+MrYCTDYfOZqfHL5hD
	UPCzVoeVui3wh1E=
X-Received: by 2002:a05:690c:48c2:b0:794:6fa2:a037 with SMTP id
 00721157ae682-79828cdf910mr84748807b3.8.1771901005394; Mon, 23 Feb 2026
 18:43:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260222111847.692325-1-sun.jian.kdev@gmail.com> <20260223172214.5d8ddaa1@kernel.org>
In-Reply-To: <20260223172214.5d8ddaa1@kernel.org>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Tue, 24 Feb 2026 10:43:15 +0800
X-Gm-Features: AaiRm518ATEfeBlaofi-GL5g91T6-ZWo8gkDvecCreb5EzR1QmwNkdtp0H9CXXw
Message-ID: <CABFUUZEuMCYYfi-SapTLT1BhYOWBk1e-OYh+h9fOZcfoSP06fg@mail.gmail.com>
Subject: Re: [PATCH 1/2] selftests/harness: fix XFAIL_ADD matching when test
 metadata is not initialized
To: Jakub Kicinski <kuba@kernel.org>
Cc: shuah@kernel.org, linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, edumazet@google.com, horms@kernel.org, kees@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 9:22=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Sun, 22 Feb 2026 19:18:46 +0800 Sun Jian wrote:
> > XFAIL_ADD() registers expected failures using constructor order, but th=
e
> > associated struct __test_metadata pointer may not be initialized yet.
> > As a result, xfail entries can end up with a NULL test pointer and neve=
r
> > match at runtime, causing expected failures to be reported as FAIL.
> >
> > Store the test case name in the xfail entry and fall back to name-based
> > matching when the test pointer is unavailable, while keeping the origin=
al
> > pointer-based matching for compatibility.
>
> This looks a bit inelegant, what compiler is this failing on for you?

Hi Jakub,

I hit this with clang + lld (LLVM=3D1) in a virtme-ng based net selftests r=
un.
In that setup the XFAIL_ADD() constructor runs before the corresponding
_*_test_object is initialized, so xfail->test ends up NULL and we never
classify XFAIL/XPASS.

> Constructors seem to have a concept of priority so if we have to,
> we should probably used those for the fix.

I considered constructor priorities, but I'd prefer to avoid relying on
toolchain/linker specific init ordering here. (The harness is userspace
and we already see different behavior with clang/lld.)

If you prefer a cleaner approach, I can rework this to avoid adding any
new field and avoid priorities: keep xfail->test as a cached pointer, but
populate it lazily at runtime on first use by looking up the test metadata
by name within the fixture=E2=80=99s test list, then do the original pointe=
r match.
That removes the dependency on constructor ordering and keeps the matching
semantics pointer-based after the first lookup.

Let me know if that direction sounds better and I'll send a v2.

Thanks,
sun jian
