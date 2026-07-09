Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDE93ADB9B
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 21:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783634228; cv=none; b=WMlumsAOiCRONaCSInKxKXQ4rorzE8H/FLlHPAXhDn0df78IHpgfnb9T9huun0ua4maQCkVPxa5YxphgLdoNTqCAIaq/IskOjgrHTjL/IcNyME9w3i2K/iZ2yglzuzKEFgm8Lb4+YLwNmoS1+X6cckQJO78z+KaWTcuKCrQNGjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783634228; c=relaxed/simple;
	bh=8UAIjOhvfbKjsQ/HTeZBSW9rJpTCzyIJqdF78M986Ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6KfKSTftbqXlKXewqwNkweo9AzK4WUB9+Awgf7uvYsdBz6Yi3aGxsZmZALSN0TvRc5uRe7E20g9KVRMvnEzI1I6BrEoFY1aE+7NpzzGtD4VyQQulHAmUU3HW/QAinU3kW/ER2jZpeFjuSeqdlRb0O2QLqSaPNI+BpR2tvITHlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=jJ+P7PfB; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="jJ+P7PfB"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8f1e274ccb9so2270826d6.2
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 14:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783634226; x=1784239026; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1AtZcCJL7SSO55KaeQpBRgHzud/kdG6WTG09Vy9G3lc=;
        b=jJ+P7PfBLXbjT1Rj5WlEniYWLmlHlbxUD90Xxnzpg/yjCanjKgxL+RtFPEdfgR2oyx
         0wEW/vD/gH1tUE4FGDERfWdghinDh+o8e+Q1fxIT7dsw8DoHnWvZjaa2NtfFUd3OGAc2
         ChTjWCdhyWBPfC6dXPpitW79JuhgvARxItvaGs/xVwwYSRvqrHjUbpKz8mIDFlYJJwys
         idPhAhYvLRgVAOWClwhJwxDZM8YbbfZ/8/OEz0bh/JAFskblZqcheMZ7bCvPzbryUqpv
         dFGcITqw9H3ZlCJCK/8UrUiLbFwHLJwH+29S2FL8OwVV7fg1qnsn9+yQ2LDWzUpIfRkz
         PimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783634226; x=1784239026;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1AtZcCJL7SSO55KaeQpBRgHzud/kdG6WTG09Vy9G3lc=;
        b=K7A2w/in8F5fiivMV9BssCGhqzHUFmpN5Hx8+z0xSyQv3RLp0JgVhtSitPlqHT+LmT
         ckVvbKXpfSak3aAhn/QW/PhCrCAzsj0Rbj0TGNyCHVO2LJo0myaJNk3VXqkFVYVv7Mak
         E/d3osF8oIlvNmGf+GfBX3z5oPNc1DavN+hVEiqf0Tn/G4MW/VEdPkZg1nXMc3CQySR3
         OKtfxWU6oouzSDLPzxcd59MfHUoPTrXjMalvu3YczlSM7xYbjdC4VPJ/JhBXTGBbXBGh
         N8XLMDOVahkobSSa0N95rQXKU4gXAtDxmdkvjx6rjKFIEOB74BSUGCh+5mYUXYnoP4ge
         yitA==
X-Forwarded-Encrypted: i=1; AHgh+RppBtb69QWfb97yFTd3fhqeRtledxiQ1oLm7BLCKl0mrkBUu/ZlXw42532QvTP1vvULixRAq8xnFvc1A69GCiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhS3XmlhTQpdDtEMk/+NRqFenI3OwgbSqcdI9qE/Nde5175hf0
	fOkinuJmr2/M6f4aJwZh71zCS8Z3EWtureLtAuk0WyEuGEJ+L1BCzUXdALPu6gGIp5Q=
X-Gm-Gg: AfdE7cmhz1Bkwrna/r0GrKLMM7nXIGYbvYb8sDtL/SuAkrffNGdQ3MyM44tM0tfldQI
	AAcsNdDmJKyruOQUgzqM94DX75klqu0BOHj8TKN5MVGwWOyEQRgmKnGu7oBbwlLF/BIozxkX0fC
	cSXvzIUf/hMqi2IVvWK2fiOVeAZLyE6ybTw42K7omQ6JOUdXhM+rUNQzXaYgC+jIFhgIHEimCDB
	0i4SfYK/cZgEeoVisBpd9aoCje9vbVi+aVfNv8qqHl79xnwXP6z0nJ6wg/Upm80XuZg0k9K+ILr
	fiUvH7QqI950LOLP5qeniwwHSqemB6NO+rbqZDv31dT7xjgmICCvnezEwa516ekbGBCZcU+gpWU
	KSjuLzFljfSh25Pwp/sINc2KDD1yc05PFs2QfpJAuCk94UJSWh5iKDaW4UJDhqdtcmz+QHGLfyz
	azc0BHEaWLuK/bytpcUC5NUVv+krsEoRJWaH1vqCP261+VNQVnUx5kHX0gLhPl9xM8I99g
X-Received: by 2002:a05:6214:2b83:b0:8e7:8d53:240f with SMTP id 6a1803df08f44-8fec2a4a020mr91687356d6.43.1783634226132;
        Thu, 09 Jul 2026 14:57:06 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd80fd82csm26977986d6.35.2026.07.09.14.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 14:57:05 -0700 (PDT)
Date: Thu, 9 Jul 2026 17:57:00 -0400
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
Subject: Re: [PATCH v6 02/10] mm/memory_hotplug: add mhp_online_type_to_str()
 and export string helpers
Message-ID: <alAZLBqgUEZliwk_@gourry-fedora-PF4VCD3F>
References: <20260630211842.2252800-1-gourry@gourry.net>
 <20260630211842.2252800-3-gourry@gourry.net>
 <bdf0ca14-eec4-43b6-93aa-310e77660d95@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdf0ca14-eec4-43b6-93aa-310e77660d95@intel.com>

On Thu, Jul 09, 2026 at 02:08:43PM -0700, Dave Jiang wrote:
> 
> >  extern int mhp_online_type_from_str(const char *str);
> > +const char *mhp_online_type_to_str(int online_type);
> 
> Does this need to also be 'extern'?
> 
> DJ
> 

General policy i've understood is: "No new extern"

We use the EXPORT_SYMBOL_* family instead now

~Gregory
