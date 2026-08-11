Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF143CB54C
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 18:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786474522; cv=pass; b=riwW32jNE73mkeoto1i9de+OC0TT+fjsKBg/gpbZfSeTeO2bSZbUpUPeoQbRgpaSUDpSh1rD93A1WFES3+owZHxg3S7eHVQuUn3CuMNS6vwjjbcQzzb5Tzu1LeWLrner+be58dh60egb7oujp73nnJ4jcQu20xBEI95zNC2+NSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786474522; c=relaxed/simple;
	bh=PK5DpGIYIZ4Q5mypA8J7nQL3JpavjxnvYneVp4Wv71c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dCDL+GJtTAkD3pTygs67VwVh7ZQ+DbZpKMRsaAACSkSas3bs5xi0PO0AcYLquHGmo4GV+E/blviEHMtU0BPMfjwlPYupaZiTHW0GXZCsAPXvN03tX+cWzAfUdpy3/YAigZDDFXeiMxOBDWaXtD4lFXgeg6TyAzax9oWy46WmpeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MvA8cOKC; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MvA8cOKC"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3900e39d935so280136a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 11:55:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786474519; cv=none;
        d=google.com; s=arc-20260327;
        b=r/cNuq6zdSgqU+6Qav6P/xeD7SLRupB+JH0wnRXZ2muzbJ2wl2Qd9kXCkDGKyMn7WK
         +s/WoA7stMdYaMg7yLVIvSugIjq4J8UrUzHTYjic5X8mZ4tOIekk2RKeRymoiXMn2SXD
         GCnYL7AVhY8yPrWFuYq7+PqMsfIXgTJQS6MrCVQh7h+Fxk56ZDGNh6nqxn78MPMkBlev
         MsD5dk0QNBPxoI2datcUyU+aTzO6DJXFBdeyBKcEKNg0qR+7EiUXYcZ3jqiL9Artq7Co
         V20flH8vE0rviThsRttPi7+CGy12yUqNPH9KFX3mPuWN1Qs7Ji+uqG8ickZb5FK/A/HL
         fkTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PK5DpGIYIZ4Q5mypA8J7nQL3JpavjxnvYneVp4Wv71c=;
        fh=psVq02t5BOIqglrziizEQG4mGvji0lWRItPx6TNUBL4=;
        b=kQP7J8Zm7Py0WnPEmzkeWMh2kopDZubyofAmIMeJwFVhPv3U+iY/t4oXgmyRvLZYgo
         g3waApYJb0F+avuHe/KlfPcb0Gz17nYvfMqUh424/Zh8Emu7AZk4MI/QkRcwh8C/nEIR
         5cJ2nV/j+XQZghmqo7G5oeuy1bmwKnrKhUrtrsX6y5afaNN+qBW/5mAAVr3XYcZSCxZv
         lsUg03BsMUPF6TyGkdH9DVpHNYz+zummUg+ye6ImToVBd9tfqfCBnI/N0cG0patiRHnJ
         A2sFKQtAPFZL36rCLi1AiW8THsWNFSfOBmMrwG9dXnCMbYsZsxaINAukZeb8pGjGndwU
         tpLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786474519; x=1787079319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PK5DpGIYIZ4Q5mypA8J7nQL3JpavjxnvYneVp4Wv71c=;
        b=MvA8cOKCCXQQlEI5MpSTG7Uni96YcPS5b/rfl+m9QzwZ1k6yGDSnhcD5xe8meOnssX
         Xs0Pr8pUP4mCgH1sBCVHw7bmve95hnxFLe3DncNcFRrJA2JIGbtAVbfry5z0a1Ab+mNI
         IgK8R9sRjwIR1fvw8R9WTX/fWpLuPoVEQZpFQNK+i24csuxgw/43lNUo7K3VmfphX6c5
         x3tVIMLV1Gxw1UdGkArwhiAMJERGpENe+zSp+zEUY2KLf7F1VBCg9VutYYWuBru7qC3+
         qrJ9hWdcklkm0d6YOqad+x6T1VLz5HHA139/xswx5aDGzlj+eybfBSs4kV9otrqwGUeJ
         cwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786474519; x=1787079319;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PK5DpGIYIZ4Q5mypA8J7nQL3JpavjxnvYneVp4Wv71c=;
        b=E21TcRHl2NGJqYg+e+nTm0r3Mc9lQlcrMn1ZcilRvUQQwhQ47+jVar828pV/FNsw2S
         7jCoVdAZ+gzoka+MkadwPV9G0vYdgdJvne0UlUNieheWf6PIl6vnEZd0akSrjzn15zYE
         X2q56Nsyxs4URFQi8FNG5eFpURfBRWlntM7ODx0Zhs2W03EkDueYwPdCkasmPyCjLTuI
         9NzGyoqYbx84VH7msO3/qSruzImsnsMSbgXGpTC1MbE7Z3pXs9zvnDohdjUF/WYlWX9R
         3HQXv7KJLXAJxPBTIyKGDPZFQupYJLHEjwuuuqLs7aZ/NI0U3AkRHvN8udNZXZVOcYKt
         Vazg==
