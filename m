Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6E13A3E65
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 22:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778625029; cv=pass; b=TPInE6V/jgFZhbkA95qa2Zmf1/aCvAjjpW2TOzBcyasGldRZsGu22Hs6EXK+NFjQ3y5XKgzPYpPVAAd+NdEeVUkxFrrNP+8nVAIKOhdI7osrL9Bf6u70hwMOndASFvHeVBTD3n+pl9Lnk2lSBOCiQOV2/hHgmFZxMR7p5XPx6b4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778625029; c=relaxed/simple;
	bh=ctAmtD5i9O0zXAJdPtZK0rAgm3gUJsIsE1gDEZWd5XA=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hBwS2Q3LMGW3hZuFWt+K4X2ms5b+3Wx52oXWc6Oi8bNnsfUf8FGXSu2v5tjfsQRkB/dY7B2JVRwB4vqQxgQHwRO2lng3A/tyoIXln8EhjLpbJWnCIsk6ehCRmzy8E5cYQJhE8VDz9ePrG7rAr3/gnci+WMw5D1uRZS5LSS7zHpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z3P+1mkz; arc=pass smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z3P+1mkz"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-95f2b0bd920so2434995241.0
        for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 15:30:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778625026; cv=none;
        d=google.com; s=arc-20240605;
        b=WwT7KLXuONK4ra4IgtyMmZkDVvQ4FA8Vw8FYDQnxaSRDzkqO6ss26djtur6glxU3Z6
         1IcUIKP7Hb6bf+S+Z+6+Elj92Dx5y9ZU0YhCcyVm3PcP90flD+zgdwnyaHSUlODqOgV4
         4n4+t2HJksQCOAWCmsGQEUAnQK1/P1Ful+36ZQ3YHRaX/seLHZgkiSKtmp3yBKaivsGW
         D4gn+o0ZcMLRdPplsCWS3ukXd/UMDWfyq7VCORs/PszeuUEq1wBaMKN+pWeD6L6NFL7J
         kzRGCCS7J8BEL+8jFAjmHCoQWYAMBdLOp5h9xCL+xhVRewVncojOQPJVKAO3Io3Mk2bS
         CfyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=7TPT8725vjJaWzYD56fEvXZ06oMkvP85Hz1/t121+lc=;
        fh=thx7HmnRSQl2xydeSGDm7r/eQBj9+84HfR4tnIWAkhE=;
        b=g9nsie97nLUuSRfVqihERFkIB7VcELYGATxpALjtZhStyb0UrBAgvJhA/s7jjuBs2F
         PhUoG7ExPEK5F/OlpmI6NMq6JhyBPSRk2gkcEu7wKZ942TVE2P5tbwh8MVXk1Gzj5mkM
         LPaUwrbuOyXUHuolI3l9mrABsXCeNlWkFya/yXj2StXm74H3FZCkssiAlI0KIj2eMLrN
         Vedj/9AH4Lz3hvafL1a1akFu29hg3ZwcWYfx5Ukzl6BwmxVqzQZKQ82pEygKXeDLJKtB
         BMDYs47E11RaKc3il1JfTeaz9pVGgrB0D5nD6Gyo2HoJ0gh5xvdafEIktwOTiR3k74fC
         kvGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778625026; x=1779229826; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TPT8725vjJaWzYD56fEvXZ06oMkvP85Hz1/t121+lc=;
        b=Z3P+1mkzpj8h4Ny2fRAwAu8+rBE8RmY/hqTESjapBAiEuZat4VHSRDf/jOos2uaYkS
         VieRx0q/g0gGq2sQW4x4U/jX3graJAZbntlqD1wSsROXwdHc70mRKKtYEOrOfGw4zssZ
         zfatOl88ZcEA+Bw+ZJR1JaW4a3CQR8E1uCy1Gv5nd+MD4fJLj54BN9xxXLD67vhRIOlV
         r7T+Lf0eC/M3qQrsBJQsJR1KeTBc5TsP5AzTGh/QLkC+KIo4rn8BYvrUlGprsuaf+54N
         +5rdI9/+eSyZCXoP7wCwcOvjjjR8b+C6rbemjMgDYsFjoTrTStrU0XaTwOv63HW47jJc
         pSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778625026; x=1779229826;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7TPT8725vjJaWzYD56fEvXZ06oMkvP85Hz1/t121+lc=;
        b=G+KUYRaKQlkRBtFyIXeZ/H13Y1sroSJtDD7KFNYWzDOaLpFix0la8mdSVGpvrhrOkf
         FZZgT6OYw7VQgpri10lgnH09wdqdrTjDsResxRk005CiSpvZlHJ1InCZNYqwHv/kcx29
         XeMdu/QwJjqp+SsLp9ocON7EZqd8sC4nuOhNKSpIQerMMFxoCtgnl5mLUUgWtIy86BtJ
         I/tIGEUVzV5MCXH8AlP2RkANFtMoL4C0uGV7cfm1w/trz6W2IoE2qrf4e6+B1NhdQMCd
         njqf4k1HvHoQ8c6sgHk295DFd32L5qYVAduaj45e/5RD/Od8JjcTa72ascQHCf4qwEsH
         vI7A==
X-Forwarded-Encrypted: i=1; AFNElJ8ai9q3LNFCorY5qC8Q7+6f6H2sPVY+qPoGliyEn7cNOjK6DJq5BASbwqjX0zEf95M9pM1Mpr1j+pGHVlyXmTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqlkhdwKo53g5sZpfXDyebcbAJq384j/AI0BmJCzoWQjgy+Ax+
	GTxgWzPY7PQsurJ/GdOgIw4Uywzomwes66TSM5XMKCx2KaybeZyvhJPfBbNcJdXfl+OvnNIGtF7
	8BZRzHzM4kRydjS5PSmRN9doYjfTmGJlLFuM1Qs2p
