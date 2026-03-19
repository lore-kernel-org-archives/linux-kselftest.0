Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2E02D640D
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 07:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773904239; cv=pass; b=CZs3IVcC5H/gx3h3mJ53bcMR/JEPSrs+q4EQKoAgU8h4MAiH0NLGGBe51idu4xrTPW4XCBpVE2f8EPRH19Q4jUsu19qD8tiPXI8cXn3Avl+9Cj2VhP9tCpf0miW0TCT1soB13zBiHpo4CnwtaK7gzY7RS3zJY6Bjwr5Mc3OiWak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773904239; c=relaxed/simple;
	bh=zWvhRKm9Tcl1X1tv6vaA458EdhxRENwhSAcKjNT7vl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gl5ViPw2KnvwbGo1Xbp2fHhXtq0yJP515xfOEtUPQGrCnG4qildKYRVfn3tBp2MtZJeCYbJd/Iibv5p2Bbu3gGGhmt0DafaWjt45I0URx2hkezBbyY5RKnOkQvD8R+LvZ/pimwbihH8MBgiJsYBz5h9b7fSXzUJ7KU9HOfFu1X8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6byNfin; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6byNfin"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79628fb5c05so2898897b3.2
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 00:10:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773904237; cv=none;
        d=google.com; s=arc-20240605;
        b=YG6lkzAu6Xc00r34jKewnGcj5x1TrwV46lrTMop/hS2Wqu5wU+bomOJttjrLYEjy72
         7lYMvsQJEzspHpFfXUZOdzjzax1SeqZSN6uJRWM4uYl0uW9Y7+Qy9+sEbXB9zrl6HSih
         dEtR5J75G/Jy6CmQP7xSHeIQAQWTE0d33Ra3dSa15xNGePNLSV+Bdd/QeeMrCFnIlqgp
         00y1BoreCiBBnQhqEdh/iUG+LtnBoLpJi5APGOWqB5euy6NkMio0/DSIYyuRuhCgpFzP
         MrhE/mH+H/txcTFTEty0hZQbhUOw18qINYr/4vXCwN8PszQrdLaUm9L3ZlW8erWB82zV
         bdcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zWvhRKm9Tcl1X1tv6vaA458EdhxRENwhSAcKjNT7vl4=;
        fh=Q5qeff3JL9B7WMbexYMvo70t3Q/V2ySRzDGFCu0BjSU=;
        b=U3qozMjrUhZmckq0wCZA16dx7qnp8koPPWSwsDO14b15LNMeRG/IbBmxgfflf+Svwv
         0fj/qYAHdM9FudNRk6TPh25Ep0dnz6jOGX6xvEjZ72LV+zztDzIQStAnPgjfHBazADQZ
         T+wgQhXqUz/nTfQRCihvxT4q0P5YebDicb6F7Phj+p26UpVsRujWFwm9JnfyO6AGYlg+
         A8NzPheGMRlqLmsUqhfaO4sBHETYbc6s22ho8PnClqRHAmj1pkJzU4wWoMc/wLO3Tzjn
         njvx0Ne/tjqOLWGF1/oyOywopaVty/aKkF76HJQzaQVXwYpW1xcl5yZkMTp/H+aKo9Q9
         VlBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773904237; x=1774509037; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWvhRKm9Tcl1X1tv6vaA458EdhxRENwhSAcKjNT7vl4=;
        b=B6byNfinnOT5Y0KIw7VscQIYRJhQqXkOIbkmFxW4eWVAElgUgH3i54SZHJryEbzaUm
         msP0lrPF3us4aMYhjDwE7TKdJUUxPUNAj3IsD5q5esd9FxV4y6YfqstmxW/29w/WBoty
         xvplINXFuNq+rMViv60SVutsOTW+5QULkcPYwl8WXDoN/U/MzoJsolTBWj4SB3nJSAIA
         pZQaqLG4jlBQVJ18Sp6ANnA8dO+GbC4Kr8rhFgYRvJGgZ3hDsbx2Osl1Ea4u00N/yV60
         jOHQ9OfJsk7eFVXkHJjxyXHgmkkl9TgTLQbd8FCPZMy+eJoCLPAq0n8ijPh8mgKC1OZA
         n7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773904237; x=1774509037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zWvhRKm9Tcl1X1tv6vaA458EdhxRENwhSAcKjNT7vl4=;
        b=pQ41EnoD66EYdPu2a7APXhfuZl/s1Evwv4PMQkvtETD+0aeB+KbVySu+/hX/Bt0skU
         LmvNQeLxWW0M3FWf4vN8LtozCLr3l4Pinyo5cAtuCwWY+umkCG8bxYEfVWcNymHPldqr
         VIaIvXwuao6BlVbgAnluMu8FpzEyTKy0XDwWvua8bM3ygP7+q0ozUGHPrQa0ElL+/wS8
         2lG2pXYId2skVxWCRdmPDzqVkG4V79QFsrSh6Ym+OLQyPjwqeSQPbXAteBYjb12Y3eKV
         fYCiyCntLyU3kIPh38R/xk8IuGO1Vyk7IKcpKhjqSpbuRqR2+iVNUC2lZiZssuD7fqzz
         gjBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvO7gfMZgD8pD/nxWdCW4zik1ps9Bti4p8Y1jPoq6AgtUldlJDyPDNvs6zOJyNOpPFpjgSlUxK1kBMapg/YQI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5jTirBoSd4C4NDoMDpdRBn+KcB1O2Wf540FDCwcZqVVLb93sk
	iDQORqI55lGXjAfJzwGGTUW5w/3sY2Cybc4sGzf4cJP3FDlfhKuP0NpnDMxozSZwSbMbc2YUj4F
	xJXI3SWxEloW6uQUor42EDHL0jyxyAkI=
