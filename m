Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F1538F235
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 07:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772090341; cv=pass; b=KgT55065XlPv+MLSyvbxQkNHHlOqNTqLmhisN6m983ArpDGVdzvT0mXtDjSXfxlglvgBaP9FMGggWvNwAzlwntT5qdAgNDIjkxXjv0PgXGk3KTKoLn2qVpmwVVqz3bnXEUttqqQ0wiI5MWyvp2+xaO8sEpYVI/K3BSOZh5nawMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772090341; c=relaxed/simple;
	bh=5kZAYgXFbfkfi4UQTiPb13p2MazR2wn4poiXvnKgRZ4=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WG+Lhc4N1T9W/mj23exI7fXMJroVNIPxYYq3OXbm9mgQnMrndwl+dfceU8y62ufv/FGeHVN1eGV7zmqAu49PiotU5tabYye7LrNhMXR5eB2joX2K7m2OoO65z2o4w/QPPIL+KmdaRKfUu3807vnHn1TDUS9e0yAa1h4GWgNf3p0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UkVgGHqo; arc=pass smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UkVgGHqo"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5fe086fb0bcso91582137.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 23:18:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772090339; cv=none;
        d=google.com; s=arc-20240605;
        b=fm4D2nrmhlC2GgNiRrWnax2s9UzixZFp17bbri9dk4evaewN8qMAYa7zRL/Nh4i/7k
         /6GRK8Pa3F0dt4Fy2VHYOrbLflibgXQFw7+nn3gLtkmPrH38SfBJ4b5LtW5EColgTpRA
         cLssDmzjbw92hYKJy9CqE205ySYiqEXr5qtKnau4VvAYiLpz74YfuMwtbzZAmkG4PukK
         pJOX5CI4IPW+7E6aN1Euw/soZLpcf+raZk3dsNE7X07Yn6Dfy8lmT3kKN9IW+2lpV87P
         1kSznVVvozf/MQJLPcMA49tOAotif0AENpVn/VirG3M01GRp6Obaf7aG9VxnfGSNi0Ys
         MgGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=38TkFjWu/yMjVfuieCXSU8i+AJioChf0CvAqY9rgty4=;
        fh=h7vVF0lH//MyWf8FnATejH1XigVmMfvSr6KCI53C4KI=;
        b=VfNbgp++VBd5GfJvbOXIUwVQQsdIlqMSUPZSKIxdFnJW+8T0v+/ujKa03A9GcWijUD
         r0ZxvBqvqlpCArT/SjnLhRHa/Im5ohOdbqdrDuo1Jmh1+3evPiYOnQBH9wwieKpK9ZGc
         h3cyuvlnVgbdnR7khFN8VjzGNDJ64Y/vSXsKegL49k611YLuDbqtu4s59ow9Ks+eWsZm
         PtxvDpR61kwOdlfF2TG+xfvTE5oOXzd8P5loHtoElpeQnyWPNozcTiTiIVOozMN0z1sE
         pje97BLl2dQ1d+uYYOoVgW8NbSnrttbwxVlUdLoMnajNS21//V1tB29tx7yZMerDQ5TX
         zj4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772090339; x=1772695139; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=38TkFjWu/yMjVfuieCXSU8i+AJioChf0CvAqY9rgty4=;
        b=UkVgGHqohjH+9DegPTESkRCcW5GUEqXvHEODRmFWxtri5m9ThGxc4fKgZxf5Saqr8L
         YJrx321iwCj2lurexXPSzZLRMuMfSLaeQ5XJwZpvWgrEsjqL6YSH3oI9aYCxLuciOV2h
         Th3mtvnHTE3jibadRUa+/d1c3fLeqAjVIhgsNS7MDhAsuzKLu/kTjFW7wFk1pfE0UK89
         rLmkznK+fNm1ZoxRdE2UwXAQWBk0B+shMZuOtjUKqb9gSdMWSDPA94hpuqoEAeCbC5Ws
         /qtppmWA9nUOL4IdxWS/iQwOlrAUzPQIRiWQ0MavabJ8C/bh7UY+dLfjza95EZAGluFR
         tEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772090339; x=1772695139;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=38TkFjWu/yMjVfuieCXSU8i+AJioChf0CvAqY9rgty4=;
        b=bBT/QwX9ALYxCZJ+vX5b8owyfNxJBsKw+UK7vFw8Wm/0D2moBy6r20osigY25KkWir
         Yjd2mGvbaf4T6lpntw7eTTlu746sFB5h4EMUUl6nFZ9/D2seJn9+q9pSR7yGbFrSZ4T6
         8EKqQVSXzGM1WwoguqaYuNpiPV/2hQRzMPnd/PJnO3HtCZQugOHeunVo3i7B4JMXYV3N
         oFrIhcqCYEYJ2v9IYtvMID8tRL+FYSaq/nw5mi7mz6Psx/WO8WVDmQ55PNyIuJP6ECBZ
         qPgH4TXhsRb0ME22nGv/SLqiKUEml/pNHsDW0tuu3Kw3ValwKsZYgBRe3xKZOPCpY6tx
         zNkw==
