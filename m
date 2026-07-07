Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB23248033B
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 21:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783460833; cv=pass; b=lxgm78F2AzNDPJbW1gQewQrVKNtDXHdYvTeZFtKu3zQ5Cv2WL17M5lcigTY/HD43puSBuwAUI7TVxH/XVktkAVlM6HaFarvke2xZf55Si04TRwdnO0YChFzRw3Y3PmCaxYmb+v7LL5+f+1kSOa9hksi/U+mPMbe0bo7OzpYAJsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783460833; c=relaxed/simple;
	bh=GuBq+aZYRE3FMuFwCfSCJSRf8onKcRbnKXv804YB0UA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r0vuXm0+aJXEuNE/CBZTrdmOxra1qzSO1r1IrxPSUl7UL+sf5UHD2GK0DuTF1xkRX81GasBXMwHNsiG8QEf9Rpvb0M6innukmZWf5TBzu0QqYsboCwdvoLzNgzUWrt1paxr+a2iPLoApW3/pCNKpSyg83qbBQatWtOvCWx92BNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUJm2sht; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUJm2sht"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aebfa21c62so8805e87.3
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 14:47:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783460830; cv=none;
        d=google.com; s=arc-20260327;
        b=PrVon+ZndxMKpjVU+G79bA9qB0odjG90tb5NcNrHEQC0kQxQC2XmgLSlXQ6aL94HS1
         BouWukL3RMVbNyfr0TJODV4nrGbbzGXL8BD4mTWl7mjy9Bu9o0wv0qOOtgtT0tZ528Ks
         +s2ASDDM98x4gKLYzuYACdgx9mnZY22Hl9PTopTHpN/IdT2Q+A0U0EOZQJ08H7kr15Ox
         BfqKRcdNoPYx596owet/I+yU/vroYVFtL8c2jJg7fc4aPYfKfCBFOK7Y3ZcgORu82w6s
         gCfu369detmwGApnY5IkOqYJ8IR1Oci6nWQ3JUsokx1ydAsAm2SVpLm/cZcX7LSjBcok
         zTFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GuBq+aZYRE3FMuFwCfSCJSRf8onKcRbnKXv804YB0UA=;
        fh=eRvs2DoMa+my0lAT+PhN2pEaDRJQ6mzWn0CdigTqNP8=;
        b=P+Q2Q4ilBNZNG8RmGJkvQB061kbB/wXRD7+BhxMcx8/wQXHA6LBceqxXAf5IjS8zcL
         EYlNwPSSuduzUgvN/4kzdZgGzqyXoIBEcvyGmM5K0TJC5W4KJI2ihJ+pPlXfHyzxDCl5
         HVSvzHG6kRczKN4nv0ZSm89pcG84vNEF8ZcFBC3fzHBm5G53siNYsOw1RUJ/vPt0bUFm
         p+bNMesch2MaqXfosZM8RpJ9e4mLXlVxnASmBeLs1qNLoM12E7A/BWtnrbOmcsSdQ/rH
         JM9/ioNKN+jnQR2evAOwyG3RBhKTCP+9qvO7WwH7cDS7bKjrPTV4BIocMiKJGY+nayCR
         DTdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783460830; x=1784065630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuBq+aZYRE3FMuFwCfSCJSRf8onKcRbnKXv804YB0UA=;
        b=KUJm2sht03DI0fvPi0mnxchqTlBx1RGwj2VOnT0MEOLZJsdln+Xi3SLzQNtEmOQ7tv
         A8kg8kUnhwmIDpu2EFCm5OCWJFnH3V3rYPLBHN5IeuBJzuPSazCl1/qurxvtIPpRgbu0
         Oe7uJ408c0zlNoY0hsGfkvRGwzBHS+mDOfkKEnlXfMUxtDT6b0//rcWUZHE3T1LL8y9V
         6wbtkQf7c3ulUPxmfwJ1SQdjRAVFRHTdlR7/NNVRZqT5VQweleFhCpVvdFiiDw3HyEzL
         UkkwVKRo3H9781LymgVmhkcv5vFZBKJb5CNGu7xXn7SuTyytwgVIzzZpCmm0UOydgtvE
         3D5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783460830; x=1784065630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GuBq+aZYRE3FMuFwCfSCJSRf8onKcRbnKXv804YB0UA=;
        b=EiM64tmPolJrgpYHoiLCboQc7Tl5J1t0J+/3K7HChUwZx8qZV/8jxghw+lvsJ04Q8n
         PmBApZm9FC9oedUCK7Ck+aojZF40M2vAq1M2co1pIY1PovYlZag0POIE+mgfnrtwtqF+
         r4WJtDN+KFhmSyE8a4IkCLqv1gSj6qhfvXtTeSzWqi4dbb1TsZ7DQ34WO6GQkxfhiSX3
         A0UB5cx8SxS7iRXUoHBFX+eaXmblYiqDcEIDSkEjmryl5HoRGiTu+Vkci5VaSeTPS815
         0Zfr1kUuqU1ftg6GWU5I6XraKBj7Do7TY096eUtNT+Hzwmf6TnTMX9UpXhKfjjxa4b+E
         0lQw==
