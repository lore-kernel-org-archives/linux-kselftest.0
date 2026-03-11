Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1EF3B635F;
	Wed, 11 Mar 2026 09:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773221983; cv=none; b=cha6d/c+HcHJx/G3XjUwjaxorRWXrkBMi7k3n7caz478Q/2Kmndtezz2tugqWAHOZjJy/ATCtc+QwyddJfbnq+JIZ0tAZSFv3qwpBKbtr+p9G0Jx4FB5BmNb7d2bKbUwGqbK88JRinKT0D6pHGb85LWDSTS09XSmANHYdaxGL/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773221983; c=relaxed/simple;
	bh=kwws0QFsc/Rj6B+30BoBsKU876QiSOsxCsvNnV9Vex0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bBY/kq9KY3dsxipbT0PP9xtZ91Ukv0Dwr+Q6S+gTd1nRykcPePxAISf2tlKWY5OngWuh7xePFkbk++muUGNUPxyfQu3umhCFpVBeKTzEEaOZ3oBy7YkBsvejZa8l9Y/sYjqpi959VGXF4NleIkDFxwSeB2V1IhF+NtekGKhuTvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12848169C;
	Wed, 11 Mar 2026 02:39:35 -0700 (PDT)
Received: from [10.57.83.156] (unknown [10.57.83.156])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F4453F836;
	Wed, 11 Mar 2026 02:39:39 -0700 (PDT)
Message-ID: <2d14e8b7-a7c3-46ba-b1d2-6bb6404c08fa@arm.com>
Date: Wed, 11 Mar 2026 09:39:37 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/7] selftests/sched: Add SCHED_DEADLINE utility
 library
To: Juri Lelli <juri.lelli@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Valentin Schneider <vschneid@redhat.com>,
 Clark Williams <williams@redhat.com>, Gabriele Monaco <gmonaco@redhat.com>,
 Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>,
 Luca Abeni <luca.abeni@santannapisa.it>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260306-upstream-deadline-kselftests-v1-0-2b23ef74c46a@redhat.com>
 <20260306-upstream-deadline-kselftests-v1-2-2b23ef74c46a@redhat.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20260306-upstream-deadline-kselftests-v1-2-2b23ef74c46a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/6/26 16:10, Juri Lelli wrote:
> Add a comprehensive utility library for SCHED_DEADLINE scheduler tests.
> This library provides reusable helper functions that simplify test
> implementation and reduce code duplication across the test suite.
> 
> The utility library provides scheduling operations that wrap the
> sched_setattr and sched_getattr syscalls for setting and querying
> SCHED_DEADLINE parameters. These include dl_set_sched_attr() for
> configuring deadline parameters, dl_get_sched_attr() for querying
> scheduling attributes, dl_get_policy() for reading the policy from
> /proc, and dl_is_deadline_task() for checking if a task is using
> SCHED_DEADLINE. The library uses system headers for struct sched_attr
> to avoid redefinition conflicts and provides full control over
> SCHED_DEADLINE parameters.
> 
> Bandwidth management helpers allow tests to work within system
> constraints. The dl_get_rt_bandwidth() function reads RT bandwidth
> settings from /proc, while dl_calc_max_bandwidth_percent() calculates
> the available bandwidth for deadline tasks based on current system
> configuration.
> 
> Process management functions simplify creating and managing test
> workloads. The dl_create_cpuhog() function forks and schedules a cpuhog
> process by creating a child process, executing the cpuhog binary, and
> setting SCHED_DEADLINE policy on the child PID after fork. It waits for
> the child to start before configuring the scheduling policy. Supporting
> functions include dl_cleanup_cpuhog() for terminating processes,
> dl_find_cpuhogs() for locating running instances, and dl_wait_for_pid()
> for synchronizing with process startup.
> 
> CPU topology helpers enable tests that manipulate CPU hotplug state.
> These include dl_get_online_cpus() for counting available CPUs,
> dl_get_hotpluggable_cpus() for identifying which CPUs can be
> hotplugged, dl_cpu_online() and dl_cpu_offline() for controlling
> hotplug state, and dl_is_cpu_online() for checking current status.
> 
> Time conversion utilities provide convenient transformations between
> different time units. These include dl_ms_to_ns() and dl_us_to_ns()
> for converting to nanoseconds, and dl_ns_to_ms() and dl_ns_to_us() for
> converting from nanoseconds.
> 
> The library also includes the cpuhog helper program, which performs
> busy looping to consume CPU cycles. This provides a controllable
> workload for testing scheduler behavior under various deadline
> configurations.
> 
> Assisted-by: Claude Code: claude-sonnet-4-5@20250929
> Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
> ---
>  tools/testing/selftests/sched/deadline/Makefile  |  14 +-
>  tools/testing/selftests/sched/deadline/cpuhog.c  | 107 ++++++++
>  tools/testing/selftests/sched/deadline/dl_util.c | 335 +++++++++++++++++++++++
>  tools/testing/selftests/sched/deadline/dl_util.h | 227 +++++++++++++++
>  4 files changed, 680 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/sched/deadline/Makefile b/tools/testing/selftests/sched/deadline/Makefile
> index fd57794f1a543..ea3fdfbef459e 100644
> --- a/tools/testing/selftests/sched/deadline/Makefile
> +++ b/tools/testing/selftests/sched/deadline/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -TEST_GEN_PROGS := runner
> +TEST_GEN_PROGS := runner cpuhog
>  

This runs cpuhog as a test as well which prints misleading timeouts.

