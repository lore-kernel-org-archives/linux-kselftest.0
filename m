Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A909E3C279B
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 08:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774339801; cv=pass; b=qFDkhzJKAb2yUf96WHykZ6tCnYlHV++R8Ph2rAmFat7wfx+BsSPulanbaD2YIRdRCAVgO593GJxYsjhPWkWQ7R/pOLmkZ5DRBgTS9aCrtv8yIEEzEnZCg33xop4qpHK52B7cPeF0HTsrqeZDeForsOUsnBbJKbZEn9dLwJowqiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774339801; c=relaxed/simple;
	bh=MwDMuPiIcqGddS4RomYMgXO9AZM9m7utZrTmSBo4Kqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YjjywTxVit9zGN40DLBd2oBJoJFIHrEDBw0A4ONvNlOVqqHxgDABqkiCtmQpR/65FLARojt93xCQTeRgtgc/pq/IvuEbfQPMnEhYKX44tfECV7KAqKQnWN0MXqVezPUhwr3vw2u4tcBpUQA7vmtsisHDCdHNIysTnvGpEO5hpJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=YFpASAOe; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="YFpASAOe"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9825ba7e8dso136206266b.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 01:09:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774339791; cv=none;
        d=google.com; s=arc-20240605;
        b=JJ3C9ZuncL04c4VKk4+9VFiAGkkWX0i2ysYfhq0q6lrFiXtbVOXO3X06Pk2C9pKUfY
         OgQi2k8pHEANKbsLfZpr2BR7IoBUs9IlLLHgSfyUmFvXBLJCHOuE9yZPIgchG903Q8yX
         rke8YzukwecJNn7LVxd823EMIXsihnsZOZ/WuBizIJqzZgoldwKSleapxQApz3/uRwD5
         EPsqEorUEe1HMbzan3wE3b7We+/3yUNWy+8jp1LzMPBG13J9NhPMTgLvZK2HgMCzQPQI
         3bZ3s7NJvpG/L/gWnKfmDla9X74I0NaFKCsdeDoDNLqWrIuomJzdGkpGwiczp6B2zydK
         bV6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AA/zaM7Qo33FM3sUVdHeHfUA+zjPIWNI8Tvvb0zNQ+8=;
        fh=YlNszEoXlq3hWZw6t7H1riV5ZIYLEyWVYnKU3T5nB58=;
        b=UQuTo3DKBrZsLxw2qF+Yh09tsrjLo0W82ncgJgVQii3ugNGb9g3Lt3CwvKk+EBZc+U
         k+KgTzaE2fqAIaMqEnHZPDtTmsiQGv72Tb7/kkLqX1/mDsVZ64OrVfAqMf8fTwJwhesM
         IvhfOKVqoS5TCQYAs6BqChN7N6JPYOZ8NmMxjt5uLDpOB1IZSy2mxZh8SLcCDyi+Fx1q
         iVU01acnEDuvyPwvSTw05DNw7tw/UGm0Zjk4X+xUqZ3p/69DwEJ1e7H8MecXBBY7S3Nb
         UbBjVwjvUKV5t/xHZ5Qen+qHpDL+2EhYJfLeJjZMruoeuvTzBKGQXemlNQ3l/GVQgWKd
         ZvcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1774339791; x=1774944591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AA/zaM7Qo33FM3sUVdHeHfUA+zjPIWNI8Tvvb0zNQ+8=;
        b=YFpASAOerIeSYaKKsyP+12Cz/aeJeOTmGZjSe0m63hZQT9h4HGFyRhIfFdwVZoE+Px
         tNBCvbelWgAqWzZrpSN1H/sMHEn8XjO4qYz2IMC6X6cKk0hDvUzbipiwTdUHpA/RGFuf
         OEzEYN6QZy6SkrLs6qcG48Ux4hcVrex0V8cLbzza2+d7iKL9GG9F/wGOXnOZVac6mnZc
         gXLN2YiQTNfc2S3R6nfKx1xTDkyNtUnJdwmv9hnrkxUfUxF2Qd41nD8WYYTV0yxIID/J
         D8VwUn50ZmVjH+hesONMQAqUUjtqFX0K/mWr2z3b56pnbihMXGLXOO8oiSOwLxNLtVKo
         52Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774339791; x=1774944591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AA/zaM7Qo33FM3sUVdHeHfUA+zjPIWNI8Tvvb0zNQ+8=;
        b=VeUB8lt7wYgnFRb7YopkelKVDiYrcZtrs+AjarEufM1yTwzGGULo87R2OWKaGju36k
         dkMqGUG55OqHOIlxmx0+C/o+0ALg4Tu9Op2jprv2E2ozKbkvc7bSe3dDhcHsP38E4mOS
         +Acv1e2L+RoK6JiWMn1nph7JPrbdetXxOyIQN7Ji6VHtMTo1c774xYo0m0MTI5elvQRh
         GrZgpCFi8xKe62nZorpMFZCgiZ8FOjcLzBVdflUz3hfWh2SeRUXuZKSeMihVndSMrPpu
         hgcf/9Lp6oMvGWH0Br/E2ipZ/TlPVy3vGh6tcHEQ7ym8dkgB3ES3MDMWkfX91M1Ex81Q
         sZpA==
