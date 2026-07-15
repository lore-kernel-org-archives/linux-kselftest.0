Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4644611C5
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 15:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784127737; cv=none; b=VJylWHSJFLlpelMDHB5MXG/Xyj1WIkmeThO3PAMri2/sOh8+lbtab20Rg5OS1IfCm5pA6QKq9ps3vIkykX5ZI1+WodHksaiDtSBNa/3po0LBQyRmUYLjOItObaB4iCsQCmeClWzhpnssEtEQ7TwQ5057L9LylW6IiEMlAoqLGv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784127737; c=relaxed/simple;
	bh=QBcmHHIDpPZ2zSYqCsJ07Zn7cTcc/wqKwrbcJo89maY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bOOc63TLQaAtL2+21NkxqCk2YhEJLft+v0LsBLQvd2ukF0QMuofq5TccBBxSszG8E7kUQBa7E/WtOibswGq8EoYRE4PvkGNkTSV3HOL/lt/ZpPbr8/51GnvBfookO/XBimPv+KAhPcSi2U0u7woecV1xc2JBbnv96pcGD4eSjHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=DE2WqHhT; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="DE2WqHhT"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so2193811241.3
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 08:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784127733; x=1784732533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nGecurzBYdjUfiEExv0oL4FVVbYZSUEIMh9OhYH+0R0=;
        b=DE2WqHhTKM3qWnPPNIomeJRudvuTvXFYZNsYdA++akthGHjRltuFiX2iUsmeHcvuah
         11wmhmJHWQUCtSD/AlL6FzZabxDIkrvNpJ7dCRvviHJ3OETCfkXIPvrg8LFuppfR3I6U
         vr0IqCCj8SBxmsK46CKoUnqdCVSSlD79b5FSkmkPIlxgKt4HWWbahu2hKBqCyq6cl208
         Wrv5rBFFHPOrPGRvZLdAlFL4tltc0DxhseNJAD2LzDZEU+TRQA4zleDET+SFvuwktmxS
         1G27sEZSxUCyjA+AA8cZPpVK4+T3CJKxupJJhoeFIBBBsBuURQ7sfJW0yzAiKGu5XeXy
         vyoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784127733; x=1784732533;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nGecurzBYdjUfiEExv0oL4FVVbYZSUEIMh9OhYH+0R0=;
        b=H5aOUlr/+T4Ifwiwpud8pv6+Ni0AXHq9C5OM2kkDIbURB9eC26XKIsvUovo9xhvf8p
         bR65KVbUiygmuP+klyza+TeglogZZvKXLCZojHeZstcM5GSgrDXKeHH+yB43agvX0W8t
         VJReS6AvK1kmyNMqcXvlQzSffiGQ+POLtfDJYTfmhFyiPm/lYng8O4QFYWT5Fj1IE4S1
         if8s1/5a8edjQchzeKwIEjqkgm/CevXHNAJkGJTx+nG9UA8ULXnaMfHHkK6DE3eptE37
         hvjBqlZGWOIdBBZGe1Dy1m4J4b8rDcO4VWreqfzeFMxVbY76zod94VcS3VpM8lakq8EX
         Oi/A==
X-Forwarded-Encrypted: i=1; AHgh+RqYQ7aV7slyEYiKh1li80EunChOZLAspPy/I3U0DEp18iZpAYMnCbO0ZF8vJXhKg4RDJ3i3BIZNiklhot1MALE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+yn0lqU1MtW9o1PSEiI4z+IGOI/i+CJql4occGsrCtozQj5Sa
	ghM2yHgjbnUqNuuh93aTvbaEcySkRSG7gfwnks5AmgNBCVjYoMQHQNI7frBR8v3e7Qk=
X-Gm-Gg: AfdE7cmSVPUh2ClsghP26zloWgNyryZUvGS+gP+LKhCOGxEqHslIVTPxzY5SaxlqIyR
	xAjQJdURjshe1UzJDe6tVsrd55+zfkT6mtCXmc4YBKdZQ5ajT+c8iyfG4/PBknmqk+uno/Q9RKm
	EdYmMNV7r5y+nhn3DTOdd+PL68nHu71yoJnIAeEF2a+XPRCQ1M6LE+KhT6j/sjvs0jOhtSlcIgY
	JV9lIfV5TikbC8b7Z0OBH5CydtJcN0iEa8R+v6ZUf2Rr8zRahQQUUf0Z39APsGCj4EO/Kz++mMI
	nkFM9uC3FgiBMmcM5GbSzoUcfiLokHxJzsxWppVC0TLrkktSEcY8kNI6DpFeGYH7393PJoZnAkw
	wxIFCg/1FWTW9YQOfuXJEisgZapkSRv35L6t2c6zuWrSmR0COXhnconbwbSw9
X-Received: by 2002:a05:6102:d87:b0:737:9edc:36f6 with SMTP id ada2fe7eead31-7458757b204mr4167130137.26.1784127732764;
        Wed, 15 Jul 2026 08:02:12 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd50e0811sm196100666d6.3.2026.07.15.08.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 08:02:11 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wk17i-00000000TXQ-3Nvp;
	Wed, 15 Jul 2026 12:02:10 -0300
Date: Wed, 15 Jul 2026 12:02:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, airlied@gmail.com,
	akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org, corbet@lwn.net,
	dakr@kernel.org, kees@kernel.org, leon@kernel.org,
	liam@infradead.org, lizhi.hou@amd.com, ljs@kernel.org,
	lyude@redhat.com, maarten.lankhorst@linux.intel.com,
	mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
	nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
	rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
	skhan@linuxfoundation.org, surenb@google.com, tzimmermann@suse.de,
	vbabka@kernel.org, dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org
Subject: Re: [PATCH v2 0/4] mm/hmm: Clarify notifier retry state and scope
 HMM timeouts
Message-ID: <20260715150210.GA3846105@ziepe.ca>
References: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
 <4300f09b-8f93-4605-b072-7c09a82cb16e@kernel.org>
 <alecaJ1FUso39D9k@skinsburskii>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alecaJ1FUso39D9k@skinsburskii>

On Wed, Jul 15, 2026 at 07:42:48AM -0700, Stanislav Kinsburskii wrote:

> > > Stanislav Kinsburskii (4):
> > >       fixup! mm/hmm: add hmm_range_fault_unlocked_timeout() for mmap lock-drop support
> > >       fixup! drm/nouveau: use hmm_range_fault_unlocked_timeout() for SVM faults
> > >       fixup! accel/amdxdna: use hmm_range_fault_unlocked_timeout() for range population
> > >       fixup! drm/gpusvm: use hmm_range_fault_unlocked_timeout() for range faults
> > 
> > Why a fixup series instead of properly resending the full thing?
> > 
> 
> The goal was to get a Sashiko review, and v8 has already been applied to
> both `mm-new` and `linux-next`.

I think if you send the whole thing with a base-commit tag that
specifies a real base commit in linux-next sashiko should work

Jason
