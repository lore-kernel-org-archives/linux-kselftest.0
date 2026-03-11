Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D30133F32DD;
	Wed, 11 Mar 2026 09:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773221522; cv=none; b=ADJ3B3uwqJCh6Hdhwb6r+BkJ8Z7b8/BtIsOiqP48VpnNE40HIDTK+GwiYDiWbanGppKnrbkkXeYg209HszTYInMufJYX0sIan28DXZwXoI+4vn3iDfF92ws2p8Ae3EBYwzqVeQxM7tmQCm7+uD2BHdCZj4/BMbFedNJ3ndzTj/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773221522; c=relaxed/simple;
	bh=dpfNYs8/v4ywoMwUs7pPAurp9Qd0xMDHKhzGl2Eer6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lOEdO89nD4lwwdhPhKtkADzVZhbsfUhqfymZPAOMV/6iEyrWZtDbQecZgJSz980wJmDvYMPDKxvofAlgXniMgmRHRQ4ojt9F/Y+WFy0UMzyzsExlRhK3l9R+EEdh2sx4prvQGWIuVLCuFtOln9wJH+bSwzQz8ZSp5SfYUq4nFLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FA53165C;
	Wed, 11 Mar 2026 02:31:52 -0700 (PDT)
Received: from [10.57.83.156] (unknown [10.57.83.156])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D217A3F73B;
	Wed, 11 Mar 2026 02:31:56 -0700 (PDT)
Message-ID: <129bb66c-74fa-4795-8d79-6c8e10a66e17@arm.com>
Date: Wed, 11 Mar 2026 09:31:55 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 5/7] selftests/sched: Add SCHED_DEADLINE bandwidth
 tests to kselftest
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
 <20260306-upstream-deadline-kselftests-v1-5-2b23ef74c46a@redhat.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20260306-upstream-deadline-kselftests-v1-5-2b23ef74c46a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/6/26 16:10, Juri Lelli wrote:
