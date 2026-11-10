Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304880;
	b=bRXGHy0M2/L1LjHTJJL+q72qUqHFZLFyVUN5qC4ZxqeK/NMpVdKjZfgYZw5/M2dutHlh
	 IdHdJygxf/Qnz2g/t8xzgzU6XuVZHAo1gGZA5XQ5ILh92CpR2+Ir2/Kg9JzULUUd+ogkf
	 mmMcPyeBBZ0UpnpyizdG1Rm9SbIG4d/HVN4nM/HKjCWBYHaKyUnEKfMWv+Nwc+Kc0p8Bu
	 Ju3KhFicHCwXEDAgT0iQnw4lyBfP3UvVog8T1hx2GXF5Rq5gN3gL+8YilXhqOC/nBdZRT
	 xFdXeoiHx2lxOx6itTse0PXJFKwz85y570tGzp2xaHxDarr+GKVj1L9XRV0a1Ja2oxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=r9Pl8QyXylw3efq/GJcZ2H+q3w0RBKBXrliBi80vKGw=;
	b=w4ND8JLTnXEjd1nEgDKsvKdiT9MgYRbfjMe9YG2jn18ruwUPo/e0QIxg1pStwpW594US
	 fKQW9ZsDqSTriLle04dgTObtGEJQbRIyM5DC4OPeCPibwkxQ3POjXlE659jA0aRAItnUm
	 dUPiE8jqO0D8vWQz2G4F7/LdYiSjfMi5NIGenNslrZ8GvaVLK7d6JuSFB7rP/3B4HLsP3
	 U++7Fq+Ozk9ASAvO76XHiyjau7PZFC5eyi9dvnd5maKIOoBC/+kyX6rhxNf81PrIDjz6h
	 XRTfi34qahZsePUPAHmZ81fk4LXz/lkcuuj7xj69IcrEsxCgJEDm6oVcYlegCVowkEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hihSnyLV;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F6460A3817
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 10:01:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2F6460A3817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hihSnyLV
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e3b22e971so950896f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 02:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794304878; x=1794909678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r9Pl8QyXylw3efq/GJcZ2H+q3w0RBKBXrliBi80vKGw=;
        b=hihSnyLVB9FjyRlDuAovNuIBjgewXp5dc/cQqEO+qUuZyz51f4E5maO2fTlg9fxjmU
         85A5jq6UUjxbgA5fQlRAE+RvwEwIMtIPPpPJG2jTeCKmaod1hgWq2ZrxpkYS4XPP/Lir
         a7EAw5oUQqDLxyjeJo1wkT+/Rvvj7BX5K1r5AXcLPq5VF0uSW4ArS7/TTmGepGQdebkR
         uNE+5OJLM+e8RzTyICAmiZlySlTFU8Banj+xC2TMXlVF2p/FX4ILu8goir89YN+FD6Up
         XrQF78+wReRB6xrljJv1O4/wTHTIIQePnWNiB1bgTc1wgpVHOCVrzJD21lxK2SoWDnTX
         P5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304878; x=1794909678;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r9Pl8QyXylw3efq/GJcZ2H+q3w0RBKBXrliBi80vKGw=;
        b=ITK9dUO35z18MKX96U7TUKkVSsVQLK+3NuExJMAW/S4Ipzpt8QXI+udIGqErwA7VLT
         lJgT6iXP3XT8c4KUzPLp5HxF/2PRZNG5XKumf8+Oebk5SYh8/Ox/GCxR8G3HP9nDlof+
         9Hnc3lShBvVFMgqyKAHxqcZQ503BITrWgr13I1B85bEJlimrnvdo0Z3BKiFDMVTkcteq
         K6BVlmol+divDro2cwPM06UcXLFGZ2KAr2O5SLTpo0SrDecchvZMO8BXzRb5B/QmsMzv
         kjSwTJ5kwzxiXl3pxuC/pz3Xwj9Yopw0mQoW4jV66B6mQllEcI5alRc3VtHvlaoRwsiN
         mGMw==
