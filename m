Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63C43D5246
	for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 15:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779896145; cv=pass; b=tAkNXHlkWbJSmMqf+2YQTkojJ9A1rKi/hm9v908X68hfADpgkdc4IHhHXAZgEfYun85DcqsErbjgrjseRadoFuq1TK19ZyYHyk0r0NTGLBGQLtnai9r7sI2gR/jm1f1nUlFRswu43Ko8hGepUV2+rzGpwFQ1tXtp/WJURuT4aqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779896145; c=relaxed/simple;
	bh=/34ZEKo4WKYSNfKeZJyC5zY+tHi9Bq+q7x5tIuisplU=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EpNBGxl7hNXYc6+ZfMEh2NCVA2LBp5JDtpqIw0mHMcWSg7e2YQHP0FlJSzDNveRCdfqHBqPLqpv3S+WpTStOqZH90yzLox4EzA3hKUF7B4pdyVGy12TLTL0JVexuhRSeJXePKmTDJS6v//p59bOpzPK5Rrd59WSLkkiPZ6Yy85k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wt/O37Jb; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wt/O37Jb"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-133466cf955so31400450c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 08:35:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779896143; cv=none;
        d=google.com; s=arc-20240605;
        b=Z9l9zzfkqdS/S/zW5J2yTL2oLaT09de9s4rwtdgfy3kyT6KNPmXg3f++QQKBFswOPm
         lmxRUjMLWPJ5exQV2z+kE5ynN6dUbknYfeZ54WeNmmGrTub5E0jlPRDGvAvkWPSCrGwj
         /h81H3/Cg1Q200Xt9gavGK2o1iR33nHiBzYBqvX/zF6en6nF14tZ0Coqy2GGAuC21N4r
         MQX2uSICs4V6xWpelPLj7ZQFOUVEtkcAFxUL+3TLJbbAujWPrOsYn2kprbvYS6LsNLdD
         A2JqsbSpwEM5J5syXw7hnUEY3776+VD6EMcOMXDHkORiBYinwClivaahQRMkWxeXBC7i
         2Otg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=/34ZEKo4WKYSNfKeZJyC5zY+tHi9Bq+q7x5tIuisplU=;
        fh=UhTn3RxDPww7xUDivXtHEFmOUcN4I5x8m51rRUWYEMg=;
        b=VPZ935STWBxDxy1D2IG2NGu7JWcjBJMYGvVBU4dpP4nylfUeTFj9csdM51e9Kp3k3K
         4RfFiOuowbCkIeHr7wlAaJML96qWvBaGn5jFg6XlK9vI4Y0D29DU6CDsIUGVCu6U3DxS
         41SfD4WxYy2ruEIUOOjpflMZ8c8X7smay/JSdn+RMqmuQSNiozYyIbfT+Rs5z8Bw1txH
         z7f7SSYPtjoCgKY6oGrg3dKNYc4Gk2uK12hmNBsTWGH96Z5VHr4A3c4akgF3Tasa3wFG
         RQVqHvvpbPd0fGFrxVq4klZnkEGZog4EiRPaNiAw0oLM+toiU+tHjeLu94msWOSeMwPi
         VC2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779896143; x=1780500943; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/34ZEKo4WKYSNfKeZJyC5zY+tHi9Bq+q7x5tIuisplU=;
        b=Wt/O37JbYDl4yd5Km/nAsMShHhMavvHfWq9StSAp3LFUK8CYUV2vcyGMtpJljM5qs0
         Qd7khQMbrj/j6jFUmQe978B2aqvrzoPTY3QZQ4/RgRYQ89Q4E80vFtVpbQO9NZ2Bg5pR
         +4qsbxc9rCrq6KCOTJfXAGVMVURwAC4qgrnyq+4DzHcDefdVDhuHBaGnyYNZxG2jrcbL
         ZjkXcv/Bgs8i7XG5WQ2YpJtAcoxPiI7qmbTWT6ErUA+Xw8LgVNvkUDAezHm9hxnTz5Na
         i8xQ9G5L9/03p0AXx4shZ5vSZN21ldaoptMhVgXgq1St7tlc3mg57Io5GxElZVbJ8Ftj
         BUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779896143; x=1780500943;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/34ZEKo4WKYSNfKeZJyC5zY+tHi9Bq+q7x5tIuisplU=;
        b=JJFj15/3mU2I2baZMZURWU3MPmL4b/IlY+7YCtwJ3q11f3I7eT69DTm4UMSK5e5ile
         62ix/c1JtXXVWbWm0szFfc3IpLDm7cbF8PZt+PgNIIE4+cl0SBxWIjc4YDdfUWIR1YCA
         WvMcFDcwn19+N0dyDWP7iRh0CAg/3wD1jFQ4zvBBmHJmjDbv8vDA2c1Cd/RucUhC3BIL
         1ajDTzoOJLhldfBCdgIw+JrMGauCpEcrB/hl8hYNr6aWv5ZfKFWAcTRM2uqrjfy3RPY4
         BiUB63fMB6w6fuciZ8YO8VzU6R+OIhuZLxCRlNuolkxEZ0cBlzq9TWYJZQ5SyzmVQxCD
         Ur7w==
