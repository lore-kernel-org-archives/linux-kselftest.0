Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382407;
	b=bjc09fhNuaP1lUnNICqUoxpQVYrOcCGXroAZJFALebfDTRYsUE2Yv8i8zidJ2IeV5Q3C
	 1kif8MAMlH+n1TENiUeNOrMgQbjAjgMe8K+6x+7w8G4oFbmdeFKdg9P4ErPFfeKqHyQEM
	 8ojZxcjDFhaivpb5hELi5J48W41uhTIAcM3kAwIwSk5oprva0pIhqvglirKoeqnZRAVP3
	 Sbjcb7kZ78doXuq+1WUSD+AQcTLXZvkS5tlxpLvWuu6tzXMoYg1jIEPJGhDwK1k5HkORr
	 1nYQ5XSGevH8gj1OsLsVpDxpktO8AyEOaTNxhORCnpxDLMtzEzQkgKd+jmmaCLWH6HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382407;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ZXTuUfTiwARPzYpe47EVYVEZfhSupOV6v+3jKAilH3I=;
	b=Z20MVhE7nEFybHofjsCyHlpq8cX/CQDIDVocWQykBJtNaV1303On8WocStwXcRjRfyBr
	 +M6qX8WhAmqQUddrwB5cPbc7lB44t3OGI3WUATp4YoyLRRJ23uE6zPS5G6v082gH27bud
	 Mqho73YbsTz9a9jA8hdzjHBJyFteeYuwFP01Cm4dHvdTByoLtm64kSviLcrcCoB+WyyBf
	 erOzQxYA/Tq2tx7Yl7+Po7XDhog7xka1G2frjQ21dXeZ9RekJDXUMcUEts66I1sDY2gui
	 YAPAvrRbGdGugK4wFdu1nWbmMDZ91cjeA3L0PQsagEl6OhIAvtjfUjhOb3sVz38rJVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R+pjGXQK;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=NJwbNV2G;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CAC606A31D
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 17:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4CAC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R+pjGXQK;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=NJwbNV2G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793382405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZXTuUfTiwARPzYpe47EVYVEZfhSupOV6v+3jKAilH3I=;
	b=R+pjGXQK2vOeZxQ7btHHK7ync5G+4T+9txQFl6ZD+YRJsNUe782PXKwBTgQJcMcYgbhw6X
	E6Ws7wnRoazdsN6J9/bh8uMWzrs/JYVgBjBFTHxZ0o77kSyTrTNLaw7GR8Bh6Rd2Si637Q
	saKHf06vZ87yh7Nc5Q9Qw1ObFPrERJ0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-Gc106hOoOWeG29Iu04Fkaw-1; Fri, 30 Oct 2026 13:46:44 -0400
X-MC-Unique: Gc106hOoOWeG29Iu04Fkaw-1
X-Mimecast-MFC-AGG-ID: Gc106hOoOWeG29Iu04Fkaw_1793382403
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a35db2d6b3so7021575e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 10:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793382403; x=1793987203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXTuUfTiwARPzYpe47EVYVEZfhSupOV6v+3jKAilH3I=;
        b=NJwbNV2GpbtlmkfoggFyWomsgRYlC8jCV5yblDd33K4RzVcHjJkfqyvATZsbh8/HNl
         742Et3UoK4NQsRSRxfIKP7QW8JQGAmiF9C9rwmg9q+Oy7uKK7QFPtZ42Um3Ms+LioLTo
         mIuKCF1XscR6pgtBIMddp7SVH7mJLdrP847ydxmcv66//NkF4VOS4hBLGmTpO2qqr3jd
         2hVtPXgBVOic4zLnEIjzdG/cy48ykuoed21wBb0n5AzHR60TsW6Tn+cmKd7hi90ZfRMy
         tJ2wLGDn61qDszezk1/ZjCYX9Y0spocKA9HzLCOXXu8uCfq4MdnVTm8LYx192sH1nn0P
         hI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793382403; x=1793987203;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZXTuUfTiwARPzYpe47EVYVEZfhSupOV6v+3jKAilH3I=;
        b=U6AVUBWk/BzGK4Lt3+btv+L1Muva/PwcBl6jOHXGkr3gKlursWFQ1yqKj7wn7+/hGu
         1ZELcEyBXxBgtcdSRmxL32Wz2rtmwfx3JSPOPF5FipdY3HyllwjvRXlFvx28LSsGx01K
         mYYtswvGwdBGZk3iKwiqWzYxY/cP0nY07UIofLOF1lFNIohlXX68eFKwet/h8Cs8rA1P
         MgJXXEx9zRkuxRIXUoFifcBKKNnfyB/1c7hX8Of37MksC6I8o8QjqOz+8kiTAzCegw0o
         EU9f1P76LqdjE5CYWT9u6JWmAswihaDtwkobFAacPGuX5GBq2amMlBxhWzvhlQi+cvid
         5LBg==
