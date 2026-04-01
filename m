Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887FB47B425
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 17:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775062865; cv=pass; b=UtqKNRTWk1V0CnLiyPXc/ooy4r8PPfxveEj0rOB5wkck0zQvE9uKavh7RbkLI0TC+BpKf6qv2uwf8ogkG46iltd6BOLyd4OVD8gqOAEEv5XJHr3cAmtiPRdXJEA/Pxq0CPxEbvmB4JegMN4/7JzsyeinIPDZL1CsJQVIgOQlbBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775062865; c=relaxed/simple;
	bh=HMh3BmfgmzdgimyYYoM6Rn1fwSBCsNHDQSYfQwRc9+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TSLPY/4i420mjYtG5ubgXwajQe+54vSkBGdj7vNjIJdJx3vUZKgcbF1LtfwTEoqJB9vezaNj9C7EbOsDhLoyFnvHAwhhzagpj4oVYwCztVkvc7Ay2eMEDDQv6SU3Mhq8onfZPK7qOQ8j4hgaYOx6DnAE51So1UgJtANuBlinIes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dvQBlLs+; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dvQBlLs+"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-66ba6d3dab3so349a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 10:01:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775062862; cv=none;
        d=google.com; s=arc-20240605;
        b=axTGmFKButTEw+ay0dCs5W/mJN0XGl0N9PcjQZS/s7GsyoO6f06GXoIedN7sjDIi8a
         rXQRRvdtTXcD2EUfPT8OpVlewhAeXxIRhaBg9PHZTeMp7ok6HOMNnJqcP1TLbhPFCQbq
         mP6k91DV8XXZuaZfOuZg3gvpDjCQk0GIXxrXWHT6T24W6/mKOODdzQUffH3MhbNJRePg
         H/aAkFKXC+DZVm8nvGzPWqAQhfs+3CWtZ21FzEZaGrJFptZ7jqRSw6hYvw5zvhSE7cNb
         4QtbO2RvcoT6N/HKpJ/j2lsbc5Yu/ehlurEQZ+9EM5S+Qy2ZDEsaTNKaH4biKz6J1MVu
         vKJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HMh3BmfgmzdgimyYYoM6Rn1fwSBCsNHDQSYfQwRc9+E=;
        fh=2gDJ1i98XeJVw87MP41PWH/q5eAtOVCnwxg7hfMlyBk=;
        b=c09TpPjfJKT2X2H8ct5W8USSNeBqTiRXbGwJzygTDWeHA6eoVyDw47dnOI/geV/juk
         4O640mR6Aw3ccaxGE+ftB0Ud4ajlLz6i7Z0xWPXmdYJI+10XAczoAVVEiyYKWxKBLYCC
         tM2oYwjVQ05AqiVDwlIsk9aW622/NSxWYptXiUp89vNVMbc/UXSZAy+ZNnyuJ7ufXczK
         JhPAlUpDI5PDxK8y16HwqT4RdmT+xJbnSB2eS6wAxS71QHbxsm/nA/nRVFLxHzItqO8c
         Zt1JUhgasoQ8+LMlTw3QqOEJRk86y+23mJcjFvruTzuJmpmFZ3PeXSHcieMYFrH1EFmr
         eqUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775062862; x=1775667662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMh3BmfgmzdgimyYYoM6Rn1fwSBCsNHDQSYfQwRc9+E=;
        b=dvQBlLs+a1mlA59kQDDucXKd+evLi5uR8v4xBe8WJq5qqx4RWVaooOo8k8aXcsdAG3
         AO+2DMisWBw3GMYfVttTj+g/8McDxDEPxRuF/Jn+CQzHi4BxW5/YgVWKKBEIKhVx+Ays
         4L7HDUptNlUzZKOQG82sLxYB5Q7Nqk9APNG69mhUqmWONdphMBSkJwSadgq1wS3SVkbo
         UDamTJvFLnYBZxCE4/nm3tLTPhNypdVgtECr39Kz8y0Wy8pTWEP+3uMJMLcUJJnfH3F/
         GJ/USZAiY1Mg7oRme75r6nkSrqdMxgbz983QnSVPIRsXtNYYnRe622je61whaDF5qe4M
         /XLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775062862; x=1775667662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HMh3BmfgmzdgimyYYoM6Rn1fwSBCsNHDQSYfQwRc9+E=;
        b=Pty85TrWiz5o01mBrDiZR13UpkUgKc5AA19lwltcD/rEsuD1H5QxFdwyw9n+tncVA4
         JrpovO68QJUo8ypNBJYbHT+flC7tkNGFx6aoTlpK+5GuOUAH1eWk/cwUOaYIrlc7FZZm
         T8uV8ga/9Cb+54xiMxJfk9SFg2eSLmaLdrZO9yIQHjVyloVNCFnC0WqY6Q4rWTUbhU4j
         nSOlCyPbTbY/pVuYS1YuRGIlWmwnm476jjxSoSeWmQUsRqGkdcnC6tudRnhJVXwBITbo
         5k5KY/ZDcqvQ7CR4/L40G+4ogJPSNyfz6VpQFagwi9S1Huj+BxEBN8LehE8DjTcSVsqn
         hkeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVucxpk3uSIDR5eW80dirL7FjaqTs/pRZfkpfj2JwBlFg3snJd1u/ni6NzG6GSxrnR8WXh2PfYU43qq/UHRKdk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG03Vou+DXqSy2Mu7K5wZhFPyseWpLSt6clts3IE8Hekdh57fX
	JJQ7FIEjhXqHWDz/a6qfy4u6Id/BuC2S3xd+uwICq7jeSkgTsH6khWfxkthgcmkCFV0m2CX8JeE
	MbbsdRYig3OQ3qZop6UF3JrsCL3jmoa6ojfnU2GkE7b28B//BNFs4aemQ
