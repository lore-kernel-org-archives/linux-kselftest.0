Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C19E2DF68
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 00:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773276921; cv=none; b=iGZc+VASkjPADiqn0V9BcUdWVR8CSl0zqmUm/sgJ3nOSREwG9VNjCzE+BVovbbZxvzowTSLt0PcfXahr2bOrIUjD1Xlc9VggQTNN2u6Kglkawc4XAsQeRBYjTCXAbL7G0zKotvcxTwj60i6GQNbbWZBMcU6yvaWnhVZ7QTUnhpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773276921; c=relaxed/simple;
	bh=6LSdL98ZotrSRX1eDbvuLKAzwAbASYg/e5rmWSoeKG4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KNMjAt53v+9h5BUw+wfdjEFJmjk7jzUiyBJXxjLbMB+rY2mjoKJoNmPt20P8vXQNr2Z6ahzfp5bpXhof5qkl9Jm2LobsSjYaQV811nqWHSlq8V1vQ0GabTzFFPPDIDp6lunhVb5cpqZYBnadQpTZa2NMwnY1SJIsg9o3HT8DZ9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gt86lFdv; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gt86lFdv"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-35a02f3b8e2so2039430a91.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 17:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773276919; x=1773881719; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=InAOGSfJmiIFK9a61D7u+f/DlACEHE44oAFbK2VnT1w=;
        b=gt86lFdvS8byq+SkI8gmJlYZvHjk3is39CxVbmIBPrOtmSeOVH7pIyLp2M5BvSFKF3
         hDRM3fEYFiy5utFH8NDChSGItSAqUuMv7k4zFJ8nESYI3YafY50wh/mxOjBlVkC78Gy7
         Mi2ZIBS3KqpPKkmb5wz+Rou64SZLgQQF4eQfdHMwUkxntG5Ii/DJUfeuUVTAnzpezzAW
         zsL9fOYFQMF0Aa9OQCjXxYop5Otf12d599Kwnxo0P6kAFI1gdIaqazywAOOTP/k/Lk8p
         xmZ7y5upMd3C9x8Ir5938mg2nWjvO7jSiFzKkVF9QNII4O5JPjNRw/Id1cBwTbhEVheB
         zZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773276919; x=1773881719;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=InAOGSfJmiIFK9a61D7u+f/DlACEHE44oAFbK2VnT1w=;
        b=Mq100ivR4q1LebqrRT95IQ1afQDbnp8ozEBS0xtt5TPYNgwXTO+Q7zCJh6K7odknGa
         CmFNNnf/oO3ZtWAOGbEvruWqMN9nKsjOg2Pm3Xgndgn3rDYNjNMMM3jE0iflGO0pdKkt
         DoSH9hLbkWoqdy2ry3jgLNicZ8yS7VVT+8KlFi9Fg4Z/lEkiOtsXhJbpKGjFmHd0Zz9w
         OG+ZQRQ1a0qGRzfO2DbA5txRHpjFUiG2YHSzq5h5UyaV2fwZueerQhri6nM/aU4IdJze
         e0PcBUUVPa+0eKv4EUlONjksuqhiTd4Va6McaZADE8aHmwZB5eSMYIjuLUh3kApulc32
         afJA==
X-Forwarded-Encrypted: i=1; AJvYcCVK0zGfWG9/CoGQQenH9r97fIGkcMLx5S6loMKBCZebqUp8Re5fXPU9mhwQsmqEEwKDYHE380AmUCWdvHroM1U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwgbjfNKWlrKzzcv8iIZacPqpuR5hsU7ZEBsY44btUsGJcuXaT
	4YliiDh8f8fAXcKXSVBakEIuchGskPvyEoYhYFGm0rWX8t/DEI36ON77zhEABrIVXBJWb/pY5F3
	21lKrcg==
X-Received: from pgld31.prod.google.com ([2002:a63:e1f:0:b0:c66:4fdd:d41a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:2989:b0:398:4a5c:d5a3
 with SMTP id adf61e73a8af0-398c60e4390mr4170819637.34.1773276919379; Wed, 11
 Mar 2026 17:55:19 -0700 (PDT)
Date: Wed, 11 Mar 2026 17:55:18 -0700
In-Reply-To: <20251114151828.98165-3-kalyazin@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251114151828.98165-1-kalyazin@amazon.com> <20251114151828.98165-3-kalyazin@amazon.com>
Message-ID: <abIO9teJUlGMj16T@google.com>
Subject: Re: [PATCH v7 2/2] KVM: selftests: update guest_memfd write tests
From: Sean Christopherson <seanjc@google.com>
To: Nikita Kalyazin <kalyazin@amazon.co.uk>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "shuah@kernel.org" <shuah@kernel.org>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "david@kernel.org" <david@kernel.org>, 
	"jthoughton@google.com" <jthoughton@google.com>, "ackerleytng@google.com" <ackerleytng@google.com>, 
	"vannapurve@google.com" <vannapurve@google.com>, "jackmanb@google.com" <jackmanb@google.com>, 
	"patrick.roy@linux.dev" <patrick.roy@linux.dev>, Jack Thomson <jackabt@amazon.co.uk>, 
	Takahiro Itazuri <itazur@amazon.co.uk>, Derek Manwaring <derekmn@amazon.com>, 
	Marco Cali <xmarcalx@amazon.co.uk>
Content-Type: text/plain; charset="us-ascii"

On Fri, Nov 14, 2025, Nikita Kalyazin wrote:
> +static void test_write_supported(int fd, size_t total_size)
> +{
> +	size_t page_size = getpagesize();
> +	void *buf = NULL;
> +	int ret;
> +
> +	ret = posix_memalign(&buf, page_size, total_size);
> +	TEST_ASSERT_EQ(ret, 0);
> +
> +	ret = pwrite(fd, buf, page_size, total_size);
> +	TEST_ASSERT(ret == -1, "writing past the file size on a guest_mem fd should fail");
> +	TEST_ASSERT_EQ(errno, EINVAL);
> +
> +	ret = pwrite(fd, buf, 1, 0);
> +	TEST_ASSERT(ret == -1, "writing an unaligned count a guest_mem fd should fail");
> +	TEST_ASSERT_EQ(errno, EINVAL);
> +
> +	ret = pwrite(fd, buf, page_size, 1);
> +	TEST_ASSERT(ret == -1, "writing to an unaligned offset a guest_mem fd should fail");
> +	TEST_ASSERT_EQ(errno, EINVAL);
> +
> +	ret = pwrite(fd, buf, page_size, 0);
> +	TEST_ASSERT(ret == page_size, "write on a guest_mem fd should succeed");

This write should actually verify a given pattern is written, not just that the
write() returned success.  There should also be testcases for writes that fail,
e.g. on the first page and also on the nth page.

In a perfect world, there would also be testcases for partial writes, but I'm not
entirely sure how to make that happen, e.g. I'm not sure if an munmap() can pull
the rug out from under __copy_from_iter().  If we go with the -EFAULT behavior,
the test can map two pages, then use a separate helper thread to munmap() the pages
after a delay.  Then in the pwrite() thread, verify all bytes are written on success?
I'm not sure that's interesting enought to warrant the development cost and effort
though, e.g. it doesn't seem wildly different than the deterministic "entire page
failed" case.
