Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0751C2BE7AB
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 13:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779197304; cv=none; b=E5h//98MIn0CXp6OfxRXyAxY/wuw6DnScH/HGS+HYk0KgQRn4Vh3kj1URhGF5iVpM+P3kMDr5oFfk5NbDyiXl+O7sF93aBdrF2N3+ebwvqM+hrv2xDe+MRMm/bU3STwmDUTESKpqngJP3405vtm7ndPBwhTxL7lOw2yqTd+jZVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779197304; c=relaxed/simple;
	bh=iwHc29LNnLpmUOg2eutx8cbS33+wCQg+i+k0OsnCsQc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O8q8tllGtfMM65P903NVZhxn/fbV2YaX8Gwu+1agN6cTlENoRL48IoIU/+0CQS7PwixOGBJp7r47+k7NgikM/PVLyTbUzmOCxqZNjQ4AsPI5oEPBYB++AhlwJKa/jPiHNKmd/GfkEf4aPoYxVsW17+9UUW0cqNpu0Py7v/QdfiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jY+XAXDU; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jY+XAXDU"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso22383815e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 06:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779197291; x=1779802091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrnAXjb4+RnoNs7vk9iNrF9lZLJCz88N2UJo020BR1s=;
        b=jY+XAXDUvWafwzDWL6vMFqWBJReUbuGjs761BQhVZHb8UsPXCv8uUX+hfDEHMpO6av
         E/j5rYNY58Xn0Lp6sQKZut/pxWnmJp4GqjHro8ZfOx2C4hWDgotMq9lez5qMK2x9bgYg
         5Hr9MdqtD0Vk/mNo7JPk+vinkp+oKPk7NdD6WNL5b+H8xLRUFVqcQKAb2cZIs87oaYoK
         yEh0oHMGhBc4hXwsMNdiQRhMkqJW/WIIvK70N0YzqeYYkv+abB2k9Z6lIsulp9Jl64K+
         seBTfAJxDVEUoJcjIUWmDs024TvPWm4tjSARTR+YUY5JqbsNrOzBrI3AH95ewpN76ewv
         RF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779197291; x=1779802091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yrnAXjb4+RnoNs7vk9iNrF9lZLJCz88N2UJo020BR1s=;
        b=FnX4yghrQPzDaTiR1VhQUxodBRGLACQGShCyTb6al3P4hqov9bclEyY+gXQo3fKRkM
         mOGanawWc/q4l70U4FJvIENvfeevS2UIqxHJyAPC9Lz2Tzw0DhWhdNsVxtAFKauwNab8
         5ctTaFvbZ63+5SqgNUbueD99AvALMSUeUFHa6WXthj0hoCrJoClxxLMN+UkLASdoejOu
         PXjUX1HXqa3fU1sa7jlvxBKsY4wdk2Qo9jStwbaQDWrq5CcdzNItpJZ6ocInSfL2EBmZ
         4MMLc8YoW8kbdx2LOjJQSphbYTdKgFpyfamrp2zQnp+fDTpIsZ/xcws0I529b22ZCykV
         wY/w==
X-Forwarded-Encrypted: i=1; AFNElJ/bnHtMMTkJoAiHbcYM6OUpzi/bxoe2488hqyCt6zSf/7JDcH4ghi6+dTsU+4N6GVj08p0QXn7ds3NwcFH7DtY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrL7/IFCfUqzWROGXhKDpZ8glid/pGmnJmj9hLQ3yDWn3X0IRK
	o8g2sPZluzHgCS+yYX6Q7T42swOHsYT90CtxTv4weXk7vZlvb9WMP3Gi
