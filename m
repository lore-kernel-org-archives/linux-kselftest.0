Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0524819CCF5
	for <linux-kselftest@vger.kernel.org>; Sun, 24 May 2026 01:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779587302; cv=none; b=bZpqDqj3sT91aBR1GyiiSht/IKM5QEmk4IkoJDtbnWPHvfpIFcLjSPBP1CP9CdzZBs9F0G7d77Nut0PqXIe60DRyAEtHMuhem8ksY4fBam6gHIbWSkvh1WVws9lrhZITuIAl5VjAdkKqH+XfmUo2jIK2sKh7ZYwIdnRXqqdnd28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779587302; c=relaxed/simple;
	bh=cMd/lJ2EQ10FNls/mjg7v2OE5+44ngn4N3LotgBZqw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dsh6zqUL09BBDuLz/SLCVDozePDME4F5dOpJef7cERncFHMyiazrZYVa180ju7B8KycsHVx2W2oSMN4AwLf4mk+UO5xq+GXbyZfsj5QkL8rIIHHzWbAAOalnzKLnYTo/ZBkkbhFsVYjLIK6GAmdyDa1Ep501PVONqzOb3ESSjZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FyX36vDY; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FyX36vDY"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bdf8add254dso49567766b.1
        for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 18:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779587299; x=1780192099; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WO7a9U4fsCTq1SpeHYwHmvNatujDJSQpb2AN7xfznlI=;
        b=FyX36vDYTe02m67jJ1V1p4Ez36LyyGO5dLdNX8MPUkLR7nAGS7LpbDrMwH/yfJ+bpE
         pueAu3v7+EUe3kHFw4G8t+tg2PXU1t0CosSIIrOmI+82o+AxaUAtJXjiY6t2FGoAzCVi
         CQ5gVqZERobdSvEfSXdcAaiW3F/CEQhW1Pj1RW1JpEMgUme3bcC8fK4LKbCtPI5hajG5
         pVO9VmXVqo7H9Vv1AzjnvdqSspDv/wtq+B+85kIQPvybzXfoZ4so8wNxcDK1xQZwtonx
         z/WGk1OjiVp0wUgSg02J4UtDgupSsazoybMrzSz9LXdNpgde/1IcelgM+WTYQ5kfbzfY
         DDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779587299; x=1780192099;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WO7a9U4fsCTq1SpeHYwHmvNatujDJSQpb2AN7xfznlI=;
        b=bDkSscX1ViTpIbtJ7nzDFTmGRZCsk75YNZ5LeTlWzqIE7D7pdwCp+qYBH16Gt9Vd0S
         zeKROnkOMJgspmvrYzs0xOfcc109kuV+I3DFPvLRlxjxduZje0IW79ytQZCFs+yU5c8y
         hS31vyRM8ddZwwhjoz+A2wD83FsQz/UwnGhAs6KpOzTMn4WEpb1d95dG2PT9Ob6hlPpG
         8X7WTIT5bVrAjFyOukfsAMptdKSId2I2zLRTJqAoQ+Re1GSxj9mB4BE4LLXpdM+xjUzy
         S1mp2ic/u2CV2PfBppfnhgHpNJOf1eHhNZpeI9c3+hXSyLQ/7BvisoH8fR1G02aGC0KH
         2Sag==
X-Forwarded-Encrypted: i=1; AFNElJ9O06IMx2K/2+E+gNf4iX6eFhcJtV/qrG5L6wbgHXnfsib/KRSKkhNrTac27CQfxve4kkZu/K+z+qulIHHUZ6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs9O1KFNZxkR9QuswfkZHmlt3FvAoynMkKrv6ylp6BEUoF4ujL
	VGv1ER1HCodVLdyDSvyHhexA912xC3Prh1jFz9ZZDGHCTZHkKHH3V8M8
X-Gm-Gg: Acq92OEJV2mEqISLBHhzrjh5KTlWpcV4QAVxagc0hdRnGLbla8y7nuMrkGdFOflU7g2
	4YeneYrLxXlr7u6tzVpttDUKD8YCt8XgOSt+bGCtjQQe+dN2kKg1P7uMfK+yT5pqJ/gi5l2847b
	DgaVLf39NqGTqojEBxQfZpvoVMXeK4HHBlqCpvqATnaXoiBdf5tBfmDfMo5ndSjcN7YWou8IdS8
	2Drld25koKcBUK6dUPKpHI1wMWLJcOWs3/56sbJRMakvOWpR04ULO1gVQ/jMfhMwQSXe1xAubJJ
	SnEX4BdvCPLgoLYUUyLP7mx6lU4v87fGqkXGGf+9h/J4xkDdmt+LY+PDUkdcgzxLF/0kfsc37JL
	pWuWw2xt4oWV5nMKPEF7HjysHFGl+MdsZGJvu7iu+sKBQFf5vqg08L2bvWNS9OFvEDm/A6O3tiL
	VHBy3pNlLcMCWS0EKiqCBGRA==
X-Received: by 2002:a17:907:928a:b0:bd8:f4cf:388 with SMTP id a640c23a62f3a-bdd263c976cmr509526466b.33.1779587299162;
        Sat, 23 May 2026 18:48:19 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc62d9520sm241095766b.50.2026.05.23.18.48.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 May 2026 18:48:17 -0700 (PDT)
Date: Sun, 24 May 2026 01:48:16 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Wei Yang <richard.weiyang@gmail.com>, Dev Jain <dev.jain@arm.com>,
	david@kernel.org, ljs@kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: close fd on write error
Message-ID: <20260524014816.4aivvwqa75fad2sr@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20260520020336.28914-1-richard.weiyang@gmail.com>
 <20518530-12e3-4731-9b4a-54cc950239e2@arm.com>
 <20260520093824.eannlavh64fpxyrz@master>
 <20260521174951.d16f76cc39cca19bb5d6ee70@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521174951.d16f76cc39cca19bb5d6ee70@linux-foundation.org>
User-Agent: NeoMutt/20170113 (1.7.2)

On Thu, May 21, 2026 at 05:49:51PM -0700, Andrew Morton wrote:
>On Wed, 20 May 2026 09:38:24 +0000 Wei Yang <richard.weiyang@gmail.com> wrote:
>>
>> Subject: [PATCH] selftests/mm: close fd on write error
>>
>
>selftest/mm is a big place nowadays.  I'll rewrite this to
>"selftests/mm/split_huge_page_test.c: ...".
>

Thanks, will do similar in future work.

>> >I asked AI and it points to another problem:
>> >
>> >for (i = 0; i < nr_thps; i++) {
>> >	if (is_backed_by_folio(page_area + i * pagesize, 0,
>> >			       pagemap_fd, kpageflags_fd))
>> >		continue;
>> >	ksft_test_result_fail("THP %zu not split\n", i);
>> >}
>> >
>> >ksft_test_result_pass("Split PTE-mapped huge pages successful\n");
>> >
>> >"If one THP is not split, it prints FAIL, but then falls through and also prints PASS.
>> >
>> >It should probably jump to out after the failure".
>> >
>
>https://sashiko.dev/#/patchset/20260520020336.28914-1-richard.weiyang@gmail.com
>doesn't say this?
>

I took a look into the above link, but not see any comment.

Not sure I got it clearly?

>
>> Thanks for AI.
>> 
>> It looks we should "goto out" after ksft_test_result_fail().
>
>I'll assume that's a separate patch.

Agree.

The credit belongs to @Dev. Not sure I should send the fix.

-- 
Wei Yang
Help you, Help me