X-Gm-Gg: ATEYQzxzi9PLut3lK+Z6P5mKVbRpfkPvPIph7WKSaMX9nWX2lPan5iV1V1C/xE7mp0W
	YaZAWdFkyhJwYWmW/H85F55K+0aXe4byJtkBHHCEgXgVLw1YcM8N6QDK7jc0T5dFYFFx9tuMDY0
	9X0c9tJxWR+X8tES31qgqBbViLZbdWEEG2TNeYP8p0KC+95pYacwVZQ2+GmkmED2zx8OjWE/ScL
	64SpFJ7WrOhFJCu8d8wJhOry2meWeXEq/pp1zJgwAvsUwQ/+aftvdQF9UDIWJ0T26Oc0dCcj22c
	dhozxDw=
X-Received: by 2002:a05:690c:a00a:b0:799:1d0a:aca8 with SMTP id
 00721157ae682-79a718b1697mr52989017b3.19.1773904237044; Thu, 19 Mar 2026
 00:10:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318113200.303824-1-sun.jian.kdev@gmail.com> <m2fr5xnwkx.fsf@kernel.org>
In-Reply-To: <m2fr5xnwkx.fsf@kernel.org>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Thu, 19 Mar 2026 15:10:28 +0800
X-Gm-Features: AaiRm51Nw-GNS-Z4EKRdhonvG0llaMuqhIP8-0ju-hgfMR5TkAvsi7GUwTF_LjM
Message-ID: <CABFUUZEfGWqL97=_yyJEcRNfLRzQeVvRvvXXQN4gcw_htHvm5w@mail.gmail.com>
Subject: Re: [PATCH] selftests/bpf: add a 32-bit bounds deduction case
To: Puranjay Mohan <puranjay@kernel.org>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	paul.chaignon@gmail.com, shuah@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 8:36=E2=80=AFPM Puranjay Mohan <puranjay@kernel.org=
> wrote:
>
>
> No new coverage is added.
Agreed.
I'll drop this patch and revisit it later if I come up with a real
two-overlap case.

Thanks for your review.

Regards,
Sun Jian
