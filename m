Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0A038E8C3
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 22:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781303855; cv=pass; b=OzjRCYr08cp9sRXFaA88VtHOAVj+I1NCMimOsz3Hu0gMUXopiH1O2434UuExMNFxwMNqMGhAaPUDolVqXRMEfOzbmjxZ1FhL/AEo31JnreakGT03hYa9yMfI+UvaXw3o+aT/cGPLbiBp9sFNycr8c5qEu7WO33yMbhVCck54IxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781303855; c=relaxed/simple;
	bh=upxYdsljs1Q3FobyTQ4N3L2JqmWumXD9D4kqsVO1Mn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aeyvkcLSlHxW54csG0bnkh99soJZ7PwoWKwvpDW/Z8HzUQurzLhghFe6GJNBZkeKfVoGKpv2XTzxuupmkydckDNsNKQV9JfuCbLhbOV99ICHCJPar16mduJ43q4Ov8kPwVie27SpGzjA7lTzmV0VuSth1nP+GNjA+qW3A46sDHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCYTY5sb; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCYTY5sb"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-517a5cafc3dso15201501cf.3
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 15:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781303853; cv=none;
        d=google.com; s=arc-20240605;
        b=CJTa0agoKc6juZnCZYY/bukXGX4C4yydoQxBpbhiQyFHrUYS5JEblgZHxM77AXoGVR
         4JyMS3CohZxEhgzTw2+xidEdczD59ttq0W5jfXA0LG7M4yrov/69yTQug1VRvXyzHUaA
         uX9YxOcJXDO1KuYYjkw8ji2YEzHANjWzGWofZx4mAMlQM95NZTAADs3G9tquVSVGExqY
         ejEmPfOUqF4u0nis+cQmRVCpgd1zeNGrEQFqsPYwKu0pJpT7OumFrdl2ACcA5vXRJ+W2
         fqBPmRn2yEWk4BThedodf5BGFFDkWILB9bEVvbq8Nn+JFrxGDOAef9ooG9pBNUG2SbD/
         2TFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rBRAHcebZQ7InUHNMGol8uXlGZUk31ysomU2l/3gZBk=;
        fh=mAki1xC5Wv4iAqaMP/iftxAtjxRN4hiW7WzDQ1d+uWE=;
        b=RKS5IsBzLMD8U/nUygxySrv2R/i/VB4M0rgKcmJhNy7tGgCl6+lbSKQgUpo5nenHSJ
         JL6KYsZw6yL+7rMHAWwTS3a1d7AD4BWFjYwaCGmeHK9Nq7rxBXPN7/RfC27UKZFzKgds
         +DNyQWR1Ec79qIEl/Qh7tncUOBtt3w5tf7CATV2UrZGm/Qn5y7XI3Fh33F+VjJxIbWhr
         vytCFQM/5KMTFdsvsDV2Z7QFyVpkGtk3P+Eg0pdQSmRUx6SNrE//lIh/g7XtsKNAVw/6
         j0aHjA7D3CUdg29ciuUR9ldx8XAFhc2Pu3PK6m9V68sbSL1F56VQ6xAjNDaZBDNZK+BN
         cxow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781303853; x=1781908653; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBRAHcebZQ7InUHNMGol8uXlGZUk31ysomU2l/3gZBk=;
        b=iCYTY5sbSdPsbXX+Ikcrb9lffX5RC17UTN2t8Qd58+V+9775DZeBZm+lXP7o0z7Hsg
         KWVt1wz0AZQGE1FJBzyJg24wDt14s/XlozKQxDoFiIJA8g+reTnWQic0brbTyC6+L1sP
         AB7WjHqBEXIuMzLNmlg6f5YLdjdEnt1ywIOKpHcWhScdcdsLTafMz8hS+3fmNii5whyR
         rr6Wm+cMJOXnKEK5naMDICLrAgM4XlWHR0t2WfCddk/Rr00O/6bHIdBbGTcZw/DC363s
         TjZ6Su/15uokHWnJjqqSnVCWQZqOln0+NaMpR2NpNRMeKC79XbhCRVCZuo3bDkyStq83
         Bl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781303853; x=1781908653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rBRAHcebZQ7InUHNMGol8uXlGZUk31ysomU2l/3gZBk=;
        b=pu9Bu1bgKB9YUz0Yf6w8KtwsySvphVumAM5dmxO/izg0DMMfp6IAX+VXQ/mfYHJ1k2
         XearsLE6sAQKiVlHTDbSpj0WlWcLX6S7/kFCAWy5YnFrZK4weLeOEvaK/uHm/Jk/uuCR
         etxy94izhupBmqh0jXqoCKLtThswLgor4ifdl7i/hnPlomhuRmNwAx1tba38yVx4/3Ya
         Pkr55oD0Qdu5aDlenCNXU33KD6HbwTkhzjCJKBeHHNX2qrrQuRky7NdXJMH8uFT4oew2
         oF0YTrn/KraO1IbpcgChwfR90ir92nQ1CCTrb3bBgdaetCOI/XmMN8zvx8UHygr73JUd
         tuDg==
