Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A07D3E7150
	for <linux-kselftest@vger.kernel.org>; Thu,  7 May 2026 16:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778172976; cv=pass; b=UQzMzhMHJkvG2e5pl5+OXpvrrbB9oQ+kMHyZ7nX2xTVDrkvi/LwNR1tNkVe8hARUPEGnhMREHJl3h0m4X5a+slZUApuSYQrx//lfUanD5jOtllOj2pMsM9XwKPSiA5VL2+xXZOl9IMZg32lg6Rr7inwOsTvnZLIsq+NpfrZ66tc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778172976; c=relaxed/simple;
	bh=yU58Xq2jlsKwRvWVzMF/35DqD9SuerVG6YnTfgrQsdg=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UMYkESBYgFBafI1ivfFRiYWEI9356qfoWS61LXUXkEuBoIRAy4YOKFqD4cOMhi+/Db1hJ2dbS0JteRXvQVJgM3LfGrDliny43kQz9dKl54ALMLmGHkMnKIhD2g2Db9/bFBxfAlzrUCRSxUOd4i1PbstD1TRdwoffKSEWLOWQy/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X+qM3eJX; arc=pass smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X+qM3eJX"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-95cc3522c40so683155241.2
        for <linux-kselftest@vger.kernel.org>; Thu, 07 May 2026 09:56:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778172973; cv=none;
        d=google.com; s=arc-20240605;
        b=REieHhtoX8YY8k62ID/k1JIdC1WdiG0F+NYF6mBvLC343gD4K4/A3w9CntvhObXazW
         UDoG8+jNeDbmHVxpjyAdOq6WJpksZTXivj7wQmELV9cKhW22PV1g1AmojJN7AUkyloJj
         NXVPPpsmlCfoH0w1oFCjy0k2zGVnqLX6NHjxqze4LFNMM6crFHZ3bS8YHXTLfoU6kBEx
         JoN8ZBfiSiEqhns4t+Ig5C7OTHVk4tcEedr2upezZGIWvO/7PvuDhkvqAPjvaYMlu3jF
         rHnaU9NXmX0QMa3ifLTKjw2KuPuiH7JO5ZW2uqTvOFxcCBB3ceGeKAaZS6Q/inNP2L1q
         I3Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=fxKJNK3JYOXtq/6RpdHSxauIPnnYNnrQjQPiGKEVycA=;
        fh=p4ymcQUHihWbeGHKPAcQHq6SxxExoGaR+Qow2VyWTr8=;
        b=ZsBS6swiYxMdQsrJ51CtiPw6OsqmF/DNO6LnJGlfcGf5uQlu01CDjyGzy+m3PgIK74
         DFlDLMRQUxSS1sbHdrLYeAolwKUrb+G45JunIpkwG02Z2Op22gAPjFA8x+gBqb6OIJQT
         0c9v8RQ4ovZ9sW5cXijAAZDbYxFSfJdWeexraHbtJkiChswOnQ+q7lDj0lN1LEyWaJgs
         Oy82nwheR8a8xJJ1FjWHVC1u9hqcen5SQ8MPcy963vcBwSRNc5CfUbww59IbS1pKIDBs
         jEE++etHjmbBxpvkH18HN4FqZWM3KJxR0rOoxoPL2ZwfPGcCMnFg00hv2T1wb8jx7tLA
         VMxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778172973; x=1778777773; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fxKJNK3JYOXtq/6RpdHSxauIPnnYNnrQjQPiGKEVycA=;
        b=X+qM3eJXNBkXxwX1JTjGOqY+SYIjD7OSQTTVvvH/d7Nt/MhXpv/9WeJL03HkywvFpu
         lDNyX+dclfgyAnhD+8YhHeNs5NOIBeliQTxtb8XsPAmy168xewtjrqpiDUODMgKv8j4G
         S4MFtygN/7tarwoktBPjP2v4hmJwm/cQhkSRO6F3xWWFtwvysExswW6eESe7LkSwF6ZA
         zTDl6THueBMTmPSkjEHcp50WYWxQefW/LSpbIvVkvqecKpIvnbleFhnWRg4wFwJnVCem
         rwB+sfNX0dtugfmtyQV7/a7IBs7+GPxCDbM5fVrClxK3C8X2tJ9hpm4tNg5S8jMzzLdC
         lIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778172973; x=1778777773;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxKJNK3JYOXtq/6RpdHSxauIPnnYNnrQjQPiGKEVycA=;
        b=LdMPiDjAt5K9t+3oIqin3utDuKMqC8WlyzssNCPEwhV+Atnraagwc0wKjoAA9OH2MG
         K8STgVORWM6ZSDjQTkQw9gTfni92fYbsavuLMzo5ioWedWTZIPFrxO9dx2NLK4TIOPXy
         QwP1UwjB0rlmt4hKJOnmqcBb3+PBc2r87x4NmjLDD8keyxUzz9iQKcxuvxbSg/Zd8z7q
         Z7rwc63dUW9BRaRizH6m3ARbyJnzXy0gdh8ZLp3DsCjB4kDM/uamjfLOCYhcIdQY/Chz
         FK5mdt/AqKeaxRv04rGMb/L/6j979Fw2JkBMz57pB/kP7mMP2yMl7umqY8BBP8EA8zK1
         vGrQ==
