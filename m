Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486CD32572F
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Apr 2026 06:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775802993; cv=pass; b=qt9N0m2M1XZaczz3Q/zpaCyzVtohH8iXmmqDJ1a6gOUrSeFiYLYYkjILCawr6C+KPKpyON5Xn0yofvliZM3ksIER2KumhuYKv4IGn+tzxmEYGwpFbhXrxEl2kVyxGgZT4aTVll2y2IUvsOsqPkdovrKsKZujt7vVBq1kIZ/5o74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775802993; c=relaxed/simple;
	bh=ncvh93jAnc+Kh1Rm86nCGET2vwT0AL0foIduL84AyF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HqvHvGHBPtJhsmxCWJcEFWrAiYHJmy4JPeDddcHdJq9Goj1lH9mALhE2jhzksZXzidmYyGDvafpXvm3Mdq0z+9coBbpMOjbPyn1Ui24+Gd+/LIoIFBYb9ckG6PHwKikWq5NLM5efOaZ7Bz02jpZVsiejWSYCWxv7lCHISBDJxwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UR9UOcbh; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UR9UOcbh"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12732165d1eso10976391c88.1
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Apr 2026 23:36:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775802991; cv=none;
        d=google.com; s=arc-20240605;
        b=NOzgZRfO0M9+Gv452OfhKrVViU28XEXXQy7tmfs0dBTqu4OYzdvD284lAyo2MiM/pA
         Z3JFhRLZswY7BJtyHXEp9Ma+ZagH5ANI2F8+4kmVOa8C+8aUYaISOOBl3fQZ2kyJh7w2
         jVRNe9N0cymf5rlhvz4CPgfH0GRl1nUM3T+wKKOaFcqmj39GPs92vKt4jyljYtA82hay
         Hou6pMEbbzQVuiNwo4OrOcQrcpsYsnNTmo03mWKR0X3c6u+ucKXtQB+AIt+5xLGIQSs8
         Dz6OmT1dwK1EnV6Q/adeiZw+biPOqPclfHkx/5fngyCcGrd9JKfHnFwUtOw4xJyRCY9h
         QYbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ncvh93jAnc+Kh1Rm86nCGET2vwT0AL0foIduL84AyF8=;
        fh=vOyU1eXgL8wv9YQxp/N+GbqCax7ee9oBgTjCbLNfm6I=;
        b=UBi8j8TXj8BYB9f3UodRqiYIll+aSGPOdvnkfpIfS2MTibi9zR5VAUYl620CtXXsq5
         V135eMKxBHOpld9hhI6OFSjxp1A/Q4Nd4KlpAiGarnIOgc9nSx/QFVctZHtV5hVq067n
         pDb4+qJyUtwb/4/cDVp08E2zw1E6hF8Qz5L63hbjcpiDK9FMPf2hetw5fGEhYAK46dxR
         LQx7lIErq0R1rMlk5vveDTmJgMynArvtnHlUlpwgmZuMu5gbDySXcDqQQnSSXKlQwg2v
         UEzuZNaBZpxvznLfFJI0MYPjMfaTXnhuqDPGbrjrFNvFmLwde129tliSqrnrsttKTqvh
         DuSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775802991; x=1776407791; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncvh93jAnc+Kh1Rm86nCGET2vwT0AL0foIduL84AyF8=;
        b=UR9UOcbh+qTOKCldI3OlTdofG3xUEZ7eR9Uh72Lsuk+Qc2FklAMd3zC/CsMnR9Jiry
         HojDn6wFgWKxBJ5fIXcOdG/WRSVuXrCE+TW9C/lYw/cC5OCTlAl3BQ9YfecFycxr4Xia
         ZR+rQWk45aAOSdxGMCUJZaLnVvfPxhvsKSy3i+EEhgyZuVbhaM/l7EIA1YpJtAR+58Qt
         f7+Ry5RQWwJSs+4NxIo9oo2cIgXlLJz08Fw4WMHWJDHYZx5hLeXxl9jtF9BQCSVNNWII
         hEAMX9d/0zRyian4gUSMIIdD85iJgH+vvEi9TXG9yE0iILcxg86mI2/XbM18P3vxoibE
         I/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775802991; x=1776407791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ncvh93jAnc+Kh1Rm86nCGET2vwT0AL0foIduL84AyF8=;
        b=djiamVYf+TjgKGgq6S3k5MdcRWBhFdUiAzjHo0XhX8+GaA+m5yHAD8BFjZJjaH3LnV
         RZCQu9qWTMIe7cVqbwhsLgb4agm643sGqghWL9uhHGzuvzKbRGZY7mg9t0hJUWdSKdWv
         gIC2puKzKcmRiqgz8dvP0l27TBW9OpbiGnauHLF84bDJrOA2GwCUVyVvcO59ztCyT8Sr
         sdPXnyTPS60slQorfnawE+YlgtGvy4Qe/mtZ8T6w/mvU7svQlPMtk2pCiibZML9reLeW
         jUt1KjvnSOUsAKPL+B3PCrTToMrq4uQujpPnss7r3GuzklDPalCGoOb9gItAevv19tC4
         LCSg==
