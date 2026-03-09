Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F314525A645
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 15:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773071114; cv=pass; b=kX2qc/uEypfYBgvuSlcHL/Ki+wKF4Xzxd9JyErlEVMcyrziG2jG6Txnz3KtJXhTXTWmfLtR9vm1i3iqFjsciGe9jJzHqq8kK8utguUHeSjEYIS1EpCEI2tHK4hiWG25MKuvX9BJv3ltga3w6UR+Z1dy2tYzWHiRft5o2EhnUM0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773071114; c=relaxed/simple;
	bh=FQ+rfw6YSM+Ur2t0O+8S8EZHYkkVvAytEeux3uABvPk=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CLyPk1sfIT6EmOcFT/gP/lEhHaVzt0Zo+csFr41twxtjfJl84rC0CDTYVABKAJJRTqxCBQpwAEtOk4G15Ue43mrmhVyabrkhxQ6vmpfreqPEE4O6kC8eEA22CIcwv8SkdvOs+RVP7gAm93sRal7pqEEVn5YCjLla9OMXJXmVrm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xI5mH1Ok; arc=pass smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xI5mH1Ok"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56aebfb4184so5175434e0c.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 08:45:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773071112; cv=none;
        d=google.com; s=arc-20240605;
        b=WMmydvFGU8WeETMcbQuhrVaYOWDDEMYUXFcVQ47ZLybJu6PhBchixh/8ZhqvUxxwXE
         88wFV0Kbek8ohAYGgbZCu8IhIDwLwy8DJ+T6FPb1rp7CpRA7cLxlIxiWta7jbhdReKOJ
         6akmL9lzf5KUt5Xan+Ue8GdJDZYwLcNXlwNYtb1+gTuornBkMQQqmENi4iHcaqLxqTtL
         YFDdwGPeekDsmwxzVh1kPIkPA21xBacNI+DM5apinREIOjXImjfLTvukOQ4K93S/+qxS
         G8Y51BFvmgiqUt9qG2pH6/P8f32XsJaK1lRVvq8JjFRfSPmUsZwOMauCInbjqz4DlNq7
         fCXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=bKp7UfWwsR+Qtr2/5qSzMlZ35ZQUtFxqOaPiGk/f9/o=;
        fh=ncM33mb/T7aEFsWg31G0HQNCYivb+evFDW32KdxqzZA=;
        b=RD/5zcOJBrc/9gN76a1e8Wxc4dBADJ+OPSKKKcdRlaSDs23p+WtTHuhbfyfITC9JO0
         RiDXNaX6xN/Y3+mLK4TBJhLShUSDjWthx9jf5/FH2GT4zRWbk+kd0VjsUbTKyzHtTM2e
         bAXUHRt1qm54ufLaH0V7qHqG699amYZ5xdaiOa0VhnQ01eTJ0b5ThlyRKiBb28zKaNEn
         wwvdNrsiSiJS0ZS0+AyK2jQ7ddhAqgAEdE2U4yHWA83rBvgV/fNl55M5YkAv5ERutc0V
         YcESMSCM9vT/H1I2ybqWeF/9N6FO9T5kIkCWCKHg57R5JiO9ZBOdsASwHiSG4dzBHnpV
         FdSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773071112; x=1773675912; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bKp7UfWwsR+Qtr2/5qSzMlZ35ZQUtFxqOaPiGk/f9/o=;
        b=xI5mH1OkbEx5rEciwSIW1r8sSiLBgdGlSOlZdRK6ui/M4nAvFHW8cqdINYfAXsV8uG
         nI8bSnfXg0WmJyzGTT4KYmmik5uOhjiWXFNNN14RCQ6kfG8md8JpD12d9PnsFp8CBb1s
         M8dPVYwMPiKqykvvLzCaRCNuF6x88XCJz0UtP/nxZjLTELP5LxX3WZ9mmh4rvorqeHDC
         FyXPy7Jpc0aPA/cTi1HrTrP/p+3xCtoe/TNwAtZwTewTH8loPRekj2HfeUsE0o5Y8BdT
         E9EMgjx38u6ekuFmEvOkfZ9NWw8lFW9GeB+xS0zv/EBLsB1y0gkdSa1SZtV4LgVKrjRb
         EGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773071112; x=1773675912;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bKp7UfWwsR+Qtr2/5qSzMlZ35ZQUtFxqOaPiGk/f9/o=;
        b=fx32GU2gvSD56vF2h3LjEDy4zoAY9oARATIj/ym34LnxBom1+nsHeCbQKsdr62FgPE
         L8hNW0tLpUmg3j0ungl7JeoMlEv/qCpUb19kg/RUFL5r7HRFUa/821Frd/bHJy4bm06s
         U2OVbpJayucM9EGk2ckzimTTTdAOZ6issQJ8dxJjCVfwvAyVBNyi6NZPWW2hsHzoj9jf
         pDkiKQKCZC+xtqFSBqFNCyu2zPh+X4pfYvqKcdrt1US2ndx8UiJNlwZZjlTZEdGyibdv
         r2X0qaNq1/Hkj3kDZU9z5gdbDxQRQA47tsmtvL6JM2p9EmOnsvk9/2nmtuUwZSk5y8q3
         eJug==
