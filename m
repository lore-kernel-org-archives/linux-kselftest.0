Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CB847D94A
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 16:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784045400; cv=none; b=p5BcD+W53LgU2UnlGQvZHIlSRuaRmExL8wOZ6YaCSeH82Zp3El1aQxqFWM7otBwuLEQNgBrMenj8JohDzDyKvbNWdwCxVApTKyjjiGy0GFrwJvNjNrtyYZf8RHm9+3rZpPGqhp6sg4vqjzoNS+5BmA/7nASqtFDXqbYLLMJ7e44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784045400; c=relaxed/simple;
	bh=PokQTL8gKyIzQEad2vUCz8s8DGEcDYbE8wLb9vQv8W0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NzKCarwjcn9BW8l4l9Ij9St4caBrNpPEP3/TTB5hREgHc9PmkyPTJVZ5g90YGiaXUsx/7iutCctyfKT6oOihBPNS40Xg+N2WWiyja7vAAY08EhzeNqmvQ3iQK1NWx1jEIRSV9jy72zgLVzYMB1cEUoNfqwT/D+YUxmL6gH0FZLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adsEe1DE; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adsEe1DE"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cca0c5799eso14811895ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 09:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784045396; x=1784650196; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kdgMbrcVylxaBaGAreEv3T5etD7pXeCq9ZAv6P049TQ=;
        b=adsEe1DEk/lQbNlt7CMipTaRrAjllsitccpAqt7lKLZ8bEgmNSiM08Mo2EXx0ei46C
         nHVHhLWZCePMsVQUf6iuwTu+qwTXGWznTeIqlb8VkWEGEKIBOyeLAwfWkWZLaTgm/A32
         jmyflxyCUrN+Wng4hT7Ir8FkdSgdduXm7Q/7gVmMMRFEet4ns45rWwJl+YV/ILufGWej
         iv3wLn9AiIXP1b9zMRksoYbc8QrI8PB6Khk7VoSnMt+D1pBrRBXMn/G6oUpaKrqJVqfy
         yy5l9galu0zbFD9EhEaGp32tlaCq268GIo973Zn9tRYtiFv985SmkWEokM0TcNaPywKv
         AHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784045396; x=1784650196;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kdgMbrcVylxaBaGAreEv3T5etD7pXeCq9ZAv6P049TQ=;
        b=c3oKAeN0K86R7GYwmZvlmEt2raqjkeCqdjeA6AuQobIpR7cNc68i6V24N4IHmms6yj
         JcedQbzPaZPSri3R557zP6DRg02ronsu2bdG6RCXPNAVPsCCawFDS5EiPqv6r4YPrpGV
         QZzZlVZ52PBV5eFR4m7X2xxrm+NCqrBOnR7brTKnBvbaSoLs++ykOXYRUmSTpd0nP/Tu
         RZ/HdLMYNuUMFXMUbN4HUo9/Q/o2T0pAT3kjfPNuzptV27P9wpJtkgJllE+zC/kLBAl3
         nVaBYEM7Pg47QjAEEvFp+X5oFFvcmA1hUDdJyuJh+M7MnyOzkfZTOt4f8frAVn+4ZJPj
         9lpw==
X-Forwarded-Encrypted: i=1; AHgh+RqKt0EBs10qMEGsdB04sUthqYwb+hf6LLdPrYWpTW6fUWbrDqX/KeqWdch9omd5W6wWSF2yhevcvRCChcDeTsk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgSkzoDFIvj5oB+LGkhnpzJjohp9Avp9S4aMt7tmR6GevAjxbg
	HtSQQBNSTX3BVkCLyVGEkk1lEVob1iwvgK3bGhx65QZCIvSFK9E/ncob
X-Gm-Gg: AfdE7clq7ZpLIE+HvCu6GmaM58DrUG9p8b5OWsQdPnJrVgbaHGq5MPIPyzIOB3IcD4Y
	lXQGdxREuHiilpxYJ70oVXc0vKZCchx29sj12ZdtWPb8G2U0izIjn1yW/7uhdXQY5RO6TZeuoqY
	d2/csx3Tprpa99EEwcC2ZsJszb+ZAsjXm8rUfO9/dRhQY2/0nNiX6WZkRdIFhhlguQIfJVPx6oP
	BL9iA7DmO0tGEVmGPUSVOQoqRI9mFX9E9/FnWJBuK7YQlFWqoudRCYijFY0b9O3qyWaCFWuksh4
	PTiJTCEDfHzWjGcxGD2vwsSAa+D9rjDCmUp6xxgoS8tdp/ksbwN94axaz4LOrYYNi10dITRg4ig
	aoymGbPXAzXO29MakCkHNV1HCTdodknD+ufeBgDYb/S6jwG/0vhEgYQm4PircBVdR2UZqOLyzVb
	1Nek6KobDGxhF8G660q9cA+K25bp2tNCT2czIP2J+clqPALllketTVXCM=
X-Received: by 2002:a05:6a20:d70a:b0:3c0:b55a:80ff with SMTP id adf61e73a8af0-3c11063d595mr15198722637.24.1784045395651;
        Tue, 14 Jul 2026 09:09:55 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b31628c1sm10020860a12.19.2026.07.14.09.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 09:09:54 -0700 (PDT)
Date: Tue, 14 Jul 2026 09:09:51 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: airlied@gmail.com, akhilesh@ee.iitb.ac.in, corbet@lwn.net,
	dakr@kernel.org, david@kernel.org, decui@microsoft.com,
	haiyangz@microsoft.com, jgg@ziepe.ca, kees@kernel.org,
	kys@microsoft.com, leon@kernel.org, liam@infradead.org,
	lizhi.hou@amd.com, ljs@kernel.org, longli@microsoft.com,
	lyude@redhat.com, maarten.lankhorst@linux.intel.com,
	mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
	nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
	rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
	skhan@linuxfoundation.org, surenb@google.com, tzimmermann@suse.de,
	vbabka@kernel.org, wei.liu@kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org
Subject: Re: [PATCH v8 0/8] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
Message-ID: <alZfTxfypj39OrCE@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
 <20260710151151.1e193eedd0cf2591ae392f76@linux-foundation.org>
 <alG2-RSitzPWClAX@skinsburskii>
 <20260710224950.53bcb43ce7e564f07a1f6a8c@linux-foundation.org>
 <alVRU38lMfvmUFqJ@skinsburskii>
 <20260713154535.7656b3a630e2f6f076b4e76e@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260713154535.7656b3a630e2f6f076b4e76e@linux-foundation.org>

On Mon, Jul 13, 2026 at 03:45:35PM -0700, Andrew Morton wrote:
> On Mon, 13 Jul 2026 13:57:55 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> > > > I rebased this series on top of mm-new right before sending it out.
> > > > Should I have used a different branch?
> > > 
> > > mm-new is good - Sashiko attempts that.  But it's changing rapidly at
> > > this point in the development cycle.
> > > 
> > 
> > I’d like to send another revision addressing a few comments and also
> > replace the `max/max_t` check with something simpler.
> > 
> > Which branch should I base it on so that Sashiko can apply it
> > successfully?
> 
> mainline Linus would be safest.
> 

Looks like linux-next/master has been updated with the v8 of the series.

I have v9 with a few small fixes, but it is too late to send it out already?

If it's not, then what should I base it on?

Thanks,
Stanislav

> > Or would it be better to send fixups against `mm-new`?
> 
> That should work as well, but it doesn't give us a Sashiko scan of the
> whole patchset.
