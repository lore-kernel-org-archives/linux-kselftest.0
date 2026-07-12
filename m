Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385943A5E97
	for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 13:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783862842; cv=none; b=XpgwUwjjysw754TgVZFn/dcSWX75kyf6QjLJ159T/QVgGVI46zfS1oU5AC7ICZ4hFIfSxcEJECp19GacyNJtvTOkxFPTbkUfxGQOIz7MTF5yeBqqmVzp0GCVXD/Z9XqjftXATCXqRKMBaJUAyAy7JQTBxZart0HEsBrPxLweTBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783862842; c=relaxed/simple;
	bh=C1OxfgN3DhSdqYDbXsPTR7ElZOA1GuCHr6TwBj4Hxbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWY4083nBvBDkPaqZ9R8TJgWzoykNC2RjYSLIC2nhKULD7TXDx/4yQ/i2uqO0A2q5QtOvyILcNrnmCgGj1AGdiLoOhdCn/cBLrwuwn+qsB0JFWC+yU82xgaOLgul8MSSHZEunPWBz8/0LtYQJCRNInk/jdxknPsJBOBrZg5CbRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=UhNOdRPP; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="UhNOdRPP"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c01089e8aso13164711cf.2
        for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 06:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783862840; x=1784467640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uSgtWeg1aBZ0AWclvm9S4U5A86HaOMNd5qnnD7jgo3w=;
        b=UhNOdRPPes1AjVpnpDLyHjcwmHmeTXORQ9ykz9EtNpHRcEVM8fI/I9WwlFXVfk2EAS
         CqGEX1JwRUWzatPmuMajhwa73aspeM7Ie+NjdeLThhJNFSVNCJRbjQKwx2Jt8Eg7Tggx
         gGT3vRGnKv0g3kTxOHB496p3h0PpwCrJ2lDQrSe851qTsG5oGZxevLZmA4RbrzPFavaT
         F4Fb7XhpYvjvjHwPop71GutKDR2ocWAsDOnTN5Oqdagmf6o09saR/jwNFWFnXOuDC4JA
         IKSylRfxUNcfXysZjmkpbh81XhpUEthvPEIS7jCsxwBfTyrs/ggD/3eRdZXnaPN0Bi67
         gDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783862840; x=1784467640;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uSgtWeg1aBZ0AWclvm9S4U5A86HaOMNd5qnnD7jgo3w=;
        b=KaFglJzZQG/wiTd1Z8AkXLJ5gMek1NJFx2NTlPSFrZZLQ3seAsDn4PvQEB5gspv53J
         bYuL+PrsHJUUKV09WlItZm4Y+kHTMOktM/LXUjZjt1i2LzMo7Invm2r15Z0O/9H0FNzQ
         /morUVrCh4iMS1c/agNRelIims7und1FeTSdwCJOBymkEpYg3JUk7Cv936FvMq+DFZr2
         RXeBseKcAWWXzY+mBBLRRD53URavP7tnbOpuCeBvKkw6sHjOae4IyHX8uTnEoipGEdz+
         2ViI0F54NWexdznVHoWBwE7VJfLRLHsw8i+NzrEoRQkWAtXQEp2S+uxTHM69zylK7KHc
         Sb8Q==
X-Forwarded-Encrypted: i=1; AHgh+RqZWzeM3RtWkOi/lSYqYTEdOwbToyBFPNSAOHzVl4P05nkasejp9yH2dt+sr+gWsDuhgRiUhkjhctlBH3T/p7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAF4wOOZRQZo3MKrGI85u8puUfSQW3vjHXMHMJp7BkhWxOefXF
	Mof0LwNVIzk5YM/7X/bnqjL/ApRziQsApJkVTzNhTncyFaw4WjP8rqabPY6hCeD/y6k=
