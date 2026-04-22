Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C058345CBF
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 19:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776884534; cv=none; b=mQzdyVE/SQAl8CqQYSDZfazchjieeJb6hENspkrxcfYuKMFSQJfLeMIgqwm0YfywKywNhB6TwtymIP9401hUEBNK6PhJl85e8OqrwD9/JgzIjy6u/RWsRxuHNknXhQd8sh/j8/dQAR0BZ+hjVq5bvvBVCha3LDVZ/SVCRk2S0Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776884534; c=relaxed/simple;
	bh=oX2UgTQyC0xY1S+nIJWmxZcQKiEwEiyjaK+gomi7Dlc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TCJ13DEWE3Lg4flAciD71u8jANAiqrG28tAS+ta6M8g9v3lXziXTGlvx8mBp8jzFjW0bIqfBM3mqhuooQaOXtdqprn0DWdQkKKE6blTRXzWHR9wzS9FbG66XvHLEfrYWJTAoVEd8+ntAes/FxjXrY0RXotmmoqhbD4bk4DqqV6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--pratmal.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ubps6fSW; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--pratmal.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ubps6fSW"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso7184736eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 12:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776884521; x=1777489321; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UK/b3kF9CVImcy9Ye51I67Qy3lRyYOCKL572pRP5aNA=;
        b=ubps6fSWIgN5KMb3wsv3ZpPG1RH9ahe/r77nnkG9Y2L9jCRCCZzRS3BN1pcLQPWMlB
         6ZJdwQ+cPfJtPnG4n/CmzISNbyObKUeGKT/qo4zDgyQf2nS12AxyCqLdBQgGTyRqTCBi
         LhMYf+wiSgO2DoUG1Jp9lusL5jJ2ktwQMZic0Bj6n9l2YWd44wAdg2BLFj1K1llf2jDM
         6QxN0Ccs4BGmFkW4lpxg6gNpr6u0gLzSdDMTyP7/yC/ahHFySbYCxQ8QmV0LCaiRAJnY
         XEFRjWYyPA0WCstS+LZY4QCimCX/RCiNFid5hZrDmy24DbUy/n+hu7QMtXwRkA8K2KFw
         uJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776884521; x=1777489321;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UK/b3kF9CVImcy9Ye51I67Qy3lRyYOCKL572pRP5aNA=;
        b=liwQjcIReZuRiclNf+SSNhV+Bai1BhXou1RUMmFgK/8XIYkaWc8H/7Yeh4bywaxRwG
         wjRxrg1UlCix61z64Ajmw9A+0Fir7QvLwJKW05fWg50OsGaTBJ0QPxJyu/w/OoccdVG7
         B9kW1ePwapevevbASAMJMphYSz97syZTXrNUV9sIExPXlCig5P6rYn7aEStXYLm+jw1B
         eg+7+y6EMSCuqDcoJ96p64AOkdkrY1v5nEcScdBYFlMN6oPnVxSl566ruGxbRggRA6dM
         h9ICk7jBZjLApnMWc/PFGJZ7JkT9sVsQ+SGrmGTQHOAW6uv+he5baOd0HKinwq5Nrrtq
         0Tdw==
X-Forwarded-Encrypted: i=1; AFNElJ/90EwdMjduxaRPtKqDbavRpLnDLswDd4FcKdSy4TJh0UvYIK5c4DX7PbLSyYUXkalmz+gcyT8xzM/k0IWrKto=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbc2N9VS5/u8u9yVh53LK0E55hNIQYoYtE2H1JY31XImvyPo90
	EcFJfBHaMqW7YA70tes2EDuUUsxumnSPoF1pNxweTtYv3OPd2ZWSnGeV/un08FvUct5ny+LMlx0
	LBs5HvIVUog==
X-Received: from dlec2-n1.prod.google.com ([2002:a05:701b:4282:10b0:12c:4ced:d080])
 (user=pratmal job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:7f13:b0:12c:873f:eba3
 with SMTP id a92af1059eb24-12c873fef0fmr4642699c88.8.1776884520768; Wed, 22
 Apr 2026 12:02:00 -0700 (PDT)
Date: Wed, 22 Apr 2026 19:01:59 +0000
In-Reply-To: <03a23a7a-58fe-42f4-a294-9d688ce33e2d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <03a23a7a-58fe-42f4-a294-9d688ce33e2d@kernel.org>
X-Mailer: git-send-email 2.54.0.rc2.533.g4f5dca5207-goog
Message-ID: <20260422190159.214830-1-pratmal@google.com>
Subject: Re: [RFC PATCH] selftests/mm: use pattern matching in .gitignore
From: pratmal@google.com
To: david@redhat.com
Cc: akpm@linux-foundation.org, shuah@kernel.org, yosryahmed@google.com, 
	ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

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
