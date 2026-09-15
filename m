Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182B43DAACD
	for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 02:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789439993; cv=pass; b=Gn0X4m7+oBrlCw1OzOakcDJ4eJ96pHkpfeUNpl49XrRH4ymyGh4i/vQHTQztzc1aeTcVI5XhxNYWIu3eboe8iW81ojEbbTLvcHAcpgAn2rSQ6xpNzcCHyobNsAgLU4YCq9oiiVArqgi3VAWO5vDPEl4GFgyNRPB8lRQJdmln66w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789439993; c=relaxed/simple;
	bh=eKLUaFl3MY3wwrqb6j5IuVvJPNafZ/2V9PYh3wKn53U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jl8zimQw5XxGvY1ZxvyM/evN9BhAOpBIfoyMZ8OKYLe0ruQ375ZEE50V7sU4am4+0j5YNfJcRzMVLDVIMpkj6nUwtIWrws4HhE4/K9WlsFjwFqqTSDepECt/IujDRUy4A2eCKIF2ObDpBaE7PF4qIGrfBLZJpHhsMRMNRtcd6e0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGvxsD2n; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGvxsD2n"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso31453285e9.2
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 19:39:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789439987; cv=none;
        d=google.com; s=arc-20260327;
        b=LO53Ufkj1bNTWY4ZRnjpgmn6OSATfzJI1J5urw88i9CqXhzIHWroR97J3BZ8BN5/Fg
         6AzeKwxb/dFjxnzHjB12PgvIUBAhBmcXCBb1tZISPl9AT4IZ8OLDghBoakJ+sYOxKxTX
         soRK5lSBotq5sNfaMRfsGxskykn/RERy0M/2qyXbwEbUSmnEUxjFJKhQPHBaOmW3mlhi
         8kLJfo24Xh0/+JxNhFpEcp0huYsjXik0Z0ICTN37oKSLw3qHuHr7dxqMjuM32bS0ekHT
         gWCrSfMwqV3+U7uxjP85S2WBYEBWmXhwPNNB9nKcrZrmds+tC9zJy9LgJx+qBzeiykTD
         XWSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2jmDylHBt6Z/mwGiXz/nmJJJ0KqybZ3pQ4MP3rJZ7V4=;
        fh=tuorWHicdy/VA1LZiAAWxsQjUlZzbnHKsFgkNtvF7DM=;
        b=b0CbePfEPm9sqnY+rFFDnVvBp/NJkh5sqwVPOJQwSE1fJErI9JCYtHOrYrmRXkjogM
         boPDNNkZBopf6VHDX68TiaPs7iSU0rZOy9rlItMYBLcHVif0Xv9JUUmJ1F0pMWuTFcMq
         KwlFjU2fZcGpw4IX5/aMWUBEI7N5u8tLr1y3qA4izE81NnKnfxya2+Q/cfMZpQl2tI9E
         PNMzjutX+Yrx89ZyEkoVROHAP/nt2BLY03xWn0qbXpPxiRdbFGFh+GAOTMNIjpru9AZI
         iu5w6/RHCi6wTVGJMJNz3OvZZeY9KH2SwTl0iG5nI0LQ9HNcOgrZY4yPdG+WQ1garX+w
         Kgyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789439987; x=1790044787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2jmDylHBt6Z/mwGiXz/nmJJJ0KqybZ3pQ4MP3rJZ7V4=;
        b=CGvxsD2n83clqF7sc7Tr0a7didOvx4GKvoBLp1q4SsTezvDMOs3c/MabkBDz/4gmsU
         NeQjdSLOq7ES+C2UA3uMuqz+KvbhlTjSQ7Ct0tYyK/5tmHuqJaeTdUtZTPaitpv7+B+m
         gZF9ujeBQdqIOS4V68Uqv2hIwrpa1kSTuxNupD8hCsc40qSS2KD/rYztposZLQdZvz5I
         vcf/0TDpbQryq2W3eieY3lqkaxu5CHYUUUVwbUriEy6APC8BMgi76vi+C/dYLmbQGbvm
         NJV11zUzKXQHQmOaxG6DgLAjQN7NxxRpkcGEZiuLYSaQ4fNywvDq2zbFERMh6D2c6oBW
         AcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789439987; x=1790044787;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2jmDylHBt6Z/mwGiXz/nmJJJ0KqybZ3pQ4MP3rJZ7V4=;
        b=XFEVEAniMZauKatjV0Tt8ANMzxBLgyGaVbgxQc/cYvBd2qqa0f7HhV9FjNL1PtV8yn
         8i4D+eJETEefYvrK7Qu7zspHPU/eHgimMx1yOgNlW3bg/jchQl/YyPf9H63FBpN7D7ws
         vQPnDVgNmOIxnconrWCeu9/lYTjvEELwPzy+0k92RCAu+5/uwDGtSyLCIiqI5/yfgvf/
         SHhFL9p25FXWMX19K1ShriM2B+2ywC95oe+eh2LvZDolsv2HBCN1bhOPpJeQsI7JvPzi
         XuvIBizwFk8gLQLK7Jk3NhYhwjWfIqobnEOR0uX++IDQ65wvMx8iCq6p9KFKvTQlO8j7
         UFgw==
