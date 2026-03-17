Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F516369239;
	Tue, 17 Mar 2026 14:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758473; cv=none; b=MfpDo++JwgxkxWMgDCCAij+Bnriu+nffWbihIrDXpYtnC395Z3IfOcFDZlZjJs+4EnAq9lHuYcpXHDhF0jU0O2hTejF+SBaPI9G7eh3Po2BaeJHgNCkt5TrI+jXIVssRE+yg+fNJ+RbZu8Xa+0Jc2JWc1KAIxOmizYKdOowmnmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758473; c=relaxed/simple;
	bh=HloLWblUXfx/tXmUTea0CrvTD8QLr6l63/rB223Sfn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lXTktfSUa6SOwb8TMVI/j/TwBEO4aeylVRewxwxLhyEND6R4eoM9t+TW5m3e+kA3NpyJfMpJQ2jCQgrrUHNKudHk79xQs9v/H43yaA8uV+2k6KAtExGGuOcv3UmANPu2YNwcHzUWw1OnoXMR2gJ3oDElf87ZrMPwslNIdVJPVXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IWUB9FcZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IWUB9FcZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 842B6C2BC86;
	Tue, 17 Mar 2026 14:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773758473;
	bh=HloLWblUXfx/tXmUTea0CrvTD8QLr6l63/rB223Sfn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IWUB9FcZEm1B+/N3hiautZOJHwc0koqlxINQxuwl6SZe6mZ9KSi64b3pYhrMN00yC
	 aj5+T4JrWz4AU43u+eeq4+jIJCjYWp46m53yzDAD1aGs06Neto0IUhbKxeTjisOX3+
	 OHbL/WyjkIZ3qw4vlcJ5bOjSfxpQvxzotHnma4ohJi8gunBcUqzGJMxCc3FaH2dz0x
	 0a9QMPJ3xp+v99KMpGxBTqh3YbhFeArT1pVO9Z0mPMYXXUgd3uCyh6zhs4rRhpe5X+
	 xtWAtX3ZmyUFnSfZX/0DVo9asvNmIg9PU/4QidXMbut4F2mxMIqaMKHa0C+5UU8zv2
	 9e1DkZM6wFkkg==
Date: Tue, 17 Mar 2026 15:41:06 +0100
From: Christian Brauner <brauner@kernel.org>
To: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Jan Kara <jack@suse.cz>, Oleg Nesterov <oleg@redhat.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, Andrei Vagin <avagin@google.com>, Kirill Tkhai <tkhai@ya.ru>, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, Adrian Reber <areber@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 4/4] selftests: Add tests for creating pidns init via
 setns
Message-ID: <20260317-nullrunde-deckung-b53c8cf46bc9@brauner>
References: <20260313111014.2068913-1-ptikhomirov@virtuozzo.com>
 <20260313111014.2068913-5-ptikhomirov@virtuozzo.com>
 <04c179a1-d3e2-4a87-a024-ce1b144f1b60@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <04c179a1-d3e2-4a87-a024-ce1b144f1b60@virtuozzo.com>