X-Forwarded-Encrypted: i=1; AJvYcCULqK5tnQxqEC5sEEPNELtUMG65dmQ7t+lodSANzIhGR+rLxREefYpwwPMzJGB5Ug+wcNR4rthJ+jJFew/9hY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ8RSmW+8JcOsgNbZ+NTRdHIjQUTSEEgzWhmiJjcWOwW+8kOK6
	Xe6mQEG3T1E03I9as4Uq0Qve98Qbr3q74koY2wmDBSXK2H9SgbnTcghjz9PLAVE6gY9ekOhcnpc
	3kYsYbt7uiSnTtOg1yu9AcLaiZwl38/TWxOp6BLOizg==
X-Gm-Gg: ATEYQzz6/yDKzPnQNBmFjuQg68PlvL/BYQR/tVjny4ah53oPhgaHdALdBtc87C/Ct+W
	QnBwqjukFwuBL1y5NgQrGd0a/NVc+F2I/2xLVwGGCB+7rW5QUBCLenM1VmsCljqhbW+JcVqbq1+
	TRXol0zV7pbCTljwbUcJrFpYx+NjR62EERZr3HMqvLgg9+wTeetExdQZ7jAYleYBqhIC2lJhQiA
	2LoNN5kWztjQ/0b7zb8mrft3cw8p3r0Zl7Vnz6G2sRHS4bdhJ+7lH9+IasUKhF0qtA9XtOEkx5p
	RHkBJ9x65UjTiOZeEE5iWxAoOojmV44zHKnDmHdC0g==
X-Received: by 2002:a17:907:da4:b0:b98:44b3:7e95 with SMTP id
 a640c23a62f3a-b9844b38052mr810937366b.40.1774339790570; Tue, 24 Mar 2026
 01:09:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320135909.1729313-1-justin.iurman@6wind.com>
 <20260320135909.1729313-3-justin.iurman@6wind.com> <20260323042742.1097eb845dba645864e3f84c@uniroma2.it>
In-Reply-To: <20260323042742.1097eb845dba645864e3f84c@uniroma2.it>
From: Justin Iurman <justin.iurman@6wind.com>
Date: Tue, 24 Mar 2026 08:09:38 +0000
X-Gm-Features: AQROBzAJoWPj-IDcbEWKkS9pLM294esnuC3ZcbRrYNyG3hbvqpcWRujXu2qY01g
Message-ID: <CAOY2BqwALJh4T=gbm_6bheWeTpngarBkU5p=jiPT8vGnhdDmcA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 2/2] selftests: add check for seg6 tunsrc
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, justin.iurman@gmail.com, 
	nicolas.dichtel@6wind.com, stefano.salsano@uniroma2.it, 
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 3:27=E2=80=AFAM Andrea Mayer <andrea.mayer@uniroma2=
.it> wrote:
>
> On Fri, 20 Mar 2026 14:59:09 +0100
> Justin Iurman <justin.iurman@6wind.com> wrote:
>
> > Extend srv6_hencap_red_l3vpn_test.sh to include checks for the new
> > "tunsrc" feature. If there is no support for tunsrc, it silently
> > falls back to the encap config without tunsrc.
> >
> > Cc: Shuah Khan <shuah@kernel.org>
> > Cc: linux-kselftest@vger.kernel.org
> > Signed-off-by: Justin Iurman <justin.iurman@6wind.com>
> > ---
> >  .../net/srv6_hencap_red_l3vpn_test.sh         | 95 ++++++++++++++++---
> >  1 file changed, 82 insertions(+), 13 deletions(-)
> >
>
> Hi Justin,
>
> Thanks for the v4. Good job on the fallback logic.
>
> However, while reviewing and testing this v4 on a mixed setup (older
> kernel, newer iproute2), I noticed a specific case that slips through,
> unfortunately causing the baseline SRv6 tunnel tests to fail.
>
> Kernels that do not support tunsrc simply ignore the SEG6_IPTUNNEL_SRC
> attribute. If iproute2 sends it, the kernel installs the route without
> the tunsrc and returns 0 (success). As a result, check_tunsrc_support()
> ends up setting HAS_TUNSRC=3Dtrue and installs DROP rules that block the
> baseline SRv6 traffic (please see below).

Hi Andrea,

Good catch! I'll send v5 to fix the above, as well as the nits you mentione=
d.

Thanks again,
Justin
