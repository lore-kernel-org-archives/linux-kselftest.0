Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D883E8662
	for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 16:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782403968; cv=pass; b=Ni30hAQTD07a1qQPeiVCGERVZ/6NsCzmoZRmLDX8FWvDkIKt98ppfANvhfwTpeW1ylceGakmh1tFN5hTxeJ3ePpP4X/TimVCC4fjb01Shxo0kzuLtOkS6c/POl4D2glgRLA8tiuOSqXEJMJa8WDQnBKnOa4E5pNvQvgfZm6B/CY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782403968; c=relaxed/simple;
	bh=eXt9ABDO783EWacDInE1oNiBLyj1Dhw+23oyO0+eAgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WicJIjoczeHlHITi9RWNfeZyk7bCh7QQRcvQRl3YKegUrNTe0zQgPQGmqpg83RH7anodallQx2jBp7+r0tRFyDgfjga+fWoj/AS3wLsDjFCZ/jkAilX3Yyim5lqaD3JNVFdIm7DAWvD4X59isPM067XyGe0W5T6+UL0a3Nn0Xkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f4DMGztG; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f4DMGztG"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-46e22950091so524360f8f.0
        for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 09:12:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782403964; cv=none;
        d=google.com; s=arc-20260327;
        b=Zg63ZHeQYY8itH1jnGqG9MpWQbB9i0zNApYJML7OkYwabajIdo+cdyQgKzAumhRKGI
         R0zxdxxGraKSguwh7nDpO9HKdfwFFYAXksqax+DI96pBpuaKwb6MVEjzBjkvMdjm4Qlc
         WqDwzJbx9MX4BMNxYzeq5Maf5yRm3Ya8mR1CiWRBwYT7L7Mi4vVb38vRrkKcwL3GiDpZ
         MQUIPW1pth0XVJ9KPBcC/UEQv8zNNXXloqQimAA8L2hrY/vPnNQ77mYQpyI6ecembapo
         DDwmD1dosRQV+YlXLInpJOm/1LU5DstN6DVTklzxqqZXoiK5rIXKEkNDFQislCYxbg0/
         WT7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CUBIaAU4SjeKQvA50OYn7Uvq2LX5djfRwg5zsqpr3iA=;
        fh=LW3WoAuI4kui4YltwJqE1KYwLOJ0W4uYf79PpZVpf2Y=;
        b=WocXi3xavi4a8CGYaV6vMk1075WJE2ZZrxJ96iP6XPOtz7qsyWlcqWSF0UbZXaAOYh
         ryMsDirtN1uEM3bJ5HY8gYe3FGmSAhs3d+l4QJGOdvMRa2FXc/J3gyf02EzcEn0P3qwp
         htcvSWc1SPdhB+enuNYxCOehFW8lN4jCR3Q34ahuldJ6yT/RATnFehJjK+IsYaZ4hliV
         seHSjVuFCtN5A1mgrrafGlvLGe4OUUno4L47u12K5Rck0L10hIVRMMmG2UgRrbfsOcCq
         zNXmJwMhfHGhXU8pyaMd01VE600uhD9fp/LHW1rMz4hgkGots5H7BuUTaR87iwHTBomD
         Hmqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782403964; x=1783008764; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUBIaAU4SjeKQvA50OYn7Uvq2LX5djfRwg5zsqpr3iA=;
        b=f4DMGztGMthA12Y49u2OIH/xR/gEfBSbRh+LVXv1O/l1HruR+NNt0r3m71HxstJwGX
         qkZ+sgvkP2zGpb6G7Uy7eHYVBvui3N5iq9K24cViZ8d6NJ0M797yjVtpYS7aZSHAsOLj
         xJZ5CPW8spTde0D2ScucCtwhC1MICHJwHpDD9wzxCajZcTJW49XaR0N4LL9tLJr9d5/g
         Idlll1HHleiIdznevqRuJT8bGq41lG0twhJAgG70D7yo9DSfi/TCvpHb0Dx2O19GlrSJ
         rE1266ycoNTUBlvzDfeqNHgGvtz3zsYFTPf/n4NnaUaFeF8haaUm1EKB7buGJ/nHb2AE
         xy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782403964; x=1783008764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CUBIaAU4SjeKQvA50OYn7Uvq2LX5djfRwg5zsqpr3iA=;
        b=mJ2devyEelImTysu9nPCPz8g0KxJzo/AzWgFGCafPUqHUcJ3GVGenQ87F8b49R1UVb
         lP4cM7fzYq9U2J8fdm1GzKQRImWWSx9IY7JySI8nbvjoi3IbwcFD/wBF7cmIsZ0CeR9M
         EoWLdJFU9hBlnJdS3u9Ec8TiiKqe+ae1jVfbaE/FBBidv2tKiR5VbZTcRUkzi2B6gMcL
         ndfTQYtcFhuQLlUCjrxA6mE9KH03MNr3317Vzg0ibm/eUAr4VnZB5C9cHzU9isNjHJoT
         jADV7tneoSiYVtzTsDZQ038zF25Z+tZDK7TNxL4Xa/2KFIhwoFobVZK8icA7CfNj4gOh
         iJIw==