X-Forwarded-Encrypted: i=1; AHgh+RryLBq+Yc8YnjWxqlQkBbqGV9KvJ1RkvJnaFCGN4MllbUfoVk0JGxes6gNuA3R97utcVaxzMKRz/ksZUJr0KG0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx98TPcV7nz5LdPF6FdMfxOH0/dYtQfgttulY3gbzGcy3swf7fC
	StuDq7EkFXknMjmFzRJfjmUb8CvDL6bUoiWMDTlfp0YM7tX4XGSEU/Y9zhpvE5lyHzJ5fAJk4Q6
	fN3IJvrsHrlSzCSF7gmWbGvbnWve6ScjcrLjN7CE=
X-Gm-Gg: AfdE7cntMcfAGqpU+ZUPloHhUaSwBRza1kBv6RgZBsxSqGAum6TZ2S9v1e/GPk2zvHG
	YFsaflDcvwVX94ofYJucj7QpNls9rh/8f1Pw+zzLCttY3PwlANNSEaul28IbM7fU7B4B2hsx5Hw
	9mH7MmdyYrI53QPatHDHyBBujXWOI4MdK32E97mkiz+yR53ynATklFlKuURGNAJ4YH5wNpAe5b+
	EEsJWGnBpWfjz3VGO1wHyZjhsYVObIWb2iKBP3Q8dKY3HLEpEIq1h0VlaxOYF0QT1GXad2fp7ye
	hnQYqho/SgGjwUohRLsz9MuHdEk2
X-Received: by 2002:ac2:5082:0:b0:5ae:bf95:38e4 with SMTP id
 2adb3069b0e04-5b007c1f0femr1110065e87.3.1783460829726; Tue, 07 Jul 2026
 14:47:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c0970cee-42c2-4844-b88e-229853f08e90@linux.dev>
 <CAO9r8zNJh65SZzdW8Cc8_8N5Wr+ORuRtU3kuaAX_DhLaESFYTA@mail.gmail.com>
 <CAKEwX=MMXdq7KTzcEgXfNt2L-eTmAVa+nijdyiujVOAhXQsHSg@mail.gmail.com> <CAO9r8zO-nAys0PJfXVRwLgAzwJLa9KxpMXKQKXJR7cnYKgmhRQ@mail.gmail.com>
In-Reply-To: <CAO9r8zO-nAys0PJfXVRwLgAzwJLa9KxpMXKQKXJR7cnYKgmhRQ@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 7 Jul 2026 14:46:57 -0700
X-Gm-Features: AVVi8CdOrDVPo69QAX-ampUYh37yFtghXiGRhoBaNYNkFWfhQkG5M-LvH_fSXDA
Message-ID: <CAKEwX=M7axSs2FJDq0KF3GBDpd6G0J=gP_2boUJraNf8M2n3Bw@mail.gmail.com>
Subject: Re: cgroup/test_zswap failed with "zswpout does not increase after
 test program"
To: Yosry Ahmed <yosry@kernel.org>
Cc: Zenghui Yu <zenghui.yu@linux.dev>, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	hannes@cmpxchg.org, chengming.zhou@linux.dev, tj@kernel.org, mkoutny@suse.com, 
	Shuah Khan <shuah@kernel.org>, mhocko@kernel.org, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 2:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrote=
:
>
> On Tue, Jul 7, 2026 at 2:35=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrot=
e:
> >
> > On Tue, Jul 7, 2026 at 11:25=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> =
wrote:
> > >
> > > On Tue, Jul 7, 2026 at 2:38=E2=80=AFAM Zenghui Yu <zenghui.yu@linux.d=
ev> wrote:
> > >
> > > We were discussing a way for userspace to explicitly trigger a flush
> > > before, which would come in handy for testing. However, we decided no=
t
> > > to expose flushing as a concept to userspace.
> > >
> > > Unfortunately I think the only way to "fix" the test is to allocate
> > > more memory, enough to trigger a flush on most interesting setups.
> > > Perhaps we should scale the amount of memory with the number of CPUs
> > > so that we don't have to keep playing whack-a-mole.
> >
> > I don't have a good idea for writeback, but for zswap out, would
> > MADV_PAGEOUT work here?
>
> I don't think the reclaim mechanism is the problem, but the fact that
> we don't have enough pending updates to flush the stats. Am I missing
> something?

Ah yeah, you're right. Hmmm.

Yeah it sucks, but maybe sleeping (more than the flush period) before
read is the only way. Which
is terribly implementation-dependent :(
