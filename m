Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D2D36922A
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 23:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771890148; cv=pass; b=Buw65WKAP46wh5qXZC4nnJroyxNJy/OGBBW69/eOlc1E1sjBMta2W9rJVezydMqqiHbXWpgtX+MjUyuNfbDDOuXDbumXi2W1Sxds8fse+K1npMGJa5Tji7B2gFrCSenJxi/o6qQooGdt614+g+99lW/984vHKf/WexP9FZbAMVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771890148; c=relaxed/simple;
	bh=G1G7Co3UGLp29oZTzIMMy89dawTZvG8ZKLFe9M3O6sY=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CP+o6fxG/vDg1G7537i+oaKhc+6oewVTcpKAIKkJyUL4UWnWBCvjJYSJsfkbxG/cEFbDV+ITneFrmn6JtuEUU9lZYt8RxDo9it+KyLDvuqNSXO0i/aWwZKjMvIupc3adeztPq+J0/gl+ZYGzUoeFYJlXnko3v3hATaGlF09r8Lg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4npmqqkZ; arc=pass smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4npmqqkZ"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5674689e507so2112382e0c.3
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 15:42:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771890146; cv=none;
        d=google.com; s=arc-20240605;
        b=kXwB/6ZEJkhoI117JRVQL3VdHrLwobqGB3GrZbo7yqLRaUeveAnUGeayRiRuHnbpgp
         z+InNBm6bhfg485U07xcuXgNP/BRW3i01EIIaH0QDWdJkHFpdtgzeZvQD5juoq5L6Jc4
         j2Q9jo5sGT/qO7pEJscXZVAHgf1CSXDfERhMB8tPMQrG4J5W7P8xkwEMw5BJNRrfAguG
         MRqn6eOmeYa6XRpIYlEVMfuUXkOa3nqp8Hq/zAwh64R5xF9LK9o5zwfbxSrSmoEkahy3
         cm6WGktPGvD9B/sHxkTYd2EK1z8BfMupdbeqeBaqBnBy8K4HQMl2xJMur5G/V5mFe5TG
         xReQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=G1G7Co3UGLp29oZTzIMMy89dawTZvG8ZKLFe9M3O6sY=;
        fh=I4mxr1083NI0AfQ6fHjffvaPaRKcsV4e8yyb6SX0nQU=;
        b=bgQ4t3QBfbJ0qAE0wKYyeOi7SZ1OAuDLxr0OFNbMXO3di3Yz/plVH3GZJdsLaRIwHU
         Im2Ru0cnEsHC8Pdulz5LyaGw2k0yyyozEo+Pb8+qKzKKDVMkMvJFCYqdH88Kn2ekZCv8
         cumjZNjq8ODxAo66ANXvZY5y9tv2IBaQoLQOC3w6SjQoAXuZZ7kDu29zp7l2/IsGukdg
         wyPvs4IksKlnb3K+qA/kjPLCyF11qu5OipqNsTB8O1yf31CVUl+h63FmFBRHv4z1XNAl
         gdIOgXkf/ZS33FBcFrmL+INT1iff72SaatiSZs2VvosJTQY3M1A3dOFHF+fCY/kMz/Yz
         V2JQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771890146; x=1772494946; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=G1G7Co3UGLp29oZTzIMMy89dawTZvG8ZKLFe9M3O6sY=;
        b=4npmqqkZVD4RdxyIRdLVN3GJ7fxWuMZCnqv7lxvXKBLGnYLdgHySwMxoi65MgG7ZHj
         q/mQv62NpefnTqLd5SVDhmDhjWjQs0eTdLhx0WK/S+dpkS6YzqJjbeGoLxj8en304v9P
         WjJ2xHvxEejgELw1MUKyU+IGjKcCUEP8bHGCB+O1WkB+bIxrm1Jm0LJp4ZXaMTq/Yjyw
         Aq1yTR4H6M+iZsZEIPqRNGjLmWUAxBEk/m3nKtxVTxufNpwaweCPnVtKKJvHPHnx85x5
         hcfTk2fuxe/ilc3cu/6XP5AlNVlhu4IkSHLUt2xOYN2xfWvB0+yB1nQhxnQ3gd84iVka
         Nmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771890146; x=1772494946;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1G7Co3UGLp29oZTzIMMy89dawTZvG8ZKLFe9M3O6sY=;
        b=nNO412b2A/4h7ZKUKPs/bpyTVumR6UzTYsj/MZJlQCQ4OrUDHFxX0GrnGlHEI5haYw
         nuARzICzVAO7npU/2nn6ypjVKuI+wvlO1eARWLpCYdRaZDqFB7fg4a6DPe2sAhL5SRZO
         Jc680DI3xeFHJ/ptrwGbgKKpCfjMHlCAcwO4+O0rmg+CFlcSypR+BxPhgq+dqJYBVJqB
         jSW/1d8D3O7gnhDqeSburB8yYc7Cgh88gFjZB8e6RY/BBVyE2Yefpm+/bPzIfy/d8DRV
         ebSIsGRMNoJS44pX56iwncnAHU4j+7pXBlkxYpt9CSZYh5G0mz+GCAy3HC9InoSJRmiq
         492Q==