X-Forwarded-Encrypted: i=1; AL+hErFed++WUvIfPwBUvI9Uv8Y3H+VsuyvE8OqdxV/f1dB52ZIMZyQb+xkW6V7epQtvHAjIpgIydaoqVSz+VPztXe0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PChJnVCqBnPCw22wMTkWtz/9syrO2df4P8XjmnwU2LY3uMZzQ
	yKiPIrobxJ4PQsoLQY+RzPx42QM76qrDA/6L/byZCqkCv2y8iaXKKEKJ
X-Gm-Gg: AYBFou369GXt5lij7fDxAvFXqbXEtjysnaQ16u/v4PJUCfxKS2B3cXZYnyxiVKAMAjh
	gDaSMr4Q/QmWv58EM569c18LA4tM/K578rs4bPciwnt7uvktF2v29PshKIrfPRjxR7G1zISGFu0
	tlKAJ9RUFTJEleGf65CPOgZMWGFdCOuyusHA1Z09CSpdzadREAOQhhCKcuiCz6WK5v89f7fuEDl
	m3zFRuX6DBCRtgVBnmbEUHD46gob6r7GXy8ERCxasGSid2pS7S4CM9uKe18Jm6L5wkUhpBkL0y7
	7eiby/+rFHUFP6Sexe/7SJxXA9YB2B2olWE/BomNAkyiUsqqGGm0bUtLhQ+J8mVjpnG1Qg08l7U
	spZuO6ndMRjlwsRuW9MQVht18dNrR7zb/MlEekEfVGYe8rtfr97F2xc6kpCCFOYgp9g91SYfudr
	JyMy7DVy8gfME0BactQwQ17UWfP0WuqwmZ+xIX3ZEBenloiAW3hJHk0SBBy71mK7ZF4LRReAC07
	02B/O4qTLICXUG/UodPV/c/OELtHPN3so0SSoZkuUN+X1sm77w5kFON+Hr2j8pOH+syzziUC4CX
	3ts6j3secqEixqlyoI6V+bGuF4mhp1LlPglvPw7UJwRlOHUyVkoRtbglVioqyLj/V7NVv3r0jad
	Vv7CR6CxYZTQK
X-Received: by 2002:a05:6000:2003:b0:48d:ecba:3cf8 with SMTP id ffacd0b85a97d-49830b9829emr4172839f8f.43.1794304878022;
        Tue, 10 Nov 2026 02:01:18 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988f5b1ce3sm2567009f8f.14.2026.11.10.02.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:01:17 -0800 (PST)
Date: Tue, 10 Nov 2026 10:01:16 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Matteo Croce <technoboy85@gmail.com>, Brendan Higgins
 <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook
 <kees@kernel.org>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v7] kunit: memcpy: Add benchmark
Message-ID: <20261110100116.5c435722@pumpkin>
In-Reply-To: <20261109193925.8a127f2d0afd5429f1f551f1@linux-foundation.org>
References: <20261110021622.122490-1-technoboy85@gmail.com>
	<20261109193925.8a127f2d0afd5429f1f551f1@linux-foundation.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 9 Nov 2026 19:39:25 -0800
Andrew Morton <akpm@linux-foundation.org> wrote:

> On Tue, 10 Nov 2026 03:16:22 +0100 Matteo Croce <technoboy85@gmail.com> wrote:
> 
> > Add optional benchmarks for memcpy() and memmove(), enabled with
> > CONFIG_MEMCPY_KUNIT_BENCHMARK.  
> 
> hm, sorry, I must ask "why".  Nowadays optimizing memcpy() is a
> super-specialized thing undertaken by the bravest architecture
> specialists who are unlikely to rely upon a generic kunit test for the
> purpose!

You also want a comparison against the 'obvious loops' (which it can
take some effort to generate because the compiler tends to convert them
to memcpy()). Otherwise the numbers are pretty meaningless.

But kernel benchmarks are really the wrong place.
The 'bravest architecture specialists' are going to test the code
in userspace where multiple algorithms can be tested and quickly
tweaked/dismissed.
You also need a bank of systems with different cpu variants and run the
code on all on them - much easier if you only need to copy a program across.

I also (sometimes being one of the 'bravest architecture specialists')
try to work out how many bytes/clock the a copy (or ipcsum) is doing
and what the fixed costs are.
That actually tells you something useful.
(But you always need to check that the compiler generated something like
the expected copy - otherwise it is pretty pointless.)

David