X-Forwarded-Encrypted: i=1; AKwUvBxozxqEEBJjc77Xl8Hz2wIJccBFxuJyYw04QnoGEhiqOqL/lqhT+j+Ryt2zgiTh5/MzBDVyDI8q94B5FBleFl4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrtSGoAJ1exasFJOVqrmJnWNL8Jon3kUfKKomOoPKc6yGDWdGE
	+ge1PZ86Q/fczawaWLAVboSSJQmUwKkP/5Fv+ZFG73Ma3DLmQWyObQU5eXFXx7xKzqxNT9yqnsN
	KYQNg3Mx8VnMylHh1oXwmQFelhWIdqka3izXEx4x3xpoiiMqXevjd+RLVDWAztaOksXCPMQ==
X-Gm-Gg: AYBFou0pBTLUfBlr/eT8j5PBldxIiU9HssWE1wxylzKeaPh9rgRfKMQQ2i38bZpd2P4
	0/ojDx04DqJ2ZHNBSklXkc82B7iT3eJcN624ltLvZCEOrAc7qUsjGufmGRfgJfep0u3yCOHej2e
	x8diG36xM6BUzjkqXcTDu3flMip1h+LIwSH7XTMv0dkhdn1071YoPoB4Beo+bx2azCfAdAT4JyE
	aYrcB+PAsOq1rORQPvjkbDIhF7Y/nxNcr2cudxJ2jBZgwDz6nIkvlLlVtHeXNrxqy95WeQ7xlaO
	qKZbpsJdy/QkXSQwxg1pPJcrprYHnZyQRX++Da/Xv+rFbCaHcHiTecDYAMf/5SZS/Z18d+Ddm01
	boQQ5Z1Fo65VwUD5G+Tl10YGgUsT4z6dPX4EDPTUfVrBYwQ==
X-Received: by 2002:a05:600c:800c:b0:4a2:d99:3171 with SMTP id 5b1f17b1804b1-4ac17753c13mr73718625e9.23.1793382402986;
        Fri, 30 Oct 2026 10:46:42 -0700 (PDT)
X-Received: by 2002:a05:600c:800c:b0:4a2:d99:3171 with SMTP id 5b1f17b1804b1-4ac17753c13mr73718145e9.23.1793382402620;
        Fri, 30 Oct 2026 10:46:42 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.112.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf60f1114sm77200805e9.7.2026.10.30.10.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 10:46:41 -0700 (PDT)
Message-ID: <cdf09fa3-e251-4d8d-9f0a-316998df036b@redhat.com>
Date: Fri, 30 Oct 2026 18:46:39 +0100
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
Subject: Re: [arnd-asm-generic:asm-generic 15/15]
 /usr/aarch64-linux-gnu/include/linux/types.h:12: Error: unknown mnemonic
 `typedef' -- `typedef __signed__ __int128 __s128
 __attribute__((aligned(16)))'
