Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47E031283E
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 14:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374206; cv=pass; b=cEiXfDW5vFjBoavZ20EwOOJpiuL/DcL4pi+kJE3CQsIKmrgQPY9Z9TsWCVjg2qo//0AgU9/OXfen6Cqwn2lhisxCAHtoecePq3HFfsnAm2YkoRFrK1TamEqZbY+dIieX8GKPaWQGsw01BPYuYfjn8gsOHf0P7Dby/4xQqckCEnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374206; c=relaxed/simple;
	bh=WJOUrtquWXGSSgTD5B2FX4mgIruAkhlJJ55ppYaE2UE=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tLfwjs+P/pW/2l+rfJAg90V8St4jrMJfShvUzUGe4Xpmr43YwHwA+vqe4Z9D2MKBySpEzOFBtqTmY6nyIXwgG3bkhyp0feMxBQLOUK72GYIPMbwaGfmFT3bVTAwpKX6Ux1ZpDyXdFS94CLYTYiv82jOMn8xzuW6z2rMquxybdKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CoEL7N6V; arc=pass smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CoEL7N6V"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56f6afbd205so3763988e0c.0
        for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 07:36:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779374204; cv=none;
        d=google.com; s=arc-20240605;
        b=IlulfX+joCheLVcjNTc+Ylzd/sym6Gf6uF8Q4seW/ybTY2sxDaX9lABQ93U/d7+KlT
         bCvakfo6vyp+m8QHqTJdaWcfhnEAGrjeANDS4HXdjK2bvfXFHSrNbuY6jb8YsFprLP2V
         BXzHky1Qm6dgbHIGVLqPrfRf0k23t2OuMOI522Ixe4CPcnOMsmfWqAUbEOVLfUlyEm3v
         Tltzf/FPvawthAl6/0y/woOkcOyASrDxOXTzuIKcl0IBTOun/2A95oQZHsUkL/CSukS3
         ZlJ8UqD6YnYTtv2O64qwO24QHIX+9aOGn84uNatwsD3wroN0fvyJ07BEzT+lUNIGcO1w
         oaNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=vYaUa4IMCMaYAyZ5spn416wLAd7Y4Wm0XOOfJ/wi8IE=;
        fh=NuhEa5DuZqOPtuL2P+b+yvk1CmQicViU+BX956XQkR8=;
        b=ir+f/9qco54lPUvT1hz+8ZR2LAPpC8yi8x4pbOAqt1lVF1O2TfiFbgu62xjSeidfV4
         X/I1cn2C0SeMBwN5N/YSw2vwR6M8l0Zb41Wvjq/Vf/MCWyXCzGE6Qh+2M2dikBVV14Wl
         8W6nZMwSEnCj408zyufq0fEfhvIYIoNlFCGBHp/p2cMr+ILyFsqZpWk6xR6rGKfbeB5t
         jamXoPovg4CX9d7SviePhgsMhX1Uk3huUUJds+poMvtyR4GBeydoC4uaFr4561kLD9pa
         2IvVIpnw5vryH5YX4HsDf7KjHe5ZIXafPZxBkokdDaW9vkIBGIhHp/+pZU49MZrld3ss
         ljVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779374204; x=1779979004; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vYaUa4IMCMaYAyZ5spn416wLAd7Y4Wm0XOOfJ/wi8IE=;
        b=CoEL7N6VFzcfH1g4o29MAqfqDHbobQUgnRsFYEFyxcgHiaIq6i8t0ja8hy2gMeZTNX
         pobiKI5czhORZ9XHK3eMK4rv6yEZv89xyHu/5RcAoG99+BrbMrrQ+YRbmw4EnIH6Wr6G
         Bigz0XNdPbG7860tOBDlzxP6CLv6YUH0QoWP5uXv1cbvef5tQyhm48tK30P1uwMMp3WH
         XdHS4gC85eqIWE0G64VhbPBxz/IJWkZMdzFDCL0szp/Zzx5axFn3g1sf3vLmJkSblqw4
         HZG4qtUCXDypNphGxnED1NpNvA0KN7ZrBKWxOVvtZCMvddEq5Y0fwnnfkqq+jbtqUHWt
         FsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374204; x=1779979004;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vYaUa4IMCMaYAyZ5spn416wLAd7Y4Wm0XOOfJ/wi8IE=;
        b=Rx9Ak67LQ5c10YtYDlJGqmSw8BpEe/0y8B2wosuPZOQJtonjnmfbEsd0YLlp1mdC70
         gkXtzEJOGo4voT65rv8xz/XGYd+1OX9vSC3IhR1lHQ4pyRVgaN5ZdZaA36KPQdRtHkH0
         ywlqJ6S4/0+z02YvAvMcUrCc04rXbBr8AgHf3QbrgRxmicJl6QV1Obc/7vo/9A7FiOrg
         7aI0ilSdSeTRgj+7lUDjGK541b/kOTBhAzs9zU1XTSAJFwWLjR9knB+/35VlBcMn2zie
         eqI+md4368FpAAnlDcBRrACqgBhj4c2kJabQe4VUJVS1JD0kVXipBjsFzugDXZKhqLx+
         Uozg==
