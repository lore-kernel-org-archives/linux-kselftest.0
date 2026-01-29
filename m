Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5226A36CE00
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 22:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769727510; cv=pass; b=IECfHBVIOqabAV4cx0f4g2WEZavfreMfxlJ1B+i/qAv7wpxYV//OsBzUtsnnsSuz55prQyV9n8UXn4j95DPmbbQO87xqC9p1R9Dx8nHunkgNJecsO08APhA1d+fTuAUkyGiP9n10AIujfbobT8WUrqIl8BXGX/pSgaxqxPVx4pI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769727510; c=relaxed/simple;
	bh=SR/v5TklhOolnIhKUz8r75fq4feIeVJF3sBpfHfQPIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z+oj/SebxenkHjC1YL9ztpmt/EgNZGOa6eRCfYhCnKC+DWeCELaDmiI0Bt+Zp8Ap9/4Qk638B0mgTM9oLlA/QQA6eQs9L6v0ngZroTfoZVEGjJ6Pw+Rzf7mA8znaXTdoafb9V9tkv0OQ7I4NteHl+RIclUD/zoA9ZXuCYHuFwZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j6VdjXwL; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j6VdjXwL"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59dd3e979ceso1560955e87.1
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 14:58:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769727506; cv=none;
        d=google.com; s=arc-20240605;
        b=NAIOOHPDAhheYhJ5IDqJvCZ5RTPdilR6pj10z8VpgnqXwl7s/AtPCUuruYTjaap77/
         0wRoUYGimgk7cs9gyBsdlcBBvJ8pFtCRhkDI+GTyVd7gjSnsvabY8BZuVKXQmJvrHiHO
         hqmxJaNMIB5JUwapY3jN2u5H8gFK/NGgtbayDr+qK6W5jO9CnzEfXnHGzBNHH2wWmLF5
         MwKG1Pel/171cXxJPOkDee2B9efHAVCIFnRvc3bOpal6YeGXZMO7NqMV4C/z8qIsa3+S
         V2ZIEgEIlBWEzwNUxlkfMDWzc+q0FIZE5/bPGUTjhPM/wnRETnN7MYLLAO7gS3qLRORD
         cD5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F1bZu8R3pK4Srj8vXk4ihEBDH1LGtIFmZ9pqs3VyhmI=;
        fh=euUC7O3jQusR+yUUrpmPU4eeHemfH1WMADplJCrtWCw=;
        b=RbfQaitomSlE4OYJwdT6IPH7PVadcCOaSvbpyBgNWLhyKCvCL2nQJctIQzaFz5U8Ap
         JRfmin4LB+9G9/3gxyf8F2l0EA8wBJBw3Kd2wFAtHzkEn50qtL17mMXB0JyxEkm38k1B
         A21c2CN7XoT6uZKXaBkGB2Enw0sS84fM8Y8hswRVrK7Hn54SGbzNrptAY3wuRqxlUUZ9
         6kvuZ+SniEusUd0Rk7uI1986/zfhwqa38UmaW5d+XGkRVQsS5tCEw5BDy62788s/NkmB
         Vb1QGRn5l61IUBqhD0yDb9RB1JvK2LcBWjgaXiEWlB//xrD63N09kOZ375nkkJSL9ytu
         9ffw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769727506; x=1770332306; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1bZu8R3pK4Srj8vXk4ihEBDH1LGtIFmZ9pqs3VyhmI=;
        b=j6VdjXwLnU/GrL4PSycE4Bs8pTm6JUOJaxs5c5AUwWB74VavgxsbMJg9+WIyMY1gag
         9a76sMdqMP2vVr1sSKq1voZzWbHSaB2N88eKi4lAQh5otBeosvof9KeTyGsDzcy3O6M9
         MJWXBS+69m+pNUsbs8yY60tlxf7lI4yOZKJMjQ9x2rWA+Wv+2VSVCMBtywVMTt1ZqElX
         CUpyHCaGmCqaMS8fMH65H5KuF1Ew3TsOjwq5VzBRoKUzJYTnO4k9gTPTXeZsL5hw/Bb+
         rCUziW8b8UorUQ039JoieEPLe4XTN5ftcpU0f1FY6s75AikrDGMCJu+g/KnvFjUYF0Q/
         YKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769727506; x=1770332306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F1bZu8R3pK4Srj8vXk4ihEBDH1LGtIFmZ9pqs3VyhmI=;
        b=TyCma5plbRc69/7MMjJEnjwSYWSyMH7faxvdplJyfHsQNdAaTsFTttqKfADmrHhlXL
         9RjqVLcPQlORH7V909CUMHPw1yXPnNRoicZ8lRTZ4kroVTNx61ipKtGYwT0bNU3oYx+b
         qZXYYrGDrcYD+7DhCUnrbWX1h7DCYx2KggTb8dOfdfavm71fhSuFnkER2P+AbwEgePzA
         C9gGP0K0ejiyUhe5AYua9DNBp4NcYqszPpezYAJ5myMJtC/5DOWmkMqCqeSMByQU85Q/
         +TeZi8d1r402FJSnJLTmkzg9VpL9VectJTlswEWfnsOKU1ll05oS/8wwP+LVCPWD1uB/
         f/kA==
