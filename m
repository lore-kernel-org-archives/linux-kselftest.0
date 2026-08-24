Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED8141684B
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 13:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787577248; cv=pass; b=oBPyrLKh2w6ehEBaqnRAxGOhAxkUboXJE1pydNhMn5mmwBE/HYNNNlf27GJfK7P3X8UdyeWpJbpC14lwN8LyiKLCgsTC8CBRhP5DZDoDE9PIwaLWJlYo85Hu7GBAcdNt7VRMsYpJYPZLgFfbe5aYkdQTNYFC1TyWO8VM1lzvZwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787577248; c=relaxed/simple;
	bh=CzMHD3unGU/ezDMcqvC3UC+o6FZUdHEIyrpiZIAg+gc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZkufilBPW46sVmg8raSIXYul+CKUMGsn/vB9udN+LhoRNxAYwAAtnrYXNF1FrTQ0sGm8ctep2dE/ICeE80vw0SROp8NM1hJEyVNKTFjGIxs2JRy7iiX9QmlxE/mD3fAJFUuCEY41OeQM9C3WK6i+24JcVBxHQc7RjpxJXjoWs9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=Sw9mhEnD; arc=pass smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="Sw9mhEnD"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e6391b114so248188185a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 06:14:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787577246; cv=none;
        d=google.com; s=arc-20260327;
        b=A90dmVFCnapwwO3orQyMjruXKK49bBCARIJ8NvJhh1/pIOIZUq/417Wf859XmmzA7H
         u96n6bBQacG+Snc2EB77dwd5QtcvB/MR2p7U8Iwc64VguBaUnYShKik9jfp06Co2rhY4
         HcF78AHtk50wCGMvemNhm15Gj1cdb5owjZ85e//pdzS9U56gYvwg0vRsKju4njylAKhg
         sQmj1cWvIrR/ojrDlpDEq439CO7nR23CG1UKWS9fNQxYIJneGCW0mZ3sIVG8EzcsY7Gv
         7vEWULxNBO0EApBZ+6wHs2mr6zMRCE5PtRdkUSmJzvmoUDUceMME2JoAGyqPayhZkMYI
         MXWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qGGLhKIHK8dGCQLwKjMU7h4rFU3X17jfPSxCogOt6Gc=;
        fh=UjzWDF16MpflWgxH8qAAuqaC0uNkULbaUV/cZbrBMK0=;
        b=OS0eAm6uqG62X87CNMxJD5kbpahdbOupT+tEhEdrk3S6+abZdwIX4CsMIg1TflFZ2B
         drJDO+kHGU+OKbsohycVO5afX3hb3Zc4u3de8MYLsTbAIX2ecSDeUii+3kwLKdvz0WVR
         rCuwUc/P7K5+fnqVNSHSuLW8tIafHrDsfMkBRgLCe7/0z2RPMuzaqWeelRXY1t+Nt5Lj
         zCUoxCZa/OPqzkfxasi/GVudw3N7Uzc0GOR+Sd7JszItDlB93ddUvyNh0avFx6ks1elZ
         l7Lm/Tf0EvoVzBaTGSNdkARfPbrI6chFKL+JB1zV87kqXLxDKtkCdfPMPhN0HtqspeSu
         erZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787577246; x=1788182046; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGGLhKIHK8dGCQLwKjMU7h4rFU3X17jfPSxCogOt6Gc=;
        b=Sw9mhEnDyZWu36kIoUXDOx72tKJIemBS9ZRfXZNoGId7Gy2k1H/r8zVLjVdFlZ03AW
         zWBEb3+XI+T+d2OCFWHSIFciryvuMgAEw8kq+qy6XcqOSQbnD+eRCVZ2Kh78Fzs4lQom
         oE2m4O+8iG70yP45hQeW8gl05Hmvm4ILjhF80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787577246; x=1788182046;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qGGLhKIHK8dGCQLwKjMU7h4rFU3X17jfPSxCogOt6Gc=;
        b=iFdxsHfW8Dm9TxSKZO/MRqlNjcMiKgz57Rg3YH6ocvjVabKR6Vt7YQ378BrKmDlTb4
         Ng3CtgEiccWfnaeczYGBJ5FuapxGhddrnzssktuUIGuzmPAPcm2mwhn30i1MzoTxvJTU
         UScFhtkZttbxCSpEKvEmSG5ZAypgwb9hlKUbdLbG0LdJyG8xW1bG+xg/QNCMKRQMuaLr
         mXep/4H1mV1BHggeb1uiWpdQRCUBkR4dt8hjuqeOVXGqGdTALnKdsypA3KIIm7sORv1K
         3kGaPT+VK//dRu/FzK5LEytdOFoZ+s0PEiprvDUDqnlfNjlpp+VAzldcaNn9aW9waAF8
         e2Uw==
