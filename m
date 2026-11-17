Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912076;
	b=ivhGG+3rKWsGtXB73dbhS5p7gOpQ5U88lbdoxP8iDeHksFkTpu9Wejen/FeRAtD6t/UD
	 nPu2xUSkcmNNMiWkkeT7NDruCe7KA9cT7to+rneExdvZcOtu4yIsEtoCQzaGA4dxpPKhz
	 0xolzDGfWGPU0ZEn3CVMTzKKgRKzmlFSCM5cTwQmI/kdUW3FMZgFsCsgGTQajj/FC37ya
	 f/b6USzJ5xK+HteGduywErK7ULkOR3gga3v+tpBX0IYluHqAjrVmKq31BM08waxu03+tJ
	 fgiBl3wwJZOqdK0gjLC4onf4VHFmdDl3vaApcpukBnDepO4XHcKefXI7S4yre9kv61w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912076;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=imUJWBchit9SuVHDzuMNjlSPoobNZbAUtuLMrGVWVHg=;
	b=gejWY9vtjt3zPCZGOB6oFJuj91t0fTBwxw4FPs9LUZ6YRhkisctg47rBsm2GkChqgcrm
	 7ZbAd9+0JA1g2H2F2VkWICvxZEkjZbALsuKP0PGbrJSMZGhP+a9ZY4a2ktcfubOFIjuy5
	 UfKFKBqmPgGE5hexf/3Ub1MQv5ljTuybJTQWCyNuhwgzwxCdidtCMTgJZE7cUFjKyBs3k
	 ftRklq20/+ERA5VcT43wClijgMs8hO2axfHouqYyGzxz8l7mNwcO8l+HKWfTmU2HtCSrE
	 98vQawHlCMJQ2khBZMCrRnhCGiJ0EBaOZqPt+I4wGTz6SM6Wi3gMCM16QCFfUZaJAxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CVNFSdox;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B23606A31C;
	Tue, 17 Nov 2026 10:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CVNFSdox
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A95B1F000C4;
	Tue, 17 Nov 2026 10:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794912076;
	bh=imUJWBchit9SuVHDzuMNjlSPoobNZbAUtuLMrGVWVHg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=CVNFSdoxu4l/nj9Mm2t0iUMPrhaOa4wgFFHGazUP4pNZG3iVJogqLdJRtgEQF9czH
	 m4snTDqFKQ3MkIbWzh75EhHd7RnhaUXlGRkmsSWK112fFsCxKPzMuuvptHfqjccnnH
	 tnzU+NfrXZvW1AvcjOKxICz+exYDTNTQ142SIYK3sfM2NPToO2s8hPj3GUpd5AOGUF
	 1NUYkeSmlrz4EDqLtJXzjVXoH52BxzV3TDyAvmeSzGON/Bgtc+8wbu8p94EZ8BP/l+
	 IwkQq2f0NbmR4zpxS7teFcFqKIhRYFA5/ELcuVo73JX7yC2H+qT7BbYZYlTwqY4T54
	 WQXZrrz9MeoBw==
From: Pratyush Yadav <pratyush@kernel.org>
To: "Pasha Tatashin" <pasha.tatashin@soleen.com>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Mike Rapoport"
 <rppt@kernel.org>,  "Alexander Graf" <graf@amazon.com>,  "Jonathan Corbet"
 <corbet@lwn.net>,  "Shuah Khan" <skhan@linuxfoundation.org>,  "Randy
 Dunlap" <rdunlap@infradead.org>,  "Andrew Morton"
 <akpm@linux-foundation.org>,  "Tarun Sahu" <tarunsahu@google.com>,  "David
 Matlack" <dmatlack@google.com>,  "Samiullah Khawaja"
 <skhawaja@google.com>,  <kexec@lists.infradead.org>,
  <linux-mm@kvack.org>,  <linux-doc@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-kselftest@vger.kernel.org>
Subject: Re: [RFC PATCH 2/5] kho: build KHO objects into a single kho.o
In-Reply-To: <DMWWRQTLNYH6.1LJ2K5HT60LK8@soleen.com> (Pasha Tatashin's message
	of "Mon, 16 Nov 2026 15:13:23 -0500")
References: <20261116134013.1636689-1-pratyush@kernel.org>
	<20261116134013.1636689-3-pratyush@kernel.org>
	<DMWWRQTLNYH6.1LJ2K5HT60LK8@soleen.com>
Date: Tue, 17 Nov 2026 11:41:11 +0100
Message-ID: <2vxz5wxvhha0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Nov 16 2026, Pasha Tatashin wrote:

> On Mon Nov 16, 2026 at 8:40 AM EST, Pratyush Yadav wrote:
>> From: "Pratyush Yadav (Google)" <pratyush@kernel.org>
>>
>> kho_block.o is part of the KHO infrastructure, but is currently built as
>> part of luo.o, which ties it to CONFIG_LIVEUPDATE.
>>
>> Group all KHO objects into a composite kho.o, built for
>> CONFIG_KEXEC_HANDOVER, the same way the LUO objects are grouped into
>> luo.o. This also gives a single place to add new KHO objects.
>>
>> Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
>> ---
>>  kernel/liveupdate/Makefile | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/kernel/liveupdate/Makefile b/kernel/liveupdate/Makefile
>> index d9f4694625567..bc679905ce3f2 100644
>> --- a/kernel/liveupdate/Makefile
>> +++ b/kernel/liveupdate/Makefile
>> @@ -1,13 +1,17 @@
>>  # SPDX-License-Identifier: GPL-2.0
>>  
>> +kho-y :=								\
>> +		kexec_handover.o				\
>> +		kho_block.o
>> +
>> +kho-$(CONFIG_KEXEC_HANDOVER_DEBUGFS) += kexec_handover_debugfs.o
>> +
>> +obj-$(CONFIG_KEXEC_HANDOVER)		+= kho.o
>> +
>>  luo-y :=								\
>> -		kho_block.o						\
>>  		luo_core.o						\
>>  		luo_file.o						\
>>  		luo_flb.o						\
>>  		luo_session.o
>>  
>> -obj-$(CONFIG_KEXEC_HANDOVER)		+= kexec_handover.o
>> -obj-$(CONFIG_KEXEC_HANDOVER_DEBUGFS)	+= kexec_handover_debugfs.o
>> -
>>  obj-$(CONFIG_LIVEUPDATE)		+= luo.o
>
> Please send it as a separate patch. I have the same change included as 
> part of the kho-ro series, but let's fix it outside of both series 
> instead as a standalone fix. Also, maybe rename kexec_handover_debugfs.c 
> to kho_debugfs.c and kexec_handover.c to kho_core.c for consistency, now 
> that they are not shared with the rest of the kexec_* files in kernel/*?

Sure, makes sense. I have a few other misc cleanups in mind like
re-organizing some of the KHO headers. I can do that all in a single
"misc cleanups" series.

-- 
Regards,
Pratyush Yadav
