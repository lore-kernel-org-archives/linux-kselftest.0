Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC522877CF
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 07:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772004687; cv=pass; b=DpPg5FjV5bSYD0YhBj44RRHgIy08KoSU72GLxxDLMARQ1ieliFF6tzB3DYSJgLfYi32CTpV4ttSYRR+mcBZok9bb5qE/zn5nshjYcpS934ziips0olnbBDF9EqxnYwTDfpEz7N9VvBNGgP4ou1sPXmaAF4UFcKMEUBWIL9TU/fM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772004687; c=relaxed/simple;
	bh=iGYGT1zAvQhLDodw/8tlbySDHlXg49Ntp6LeHdpPLsE=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jCwOt+7zPoj8OGXRYmndbbYKOQyC7qWOe7m9FkwajJ6IL18plld1sAewlESpe8IwIE5MEuhBbw+Cf0xCKB55FKtvy2fjpNshwOu6v2t9bcCxXNegn9zv4hh5G1R/TOG7D1LAkZtv2cIEJs0fjXoYoJ+jW9BUGz+inq2SVKZA+bY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bWgpGrog; arc=pass smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bWgpGrog"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56a857578a8so54711e0c.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 23:31:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772004685; cv=none;
        d=google.com; s=arc-20240605;
        b=iSz46D6rXYpjh6MLiOll7q0ZWU508TIyGZ9SgVzDoJf9A/xe1NzTm1c+6bhSXJP5FE
         a97Vx59LOyzW9jFImYGIwmIVAs2kCz7pNXEDuotLExZntlHt3xd9Tr8zwldeoa5d/ynR
         Gn1NK46QtKk+a16XXzAvH7z5VNgj/cTDfS9aVjN0AGVaroKhI7RAid02DSMG0j1EM6wn
         rqQqaU1uG1MxEvkDiDfDEsDXuAMln3chHsArujO/2200ftiRYViKirumlAS8fBrMq+xF
         23P7Y9I5UMZ6RpjajAqisj7dQ8nxJ07K//Qe/U2M320Evz83tW+0SciUSB0u6K9mCaZo
         WSQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=XX8b+rtVnqMMtNp/ESqgVDIfe5eqIi9YcNK6m86bxSc=;
        fh=dK6FnD0lk1AAUEj3wqGqeoLhHTiH+9XCN7zv2Xr/lVo=;
        b=gmKmC3U9JvGLmsOcV9moKiJEL/5JqfUTuM47cE9eqVO+hDxtVrslkQ3toG4QqTgCjs
         DBgvJh29POPl/n0aRllRZ4x7ejVDFGsFv2+FlqNmHId742CqSH9gHsC0OAsBRJ4gJK+/
         Tj27aPXTOh9lPicwgF1WOtB2D77MG1JnUc5IqZlMg9586DervtMGcaydXGQo3U0Cyx98
         CvTWhwWjwSL0Gu2bIQGfbJZMCd8aHmpYEYJbyUiwfXQgYGwZemiAIB1zGZkhOBZCOQNC
         nk/NdYsXtKRNFgQDdY6dz3AsiBWOjY3oVPqgUxLzAa8nWLFrxqumoPHLSua7JPrKyXan
         +5Xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772004685; x=1772609485; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XX8b+rtVnqMMtNp/ESqgVDIfe5eqIi9YcNK6m86bxSc=;
        b=bWgpGrog6nsW6EOEHynnZAPGvkBcMVg/s1vfSpuzTZLe7e6t4gBUDAZXvOPcNuoT4S
         pnzbstWM4T9iS1znGoiSjyIWvaDbKYN6o/o71Es5cgPT9w/4NB07oc6aITDq8PiOly4F
         xok/UzWtqKvu4yXXY5lZ21DFx1gn5ouSN5c+mmA0GjPF7rDP6w2UD0Xsq70es5uw7quI
         UQLR1wMKm2YWMNw/euHnkLXp0S93RtVNzISXX9HRBvcewdSLvPd+vkMQsjLDO4JrxF4L
         t2XvIzRh00K4MwpOdL4+M+23Z7HHsUKzVeggTvCwSIHQqe9424kPa8W5KMBq5qWfogcF
         7VbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772004685; x=1772609485;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XX8b+rtVnqMMtNp/ESqgVDIfe5eqIi9YcNK6m86bxSc=;
        b=ZIfjqahx3J8gKS82gJX6aqKTrd0Id3C/cd9gKybqiJuCOpbeboEEcLteBjfzHtG1op
         oxZ9MhIiMZaEPCHzxRaVVu0SoFg7M3I9fV1qsJyJ6Qfqsg5myqu4Z/ZTv/DOK2KHyQDD
         +N892z/nKhd4dSVET0d9JjGxiVtMFh6qfm86j5S+RbKBJAgYfyC9PZtoBpHd7TML1ct3
         nKtc0GfWLT5w2L1Pv2Vkaao2lPsr1IKYBymsAh5AhAQXPDwV1+4xZ7mttX7TEvlUIvJc
         xmP4mXWsXklgil/y658nYkqFsOe4v6uUfJZWtrcLOni+IIuq2Bihf9YTc72cvb/sZ1GM
         UH9g==
