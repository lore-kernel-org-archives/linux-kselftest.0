Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33B53AB29B
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 20:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778616786; cv=none; b=LzPqPfVgT5GiysBGiuDnE6BQdv7y83puMjZrm+iapBlR7hFjh1Z2ip50RujT2xIJmXvTJT9i0EebEyk6vCP9NmJnJjo452x0AXNhhG7cXrAQ9VpMiBvdjc8tygI3hWTBYIJvJL5yrNseLBIlLI9kN4JpAjVpTk3FHIC8Ttkagjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778616786; c=relaxed/simple;
	bh=VbuSSS++NYVPZ+f4EE021rODkOHPnmVtE4jyTtZ4G6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZXk7cVv7pURstEtf3rLjBjaq7Ed9O38UozzSd1lVmpxsMaA6WPCqIeg49gb4VmbS068zRokRCJKUdbqPE6dvMkGpTkugIo160G9Y3YOaI1vWbUSKkLh1vuFGCf5pHFpLZFeqlYdyzYzZ/aqQkS7fPjyQ6IiotOSvd2QZHoSf73A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=UwH3NpjQ; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="UwH3NpjQ"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8d65f4073bfso816719185a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 13:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1778616784; x=1779221584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DIIRS0CpXrVK8EEE9qFLP9/pCIOhI1EfpJW18IQe0rY=;
        b=UwH3NpjQVY1Z4wgFbw+hbv/nlKseNSvKIRcvChDMzJMIB/M63tMoAeXUSA6bldrsLu
         u++b8NyElc1GLwKpew/c594ZEc+MVzHCPLW8nkTjJyTgoiTuZLaw5uRH9Utr0jEtEhSO
         EHOdeHChT/ZlDBtsEqgBb7uMghrMbwzycxVRgN6HzuqQOJGu2zyUBWym86UXD+2cT79S
         sWz/W9ZvpcvKt/tqpCrpqRtYK1CB8tvdEVqW0dtZqRJhHR3A8+RrR8AtbaNuiK6VTDP0
         Kzm2Zhb3/nxinz6jyrqSwmgGmeNhRhRJ0/chHzeFZn3NNAnN5hwvTS7pIx2P9py4NtS9
         LEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778616784; x=1779221584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DIIRS0CpXrVK8EEE9qFLP9/pCIOhI1EfpJW18IQe0rY=;
        b=Vrx424Y+/CeEDRMu4WTy6qRLZPv0C40qFkqG7Xkky3NKF2Is8IXDfYYN+/DcimTcXs
         gnrgybGjPJ7jOMU4znJuQ8nGs0Igo5UKwewamxqY3cVGatC01o4Ed0bgI7KKFMgmECuH
         KuAYSfo8RL2ozVUYLpjZe/FOkb0QRsDvzX5sfMvMaaT2tQ+o/CR2wPFMAqg8tSKVlb9M
         OXdS7vrn1VSuaiecHUGKbuHIv21JYZZNppXNmdtBybaKCQX0DKUAjzBuodI+/iz9KmWy
         u/PR5TWjMei4F0vtXTD6Vw/SL3uDHsjWrAkNs7AM0ZBNQxdaTvH6xWgYMGMVFWyYwqhs
         pCvw==
X-Forwarded-Encrypted: i=1; AFNElJ+pBFOEcHcAJ/e9MmpxdzwHzOsdKFYYUNAtCIkdayMa5pACHKzsiJoefOSEZ7utHuFuoaqtUH9yFNyxATIlo4M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz51SEW/FdNjqLKaCkCJ+lREAxltYpXXfxyiweypbzemiHj8AM
	X2USRp8VUp0Ij66TBwuIQMSZJiszUBiNUYyDrTlpGN6nQr5SL+XSaPXhk/OYmXa+oew=
X-Gm-Gg: Acq92OHE48/FfQvnZjxvPWU8xyx4v8xs1K29GZefhm5CrJM3t2cTHbA9Mihe8dyzLtK
	3aVc7ndDJzq8xwHd6u+ujmxOQAmtxiNy4A9ID9nCXkpoPWzO2X46DUjMiZ4MaAL9wRhP3Y4mt1O
	AleHHI2EVUwLZVIxgOfx7ETPdSQSUBlvly8rrxQ1l80GkBn+JdGHW8jQJy1OHf9SftyMOenGQnm
	zT4ioocT1Tki7pQlk2Vcz4ost4QTBYblIAuzq7HjWo7G1Ws/qtF57XJWHNG96AGz31WKgwFtZUw
	TyibcjTeCrBPYFkIoqV1TYDrBQ1jxVVQRjKwVab4FCiiM+UqHUD7mDjologP882k66clhTuRzZG
	9J35km4i3U2L8Fxb1TCbPgARnxOEnlagcXVDP8nEzUj5WjoUe0Kpr8THxQdkoE6szdHar/ul+T6
	sYAesHoxZjGYW9YIio8xH+OIhvKMtaQ1GqZLjJ6C+FKboiyeSuWJc=
