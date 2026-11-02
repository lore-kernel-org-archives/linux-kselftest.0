Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606832;
	b=HAPpeM0kAa88r0pKsf1MEZ+PsuhMRFckm9we/mAgeZwJNm1CBKtpd+3/HnQeHhzfMO4a
	 wjV5JRz18YhCOTVk//tWqxkDAjADN0dgSUr6aS5a3WKibke5KgS9RrymE/t5r961qqP+w
	 wSPbUz3GQcWohXUdPZdIjUdvZ7HCI/nWUx3n5S2SmDYp4fRblQjsXZtRO/lCEDnk8HtW9
	 Tqu+WtE1zqfhogxOtFtldmC/ekLKRhY7hqGzIg+MHUeYYGGy+K38W2ARjVoMirg/rwk6Y
	 HGvfyN0sfU91eEGmVRtRieAkFptj6d5ZB2DhHgOqCNT6W84TkaKzb3hayZe7UGaGWPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606832;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=txDZNnldTMQQD+iUaNISkBDV+/o31r6YdqxFAbl/nU8=;
	b=AvxV6RgrJJImVtxWzvZdFM/h0UZanAL1juk8DlBD/UJa88GSn3Z/TiS25AJ2gRRUF3k3
	 s6yJoyuXp6Hwx1z27UFNTo1qiDlJdi9DwyGMnRBBvYCNdosFZ7kmxr/ab7y4yX8jlmVUP
	 CsqY7XkjRyig9FUwmiFhi03mol5Fnz8JpjMsPDA2jCHRbL/D4f5xwQoDmxQaPfphZlLz2
	 WDQR3Xvr+dYGC61j6vFgUDplxdiS9YB2uF1kkC/mOmiE1/IFBlwUXNBSAS/vl2z8W14Nl
	 UkXLmaS1O9BaVEUKS2tv5po80g2TlhV9bevDmSqX2KuruBLu7jYDIPWBDO+GWhneltw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XxQZHSSN;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Aqkgq0pu;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D5A60A260B
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 08:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19D5A60A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XxQZHSSN;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Aqkgq0pu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793606831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=txDZNnldTMQQD+iUaNISkBDV+/o31r6YdqxFAbl/nU8=;
	b=XxQZHSSNlDmZ80YUnhIXvWf7XIteVFc3wTF+iZzWL/pwEFxbWy8bZn3inVJegNrWTOCi/W
	slTuZ+sHqic830sF9Kgk2BgMtn3KpfBEHIW0FdTRpHwS7k1Tc0kZc3s+ICHFeLO9uGFcQq
	ZZosBoSJGjFPp/BwcOgEdKF90FFNu/Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515--TL3qbBJPRKLfGw2qX6RsA-1; Mon, 02 Nov 2026 03:07:07 -0500
X-MC-Unique: -TL3qbBJPRKLfGw2qX6RsA-1
X-Mimecast-MFC-AGG-ID: -TL3qbBJPRKLfGw2qX6RsA_1793606827
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a17741243eso20557855e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 00:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793606827; x=1794211627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=txDZNnldTMQQD+iUaNISkBDV+/o31r6YdqxFAbl/nU8=;
        b=Aqkgq0pulRem/rOmu0N4GieNR4/CCnbPxlIt5QUrD++07RuI2/I6o0qX1WxokBdSEz
         qTKQaysMXj9kFrIUavqH0uVKnSIcgEgHWUGqHb9zEOwzixaHfUiusVxw4BkiWIjde1cN
         hEMjje58+DRAKPZh7RhI07tvSMS2TcRS3P/D/GnsU/iDFt4UbbNxDvqOxwvrJGTAXzyd
         y0uVwn04SHe5/FyJHWsEWbvV46RIQ+jQqeJL3WauJ68FCq0AfRogOQGUCuy9KA6oc+JX
         2eTKnpsl5AY97gj2mJqMzD7bPvPE6l9efdWGFiwHIz3641GFOZgvT/ZDdinsYdNozHnR
         QtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793606827; x=1794211627;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txDZNnldTMQQD+iUaNISkBDV+/o31r6YdqxFAbl/nU8=;
        b=1bwWnz6qY5+jpgKeDyz5dXw2tQuwJU6TGycfShobYJ5twQovsq//cQEOOLkXDd6OYT
         NegkGewKPiwjalDDmrkk5+36yH8ka18raSmDDbU5jeArB76tqYgl5ILzgmDy42qpG6eU
         dviXjVWPYvnj/+AybW7KEEQL3N5uSYGiYB4sCd88M6tE5ntzUqoEbH6yZ00bQwL/0+cH
         ct4PYi/4czlFO/5ccymGCPhUb9kD/jWMJ1FiIBHQ781ipkMu5drannjvyRaczUfJ0MGD
         jMxyxr8oN7z66GUKLf14WED0rz8v3Dt65vFJ1RecbwkimmZ33Ac28hsp8eyNDZcnyP+p
         ahNg==