X-Forwarded-Encrypted: i=1; AJvYcCVHjvBwsx7nQkquzcmfRp1F1w5VEWi86Cki1W7iFrUIsT861cKbGSCLyoSzVJJ5VsocNGRqyJn22Q/AJIlPHNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSBH4gCc5V+egxOlnotWG0KOr7EneSIifiId6Fugmawra657GY
	LJf5QmVnq9nIEO5IVopdTwRsJNrPA/Pj6T3Bb60N0ur+d1+c0Er6oVAj8YcLXWakMtYB1edmZHb
	wAs5DbVE5IPFyn9Gn6Cfv7ZfzDViNqsupcv6Po7rZQ3fJMU0FrItLf/EPXv2Vbw==
X-Gm-Gg: ATEYQzxjFtw6rB9WWiCZYpMv1lYsqy+cicvpqq78eblT9EhoD02vk7rHT0NBQBIoOMs
	CriltU76Eandol0NrHMiHXvdF0nttmZRlKc106rwlMivIOe03q1KzdG7g4FiFCRPcmkNvn0EicV
	gV5dAjxeGVForDmU8MfMCY1+QawGdMxNzwNe5mEu/1cvnWmZZ2E0yJBE9dON+M7VSavbyv8Yx3e
	8RAKnpB5sM96x6dwBD5+ohdQg9z2CCX+85G8x5kGyM+NOroCTJRrL4Ls0JmTCs3O+7HEYdPSL52
	QuWVjXce1QS5sISEzLM5RMEZsg7Ifsrl+BmUHfeH77xbiCL7RSqiqzZqUt/hnwUlDavlNw==
X-Received: by 2002:a05:6102:3e84:b0:5dd:89af:459b with SMTP id
 ada2fe7eead31-5ff05d62336mr520728137.7.1772004684941; Tue, 24 Feb 2026
 23:31:24 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 24 Feb 2026 23:31:24 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 24 Feb 2026 23:31:23 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CAEvNRgESctVm9CcEyK36hY8Ta=DEDOS1oW5w0qRDoNfdd=470g@mail.gmail.com>
References: <cover.1771826352.git.ackerleytng@google.com> <a97045a9-8866-40fe-aa15-d319cafa6f2c@kernel.org>
 <CAEvNRgFF0+g9pmp1yitX48ebK=fDpYKSOQDmRfOjzSHxM5UpeQ@mail.gmail.com>
 <9ef9a0bd-4cff-4518-b7fb-e65c9b761a5a@kernel.org> <CAEvNRgESctVm9CcEyK36hY8Ta=DEDOS1oW5w0qRDoNfdd=470g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 24 Feb 2026 23:31:23 -0800
X-Gm-Features: AaiRm51zoZaexsL8AgLT-NSu-LX5kDXX-7Kv8iZiX_RuOJxbA-22InSuIouRjL8
Message-ID: <CAEvNRgFyRsqhv7CuuDARHTFSanzOHaudM6JMBLwxDwsrjTNCGQ@mail.gmail.com>
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

Ackerley Tng <ackerleytng@google.com> writes:

