Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8249B42314E;
	Tue, 26 May 2026 18:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779820451; cv=none; b=gZPsWBmhHyfJPm1h8z/OwIKQEsFIvx4pSvI1OgazPfCmDOaWDGl+72KGx92Nm8YWQHlx4+8nPhmHcKqKYe1NbwXUTdrAWXefl0t5VU3LbnuaGPiMbL3/6fU+dAR+0E6rWxXR1nRwBitTWLe5D0mj32UXnwg2nkDho+MuYijcdCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779820451; c=relaxed/simple;
	bh=axm9xLBItLzarSvidyqQ34f11su4X5nTQR85bMSt1/I=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Wiw2LRFftvDi9Jqn9eOm2jdugt8W/OrXeF2ELz98YdR9/YuQ15zRkvVHRSngONa8y7QT62q2gAyjNbY1E+M4A+GGYuSxD8Z+1uNx+v+j4GSROwKLKhHd/m34MPWgAKR2qkYqO71Zsc2WCSQXGceVvJ+KReweBLm9AJQmNVJUBIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=058LaBr4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="058LaBr4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81DBC1F000E9;
	Tue, 26 May 2026 18:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1779820449;
	bh=ten4yU23Ac++inidkaUZfcmTNHhvUCtXpX8S8RV5zAs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=058LaBr40gFFVrI+tEcI1F73LCQl9qspfIq+A33YQ+Ax8Nob0h18JqK9snSIkiNOo
	 iD5JKhwtBvwLzWcrrSL30ERHyUqTx7Y7hdPoHkV1HpnKkJVArhZLZq6YgTz95uWuzK
	 q62/9tyZXY0zhx1K7XbMAOKVo89e70I+5L8oBE9Q=
Date: Tue, 26 May 2026 11:34:09 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Chris Gellermann <christian.gellermann@codasip.com>
Cc: brauner@kernel.org, shuah@kernel.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] selftest: Fix UB of getline due to missing var init
Message-Id: <20260526113409.ea65314eb1da831de7c90ca6@linux-foundation.org>
In-Reply-To: <20260526113848.530105-1-christian.gellermann@codasip.com>
References: <20260526113848.530105-1-christian.gellermann@codasip.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 26 May 2026 13:38:48 +0200 Chris Gellermann <christian.gellermann@codasip.com> wrote:

> Subject: [PATCH] selftest: Fix UB of getline due to missing var init

hm, what's "UB".  Please expand the acronym.

> Clone3_set_tid uses getline(&line, &len, f) in a loop to read the
> child's process status. The code expects that getline allocates the
> buffer for the line on the first loop iteration. For this, glibc[1]
> requires char *line to be set to NULL:
> 
> > ssize_t getline(char **restrict lineptr, ...)
> > If *lineptr is set to NULL before the call, then getline() will
> > allocate a buffer for storing the line.
> 
> However, char *line is only declared, leading to an undefined
> initialization value. Fix this by properly initializing it to NULL.

Does the test crash?  If not, how come?  Luck?

> Same issue fixed in mlock-random-test.
> 
> [1] https://man7.org/linux/man-pages/man3/getline.3.html

The two affected files are testing significantly different parts of the
kernel.

> Fixes: 41585bbeeef9 ("selftests: add tests for clone3() with *set_tid")
> Fixes: 26b4224d9961 ("selftests: expanding more mlock selftest")

And these were separated by three years.

So can you please split this into a two-patch series?  And I suggest
you add "Cc: <stable@vger.kernel.org>" to each one.  Please retain David's
ack on both.

Thanks.
