Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E86F3CAA5D
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 23:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778715188; cv=none; b=csGTfzqRLCDjFMmi1pM5X3kp04i0BayCtvlnKesdHqkw2Is4eaiYsJ/odGZj7ahJBHcAOYE0dMChOt9oRH6LWQUiVGW6beU6n//sDfNxsohOiQYBf6Q2crwc6YDCU/H2Zalzxk/SXSXPYzsK35iYtyvv0wHja690FWwEbaEGCps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778715188; c=relaxed/simple;
	bh=Hq/A3AGR+clgfWZctOXr6BbesstRAudCd0yGsK+Tw3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n1G+e80zdpLbxlFYvPqPOsST5PhctczoM6JLUuUynagIQSd10BCMceMO1D2onWubrJEfJS2Rr4Sd+qMt8wH+ByzmP/9SWK/AejmtjAENq7BpPoJZyIS9GMJCVEm20LdHHQfJBf4h5orUnZu+1d64G5tkXI5/fLb6mJS1OHEUpOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CVX/59pY; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CVX/59pY"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3692bf38290so133597a91.0
        for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 16:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778715186; x=1779319986; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NsiDmjXtYlzjW8kSMiUkwYEAF0x8k/ex7IY8QVm8zJg=;
        b=CVX/59pY+/swuJ+Ri5GGnX84Xd3ro0LlqiWi7VdeZDKbE0XKB05tu+VossYFF2qJAI
         Fm0j38102ih6T4LZs2rO4GB6N9onecxqJ3Ek4p6qAyopQLUyCBCMLzCdsSBVEJ/pGlEl
         Arlz8w12ZaOszXEQ8gebGaraXib+3a4zGTcdjf6oj9wmzA6Ay+M2F3bWX170phcNSH79
         q5l+39wZOrX9J97f2RilUp9pMgWFWlk5m+rKs2uKJzP/NpXF3U2Q4H6SgcjHPruqU5ua
         uUo7esEFrnWiWjDcP7JHpiD90PzcUhSPrZ6zDD/5R6etUlnLZT12dO/w5UwjPiY2Bq+M
         /5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778715186; x=1779319986;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NsiDmjXtYlzjW8kSMiUkwYEAF0x8k/ex7IY8QVm8zJg=;
        b=r0/yr37sbq32b2vxcaFfnyT2f5v/bZeDBnhE7tcOsH2KW1pgv6zGhmVrt9B42bPpQm
         cEoYsTMIHXloeEpkR4ud6+UEvqWhP+4LFEGrjeHsz/MaNHrZjhtM30o0hg58d4dO1OkP
         8stlHvXwHPu+RL6N16Wx15WYLDiBX2HjT/HHS1Pa6vARganBaniJVDhfiafPP2toXLYs
         pzxWdCekzkuxh3PoTDywnzkIJ2w/Pg+ScV6FdNoTWOgqlAfSB9x1Wv1+UIhcCZ40qyaK
         mJ4/LJVYu/AzxFedbv99CZ5O1714fGug74/7V3Dg8tnITFh+dVGO6FcQsVkZtYYywptj
         YM0w==
X-Forwarded-Encrypted: i=1; AFNElJ89SOX9+y2kqeD1OQfpZ5PYNC/5gettDrHNX14kyaW4EsBGvokYzV68YNSB88E/wZ/My7B9iBPo5x7Hj8gAIhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/BtdmU0UfksEcssd+P+krvdaNTr7XcIRrm0nVhJKmoj8h3yN4
	L2zwnMm/JYWVNDMWeegKlF+EeMfusak95CeCZAFJnIbf2OAYcqZ0xZi72m0bOOi8WA==
X-Gm-Gg: Acq92OGXsPyiQPDdGij1gheOeDTnQUcD3blzu61GDiwqq0KOLw6y+FkeRzdwqVOLnpP
	L+deatc78RLCWW32Xk2kyWQH1zBko9W7jYeMcAYku6QlxsHGtOPO6hxYPd8yYpGzT5kHfb2QxOd
	IWBIoqzCj+RllZOu2tn44tAUNn58Wd9FmO4Fj2qcHalQqZCPL3jagyzvltCg2oLsvYO4xa7/2At
	jtF2PGjWLFnm+ok5R1ga6lybfqr7ZHfFdpUiWw0tfrUI2efHRLVTJ8sotzKMXpcKlKNu0q49M6j
	CD+9jVt58Iriu4UgQPNTsplxjuKCGDto/fk+yyfh54d6uiThssXUjlwGIscm3A+H6FandajziPq
	EDb3Qrl83fWzifMhihiSiyhku7yLdfPyOfjnRHRTQc4byeTZE5mj7ROUS0a8pjqE6bfQ8Vg1f3I
	hxzu4bcu+SgQOW9MjQ86IYd+3rD0GC9WjavNzm/IulyMmXz7fWf6enUyPHHd2UUOQ2Edf8MUKM
X-Received: by 2002:a17:90b:3a46:b0:368:ac5f:d313 with SMTP id 98e67ed59e1d1-368f3e7b6e1mr5890966a91.20.1778715186079;
        Wed, 13 May 2026 16:33:06 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb115c38sm336563a12.28.2026.05.13.16.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 16:33:05 -0700 (PDT)
Date: Wed, 13 May 2026 23:33:02 +0000
From: David Matlack <dmatlack@google.com>
To: Josh Hilke <jrhilke@google.com>
Cc: Alex Williamson <alex@shazbot.org>, Vipin Sharma <vipinsh@google.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Shuah Khan <shuah@kernel.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] vfio: selftests: Add driver for IGB QEMU device
Message-ID: <agUKLmKLoV71Hq6S@google.com>
References: <20260511211839.2781731-1-jrhilke@google.com>
 <agJqAO-RRdjMrUZJ@google.com>
 <CAAdrzjtiiOtw7-YL2COgZC-QSFp6LLwq+jP9V3jPKLUe0w7Y0g@mail.gmail.com>
 <CAAdrzjuf3z-CyWeBRPKmMQxmQZ9U=2Tc0cDAFqdRFRDHKw_K-Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAdrzjuf3z-CyWeBRPKmMQxmQZ9U=2Tc0cDAFqdRFRDHKw_K-Q@mail.gmail.com>

On 2026-05-13 11:49 AM, Josh Hilke wrote:
> On Tue, May 12, 2026 at 7:12 PM Josh Hilke <jrhilke@google.com> wrote:
> > On Mon, May 11, 2026 at 4:45 PM David Matlack <dmatlack@google.com> wrote:
> > > On 2026-05-11 09:18 PM, Josh Hilke wrote:

> > > > +     retries = 100;
> > > > +     while (retries-- > 0) {
> > > > +             if (rx->wb.status_error & 1)
> > > > +                     break;
> > > > +             usleep(10);
> > > > +     }
> > >
> > > Why bail after a certain timeout? The test may have kicked off a large
> > > count of memcpys. Is this for error detection?
> >
> > The bailout was intended to detect errors during development.
> > Shouldn't need it anymore. I'll remove it in v2.
> 
> Sorry, I forgot: we need the timeout  to detect DMA errors for the
> memcpy_from_unmapped_iova test in vfio_pci_driver_test. The test
> triggers an IOMMU fault because the IOVA is unmapped, and the IOMMU
> aborts the DMA operation. However, the QEMU IGB implementation does
> not set an error bit, so timing out is our only method for error
> detection.

Hm... that's going to be tricky then. This means we would have to set
the timeout to longer than the longest possible memcpy duration to avoid
false negatives? That means we'll have to set the timeout to quite long.