On Mon, Mar 16, 2026 at 12:34:18PM +0100, Pavel Tikhomirov wrote:
> 
> 
> On 3/13/26 12:09, Pavel Tikhomirov wrote:
> > First testcase "pidns_init_via_setns" checks that a process can become
> > Pid 1 (init) in a new Pid namespace created via unshare() and joined via
> > setns().
> > 
> > Second testcase "pidns_init_via_setns_set_tid" checks that during this
> > process we can use clone3() + set_tid and set the pid in both the new
> > and old pid namespaces (owned by different user namespaces).
> > 
> > Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
> > ---
> >  .../selftests/pid_namespace/.gitignore        |   1 +
> >  .../testing/selftests/pid_namespace/Makefile  |   2 +-
> >  .../pid_namespace/pidns_init_via_setns.c      | 238 ++++++++++++++++++
> >  3 files changed, 240 insertions(+), 1 deletion(-)
> >  create mode 100644 tools/testing/selftests/pid_namespace/pidns_init_via_setns.c
> > 
> > diff --git a/tools/testing/selftests/pid_namespace/.gitignore b/tools/testing/selftests/pid_namespace/.gitignore
> > index 5118f0f3edf4..c647c6eb3367 100644
> > --- a/tools/testing/selftests/pid_namespace/.gitignore
> > +++ b/tools/testing/selftests/pid_namespace/.gitignore
> > @@ -1,2 +1,3 @@
> >  pid_max
> > +pidns_init_via_setns
> >  regression_enomem
> > diff --git a/tools/testing/selftests/pid_namespace/Makefile b/tools/testing/selftests/pid_namespace/Makefile
> > index b972f55d07ae..b01a924ac04b 100644
> > --- a/tools/testing/selftests/pid_namespace/Makefile
> > +++ b/tools/testing/selftests/pid_namespace/Makefile
> > @@ -1,7 +1,7 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  CFLAGS += -g $(KHDR_INCLUDES)
> >  
> > -TEST_GEN_PROGS = regression_enomem pid_max
> > +TEST_GEN_PROGS = regression_enomem pid_max pidns_init_via_setns
> >  
> >  LOCAL_HDRS += $(selfdir)/pidfd/pidfd.h
> >  
> > diff --git a/tools/testing/selftests/pid_namespace/pidns_init_via_setns.c b/tools/testing/selftests/pid_namespace/pidns_init_via_setns.c
> > new file mode 100644
> > index 000000000000..7e4c610291d3
> > --- /dev/null
> > +++ b/tools/testing/selftests/pid_namespace/pidns_init_via_setns.c
> > @@ -0,0 +1,238 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +#define _GNU_SOURCE
> > +#include <fcntl.h>
> > +#include <sched.h>
> > +#include <stdio.h>
> > +#include <sys/types.h>
> > +#include <unistd.h>
> > +
> > +#include "kselftest_harness.h"
> > +#include "../pidfd/pidfd.h"
> > +
> > +/*
> > + * Test that a process can become PID 1 (init) in a new PID namespace
> > + * created via unshare() and joined via setns().
> > + *
> > + * Flow:
> > + *  1. Parent creates a pipe for synchronization.
> > + *  2. Parent forks a child.
> > + *  3. Parent calls unshare(CLONE_NEWPID) to create a new PID namespace.
> > + *  4. Parent signals the child via the pipe.
> > + *  5. Child opens parent's /proc/<ppid>/ns/pid_for_children and calls
> > + *     setns(fd, CLONE_NEWPID) to join the new namespace.
> > + *  6. Child forks a grandchild.
> > + *  7. Grandchild verifies getpid() == 1.
> > + */
> > +TEST(pidns_init_via_setns)
> > +{
> > +	pid_t child, parent_pid;
> > +	int pipe_fd[2];
> > +	char buf;
> > +
> > +	parent_pid = getpid();
> > +
> > +	ASSERT_EQ(0, pipe(pipe_fd));
> > +
> > +	child = fork();
> > +	ASSERT_GE(child, 0);
> > +
> > +	if (child == 0) {
> > +		char path[256];
> > +		int nsfd;
> > +		pid_t grandchild;
> > +
> > +		close(pipe_fd[1]);
> > +
> > +		/* Wait for parent to complete unshare */
> > +		ASSERT_EQ(1, read_nointr(pipe_fd[0], &buf, 1));
> > +		close(pipe_fd[0]);
> > +
> > +		snprintf(path, sizeof(path),
> > +			 "/proc/%d/ns/pid_for_children", parent_pid);
> > +		nsfd = open(path, O_RDONLY);
> > +		ASSERT_GE(nsfd, 0);
> > +
> > +		ASSERT_EQ(0, setns(nsfd, CLONE_NEWPID));
> > +		close(nsfd);
> > +
> > +		grandchild = fork();
> > +		ASSERT_GE(grandchild, 0);
> > +
> > +		if (grandchild == 0) {
> > +			/* Should be init (PID 1) in the new namespace */
> > +			if (getpid() != 1)
> > +				_exit(1);
> > +			_exit(0);
> > +		}
> > +
> > +		ASSERT_EQ(0, wait_for_pid(grandchild));
> > +		_exit(0);
> > +	}
> > +
> > +	close(pipe_fd[0]);
> > +
> > +	if (geteuid())
> > +		ASSERT_EQ(0, unshare(CLONE_NEWUSER));
> 
> I think it's better to move this hack above to the very top of the test.
> 
> Was found by https://sashiko.dev/#/patchset/20260313111014.2068913-1-ptikhomirov%40virtuozzo.com

Please resend and include a new entry for pid namespaces as a patch.
Make me a maintainer and yourself a reviewer, please.
