Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805E7369974;
	Wed, 18 Mar 2026 07:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773818138; cv=none; b=d4vJOgyEiZ7ZvGne6ipUl876aFbYMsL63OEUJymCkJMlLEHdlZ6VlBvTEyg3EjSyLo2fYxIvyNI/bgynB81FkE8LbHJ0zzPgG7y9uCpiM1X2FsTI8Z6XQ/4y8uLrlxii/XTNFpNMobiE4eHhHYgSujvjPc3+i5vwM/RKGvFxl8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773818138; c=relaxed/simple;
	bh=HA57TZoe4kUHc2+bGmz45ludm6iUpxni9mm++DOzFxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q85Mfbl73Gt8Rbi1XcUerOnscaCLcasMCPzYfLe1EvL0pzjLbI4SzwEwdQxp5w9Pb8HWKsjYbYkNqDmogw1iDPa4VJqoIki7eoXLQgyeEkOJGaN30yG2Zw307ve+QBmI7cHTH+iMPb9JedePsEM9dIleUWP75DwOhwSf1zbmMpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T9cufFL5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T9cufFL5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7960C19421;
	Wed, 18 Mar 2026 07:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773818138;
	bh=HA57TZoe4kUHc2+bGmz45ludm6iUpxni9mm++DOzFxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T9cufFL5XjwyV8VXoZUq2Dftqo/gLYu5x7FdiDrcQd3PhMf4B3ZtRpskY4DrsJJf6
	 BzCUja/lf6wGuGhbSazOGuLsVkWXa/rlQpcfrcIEAeKNMCscbjfjpXws473vaOElIR
	 dUGryHxVz5asQsZwiGhc1D6dCqiHeq88gfVDNuslgWqkGi5lQQP8IVrAkZwPBnuL5F
	 AhbCCG3Pb0ZuzyCND91nwa/v0KsO7/pMp9TVbz/MsRydZlXlpZzvL3B1q/mO2hx5eH
	 6FFpKCA3y0F3bJuNjTkXh0pt0lztkIS9GX5nJZLKi8yykdnUkdfdCeeEllMbdSx2xx
	 /+XFAKcy+FeMA==
Date: Wed, 18 Mar 2026 09:15:31 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 1/6] selftests/liveupdate: add framework for memfd tests
Message-ID: <abpRE6cfsyuoeiiq@kernel.org>
References: <20260309115441.266805-1-pratyush@kernel.org>
 <20260309115441.266805-2-pratyush@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309115441.266805-2-pratyush@kernel.org>

On Mon, Mar 09, 2026 at 11:54:34AM +0000, Pratyush Yadav wrote:
> From: "Pratyush Yadav (Google)" <pratyush@kernel.org>
> 
> Currently memfd preservation using LUO is only tested indirectly via the
> luo_multi_session or luo_kexec_simple tests. Their main purpose is to
> test other live update functionality.
> 
> Add a framework for writing memfd tests. The framework hooks into the
> kselftest harness, but adds some things on top to make it suitable for
> live update.
> 
> The LUO FD (/dev/liveupdate) can only be opened by one process at a
> time. Each test runs in its own process. This means the LUO FD must be
> owned by the main process and shared to children. main() opens the LUO
> FD and shares it to child runners using a global variable.
> 
> Live update tests run in two stages. One before kexec and one after.
> Detect the stage using a special state session. If the session is
> present, it means the test is in post-kexec state.
> 
> Additionally, take in an optional --stage argument that lets callers
> specify expected stage. This is useful as a safety net to catch LUO core
> failures. If LUO core fails to preserve the state session properly, this
> option can help detect this and fail early. Since the option is not
> recognized by the kselftest harness, remove it from argv before calling
> test_harness_run().
> 
> Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

with a few nits below.

