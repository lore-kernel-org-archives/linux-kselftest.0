Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9DF34DB54;
	Fri, 20 Mar 2026 19:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774035322; cv=none; b=TstsRQ873J0vA+JmQn+TGYoDlqJvCSQFEcpBVnT4Re3+/5z5ScmqsUlmrwfkrmrCW1qF+MT07AvJKXt1LXjZZhfrn2dQu8ptVrJsTBfL/vN8L0vLBhSk1yRq4AUEnogrYSfmwFE123cI2BSFArKbskgHgom2hL6R1yidUf855+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774035322; c=relaxed/simple;
	bh=lz8NbgQKGoPYkg9rAXWIFF2VzNwNk75zfobC+DqUxZ4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=lVqxHxDDp61+a45c/k7bkWdTS6vKbBwbrb0rSf0iMCnvPewf/Tqqi8/oolyU9wJ1U3O9GJc7jyIF2teyJSlWSw5s6c8Wp9IUAKXq88wuvol9m9odWjgwvWj7YJU8AP5OQCE6NjL+fxQMvitlnqNhx7AQgFUXS5S+/PPJTDmt90c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Oew7NkoS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Oew7NkoS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438F9C2BCC6;
	Fri, 20 Mar 2026 19:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774035321;
	bh=lz8NbgQKGoPYkg9rAXWIFF2VzNwNk75zfobC+DqUxZ4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Oew7NkoSOTo3/RzCToFkaK99ExN8a/9ytm1keifE+lhzyqQTb083d2zboZF+og7En
	 fZvqvq9GFceNQAg0+KJWN5eEzQga/3rPaTSx6vGjCWUT1qBEOE04hIWxKIJh1JW62P
	 YuD0rDhqiN0Bfip4E9lzKEx5JAnsV/vsrPsJ4d/4=
Date: Fri, 20 Mar 2026 12:35:20 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Li Wang <liwang@redhat.com>
Cc: Yosry Ahmed <yosry@kernel.org>, yosryahmed@google.com,
 nphamcs@gmail.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, Johannes Weiner
 <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, Michal
 =?ISO-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>, Muchun Song
 <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>, Roman Gushchin
 <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v3 1/7] selftests/cgroup: skip test_zswap if zswap is
 globally disabled
Message-Id: <20260320123520.616900ef63996ba448bcd91f@linux-foundation.org>
In-Reply-To: <CAEemH2cQSoTEVb+8NxZpc=qQVrd5DBhj7HmJA5o9GZFke3zj0Q@mail.gmail.com>
References: <20260313043532.103987-1-liwang@redhat.com>
	<CAO9r8zMsbVHKnCzfQcdtomRMWTNFgTGY4XALxwm+i9m1SUPPvg@mail.gmail.com>
	<abPEALhYmtBnEULi@redhat.com>
	<CAO9r8zMciNGa1ei-pSvx+ndrCJtZguGj12R3sa8PkDHYwsvGzw@mail.gmail.com>
	<CAEemH2cQSoTEVb+8NxZpc=qQVrd5DBhj7HmJA5o9GZFke3zj0Q@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Mar 2026 09:25:10 +0800 Li Wang <liwang@redhat.com> wrote:

> Hi Yosry,
> 
> Do you know who will help merge this patchset?

That would be me.

> Should I wait or ping someone to move on the process?

A few more reviewed-by's would be nice.

Meanwhile, AI review has a lot of things to say:
	https://sashiko.dev/#/patchset/20260313043532.103987-1-liwang@redhat.com