X-Forwarded-Encrypted: i=1; AFNElJ89ESFonnOTz4jX7kE5TFvkbFkR24YLTde6p9W7mB279NSK4WyQHAd10oEGng2uImUmV0HUDHjs/QE/AIMKzEM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZuY/+jMTDzq7aNkPCbsbO1U29Qm37wW/WDzWrA3Qz4E+6h5NI
	E5GHBDyBvdrR70m7yHgxiWN+wxql6V3TK936GHvQcSPCO9x1KLhGcc6yD3svjSeaQXeVKUzs9Ex
	nS7oiy2x9pBFHafhQ1ESjYIgJVnLLnil+SAG99Ew9
X-Gm-Gg: Acq92OFyS30L5ZMpXRO1iVx7LxDdCwHxMecmhdtrhR4mfMPJL4lAkWxbQKl7vRmJN0Z
	77AZ3XqrD4uOesda/sVfCd9nWnNslDfBMXPmqCyAML83ITN0VASgLjh2ufweMEQEdQNU6OUcDLy
	3YGG3a52YrK+A5Na2HNTXix5cFtBF6n41dVgh2TK4GY46mvfbbLc41rJJ1A0vmwDR3Q/5sAR9MY
	3FF4NkEINlXo7FkS15aOClXyQkN5TVnqBxszDtr/TGt2sEbq827QiYODB1AnHn1iqpONRbEIr3W
	yWD8aFYlWnroQ7DbwubryEpbzrXRgVaQvMG2XY+w++QLdbgjGw==
X-Received: by 2002:a05:7022:525:b0:128:d4be:7428 with SMTP id
 a92af1059eb24-1365fb4fa18mr10605757c88.19.1779896142087; Wed, 27 May 2026
 08:35:42 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 08:35:41 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 08:35:41 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CAEvNRgEZ9vCKkoMC11tVrueAonGWH2x6OeaYYxXGEj2gwHUaKw@mail.gmail.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
 <20260507-gmem-inplace-conversion-v6-5-91ab5a8b19a4@google.com>
 <CA+EHjTw-cUM=FrJevtSDtR7K6MwUfGfOx21LMFDn7DAy5bFzYw@mail.gmail.com>
 <CAEvNRgGQvMdDmVfbk42EY_PGN0ybTp-x21Zj+pg_X1mk9iCRtA@mail.gmail.com>
 <CA+EHjTzLCD-dU-euZKgzwyEr2ecPqFDNutcaHm2fCDGA+MHVXA@mail.gmail.com>
 <ag8JIlHjohAOC3-g@google.com> <CAEvNRgEZ9vCKkoMC11tVrueAonGWH2x6OeaYYxXGEj2gwHUaKw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 27 May 2026 08:35:41 -0700
X-Gm-Features: AVHnY4JKedjh8K8TNAXOjoVnM50DfBi_EKpudGArqGboylLRPDEHJZCPBXCFwT4
Message-ID: <CAEvNRgH_ToNJunEmQKn3wED1aF02hwg3GrQcRwwZTs_bfPVf_w@mail.gmail.com>
Subject: Re: [PATCH v6 05/43] KVM: guest_memfd: Wire up kvm_get_memory_attributes()
 to per-gmem attributes
To: Sean Christopherson <seanjc@google.com>, Fuad Tabba <tabba@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
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
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng <ackerleytng@google.com> writes:

>
> [...snip...]
>
>>
>> Hmm, I wonder if we can figure out a way to consolidate some documentation,
>> because this is _exactly_ the same pattern that x86's host_pfn_mapping_level()
>> deals with (see its big comment below).
>>
>
> This would be great, are you thinking an actual comment or something in
> Documentation/?
>
> Perhaps we could iterate on this a little with me providing the newbie
> perspective. Do you want me to take a stab at writing something up?
>

Please see https://lore.kernel.org/all/20260527-kvm-locking-docs-v1-0-4fe8b602ff47@google.com/T/!

>>
>> [...snip...]
>>