X-Gm-Gg: AfdE7cmWWHLhC9NlFBUpQ3UJacQbJybZiZ8lSoYsG9R5tP9Sclk2ECEKcBKJD6N6cfr
	y7cVLyHeM3xcC9/adeCGwe83deeF+72HhRKsfwj2sejfAIir4kG9r0Eg3PZ8uXqu0GYGdK1b8sq
	WWS6tylN/kIUIVOgVyY76bDqA5xHJeFaGCR9g+8kB6L1CquZFxsEeIh8b9Hf0+xKCF1IFFf7V+y
	BGcEZRBI8C1zzrG1Mmf93lKjbi7XroYy9h/sQlQfOZf+L1pWyCVIOAzeH3YUL5Pupms+5TudcCO
	O5Zn0Iqk6Xauk49RcCREAm77NSVVNwxHjyJLSFOau9BZKD45dI1y/f9lVWIy4UmGjXL7lgT+UZC
	mCDzM/U4tf8qTZ2KhE9acv/YTz6ZHfGAwAbc2Sf9BCmsOHFYnQsa6w82m3p8USn689gzd0A89M/
	fuC52q6RRYG3ZaWhBdJ1tIitPWNaUbma9FVtdLnmafuNL/yIWt1oAefyTTdf1SepsW5MsL
X-Received: by 2002:ac8:5a47:0:b0:51a:8c99:1f18 with SMTP id d75a77b69052e-51cbf281a2bmr56325921cf.71.1783862840152;
        Sun, 12 Jul 2026 06:27:20 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caab6e9f4sm64833651cf.2.2026.07.12.06.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 06:27:19 -0700 (PDT)
Date: Sun, 12 Jul 2026 09:27:14 -0400
From: Gregory Price <gourry@gourry.net>
To: "Dan Williams (nvidia)" <djbw@kernel.org>
Cc: linux-mm@kvack.org, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com, david@kernel.org, osalvador@suse.de,
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	vishal.l.verma@intel.com, dave.jiang@intel.com,
	alison.schofield@intel.com, akpm@linux-foundation.org,
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	shuah@kernel.org, iweiny@kernel.org,
	Smita.KoralahalliChannabasappa@amd.com, apopple@nvidia.com
Subject: Re: [PATCH v6 07/10] dax: plumb hotplug online_type through dax
Message-ID: <alOWMnIBleLQBBke@gourry-fedora-PF4VCD3F>
References: <20260630211842.2252800-1-gourry@gourry.net>
 <20260630211842.2252800-8-gourry@gourry.net>
 <6a5016bf71df4_3b7ee5100b3@djbw-dev.notmuch>
 <alAb7Q_Ku5dVRKZ7@gourry-fedora-PF4VCD3F>
 <alBLJoM86ujz5Fg1@gourry-fedora-PF4VCD3F>
 <6a51920acece6_35cf3310061@djbw-dev.notmuch>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a51920acece6_35cf3310061@djbw-dev.notmuch>

On Fri, Jul 10, 2026 at 05:44:58PM -0700, Dan Williams (nvidia) wrote:
> Gregory Price wrote:
> > On Thu, Jul 09, 2026 at 06:08:45PM -0400, Gregory Price wrote:
> > > On Thu, Jul 09, 2026 at 02:46:39PM -0700, Dan Williams (nvidia) wrote:
> > > 
> > > This was more a matter of having the DEFAULT set consistently across
> > > the dax driver variant probe() functions to make the behavior explicit.
> > > I didn't want an un-set value bug to creep in here somehow.
> > > 
> > > Happy to drop them if you think that's unneeded.
> > > 
> > 
> > Ah
> > 
> > Not setting the value in each of those places is equivalent to setting
> > MMOP_OFFLINE (0), so better to just set DEFAULT regardless.
> > 
> > So unless you have strong feelings i will keep them as-is.
> 
> Right, the mild feelings are only coming from the changelog mismatch
> which says "Oh no, device-dax drivers can not specify their online type
> besides the default" and all this series does is keep the status quo.
> 
> That can be had by just having unconditional:
> 
>      online_type = mhp_get_default_online_type();
> 
> ...in dev_dax_kmem_probe() and get rid of dev_dax->online_type until the
> first user arrives. If you are respinning the series and that patch
> drops, yay. If not, oh well.

Oh, it took me a second, I see what you're saying better.

I can drop .online type and follow up with the .online_type + CXL build
time patch as a separate series as you suggest.  Keeps this series
clean.

~Gregory
