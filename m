Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A756C3F0761
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 19:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776884938; cv=none; b=RF9KJJN5alrInOU6u/QzZNWRUJEmPO6SGp+9eyZOlQYfZciivRaFRT/i5At387ZsJPQSUUIc9ua6emBkkkts+jFrji+b3ugHDRrkBp3812mVeSDoXI3pUptDrl6RfTfjkZ4mVnNahJQ4LOc361+F/qIFbkVor56G/v0aWpZ/rVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776884938; c=relaxed/simple;
	bh=Ka3j9GtWrjfOgNs6t/EAhaSOHFfzjiy9buCvdrLXvTY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LiiWD6Y6dHxH5OcsTKDYuC4ZAU3nPqj4TWfmSYa87nrL3zgXN83NFhoCKHCmFPrCGpo2ujZei7Vv4TRqJm6I7hSYv79BM/7zGKwvtAAl2jj81KTTWF/lz+jQfMOyD0G299/2MrERYgLX0jgra1fiJhdiif6l9IBoSajqmyXaG2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--pratmal.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mgOsZBOh; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--pratmal.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mgOsZBOh"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2e60238adb1so10502031eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 12:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776884929; x=1777489729; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cVMtEztbiTd0hbm+E9Z2wpGXbkqaSZ9UDyzAJLuzfu8=;
        b=mgOsZBOhsWEoW1lgwDuzyRSH22vSDYd5eBL93mQe1LyZYY6hFotsPK3X+F/csd76Ih
         7KoiV+1QzjAtTj9brDLuWCnmW+4OkNxMNZBvTe7jR4JW9IxtdHLQJYX1vpW8fKT4uOE8
         bysTXRJiJCmggqhdA9k0ifrQIGAKRN056M042AnhULiWiKzjj67jqkW4i7oVoVBxicOV
         ln23NviULvIVvnvnoEaBhl6lAoeysHcQTZom+MBR33W5U4qJ+qa74nerBLGlGfV3YLde
         ox4aSJ8MckwXhYDFUf8drQHirew6mjJcTgFlSnV/QomN9az437SxiMAX70/ofVc/bA4S
         LkWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776884929; x=1777489729;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cVMtEztbiTd0hbm+E9Z2wpGXbkqaSZ9UDyzAJLuzfu8=;
        b=k/X9Qs8DqZrp9oN8W8QyvMCKIujPlGgOeM93elxifHKnF14b+8kIrMNUQvAHbgDu9R
         +qZ9knBH4dp1lj/5mjDZBoG6/Gym4SpR/ifaqg3EONgpFejKTzHLFbsC/NbO0UY0k1iR
         n3sW/wwGq9s80yWe+Ty4OGhSTziVvg6M5pH0uAU9Kwpj976ku32ygnDSZgRVFfEZaH4o
         DQLybu5FMKdiQmZ+pWc2ui488SpL5QmTGMVbDAbynimRju08Y4dNLwDSzY0VdsBTfhpr
         XaH0iiHr6MrfiCZ7kyt/Wh+MdlUWsmoZQVIkYReRG8G5je934oWBBMiVylGZ3kToc6ZI
         xW/g==
X-Forwarded-Encrypted: i=1; AFNElJ/yVEm38qIKmT/AkTQHzxZ1FIh2Mso0sc7SdHM3N2IjJcGawya14yVi7iNg33VFNxqmpi1OHczmWAfwVqeYkhk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy7y3O602+C7r4aCudHPF29JjwAJ4y+6+BCFxVVVM5usztBb+D
	uKivIXO6COP7Iv9oeXaOexK9z99dqujgiF5mruiglzKm9H3XUG7tD0ASt8EDtmE8e+zx3n0HV8U
	6q0tZZJWQGw==
X-Received: from dyhd3.prod.google.com ([2002:a05:7300:8283:b0:2e2:b79e:ed06])
 (user=pratmal job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:2b04:b0:2be:6f30:f2f9
 with SMTP id 5a478bee46e88-2e479215120mr13595652eec.26.1776884928695; Wed, 22
 Apr 2026 12:08:48 -0700 (PDT)
Date: Wed, 22 Apr 2026 19:08:47 +0000
In-Reply-To: <03a23a7a-58fe-42f4-a294-9d688ce33e2d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <03a23a7a-58fe-42f4-a294-9d688ce33e2d@kernel.org>
X-Mailer: git-send-email 2.54.0.rc2.533.g4f5dca5207-goog
Message-ID: <20260422190847.216343-1-pratmal@google.com>
Subject: Re: [RFC PATCH] selftests/mm: use pattern matching in .gitignore
From: pratmal@google.com
To: david@kernel.org
Cc: akpm@linux-foundation.org, shuah@kernel.org, yosryahmed@google.com, 
	ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

(Resending to correct David's email address. Apologies for the noise!)

On 4/22/26 18:04, David Hildenbrand (Arm) wrote:
> On 4/21/26 20:30, pratmal@google.com wrote:
>> From: Pratyush Mallick <pratmal@google.com>
>> 
>> The current .gitignore hardcodes each generated test binary by name,
>> requiring updates every time a new test is added.
>> 
>> Switch to the patten-matching approach similar to KVM:selftests.
>> Ignore everything by default and then allow source extensions (.c, .h, .sh)
>> and tracked non-source files.
> That looks pretty nice. Any reason for the RFC? (iow, are you unsure about some
> side-effects?)

Exactly that. I verified that the build works fine, however I sent it 
as an RFC just to be cautious. I wanted to get some feedback in case this 
might introduce some unwanted behavior that I'm not aware of. :)

Thanks,
Pratyush