X-Forwarded-Encrypted: i=1; AKwUvBxhxbFVQChX/jLXNp3KkIeeHPWLR6TqoIO2LBRsNtjSAGD17Nh9RPb+Hi/tqZWGyMhpyDUpdx3NavAaHTruIlE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKufmgURtkQtTaYnW6/maaa3GESNw4sS0O8GMFJcJ7ePhL0aVBF
	mtK8Alr1Db0DNoVnV8T8shklArjb+EZCl0Ojho0cfOnAx0YlaH6zISewzUuyH/V7VgE+urRIQGN
	p8e3BbNY3votSJs0RCW4ACIt/PBBnN4Ijn0ZVzWe7AS6KEB4gRAz7HCSDn1jqLdXpEXq7WQ==
X-Gm-Gg: AYBFou3/i8DUYGfF+J5pCCVpZm8uMtp5quTVRGcXREWi19KUzgwFNoRABK1N+sJIPkd
	vsRzlCyhz1ww+++gxDiXZdS4FRDblXxG5n4W3uMRBhj+cG1BUUZeqmRsG7umKhCWdDuCOol2hh9
	gJ9hF4ixNPJ0KTl6VUQGN2v9wM0Z92wOTTxAyVj9qPw5RL/2tQDQyuNcYQ1ToErQ+xzomts8P1p
	FmB3oTyfpDBrB1wBg+IPOUibPEu6AbLshr2cyViDoFJBAhjAWNN6rHw/32xbqtKP8RYYSTS80bY
	hsaIE6A6F8afXsKM/1kugnfBlKXhWaycGVakHSpNHAK6gUYBOLUfFHWD+lggiPHs7KpC4anzRCI
	WLfYUIa50LHEMbiz+LMy70x6EUN1xzLJ+fb2jn67EE+Gq
X-Received: by 2002:a05:600c:4454:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4ac1794032cmr216288105e9.16.1793606826671;
        Mon, 02 Nov 2026 00:07:06 -0800 (PST)
X-Received: by 2002:a05:600c:4454:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4ac1794032cmr216287515e9.16.1793606826151;
        Mon, 02 Nov 2026 00:07:06 -0800 (PST)
Received: from [192.168.0.9] ([47.64.112.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f047bfsm325330095e9.3.2026.11.02.00.07.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 00:07:05 -0800 (PST)
Message-ID: <4cfd205e-1150-452b-97a6-862329c838b5@redhat.com>
Date: Mon, 2 Nov 2026 09:07:04 +0100
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
Subject: Re: [PATCH] selftests: vDSO: Fix header search list for
 vgetrandom-chacha.S
To: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: soc@lists.linux.dev, shuah <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261030174323.370687-1-thuth@redhat.com>
 <256fea10-f0c9-411d-a6b6-a82cad357b57@app.fastmail.com>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <256fea10-f0c9-411d-a6b6-a82cad357b57@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/10/2026 22.36, Arnd Bergmann wrote:
> On Fri, Oct 30, 2026, at 18:43, Thomas Huth wrote:
>> On aarch64, vgetrandom-chacha.S includes the assembler file from
>> arch/arm64/kernel/vdso/vgetrandom-chacha.S, and that includes
>> <asm/assembler.h> which in turn includes lots of system header files.
>> For this, we should make sure that the kernel headers of the
>> *current* kernel are in the search path of the compiler, otherwise
>> we end up including headers from /usr/include of the current distro
>> instead, and this is calling for trouble! Thus use $(KHDR_INCLUDES)
>> here to make sure that we are using the right header files.
>> (This issue has been found in a patch series that replaces __ASSEMBLY__
>> with __ASSEMBLER__ in the various kernel headers and finally stops
>> defining __ASSEMBLY__ in the kernel makefiles - when vgetrandom-chacha.S
>> now tries to include a header from /usr/include the compilation fails
>> since those headers still require __ASSEMBLY__ to fence away the C code)
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   See this link for the build failure:
>>   
>> https://lore.kernel.org/oe-kbuild-all/9e294bfd-4704-42a5-a704-f301f4afe042@app.fastmail.com/
> 
> Tested-by: Arnd Bergmann <arnd@arndb.de> # (build tested)
> 
> If you like, I can add this to the asm-generic tree to avoid the
> regression from your series, or Shuah can pick this up the normal
> way as a bugfix for kselftest.
It's maybe better to stick the patch close to my other patches to avoid that 
other people run into problems when bisecting later, so unless Shuah objects 
I'd prefer if you could pick it up, Arnd!

  Thanks,
   Thomas

