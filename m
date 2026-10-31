Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450652;
	b=JZzHM3O6h7SLFHp3cCXJ6XPKYHkY1z8F+PEDH/F7sA3WbUCDTOj3pzBIk3M78fbOh9yA
	 3AolxatCqsCe1TPY3eqZRY7F4CY6Kl+kqhhcfo5DcOPBEjwg9pK8SMNoy+IwybxocwVIt
	 VkvmVK2ocAj4NZ0Sq+6uCuzTFSTiZGw+td5L2s9C3PupuVX/ClJ9h09croFv2sg7dWLhG
	 GLkvzCcIz1hEXz1JK8SNmmrQnO6gMvvyw5filv/z730d5z5DFolZaE9OorUOer0mDeue7
	 A+n1d/ugEQpjia2YxgKQyrjCDqp4M1iHi2N2hLofnh7Sx1oyxLQB9tWLCUWN2teDmvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qM0g5QCvuJGUtjqSB25y9Tm1UtAHR4vqLa/CLEokVL4=;
	b=F3Dq0NljuHXGwwzZZkd3oAuzjhEcl/kc9Mvs+RTrD2RNww9rDSUI7ADmC2rvYYLLljhD
	 Zr/6mnvISKsRwyI4K4Plu000Atp03n0b8ENW8m96ZN9kIJNjLgSg2NONUfr02ClZdISw1
	 vS4CgSIcWdB7wLO8qHaGaBjanYHXH1OLokyM5BFwot+UTXB2NfEbCwnCPBWuurkU2dPjS
	 EYOD3gvLlyurREwbtXpcFs+B2WvEh4ArXj3w3nZ6LayllFxGOfa1/4mbLznHurYa+q/NC
	 +zA3MjhWZtX4qhqK2eDxNSXHL9CcBBxn/AFhYFEiaQuc2cYjGayDWMSAMjc2WuOINrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h5nbvypM;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEF3606A31A
	for <linux-kselftest@vger.kernel.org>; Sat, 31 Oct 2026 12:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABEF3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h5nbvypM
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso16460045e9.3
        for <linux-kselftest@vger.kernel.org>; Sat, 31 Oct 2026 05:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450650; x=1794055450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qM0g5QCvuJGUtjqSB25y9Tm1UtAHR4vqLa/CLEokVL4=;
        b=h5nbvypM+dxrbPhNFr1VY1VFje1G8a9lHnV2FF0TwZKM8Fg1+yP9mc+nV0FicvDPHW
         r7D2/WAt7eeH0bbk/OwSaRLBt9y42C4YyzUEMStwwg3EQmIRVuYtcQi7iSEXTBnQAHBD
         xxDRESwtmZ/vk7J2HDxuK0Wd3+70bUH7A+MFUGo6q+y9RuWtZ78XoRVsJRpFIeZa4x3G
         29xkGAKo+LdHSoVXTmfT4EY5DbznX1z5ZAAy2hpybtm5x7sreN0Rwl7cTPkUJYhAeZ0Q
         Tfcg5E17s3xGDp0CnMTxZPvpzKjnp3qzE3D5Rp6lILNemK1woweKiGY6X1YpJhHnpr/q
         Bhag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450650; x=1794055450;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qM0g5QCvuJGUtjqSB25y9Tm1UtAHR4vqLa/CLEokVL4=;
        b=fR8o2dmVJNZqKoShGstqvP7gyAqsLy+HsvoqPglKEMr9ovS1MAS1wzQ9P1anjmlaY9
         BW4Z6keQICJPurHEea/ch2ruaY57JOu9b6DRyneY9SCePpeU5QuEViQE61bSwPxfkN65
         8bGR+YCh45Jp7Rgtf/x9bGXHAwbKD7bvAQiYzWKPZ/TRtENZN0UZkBViE5lZvEbNe0g+
         wI3usqOHHL+FZ0tlEhnNbV4BBLrtcVkYpNcwmZrJClRXplSvceEwGQdeJTo3Ch5b51xZ
         VdcZ4n2I/R+e1k27fJbRo1wqKtp1ReR2FGKODA5rbc27SPzBDF8GNmHbY1oAyHVR1+7X
         Dvqw==