X-Forwarded-Encrypted: i=1; AJvYcCWpyAcNfyjLFwxayEsxep5dfXJaIGitDqFD0/8OmSFPvzSsuYkk5J9QlD/hgItSoP7vXA9YelEqi5FdV6YD2QU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9lG96MubcrRJaRmKV//A2OzBq2/OyzGrwyN7xsPz3rVXrf6zf
	Kxr8XeG8D8W9orsmrtCNn60L3NHcmbFy6qZcWhTTEZWQzHfNOTGYFyXUoEdmGr3F8Ig29l2hlTC
	Us/cFo8OhkEAXV/CuLiYfmh4f1gdnriOL0kR8RhqP
X-Gm-Gg: AeBDieusnxyxgfCZkLAxosJgYih3QPm4wwaicQxTNEBmUFwhDggsP3m0Srnr1vKPcVd
	BzlgPe8nO6z1H6hv55HFWwUaiu98XuhQ4BmX/WJYjrScAvhm764qUDkwZuxLlHC3sUUYpnLxzWG
	EpWY/ZAB0ARFJ7RoAg+djNBSZ0GtF4UU1c+25SBnfU3ejHwb8SDRv2EyzFyXhk/uKfYYI2otIR+
	6OvOQfAVBDHJpzfDzEOsG3UIQqy5XAaP95fG/kssYdLB/P91SEeWC5ju66bIeiK0qpsMS8ZxRyB
	v0hHNbBInMjr5I3zQNxggIKuWLWdmRp9/95ZtNG3HCukz8IED/grvzt5K4A+tc83GlUt/3leYlR
	SasxrA/0=
X-Received: by 2002:a05:7022:62a7:b0:128:d577:dc21 with SMTP id
 a92af1059eb24-12c34e712b3mr1137078c88.13.1775802990860; Thu, 09 Apr 2026
 23:36:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260409-teaming-driver-internal-v7-0-f47e7589685d@google.com> <20260409-teaming-driver-internal-v7-9-f47e7589685d@google.com>
In-Reply-To: <20260409-teaming-driver-internal-v7-9-f47e7589685d@google.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 9 Apr 2026 23:36:18 -0700
X-Gm-Features: AQROBzBQtCRp41X6FJjmzDXEjYP_LuOgV17w4FamhSIrTd-CjmpREkmyTrBBvoI
Message-ID: <CAAVpQUCnTyyf+a0E+WR_y7Ry9OY=sUgycmKUNL0E9RwRUAtLwg@mail.gmail.com>
Subject: Re: [PATCH net-next v7 09/10] net: team: Add new tx_enabled team port option
To: Marc Harvey <marcharvey@google.com>
Cc: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 7:59=E2=80=AFPM Marc Harvey <marcharvey@google.com> =
wrote:
>
> This option allows independent control over tx enablement without
> affecting rx enablement. Like the rx_enabled option, this also
> implicitly affects the enabled option.
>
> If this option is not used, then the enabled option will continue to
> behave as it did before.
>
> Tested in a follow-up patch with a new selftest.
>
> Reviewed-by: Jiri Pirko <jiri@nvidia.com>
> Signed-off-by: Marc Harvey <marcharvey@google.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
