Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E285B3D25C5
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 21:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783634286; cv=none; b=q+R4g3+gvZ5CpRZ4Zspi+lDZTwyiyKoJ31HaDMvetjj44/ZxxuizqbPgFL2Axvav0M5PjI9enqcc2TBDv96GoICx3GsvWUN3uCzH73mxK7OowNej2M5ezeHmiS80BZlUbYbyIWyr6avArifaCy55eLk44vW/1EsWK2ARS8twxA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783634286; c=relaxed/simple;
	bh=C6+QVbKbywsT2lvtAVnXRM7Y/Q3xo1OzIYQ065Ab/+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fstm18OvvMxBWtS3/GhQr4mA14DivCwUJarH2S7WNcs0d4AQ6MLnG7PKhcQ9nEda1NSeiHIWGjdvkRUGEGsq77Hk3OKq4IA+B1eUkQYI4njHwYJK65MZsqvi60wuf0QHdi3IpXWUgFsds3sSsXGHxrtw33towXfU0i1SH3PhCpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=m3QKUTQ1; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="m3QKUTQ1"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51bfad59921so1777761cf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 14:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783634284; x=1784239084; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rIyfo2VEcxlnkeMECDcWCS4lIF+QfUGCzzimsolaQ9k=;
        b=m3QKUTQ1C5zbX/YpijBIQfKsHGZo+U6y/OV0TwRPisnkmezn6c2BxvvNsyC1cUd5uK
         GChlQIbqGp06MpBOpgY/qP4CSt4tiWzxHSYarYdghDqihf12QtkdHqY+7Tc2Sq2/GW/u
         ECNLCcbyf3olv+xfZeUBIsDp0KJIXnJWos3syNx7VzISIPu+Z6hhKMbi3ndDEz90IH95
         zr6qa0cwwS8R27MsLMMeW9L7Sb2gny+Lnv0oG5RWWUgjdnMAURbOXtCv9Ni0AAZZfh1r
         lRaWdiURFPgRAYDsZ7isZ/GYeH9THrS4FBIG10b7ZqclkvkbRm33AIuqpoIujUAMO/iB
         se6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783634284; x=1784239084;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rIyfo2VEcxlnkeMECDcWCS4lIF+QfUGCzzimsolaQ9k=;
        b=LSV5qKDDRONxClHCyDw3csosUjVSVLt892D1kk2024x1m+3M8Sx0WuATACsz72yNFC
         Po82pD6oi0JGbh3et6a3ARDeVHDR0OuRgx9Qx1gqCjw8ocarQ4dNTdsFX8GI+XHvgXUf
         /Z9zY9ONPwK3+Z0isSG+KzrjOuXJXmrQRVMDmwxBN8abdBhVGYN8jjzLbAFj/OEKtjnz
         NM4+qDQvEzIQPwzbtPl66ZQP7rM2LD6xW2Twe7cIycZDC65Tt0sdWeYEloLKWbiuUhCL
         109Bd/U8zOfPoP5MewsDylhFNOzDFwG5wn6Mv5qP9QOqKFGIztLI71uRt6LOehZDK6nR
         sg8Q==
X-Forwarded-Encrypted: i=1; AHgh+RpaLujiycIt80sUq9zeeu/CXOZ8XLG0M0l2Oq0ts7jKT0s8pMeYhamy2DUyOiFNw/RGXDPJKAKLyJX/J03/T/4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp6mc1nG4wSXlL7DDs7BS26CNHck8mR4wzaIfkKd8t0nod5Ol/
	hn74AMbia2Gl6pMFAXOaZJPs7EITHqKgTa5SJWi9baeU1OAlbprExwFF2oJHtBeZ8Fk=
X-Gm-Gg: AfdE7ckaxXAFDuR0lIKK0uAl5ag91pq5HUnBWOfpGqTNmRh1PbRn+MV1UGP3MnzUyPv
	rM3fFCVWIVT9G5Y8IvpdLXmtgIRN1ouIFjFTAuw3ESL+JjKfMyZHvjunjLEufn4ED3gHIVjrYe+
	HTKZ3TFons/iarfzK3sznJehZDXCVnw01eRrOfeAza0LN0h5Xhx0Ypql7f9tK1zp45FZIKCHRlZ
	SfxgNuu0Y6rtll/CNMGeW2eJ8ypXanLjShIAvh6JKvSIlG7iUsI2MbJtqYDQ6LwWCLEFFnOBPp5
	t8HEX5F3nDQ3gTJVViatpmwjq1Rsbdf665u1aM8d79cUCVqbBFAl+CwlXnGXDSTngkOgV3QVUSw
	UyEkqtyaMPMMCsgiRYrppjfGRHWk8peG3Xe54q3NTnqP6pB3mlRRTlD3JACpLkThGoJ7fhuGIQ1
	tXLlDPmw1D3aDHwasbYUiEdSe/yV6ALNbwJJSOg2LJcJaNkBhob2lvFn9dHdchMkEyctBtHFlNQ
	E0FEqk=
X-Received: by 2002:a05:622a:11d5:b0:516:dff5:68c4 with SMTP id d75a77b69052e-51c8b403cd3mr96830461cf.7.1783634283862;
        Thu, 09 Jul 2026 14:58:03 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caaf9a12csm3563591cf.27.2026.07.09.14.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 14:58:03 -0700 (PDT)
Date: Thu, 9 Jul 2026 17:57:59 -0400
From: Gregory Price <gourry@gourry.net>
To: Dave Jiang <dave.jiang@intel.com>
Cc: linux-mm@kvack.org, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com, david@kernel.org, osalvador@suse.de,
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	djbw@kernel.org, vishal.l.verma@intel.com,
	alison.schofield@intel.com, akpm@linux-foundation.org,
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	shuah@kernel.org, iweiny@kernel.org,
	Smita.KoralahalliChannabasappa@amd.com, apopple@nvidia.com
Subject: Re: [PATCH v6 08/10] dax/kmem: extract hotplug/hotremove helper
 functions
Message-ID: <alAZZzO96_ZltrJV@gourry-fedora-PF4VCD3F>
References: <20260630211842.2252800-1-gourry@gourry.net>
 <20260630211842.2252800-9-gourry@gourry.net>
 <151783f1-c0e4-4c2b-a051-1e6e9c546cae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <151783f1-c0e4-4c2b-a051-1e6e9c546cae@intel.com>

On Thu, Jul 09, 2026 at 02:44:25PM -0700, Dave Jiang wrote:
> 
> > +		 * Set flags appropriate for System RAM.  Leave ..._BUSY clear
> > +		 * so that add_memory() can add a child resource.  Do not
> > +		 * inherit flags from the parent since it may set new flags
> > +		 * unknown to us that will break add_memory() below.
> 
> 'later' instead of 'below'? Comment reflects previous function flow that is no longer the case.
> 
> DJ
> 

ack. will pick it up on the respin

~Gregory
