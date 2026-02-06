Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C522313529
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Feb 2026 23:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770419693; cv=none; b=tZXIOp5WEFTTbEXPlxC+5+KvcjUjKf3O1QsYwoxNujQES7tr/GsTv/pV8reea2qLo3EH+fbZRzRptsePzXDpeawwKpRymUQySJS+zgvnAoelqZSVFNWL4Cc2Qk4eDuA5H3S8iIeZllbguMejHYlK/evg4WExpwpb/GZfzwe6hwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770419693; c=relaxed/simple;
	bh=//lXxvGzvwvRX8TAWjBtg2RwKbUnQc3RJsVA6A3Oyik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bdehFWRwf4HpIebLyKJ4HnxkLX0iI3KQ+1dwMlvs6QfGGVc2psPjVFxATIjQ1P3rH9OgpWoe5Wc7ZrGh8puIHXEBOSQVZkOZVyfDBTlGm/TvsZeGWzSYJCPeLTBfXmzwTnOZ3ZXa6wYo3fnKvaYA3JC6r4ixu17N3dF3rnmsUMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g3tRWC1l; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g3tRWC1l"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c075ec1a58aso946651a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Feb 2026 15:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770419692; x=1771024492; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xORO1Htmm6YxNYM1C9oAOOlxqgAaEPMiLYXG8QXy21k=;
        b=g3tRWC1lBp4G6v57OMNJH/IWhVnKhZkgx/YZiytE6h7F/GblmQyEeomg0JeF945imr
         3DB0TWRGaESQe070W0BWOsUsHHgvWnyNF6EEwR5gbcMaxsCWtsRq1Fe05Wodqe+0qye2
         LBmPBBEaSzUa/6BVN4mGd5ytwg0pv9jYELANMZypZY/N1Rk4NZK0jaWANUovaQTw19Op
         /8LEugHReBQZGwa4owCg//1Vcv3ViHo6xmE5eGqCTRiTfYejf8j7ME+YpxzTkLA9rqSr
         Q2sFeCKKNGRwrLl2prU/fOIUJF/CpaYN2BHv2qZMRrBdGsbsQA9CbV1GnPE3RBNl1TaN
         FKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770419692; x=1771024492;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xORO1Htmm6YxNYM1C9oAOOlxqgAaEPMiLYXG8QXy21k=;
        b=M4ZyQ6sjywuTk3BIuEIaENO4N6Rlr1CQIPuFOJKKff2xY+BUb5ndTuoO234sR+D/dv
         2Zp5w7CyLT2RPPJH48rCJjj1dtNZbVongNH0yXF6VnXKq6QRt1H8mVC32UbABnt8LY6w
         MBBF3HvAEnvK7CQr/uk6bV/GoBPP4gEhfx4qkz/qhGykQK9jwbcgEOm8ZN308IRroOMh
         7SCRy1xzhy0LRf5624FcK/sUtstgnH5D29xj1+IYKtwGxvAXHO0fFEavqaADRM6H8tVs
         TBpczK+VIDMdtivPPhE9/zTewsHxkE7CNw4WiZhgMvLZuMpB0hHE0lVrK6gj7c103Uyi
         1C2g==
X-Forwarded-Encrypted: i=1; AJvYcCV+hEZ83w6BwUGOLiD23Kyhaus2A+VHsDCWRw7m+Jfo93usIGs9NYwX8a9sPyuvI3Oa9Jk8oytdCbx0JF6TnSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4ElE9xncRj1x6tQYUALwqoa8N59LmzzuPtvUAmNFkDJ4tVhB6
	bQ5D+aQne4rCoavm3ej4Bw5ZmP+9Mdg9UABh7QqDUoJdTTVt2vdQqgSMCo5aUl117w==
X-Gm-Gg: AZuq6aKC/UHwrYfU2TRBg8yO7qAs10+2AIqsNZhEZFmlcC+uhGfx3ZVsy87swCfo3Ln
	zPAlAm+ygJ0UgWnV+pC7JmkxVGJBdiOuQtJRi0FbQjn1WTV/dt5So5t/dEeok5MlcGhVD01y1bt
	POF50je7iYBAehy4/CFH/aeQQxcPeU4AOpAQw7cK1T25wq5Pj7RGqaPIDoRpTq44VJtfIHTNLSl
	ycYoUUAYuWTZ93YqeSeJEJIk0a0shtMTnR6TY3w0Iue6VTG5GiqPG08QYvNY54uzkE6SWbFWoVT
	uQr9/yvkOhMxAFZtfXWC81iiDl6qWRhHuQdEhdnIUziYFLhxHZqC24XmUHNenh0Uv666VQFSA3e
	tddNdaTiuNZTS67oFPRj8RqJEkJs99i3NxbQSeZT0nD0eAHBopfZ9qf1Po/1tt4pofmamMnBmUG
	hkDRdKWo+Fk5rExEPNhyOP3TozVzOaoEWQWsi5LMU6b2ofoqX+cw==
X-Received: by 2002:a17:903:3bcb:b0:2a0:c1ed:c8c2 with SMTP id d9443c01a7336-2a95191f76emr38694515ad.55.1770419692202;
        Fri, 06 Feb 2026 15:14:52 -0800 (PST)
Received: from google.com (79.217.168.34.bc.googleusercontent.com. [34.168.217.79])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9521eb87fsm33865195ad.71.2026.02.06.15.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 15:14:51 -0800 (PST)
Date: Fri, 6 Feb 2026 23:14:46 +0000
From: David Matlack <dmatlack@google.com>
To: "Yanjun.Zhu" <yanjun.zhu@linux.dev>
Cc: Alex Williamson <alex@shazbot.org>,
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
	Pranjal Shrivastava <praan@google.com>,
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
Message-ID: <aYZ15u120FEa8Qw2@google.com>
References: <20260129212510.967611-1-dmatlack@google.com>
 <20260129212510.967611-5-dmatlack@google.com>
 <6dc423bd-36e6-4f97-b2b2-c7030575a3a1@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6dc423bd-36e6-4f97-b2b2-c7030575a3a1@linux.dev>

On 2026-02-06 02:37 PM, Yanjun.Zhu wrote:
> On 1/29/26 1:24 PM, David Matlack wrote:

> > +int __init vfio_pci_liveupdate_init(void)
> > +{
> > +	if (!liveupdate_enabled())
> > +		return 0;
> 813 int liveupdate_register_file_handler(struct liveupdate_file_handler *fh)
> 814 {
> 815         struct liveupdate_file_handler *fh_iter;
> 816         int err;
> 817
> 818         if (!liveupdate_enabled())
> 
> 819                 return -EOPNOTSUPP;
> 
> In the function liveupdate_register_file_handler, liveupdate_enabled is also checked.
> as such, it is not necessary to check here?

Yeah that is a bit odd. I see that memfd_luo_init() just checks for
-EOPNOTSUPP. We can do the same thing here.
