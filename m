Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55465347BD7
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 03:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773372238; cv=none; b=suBX1WG8ig12wKIh9igKDy48dp/VE+feVi2gAED+gzV2xR+xXXHcxm9em7OUB0FeEg26rtVIeUlI5QgKM1RROopZ3dadrn26H3y2dVUX+Qug25s4ZmnGFyvInW2t5LMIyjcTx1ifjRJlVxlohnF54tUFzw2iAGKYyx6R1t0d/uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773372238; c=relaxed/simple;
	bh=CrO0Z3Kla1w0Ut7d964MhaF1H2bfH9lE/BjVQXgu3hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tlf6e531B1ABLeTtgE+kPZte++/98D3633k2vTZpxYD3z/8kHZOr+bCQ3uQpWIypWba9Auipboz4H5jbctlxsSFPRU5o3S7kudaa2ZQfQQUAa7yiJtFYJGNkxgtrp/0lzlY8EqC5FX/3x0mGQaHma4N4PO/6MiEJkPkL5n8TPAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i0P1yAnf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UZjjR2Kw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i0P1yAnf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UZjjR2Kw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773372235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XyUSirNPJAnFjUFfi5pJvHSlQzaYa0PVQM56kebxuis=;
	b=i0P1yAnfvvt7qQ+0N1l8cyWPt1st0z1F7uizEpjSoK1UMXuOnoALvzqYBbcuMJ0n7z4cmZ
	eI+Xdlw0hU05Kghv4rjW84ewkmjVCM4rmx20xI/OwqkOvleat/87peydBpo+mj1yh9UU5A
	9qrBTOIjjsk8ae/6IuVdHBVdd/As564=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-pid9NA6RNQ2-1MuSR5U35A-1; Thu, 12 Mar 2026 23:23:54 -0400
X-MC-Unique: pid9NA6RNQ2-1MuSR5U35A-1
X-Mimecast-MFC-AGG-ID: pid9NA6RNQ2-1MuSR5U35A_1773372233
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aec784479cso54286335ad.3
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 20:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773372233; x=1773977033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XyUSirNPJAnFjUFfi5pJvHSlQzaYa0PVQM56kebxuis=;
        b=UZjjR2KwzZsd87hCoaEjxuFDibmCXAuzQ19khJ2EWHWySfVV+YZ4untWGF52Taia8s
         whrdCmzfO+tXX1xQ8ZP2VcvGIc87GqHzQgXcjtcFBbIu//UbnlKWkbH5r44Cy8tRlq3G
         gkvV3/3zZ7PvAya6dKpdvO8J22cqFchZQVJnTEV6zgbyWAQYyX8ptjsGb7PFu4OMTEtv
         OMu1zkQgK4xqJULYGTtwZ6/maSRnmGKg7f7acGOIPESHUIKIxknODX2G/Gdijkncw3Ku
         gbhYUzfTqV+W0rlvNGC8yshj9kUsBh1rpJcq++1Az2rxznx016I3i6QoScN14Ls7Luzg
         qRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773372233; x=1773977033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XyUSirNPJAnFjUFfi5pJvHSlQzaYa0PVQM56kebxuis=;
        b=F0kVOdsEFOPvPeyfwOYcXAh7v+zeudi/R7qelI2GDVPMvmP+y3zurUjoI+0UuJ43dV
         QkpnSo6YdpMVNCXCPmkgkLjhOJXaxOIMF7Bryha/nfsCK88rUXAch8fxXCHKSiQrkKRz
         fORMYo/6ih6zkSuBUxRRiGHxb2CdIkYnItP9VFdI8qlSP/tkF5BDI4qSOttHL6Azpnzy
         3jobdn3AlQANl838oWwvJln7wD9OmyYTPYOoxUhLlcZgiyAFj0sqnin/AlVyw9NyKvg/
         ZVvxkQ2ApnNhTOHm705lVxnO4vVaq8kFq0hdaT7Wbk7Ad3+8AyS3xpG+w205dis1BhsH
         pfRA==