X-Gm-Gg: Acq92OEtbvcLzt+iMu1kfHI4gfBvsCtRaKnWyku8Wr0Iqim5UQK/sGgibXfgYViBtFk
	geWYH91aXUvS2MOttL2xAPCAHk82EC524cAC1k6/HV1DA9MM4h9JVCdJtmev5BHaCtFTYdaIWnA
	gY9IN41gsOof36oUPosoFfV7uc3H7hVi85uyPnucbeY0rgSe1B6gVGSPXw14slS6dBiQiMRo9eu
	K65rAXDUwaIxKlto5bcIZTB5AOmMssKmmSEejZnCth3O2ixrKsH4I14LO8LsMk5cEfqrjK1wbIc
	vXAcYYnbsxoU/JJaWeLDunKwdYug/tkQaNMka1V7elZxYDaSNYfRecmx8Ne68QXkSsfi4dnlaBW
	tGu0U
X-Received: by 2002:a05:6102:442a:b0:632:3bd5:d57c with SMTP id
 ada2fe7eead31-635ced54981mr2555380137.3.1778625025472; Tue, 12 May 2026
 15:30:25 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 May 2026 15:30:24 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 May 2026 15:30:24 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <1DAB05E2-7F30-45D7-B155-B66C59D31AFF@infradead.org>
References: <20260428-gmem-inplace-conversion-v5-0-d8608ccfca22@google.com>
 <20260428-gmem-inplace-conversion-v5-10-d8608ccfca22@google.com>
 <n5ce32wumzeiqqyqutom4apy2kqfetbvusc6j4k2xarsska5mw@klp5bmy7qhfm>
 <CAEvNRgF9+Gr7UVEq-E2SQEb_XOQQMOXy9F_A2tA=DbNV_fJ0EQ@mail.gmail.com> <1DAB05E2-7F30-45D7-B155-B66C59D31AFF@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 12 May 2026 15:30:24 -0700
X-Gm-Features: AVHnY4Lh8UobS4TfgaX3AzC6MvTUmkcUL18qAWSQRch3a7T6C4hmHCpmi3zo20A
Message-ID: <CAEvNRgGgggCPKRzd0=r5jV7stxFJVGzj3as_awGytonx9qdfLw@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable

"Liam R. Howlett" <liam@infradead.org> writes:

>
> [...snip...]
>
>>
>>The invariant in this maple tree is that contiguous ranges with the same
>>attribute are stored as a single range.
>>
>>The goal of this first part is to get the entry at the index just after
>>the requested range, and see what the attribute there is. If that
>>attribute is what we're about to set, extend the requested range for
>>storing to the end of that range.
>>
>>If there is another range higher than end + 1, with the invariant
>>maintained, that attribute has to be different than the attribute stored
>>at end. Hence, we only want to extend this requested range up till end.
>>
>
> mas_find() will look for an entry at the given address for the first sear=
ch, and if it is not found it will continue to search upwards.  Since you l=
imit the search to end, it will work as you want and there isn't a bug as I=
 was thinking in my sleep deprived state.
>
> Since you are searching for exactly one address (end), it might serve you=
 better to walk there.  Maybe walking is a better API for what you are doin=
g here?
>

Thanks again for this tip! I'll try the walk API in the next revision
after v6 [1]

[1] https://lore.kernel.org/all/20260507-gmem-inplace-conversion-v6-0-91ab5=
a8b19a4@google.com/T/

>
>>> Do you have testing of these functions somewhere?
>>>
>>
>>GMEM_CONVERSION_MULTIPAGE_TEST_INIT_SHARED(indexing, 4) tests setting
>>attributes in ranges. If test_page is 2,
>>
>>1. [0, 4) starts off shared (4 is the number of pages in the guest_memfd)
>>2. [2, 3) is converted to private
>>    =3D> so the ranges should now be [0, 2), [2, 3), [3, 4)
>>3. [2, 3) is converted back to shared
>>    =3D> so the ranges should now be [0, 4)
>>
>>I verified this by inserting some trace_printk()s and inspecting manually=
.
>>
>
> Thanks.  I find the exclusive ranges a bit odd to think about in the mapl=
e tree context, but this test case makes sense.  This is especially odd to =
look at a single index entry, at least for me.
>
> I generally have a set of test cases and append any bug reproduces to tha=
t list so they are unlikely to reoccur.  My testing is certainly different =
from what you'll be doing, but this method has done well with the quality o=
f code improving over time, and limited (if any) regressions.
>

I've not worked directly with the maple tree tests but the xarray tests
(similarly set up, I believe) are a joy to work with.

> I actually insist that any fix has a test before I accept them.  There ar=
e two reasons for this: 1. Avoiding the regression. 2. People really unders=
tand the bug if they can create a reproducer.
>
> I hope this helps.
>
>

The maple tree tests are set up to directly test maple tree code, but
KVM selftests test from the userspace interface, and it's hard to test
this invariant from userspace.

>>>> +	if (entry && xa_to_value(entry) =3D=3D attributes)
>>>> +		last =3D mas->last;
>>>> +
>>>> +	if (start > 0) {
>>>> +		mas_set_range(mas, start - 1, start - 1);
>>>> +		entry =3D mas_find(mas, start - 1);
>>>> +		if (entry && xa_to_value(entry) =3D=3D attributes)
>>>> +			start =3D mas->index;
>>>> +	}
>>>> +
>>>> +	mas_set_range(mas, start, last);
>>>> +	return mas_preallocate(mas, xa_mk_value(attributes), GFP_KERNEL);
>>>> +}
>>>> +
>>>>
>>>> [...snip...]
>>>>