X-Gm-Gg: Acq92OG3ncIphTSE7NYKAwQM5DF1rgyosiyIcSvEyjiOr+G7ylAXbiz1T/FjXuoZSEO
	EwNLK9KijenLh1Z9Goel7QQp7zDmq3OUIj9cDDZv3ZXCBs1sQoSx657dPStSRtVf8paJuHQNt3A
	5rm16WM8xb0SIIwmYYCt5PvTHxJ59iF4l/R74yNqqZLEpSLuOpzoyXLaqi37lZuayJycX032NH+
	gOFYAY98qU0A47kXK9DuPtKjgMeTEXiK34iWaTo0iu1FA9I5i51RaRYMu1R5EWBe6XA5IVMtvNw
	PVSOG54dslusa1Kah36R/hBpIbmtIyeqfR9gaFE6PoyuTCqdvRxspxLxmbaXoZUd4rc8Scgxvlc
	EhYhxBosypphZBtZgXCkzAbkqrQcmaSAnQMAEgXYL2RLH5JudZoMfFWqRe1CyHWrQ5ZEh+bZ5WP
	YCK9kmiOhKEtK9Aa9MJGUrC1rhxik5xwvzoTxUDHa7uFAYGKKUiecqOqSdSDi4PjBhmjse8znhC
	yA=
X-Received: by 2002:a05:600c:35c5:b0:48f:f64c:c314 with SMTP id 5b1f17b1804b1-48ff64cc4d1mr253393515e9.30.1779197290857;
        Tue, 19 May 2026 06:28:10 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767cb9sm43969624f8f.2.2026.05.19.06.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:28:10 -0700 (PDT)
Date: Tue, 19 May 2026 14:28:08 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Richard Patel <ripatel@wii.dev>
Cc: x86@kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>, Yu-cheng Yu
 <yu-cheng.yu@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, Thomas
 Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski
 <luto@kernel.org>, Kees Cook <kees@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] Usermode Indirect Branch Tracking
Message-ID: <20260519142808.0d3605ab@pumpkin>
In-Reply-To: <agxiORpLBErOxLin@wii.dev>
References: <20260517183024.16292-1-ripatel@wii.dev>
	<20260519103345.49e52ceb@pumpkin>
	<agxiORpLBErOxLin@wii.dev>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 19 May 2026 13:14:33 +0000
Richard Patel <ripatel@wii.dev> wrote:

> On Tue, May 19, 2026 at 10:33:45AM +0100, David Laight wrote:
> > Isn't using 'notrack jmp *reg' for jump tables actually more secure?
> > If an attacker can write code it doesn't matter.
> > The jump table in is RO memory so can't be written.
> > But if there are ENDBR on all the jump table targets they become
> > possibly useful code addresses to arrange to write into some RW
> > function pointer table - which might be useful.  
> 
> You're right. I was worried about an invalid jump table index at first.
> Clang 22 happily optimizes away jump table index bounds checks. GCC 16
> seems to be more careful. We should probably patch LLVM to never
> optimize it away, e.g.:
> 
> 	// funny.c
> 	// clang -c -fcf-protection=branch -O2 -o funny.o funny.c
> 	// objdump -d funny.o -M intel
> 	int t0(void), t1(void), t2(void), t3(void);
> 	int funny(unsigned long target) {
> 		__builtin_assume(target < 4);

If you use __builtin_assume() you get to clear up the mess.

I don't know if userspace ever cares about speculative array access.
If it does you need one of the mitigration - eg using cmp+cmov
to generate a jump table index that references the 'default'.

-- David

> 		switch (target) {
> 		case 0: return t0();
> 		case 1: return t1();
> 		case 2: return t2();
> 		case 3: return t3();
> 		}
> 	}
> 
> 	// Clang 22
> 	0000000000000000 <funny>:
> 	       0: f3 0f 1e fa                  endbr64
> 	       4: 55                           push rbp
> 	       5: 48 89 e5                     mov rbp, rsp
> 	       8: 3e ff 24 fd 00 00 00 00      notrack jmp qword ptr [rdi*8+0x0] // vulnerable
> 	      10: 5d                           pop rbp
> 	      11: e9 00 00 00 00               jmp 0x16 <funny+0x16>
> 	      16: 5d                           pop rbp
> 	      17: e9 00 00 00 00               jmp 0x1c <funny+0x1c>
> 	      1c: 5d                           pop rbp
> 	      1d: e9 00 00 00 00               jmp 0x22 <funny+0x22>
> 	      22: 5d                           pop rbp
> 	      23: e9 00 00 00 00               jmp 0x28 <funny+0x28>
> 
> -Richard

