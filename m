Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9D02D8DD6
	for <linux-kselftest@vger.kernel.org>; Tue,  9 Jun 2026 01:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780967697; cv=none; b=kt30lsQUBJOv0qazUuhKNX0SPaAuUggTIMhc8WyO9n+3UN1NCmS6bPxT6kvOq+uru3ckgKk3cfLe9M58sfpjyPRpMcSdad9UXwthStaukWnekDiJKxOT3xVAz7DLOSeSvACUqC/qVFsyewmrjOvFQ2f9v8j3onIae+MrqGOfD/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780967697; c=relaxed/simple;
	bh=hj1Fq6LHV1ic5dn6Rszt6KztxqEuzXCQBnDMl++8g+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XU+DaKHY3ENjZ7E+z3kU5WH/FYNCj5BX1Zcnhywlgq3b/NM6D1LwJrcXorWGGEWepPfPCKngJQVdBMXbW23pQ9izuei8VQ+SepmJOcYB9yhlfrnWZ5A0aWbySp+IHR9SREVnSXqeJYWhDetw9qClJ0auMTLY53VPAVRHdCqZvFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=ESmYwpTY; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="ESmYwpTY"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-9159477c893so627672885a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 08 Jun 2026 18:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780967695; x=1781572495; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sgWc+GbcdT1TE4KoGHerpUiSmy6CQo1tAeSFDOuPHPo=;
        b=ESmYwpTYtqKI9A0/icDX590wO9mqHvjUfxx9LZ8obhtZ/CpgHgTbN2HnIS/rnvISiz
         cAGLpdVzMNYS4/rOTBQLZg0pDE4oixYrmZ40yLwo7vNDH7/WbYQwlow1wzAjrBdvhc7C
         eFukaAcjLkpqQGegnPOFQ45j5jnD4EzWi70LrsHEnwMH1CjXTha5ef86neurgPSl2l7K
         2vGetYC8q/mv87Gf4QxWtJ/kzLnoMdYvH28tTFvVdEL8D3xcSGWrORKVUrekuRQbNiGK
         WEFgtru2a8+oKzh9kO6svJT6SZOfItjCoIHaHuXry8V9Qc425BlR2SoPjiQSxqSj8Fmt
         zLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780967695; x=1781572495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgWc+GbcdT1TE4KoGHerpUiSmy6CQo1tAeSFDOuPHPo=;
        b=RO8uIs/WKaGx5rfijItU28DrOQ5QbE9AuHquN6P6Kgq/QukLXD3VGBanRgFfmYT8Hn
         en27ex9aZMxB07h9DJFgWlLVAwiaP5KkaorSd5aNi8DsTJJ3MlCQceTWgX82/101vjKM
         Pt1c9a7xFc2gALM4pnQc3ZcClPpXelUQYqaR7mmhSOSmzo956cJaiAYA4PFzzzc8I4eZ
         h+322E1WNTxgGz5XoaHN9TxfTU5hw6E4ACMyH467Emsln+W81dzFF0f7I2QJqmzimK1p
         HmhbcK4/3JN4fuCG3b62rIBNHpBTv5JFJ3WPI9YAzjt0MumNzROmpTf/jQVVjdkVwTEj
         R20g==
X-Forwarded-Encrypted: i=1; AFNElJ8y2GvWp6UmVEsKJnxmmM9fB0/2oDbyUoK0w5kRsAIuDClr3/qyQuqYRdJxZw/gjT2A9V+gztDv4tP947jlKbY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKbKrwFQ9q3VE2ZCm1+5pXsgGCYIOJbUZJf0zOT037G9ezYkKA
	r1L/M362YzimQkOm1WhR3vz3mHATKvL2QDkBauZM/bhM5V3QI39DAWBg9qmlg0aEHtg=