X-Forwarded-Encrypted: i=1; AJvYcCVgBIbYKXRz/nwIi3RF+nljc2F5p3MyGUHuYdtZJuprY6YlorvI5np4Ghtjb7wt95Mopied1tF0kgQNCQWsZ90=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrRRmzUfwK+8AqJHoFUn2whGLpw3gDU7bCes+nJco2K0RU7GPO
	njcOw6V2mL78PH1tzoNpGrfoJtpfggnaxD9tlqtMoEw1BR0uKemSqbbPK2TdY0YbxFg0mxuMO27
	7Ou8dDXYUDJG1R5LkxPLXB7C3QMrOcWqGeaQbgLDA
X-Gm-Gg: ATEYQzxWAGP1s34ozxhc9tJqKzHttyygA6R2H/eFkmhkqL4wrZ/XzjSekKOfZ9MXvfF
	QnXc2JSKl22TtawYous7h5Qef+QCiTbNchRWqWAO5HGNGpwH5V97q3AJf9cs17gFb1MGnEQol1V
	dhDmi8rjAdmvi/m1MEIZaQmXMLESA1kqRN79XRH2e833zjBD6wOkzoyGfUZ4B3XsGWUcL2WPj86
	wlPKas5SCEt88jaWEr9gfx44bHGuWRg0P7UkuzIOPP0/eRe0edkNYxpZvaOj1JakA0eYjW6JXrq
	C+Q2KZFfLqkMpYrUtPnl2Y+G0xdUsrqec8zv+IK+0w==
X-Received: by 2002:a05:6102:3053:b0:5f5:32e2:5ea2 with SMTP id
 ada2fe7eead31-5feb30fc3a8mr3035084137.37.1771890145956; Mon, 23 Feb 2026
 15:42:25 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Feb 2026 15:42:25 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Feb 2026 15:42:25 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <a97045a9-8866-40fe-aa15-d319cafa6f2c@kernel.org>
References: <cover.1771826352.git.ackerleytng@google.com> <a97045a9-8866-40fe-aa15-d319cafa6f2c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 23 Feb 2026 15:42:25 -0800
X-Gm-Features: AaiRm52aDnZI9CEbv5M2DeAz_Eaea7Sv4JJPWItwl1wMCqksqqJ4XC4LTodyGY8
Message-ID: <CAEvNRgFF0+g9pmp1yitX48ebK=fDpYKSOQDmRfOjzSHxM5UpeQ@mail.gmail.com>
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

> On 2/23/26 08:04, Ackerley Tng wrote:
>> Hi,
>>
>> Currently, guest_memfd doesn't update inode's i_blocks or i_bytes at
>> all. Hence, st_blocks in the struct populated by a userspace fstat()
>> call on a guest_memfd will always be 0. This patch series makes
>> guest_memfd track the amount of memory allocated on an inode, which
>> allows fstat() to accurately report that on requests from userspace.
>>
>> The inode's i_blocks and i_bytes fields are updated when the folio is
>> associated or disassociated from the guest_memfd inode, which are at
>> allocation and truncation times respectively.
>>
>> To update inode fields at truncation time, this series implements a
>> custom truncation function for guest_memfd. An alternative would be to
>> update truncate_inode_pages_range() to return the number of bytes
>> truncated or add/use some hook.
>>
>> Implementing a custom truncation function was chosen to provide
>> flexibility for handling truncations in future when guest_memfd
>> supports sources of pages other than the buddy allocator. This
>> approach of a custom truncation function also aligns with shmem, which
>> has a custom shmem_truncate_range().
>
> Just wondered how shmem does it: it's through
> dquot_alloc_block_nodirty() / dquot_free_block_nodirty().
>
> It's a shame we can't just use folio_free().

Yup, Hugh pointed out that struct address_space *mapping (and inode) may already
have been freed by the time .free_folio() is called [1].

[1] https://lore.kernel.org/all/7c2677e1-daf7-3b49-0a04-1efdf451379a@google.com/

> Could we maybe have a
> different callback (when the mapping is still guaranteed to be around)
> from where we could update i_blocks on the freeing path?

Do you mean that we should add a new callback to struct
address_space_operations?

.invalidate_folio semantically seems suitable. This is called from
truncate_cleanup_folio() and is conditioned on
folio_needs_release(). guest_memfd could make itself need release, but
IIUC that would cause a NULL pointer dereference in
filemap_release_folio() since try_to_free_buffers() -> drop_buffers()
will dereference folio->private.

From the name, .release_folio sounds eligible, but this is meant for
releasing data attached to a folio, not quite the same as updating inode
fields. This is also not called in the truncation path.

>
> --
> Cheers,
>
> David
