Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0AD3A7D98
	for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 21:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781647157; cv=none; b=e6KhDHKNqfX7wy2fzZyeEHF9EuPixcBBwhnN6M9zo0CsgtXBcP66UFkz/e5Y6olWtFDDp7XbJMOnp5ZeefUMhpvX7OiYtO51qYCmvoJ+0AUy4kgSe5FfoBoZIn/adtO/DBSrbNMUFzR3GCe7nGxrl8wWdlIkj6THml7vdPoeupc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781647157; c=relaxed/simple;
	bh=58cyZl1Q9XyXkuIUxJ6+57jGmD385jOekL0np4r18sM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L8WdiAPwSfRfktzgSRdS6yXdvmGs9uYFMy/edUO4n/RHryjCot+/VTcZMsFHt6mNalHE5r0zYxVFK1J8nsOZ2acEypktbPdmXHPS92wphYY5F6CA+OtfMY6gqW8+QAPhGNGtm7mCIF42/JWZNUw9bBrqoC/JKQixISL5kfkW3Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnEJl5QF; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnEJl5QF"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7e6dcad6018so4378550a34.3
        for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 14:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781647155; x=1782251955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MdIhJ92yHcSeuARKRFApaFACq6jQgJFrqu8oVo70t/I=;
        b=fnEJl5QF+ZIcJxd9zQ+yLswpDGoY7uHw66oSfVeo+pSpzteG1IKD8NvUxqUL1l+ej2
         7pOR2DZlh5MJw/JwHPXUDFG5+65eemTJOtpI50VURJqGROV+mZrfTR9H5+3LOqZG8EHF
         wap2jT9CYEZuDY1DGqoIl7EUya3e3JiQRaw6lUOB2dJUgZIgzGWLd8RhkQrCZMlttOBM
         /Umxy9ByDtyy9OcfFATbMqaG4I0eAx85gWchkN78iunmuZ374JRZ1k9KFcePvjDN55m6
         2EQBCoMmx/eseBtVt2GIByTBmpTtAtUr+hHKUUR1pj1nb+5rqDVDUv/HNLGBpQDxVsmQ
         O+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781647155; x=1782251955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MdIhJ92yHcSeuARKRFApaFACq6jQgJFrqu8oVo70t/I=;
        b=bzFytDtRzi7Qx9H7UyB15MU5heAlumrwUM7Qp7NVUVohnnXukLyB+j+TG9EjX/kedK
         3LzOhgMN4jstB9flCJWUR2gMB/D/e9lVfkVe4MGitSG9c6E7ytmT7e/EXWAh/Klsp/Sd
         gcDlihJtwmmOvEq73meEIIdYpnjkjhbba0nQ9tahOnQY0/mqYHO0SoYJiJtvp8CNTW+c
         GIHlTlrHndmEy8bHJnpUEdBh5pCG3GmynSfLaNqXUYhXq5rdG2rfys9xBFpOoxupQmLw
         5ElqreoNESsP540Jlx+vlXxRT1JnO+VRBSgkPUYprb47uP0Zi/QeyMoBzd/1V6J+ulBy
         h5+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+SFDxPhyaM8H9TmYALloPPtdN8VfrBXMR+cOoiTkH9DIK43aB3EsmBc8sWUHmd6PIlYhlutEyNd+fMDA19pbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXBKcN47viud18bMy6QvhHlAAj9piMwNYGwtXavewAegElUf0q
	1oia0Xkxqj3yYNFMOzoGcmgeHMtMSo4F7JnodYpaiBUPLhksvnFwZCYT
X-Gm-Gg: Acq92OGAbTuVn4FSNU39Vmqjabgm2lGrucXcGcWFHESC4/XgjrXjylcUqQbiUzCnuVs
	5udyZibL/p+X6cyelXOi/ymy7x3wkveJWZqfMStrto66Udw4zzeST4N+/aJuxqmv2gYg4HDSYKA
	bst5IUcmk3g9nh2jKRatfpUkgqIDzLfroS4IT4rRQ0koeDvAJg0Xx8p6BiKOAOPsPEqe6Gb9xKR
	sK4zmYpf04qcfEhRcWxGQPlv0K2BgF399ZXQbfdOzcwGDgUudK9vE0IT2SzYZyO0KaplvFTjlQ7
	moEtFNtHrb+8k6uVW14fO4dVRCH5eD4aGhnNW+OvXg2CxASvQB5VnRXZKZgtgZyNb0tp+cTvNH/
	Mnwz2YsemLiQ5djX4X6JMAS8ZpjTF9MsTlNaXsJ+D1zqFkWMS7XVfrRhJ2/QfGiZC7wjB5IIb3a
	Scdf/9tWbzCsIqbLZIFskM9pwxtVVvGLkRbmLRcMyVymqk
