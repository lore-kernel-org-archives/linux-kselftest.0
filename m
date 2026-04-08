Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946CC1F1537
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 02:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775613866; cv=pass; b=IupXOj8xGbYXzA0JXVF/aeJ+vKr6SkPnlRYtvalaCSBRAUFOKG46KyRcUGQeg6HCYftotmBO63RFg3odKbuUFXSg2sdLdF0WDC7j5G5hIq+Cenlk4lzdfYxAwullS+rsg3HhuclLB87mVKQTpc+6bvNKK3KNJn2HuQG74omhjkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775613866; c=relaxed/simple;
	bh=C/nH5xGBHPXlvcMK8oAxKI1Ca7DE4QzZZWiUPli9i/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LFjUPICNjLiEf6pfOc9U+z/fg3suhUaPPjCPc3IvGyQjt5NkpfH54ZhUGSX1w4OJSSkUF/P9bfhniDd9iD80qI6qUa/nQ/ShDjRB/PDg6NNuDksqxDkiY7u+PpqATtOnJlAkKGL22EgLPNqXSQSfmLdzNgVPWkBsJilN7QIX3Lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iP85GgOP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=U/f2ube5; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iP85GgOP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="U/f2ube5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775613864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SEnDILMDGbUUU+7uZ7TGCOrAievRQNNxQ9U5GPXCRb0=;
	b=iP85GgOPrcPjT9kYOLhtW9C+KEKENCjQYe9TYqAGnAwR4CrAs2YlJga05zC5Q9UwdRtCoR
	FaSkn8YVASMzvJ9PSPRPczas/taxJOL8u4Rb3FZAyX8+IEJ9YKW5LrMHLyPVI46g8MPg2K
	wU4YzHHzTyNzQR7dsH7hvYPtSmN3uzk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-_38Rz5sBPYSr3a3v-phyCw-1; Tue, 07 Apr 2026 22:04:23 -0400
X-MC-Unique: _38Rz5sBPYSr3a3v-phyCw-1
X-Mimecast-MFC-AGG-ID: _38Rz5sBPYSr3a3v-phyCw_1775613862
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-66ee01292c2so2767277a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 19:04:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775613862; cv=none;
        d=google.com; s=arc-20240605;
        b=aA9gOUSv6q2sjBIbL96KiKJTKJkW4t2Yc8vRGCUtjzCtSmdabE5o+UTAL/wslos5Z7
         MwieijNGxlMwH1SOQi1esEMCTqaG6woZX55nMmc9ierDR0kidx88coChaajcgz2+jppu
         9jElhjRM8AbL8EvjY72uonvRqgaJYqOjlydBwWmFINsEtYnGAJig29VO3madR8brOPza
         s35mZhQVgqMgEM5TPcAspLf+RnmTGOaA4OCfXRzxfPX+ISrNs3h3tE4yh0kfG8gGG0NM
         a7yG+t7CSaTaIAcY/kBz+EDy2/dLof29MJbkpNda3ZT1lOh5+/VBG2mC3KETOPyMgRcQ
         OsOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SEnDILMDGbUUU+7uZ7TGCOrAievRQNNxQ9U5GPXCRb0=;
        fh=BitnpK9beIGH4XDy9rknIyzuOgZX+Fi+YQY9JXuHgdY=;
        b=JIpG1m1KW1BCqOdWYuJ0oNEH/Jo75z23JEIsEvM2LXuwbWX4ntquYPdoWoEvXhM7++
         YuQJptWpUePo/RowZNDtZ8vrYQM2yhfJFG61ousZTJQlli+g899/VD6D//pQIoDyfk7E
         NVJ0epACkGY5dAywO3+1+xJCKlIcfpSU7ZKyYT5GPtocffId7IgmRL4d++qmOZJgqobG
         MZnPZbltUqpHQ0LXof+mHAHbo2WxMYHkVF36GU6xDuGlcU/Ck4+MnEx+tLjq5FAtmMaI
         YZ0wQ0/TcnMidnfrIaLj3L2ED6XZZtQahB6i3is3HQgoHlleSt8dCdIMgaCQu2qNW0FA
         LUxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775613862; x=1776218662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SEnDILMDGbUUU+7uZ7TGCOrAievRQNNxQ9U5GPXCRb0=;
        b=U/f2ube5iZKo1XRuVjTlN3IsNKz5P3SsMAscTrBJ8JrxqfyVHusNpqgSCLjdG/E4OO
         idum+6SIKEdF6WHvOqS/ALR7CUkTDfAf3Tk0ghkNGHpwyZ9fWonajSwALyFzKvPexonT
         1lNnNzIEXtUhLadjJY6I6pWFpONSAJlS79lBdOp/77lvNduhXUK+pztDUuVqZ1UOgNI4
         SnSA6KpykBVm+5CsynBaru7C4KWiAcVCGYkCuwGWmTx7ul0rObN42zf3l7GwCQeDcMRe
         nzU69xjGXVX7VAyfhzr3PlOSCt+AmB2LB10eK5htJsoARGydZ2+1LdTwyJFzwGwP0hob
         OKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775613862; x=1776218662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SEnDILMDGbUUU+7uZ7TGCOrAievRQNNxQ9U5GPXCRb0=;
        b=PxPM0DjSWhMtMGHTrgLhd/SvQ28kSeQHHs3STLk/3jSOFl7Cv5tB6XCMIGWazgtAge
         kacOPTBarunixhyMK3ucEyt5y6USi+eekk9vl7jwvieVA6OBLrNVHO6knO78G7+3uQtW
         /1orJQncetTWQuDepJQRttCcyS7iQiqlNtzpqw+6BTvVp6d3UQ4OQAmqHeiqW7RHUKO/
         jEmCngzqVg9sdueev3kEcpjIvlGN31w1/QDoFPi3TH1vlq13yPyNCnFm2NRqkkDtS7wJ
         P2hECa1eZHMF/lVeWx/lWcTMTM1v8qulS7I7QAvt4dJVG7ImEmebx0to25q3Pf1sbfOI
         4AAw==