> "David Hildenbrand (Arm)" <david@kernel.org> writes:
>
>>
>> [...snip...]
>>
>>>> Could we maybe have a
>>>> different callback (when the mapping is still guaranteed to be around)
>>>> from where we could update i_blocks on the freeing path?
>>>
>>> Do you mean that we should add a new callback to struct
>>> address_space_operations?
>>
>> If that avoids having to implement truncation completely ourselves, that might be one
>> option we could discuss, yes.
>>
>> Something like:
>>
>> diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
>> index 7c753148af88..94f8bb81f017 100644
>> --- a/Documentation/filesystems/vfs.rst
>> +++ b/Documentation/filesystems/vfs.rst
>> @@ -764,6 +764,7 @@ cache in your filesystem.  The following members are defined:
>>                 sector_t (*bmap)(struct address_space *, sector_t);
>>                 void (*invalidate_folio) (struct folio *, size_t start, size_t len);
>>                 bool (*release_folio)(struct folio *, gfp_t);
>> +               void (*remove_folio)(struct folio *folio);
>>                 void (*free_folio)(struct folio *);
>>                 ssize_t (*direct_IO)(struct kiocb *, struct iov_iter *iter);
>>                 int (*migrate_folio)(struct mapping *, struct folio *dst,
>> @@ -922,6 +923,11 @@ cache in your filesystem.  The following members are defined:
>>         its release_folio will need to ensure this.  Possibly it can
>>         clear the uptodate flag if it cannot free private data yet.
>>
>> +``remove_folio``
>> +       remove_folio is called just before the folio is removed from the
>> +       page cache in order to allow the cleanup of properties (e.g.,
>> +       accounting) that needs the address_space mapping.
>> +
>>  ``free_folio``
>>         free_folio is called once the folio is no longer visible in the
>>         page cache in order to allow the cleanup of any private data.
>> diff --git a/include/linux/fs.h b/include/linux/fs.h
>> index 8b3dd145b25e..f7f6930977a1 100644
>> --- a/include/linux/fs.h
>> +++ b/include/linux/fs.h
>> @@ -422,6 +422,7 @@ struct address_space_operations {
>>         sector_t (*bmap)(struct address_space *, sector_t);
>>         void (*invalidate_folio) (struct folio *, size_t offset, size_t len);
>>         bool (*release_folio)(struct folio *, gfp_t);
>> +       void (*remove_folio)(struct folio *folio);
>>         void (*free_folio)(struct folio *folio);
>>         ssize_t (*direct_IO)(struct kiocb *, struct iov_iter *iter);
>>         /*
>> diff --git a/mm/filemap.c b/mm/filemap.c
>> index 6cd7974d4ada..5a810eaacab2 100644
>> --- a/mm/filemap.c
>> +++ b/mm/filemap.c
>> @@ -250,8 +250,14 @@ void filemap_free_folio(struct address_space *mapping, struct folio *folio)
>>  void filemap_remove_folio(struct folio *folio)
>>  {
>>         struct address_space *mapping = folio->mapping;
>> +       void (*remove_folio)(struct folio *);
>>
>>         BUG_ON(!folio_test_locked(folio));
>> +
>> +       remove_folio = mapping->a_ops->remove_folio;
>> +       if (unlikely(remove_folio))
>> +               remove_folio(folio);
>> +
>>         spin_lock(&mapping->host->i_lock);
>>         xa_lock_irq(&mapping->i_pages);
>>         __filemap_remove_folio(folio, NULL);
>>
>
> Thanks for this suggestion, I'll try this out and send another revision.
>
>>
>> Ideally we'd perform it under the lock just after clearing folio->mapping, but I guess that
>> might be more controversial.
>>

I'm not sure which lock you were referring to, I hope it's not the
inode's i_lock? Why is calling the callback under lock frowned upon?

I found .remove_folio also had to be called from
delete_from_page_cache_batch() for it to work. Then I saw that both of
those functions already use filemap_unaccount_folio(), and after all,
like you said, guest_memfd will be using this callback for accounting,
so in RFC v2 [1] I used .unaccount_folio instead, and it is called under
the inode's i_lock from filemap_unaccount_folio().

[1] https://lore.kernel.org/all/20260225-gmem-st-blocks-v2-0-87d7098119a9@google.com/T/

>> For accounting you need the above might be good enough, but I am not sure for how many
>> other use cases there might be.
>>
>> --
>> Cheers,
>>
>> David