X-Forwarded-Encrypted: i=1; AJvYcCXJUpb6aSwNUTkLNhiRnFQPbDhjEIQi6Lpi/qkHTE1ceRO4wXUN1ZyM+XQ3gtSfLLrCoc/2GXkKuGb+yYedq0A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6zEEdRmx+wvU6quOALwTUzdxKpRRpHhm0RHec67l5iF3bXznJ
	jQ7H1p5ZpbanaHdzssGinimRHmVhP1sQcpzwu6EonSNQJRyI+W9Guzz8OWeriNcBWdQCD3UPB3v
	wwg79Lw5cHlR9JqMYKxO8NidJqSv1lFf5ODXbASmyNgC5xHAHtUTPOTfO3HGsPg==
X-Gm-Gg: ATEYQzxlE/d/l8Pyt8PrOYeejw4ElYQZpsyMB8yfNCaDyIqGYTOmIqvW+J6UmGVwfHB
	gssGvLZMMZ2nlNhXnRVsfLwIOd9dntbbCRYrbPurVlU1BTdqjY4JVNhihnITAe6dCtxOf72CdzM
	Gwj0/WatwcliHJSQcf6Xq4WMYxXBJMJ/+aI3+q/hw6lErSZnz9u66lOQEr9tZp9Tyd39Ki+RnLq
	PoTzyn6jS0Jo43vtlYvPj/PYbyZxlfkmHLaFC3xhe+UQpYjbuwhZu6/uNweXnB6d+yYxuiYjbCb
	N7sgL3kIlTptK0gXIydBFbf1pZLL4tjhbmN4ypofws6gp1f7N70puqp4AHcv8P/Axy9g1g==
X-Received: by 2002:a05:6102:3581:b0:5ef:2cb8:e9db with SMTP id
 ada2fe7eead31-5ff13ef650bmr1386972137.18.1772090338420; Wed, 25 Feb 2026
 23:18:58 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Feb 2026 23:18:57 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Feb 2026 23:18:57 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <f6649b09-aa64-4c91-bf3a-ba706f023180@kernel.org>
References: <cover.1771826352.git.ackerleytng@google.com> <a97045a9-8866-40fe-aa15-d319cafa6f2c@kernel.org>
 <CAEvNRgFF0+g9pmp1yitX48ebK=fDpYKSOQDmRfOjzSHxM5UpeQ@mail.gmail.com>
 <9ef9a0bd-4cff-4518-b7fb-e65c9b761a5a@kernel.org> <CAEvNRgESctVm9CcEyK36hY8Ta=DEDOS1oW5w0qRDoNfdd=470g@mail.gmail.com>
 <CAEvNRgFyRsqhv7CuuDARHTFSanzOHaudM6JMBLwxDwsrjTNCGQ@mail.gmail.com> <f6649b09-aa64-4c91-bf3a-ba706f023180@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 25 Feb 2026 23:18:57 -0800
X-Gm-Features: AaiRm51uhp_e3rB2FjbroD20Md18UNjoNkKYVi3b2D7VPNikPNLP_eyGmYzYmA4
Message-ID: <CAEvNRgHaDDTW_CFT_91Rqzx=OErmiP1GvtuCYnAs_wNRWb-hZw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 00/10] guest_memfd: Track amount of memory
 allocated on inode
To: "David Hildenbrand (Arm)" <david@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: akpm@linux-foundation.org, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, willy@infradead.org, pbonzini@redhat.com, shuah@kernel.org, 
	seanjc@google.com, shivankg@amd.com, rick.p.edgecombe@intel.com, 
	yan.y.zhao@intel.com, rientjes@google.com, fvdl@google.com, 
	jthoughton@google.com, vannapurve@google.com, pratyush@kernel.org, 
	pasha.tatashin@soleen.com, kalyazin@amazon.com, tabba@google.com, 
	michael.roth@amd.com
Content-Type: text/plain; charset="UTF-8"

"David Hildenbrand (Arm)" <david@kernel.org> writes:

