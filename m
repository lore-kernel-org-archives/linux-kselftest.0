Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491633;
	b=LMfADAyVwrP+ru/mChH1aZ8NvL08GoK5VS82ewG6hWs6Ai7DO/IT+HFjWh+jfb5H7Wrb
	 BSqOgZVLfb9ucVTTGK6+42XAr60frP22Z+CW+qZcxrTYhZn3YGTarWFER7HBZbQop5KMF
	 VSsyExpjGC93zYY8bXFmdN8FJDtNZpRmi+LuKMzlI97Bi3aHKPQ4tDrurS9OhFXB2pqdr
	 YNY2UH9mV+H2bUE1t3XmzFX86WQkio7F/Ke3RWZ/Dp+3CuO+H04qV/xX2pbu3cmA5+paX
	 VGcWXAxKq0WdRYr8CZQQ2zf0CpZUXZByx+zU9yiGDjcwVuPIlER+UOzem3ZAd32NJrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491633;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=nLyz9JhGDWxy9NbjsVWTRULOrIKXHGlt/Z6IB5TxlIQ=;
	b=VzHbSacSW6NNYDqd306p6A3481/6sSOrAlF3kCiY6Y+5NMXu7GKifyagUfTYDKm8jnlh
	 t994M0TWWW/2cBeKlAG8MhMAQIHNDNqbFX1GE5J1PhvmqjJgo0/izg9qwGFz3QSXfTGSP
	 OFsuPCtkB0hJUCIfvXTdwSiPdJwTpJu0KMWby3QMpFMpvLYFfRfHzW5gYkRcfW63Kffln
	 OFAEhvOQEkbZdLFx5tbs8Nw9evbdWqOXUIe/Ec7abUHZ2C7odFUf65eGV2rbQAmppBs7w
	 knFuQVlUbXYZsL23IKyzH9pJvaR0JJ1f8ZlHT4b0c604sGC3eBiNFruREZ64syis3oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ARO/ajo2";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED48606A31E;
	Tue, 20 Oct 2026 10:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ARO/ajo2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BEC51F000C4;
	Tue, 20 Oct 2026 10:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792491632;
	bh=nLyz9JhGDWxy9NbjsVWTRULOrIKXHGlt/Z6IB5TxlIQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ARO/ajo2zgnbhFh5hCsGaz2xlsiTq5MKQA6QPpY92hDVzgorsIZh6oB+ih4SUR7Sz
	 tIwJgdtYXc3kdAtc8zIZB1sQAhih9AFMDP5WLOrHIyxgNB/ReCHVUJyJqFnTHEjBqd
	 84SBrjEEA3ccXcwJHCAHI0pCb64e09QbkB+WwlUSIAJSRYofca91MsD2O5S/01RU8s
	 Kb2wYkAbksfdst2H+OBT2H1jGVQ5oyRchc/cWEuy3ecycbLOpz6QFvwMcn0KG8joWJ
	 0iBmrCBKxSd91sy0cvV/QL47OD2pi12m2LMfPXiVyiX3Kx6I6KP2r2/i6sSNyHy01m
	 jKAi1djIrLRrA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: tarunsahu@google.com,  linux-kselftest@vger.kernel.org,
  rppt@kernel.org,  shuah@kernel.org,  akpm@linux-foundation.org,
  linux-mm@kvack.org,  vipinsh@google.com,  linux-kernel@vger.kernel.org,
  dmatlack@google.com,  kexec@lists.infradead.org,  pratyush@kernel.org,
  graf@amazon.com
Subject: Re: [PATCH v1 3/7] liveupdate: Pass user argument to file preserve
 and retrieve
In-Reply-To: <CA+CK2bD83qVv54_Wps4GRr9otg32pW2A01WVTo-gTR=oYs95Vw@mail.gmail.com>
	(Pasha Tatashin's message of "Mon, 19 Oct 2026 15:31:50 -0400")
References: <20261015093816.2438942-1-pasha.tatashin@soleen.com>
	<20261015093816.2438942-4-pasha.tatashin@soleen.com>
	<9huzwlrdh4q4.fsf@tarunix.c.googlers.com>
	<CA+CK2bD83qVv54_Wps4GRr9otg32pW2A01WVTo-gTR=oYs95Vw@mail.gmail.com>
Date: Tue, 20 Oct 2026 12:20:28 +0200
Message-ID: <2vxzfqy0hdw3.fsf@kernel.org>
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19 2026, Pasha Tatashin wrote:

> On Mon, Oct 19, 2026 at 3:26=E2=80=AFPM <tarunsahu@google.com> wrote:
>>
>>
>> As Per Today's Hypervisor liveupdate meeting, This patch will be picked
>> by @dmatlack@google.com for latest tmpfs preservation series.
>>
>> I have a suggestion to make here.
>>
>> Let's send this patch as a saperate patch so that I can also use this in
>> my guest_memfd preservation work. This will help landing this feature
>> sooner and unblock other subsystem who needs it.
>>
>> Let me know what you think?
>
> Hi Tarun,
>
> You can include this patch the next time you send your guest_memfd
> patches. Whichever series lands first will pull in this change.
>
> We are trying not to merge new features without an actual user,
> especially ones as important as those changing the uapi. I think tmpfs
> preservation may actually make it easier to land, as it only changes
> the code that we maintain.

+1, let's use tmpfs preservation to land this change. It is a simple and
relatively small change compared to guest_memfd preservation.

[...]

--=20
Regards,
Pratyush Yadav