X-Forwarded-Encrypted: i=1; AHgh+RrL+mGQ+3Wm0VX495jNouhUNlT0Lea/dRoK+vtol0QEsFbPkn6bk9L4DZ8CvEi8ujpiEfzo1QEIQ7QWrXzaPl8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs2h4mbgxrYZ/YP8uj9eDsA88qKd7AXlSB3h1b4rphyKmsPV6R
	mAL2IErzxe0XcZ3ZnALsnrAhTIDJhoR8IRmjm32sZgd9suc4LlDlLwSvZ+bi+8xLv5klj3mhZ8h
	im9OU0PzZQS8MEPRCU0NHGoK+wCDZkJ5kCVhqRcpYWvFNBj+0qpYTZIh6
X-Gm-Gg: AR+sD12jx904Xs8T4EgGdeQ4jvr2cVf1dbe0tnuCjDOJiMWemrCjR2KppxMxbHrV+RC
	NbpX1LX3yu0HJfRQItgICu89Jm8XPee+zDQuibZCfUdZusd1cHvn/4Ax3UfGlo4CJ+gLJxOCZhu
	s5cK7LK4bYWw/dGh5wjAT0ECi5szonx42E5lp8/Aa1Fp9NMhStB9+nk3JqqRSKjsWnnqiybxm3M
	syWpgLU+Ld0HeFPuaEANzzuhDnSXE7j8t9e7ONmdl2sUZgOVEbStklrNjMO30RK8K2z/M2jsckE
	lPRCWBNMl/B4r/GYMSagFgeHuic/wnPunCyBCa0/0Hio
X-Received: by 2002:a17:90a:ec90:b0:38e:2860:253f with SMTP id
 98e67ed59e1d1-392ec53e6c1mr6200831a91.12.1786474518666; Tue, 11 Aug 2026
 11:55:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0-v3-76f117ad04f1+28a90-mlx5st_jgg@nvidia.com> <20260805183702.GA72896@nvidia.com>
In-Reply-To: <20260805183702.GA72896@nvidia.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 11 Aug 2026 11:54:50 -0700
X-Gm-Features: AUfX_mzn4PfVgkS4FrNbhoBz42phR-uhV7z36r-0P3XLSgGGUO-8rzrUFVLpZk0
Message-ID: <CALzav=f5oUW+B9RvOyaRGtG=6CX_4g-2Di+obFZ4O6B-chZtAQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] mlx5 support for VFIO self test
To: jgg@ziepe.ca
Cc: Alex Williamson <alex@shazbot.org>, Justin Stitt <justinstitt@google.com>, kvm@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-rdma@vger.kernel.org, llvm@lists.linux.dev, 
	Mark Bloch <mbloch@nvidia.com>, Bill Wendling <morbo@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, netdev@vger.kernel.org, 
	Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <shuah@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 11:39=E2=80=AFAM <jgg@ziepe.ca> wrote:
>
> On Thu, Jul 16, 2026 at 02:03:16PM -0300, Jason Gunthorpe wrote:
> > Add an mlx5 driver to VFIO self test. This is largely a remix of the
> > existing VFIO mlx5 driver in rdma-core. It uses an RDMA loopback QP
> > to issue RDMA WRITE operations which effectively perform memory
> > copies using DMA. Since mlx5 has a stable programming ABI this
> > should work on devices from CX5 to current HW. The device FW must
> > support the QP loopback configuration.
>
> David I was going to respin this to fix the minor nits, do you have
> any more feedback or are we good to merge it ?

Sorry for the delay. This has been on my to-do list, but it keeps
getting preempted.

I will do a pass through it today and make sure there's nothing else
needed in the respin.