X-Forwarded-Encrypted: i=1; AHgh+RoqB3X3T2F72zFcvkf+PRsiOBonwyJ8HZy025rNkAS/V6bonxI0PLEgc3IDprYE+rUObDwEmcLogkFwaYr1zKE=@vger.kernel.org
X-Gm-Message-State: AFuF++nwF450gZVjFw+FlNJ/2xCAnIzpuFJAmCrPwPeE/MYVOAa8EFQW
	dNWouHks/YrRBdm+A69etB7Dt6ChI5Xh0ylpMuEogVY8va6kLF18/KOxKJFzf0OiILbTwnVpjrw
	INiReHHIinG9k8H7FIPdYiOkKujzru7/IfRFqPHsELA==
X-Gm-Gg: AR+sD110KBP7aTi8FsZ7jAQuAggjLdlzRpkpgswxFa0cxjeDL9UOlC72fvbe/aVJH6a
	/zgCzIPW4PMADrNzXBBbzWSssBGrSRuibvVHsxUyPNEBHlHi+3ROFxYnQSjpgPIdJTMjI5IBbQe
	hYcMxjwDqkJj7dgZ32jUbL9XXJhUU5PlZS/ire4wLDnfYY9pTJ8D6Oayf1uuQ9b2fkqQOSywJi9
	qjBp0Z8BErMAJsrE9s9If2AyToIpx1cEDjyAuhHbu0K501iY67pbOjogBd+8QuKWgm7kpBwoB6r
	Xg2/DSq9BoZUmv9e3SEUnLNJQKufWzA0uRGXZ/k8OJ6/Y5Q4SAVghP0wrE/JExjdTZvMmzYTYKG
	sZu4=
X-Received: by 2002:a05:620a:5750:b0:916:10f6:780f with SMTP id
 af79cd13be357-9373953509amr1588246685a.27.1787577245733; Mon, 24 Aug 2026
 06:14:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820123533.190470-1-jamz@amazon.com> <20260820123533.190470-2-jamz@amazon.com>
In-Reply-To: <20260820123533.190470-2-jamz@amazon.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 24 Aug 2026 15:13:54 +0200
X-Gm-Features: AcwNN1X0yMdB_Xw--2TlAcHWFEbPlDL4l3JW0OZo8vrZHgvCHyF1YZDBOHI7mRI
Message-ID: <CAJfpegtZQZ+c+Sz-tm144xKXuwLNTTOSHHbSWULwqQGkREMCHw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] fuse: zero the partial EOF page when extending a file
To: Jimmy Zuber <jamz@amazon.com>
Cc: shuah@kernel.org, fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, jack@suse.com, joannelkoong@gmail.com, 
	bfoster@redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Aug 2026 at 14:36, Jimmy Zuber <jamz@amazon.com> wrote:

> +void fuse_zero_partial_eof_folio(struct inode *inode, loff_t from, loff_t to)
> +{
> +       struct folio *folio;
> +       size_t offset, end;
> +
> +       if (from >= to)
> +               return;
> +
> +       folio = filemap_lock_folio(inode->i_mapping, from >> PAGE_SHIFT);

How about:
truncate_pagecache_range(inode, from, to - 1);
?

The mkclean/mark_dirty magic is only needed by filesystems using
buffer heads, as Jan pointed out.  The other parts of the zeroing are
done by the above helper.

Thanks,
Miklos