X-Received: by 2002:a05:622a:92:b0:514:9ece:a15a with SMTP id d75a77b69052e-5162f5fedb6mr2218391cf.45.1778616783708;
        Tue, 12 May 2026 13:13:03 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148e675b9csm125582881cf.11.2026.05.12.13.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 13:13:03 -0700 (PDT)
Date: Tue, 12 May 2026 20:13:02 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, dmatlack@google.com, 
	kexec@lists.infradead.org, skhawaja@google.com, graf@amazon.com
Subject: Re: [PATCH 3/5] selftests/liveupdate: Test session and file limit
 removal
Message-ID: <agOJui6EOiJR3cgn@plex>
References: <20260414200237.444170-1-pasha.tatashin@soleen.com>
 <20260414200237.444170-4-pasha.tatashin@soleen.com>
 <2vxzse7wafmo.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2vxzse7wafmo.fsf@kernel.org>

On 05-12 16:04, Pratyush Yadav wrote:
> On Tue, Apr 14 2026, Pasha Tatashin wrote:
> 
> > With the removal of static limits on the number of sessions and files per
> > session, the orchestrator now uses dynamic allocation.
> >
> > Add new test cases to verify that the system can handle a large number of
> > sessions and files. These tests ensure that the dynamic block allocation
> > and reuse logic for session metadata and outgoing files work correctly
> > beyond the previous static limits.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  .../testing/selftests/liveupdate/liveupdate.c | 99 +++++++++++++++++++
> >  1 file changed, 99 insertions(+)
> >
> > diff --git a/tools/testing/selftests/liveupdate/liveupdate.c b/tools/testing/selftests/liveupdate/liveupdate.c
> > index 37c808fbe1e9..0eaf97b19267 100644
> > --- a/tools/testing/selftests/liveupdate/liveupdate.c
> > +++ b/tools/testing/selftests/liveupdate/liveupdate.c
> > @@ -22,6 +22,7 @@
> >  #include <fcntl.h>
> >  #include <string.h>
> >  #include <sys/ioctl.h>
> > +#include <sys/resource.h>
> >  #include <unistd.h>
> >  
> >  #include <linux/liveupdate.h>
> > @@ -386,4 +387,102 @@ TEST_F(liveupdate_device, prevent_double_preservation)
> >  	ASSERT_EQ(close(session_fd2), 0);
> >  }
> >  
> > +static void ensure_nofile_limit(struct __test_metadata *_metadata,
> > +				long min_limit)
> > +{
> > +	struct rlimit hl;
> > +
> > +	if (getrlimit(RLIMIT_NOFILE, &hl) < 0)
> > +		ksft_exit_fail_msg("getrlimit failed: %s\n", strerror(errno));
> > +
> > +	if (hl.rlim_cur >= min_limit)
> > +		return;
> > +
> > +	hl.rlim_cur = min_limit;
> > +	if (hl.rlim_cur > hl.rlim_max)
> > +		hl.rlim_max = hl.rlim_cur;
> > +
> > +	if (setrlimit(RLIMIT_NOFILE, &hl) < 0) {
> > +		if (errno == EPERM) {
> > +			SKIP(return, "Insufficient privileges to set RLIMIT_NOFILE to %ld",
> > +			     hl.rlim_cur);
> > +		}
> > +		ksft_exit_fail_msg("setrlimit to %ld failed: %s\n",
> > +				   hl.rlim_cur, strerror(errno));
> > +	}
> > +}
> > +
> > +/*
> > + * Test Case: Manage Many Sessions
> > + *
> > + * Verifies that a large number of sessions can be created and then
> > + * destroyed during normal system operation. This specifically tests the
> > + * dynamic block allocation and reuse logic for session metadata management
> > + * without preserving any files.
> > + */
> > +TEST_F(liveupdate_device, preserve_many_sessions)
> > +{
> > +#define MANY_SESSIONS 2000
> > +	int session_fds[MANY_SESSIONS];
> > +	int i;
> > +
> > +	self->fd1 = open(LIVEUPDATE_DEV, O_RDWR);
> > +	if (self->fd1 < 0 && errno == ENOENT)
> > +		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
> > +	ASSERT_GE(self->fd1, 0);
> > +
> > +	ensure_nofile_limit(_metadata, MANY_SESSIONS + 10);
> > +	if (_metadata->exit_code == KSFT_SKIP)
> > +		return;
> 
> Nit: This is strange. Why not just return errno in ensure_nofile_limit()
> and handle the skipping here? Same below.
> 
> LGTM otherwise.

Good suggestion. Done.