X-Forwarded-Encrypted: i=1; AJvYcCWeQuRcsgxIQBz4a5Luw0Lmi5J9p/kSp2mk2p0th0/2Yw0Nwr+cGN0TlULus8K48VMOwNWfNXMrBPArgug4mME=@vger.kernel.org
X-Gm-Message-State: AOJu0Yysh4rKEMEgqmrYKmAcO88IvjOi8JFs3B6YmJfYICAay/LLfeJO
	q1nFc0dfze+7tNQdkKE+ISUq9FLc5jgu31pFE81k+6rRS51qAAeDahUG8CsDPTESkZ1SQXPdSih
	VGFU1VSjIV/3TJD4bpnCSUpK65j59I7Baltzq4wSGUjvMXLfTmnGkiokp+n87AE7UmBctoQ==
X-Gm-Gg: ATEYQzzoB3p8H8UM88FoJ4iK738pPusxeQvGSdfGTkRFBotZHc7BHSLeGSVhSoQKlNL
	MRNhFReB7Ewssy3opxcDRUY73cBMG7SaqYr0WipfqJSP5kv/dRVD61VCLTlhS5Q6iYDo8UGHdJq
	aFgYpf5oCrlo9SoP/aeUPjEjGxqF+F8Z0a246MLx1Tumx/CZoLG2KQWestpFJWZ9e3VYVQQP9Tx
	h59BjEVaTGC/zHwLpth6nMgaXWGH6cO2BeYtbDAI3jwHSCyNI50p/D/wL0PZ8Rqy6z/lv/xgNhc
	+3H4yKjL6qmcMpfmauAgDT6mgJ5Pms5q06yx3X2j/HhwJ31PGbjRe6YMLhQPOcWrlIW9Fsdb7dx
	ONi+QftCWwr4Yels2hg==
X-Received: by 2002:a05:6300:193:b0:398:9820:f6ff with SMTP id adf61e73a8af0-398ecdc67eemr1371859637.62.1773372232819;
        Thu, 12 Mar 2026 20:23:52 -0700 (PDT)
X-Received: by 2002:a05:6300:193:b0:398:9820:f6ff with SMTP id adf61e73a8af0-398ecdc67eemr1371846637.62.1773372232455;
        Thu, 12 Mar 2026 20:23:52 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73ebb75624sm421173a12.24.2026.03.12.20.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 20:23:51 -0700 (PDT)
Date: Fri, 13 Mar 2026 11:23:50 +0800
From: Li Wang <liwang@redhat.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Nhat Pham <nphamcs@gmail.com>, mkoutny@suse.com, yosryahmed@google.com,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v2 1/7] selftests/cgroup: skip test_zswap if zswap is
 globally disabled
Message-ID: <abODRsaeEul9Aj2X@redhat.com>
References: <20260312040627.55257-1-liwang@redhat.com>
 <CAKEwX=MqyGQSMuVCSWmhKfHju5uHBe3ySQEgK9XuKwCvpL4x8w@mail.gmail.com>
 <CAO9r8zPmV8v0tiQvn2xFqX8F2oU23mfbVK67nxMO3QKt49kJeg@mail.gmail.com>
 <abNtUReAUHT6j9Rn@redhat.com>
 <CAO9r8zMh=tAV6UJcH3hhZWrZJO_emVe4raiq4wiBEgC-GAD2=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9r8zMh=tAV6UJcH3hhZWrZJO_emVe4raiq4wiBEgC-GAD2=Q@mail.gmail.com>

On Thu, Mar 12, 2026 at 07:58:28PM -0700, Yosry Ahmed wrote:
> > Yes, this looks more tidy than open it. I'll go this helper in v3.
> >
> > >
> > > static void check_zswap_enabled(void)
> > > {
> > >        char value;
> >
> > read_text() requires string but not char.
> 
> I was just illustrating. This should be passed in as &value. That should work?

Yes, pass it as &value works well.

Patchset v3 is on the way :).

-- 
Regards,
Li Wang