X-Gm-Gg: ATEYQzw+L9BSm+fto6JDdTzXknpTzV/eLQj/ZYuortvbBpKGm7MtVxc0xxlq2gA1LTv
	29C3jZ0mCCwPXbB7GW99PeHajMXzwdt1Y7Ujdcg2BYfOwvm62iOvCZVOx4lNQbB1LSdgUZU3po0
	xjNLL2YmRj8vwem05PuEn6jzEyT9YrOkBVjiK8X8puDzL3MCWEpWkDV51f4GYW75NE0NWu8vyVC
	TWNnDgKk2XzyYV399Ecgk2GC/e4sMjP55k7qQlAXRz/al0fEqF76o8wwwpW/V+wf8958tyn11Q9
	Gk/+09ulsEhqZxQ24fmIGq8NUFMneqLZsWCasVvXdhwZQ3x/duifcOBduoWlOZYuANtVpg==
X-Received: by 2002:aa7:c58b:0:b0:66b:eb42:be7 with SMTP id
 4fb4d7f45d1cf-66e033bcbe5mr2565a12.13.1775062861460; Wed, 01 Apr 2026
 10:01:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401-teaming-driver-internal-v2-0-f80c1291727b@google.com> <20260401075720.7976a1da@kernel.org>
In-Reply-To: <20260401075720.7976a1da@kernel.org>
From: Marc Harvey <marcharvey@google.com>
Date: Wed, 1 Apr 2026 10:00:50 -0700
X-Gm-Features: AQROBzBsblDbpWXSnvlD0rrlndtlTFYB_FDROw_4NMEeJP_41nBpXwToL4b7S54
Message-ID: <CANkEMg=sCEMGdyL5qOU-nSGCk2Tartiqvk1yQkg+3PMm46VdaQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 0/7] Decouple receive and transmit enablement
 in team driver
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 7:57=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Wed, 01 Apr 2026 06:05:24 +0000 Marc Harvey wrote:
> > Allow independent control over receive and transmit enablement states
> > for aggregated ports in the team driver.
> >
> > The motivation is that IEE 802.3ad LACP "independent control" can't
> > be implemented for the team driver currently. This was added to the
> > bonding driver in commit 240fd405528b ("bonding: Add independent
> > control state machine").
> >
> > This series also has a few patches that add tests to show that the old
> > coupled enablement still works and that the new decoupled enablement
> > works as intended (4, 5, and 7).
> >
> > There are three patches with small fixes as well, with the goal of
> > making the final decouplement patch clearer (1, 2, and 3).
>
> Closer but the activebackup test times out (45sec is the default ksft
> timeout, I think). How long does it take when you run it?

Very strange, for me the script finishes in seconds (even with the
netdev CI recreation steps). It seems like the teardown, specifically
the graceful killing the teamd daemon, is timing out in your
environment. I don't think we need a graceful teardown, so I can just
replace this with pkill in v3.
