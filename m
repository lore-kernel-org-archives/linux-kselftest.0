Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DC73002A9
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 13:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785851185; cv=pass; b=lfi1q4Y/6MLAF8YS//qx0LeWxGroCJWgr8+QLg6CcJO3+z1rnDfhYtg4+JJRBhPrjkqnuB79YSdfhr/AVQSdPjd1J1p23v5iGQ8PfTGhh/0iBq+uNZX7Ys6+2b9HQgxHafPcidCDVJByrhwn8aBQZKmchT0dabfMRTpS0pamtfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785851185; c=relaxed/simple;
	bh=G5AgHHHY9jv0ygOB7Vo21BSZnxPwBZqAq4GmulyN/nE=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HcoYXi17+lWdTMsSCDZ8fBIPmA/7890XDgCxKQxj20gci74Y0VOQeKxUk4lOOdNBNTGOmP2I5RvGHB9Zp6iyREO6wR/JSsegbbCUfeDQLM4KDOYrcj3v4ko6jQT7kNJFSrbypqoLN+eBfR683oUWNm8GmvNk4qwZK0/d9aj6yLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XqlekOsZ; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XqlekOsZ"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca913a601fbso3270118a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 06:46:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785851182; cv=none;
        d=google.com; s=arc-20260327;
        b=YWj5vXQCaNnZuc4bno7E1suwJuIzgQK581kWXAfx9UZFBmw650CgkeHpLcHmYEeQKW
         Mz2eUSFSzUTJcrm5LEMhg7b/Rvc5fArbdFm7ibIY+0IkQrFc9q4bi+8sDkrFh+A5Soe8
         jGwPbkz+D4LNJ33UP2beJCqqxhwP9oPRtKjmklJfgXqlBjutf4NaAHlmyWVOfITCFJw8
         fnmx4KUMtiqCHlhzp/SrurOhMDaiOOWVtnusAIk8so/42i87Se3AtszwjyF9eiS2vJgs
         ZGAl5+EOdakX7K0kyccbpt4ASGnTgL3HjxCftLksq50JsUZIDIYBs/+Mv1DeVXmv0kDk
         fMkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=53G6mJGAaV7ofRwgRemJGkr5zkTXgvKFenxfcvtRtyE=;
        fh=bxRepkpzoZYVWOdv348FG3YnVbj9yPFONALdJIGMzBQ=;
        b=frx4nAdhMp/IATwzNNYnjFIRmqViFCQHMk+5RyMCeKncLIbzL/fDKsU7rR7YRn9z91
         VN4MzkVZhp72ZrdxoGfQnnnUedXgJ83duj3cD1ayVWkFX4er/9R7Kb84monUdCjfJ/0Q
         Z6Hmjh2rA4efz0YfZlTpWiiIdu1kksgBWZQRKus+Vt2nR7GpA9i3PryT6wkyNlRcH6KL
         EwcqSjNFGuFqdWxVLGM9RTv1Hn9i0JgEH4D3otkRvC6I//8IRp1fuOFmgOD8hz+3iKHR
         bBqCjlbRYLiDdkhsQPbS+RTvMeQTWw0UsGp3c/kkK3EVhby4NYp8ErT5GfaYakBCLfuO
         iw7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785851182; x=1786455982; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=53G6mJGAaV7ofRwgRemJGkr5zkTXgvKFenxfcvtRtyE=;
        b=XqlekOsZRglZftD2ptxrZu3uoozVSQvDOl2p08SpnYWJzmu9DTJeFsgq8+uEMsazyC
         NkkGBIYU+sF18XZ/MVEMVEj3q1eo422cNCkuNM5ssGyDYzjMJ+xg4ISHCJbKob0qNJnk
         IX20e7rI1LLtZAdcqYzpct6QNlxyOYNYN0fwHQ03OeZ1q1TSHkzSIrlMzyUACkv/xpdZ
         MZzkHy0TeS/LTFJNQQY6BwUK94OYpn5a+5hDMIPYOin0Io2lXx2knouuxaOKc/tCwGrp
         wk/pfgkmjMlpnDego0X7PbYvDzAGxwynFp861knzLZe98s4myQFC012qVhZVKWweodfm
         s2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785851182; x=1786455982;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=53G6mJGAaV7ofRwgRemJGkr5zkTXgvKFenxfcvtRtyE=;
        b=AfKpe6b3lnCYtFe0/w4ZWzjry8PPGO8M8E8ivhaI9fcRxnvjah+BFaAn8eh7cZE94n
         QzvxBpxTsOUm/TihuYaDhp0hZrpsS9MyW2nNTC+HwXiz6FBQQEHjBYldFNU+621972xA
         66S0jvnTc8ckgeDR8r96CGqSvr1QOhANMiDb+hx4/bqPNUa3pigNlY9ai1hq9dBN/mhq
         ruOK0MxNSKqKLlupGuo0VPOpNeESYwE7fEoAvPdGkQcVFflZrCRmAwuSK1/K7auniGs+
         Fhd++HpzXpOpXaK51D2+KPLc79jyNTv5AWC/rIi6WT/9mu3MzK2OHytkL/MGoQ0H88m9
         VxcQ==