X-Forwarded-Encrypted: i=1; AFNElJ/nfc9uRlFkRJXp9r/xpNI4mfY/Pfof8dOCuZlF6PBlQhOs69C9aAYozjiJDQy8ClekNC+52PAiZjpUTOBLXAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUosN9stkb042GwJYjNc2oCYIWTimmuw0NauqFE2J6apoPnD54
	Ekk8LDYkBGbh0J5h37xxGK0Eq8ypL4qJczBj9LGJpSjR+KNWtPGrQLx/Rw18tYJi5aOj1U2n1Q/
	SmpaTdGkh5mXuN1bsPuOSPUjp3bFtqkiT6ya4I7jZ
X-Gm-Gg: Acq92OFrwNwLCLohdEKT1BROBFN4mjKttoRQO04LLHf3e8/BlbZIEW7oulRlBI2lS3J
	f8xck1ZuHO8DP9Zdn0rKl+gqQQ1mc1rUBxl03gTkelKw9H20bBUIyZ/YsVd+IaW6TuQGhahZ8XF
	xXAWBaaNMZg9AvH76yhCa6bKs3kKfHvZR1Qfc+p7cDU7XDD0B+s3+55j0C3iGRnEX2eGDqjPJow
	7vEpsRBd5EG2y6Ey0yhM6AQaHdUlBkLlGB6LPPwyMbxK9YF9lFm1Tvx6S75VuPda6Z5njpWmy+4
	JKi+Pm/JIgMiQfZT/SuzJ1mhUGRgNtSV16c2AtQEh92uTz4c2g==
X-Received: by 2002:ac5:ce81:0:b0:575:a69a:a3c0 with SMTP id
 71dfb90a1353d-58412b0d22amr1255230e0c.7.1779374203234; Thu, 21 May 2026
 07:36:43 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 07:36:42 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 07:36:42 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CA+EHjTyaBpTYsJRRyP09YggoHbi6s-ZgDoWoFgDRxO5k_BkoBw@mail.gmail.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
 <20260507-gmem-inplace-conversion-v6-11-91ab5a8b19a4@google.com> <CA+EHjTyaBpTYsJRRyP09YggoHbi6s-ZgDoWoFgDRxO5k_BkoBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 21 May 2026 07:36:42 -0700
X-Gm-Features: AVHnY4I30lxiEW6e6I5WKrwyQmuhxKDxlslbMLBEy4dCPODuZC6olFnz0j666eA
Message-ID: <CAEvNRgHBwVx+biHxTyNETBt1jQ9Fohshud1N4bt8beVYhPiOKA@mail.gmail.com>
Subject: Re: [PATCH v6 11/43] KVM: guest_memfd: Ensure pages are not in use
 before conversion
To: Fuad Tabba <tabba@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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

Fuad Tabba <tabba@google.com> writes:

>
> [...snip...]
>
>> +static bool kvm_gmem_is_safe_for_conversion(struct inode *inode, pgoff_t start,
>> +                                           size_t nr_pages, pgoff_t *err_index)
>> +{
>> +       struct address_space *mapping = inode->i_mapping;
>> +       const int filemap_get_folios_refcount = 1;
>> +       pgoff_t last = start + nr_pages - 1;
>> +       struct folio_batch fbatch;
>> +       bool safe = true;
>> +       int i;
>> +
>> +       folio_batch_init(&fbatch);
>> +       while (safe && filemap_get_folios(mapping, &start, last, &fbatch)) {
>> +
>> +               for (i = 0; i < folio_batch_count(&fbatch); ++i) {
>> +                       struct folio *folio = fbatch.folios[i];
>> +
>> +                       if (folio_ref_count(folio) !=
>> +                           folio_nr_pages(folio) + filemap_get_folios_refcount) {
>> +                               safe = false;
>> +                               *err_index = folio->index;
>> +                               break;
>
> https://sashiko.dev/#/patchset/20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4%40google.com?part=11
>

Sashiko's first issue on lru is addressed in a separate patch later. :)

> Sashiko raised a few issues here, but I think this one might be
> genuine. Can you look into it please?
>
> If that's right, when huge page support lands, if start falls in the
> middle of a large folio, returning folio->index as the err_index will
> return an offset strictly less than the requested start. A naive
> userspace retry loop resuming from error_offset would step backwards
> and corrupt attributes on memory it didn't intend to convert.
> err_index should be clamped to max(start, folio->index).
>

For these ones, I was thinking to defer all the huge-page related issues
to be fixed when huge pages land, since there are probably quite a few
places to update.

On second thought, this isn't a huge change, I'll fix this in the next
revision.

> Cheers,
> /fuad
>
>> +                       }
>> +               }
>> +
>>
>> [...snip...]
>>
