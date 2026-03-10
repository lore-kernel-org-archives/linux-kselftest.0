Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629483803CD
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 11:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773140948; cv=none; b=uI9uKF+YeRkIh2XnF/+HAgVj9MjH51jqKUF5Dl8/zuAz1GEYBI+XVXhcJZyiZW7ZAezxrRzMDVwgTcqLFfMQPOrmDzKynxKmaLR3bPkhoyzdBrcpdutd4pDC/OvFkljaCI8md/mBcuMxWJ4NkeugTHYRp/lJKcIfML/pNdbx9v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773140948; c=relaxed/simple;
	bh=g48GF67Ehta5FNQcdaDnQ80OaoqHQXeDa3iRqDqmCmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O9J2L3hiv5P4qu264l78yqfrhY4pTJzU0y4oFIfkLGf50pl/ULoGNJaIRDhbUrbbKLWfkhD7zv7oP0WbZX//aUnLBANfhkpikh30ZkJWpc26HpnyLkW7r2DMxSoyAb0/qguogv0fbuVXICylYEjb/i67IFtMNIGRN7gOuTsvtWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=M+9SDae3; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="M+9SDae3"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773140935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BqjOCzwoh4qQ8R2n79BwXderUht8dH1U1qDDXCtHGrw=;
	b=M+9SDae3wrDlhJznygoVI+mezWPeZgLNg2T2DAmqqp+bXNykFhLYIpZPQ/DYnhV69B6CdR
	8GePTwOIxmaaxiTxeiaRy23ca37K1uI9M7ztwTcD8j6eMjhP8FxM9Bx6kwzZq6vJhPz9EG
	olRAvEk/6Elb6ZjojNeA4gwo+shnqO8=
From: Usama Arif <usama.arif@linux.dev>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Usama Arif <usama.arif@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 1/6] selftests/liveupdate: add framework for memfd tests
Date: Tue, 10 Mar 2026 04:08:45 -0700
Message-ID: <20260310110847.3519998-1-usama.arif@linux.dev>
In-Reply-To: <20260309115441.266805-2-pratyush@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On Mon,  9 Mar 2026 11:54:34 +0000 Pratyush Yadav <pratyush@kernel.org> wrote:

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

Hello!

LIVEUPDATE_DEV doesn't seem to be used anywhere?

> +static int luo_fd = -1, stage;
> +
> +int main(int argc, char *argv[])
> +{
> +	int session, expected_stage = 0;
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
> +			       strerror(errno), LUO_DEVICE);

Need to reverse strerror(errno) and LUO_DEVICE?

> +
> +	session = luo_retrieve_session(luo_fd, STATE_SESSION_NAME);
> +	if (session == -ENOENT)
> +		stage = 1;
> +	else if (session >= 0)
> +		stage = 2;
> +	else
> +		fail_exit("Failed to check for state session");
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
> 
