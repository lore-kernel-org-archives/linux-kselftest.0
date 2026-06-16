Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC1C35CB87
	for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 12:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781613623; cv=none; b=fNR5HpzUOOECaufH64XbmJsUZsXgkEaOqeNf7kzgTcj5ATjaGf+DKtWXqSunlLRGwneJQAi9jOYot8p+0avITy0PqpW4G6kdxS/8E3QFh9KOevoW7m5te7s6I7emNa7INeui/937k6bqr906DjlbTp4HnDZWJ6dXjJzPOMr+3/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781613623; c=relaxed/simple;
	bh=tPbjX8dfzPLu8onhnfm0DNzfCkJoWXqGLy1Lxvc2NUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dfz08Eh07eiS1LZ0p9w8Opz/5QCQNfKoTcyL+H8cJSkbfG59aHBk+QJIcqO8oJ837iA6JxYdHCir/UFIi7QxnPK8Br+UGIgSDxhrrMuE65eO8Xug2pFi8tfS76LK76La0Dsd2E/1F44uIw9kqYVmZvk6slaKXJW9mH/7XKhl1aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=LkPMS57S; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="LkPMS57S"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51778069c31so40309761cf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 05:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1781613621; x=1782218421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tPbjX8dfzPLu8onhnfm0DNzfCkJoWXqGLy1Lxvc2NUs=;
        b=LkPMS57SheHWUiSvnK76MNPuPeTpmepRr/zvfJ4ZpBSaUTrCEOpDnjQIDbl4YV/8pK
         0RvEWX124XtPixmZGL7nu5gP6/f8YLcuJcemmDyc9fyshX/R+SxjdOfeGu82kKdDYZho
         Cd9Pz1ccepPbodA6fjVyV8/JveKyJe3KP8MRwGAwYk9TlUcvrqnzf0p67yRmqK1zFBkn
         ueRtbFdomSo6KVgL++OLAEQDKjcHqEnR+zzX9N0gqBkuWhJN80xWe9ysGRvBjlwR0mH0
         ufusAQb6vCoO1JcuHxGMggFcSZTI3SlLFb/IbD7/qTV/l7St0K9Px/RxVE6ka7P8+N04
         W1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781613621; x=1782218421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPbjX8dfzPLu8onhnfm0DNzfCkJoWXqGLy1Lxvc2NUs=;
        b=l3ZbNrYdLjhLbHc5Pm4qWCf7EKfzHLZJ/j6UIyOVCFJaSdUB3ZFddwvvs6kWRmwaIj
         MKu5Yf9V7EtvzdLWe5blk6cSu8dOJD5U6oxYS1DYYe4rBJqFU6fvuKMafaWsJKt3+uWp
         FYHvmBS2kaa7zX4BpejNFlHLGu//SsH/ZoUWGn+tf7Rds5cBi+KAPKy2HW/uJA45RnJg
         SwUVEcOaRJlKVwiaGUryFio2MK2TH78CjXJxxioysZyn2nieaxodgvuYpngRsEoNYjUX
         BPCp1krY9/xtsI9YGDFPCBf+BqwW7m8s9V6Tb9c6ypKXt1KrxV/fShNVTd2Wpgl62oPd
         xxpQ==
X-Forwarded-Encrypted: i=1; AFNElJ9LuwEHrGswoqZEJfBT3kXkMWo+ImCgjR7fUXU5EC+/0Zc65S6uIvaCLy8/tSwyHJjMZ5LmZ5+R0eADvM53v1U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO0IZm/9gHrSnKqbAmETm9aAcoH+F991yzJk0+AMGJ4ak6BgqI
	Jc1OPtRBj2wper1WXZFLscxC2//+3SJ8MiHJCNFPjfk8d3bnTo1mW48wMLGC9fXsE4M=
X-Gm-Gg: Acq92OG5Panutl25gSmniUusuRwyK+2D80T4qb7D3mjAg11Ppazl3m3uuUOkzL245dZ
	f/g49QUWEXspxY7MdGCa5AyrQW9TI3SsmO/m8bgEyYJp3fG7JPa9PSUH96q77a5OdBrgK2/3Shi
	QIcQonmg+vSh1XX/NTMg5N0dPa14yj++FjmYQmGqh/nbUtpmwXl0YY2kfoa5ZxdaCpamAjctC0z
	0zVbPPOsnJP1c4QhNbtNLMRp5cnG6O4n/ID70Fs8jVnszUm+ziSpckOauRcnsbbFlafAPLzWNFY
	d7K3aZ1A+4trZdiyUiBuhlF1fc5OYiaLmbr1KaOkwxKHny3EwR7NYwU/lN3bvR2V2mg5MeriRTY
	4YFTlGH9x95QNQrQH7k0UjAKWLw7z0Wetuz2Vp4CYngBIhtykaYdLni4SL16ArS1m5kcPyvMmNm
	jJIo6lZgfx/XhJoRs9uHDzFGNpY6JH2JW5ZO7WerDdz+LLAG0mUzZwcTEUK1ZodsCE9UB2Vfo4m
	Tnpxw==
X-Received: by 2002:a05:622a:2282:b0:517:6804:1fb3 with SMTP id d75a77b69052e-517fe230d82mr282972431cf.18.1781613620607;
        Tue, 16 Jun 2026 05:40:20 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb61d948sm133785221cf.1.2026.06.16.05.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 05:40:19 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wZT5X-0000000Fzb5-0uZr;
	Tue, 16 Jun 2026 09:40:19 -0300
Date: Tue, 16 Jun 2026 09:40:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Shuah Khan <shuah@kernel.org>,
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
Message-ID: <20260616124019.GA3577091@ziepe.ca>
References: <20260611-tcpdm-large-niovs-v2-0-ee2bf15e7523@meta.com>
 <20260611-tcpdm-large-niovs-v2-2-ee2bf15e7523@meta.com>
 <IA0PR11MB71852246277F773AC41DAAA3F8E52@IA0PR11MB7185.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB71852246277F773AC41DAAA3F8E52@IA0PR11MB7185.namprd11.prod.outlook.com>

On Tue, Jun 16, 2026 at 06:04:03AM +0000, Kasireddy, Vivek wrote:

> > This is helpful for importers like net/core/devmem that expect dmabuf sg
> IMO, udmabuf needs to detect whether importers can handle segments that
> are > PAGE_SIZE and set the entries appropriately. Please look into how the
> GPU drivers and other dmabuf exporters/importers handle this situation, so
> that we can adopt best practices to address this issue.

Importers have to handle arbitary scatterlists, devmem is just broken
if it can't handle the output of sg_alloc_table_from_pages().

Jason
