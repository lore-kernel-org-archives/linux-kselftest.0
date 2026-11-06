Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988499;
	b=i2kMMWtPZiF1cxBH130wOSZ4YQUr7k/5ZHoVj8C13ltbbSP+iUlJRikjPL+RIJKv9W2f
	 KxDN7j2s060UvPwgSCshTbnnOTWQ2QRt4Km5+JqJT7oBIHgESuJTD862xMsOygnOO07jv
	 X6z3+/H/Fj8M6m0r9GNpieMZdQQnNZ59eHlC2jVD/cSCIx/ZmeDO0SYOd+5I87pPBhLLs
	 //7AMMdF871bILiQrdFhsojzmx034QYljXmGyzW4FGWpKzI9QSYVbamph7ROSioN+3a32
	 Asge7A1/9xG4tpiiQOCfBIBbuG2Gi9Amy1AHvUljRBZt0RYV8vIcZd40Om3TvbAqnBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+D9ErcY1cg1H93A7kgsl3DQ/jvK3dao4218hxA++MOQ=;
	b=SNTHL+GrrYZDqCMDtsTmV/L1yxp176/JkFIeTJ7eyBOrbnqCgDlfip46cwCBPpy9L7OC
	 MujFfeHru0txBM3+53R3p1lfjZN8y9LhUON7Dp+ETDjSjtvA1Yq+wjl0kQT6Bgv9jjm57
	 h17bfWtPolPF/CyKSLKe6sw//xB7APAbqo8uRMfPIxFxHkRRjSJ7+VBrgnxZfpQW6PXnR
	 5DjB4EgUjjG34QOVpMNiIvKBqoynsl6ljF4205OCX4Pg9p7lo0bViaW8xZUdE6tHcN1rN
	 U/Dfb0DT/VmyZaG7RUM13MiwzTmvNZMKHjl0ZT8ujgGDUzMHDw7DA1L5qXYifJbsMxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=UblIupfw;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979D760A263E
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 18:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 979D760A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=UblIupfw
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6aa9606ddadso582284eaf.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 10:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793988492; x=1794593292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+D9ErcY1cg1H93A7kgsl3DQ/jvK3dao4218hxA++MOQ=;
        b=UblIupfwewWm3kbODGTK7uih8CzS+q5+ojxUuK1I60tKEFRzBfCgfcUWTuilVxIV7z
         S9VxA1D83HVQooY3QRaaNcpMD03JMWzjkDtFSoVBM3pYBYCZj0Ft5ENi3M1P3QpjesXO
         q7Olvp5hYauvaoCT3QrTRrFmlpTx+pJeDKtS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988492; x=1794593292;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+D9ErcY1cg1H93A7kgsl3DQ/jvK3dao4218hxA++MOQ=;
        b=oYyGz3Aq0YozgEfUWx699A3tUe17j1nY3sMcpqCGahZUB4JNR/stvpursnvbv96l3G
         KK1mHCdb7GkwuupDrAIIk1/tQALy/Ta4nHzvw+FguehVatU3PvDdUM2XHlaA+vSDsxm2
         0qey06DKz4MozvUJty+BK7SWh3kGb2ba1yllfj5vJfPU/d/MbDT+fitxGuSW6vSmTrWy
         atfylul29i6OSm7tbx9fH6ghsLE0geeflbc+pMn2OAy4v5n4G8xA+Hvso2c1GZQcM9kn
         xDv7WfjNEs1OvmaWSgzdh3v+DB8W3yaPTIH+aF7hLVHMzfGwoAKeuwBAATtjBg5hCx7k
         PyMA==
X-Forwarded-Encrypted: i=1; AKwUvBwL4RCvRHFCPL1du57xuTqfOIiz60H5LLq3FLrjJ8dVpKE8v3nc5uOjEBwW+pivURZdfXrPvZsHQ56UC6aOU6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uxhT0Wxme2FMWWk9GUsMC5MbhcgzEOD2GYVMtykIijQVy5IV+
	T1W+pym97kS8mRGOvQv/oqUJqpEVMeDVoozApYECQUUcMCOwddhdPVx7WGBy3Do/ovo=
X-Gm-Gg: AYBFou0M/DW9lH7B7b2MBxilILpmvZdN+wfEWPrjhaud85cr9qCUmtRdQSjyv9QHb5a
	OzlyePfu/3tudx+YrquPSWF84l7Ex927Wjbuj3IgtNFUlCB9pPlDo0UJzVp7wWB8L4ue2zsTl4r
	Mtof4wMTrDpqUesI+utc2B2eXDTebjX/7Rd9iileKOwYo00xNNZ24Ep4xYi3SBG+AbIXr2nHSco
	btMyvc4v0p/JqCY6J4r5r5AI+cXPNIMErqdcbRdW+fsNqRmZI/8H7XNUmWY1fCRrA2zek3flQCM
	vaqM/v96om1H9hYH3mRrbJe32olIARer8h6vmMVX4VqzCzsglN5/HNXQRpNXDdXOpFZsaMyROpK
	pkoDYqZg0jGXltDfLXEPsJkGK7VMeoNBMzeeH6vj2Efp2x/eGQlkxJLm4MCGyXVFqAzazU065G5
	2JO1DUcaQeoXc5Kj5pPv+i+L09eybLhf8qlT4Rc+k5nKbFv6Zb8KGEDo1J9VPKXRjGbOn0+0Xr9
	4V5Yb8CRgTnQeRsB7ZU0haQJE+Py93Fpy6oSnn29QsyQeKjFHEhpKLe6mDuUv/D1iWI4Qxv7SKF
	GkSpzpHkDvYXUUR+ASsdLyK/yCQ7EUh8i7g8jFI=
X-Received: by 2002:a05:6820:2088:b0:6e0:1599:a4b with SMTP id 006d021491bc7-716e7913562mr2314159eaf.18.1793988492496;
        Fri, 06 Nov 2026 10:08:12 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb29acsm2301463a34.4.2026.11.06.10.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 10:08:11 -0800 (PST)
Message-ID: <b6468c17-46ba-476b-9182-0826df6bb9c4@linuxfoundation.org>
Date: Fri, 6 Nov 2026 11:08:08 -0700
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] Start removing X86_X32_ABI
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>, "Maciej W. Rozycki"
 <macro@orcam.me.uk>, Bill Wendling <morbo@google.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonathan Corbet <corbet@lwn.net>, Justin Stitt <justinstitt@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Neal Gompa <neal@gompa.dev>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Sam James <sam@gentoo.org>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, Tomas Glozar <tglozar@kernel.org>,
 Willy Tarreau <w@1wt.eu>, x86@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261015-x32_removal-v5-0-2bfef9151fad@linutronix.de>
 <20261106113147.iCEmPCOW@linutronix.de>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261106113147.iCEmPCOW@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/26 04:31, Sebastian Andrzej Siewior wrote:
> On 2026-10-15 20:47:13 [+0200], To linux-kernel@vger.kernel.org wrote:
>> Patch #2 prepares the removal of the X32 ABI and has the broader
>> reasoning. Patch #1 removes x32 from the selftests because it does not
>> have a depends on and assumes x32 to be always available on x64 and so
>> it breaks.
> 
> Can this be merged, please?
> That (syscall) test fallout mentioned later in the thread is fixed in tip.
> 
> Sebastian

I gave my Ack for selftests - I am assuming these will go through x86 tree.

thanks,
-- Shuah