X-Received: by 2002:a05:6830:2783:b0:7e7:352:2f74 with SMTP id 46e09a7af769-7e90b43fae5mr1228845a34.13.1781647155303;
        Tue, 16 Jun 2026 14:59:15 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:54::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e7a3c2b08fsm6625336a34.8.2026.06.16.14.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 14:59:14 -0700 (PDT)
Date: Tue, 16 Jun 2026 14:59:09 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Shuah Khan <shuah@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"sdf@fomichev.me" <sdf@fomichev.me>,
	"razor@blackwall.org" <razor@blackwall.org>,
	"daniel@iogearbox.net" <daniel@iogearbox.net>,
	"almasrymina@google.com" <almasrymina@google.com>,
	"matttbe@kernel.org" <matttbe@kernel.org>,
	"skhawaja@google.com" <skhawaja@google.com>,
	"dw@davidwei.uk" <dw@davidwei.uk>,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v2 2/4] udmabuf: emit one sg entry per pinned
 folio
Message-ID: <ajHHLfgY+pZ8AD97@devvm29614.prn0.facebook.com>
References: <20260611-tcpdm-large-niovs-v2-0-ee2bf15e7523@meta.com>
 <20260611-tcpdm-large-niovs-v2-2-ee2bf15e7523@meta.com>
 <IA0PR11MB71852246277F773AC41DAAA3F8E52@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ajG4zaK9zu7qZT1+@devvm29614.prn0.facebook.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajG4zaK9zu7qZT1+@devvm29614.prn0.facebook.com>

On Tue, Jun 16, 2026 at 01:57:49PM -0700, Bobby Eshleman wrote:
> On Tue, Jun 16, 2026 at 06:04:03AM +0000, Kasireddy, Vivek wrote:
> > Adding Jason to this discussion.
> > 
> > Hi Bobby,
> > 
> > > Subject: [PATCH net-next v2 2/4] udmabuf: emit one sg entry per pinned
> > > folio
> > > 
> > > From: Bobby Eshleman <bobbyeshleman@meta.com>
> > > 
> > > get_sg_table() emitted one PAGE_SIZE sg entry per page even when the
> > > underlying folio was larger.
> > > 
> > > Instead, walk folios[] and emit one sg entry per folio. When folios
> > We have recently merged a patch (that will make it into 7.2) from Jason that
> > replaced sg_set_folio() with sg_alloc_table_from_pages() in udmabuf driver:
> > https://gitlab.freedesktop.org/drm/tip/-/commit/5bf888673e0dda5a53220fa0c4956271a46c353c
> > 
> > Since you are relying on sg_set_folio(), the core argument against its usage
> > in udmabuf is that it doesn't work well with offsets > PAGE_SIZE, resulting
> > in a malformed scatterlist. Not sure if this can be fixed easily.
> > 
> > > represent large pages (as is for MFD_HUGETLB), each sg entry is a large
> > > page. Normal PAGE_SIZE sg tables are unchanged.
> > > 
> > > This is helpful for importers like net/core/devmem that expect dmabuf sg
> > IMO, udmabuf needs to detect whether importers can handle segments that
> > are > PAGE_SIZE and set the entries appropriately. Please look into how the
> > GPU drivers and other dmabuf exporters/importers handle this situation, so
> > that we can adopt best practices to address this issue.
> > 
> > Thanks,
> > Vivek
> 
> Hey Vivek,
> 
> It sounds looks like that patch might solve my problem. I'll apply and
> troubleshoot from there.
> 
> Thanks!
> 
> Best,
> Bobby

Good news for me, that patch solves the problem. Thanks for bringing
that up! I can drop my udmabuf patch when I respin the series.

Best,
Bobby