X-Forwarded-Encrypted: i=1; AFNElJ8icIoq05tfbgO6eQpSQFQek/u87Rn+2VYpdS9ww4mh6/L8gON26weIlZgTg5wDt+FZwMGpHfaCnbu8dTyYGFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXnfT9P3sIwjxCvVdvQWrAWbzYuBeQFUF+hxEuPqoEQv/kaNqe
	+8USrt0x8QoYz3VQGuzxwwHKBhs2OudTWNs5WZtQ3kJngzv5qkRD+iUmM/xZsaadsBeJTL6mN9f
	JlzyqhoJyXtUaH2VUJLD7gGrIfv2QL1aRQ2V9B4Kc
X-Gm-Gg: AeBDievDDkyvRU15YDfs57by6VpUTMvdThq7v4i3tlDzNwNcNwbZuhtFUFAaio/sLCs
	s2gosu167+4eD9h66JPmR1HYBe+CzLdta+wREJRT+wC7kH2a+V58srOFrK713fmy5giO3mt+AXn
	D3SAnZVRBzDh5QLFN3zQDRKeWbMAvjtJA2gCvgkHPRB9cNxsdeejiGjlCxarR6bAI9SH0+WRz6m
	aIvjvqrERk+KxoStNALPRDVPTWGRvc1CRh0yoy+MVF2Xa8LQwHDtlWEE2SWOIxpXP0BO3cinSsP
	Wy+KPtlSaPP6inAZpjLH/ilT8BHwiyHmFR7CXiZNTAxPjR7HVdbf1whwNuZxU83YElYz19zqFLu
	smVq5
X-Received: by 2002:a05:6102:3f52:b0:604:f29d:84be with SMTP id
 ada2fe7eead31-630f8e78530mr5085650137.3.1778172972306; Thu, 07 May 2026
 09:56:12 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 May 2026 09:56:11 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 May 2026 09:56:11 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <n5ce32wumzeiqqyqutom4apy2kqfetbvusc6j4k2xarsska5mw@klp5bmy7qhfm>
References: <20260428-gmem-inplace-conversion-v5-0-d8608ccfca22@google.com>
 <20260428-gmem-inplace-conversion-v5-10-d8608ccfca22@google.com> <n5ce32wumzeiqqyqutom4apy2kqfetbvusc6j4k2xarsska5mw@klp5bmy7qhfm>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 7 May 2026 09:56:11 -0700
X-Gm-Features: AVHnY4IiEmQejwyUzKbSGtsBzFH7WMpl699YC0dogi8imsP9-pFhPzVdvXeVDZc
Message-ID: <CAEvNRgF9+Gr7UVEq-E2SQEb_XOQQMOXy9F_A2tA=DbNV_fJ0EQ@mail.gmail.com>
Subject: Re: [PATCH RFC v5 10/53] KVM: guest_memfd: Add basic support for KVM_SET_MEMORY_ATTRIBUTES2
To: "Liam R. Howlett" <liam@infradead.org>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

"Liam R. Howlett" <liam@infradead.org> writes:

> On 26/04/28 04:25PM, Ackerley Tng via B4 Relay wrote:
>>
>> [...snip...]
>>
>> +/*
>> + * Preallocate memory for attributes to be stored on a maple tree, pointed to
>> + * by mas.  Adjacent ranges with attributes identical to the new attributes
>> + * will be merged.  Also sets mas's bounds up for storing attributes.
>> + *
>> + * This maintains the invariant that ranges with the same attributes will
>> + * always be merged.
>> + */
>> +static int kvm_gmem_mas_preallocate(struct ma_state *mas, u64 attributes,
>> +				    pgoff_t start, size_t nr_pages)
>> +{
>> +	pgoff_t end = start + nr_pages;
>> +	pgoff_t last = end - 1;
>> +	void *entry;
>> +
>> +	/* Try extending range. entry is NULL on overflow/wrap-around. */
>> +	mas_set_range(mas, end, end);
>> +	entry = mas_find(mas, end);

Thank you for your reviews!

>
> Please read the documentation as I believe you have a bug here.  What
> happens if there is another range stored higher than end + 1?
>

The invariant in this maple tree is that contiguous ranges with the same
attribute are stored as a single range.

The goal of this first part is to get the entry at the index just after
the requested range, and see what the attribute there is. If that
attribute is what we're about to set, extend the requested range for
storing to the end of that range.

If there is another range higher than end + 1, with the invariant
maintained, that attribute has to be different than the attribute stored
at end. Hence, we only want to extend this requested range up till end.

> Do you have testing of these functions somewhere?
>

GMEM_CONVERSION_MULTIPAGE_TEST_INIT_SHARED(indexing, 4) tests setting
attributes in ranges. If test_page is 2,

1. [0, 4) starts off shared (4 is the number of pages in the guest_memfd)
2. [2, 3) is converted to private
    => so the ranges should now be [0, 2), [2, 3), [3, 4)
3. [2, 3) is converted back to shared
    => so the ranges should now be [0, 4)

I verified this by inserting some trace_printk()s and inspecting manually.

>> +	if (entry && xa_to_value(entry) == attributes)
>> +		last = mas->last;
>> +
>> +	if (start > 0) {
>> +		mas_set_range(mas, start - 1, start - 1);
>> +		entry = mas_find(mas, start - 1);
>> +		if (entry && xa_to_value(entry) == attributes)
>> +			start = mas->index;
>> +	}
>> +
>> +	mas_set_range(mas, start, last);
>> +	return mas_preallocate(mas, xa_mk_value(attributes), GFP_KERNEL);
>> +}
>> +
>>
>> [...snip...]
>>