X-Forwarded-Encrypted: i=1; AJvYcCWBPVXmGDGtzujWMJ9OEsXCfJkxhfhBxqZMA3LVl1zdNADuBgPYLxBje2bxqzz4Zat8R1sg2GbY8Q3ANWvpgW4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2wyhjVALNNoViBCQtbVnperhUVDS4FW40Jh+Lb7jRvkPOJQvR
	hDMRjMW7B5huTKbsJuHM5R6sXNcJheDLLbbm1PwjJ6v1Hu6sLU4hrigmnCZZr3zzIPAC/B+UXM9
	Xh25pvurtUT5/xaA+g60BAy5Wgg2Mmur2QkLiT173
X-Gm-Gg: ATEYQzz61JG3oZ6SbaiJw9dup4vGQ5XS49f0VM2XfCmFu4EdbTdz9M/5UXmAbR6SOu3
	bROI1wO0iqgW0ieCmghHuF3FVLpHYrq0wYZ3MvlZ8mAMsm2sCmdtnGSOj2Ikp9+Iu4v3ibt57aS
	hM6rgQQPg85KsUiT4qiNKIBopgKK7HMsq4EmQSZSDlcMJXiF1KoG0v8DCGUIIDldQ/9KvdOUYXm
	dW7XbboPJlC1Ryq6olu4Kcu1LrmQeQ+gp4z7RQpwTJgRxobLi9WQ31aRWUAX7Y7AGvriQoYKUe/
	BBdNsi9SI51Cz92N03uYYNJrs6O74+k17WjlzZE1Dg==
X-Received: by 2002:a05:6102:ccf:b0:600:131f:b68a with SMTP id
 ada2fe7eead31-600131fe1bemr2252059137.23.1773071109964; Mon, 09 Mar 2026
 08:45:09 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Mar 2026 08:45:09 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Mar 2026 08:45:09 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <577c4725-7eda-4693-a55a-413572541161@kernel.org>
References: <20260309-gmem-st-blocks-v3-0-815f03d9653e@google.com>
 <20260309-gmem-st-blocks-v3-1-815f03d9653e@google.com> <577c4725-7eda-4693-a55a-413572541161@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 9 Mar 2026 08:45:09 -0700
X-Gm-Features: AaiRm50NI2W_b1s4wqVK3z2E19_F4wrYli0WrzITukeFFAKkCo-7bYk8Lb2_YMI
Message-ID: <CAEvNRgHhFoyh__shK_YefhUOTP4RaG-sivUH=4Gj-2iy1HX+tw@mail.gmail.com>
Subject: Re: [PATCH RFC v3 1/4] KVM: guest_memfd: Track amount of memory
 allocated on inode
To: "David Hildenbrand (Arm)" <david@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	seanjc@google.com, rientjes@google.com, rick.p.edgecombe@intel.com, 
	yan.y.zhao@intel.com, fvdl@google.com, jthoughton@google.com, 
	vannapurve@google.com, shivankg@amd.com, michael.roth@amd.com, 
	pratyush@kernel.org, pasha.tatashin@soleen.com, kalyazin@amazon.com, 
	tabba@google.com, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

"David Hildenbrand (Arm)" <david@kernel.org> writes:

> On 3/9/26 10:53, Ackerley Tng wrote:
>> The guest memfd currently does not update the inode's i_blocks and i_bytes
>> count when memory is allocated or freed. Hence, st_blocks returned from
>> fstat() is always 0.
>>
>> Introduce byte accounting for guest memfd inodes.  When a new folio is
>> added to the filemap, add the folio's size.  Use the .invalidate_folio()
>> callback to subtract the folio's size from inode fields when folios are
>> truncated and removed from the filemap.
>>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> ---
>>  virt/kvm/guest_memfd.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index 462c5c5cb602a..77219551056a7 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -136,6 +136,9 @@ static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
>>  					 mapping_gfp_mask(inode->i_mapping), policy);
>>  	mpol_cond_put(policy);
>>
>> +	if (!IS_ERR(folio))
>> +		inode_add_bytes(inode, folio_size(folio));
>> +
>
> Can't we have two concurrent calls to __filemap_get_folio_mpol(), and we
> don't really know whether our call allocated the folio or simply found
> one (the other caller allocated) in the pagecache?
>

Ah that is true. Two threads can get past filemap_lock_folio(), then get
to __filemap_get_folio_mpol(), and then thread 1 will return from
__filemap_get_folio_mpol() with an allocated folio while thread 2
returns with the folio allocated by thread 1. Both threads would end up
incrementing the number of bytes in the inode.

Sean, Vlastimil, is this a good argument for open coding, like in RFC v2
[1]? So that guest_memfd can do inode_add_bytes() specifically when the
folio is added to the filemap.

An alternative I can think of is to add a callback that is called from
within __filemap_add_folio(). Would that be preferred?

[1] https://lore.kernel.org/all/20260225-gmem-st-blocks-v2-2-87d7098119a9@google.com/

> --
> Cheers,
>
> David