X-Forwarded-Encrypted: i=1; AJvYcCU8yOoYlJchrS2GnkTeu4mKZW1iIDofzDf6qyqDqTrc0/2AGlGUmSS3eYZqE7FgN7fOCfWCt3Qqk8y+M35HS1U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3svT7loHgAKMNX5ODO5qrwdcSuq4DVQfCIeeN9H0lsV8UmenQ
	7rcg4p+isANqiR5ZJPUaOpYFmy4sSjZOTBsReomFh3ZZf5DuvLCMA+FQFtdQDJ32gXtNtewDkU0
	XMkwm/+cKlr0Vwo3G0E/oSPZIytMcsNExsnFDkkmpjqZmIsuUiV+WOzXEmcY0RYl6Ef+OZlJp6l
	I4n0N8rCQP1yIbAvaAP6e3scLWGHlgugcvKPj+lpmFF7E1
X-Gm-Gg: AeBDietqKYJ0znFbnp9UzT0+nIX3EW36mEMB66Z2Umuk0mg7TzFkNEXi+vDJOh9ECh/
	VjbAC30Gl+8j3wgX2mWBr4770KUJ6F3l2pQFYJzxwM3KhPxnXJSykIBi0uDEkztsIkfVykzrFm6
	LymgDOdGqKMFVJAV0nFS77Yxo0/p/1TRumUn+uOv6ks/KyZtNmZM7/+Taglk5huic78SdAWlaSi
	4PIteI=
X-Received: by 2002:a05:6402:21d3:b0:66d:d09e:8607 with SMTP id 4fb4d7f45d1cf-66e3f978c33mr6914686a12.25.1775613862026;
        Tue, 07 Apr 2026 19:04:22 -0700 (PDT)
X-Received: by 2002:a05:6402:21d3:b0:66d:d09e:8607 with SMTP id
 4fb4d7f45d1cf-66e3f978c33mr6914671a12.25.1775613861573; Tue, 07 Apr 2026
 19:04:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775527362.git.xudu@redhat.com> <b65f95793e03c1cb3ed3af4e1b2bee89fcf7e648.1775527362.git.xudu@redhat.com>
 <20260407080844.35368eaa@kernel.org>
In-Reply-To: <20260407080844.35368eaa@kernel.org>
From: Xu Du <xudu@redhat.com>
Date: Wed, 8 Apr 2026 10:04:09 +0800
X-Gm-Features: AQROBzDB-Jxdan5EmdzQR_M8yVv2BXt57Hgyxa7625vJBiUYisaDh8aNi4Xkjxo
Message-ID: <CAA92KxmXOpH=CUqEdVV2948XhU1oFh8PBYLUt=ktSsK3sOh40g@mail.gmail.com>
Subject: Re: [RFC net-next 2/4] selftests: drv-net: tso: add helpers for
 double tunneling GSO
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	horms@kernel.org, shuah@kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2026 at 11:08=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Tue,  7 Apr 2026 10:45:09 +0800 Xu Du wrote:
> > As the YNL Python module cannot be invoked across different devices or
> > environments directly in its current form, the helper abstracts the
> > YNL CLI calls to ensure proper configuration of the tunneling device
> > features.
>
> Can you explain more? Why can't you use class RtnlFamily?
>

Hi Jakub,
I want to test the gro-hint parameter functionality of the GENEVE tunnel,
so I intend to use YNL for the testing. I am conducting the test between
two machines using SSH type. I want to add the gro-hint parameter on
both the local and remote nodes; however, I am unable to invoke class
RtnlFamily on the remote node via SSH.

--=20

Regards,

Xu

