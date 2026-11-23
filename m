Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449729;
	b=EVZXUIjpnD5g+rDhMHz+3ELqFFybpu9GK/Ro6mQ5L8oxL/jbUbYEsYnQ5KU06L3uU24d
	 oTr1axfTPxEXSESwjPYMsZr9CKe67VTYZswaC2Zl9LUxoIMgZEUcxljsvqeD5t7sV8eaF
	 cxZhziDFCYIQrMpQodqEwzX2jYOKJKLnJwrbOVe38gTi06gl2pWYza7xo+uOp4YW4zsSt
	 qHed/Rm0iiwROwiaOFhvPD6hTVXV4uGqoleNZd633c+Yoq6k4s8L9FQDPVMCxKDnwfDMf
	 ctBFVVDVqkmcXeqsm7htc3I9Ss+DoppDIvSryP9eZkD03GRrKDSHdw+2QlgOyCjkk/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449729;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=WKGG8yQhQluo1jeMgy5Pk2aPts9Q3V6ZRR7HGYPBxOI=;
	b=qcAfVFzmnBkRFD0pihwKwk2qq6AwkeZyQ8qWbzJBlQAXwLqMFBeyMg+4WLd2bOIgRO+6
	 Tb4pluri3JXm+dUP27gFfqRrj3dnK1FzEjdhzda3jfmOfi9jiHE0p29I583XJTdb8vzr0
	 0WFfd0kQ3dfSREecwt5T5P6Vvsdp1r8TUHTq229iJAOequVNG8K8ehUBCSoGc9D/gHWyi
	 RWpVYxP0V0TzzAt+A0L0/OwK0tr5II3vE1FBBhxf5f/UANGAFye0bVKMVzariMLrCF3ZU
	 IVEZELEFiswJc9lql22dH4fJ+gQftTQv8uEkYikpLs4/kuGqWlZD8Ox2eqs/tsjUz0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=rph2yaNB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D368606A331
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 16:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=rph2yaNB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAED11F000EC;
	Mon, 23 Nov 2026 16:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1795449729;
	bh=WKGG8yQhQluo1jeMgy5Pk2aPts9Q3V6ZRR7HGYPBxOI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=rph2yaNBXwJZOPhwxVMX/y08tuzLhPa5ch2uDrK7AJv6bHG1kzodt90Vkh6UeFKA7
	 aDABcvWiZ9xOhXE9RCvUFpSkj1oVc0yf6PncX3YXBEK3Mcn8mkMYciWBipsRgplNeP
	 uRyk2prYaNa6KQdYVE073xUFv8Qc3V+RKoLGqK9Y=
Date: Mon, 23 Nov 2026 08:02:08 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Kurt Lin <lylin1023@gmail.com>
Cc: Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi
 <nao.horiguchi@gmail.com>, David Hildenbrand <david@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko
 <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, Muhammad Usama Anjum
 <usama.anjum@arm.com>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: skip hard dirty page-cache test on FUSE
Message-Id: <20261123080208.b84bce7a706a0351aee6aead@linux-foundation.org>
In-Reply-To: <20261123150459.2211177-1-lylin1023@gmail.com>
References: <25ecd9ad-7c5c-16ff-5197-5703622a88b1@huawei.com>
	<20261123150459.2211177-1-lylin1023@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Nov 2026 23:04:59 +0800 Kurt Lin <lylin1023@gmail.com> wrote:

> On Mon, Nov 23, 2026 at 11:06:45AM +0800, Miaohe Lin wrote:
> > Would it be better to add a helper? I doubt there might be more
> > unsupported filesystem.
> 
> Thanks for the ack. There are more (CIFS and orangefs also report the
> error on close()), but Andrew has since replaced this patch in mm-new
> with e747ed2c3418 ("selftests/mm: check that fsync() reports
> hard-poisoned dirty page-cache"), which needs no per-filesystem list.
> My patch can be dropped.
> 
> I tested mm-new 87cdbd9bd631, which has e747ed2c3418 and 44191f78d131,
> in a virtme-ng guest. memory-failure now passes from virtiofs, where it
> failed before, still passes on ext4, and 50 runs in a row on each were
> clean. I did not hit the unpoison -EBUSY on virtiofs even without the
> ftruncate(), so that part is not covered here.
> 
> Tested with the help of an AI coding assistant. For both e747ed2c3418
> and 44191f78d131:
> 
> Tested-by: Kurt Lin <lylin1023@gmail.com>

Cool, thanks.  Yes, that's a work in progress, I'm drafting an email
but not quite there yet.  I think I have 71 filesystems working but a
few (cephs, orangefs, afs, hpfs, omfs) are fighting back.  