> On 2/25/26 08:31, Ackerley Tng wrote:
>> Ackerley Tng <ackerleytng@google.com> writes:
>>
>>> "David Hildenbrand (Arm)" <david@kernel.org> writes:
>>>
>>>>
>>>> [...snip...]
>>>>
>>>>
>>>> If that avoids having to implement truncation completely ourselves, that might be one
>>>> option we could discuss, yes.
>>>>
>>>> Something like:
>>>>
>>>> diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
>>>> index 7c753148af88..94f8bb81f017 100644
>>>> --- a/Documentation/filesystems/vfs.rst
>>>> +++ b/Documentation/filesystems/vfs.rst
>>>> @@ -764,6 +764,7 @@ cache in your filesystem.  The following members are defined:
>>>>                 sector_t (*bmap)(struct address_space *, sector_t);
>>>>                 void (*invalidate_folio) (struct folio *, size_t start, size_t len);
>>>>                 bool (*release_folio)(struct folio *, gfp_t);
>>>> +               void (*remove_folio)(struct folio *folio);
>>>>                 void (*free_folio)(struct folio *);
>>>>                 ssize_t (*direct_IO)(struct kiocb *, struct iov_iter *iter);
>>>>                 int (*migrate_folio)(struct mapping *, struct folio *dst,
>>>> @@ -922,6 +923,11 @@ cache in your filesystem.  The following members are defined:
>>>>         its release_folio will need to ensure this.  Possibly it can
>>>>         clear the uptodate flag if it cannot free private data yet.
>>>>
>>>> +``remove_folio``
>>>> +       remove_folio is called just before the folio is removed from the
>>>> +       page cache in order to allow the cleanup of properties (e.g.,
>>>> +       accounting) that needs the address_space mapping.
>>>> +
>>>>  ``free_folio``
>>>>         free_folio is called once the folio is no longer visible in the
>>>>         page cache in order to allow the cleanup of any private data.
>>>> diff --git a/include/linux/fs.h b/include/linux/fs.h
>>>> index 8b3dd145b25e..f7f6930977a1 100644
>>>> --- a/include/linux/fs.h
>>>> +++ b/include/linux/fs.h
>>>> @@ -422,6 +422,7 @@ struct address_space_operations {
>>>>         sector_t (*bmap)(struct address_space *, sector_t);
>>>>         void (*invalidate_folio) (struct folio *, size_t offset, size_t len);
>>>>         bool (*release_folio)(struct folio *, gfp_t);
>>>> +       void (*remove_folio)(struct folio *folio);
>>>>         void (*free_folio)(struct folio *folio);
>>>>         ssize_t (*direct_IO)(struct kiocb *, struct iov_iter *iter);
>>>>         /*
>>>> diff --git a/mm/filemap.c b/mm/filemap.c
>>>> index 6cd7974d4ada..5a810eaacab2 100644
>>>> --- a/mm/filemap.c
>>>> +++ b/mm/filemap.c
>>>> @@ -250,8 +250,14 @@ void filemap_free_folio(struct address_space *mapping, struct folio *folio)
>>>>  void filemap_remove_folio(struct folio *folio)
>>>>  {
>>>>         struct address_space *mapping = folio->mapping;
>>>> +       void (*remove_folio)(struct folio *);
>>>>
>>>>         BUG_ON(!folio_test_locked(folio));
>>>> +
>>>> +       remove_folio = mapping->a_ops->remove_folio;
>>>> +       if (unlikely(remove_folio))
>>>> +               remove_folio(folio);
>>>> +
>>>>         spin_lock(&mapping->host->i_lock);
>>>>         xa_lock_irq(&mapping->i_pages);
>>>>         __filemap_remove_folio(folio, NULL);
>>>>
>>>
>>> Thanks for this suggestion, I'll try this out and send another revision.
>>>
>>>>
>>>> Ideally we'd perform it under the lock just after clearing folio->mapping, but I guess that
>>>> might be more controversial.
>>>>
>>
>> I'm not sure which lock you were referring to, I hope it's not the
>> inode's i_lock? Why is calling the callback under lock frowned upon?
>
> I meant the two locks: mapping->host->i_lock and mapping->i_pages.
>
> I'd assume new callbacks that might result in holding these precious
> locks longer might be a problem for some people. Well, maybe, maybe not.
>

The extra time (for guest_memfd, and almost no extra time for other
filesystems) is on the truncation path, hopefully that isn't a hot path!

> I guess .free_folio() is called outside the lock because it's assumed to
> possibly do more expensive operations.
>

I thought .free_folio() was called outside of the lock because after the
folio is removed from the filemap, there should be no more inode/filemap
related contention, so any cleanup can definitely be done outside the
inode/filemap locks.

> --
> Cheers,
>
> David