X-Forwarded-Encrypted: i=1; AFNElJ/5ll5qN+tySxbmR+7X7QJ4T/ggVK+teXnQLCy1GOx1XPmDXxTnBqS8uwyF7Y0YPYKjSrlgC6xbkPqq9f+t0VM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkazWZIFmS8cMLcTPe8aMoerGFAzUwYTVRx89OE85UWILbjduH
	7F1dQSFtgFs6mOGOtX2v5u4lGD95lGkW28ug2u9VrUpL5hOaDTmagg7S4qbc++DmtTyKNuSlMmw
	eaQPzu+bCe8vDze+dRsIPMfZ30UdnIEI=
X-Gm-Gg: Acq92OFys/XU9m2p5eP8ZFCD3oiRrSTKuAp2G61K7q/6xGfev/TO7NJKgAfh5sUhVY4
	fpm/iYvu/SPMKLW+TYL9RBEzn+CchHdcbnGsQkqinpcFTd9D+cDX7rtXbRPwpGqNtL4XebfWjlu
	YE1y3JTgvaHc2Z5k6id8/EZDr/dT2apTAjwZ+CHpP3shVcp1lnJrMxnAOgINC07Br3Q4ud0XQpM
	tDen//0I+8jTijSMHmtJXdobHYe2Cl2cdbVs3PRlbkPv1Ss6vGXtFGcfPZTjoFyF+zElMkhVz2I
	DcBJF3POLvehaoK9eOE/5gyPz8WBMmzYGNfCrW55KkXXdZdPTqJv7PayJUZJ8PkdMNb3JbCd+WN
	AnxmyszEU
X-Received: by 2002:a05:622a:5147:b0:50f:bb77:a084 with SMTP id
 d75a77b69052e-517fe48d46bmr70305501cf.25.1781303853375; Fri, 12 Jun 2026
 15:37:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526-seccomp-combined-v1-0-304b1cc3ad24@hill-daniel.co.uk>
 <20260526-seccomp-combined-v1-1-304b1cc3ad24@hill-daniel.co.uk> <CAAFS_9HpxOgHn+qfzSpLjV4Mj_CURiwxFOaK9GO0DdBg8xgNYw@mail.gmail.com>
In-Reply-To: <CAAFS_9HpxOgHn+qfzSpLjV4Mj_CURiwxFOaK9GO0DdBg8xgNYw@mail.gmail.com>
From: clubby789 <clubby789@gmail.com>
Date: Fri, 12 Jun 2026 23:37:21 +0100
X-Gm-Features: AVVi8CfgjBSgYWbftHOxOIpBd0igqwxLIi0I8C044rd7QU4om_B4hew3bdGZkvw
Message-ID: <CAO1UbGemPgHNj1VYONQGx3HJbMMmORctF=jQbGPGUFQYGch7qw@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/2] seccomp: Allow using `SECCOMP_MODE_STRICT`
 with `SECCOMP_MODE_FILTER`
To: Will Drewry <wad@chromium.org>
Cc: Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, Jamie Hill-Daniel <jamie@hill-daniel.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 8:25=E2=80=AFPM Will Drewry <wad@chromium.org> wrot=
e:
>
> So I have two concerns here --
>
> 1. By layering, STRICT becomes subject to FILTER RET behaviors.
> 2. If we did want to layer them, it would be ideal to separate the 'upgra=
de'
>     decision from the access checks and make the layering path explicit.
>
> If you are running a legacy binary that uses STRICT in Docker, then I
> understand the goal, but there are userspace options.
>
> I think it's hard to want to open the door on changing STRICT without
> a good reason to work through all the implications that come with it:
> cross-checking every SECCOMP_MODE_FILTER reference, sorting
> out thread sync interactions, ...
>
> That said, this change could be streamlined and look for ways
> to minimize any potential implications.
>
> Am I missing something or overstating it?
>
> Thanks!

Thanks for the review - I'm currently working on a new version which
addresses some of the implementation
issues. On the semantics side:
The current version runs strict checks before filters. I think it
makes more sense to run filters, run strict checks, then return the
filter result (assuming strict checks were survived)
Since the strict checks logically work as another filter layer,
documentation says
> Synchronization will fail if another thread in the same process is in SEC=
COMP_MODE_STRICT
So refusing to sync threads which are using both modes seems the most
reasonable.