X-Gm-Gg: Acq92OGQof5LnKyaJ0pCRi4l4bP5p7mrQc3WLvHUbXha9JD+ojRu9RSjdsvo1wwi49c
	1yHUx/11r+gB8gz70BBjhq0Ss7MZeDQ6I04Jx6bHno04/pmHOYI4+xuqcL05YUsCeMBTkkd7S0Z
	07oSND33EmsdRsbmcj+b0Z91sB4IpWIHh98sAIFcZcMx7lL4PihB19TjsrbanTXug1ES6FobKRh
	3cwha2NDJ3M6J2ChOSmQyL9qOL2sc0sDRPrzJdt6VUMtHfwp5xQ3nUtS3XtHa/UuYjoHMUtEV5q
	vrouGtYB2sT/Z1/lwTLHHNBApf3n5p8FBmLAF+rpFpBlyMG7UKfKOUgUu7hwnqle6/66qsXb7FU
	3GqHlhCASUuLp3qK7LMeX7T0bf4pJVxvRQb+LmjayvQBzqj0rkxq1put22LX9EjGDMKiBMKD6rv
	hUPip53VtaqHPn04anRJbPI1JTN2WeG4qCm+9V1f6TT2r2/XOUudFqDNhC4vA0vQ==
X-Received: by 2002:a05:620a:1b8d:b0:914:c0ab:f1ee with SMTP id af79cd13be357-915a9d93f2fmr2862027885a.44.1780967695361;
        Mon, 08 Jun 2026 18:14:55 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a009fe7sm1902384885a.8.2026.06.08.18.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:14:54 -0700 (PDT)
Date: Tue, 9 Jun 2026 01:14:53 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, jasonmiu@google.com, 
	linux-kernel@vger.kernel.org, corbet@lwn.net, ran.xiaokai@zte.com.cn, 
	kexec@lists.infradead.org, pratyush@kernel.org, graf@amazon.com
Subject: Re: [RFC v1 0/9] kho: granular compatibility and header decoupling
Message-ID: <aidnjw5pH_z45gJT@plex>
References: <20260605033235.717351-1-pasha.tatashin@soleen.com>
 <178083348872.1648214.17778188633648887952.b4-review@b4>
 <aiVp5RlbWRz5VnPB@plex>
 <178091437240.1648214.10761111570005003901.b4-reply@b4>
 <aibYJvzQQnpoN6YW@plex>
 <aicF5Sa11B4ujfSa@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aicF5Sa11B4ujfSa@kernel.org>

On 06-08 21:11, Mike Rapoport wrote:
> On Mon, Jun 08, 2026 at 04:12:56PM +0000, Pasha Tatashin wrote:
> > On 06-08 13:26, Mike Rapoport wrote:
> > > On 2026-06-07 13:43:09+00:00, Pasha Tatashin wrote:
> >
> > Keeping all of that in a single KHO file is the wrong approach and goes 
> > against how other logically separated subsystems in Linux are organized 
> > (e.g., mm/vmap.c, mm/vmalloc.c, etc.). Yes, there are some messier 
> > places in the kernel as well, but keeping this in its own dedicated 
> > kho_vmalloc.c file makes complete sense to me.
> 
> Either I hallucinated or b4 ate a paragraph from my reply ;)
> 
> Regarding the code movement
> - splitting radix tree makes perfect sense to me, just the documentation
>   part needs more care than mechanical move

Agreed. I'll also pay closer attention to the documentation.

> - I'm fine with abi/vmalloc.h, presuming KHOSER_PTR() is not part of it

Yes, I will move KHOSER_PTR() to the shared compat.h in v2 so it's not 
tied to vmalloc.

> - I can live with kho_vmalloc.c although I still consider it unnecessary
>   churn

Appreciate it.

> - I'm against moving vmalloc APIs from kexec_handover.h because they are
>   very close in nature to folio and pages. I don't see core KHO as
>   responsible for preserving physically contiguous ranges but rather as
>   preserving allocations. Not sure we'll ever support kmalloc(), but still.

That is a very reasonable compromise. I am fine with keeping the 
consumer-facing function declarations in kexec_handover.h so they remain 
grouped  with folios and pages.

> > However, overall enforcing the use of KHOSER is unrelated to this work. 
> > I have my own thoughts on this, and perhaps with proper versioning, 
> > using KHOSER_PTR everywhere would be appropriate, but let's keep that as 
> > a separate work.
> 
> This is a separate work, indeed. But regardless of the versioning it's
> already better than plain u64 because it provides type safety.

Agreed.

Thanks!
Pasha
