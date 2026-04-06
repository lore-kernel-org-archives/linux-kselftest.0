Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EB435F163
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 22:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775513430; cv=none; b=QiD9jFNwah4J3E40iptcqMTOAvUB4WokIKWHyX19dieGoKukYVhOKUWmaRAJwkAKWAZhW5oGAhdk3tS4fVK39YPcNOk8yTHh2XhOQY1m3Wn2zAHqud2Otc0wAYV3upY9daugyTQgC13apMhepG2mULboFneGJ8XvguWqjA8lM9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775513430; c=relaxed/simple;
	bh=jUJx2dHLtWVAhCD/NwIlBJWlN7aB3C76s4JEYE9cZNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L1W7wCvcGscELnQZ5lxJt5Zahm0fuU2TgbbGPdJu09rOGgoE0c7ciFJdMuafEyTZ43SVm4OdhLF7BzP3XfFS7vNWR3AwgEnV1zSjZFl1yK11c26IiEWo9T6ESYYk1wfbgq27j+7kxh2id7IlIZrzrabkvKrZ/CUGjkYau8qPMcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Ow/9r4f1; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Ow/9r4f1"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50d876329bbso21299751cf.2
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 15:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1775513428; x=1776118228; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jUJx2dHLtWVAhCD/NwIlBJWlN7aB3C76s4JEYE9cZNI=;
        b=Ow/9r4f1wgV5ET9ewP1WS/ClATq8ocs2fqttQKEix70hzKQxvjNyvcrhWNN2zeLGdu
         H0BjKhwg17KhhpL7XoVjoojKW5iGKOH3Tq9u/r4uzrNvz1KBkE/Wh9TaOFNZQTPuQSTT
         fEscO83j5mgVedCoe3sVtHjXZy193lcLl1OXmkU8O9NomBOwVUonmm7nyeqRi3B41+vZ
         D4QsfV1n6EJpsGwAysjkwnttiwMMh+cq4J7m0uA7E0VhwLOidbssyV7uekxdsocdqtgD
         Myq8QFKgcgdBWpvyKJJBGRRvDShobEoDWkgbCbLYcQm4CMzhp59OGjGyf+Wz7LJNRABB
         Mj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775513428; x=1776118228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUJx2dHLtWVAhCD/NwIlBJWlN7aB3C76s4JEYE9cZNI=;
        b=bvzmgH3+LPbXjnF7BApuWpDfMeTWx/7w/W9cNxVAdtqLcwe7X+25QTM/IuU5GvA/Os
         A5NHhEdtRrlDepxsB7Yyrv5/vBF6W/usUF4wTkT/X9MsyQA38iotsI9ZISS7tgYAu0s/
         +DL5+6rVlsOW0zXtOn0/OQs6RVgES+VeuE9HAnloXzWn8ctQ6lMjdeySVUO6BxHpd45e
         s3ppEuOE5RHo8CjOmWek3WuU7dvSzW09fn1cD6HFm/FdZNzQxs0rihmSIG9a0qz8Um72
         8iTNu2HtjyKv05IdRdXgQ1ZfpgcPD3CPMsJj3CckY+oueHzT+tKVBFsnOrJBVB3udmyB
         40Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUfkn3AP2uWkR6h0hFHNMXN5ft0yxjM5/j5hGAA/80diRMK8r7GE05HsFfjPv/e12op4vyPVA96aB0zbT13h7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtCPlmEujtE5rPgREIDKW3OoaxBZYA2blciR8m+TO5BqtoHC3G
	5G9gcCC4kYmXoolGDJPOUNKQdgaB8LfwCwZJt5Pc6cwjjfi6tM7TNTTfCARaekRH7zU=
