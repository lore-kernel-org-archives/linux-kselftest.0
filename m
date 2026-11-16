Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853503;
	b=am6MpbkJ9bguVNGPwksysM2K7/wiiRs3jTTLgjzjyyTv3rLk2YkC5cWoSqsZ4YYSKjXz
	 C3WFMSinFTuXwpzP+r1vPib0yblR/vRD0mUanYw4bM6vz6QkDE1GFlmIvPaxZRgvIOI42
	 tPGM3p9aNo7AJwLgKB5tHVoOaj1NsDBKjYpTgvGcsgWPYVYmxr9D2XhQdjHyulNgIieHe
	 AFHp95iNz2p5g/xWYJvTmdLHOQUuAWFzwPMgWLS3c/QF2zJ3gU9HHnFnza+gZyLCiRg9m
	 4sRg5iSLzy/YgOeJC1yL2CFWvapqclQXJji1OP52P/M77Dtb375BDACl4z0RAEeG5MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=RxveffzrPQLFyll9ZgjwqbKKHagqTYrppHHKXVLfEqU=;
	b=O9FNFJfdBXZ0rSAwnM15UCbNx2Mi0hBmeN9X/BgCFKOk+0p7pu4mwlfYK5D64SWg2W8D
	 ZLf7kairpku8Lh+awOv3p0qh0rcqFPxue8WPU+W2WHeNIiyVBHAiYVGJGhC2ZkMYsej4R
	 GPZTUdYLKrf8je0RpchImIMVE9Qo+454mh9LRXMJxKervWWDcjMOfvnYM1Y0YkhnjOyJJ
	 aYbyeBYF88AhT8aNXlkMwEyCzhXrppzFHNI20T1BZowTzFGfXXIASVtCQFf9l0eWRW1Wb
	 sJHgV/cf3OK7mGT4gdV3aF/m7hKoUz/CkkE5BKooBu4ARIxkJf2ks44i53SsHg6ZUbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A2luHTnB;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E155606A329
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 18:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E155606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A2luHTnB
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ee254f6eefso6715ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 10:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794853502; x=1795458302; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RxveffzrPQLFyll9ZgjwqbKKHagqTYrppHHKXVLfEqU=;
        b=A2luHTnBzkGSMF2SIgDNxeNTW+bNvFUE0N2jlRcqRczmzdfRdcN9yBTceU4GEI6kAn
         hfRh+Bi3fIaAUEv1QVrJENm5Lqq0t375pPznAk7/OIdgG1YibB+Qs3xumwqfJ8g5nd0k
         6tGPIUAOHCegV3iOa0V9fxGubHoApxuoEM/xrOxhuTpgwO4kS8hLv9/rEbNyLdYr4kiE
         746Q8+8rNxbMY4cUu2/EQeyEGKWNs2kMUNjwXx3+b/QQq+OLETf+jHbn0FbHZVV6KC/A
         SGedSkLiSxOSdLSFaZk4mkqZi5tkVkbnF9iMk5R+t6kAJqe3URHpGr8RZe+HWd/gWgpK
         n6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853502; x=1795458302;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RxveffzrPQLFyll9ZgjwqbKKHagqTYrppHHKXVLfEqU=;
        b=DKoMJDblvU0595vyfYbojY43++BXP4yIALvEdj5IqolGH7oJteozbhq7a6D2ZrIIVt
         YCtci44Y6kjiZIuuvDjB/ihiK39ro5CaMdqvq9b6bzkh6T04aNsK3AtVtecz3xA2QmFN
         bxEJ9AzhaYtWKlNuaBboVVot01nmA4T7Jzc0F1h898tSZDJMwvS7PDIT47b1adHTWRSr
         wwxtKslTWht3Fdbwzaac7znOCUCQ2Xow9CdiRj1PyBa3EzL2eoihhdkNhcsg/YwJ7v7d
         wGE5SfTmSqsEXIsOrGyjRry5ta3a29EvGdko8Opun4SP74X+UbnzGx4Twn5yvQY6l2ou
         At5w==
X-Forwarded-Encrypted: i=1; AL+hErEDG2XGrvjEEQ6YqW6eiL8G1hdrmK27qjTapsKKm7ej9KdSw6h9sniv3lKjTp9AM4jOZdeRSVGJGtqtpsGBq0Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TSzSiajldmPBX8z5aam33FTCFyscYz1pDlyBte3jEZVSDuwhf
	JihGRyrd+zEgXfikPLc5XA78cXLkZc3l+Kn8xp20rZ9t489Ya8vk94vWNtwg0C2I1w==
