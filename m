Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974295;
	b=qy2vLVYt2KkWoLb50Gb6ExYPvIklK6mDbjgFi/Zlz9aAlr9bUXtoGLz6tPyavJzH2WAw
	 icyi+9y1CvbaZTm4GOV0bRpSw3Z7LlYwL7X/JYWzYJxwEi3HZ5pGUCbiJFF45iIQiK+Fk
	 BtpplV+w73iFlTu5s3yxatE29ccL+OC5JsL8fCUaLFG2o/cgVkFHHgyLTyat2/ZV/GeKQ
	 LlW6yrI4JgyIA+Xjl8XCSCAaQlyisoJtc3St9UF8r0Bq83CnG+Eo6rFBQ8vUPAm5yRfiy
	 2XZBz2ItUlmsWUgpmPoxIW+VIzfEwspBzK88zIj/YwUdTCOE13mJZaoi6HLoZreAnCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974295;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=BLPH8onp6C7AoW4lZMqXDExv0D9uGk4L9LfjO8m+oHo=;
	b=F9eb6Ftw5C5DwPnXpWCmqZuEvgAB/JXvOvH9BkaZmozsSmXQUeKink/ZB4YfBDP8pbzi
	 Vpcl5dCVsy+BzPPIyryXt32BAf/F6owhLKleTe2SdGWhW0tO573R2i3vahZmeRTdIYdmd
	 lF3enq2BJIg4cpgeXW4WmfU8G/fmEeYCxnzL3cRH7cX4MWwEL3Qc9dHX9zq8u30eKnP2r
	 Yw9wIpxYZHeas7aZWZWA4bWGYts037Eku/0CYjTY83JvX9H7DRT105kyT7FWMX0Srs1EB
	 OaFL7WUrLAB+5zfAq8YPLd77HZWJE1ya2iUH1JnE6HRxBy9aUjZVjRkFLsf93Mdi/xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g2ewZjrC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D96606A332;
	Fri,  6 Nov 2026 14:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g2ewZjrC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C2F1F008A3;
	Fri,  6 Nov 2026 14:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974294;
	bh=BLPH8onp6C7AoW4lZMqXDExv0D9uGk4L9LfjO8m+oHo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=g2ewZjrCHw3WTRPfHVHQxqbS1wA2g3wTh8480oj0lnvKZf5Py0zb7HkGFUGjZ6QSA
	 RBZ/BrP5GFgfXjKQaVwBIgtyh70yIGqFmj4eNHDJaFS+UrScNolIuIm1Irq/glNT9u
	 RMDoXxZQVVC2FARzVwO+iCwWeWc9ptgaHE6/yBn88hSeN9ODaTw6HiftZ+zI5VCmSw
	 G4llq4/bkghvyG2s/hIh6+lM2R0qBGt3H1Mi+CnIcMHeiJUSx23GA0JPC0gbGv+KTT
	 KZ8ZhjL0UGyyvHaMcFPS0aaWi+hoWsnP7ATmE7NywBYeukjSNn2NrqVIxtLA9oW0aY
	 RDRxL2XiQij7A==
From: Pratyush Yadav <pratyush@kernel.org>
To: David Matlack <dmatlack@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  kexec@lists.infradead.org,
  linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org,  linux-mm@kvack.org,  Alexander Graf
 <graf@amazon.com>,  Andrew Morton <akpm@linux-foundation.org>,  Baolin
 Wang <baolin.wang@linux.alibaba.com>,  Christian Brauner
 <brauner@kernel.org>,  David Hildenbrand <david@kernel.org>,  Hugh Dickins
 <hughd@google.com>,  Jonathan Corbet <corbet@lwn.net>,  "Liam R. Howlett"
 <liam@infradead.org>,  Lorenzo Stoakes <ljs@kernel.org>,  Michal Hocko
 <mhocko@suse.com>,  Mike Rapoport <rppt@kernel.org>,  Randy Dunlap
 <rdunlap@infradead.org>,  Samiullah Khawaja <skhawaja@google.com>,  Shuah
 Khan <skhan@linuxfoundation.org>,  Suren Baghdasaryan <surenb@google.com>,
  Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 09/10] mm/shmem_luo: Allow retrieving tmpfs files
 with O_RDONLY
In-Reply-To: <auuzKNZsPD10XM4q@google.com> (David Matlack's message of "Wed, 4
	Nov 2026 22:35:20 +0000")
References: <20261103010216.3447716-1-dmatlack@google.com>
	<20261103010216.3447716-10-dmatlack@google.com>
	<2vxz5wyck08d.fsf@kernel.org> <auuJ4msatqzoOrjN@google.com>
	<auuzKNZsPD10XM4q@google.com>
Date: Fri, 06 Nov 2026 15:11:29 +0100
Message-ID: <2vxzse1ehwxa.fsf@kernel.org>
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

On Wed, Nov 04 2026, David Matlack wrote:

> On 2026-11-04 02:45 PM, Pasha Tatashin wrote:
>> On 11-04 17:52, Pratyush Yadav wrote:
>> > On Tue, Nov 03 2026, David Matlack wrote:
>> > [...]
>> > 
>> > Can't you put all your binaries in a separate session, retrieve it as
>> > the very first thing, and then finish the session? Then you can execute
>> > those and retrieve all the other sessions.
>> 
>> This is a good workaround. I am not opposed to this patch for 
>> completeness of functionality, but if we decide to keep it, perhaps it 
>> should simply be squashed into an earlier patch. The current diffstat
>> looks bad, as it mostly deletes code that was introduced earlier in this 
>> series.
>> 
>> In any case, given Pratyush's suggestion, we could also drop it.
>> 
>> > 
>> > Why do we need to support this in the kernel?
>
> That would work for binaries, and I agree that use case alone doesn't
> justify this. But I see O_RDONLY as part of the retrieve interface, not
> a feature for one use case. The retrieve argument is modeled on
> openat(), and openat() lets you open an existing file read-only.
>
> open(O_TMPFILE) only requires write access because it creates an empty
> file, and an empty read-only file is useless. A retrieved file isn't
> empty, it has the preserved contents, so O_RDONLY makes as much sense as
> it does for any other existing file. Without it, every retrieved file is
> writable, even when userspace only needs to read it.
>
> Preserve already works the same way: a file can be preserved through a
> read-only fd, as long as the caller has permission to write to it.
>
> If we keep it, I'll squash it into patch 7 in v4, so retrieve supports
> O_RDONLY from the start. The commit message will lead with the openat()
> reasoning and keep binaries as just an example.

I'm guessing this all goes away after you do Christian's suggestion? I
don't think we should be retrieving anything into a file that userspace
has opened O_RDONLY. Retrieval is in effect a write operation. So
userspace _has_ to retrieve a file and reopen it O_RDONLY after
finishing the session.

-- 
Regards,
Pratyush Yadav
