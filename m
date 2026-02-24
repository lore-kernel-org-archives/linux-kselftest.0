Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA54374171
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 09:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771927148; cv=none; b=JZDdmbzQjkrrw96s0y8L7+vTuAmFoPuY8XLbulJ+pqRp7CH8UliNi6/qWnz4iX53saKnnV1HM515zco+boVzn+6gwza/YjYBUz+dJlCbm/lzdbSUTNX/0zN34PIoaaiUa8OxpIBlO3d9oyemwBg47MtzI+mZQheito4csprMd/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771927148; c=relaxed/simple;
	bh=cYr0xUn2xpNr3LTiRgwKnDqbAR7IqxyWqSNGui5urxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WrIfyCScWUcVt4PZHtdm31HgNj8NlWugks7dpJHAUHFO0ngkrUkyWVh6aKUTjWiuPnMc1vNrEeCw/+r8OVIzSf9iO6n1HWkdH2s0A5JDUkNDKxVJMTh/biMqOlCoy+VM89fMd23iVm1GV9IVN8wlbVwoAHtFw6+9S6FENc2yVlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uCUyw9Al; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uCUyw9Al"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ada9e4ea32so41695ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 01:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771927145; x=1772531945; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eblwuyUmTR+DmwKKXt5BlH8l1BOeREzivs7XkohPLYU=;
        b=uCUyw9AlNwbRuefdrpUdTPOvI0KUShaOZjAi7J5omIczWc8043+ENP0tCQNs1txptr
         y2SwDWgW1a+2ql/GvKM+vPj67HhE7FwMXWzdDL0iPK61tIQE2j0ecqhKy/2nigz6bifF
         1jG3mGs365+IfLNiqm26WlB45gmRxGnMOMksatYvwkc1g3gJLti1Zh9t01CuilIFwbll
         1TgM61cfNydIcqELmjZlSSyNol8WsKYCT58Uik8kxkR2a68cq8hsrQGEqT1Svp7yhmzc
         jDDsPJlX7gu+BssVVgHwqU0DGqQ9FvlhZz29o0ii1/ZxY7ZMUU9XapbwWY76J1slcqGQ
         iL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771927145; x=1772531945;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eblwuyUmTR+DmwKKXt5BlH8l1BOeREzivs7XkohPLYU=;
        b=rkxoHQn/VmnmDdmW1Ez+9v91smg+NU3TnuTa8mVbIUfMvzzVbZ51Mr5prTSVh9Ehrb
         EqOCbxZGoOMjzncXDW4n0XndtrFkyZONRLoveGFmhHRER5B8pm/4n+YpFsdBvYYj2hfq
         DSZTF73xMEuRF5FpHqbr75BmH/epUxm/hw9pCrxsc7EboFy/Ae7ibhBeBirRVwVxEbr9
         K8jM/LnlCGoCXBEca1+Wy8Iu0lrTkVC9LDzGLnM8xnXGubtskZiSWT+0nQ5rYozreM60
         vu+shdXThKne/vsiHKnUA9PATOzGicCjTwwPZv9eHm46Scdgt+sPsMTGG5MIdj5qsZLY
         Is5w==
X-Forwarded-Encrypted: i=1; AJvYcCVQEung0PMspjvHHwgW1Uql2z1VH1wx9ph9c3viFGnqgFwqWnzq/yhFTxKdkRMcpIx6POEgCCmzzEZbD58UVk4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtLgeBABGcWC5vv+ZK8ts5ZK0kqfkpxGP5Cqa55So1uh1JZxKr
	gLQH5pnaaSAeren/cDKx7kVTPSkCxvz2J2SjwTYd0w3V3osFiNHRqKuCDblu0Aq/wQ==
X-Gm-Gg: ATEYQzxhX8NXtqAtacYO67NxgUGCFCE1VUM+9GKq+Q2lMSrpclDdW/pHJPVmWswbvH2
	KsJz+yNrTPBy9qUFq3dYir4C7GPZc4zF00P3pCLWeRJnlh3Sf4P3IdCQZrUT2Xd1xnWoaM3RLme
	EoY++fkGqLfO7SLZbJil9rmGBLJ5ePL2mZ4j64TDWPiIVn6PWTEUWbdk4ghif//awzCHdTFBdPW
	C/OZFvPtRKSUpwF6e+qdhU0A6Shk35NRbWCkyh2NNFwiPjXS+b1c13gv/anSk1VeTHGnYxTqNfA
	EaFFKwdduUwoG12bkMexehxTboKCnsAi+u25c1jFqnVd6bnu6+uJHeSCLONwVVYlL7SkFMmgu8M
	lFDYNppsUIUWzpkf3ZPrDM6KlICpSyJRq0JMc4rp18N9hlXjtQjaYi6dtyBZiJx0XKJvMAxxBla
	X9cqRp3I5G54zFHiwAyp6gjwD/7fIllIgE0FUpZXJzPO+iHF68QhMRoFUzK8IQvtRizO3atfU=
X-Received: by 2002:a17:902:ec89:b0:2a9:5ef5:399b with SMTP id d9443c01a7336-2ada3497c30mr1333915ad.19.1771927145136;
        Tue, 24 Feb 2026 01:59:05 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd47c737sm9949341b3a.0.2026.02.24.01.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 01:59:04 -0800 (PST)
Date: Tue, 24 Feb 2026 09:58:55 +0000
From: Pranjal Shrivastava <praan@google.com>
To: David Matlack <dmatlack@google.com>
Cc: "Yanjun.Zhu" <yanjun.zhu@linux.dev>, Alex Williamson <alex@shazbot.org>,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>,
	Alistair Popple <apopple@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>,
	Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org,
	kvm@vger.kernel.org, Leon Romanovsky <leon@kernel.org>,
	Leon Romanovsky <leonro@nvidia.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	Lukas Wunner <lukas@wunner.de>,
	=?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Tomita Moeko <tomitamoeko@gmail.com>,
	Vipin Sharma <vipinsh@google.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v2 04/22] vfio/pci: Register a file handler with Live
 Update Orchestrator
Message-ID: <aZ12X3tGn3W7YP4I@google.com>
References: <20260129212510.967611-1-dmatlack@google.com>
 <20260129212510.967611-5-dmatlack@google.com>
 <6dc423bd-36e6-4f97-b2b2-c7030575a3a1@linux.dev>
 <aYZ15u120FEa8Qw2@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aYZ15u120FEa8Qw2@google.com>

On Fri, Feb 06, 2026 at 11:14:46PM +0000, David Matlack wrote:
> On 2026-02-06 02:37 PM, Yanjun.Zhu wrote:
> > On 1/29/26 1:24 PM, David Matlack wrote:
> 
> > > +int __init vfio_pci_liveupdate_init(void)
> > > +{
> > > +	if (!liveupdate_enabled())
> > > +		return 0;
> > 813 int liveupdate_register_file_handler(struct liveupdate_file_handler *fh)
> > 814 {
> > 815         struct liveupdate_file_handler *fh_iter;
> > 816         int err;
> > 817
> > 818         if (!liveupdate_enabled())
> > 
> > 819                 return -EOPNOTSUPP;
> > 
> > In the function liveupdate_register_file_handler, liveupdate_enabled is also checked.
> > as such, it is not necessary to check here?
> 
> Yeah that is a bit odd. I see that memfd_luo_init() just checks for
> -EOPNOTSUPP. We can do the same thing here.

If we move to checking the return value for -EOPNOTSUPP, we should
ensure the pattern is consistent for the upcoming PCI registration in
Patch 7 as well. With this addressed:

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