> ---
>  tools/testing/selftests/liveupdate/Makefile   |  1 +
>  .../testing/selftests/liveupdate/luo_memfd.c  | 77 +++++++++++++++++++
>  2 files changed, 78 insertions(+)
>  create mode 100644 tools/testing/selftests/liveupdate/luo_memfd.c
> 
> diff --git a/tools/testing/selftests/liveupdate/Makefile b/tools/testing/selftests/liveupdate/Makefile
> index 080754787ede..051daae55eec 100644
> --- a/tools/testing/selftests/liveupdate/Makefile
> +++ b/tools/testing/selftests/liveupdate/Makefile
> @@ -6,6 +6,7 @@ TEST_GEN_PROGS += liveupdate
>  
>  TEST_GEN_PROGS_EXTENDED += luo_kexec_simple
>  TEST_GEN_PROGS_EXTENDED += luo_multi_session
> +TEST_GEN_PROGS_EXTENDED += luo_memfd
>  
>  TEST_FILES += do_kexec.sh
>  
> diff --git a/tools/testing/selftests/liveupdate/luo_memfd.c b/tools/testing/selftests/liveupdate/luo_memfd.c
> new file mode 100644
> index 000000000000..b779eee18387
> --- /dev/null
> +++ b/tools/testing/selftests/liveupdate/luo_memfd.c
> @@ -0,0 +1,77 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Copyright (c) 2026, Google LLC.
> + * Pratyush Yadav (Google) <pratyush@kernel.org>
> + */
> +
> +/*
> + * Selftests for memfd preservation via LUO.
> + */
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <string.h>
> +#include <sys/ioctl.h>
> +#include <unistd.h>
> +
> +#include <linux/liveupdate.h>
> +
> +#include "../kselftest.h"
> +#include "../kselftest_harness.h"
> +
> +#include "luo_test_utils.h"
> +
> +#define STATE_SESSION_NAME "luo-state"
> +#define STATE_MEMFD_TOKEN 1
> +
> +#define LIVEUPDATE_DEV "/dev/liveupdate"
> +static int luo_fd = -1, stage;

Nit: declaring stage on a separate line is a bit clearer.

> +
> +int main(int argc, char *argv[])
> +{
> +	int session, expected_stage = 0;

Ditto.

> +
> +	/*
> +	 * The test takes an optional --stage argument. This lets callers
> +	 * provide the expected stage, and if that doesn't match the test errors
> +	 * out.
> +	 *
> +	 * Look for the stage. Since test_harness_run() doesn't recognize it,
> +	 * once found, remove it from argv.
> +	 */
> +	for (int i = 1; i < argc; i++) {
> +		if (strcmp(argv[i], "--stage") == 0) {
> +			if (i + 1 < argc) {
> +				expected_stage = atoi(argv[i + 1]);
> +				memmove(&argv[i], &argv[i + 2], (argc - i - 1) * sizeof(char *));
> +				argc -= 2;
> +				i--;
> +			} else {
> +				ksft_exit_fail_msg("Option --stage requires an argument\n");
> +			}
> +		}
> +	}
> +
> +	luo_fd = luo_open_device();
> +	if (luo_fd < 0)
> +		ksft_exit_skip("Failed to open %s (%s). Is the luo module loaded?\n",

LUO can't be a module :) Maybe

"Is LUO enabled in the kernel?"


> +			       strerror(errno), LUO_DEVICE);
> +
> +	session = luo_retrieve_session(luo_fd, STATE_SESSION_NAME);
> +	if (session == -ENOENT)
> +		stage = 1;
> +	else if (session >= 0)
> +		stage = 2;
> +	else
> +		fail_exit("Failed to check for state session");

There is ksft_exit_fail_perror(), would be more consistent with other exit
paths.

> +
> +	if (expected_stage && expected_stage != stage)
> +		ksft_exit_fail_msg("Stage mismatch: expected %d, got %d\n",
> +				   expected_stage, stage);
> +
> +	if (stage == 1)
> +		create_state_file(luo_fd, STATE_SESSION_NAME, STATE_MEMFD_TOKEN, 2);
> +
> +	test_harness_run(argc, argv);
> +}
> -- 
> 2.53.0.473.g4a7958ca14-goog
> 

-- 
Sincerely yours,
Mike.
