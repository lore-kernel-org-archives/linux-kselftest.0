Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAF73CCFD8;
	Mon,  8 Jun 2026 14:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929183; cv=none; b=WEa+U860O2APeM49xm7B47uNjDaPPa9LvRI+5d2Vuv0VEOeBqHcKXgZY/BtwQA/4GsTsUhoXXrX9aEh5hThBQYzGCFbfimC7nT+88PSGrbGW03tXp8M1KH9/T5VMoO6FZmrDeVU0KjbHjvs7pbXzUjE9UVgmFtMoFH5YgXXDTvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929183; c=relaxed/simple;
	bh=4R/tNaRPBKSz4d8NRR2R/LV30kd5D+OzUBD6MJHjgTs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jyJLXh7ymUWeLo9EcYW8aKAADunje47soH3cjjhf0dN94uQGqX5XIhT78z2h2SDHjQNM5bVWP39N9/71BNAaLlHf+YEHxLfP2wRCh3Ep1DcOvC0akhUARv0+3qXhf1HiCfCm3Uxf7v+fyotf6gPqKYIv33DgBCMwNs6fLZ/m/D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AGcIFJst; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AGcIFJst"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51FDF1F0089A;
	Mon,  8 Jun 2026 14:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929181;
	bh=tFRJ8X6n0yeGn7cDVS12LOYvoE0Z65a2bXJ3kF8/cvg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=AGcIFJstgQqLU57rrMwmnS9GqKdlWgI3Hcwl4z71ob8d8n0ZQp18oTHZJG+BWrw1K
	 /NWl00pIq4UlKtll//RcyAAAqZg56UxQ7erpsn80xInPm3rWAcQatARaEJ8tZOFLSy
	 n809M/Fex9slb3tld6+jO0A6S5cxZiF1RC0qXoXurotRtk90iN/WB/udu6UpaB40D2
	 COkoi7WtFBfNpOb+s+4Q65PwJ/RTMMQV6KMlIqdAJMK4g5ZycbWPdYecPqRJcXvoL5
	 LAOYuKwgu/5gmD5MFc/4iWdv1TgBl2M9wEEgp0lUfWcYW170V7B78AonX5FPIOAMHk
	 2KQqOE7cFP62A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Vipin Sharma <vipinsh@google.com>
Cc: tarunsahu@google.com,  pasha.tatashin@soleen.com,  rppt@kernel.org,
  pratyush@kernel.org,  shuah@kernel.org,  dmatlack@google.com,
  skhawaja@google.com,  linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/2] selftests/liveupdate: Add helpers to
 preserve/retrieve FDs
In-Reply-To: <20260518170124.GA3352871.vipinsh@google.com> (Vipin Sharma's
	message of "Mon, 18 May 2026 10:14:21 -0700")
References: <20260511201155.1488670-1-vipinsh@google.com>
	<20260511201155.1488670-3-vipinsh@google.com>
	<9huzy0hh3qhe.fsf@tarunix.c.googlers.com>
	<20260518170124.GA3352871.vipinsh@google.com>
Date: Mon, 08 Jun 2026 16:32:57 +0200
Message-ID: <2vxzjys9t84m.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, May 18 2026, Vipin Sharma wrote:

> On Mon, May 18, 2026 at 11:29:49AM +0000, tarunsahu@google.com wrote:
>> Vipin Sharma <vipinsh@google.com> writes:
>> 
>> > Add helper functions to preserve and retrieve file descriptors from an
>> > LUO session. This allows library users to work with FD preservation.
>> >
>> > No functional change intended.
>> >
>> > Signed-off-by: Vipin Sharma <vipinsh@google.com>
>> > Co-developed-by: David Matlack <dmatlack@google.com>
>> > Signed-off-by: David Matlack <dmatlack@google.com>
>> > Signed-off-by: Vipin Sharma <vipinsh@google.com>
>> > ---
>> >  .../liveupdate/lib/include/libliveupdate.h    |  3 ++
>> >  .../selftests/liveupdate/lib/liveupdate.c     | 41 +++++++++++++++----
>> >  2 files changed, 35 insertions(+), 9 deletions(-)
>> >
>> > diff --git a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
>> > index 4390a2737930..2b04b3256382 100644
>> > --- a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
>> > +++ b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
>> > @@ -26,6 +26,9 @@ int luo_create_session(int luo_fd, const char *name);
>> >  int luo_retrieve_session(int luo_fd, const char *name);
>> >  int luo_session_finish(int session_fd);
>> >  
>> > +int luo_session_preserve_fd(int session_fd, int fd, __u64 token);
>> > +int luo_session_retrieve_fd(int session_fd, __u64 token);
>> > +
>> >  int create_and_preserve_memfd(int session_fd, int token, const char *data);
>> >  int restore_and_verify_memfd(int session_fd, int token, const char *expected_data);
>> >  
>> > diff --git a/tools/testing/selftests/liveupdate/lib/liveupdate.c b/tools/testing/selftests/liveupdate/lib/liveupdate.c
>> > index 60121873f685..7bc6707d8bb7 100644
>> > --- a/tools/testing/selftests/liveupdate/lib/liveupdate.c
>> > +++ b/tools/testing/selftests/liveupdate/lib/liveupdate.c
>> > @@ -54,9 +54,35 @@ int luo_retrieve_session(int luo_fd, const char *name)
>> >  	return arg.fd;
>> >  }
>> >  
>> > +int luo_session_preserve_fd(int session_fd, int fd, __u64 token)
>> > +{
>> > +	struct liveupdate_session_preserve_fd arg = {
>> > +		.size = sizeof(arg),
>> > +		.fd = fd,
>> > +		.token = token,
>> > +	};
>> > +
>> > +	if (ioctl(session_fd, LIVEUPDATE_SESSION_PRESERVE_FD, &arg) < 0)
>> > +		return -errno;
>> > +
>> > +	return 0;
>> > +}
>> > +
>> > +int luo_session_retrieve_fd(int session_fd, __u64 token)
>> nit: Can add a comment that, once it is failed, retrieved status is saved,
>> So it is permanent failure.
>
> I think appropriate place will be the official documentation which is
> here include/uapi/linux/liveupdate.h
>
> I don't see it is mentioned in the documentation (yes, code does what
> you have said), I will refrain from adding that comment here.

Would be a good addition to the LUO docs I think. Patches welcome :-)

[...]

-- 
Regards,
Pratyush Yadav