X-Forwarded-Encrypted: i=1; AKwUvBxoQahg5PpilY+PXpHYfWlh45qn0hcBwITs/r1LUPkndQyBiHFFkS1NrkSgZllPZKsZZK157G4V0wuGnDyY/kE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI15DBOMaIeMz9jBB/ZENF8frEAY9KckSc+8Szcc9gwwdiYKyeP
	MvSCU3kH85XnXNf2bW4l4c8v1iwnlZNnp/HHfcuF8FP+ZnqDwk2czSi0
X-Gm-Gg: AYBFou3uCT0FGSglgQ816OXKqtGhmQugy9bWNSQ60ZPZQN0FU/nXZ0v+I7phkC2QFkb
	Bo9QDYDRcVf4eKDV7AQPvJ0t1BPs9WozcAqDMaMc5faKSfHOm1Lq9+a19WlfHRKBnBEe/3fnm7V
	0Ml7oI48Q7pUOnK/49F9zPjhGPqWwnBKvIRmBf+BDaXGW25NB9esGniRLSgxwh2YXHI1CFmeUPx
	PPy88TugL6Tzn+DKOnA3mHKBqDtwKy6lDKDLAN68WqFxIWbdRDDM01PCs+xaKvV8UVE52wguk35
	QRz0fKlapJkT6u1kuYKLr4Wstr6OZwoHDd+BHrsrYxzNCV03hEbRNlKYhmAuXQrl6KE7xMvLsFL
	S9dmht7olJW6ZHlMrNODczkAmJJz0hJT1yWZSycHpT/R7Fd2u1r9mCvrXIA0ReZJz88T6pPfvhz
	XWg/mAdj4dbljkfVoUkkpBweBRYeswhgsEYh6kwmbAl8Asw5hRkF3hJcL4EhWiGs+50PVjveG9T
	8ctepGn8XudRiyFq4H7NJtLx8PMZA5FIxNknWTF//Gnuz7fRywdVweb0nJjDJDs6zbSa9vOKI07
	K9pqodYVwqp/BszQqRl1TcYk
X-Received: by 2002:a05:600c:8b0a:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4ac185bc4a1mr118043085e9.27.1793450649910;
        Sat, 31 Oct 2026 05:44:09 -0700 (PDT)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6c76507sm134704015e9.10.2026.10.31.05.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 05:44:09 -0700 (PDT)
Message-ID: <bb5eee33-fbdf-4382-83fb-4a8db33ce358@gmail.com>
Date: Sat, 31 Oct 2026 13:44:08 +0100
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
Subject: Re: [PATCH 2/2] selftests/mm: add a uffd test for re-registering
 during UFFDIO_COPY
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>
References: <20261029221129.89068-1-azpijr@gmail.com>
 <20261029221129.89068-3-azpijr@gmail.com> <auW2RZNy4jgR-ZNU@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <auW2RZNy4jgR-ZNU@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/31/26 10:35 AM, Mike Rapoport wrote:
> On Thu, Oct 29, 2026 at 11:11:02PM +0100, Jose A. Perez de Azpillaga wrote:
>> Re-register the destination without WP while a UFFDIO_COPY_MODE_WP copy
>> waits for its source page, then check that the copy fails with -EINVAL
>> and leaves no uffd-wp bit behind. This covers both the hugetlb and the
>> non-hugetlb UFFDIO_COPY retry.
> 
> maybe "all memory types"?

yep, that reads better.

> 
>> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
>> ---
>>  tools/testing/selftests/mm/uffd-unit-tests.c | 105 +++++++++++++++++++
>>  1 file changed, 105 insertions(+)
>>
>> diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
>> index 2a97ba1d6feb..8a7efaa7b3ac 100644
>> --- a/tools/testing/selftests/mm/uffd-unit-tests.c
>> +++ b/tools/testing/selftests/mm/uffd-unit-tests.c
>> @@ -375,6 +375,104 @@ static void uffd_wp_unpopulated_test(uffd_global_test_opts_t *gopts, uffd_test_a
>>  	uffd_test_pass();
>>  }
>>  
>> +struct wp_copy_args {
>> +	uffd_global_test_opts_t *gopts;
>> +	char *src;
>> +	__s64 copy;
> 
> maybe result?

sure, will rename it in v2.

-- 
cheers,
jose a. p-a