X-Gm-Gg: AZFdTZdgOPg/8WeRnR9qIXODNsAKZisrRl67uiwvEsoHQyj6pFQff70xcG53rpbzNLn
	8BgkCIvkfScX2gs7yfKv2yVXbboDv+UWUsVcn2JcdrM0QSid02mS/2LzlyCWbjDXuXPkxntxhMD
	D0HUMEppfQCz8qaf6Ha8ZkDNzVeOinmUfcpwPlQaDzP14/HrgL5cMsBq78jvhgW7q8jabuS+g09
	NBGtjV8x6lIOg7O53u6rulsjBWzkDkGaoVla8UEMhvJuKrEequ/RYLDbK1NUeQfTkEPH+RSy9iZ
	sTFg9efZKgNHsKBgQP8wcOrJA3gr/0DHSySDFvyE/39vp2dun/E5IPqn/zwk8AvfyChUA9PZvGB
	MXT1VqQevuO8VTJ8mB86jckQCeQUTNoz3QLvhXDc9m27ISJCHDIIQPVHNci6A+gmjzh2HDBOpOi
	K6KHaDFZ2omAF30JM0pJODAerHEcyU6Z8kylJ9wdJ0+pH6xcYeUtkxqv9ur5Lw/d04lGmaAPvV1
	Z3YBdf0GOZY+f6wTVmRSXPNjcJojJrYRdXBs2n5tS37GIyUqFAJ0bl98O/G71LQbqRYx4aFBGQv
	El9UaGp6BGyx5hSunCHNEbNzpg4l0FozPFFxCLLkGqeEB1qiop5HGVsCtjTcXKjlNOuE1mzMFlR
	19OuulQ7ME+Dg5IjcCIrQsA==
X-Received: by 2002:a17:902:f68e:b0:2e9:73e0:2a6e with SMTP id d9443c01a7336-2ee2b19e019mr7765275ad.17.1794853502041;
        Mon, 16 Nov 2026 10:25:02 -0800 (PST)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac70ea45sm296668a91.17.2026.11.16.10.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:25:01 -0800 (PST)
Date: Mon, 16 Nov 2026 18:24:57 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>, 
	dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, kvm@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org, Alex Williamson <alex@shazbot.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Logan Gunthorpe <logang@deltatee.com>, 
	Matt Evans <mattev@meta.com>, Matt Evans <matt@ozlabs.org>, 
	Mina Almasry <almasrymina@google.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Vipin Sharma <vipinsh@google.com>
Subject: Re: [RFC PATCH 0/7] vfio: selftests: Add peer-to-peer DMA selftest
Message-ID: <avtI--OIZu5E5sma@google.com>
References: <20261111192411.4133780-1-dmatlack@google.com>
 <avYjFfqr3T/U7lvn@devgpu015.cco6.facebook.com>
 <DMTK99TDM9AM.SAM3Z4COP9WS@google.com>
 <20261115231946.GB1239159@nvidia.com>
 <CALzav=efnA_ABCZVicX0QeTmHknaEbMeWOy8cS+zHYVhm5z+iw@mail.gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALzav=efnA_ABCZVicX0QeTmHknaEbMeWOy8cS+zHYVhm5z+iw@mail.gmail.com>

On Mon, Nov 16, 2026 at 10:02:56AM -0800, David Matlack wrote:
>On Sun, Nov 15, 2026 at 3:19 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
>>
>> On Thu, Nov 12, 2026 at 01:47:03PM -0800, David Matlack wrote:
>> > On Thu Nov 12, 2026 at 12:35 PM PST, Alex Mastro wrote:
>> > > Hey David,
>> > >
>> > > On Wed, Nov 11, 2026 at 07:24:04PM +0000, David Matlack wrote:
>> > >
>> > >>     Is requiring userspace to re-issue IOMMU_IOAS_MAP_FILE the expected
>> > >>     uAPI behavior?
>>
>> Yes. Even if we wanted to the locking is doesn't allow trying to do it
>> automatically.
>>
>> > The way I designed the P2P selftest support requires 2 things:
>> >
>> >  (A) initiator: A device that has a VFIO selftests driver.
>> >  (B) target: A device that can provide a memory BAR (vfio_pci_find_mem_bar()).
>> >
>> > So far I haven't found a single device that can do both. But you are
>> > right that theoretically a single device could satisfy both
>> > requirements.
>>
>> mlx5 can do both
>
>Looks like GPUs and NVMe can do both as well.

AFAIU the memory BARs for GPUs would need initialization. The internal
VRAM needs to be exposed (mapped) to the BARs.

Do you think we should have a P2P device "setup" step that can be
implemented for various types of devices?

Thanks,
Sami