To: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Linux-Arch <linux-arch@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
References: <202610291918.kHO0GTDB-lkp@intel.com>
 <9e294bfd-4704-42a5-a704-f301f4afe042@app.fastmail.com>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <9e294bfd-4704-42a5-a704-f301f4afe042@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/10/2026 23.13, Arnd Bergmann wrote:
> On Thu, Oct 29, 2026, at 19:09, kernel test robot wrote:
>> tree:
>> https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git
>> asm-generic
>> head:   dd7cc8c26b6a37a54adc5ce38d286521b7201044
>> commit: dd7cc8c26b6a37a54adc5ce38d286521b7201044 [15/15] treewide: Stop
>> defining __ASSEMBLY__ for assembler files
> 
> Hi Thomas,
> 
>> config: arm64-allnoconfig-bpf
>> (https://download.01.org/0day-ci/archive/20261029/202610291918.kHO0GTDB-lkp@intel.com/config)
>> compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
>> reproduce (this is a W=1 build):
>> (https://download.01.org/0day-ci/archive/20261029/202610291918.kHO0GTDB-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new
>> version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes:
>> https://lore.kernel.org/oe-kbuild-all/202610291918.kHO0GTDB-lkp@intel.com/
>>
>> Note: the arnd-asm-generic/asm-generic HEAD
>> dd7cc8c26b6a37a54adc5ce38d286521b7201044 builds fine.
>>        It only hurts bisectability.
>>
>> All errors (new ones prefixed by >>):
>>
>>     /usr/aarch64-linux-gnu/include/asm-generic/int-ll64.h: Assembler messages:
>>>> /usr/aarch64-linux-gnu/include/asm-generic/int-ll64.h:20: Error: unknown mnemonic `typedef' -- `typedef __signed__ char __s8'
>>>> /usr/aarch64-linux-gnu/include/asm-generic/int-ll64.h:21: Error: unknown mnemonic `typedef' -- `typedef unsigned char __u8'
> 
> 
>  From what I can tell, this happens after your last patch when cross-compiling
> kselftest against system headers that still check for __ASSEMBLY__ instead of
> __ASSEMBLER__.
> 
> The command from the build log is:
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-14.2.0 ~/lkp-tests/kbuild/make.cross W=1 -C tools/testing/selftests
> 
> The command that causes this is
> 
> gcc -std=gnu99 -O2 -Wall -Wstrict-prototypes -D_GNU_SOURCE= -I/home/arnd/arm-soc/asm-generic/tools/testing/selftests/../../../tools/testing/selftests -idirafter /home/arnd/arm-soc/asm-generic/tools/testing/selftests/../../../tools/include -idirafter /home/arnd/arm-soc/asm-generic/tools/testing/selftests/../../../tools/include/generated -idirafter /home/arnd/arm-soc/asm-generic/tools/testing/selftests/../../../arch/arm64/include -idirafter /home/arnd/arm-soc/asm-generic/tools/testing/selftests/../../../include -Wa,--noexecstack    vdso_test_chacha.c vgetrandom-chacha.S  -o /home/arnd/arm-soc/build/tmp/kselftest/vDSO/vdso_test_chacha
> 
> and looking at the preprocessed file, I see a wild mix of tools/include,
> ${srctree}/arch/arm64/include/ and /usr/include. I also see that at least
> part of the problem is that arch/arm64/kernel/vdso/vgetrandom-chacha.S
> includes arch/arm64/include/asm/assembler.h, which then goes on to include
> the world.
After getting access to an aarch64 host, I was finally able to reproduce the 
problem. I think it's likely best if we force the selftest to use the 
headers from the current kernel sources instead of using the headers from
/usr/include ... i.e. this patch fixes the issue for me:

  https://lore.kernel.org/lkml/20261030174323.370687-1-thuth@redhat.com/

WDYT?

  Thomas