X-Forwarded-Encrypted: i=1; AHgh+Rra1BiVW+FW7GiOjjE47eC2XXbMcW0t22OrhU2ABjkAHSCa3OvQ3cNaAdoAZrj2CHMOJIBfisGBKg3r0C133N8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzscEiLsc1g3C9lxK96qfLiL70wPOkqw2qb986KNIA6eCAwXVT6
	Y6vv2Z2nWcb5FLEDF+0oaatpgHhr7pW/TEONTzSMRpv3E6QnUobrsKqAEF1uNWIkWTQRmUroTi3
	yRRll1A/KFqQIIC8be3+4C/yaH9zs3sw=
X-Gm-Gg: AfdE7clNWZtsqG8VPh4i0v2+jyDpRBxmN+YNMYjglUXe2P69p4EPFesm7RKenzO4c/8
	ZXPP8N7jYmwEL8fPFikdQCjaYb37ZHMiagyI1hPFlYkezuDVB+PsIKw8IMgNErwhtO6IxxmJmyB
	+wFnDCy+Up0f+LCLLfTNRd7FgfG+2oY9o91Uibf4SFH3uSgudPE0fCn6srSvgOAhUeQd72OMOHt
	NNBDX1DQAKYU78/PKYTIbpM6W9k+ZUgG9tLBgi29TI8IZlQy2ID4nAJjLDvThQRSwrTagKH4y7A
	xeE23DfXT5N3i+O1xWz+eHl0A6iY
X-Received: by 2002:adf:e011:0:20b0:46e:6210:ad4a with SMTP id
 ffacd0b85a97d-46e6210ae29mr1543499f8f.5.1782403963978; Thu, 25 Jun 2026
 09:12:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623111533.2285005-1-ptikhomirov@virtuozzo.com>
 <20260623111533.2285005-3-ptikhomirov@virtuozzo.com> <CAKEwX=OaKTfNqzwa=djLxZDeBbR1+DKdqDnxdfPfZFKB-K+ECA@mail.gmail.com>
 <c390081b-7b2e-4b83-9bca-5f93eec6a939@virtuozzo.com> <CAOQ4uxhPROaeEyYceKNsL5QVwVPkTjGtbRr1P_TYXTA0fHvRoA@mail.gmail.com>
 <CAKEwX=MedyK8aDM=oe=Hbzo77mJOEp0Pmo0u8N4HhvikosVbSw@mail.gmail.com> <aj0ku26XNT7Xc8x9@casper.infradead.org>
In-Reply-To: <aj0ku26XNT7Xc8x9@casper.infradead.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 25 Jun 2026 09:12:32 -0700
X-Gm-Features: AVVi8CclkB7MBq3wqVoG0kXa1O_Tzai8KiVnn_7BdwN2N3gQweVrg3KGSb5MSwk
Message-ID: <CAKEwX=OAg4VzZ6UA0BFOhnkz9EYNF2H1FHsEAkfFZObcbc4dFQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] ovl: support cachestat() syscall on overlayfs files
To: Matthew Wilcox <willy@infradead.org>
Cc: Amir Goldstein <amir73il@gmail.com>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Shuah Khan <shuah@kernel.org>, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 5:53=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Wed, Jun 24, 2026 at 12:06:54PM -0700, Nhat Pham wrote:
> > I'm more concerned with undocumented/unexpected behavior (error type
> > in this case). -EIO was an example that I saw in ovl_real_file()
> > itself, but I'm not familiar enough with overlayfs to know if that's
> > the extent of it.
> >
> > But I'm OK with just updating the documentation with a simple note
> > that other error maybe propagated from the underlying fs, if no one
> > else thinks it's a problem :)
>
> That's ALWAYS true.  POSIX even says so explicitly in section 2.3:
>
>   Implementations may support additional errors not included in this list=
,
>   may generate errors included in this list under circumstances other
>   than those described here, or may contain extensions or limitations
>   that prevent some errors from occurring.
>
> We don't generally bother to document that pretty much every syscall may
> return -ENOMEM if it can't allocate memory.  That's just ... expected.
> open(2) documents the possibility, but read(2) doesn't.  I think it's
> the same for EIO.  Any operation which accesses storage can return -EIO.

Ah I see! Admittedly, I'm not aware with this POSIX detail. Thanks for
the clarifications and pointers, Matthew!

In that case, I have no further comments on this patch, and defer to
overlayfs and fs folks for FS-specific correctness.

Reviewed-by: Nhat Pham <nphamcs@gmail.com>