X-Forwarded-Encrypted: i=1; AJvYcCUqlZwWUhoOATxV/lALoUzWsRHDQvYsBHwMP3Ua424Uuhu1LGm278CwP7nUXqKn+w8ab0QbdrW93BYAEfuzgpw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlbb/FVP+C7xzvDB8wQrAaxBK5OZAHGBJkGmx69EWjV6dFiJ9W
	XpXgqM3Nz6Z8Y0YayZNMpuKRxWw2sIWqoz+Gl9mmv1ffKAqtizi73yIYBiXjOaA7B3gzkGpT3o1
	xuH1Kz+EtEihG5JiAuRma019UuEawwQ+fsV2ImDmN
X-Gm-Gg: AZuq6aIxHb4/8PDowcPCF6uX+cbhtWdbUoGi19El1/YrGHPOI18b9RKLkweShEJ6BPL
	iYQogcENDSQ7WdTNXurFSDp12OmqHLigHjV/lo0n5J1BDqDk32/f2FPCA3kjSAKK8Qp0ZJ3CNIx
	g5uKoJoy6wiNIcyY4RIMEp1HVNk99B/GqE8Q6WnKJplT32XRHd/G89RymN78kTp4JQ9Ahwv01jv
	y3+E1lNOuCq1nkWTjvvIcLtsZwv+c5pXKJv8eNZDNJkSVEKpz9oR2OuOiVlhJg//Ng5IA==
X-Received: by 2002:a05:6512:1329:b0:59e:417:2ad2 with SMTP id
 2adb3069b0e04-59e1645add1mr230619e87.50.1769727506186; Thu, 29 Jan 2026
 14:58:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128183750.1240176-1-tedlogan@fb.com> <CALzav=dMhycS2iBxkhPCz3tMUKxkfgr1dCLFGYzGuXZCeYhijw@mail.gmail.com>
 <9d992d4a-1aea-42a7-aa79-4ede80293f9b@infradead.org> <CALzav=cWEoydGBpf4j5gPWy0TzLoAPP3YeG3VocbeEzytHTFrw@mail.gmail.com>
 <20260129115039.10fe3c76@shazbot.org>
In-Reply-To: <20260129115039.10fe3c76@shazbot.org>
From: David Matlack <dmatlack@google.com>
Date: Thu, 29 Jan 2026 14:57:59 -0800
X-Gm-Features: AZwV_QjtbgKitpamFKkDtA6ex3xqSqJUofJoh4JUwSCpyN8Ze7Z7nXH4GwE_IC8
Message-ID: <CALzav=cUDm6xSzw=KZeNmZT2=YKL+9N=_qLRmiCSvSBhbsAfew@mail.gmail.com>
Subject: Re: [PATCH] vfio: selftests: fix format conversion compiler warning
To: Alex Williamson <alex@shazbot.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Ted Logan <tedlogan@fb.com>, 
	Shuah Khan <shuah@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, Alex Mastro <amastro@fb.com>, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 10:50=E2=80=AFAM Alex Williamson <alex@shazbot.org>=
 wrote:
>
> On Wed, 28 Jan 2026 11:21:52 -0800
> David Matlack <dmatlack@google.com> wrote:
>
> > On Wed, Jan 28, 2026 at 11:12=E2=80=AFAM Randy Dunlap <rdunlap@infradea=
d.org> wrote:
> > > On 1/28/26 11:06 AM, David Matlack wrote:
> > > > On Wed, Jan 28, 2026 at 10:38=E2=80=AFAM Ted Logan <tedlogan@fb.com=
> wrote:
> > > >>
> > > >> Use the standard format conversion macro PRIx64 to generate the
> > > >> appropriate format conversion for 64-bit integers. Fixes a compile=
r
> > > >> warning with -Wformat on i386.
> > > >>
> > > >> Signed-off-by: Ted Logan <tedlogan@fb.com>
> > > >> Reported-by: kernel test robot <lkp@intel.com>
> > > >> Closes: https://lore.kernel.org/oe-kbuild-all/202601211830.aBEjmEF=
D-lkp@intel.com/
> > > >
> > > > Thanks for the patch.
> > > >
> > > > I've been seeing these i386 reports as well. I find the PRIx64, etc=
.
> > > > format specifiers make format strings very hard to read. And I thin=
k
> > > > there were some other issues when building VFIO selftests with i386
> > > > the last time I tried.
> > > >
> > > > I was thinking instead we should just not support i386 builds of VF=
IO
> > > > selftests. But I hadn't gotten around to figuring out the right
> > > > Makefile magic to make that happen.
> > >
> > > There are other 32-bit CPUs besides i386.
> > > Or do only support X86?
> >
> > At this point I would only call x86_64 and arm64 as supported. At
> > least that is all I have access to and tested.
> >
> > If there is legitimate desire to run these tests on 32-bit CPUs, then
> > we can support it.
> >
> > Alex, do you test on 32-bit CPUs?
>
> No, I haven't tested 32-bit in a very long time.  I'd like to think it
> works, but I'm not aware of any worthwhile use case.

Ok, thanks. Then let's defer making the selftests code 32-bit
compatible until there's a use-case / demand.

Ted, would you be able to send another to change to opt-out VFIO
selftests from 32-bit builds to avoid future kernel test robot
reports?