> Add bandwidth admission control tests for SCHED_DEADLINE scheduler.
> These tests validate that the kernel properly enforces global bandwidth
> limits and correctly admits or rejects deadline tasks based on available
> system capacity.
> 
> The bandwidth_admission test verifies that N tasks can run
> simultaneously at the maximum available bandwidth per CPU. This maximum
> is calculated as the RT bandwidth limit minus any DL server bandwidth
> allocations, ensuring that tasks can fully utilize the available
> deadline scheduling capacity without being rejected by admission
> control.
> 
> The bandwidth_overflow test verifies that the kernel correctly rejects
> tasks that would exceed the available global bandwidth. This ensures the
> admission control mechanism prevents overcommitment of deadline
> resources, which is critical for maintaining temporal isolation and
> schedulability guarantees.
> 
> The implementation includes automatic detection of DL server bandwidth
> allocations by scanning /sys/kernel/debug/sched/*_server directories.
> This detects servers such as fair_server and any future additions,
> ensuring tests adapt automatically to system configuration changes.
> Available bandwidth is calculated by reading cpu0 configuration across
> all servers, with the assumption of symmetric systems where all CPUs
> have identical configuration.
> 
> Assisted-by: Claude Code: claude-sonnet-4-5@20250929
> Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
> ---
>  tools/testing/selftests/sched/deadline/Makefile    |   5 +-
>  tools/testing/selftests/sched/deadline/bandwidth.c | 270 +++++++++++++++++++++
>  tools/testing/selftests/sched/deadline/dl_util.c   |  73 +++++-
>  tools/testing/selftests/sched/deadline/dl_util.h   |  12 +-
>  4 files changed, 355 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/testing/selftests/sched/deadline/Makefile b/tools/testing/selftests/sched/deadline/Makefile
> index 3fb4568a59e20..daa2f5d14e947 100644
> --- a/tools/testing/selftests/sched/deadline/Makefile
> +++ b/tools/testing/selftests/sched/deadline/Makefile
> @@ -14,7 +14,7 @@ OUTPUT_DIR := $(OUTPUT)
>  UTIL_OBJS := $(OUTPUT)/dl_util.o
>  
>  # Test object files (all .c files except runner.c, dl_util.c, cpuhog.c)
> -TEST_OBJS := $(OUTPUT)/basic.o
> +TEST_OBJS := $(OUTPUT)/basic.o $(OUTPUT)/bandwidth.o
>  
>  # Runner binary links utility and test objects
>  $(OUTPUT)/runner: runner.c $(UTIL_OBJS) $(TEST_OBJS) dl_test.h | $(OUTPUT_DIR)
> @@ -32,6 +32,9 @@ $(OUTPUT)/dl_util.o: dl_util.c dl_util.h | $(OUTPUT_DIR)
>  $(OUTPUT)/basic.o: basic.c dl_test.h dl_util.h | $(OUTPUT_DIR)
>  	$(CC) $(CFLAGS) -c $< -o $@
>  
> +$(OUTPUT)/bandwidth.o: bandwidth.c dl_test.h dl_util.h | $(OUTPUT_DIR)
> +	$(CC) $(CFLAGS) -c $< -o $@
> +
>  $(OUTPUT_DIR):
>  	mkdir -p $@
>  
> diff --git a/tools/testing/selftests/sched/deadline/bandwidth.c b/tools/testing/selftests/sched/deadline/bandwidth.c
> new file mode 100644
> index 0000000000000..72755a200db22
> --- /dev/null
> +++ b/tools/testing/selftests/sched/deadline/bandwidth.c
> @@ -0,0 +1,270 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * SCHED_DEADLINE bandwidth admission control tests
> + *
> + * Validates that the kernel correctly enforces bandwidth limits for
> + * SCHED_DEADLINE tasks, including per-CPU bandwidth replication and
> + * overflow rejection.
> + */
> +
> +#define _GNU_SOURCE
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +#include <sys/types.h>
> +#include <sys/wait.h>
> +#include <signal.h>
> +#include <errno.h>
> +#include <string.h>
> +#include "dl_test.h"
> +#include "dl_util.h"
> +
> +/*
> + * Test: Bandwidth admission control with max bandwidth per CPU
> + *
> + * Verifies that SCHED_DEADLINE bandwidth is replicated per CPU, allowing
> + * one task per CPU to use the maximum available bandwidth (typically 95%).
> + */
> +static enum dl_test_status test_bandwidth_admission_run(void *ctx)
> +{
> +	uint64_t rt_runtime_us, rt_period_us;
> +	int max_bw_percent;
> +	uint64_t runtime_ns, deadline_ns, period_ns;
> +	int num_cpus, i;
> +	pid_t *pids = NULL;
> +	int started = 0, running = 0;
> +	enum dl_test_status ret = DL_TEST_FAIL;
> +
> +	/* Get RT bandwidth settings */
> +	DL_FAIL_IF(dl_get_rt_bandwidth(&rt_runtime_us, &rt_period_us) < 0,
> +		   "Failed to read RT bandwidth settings");
> +
> +	printf("  RT bandwidth: runtime=%luµs, period=%luµs (%.0f%%)\n",
> +	       rt_runtime_us, rt_period_us,
> +	       (double)rt_runtime_us * 100.0 / rt_period_us);
> +
> +	/* Show server overhead */
> +	int server_overhead = dl_get_server_bandwidth_overhead();
> +
> +	if (server_overhead > 0)
> +		printf("  DL server overhead: %d%% per CPU\n", server_overhead);
> +
> +	/* Calculate maximum bandwidth percentage */
> +	max_bw_percent = dl_calc_max_bandwidth_percent();
> +	DL_FAIL_IF(max_bw_percent < 0, "Failed to calculate max bandwidth");
> +
> +	printf("  Available bandwidth per CPU: %d%%\n", max_bw_percent);
> +
> +	/* Calculate task parameters: 100ms period for easy calculation */
> +	period_ns = dl_ms_to_ns(100);  /* 100ms */
> +	runtime_ns = (period_ns * max_bw_percent) / 100;
> +	deadline_ns = period_ns;
> +
> +	printf("  Task params: runtime=%lums, deadline=%lums, period=%lums\n",
> +	       dl_ns_to_ms(runtime_ns), dl_ns_to_ms(deadline_ns),
> +	       dl_ns_to_ms(period_ns));
> +
> +	/* Get number of CPUs */
> +	num_cpus = dl_get_online_cpus();
> +	DL_FAIL_IF(num_cpus <= 0, "Failed to get number of CPUs");
> +
> +	printf("  Number of online CPUs: %d\n", num_cpus);
> +
> +	/* Allocate PID array */
> +	pids = calloc(num_cpus, sizeof(pid_t));
> +	DL_FAIL_IF(!pids, "Failed to allocate PID array");
> +
> +	/* Start one cpuhog per CPU at max bandwidth */
> +	printf("  Starting %d cpuhog tasks at max bandwidth...\n", num_cpus);
> +
> +	for (i = 0; i < num_cpus; i++) {
> +		pids[i] = dl_create_cpuhog(runtime_ns, deadline_ns, period_ns, 0);
> +		if (pids[i] < 0) {
> +			printf("  Task %d failed to start: %s\n",
> +			       i + 1, strerror(errno));
> +			goto cleanup;
> +		}
> +		started++;
> +	}

Would it be okay to just have one task per max-cap CPU to make this pass on HMP?
Or something more sophisticated?

> +
> +	/* Brief wait for tasks to settle */
> +	usleep(500000);  /* 500ms */
> +
> +	/* Verify all tasks are running with SCHED_DEADLINE */
> +	for (i = 0; i < started; i++) {
> +		if (pids[i] <= 0)
> +			continue;
> +
> +		if (kill(pids[i], 0) < 0) {
> +			printf("  Task PID %d died unexpectedly\n", pids[i]);
> +			continue;
> +		}
> +
> +		if (dl_is_deadline_task(pids[i]))
> +			running++;
> +	}
> +
> +	printf("  Started %d/%d tasks, %d running with SCHED_DEADLINE\n",
> +	       started, num_cpus, running);
> +
> +	/* Test passes if we started all N tasks and they're all running */
> +	if (started == num_cpus && running == num_cpus) {
> +		printf("  SUCCESS: All %d tasks running at max bandwidth\n",
> +		       num_cpus);
> +		ret = DL_TEST_PASS;
> +	} else if (started != num_cpus) {
> +		DL_ERR("Only started %d/%d tasks", started, num_cpus);
> +		ret = DL_TEST_FAIL;
> +	} else {
> +		DL_ERR("Started %d tasks but only %d using SCHED_DEADLINE",
> +		       started, running);
> +		ret = DL_TEST_FAIL;
> +	}
> +
> +cleanup:
> +	/* Cleanup all started tasks */
> +	for (i = 0; i < started; i++) {
> +		if (pids[i] > 0)
> +			dl_cleanup_cpuhog(pids[i]);
> +	}
> +
> +	free(pids);
> +	return ret;
> +}
> +
> +static struct dl_test test_bandwidth_admission = {
> +	.name = "bandwidth_admission",
> +	.description = "Verify per-CPU bandwidth replication (N tasks at max bandwidth)",
> +	.run = test_bandwidth_admission_run,
> +};
> +REGISTER_DL_TEST(&test_bandwidth_admission);
> +
> +/*
> + * Test: Bandwidth admission control overflow rejection
> + *
> + * Verifies that the kernel rejects tasks that would exceed available
> + * bandwidth on a CPU. Creates N-1 tasks at max bandwidth, then attempts
> + * to create one more at slightly higher bandwidth (should fail).
> + */
> +static enum dl_test_status test_bandwidth_overflow_run(void *ctx)
> +{
> +	uint64_t rt_runtime_us, rt_period_us;
> +	int max_bw_percent;
> +	uint64_t runtime_ns, deadline_ns, period_ns;
> +	uint64_t overflow_runtime_ns;
> +	int num_cpus, i;
> +	int target_tasks;
> +	pid_t *pids = NULL;
> +	pid_t overflow_pid;
> +	int started = 0;
> +	enum dl_test_status ret = DL_TEST_FAIL;
> +
> +	/* Get RT bandwidth settings */
> +	DL_FAIL_IF(dl_get_rt_bandwidth(&rt_runtime_us, &rt_period_us) < 0,
> +		   "Failed to read RT bandwidth settings");
> +
> +	printf("  RT bandwidth: runtime=%luµs, period=%luµs (%.0f%%)\n",
> +	       rt_runtime_us, rt_period_us,
> +	       (double)rt_runtime_us * 100.0 / rt_period_us);
> +
> +	/* Show server overhead */
> +	int server_overhead = dl_get_server_bandwidth_overhead();
> +
> +	if (server_overhead > 0)
> +		printf("  DL server overhead: %d%% per CPU\n", server_overhead);
> +
> +	/* Calculate maximum bandwidth percentage */
> +	max_bw_percent = dl_calc_max_bandwidth_percent();
> +	DL_FAIL_IF(max_bw_percent < 0, "Failed to calculate max bandwidth");
> +
> +	printf("  Available bandwidth per CPU: %d%%\n", max_bw_percent);
> +
> +	/* Get number of CPUs */
> +	num_cpus = dl_get_online_cpus();
> +	DL_FAIL_IF(num_cpus <= 0, "Failed to get number of CPUs");
> +
> +	if (num_cpus < 2) {
> +		printf("  Need at least 2 CPUs for this test (have %d)\n",
> +		       num_cpus);
> +		return DL_TEST_SKIP;
> +	}
> +
> +	printf("  Number of online CPUs: %d\n", num_cpus);
> +
> +	/* Calculate task parameters */
> +	period_ns = dl_ms_to_ns(100);  /* 100ms */
> +	runtime_ns = (period_ns * max_bw_percent) / 100;
> +	deadline_ns = period_ns;
> +
> +	printf("  Task params: runtime=%lums, deadline=%lums, period=%lums\n",
> +	       dl_ns_to_ms(runtime_ns), dl_ns_to_ms(deadline_ns),
> +	       dl_ns_to_ms(period_ns));
> +
> +	/* Start N-1 tasks at max bandwidth */
> +	target_tasks = num_cpus - 1;
> +	pids = calloc(target_tasks, sizeof(pid_t));
> +	DL_FAIL_IF(!pids, "Failed to allocate PID array");
> +
> +	printf("  Starting %d tasks at max bandwidth...\n", target_tasks);
> +
> +	for (i = 0; i < target_tasks; i++) {
> +		pids[i] = dl_create_cpuhog(runtime_ns, deadline_ns, period_ns, 0);
> +		if (pids[i] < 0) {
> +			printf("  Task %d failed to start: %s\n",
> +			       i + 1, strerror(errno));
> +			goto cleanup;
> +		}
> +		started++;
> +	}
> +
> +	printf("  Successfully started %d/%d tasks\n", started, target_tasks);
> +
> +	/* Brief wait */
> +	usleep(500000);  /* 500ms */
> +
> +	/* Try to start one more task at max+1% bandwidth (should fail) */
> +	overflow_runtime_ns = (runtime_ns * 101) / 100;  /* Add 1% */
> +
> +	printf("  Attempting overflow task with runtime=%lums (+1%%)...\n",
> +	       dl_ns_to_ms(overflow_runtime_ns));
> +
> +	overflow_pid = dl_create_cpuhog(overflow_runtime_ns, deadline_ns,
> +					period_ns, 0);
> +
> +	if (overflow_pid < 0) {
> +		/* Expected: admission control rejected it */
> +		printf("  Overflow task correctly rejected: %s\n",
> +		       strerror(errno));
> +		ret = DL_TEST_PASS;
> +	} else {
> +		/* Unexpected: it was admitted */
> +		usleep(100000);  /* 100ms */
> +
> +		if (kill(overflow_pid, 0) == 0) {
> +			printf("  ERROR: Overflow task admitted and running\n");
> +			dl_cleanup_cpuhog(overflow_pid);
> +			ret = DL_TEST_FAIL;
> +		} else {
> +			/* It was admitted but died - still wrong */
> +			printf("  ERROR: Overflow task admitted but died\n");
> +			ret = DL_TEST_FAIL;
> +		}
> +	}
> +
> +cleanup:
> +	/* Cleanup all tasks */
> +	for (i = 0; i < started; i++) {
> +		if (pids[i] > 0)
> +			dl_cleanup_cpuhog(pids[i]);
> +	}
> +
> +	free(pids);
> +	return ret;
> +}
> +
> +static struct dl_test test_bandwidth_overflow = {
> +	.name = "bandwidth_overflow",
> +	.description = "Verify bandwidth overflow rejection (N-1 + overflow fails)",
> +	.run = test_bandwidth_overflow_run,
> +};
> +REGISTER_DL_TEST(&test_bandwidth_overflow);
> diff --git a/tools/testing/selftests/sched/deadline/dl_util.c b/tools/testing/selftests/sched/deadline/dl_util.c
> index 0d7c46ba877f3..6727d622d72d3 100644
> --- a/tools/testing/selftests/sched/deadline/dl_util.c
> +++ b/tools/testing/selftests/sched/deadline/dl_util.c
> @@ -14,6 +14,8 @@
>  #include <sys/wait.h>
>  #include <signal.h>
>  #include <time.h>
> +#include <glob.h>
> +#include <dirent.h>
>  #include "dl_util.h"
>  
>  /* Syscall numbers for sched_setattr/sched_getattr */
> @@ -121,10 +123,65 @@ int dl_get_rt_bandwidth(uint64_t *runtime_us, uint64_t *period_us)
>  				period_us);
>  }
>  
> +int dl_get_server_bandwidth_overhead(void)
> +{
> +	glob_t globbuf;
> +	char pattern[512];
> +	size_t i;
> +	int total_overhead = 0;
> +
> +	/* Find all *_server directories */
> +	snprintf(pattern, sizeof(pattern),
> +		 "/sys/kernel/debug/sched/*_server");
> +
> +	if (glob(pattern, 0, NULL, &globbuf) != 0) {
> +		/* No servers found - not an error, just no overhead */
> +		return 0;
> +	}
> +
> +	/*
> +	 * Sum overhead from cpu0 across all servers.
> +	 * Assumes symmetric system where all CPUs have identical server
> +	 * configuration. Reading only cpu0 represents the per-CPU overhead.
> +	 */
> +	for (i = 0; i < globbuf.gl_pathc; i++) {
> +		char runtime_path[512];
> +		char period_path[512];
> +		char *server_path = globbuf.gl_pathv[i];
> +		uint64_t runtime_ns = 0, period_ns = 0;
> +		int percent;
> +
> +		/* Build paths to cpu0 runtime and period files */
> +		snprintf(runtime_path, sizeof(runtime_path),
> +			 "%s/cpu0/runtime", server_path);
> +		snprintf(period_path, sizeof(period_path),
> +			 "%s/cpu0/period", server_path);
> +
> +		/* Read runtime and period for cpu0 */
> +		if (read_proc_uint64(runtime_path, &runtime_ns) < 0)
> +			continue;
> +		if (read_proc_uint64(period_path, &period_ns) < 0)
> +			continue;
> +
> +		if (period_ns == 0)
> +			continue;
> +
> +		/* Calculate percentage for this server */
> +		percent = (runtime_ns * 100) / period_ns;
> +
> +		/* Accumulate overhead from all servers */
> +		total_overhead += percent;
> +	}
> +
> +	globfree(&globbuf);
> +	return total_overhead;
> +}
> +
>  int dl_calc_max_bandwidth_percent(void)
>  {
>  	uint64_t runtime_us, period_us;
> -	int percent;
> +	int rt_percent, server_overhead;
> +	int available_percent;
>  
>  	if (dl_get_rt_bandwidth(&runtime_us, &period_us) < 0)
>  		return -1;
> @@ -132,8 +189,18 @@ int dl_calc_max_bandwidth_percent(void)
>  	if (period_us == 0)
>  		return -1;
>  
> -	percent = (runtime_us * 100) / period_us;
> -	return percent > 0 ? percent : 1;
> +	/* Calculate RT bandwidth percentage */
> +	rt_percent = (runtime_us * 100) / period_us;
> +
> +	/* Get server overhead */
> +	server_overhead = dl_get_server_bandwidth_overhead();
> +	if (server_overhead < 0)
> +		server_overhead = 0;
> +
> +	/* Available bandwidth = RT bandwidth - server overhead */
> +	available_percent = rt_percent - server_overhead;
> +
> +	return available_percent > 0 ? available_percent : 1;
>  }
>  
>  /*
> diff --git a/tools/testing/selftests/sched/deadline/dl_util.h b/tools/testing/selftests/sched/deadline/dl_util.h
> index 9ab9d055a95a0..f8046eb0cbd3b 100644
> --- a/tools/testing/selftests/sched/deadline/dl_util.h
> +++ b/tools/testing/selftests/sched/deadline/dl_util.h
> @@ -79,11 +79,21 @@ bool dl_is_deadline_task(pid_t pid);
>   */
>  int dl_get_rt_bandwidth(uint64_t *runtime_us, uint64_t *period_us);
>  
> +/**
> + * dl_get_server_bandwidth_overhead() - Calculate total DL server overhead per CPU
> + *
> + * Scans /sys/kernel/debug/sched/ for server directories (fair_server, etc.) and
> + * calculates the total bandwidth reserved by all DL servers per CPU.
> + *
> + * Return: Bandwidth percentage overhead per CPU (0-100), or -1 on error
> + */
> +int dl_get_server_bandwidth_overhead(void);
> +
>  /**
>   * dl_calc_max_bandwidth_percent() - Calculate available bandwidth percentage
>   *
>   * Calculates the maximum bandwidth available per CPU as a percentage,
> - * based on RT bandwidth settings.
> + * based on RT bandwidth settings minus DL server overhead (fair_server, etc.).
>   *
>   * Return: Bandwidth percentage (0-100), or -1 on error
>   */
> 