X-Forwarded-Encrypted: i=1; AHgh+Rql+c69MVcKGMJa71YV7sJZCiodZamvesdD5fLGEJInu5pSJTBNHpEcPyWdDxF3z2rgXoQDD7RS6OeWr/nS5QM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWQr+3SAbfEzk2n5824fQbSiJE++uSesq/DuVpmk/5qUrYADCJ
	w2ww9pt7PXKhLhkYjR6M6JraUFVA6oH1gvVjWTnXZxwaEjyu2r/ONJnhP6b7p6pW3RlnWs2WgyH
	82Ky9771t/9YwcluB1wyZ1AdwD8m/FHCmUI9ETDYX
X-Gm-Gg: AR+sD10Lq/Qb72rRdvVw52hTFiVHuik2qFGDur3+CdNvERxJwbNPcEdQWlrcmfXmYsA
	WS1kFWr+gQNoHdqs1KUlsZsMEGaYJyPUXqewc+hpOClUTJ5B20K3QiLXiljUWDpN3oY4RP4DQCi
	p0ZrEycNvN2VufB8Zl9bLaE6LoA5k2neIzye72VOxlxA4xA+qaq+cxlKFKnkuubLIvBs+aLu5Hy
	0N+nyMKIff0HQvltQ1Mh6+3p1BIwgA4RX2QfMYxQfb7f3tQgWMkBPLmsc2tRqqIYDpE3N6PdVEG
	gi3rD5bWK0DUy/TBLktqfRLEQJOjIdEBhPHZM4li/tcbyJWP0YJ1bspeVxuykbKv1uBC6TuUkSq
	uvY7ntmRtvls=
X-Received: by 2002:a05:6a21:9f10:b0:3b4:931c:3c7c with SMTP id
 adf61e73a8af0-3c92a7bb452mr15042590637.44.1785851181842; Tue, 04 Aug 2026
 06:46:21 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 4 Aug 2026 06:46:21 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 4 Aug 2026 06:46:20 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <amzIckjuwf0JfINI@google.com>
References: <20260728-gmem-inplace-conversion-v9-0-35f9aec2aed2@google.com>
 <20260728-gmem-inplace-conversion-v9-1-35f9aec2aed2@google.com>
 <b78bfee9-29f3-4044-8ac7-f294b3cd0ad8@intel.com> <amzIckjuwf0JfINI@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 4 Aug 2026 06:46:20 -0700
X-Gm-Features: AUfX_mxGk5RmzD5OeFVHjblIz9X-b3hzxwJd1etRfElQwBfbfA_qJlZkICUGG7E
Message-ID: <CAEvNRgGJ4DQuOVafc8ipd8NGP+6y=dcwSZPGOjtrHBAGO7sB9g@mail.gmail.com>
Subject: Re: [PATCH v9 01/41] KVM: guest_memfd: Introduce per-gmem attributes,
 use to guard user mappings
To: Sean Christopherson <seanjc@google.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Fri, Jul 31, 2026, Xiaoyao Li wrote:
>> On 7/29/2026 8:35 AM, Ackerley Tng via B4 Relay wrote:
>> > From: Sean Christopherson<seanjc@google.com>
>> >
>> > Start plumbing in guest_memfd support for in-place private<=>shared
>> > conversions by tracking attributes via a maple tree.  KVM currently tracks
>> > private vs. shared attributes on a per-VM basis, which made sense when a
>> > guest_memfd_only_ supported private memory, but tracking per-VM simply
>> > can't work for in-place conversions as the shared/private status of a given
>> > page needs to be per-gmem_inode, not per-VM.
>> >
>> > Use the filemap invalidation lock to protect the maple tree, as taking the
>> > lock for read when faulting in memory (for userspace or the guest) isn't
>> > expected to result in meaningful contention, and using a separate lock
>> > would add significant complexity (avoiding deadlock is quite difficult).
>> >
>> > Co-developed-by: Vishal Annapurve<vannapurve@google.com>
>> > Signed-off-by: Vishal Annapurve<vannapurve@google.com>
>> > Co-developed-by: Fuad Tabba<tabba@google.com>
>> > Signed-off-by: Fuad Tabba<tabba@google.com>
>> > Signed-off-by: Sean Christopherson<seanjc@google.com>
>> > Tested-by: Shivank Garg<shivankg@amd.com>
>> > Co-developed-by: Ackerley Tng<ackerleytng@google.com>
>> > Signed-off-by: Ackerley Tng<ackerleytng@google.com>
>>
>> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
>>
>> <...>
>>
>> >   static __always_inline struct gmem_inode *GMEM_I(struct inode *inode)
>> > @@ -60,9 +68,25 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
>> >   	return gfn - slot->base_gfn + slot->gmem.pgoff;
>> >   }
>> > +static u64 kvm_gmem_interpret_entry(struct inode *inode, void *entry)
>>
>> Ummm, I'm not sure on the name. It doesn't look like KVM's style?
>>
>> Maybe, just kvm_gmem_get_attributes()?
>
> +1000, "interpret_entry" is extremely vague.

Was a little stuck with naming, my frame of mind was that "entry" is the
attributes, so I can't get attributes from attributes. After you pointed
this out, getting attributes out of an entry makes sense.

Will rename to kvm_gmem_get_attributes().