X-Gm-Gg: AeBDiev/jvUHD/B29t5dKzwL5ocLa45yw35kkMViBRASBhsmSjSEYvSxKqam1afqKBt
	jqdwAwRwp6oAAYqF0UAt4ev/1uit2l5TOaVmgt8+3i6k4drp7a0R32qWt/JuitSIGTPPElud213
	cGMY9Lkg9/7kBSV/ZgMs9DJdNaaMLvsLxDqoZoC3mENWHmWWDqBHrYQqi61XmDmuKC7btY4J9Ep
	11U2IdNWAbtPso75bSIiZLESTqUvN6ouShDoAgafPMsULcqNiATXloPGB7xLsTX3th6/3ec1gwI
	z2UdCN6HAMBfOqWBPI6M1vpCoQpvd6KKKwm1/6SiU4auZVyjsGjk7httRjhbSWenlW44TmtGVFc
	KjgZseCEIng996eCw7Vk135BTVSLIiwHZoqiy3zsntQhl0eW34qZgxAmD9Xs5lCaVY/Sx8zim5u
	XHrT/ztB4oQEJwt2nEcodpMByISOEnKfM+xVxj1h07steQpCEx1aQfO4z3geuGW8CurNN5ww==
X-Received: by 2002:a05:622a:418b:b0:50d:89f0:9a00 with SMTP id d75a77b69052e-50d89f142e1mr93804951cf.42.1775513427598;
        Mon, 06 Apr 2026 15:10:27 -0700 (PDT)
Received: from ziepe.ca (mctnnbsa70w-159-2-73-22.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.73.22])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4b93dd10sm122148721cf.7.2026.04.06.15.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 15:10:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1w9s9J-0000000E4pT-1Nq1;
	Mon, 06 Apr 2026 19:10:25 -0300
Date: Mon, 6 Apr 2026 19:10:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dan Williams <djbw@kernel.org>
Cc: mhonap@nvidia.com, alwilliamson@nvidia.com, jonathan.cameron@huawei.com,
	dave.jiang@intel.com, alejandro.lucero-palau@amd.com,
	dave@stgolabs.net, alison.schofield@intel.com,
	vishal.l.verma@intel.com, ira.weiny@intel.com, dmatlack@google.com,
	shuah@kernel.org, yishaih@nvidia.com, skolothumtho@nvidia.com,
	kevin.tian@intel.com, ankita@nvidia.com, vsethi@nvidia.com,
	cjia@nvidia.com, targupta@nvidia.com, zhiw@nvidia.com,
	kjaju@nvidia.com, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH v2 16/20] vfio/cxl: Register regions with VFIO layer
Message-ID: <20260406221025.GH2551565@ziepe.ca>
References: <20260401143917.108413-1-mhonap@nvidia.com>
 <20260401143917.108413-17-mhonap@nvidia.com>
 <69d0169115c06_1b0cc6100a5@dwillia2-mobl4.notmuch>
 <20260404185330.GD2551565@ziepe.ca>
 <69d1685538f45_556821002f@djbw-dev.notmuch>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69d1685538f45_556821002f@djbw-dev.notmuch>

On Sat, Apr 04, 2026 at 12:36:53PM -0700, Dan Williams wrote:

> Then I assume it matters that memremap() sometimes silently falls back
> to the direct map. The "VFIO owns" expectation needs to guard against
> some helpful platform firmware mapping accelerator memory as System RAM.

I don't think how memremap works under the covers matters to vfio, it
takes in a phys_addr_t an gives back a KVA that is cachable kernel
memory.

We just have to be mindful to not allow mismatched attributes on
virtual aliases.

> At a minimum having VFIO fail to map in that case helps with the
> argument I have been making that "no, EFI_CONVENTIONAL_MEMORY type +
> EFI_SPECIFIC_PURPOSE flag" is not suitable for accelerators with private
> CXL memory. Those want to be enforcing "EFI_RESERVED".

Certainly it should fail the request region if something else is using
it, so if those EFI flags plug it into the mm and it is plugged when
VFIO starts then it should stop.

The direct map isn't really "plugged into the mm" but it does raise
the mismatched attributed issue.

Jason