X-Forwarded-Encrypted: i=1; AKwUvBzcMyaQeOHdPdRz65VU+Q8O78khUpgXFcMJD9DG2G3ybU0RAES9Av6wQKoxwUDeALcs4JlSLeH+NKdXILmRUmU=@vger.kernel.org
X-Gm-Message-State: AFuF++lmXs3S4vWZY0BvEZ1n20AoF/VGRtudR0qqy01pg8HoG1AYWUaE
	Zd9pA213u5Bt5VyO8A/x9pn4G0DnNoR/8FeiRiusgij4WBNrcOVP9kPz0vlGUUXgyOtF9zWOYyS
	Oda3vLMkmZDN9vXOnEUN1fW53SG8Ui1M=
X-Gm-Gg: AYBFou1FabgZ0ltH2M87m0ZL8m4N0Sy2fItFMOpfbF6ZcQth3+OOcx0wGNvocDCS2MQ
	S5cul2xYLk1quF2A41zJsqzOydiwXEK9MTYpkBce+/5vc6AmO2Oc4COlohFZOLwdMRYbjUJxXU8
	VA0YKh0K8BLbNGNWxS6n5fSnHvhi6omGh9KRmxcdB/uiYQhtlLvJXnNYPNg2E5/lqhiRGuGjVgv
	1c0OsipxXmzIGJHgslCxKSyie4WWUZ4IJ0i66uHOmPxQv/GkveS8mT1sAu/v1bmZ0pMQqNtHD4X
	aD0E5ltEC1JDQ5/NHXL7h1OObgZqXeoqlp4k4xzSA3SlGoA4H7k3Bs7a4a0wigWKRVcPPys0ES1
	rKPvS/bEpy1pA2QASsKy8c3X1
X-Received: by 2002:a05:600c:3548:b0:49e:602a:b4ec with SMTP id
 5b1f17b1804b1-49e7a656bf6mr108019915e9.8.1789439986429; Mon, 14 Sep 2026
 19:39:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914155729.1518105-1-kunwu.chan@gmail.com> <20260914234924.100335-1-sj@kernel.org>
In-Reply-To: <20260914234924.100335-1-sj@kernel.org>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Tue, 15 Sep 2026 10:39:35 +0800
X-Gm-Features: AcwNN1Uk_DUdhz76I0hRVSRZulITZWPos7_upPjkw2hrucXG5m-I4GLxm605D_A
Message-ID: <CAN_Opa-cJDOOtQo+24kSrO6E9khoJuD3wzHZxcgAWZrrSOOSqw@mail.gmail.com>
Subject: Re: [RFC PATCH 8/8] mm/damon/core-kunit: test invalid damos filter commits
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@davidgow.net>, damon@lists.linux.dev, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, lianux.mm@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 7:49=E2=80=AFAM SJ Park <sj@kernel.org> wrote:
>
> Hi Kunwu,
>
> On Mon, 14 Sep 2026 23:57:27 +0800 Kunwu Chan <kunwu.chan@gmail.com> wrot=
e:
>
> > On Sat, 12 Sep 2026 12:18:06 -0700 SJ Park <sj@kernel.org> wrote:
> >
> > > Add test cases for testing the validation of damos filter arguments i=
n
> > > commit time.
> [...]
> > Could we also test an invalid PROBE_HITS_WSUM range here?
> >
> > Patch 4 adds the same max < min validation for
> > DAMOS_FILTER_TYPE_PROBE_HITS_WSUM, but this test only covers
> > ADDR and HUGEPAGE_SIZE.
>
> I agree it is better to add a test.  But not necessarily together with th=
is
> series, in my humble opinion.  I am separately working on the test.

Thanks, SJ. Sounds good to me.

>
>
> Thanks,
> SJ
>
> [...]
