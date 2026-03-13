Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB773806BB;
	Fri, 13 Mar 2026 10:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773396357; cv=none; b=gjm0WlbO5ZOOcmat5+fj8YAFbk3RLttOcgdJ3pE7u1wXgOJHe4RZ3Ppj9UF12ne/fWICL43HlNjn+0qMGQ4t0RY6KXGEEhoZ0V8/c6LKOqlLeZPg144Jv7bo4xZ/0gWsz2aLzW02h50J6A1sS1KseGUaYr88vKvHqGe8Pb75JPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773396357; c=relaxed/simple;
	bh=aVjfpNlCAnDLl1tYf6aaIB1a5oJJV9l2khNsC6sGWFA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ue5wzTS6zMSI7LCpDmWZ+DVXRPe68sVHWmnyphvdxGrtxtGX7aDt5dWr6dyeomswGHVy806J+1ljfKsGLMdefu9B/ZOj/TwArUGnsNkDZhNKNpn5KMwmMdDhJVQ0Ib4jZTeMb1CxDqXh0SBJLhSEy1z9TA6hpIHtwimp6Fa2mok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GY9H471s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GY9H471s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E45E1C19421;
	Fri, 13 Mar 2026 10:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773396356;
	bh=aVjfpNlCAnDLl1tYf6aaIB1a5oJJV9l2khNsC6sGWFA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GY9H471sDgZY1DAiyWi+rI1xxC2fP6YbtuTjzgp/AZUxg5153tVgre8WPJHW9IwAJ
	 VASw7NexVjHYb6iw+Cqbfw7J6QRGKkjdspazh1Uk2nd2+RchynXcpvI8COKe09nODm
	 hucV1CZCzT/rmLAVNke21rylcZt/SRaSfwVMw4cGHiaWYCcjKi8bCaHF6U+WgQeC0p
	 48Db2xsy0FNZ4i32SSeYWXia9Gp7H8xLCH1FPx0I+3FMsPziQ4vdjVk1fXxDZCIzNv
	 SMFjRvYJ1r/x1/aRBaIq21T5V0oZuFzi2KSq6y5PSD80JqCAP5xxPQh2hqO5Spf2BZ
	 24BnAC2yLGv9w==
From: Pratyush Yadav <pratyush@kernel.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  Mike Rapoport <rppt@kernel.org>,  Shuah Khan
 <shuah@kernel.org>,  Andrew Morton <akpm@linux-foundation.org>,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  linux-mm@kvack.org
Subject: Re: [PATCH 1/6] selftests/liveupdate: add framework for memfd tests
In-Reply-To: <20260310110847.3519998-1-usama.arif@linux.dev> (Usama Arif's
	message of "Tue, 10 Mar 2026 04:08:45 -0700")
References: <20260310110847.3519998-1-usama.arif@linux.dev>
Date: Fri, 13 Mar 2026 10:05:53 +0000
Message-ID: <2vxzldfwf3i6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Mar 10 2026, Usama Arif wrote:

> On Mon,  9 Mar 2026 11:54:34 +0000 Pratyush Yadav <pratyush@kernel.org> wrote:
[...]
>> diff --git a/tools/testing/selftests/liveupdate/luo_memfd.c b/tools/testing/selftests/liveupdate/luo_memfd.c
>> new file mode 100644
>> index 000000000000..b779eee18387
>> --- /dev/null
>> +++ b/tools/testing/selftests/liveupdate/luo_memfd.c
>> @@ -0,0 +1,77 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +/*
>> + * Copyright (c) 2026, Google LLC.
>> + * Pratyush Yadav (Google) <pratyush@kernel.org>
>> + */
>> +
>> +/*
>> + * Selftests for memfd preservation via LUO.
>> + */
>> +
>> +#include <errno.h>
>> +#include <fcntl.h>
>> +#include <string.h>
>> +#include <sys/ioctl.h>
>> +#include <unistd.h>
>> +
>> +#include <linux/liveupdate.h>
>> +
>> +#include "../kselftest.h"
>> +#include "../kselftest_harness.h"
>> +
>> +#include "luo_test_utils.h"
>> +
>> +#define STATE_SESSION_NAME "luo-state"
>> +#define STATE_MEMFD_TOKEN 1
>> +
>> +#define LIVEUPDATE_DEV "/dev/liveupdate"
>
> Hello!
>
> LIVEUPDATE_DEV doesn't seem to be used anywhere?

Right. This is a leftover from development. Will drop.

>
>> +static int luo_fd = -1, stage;
>> +
>> +int main(int argc, char *argv[])
>> +{
>> +	int session, expected_stage = 0;
>> +
>> +	/*
>> +	 * The test takes an optional --stage argument. This lets callers
>> +	 * provide the expected stage, and if that doesn't match the test errors
>> +	 * out.
>> +	 *
>> +	 * Look for the stage. Since test_harness_run() doesn't recognize it,
>> +	 * once found, remove it from argv.
>> +	 */
>> +	for (int i = 1; i < argc; i++) {
>> +		if (strcmp(argv[i], "--stage") == 0) {
>> +			if (i + 1 < argc) {
>> +				expected_stage = atoi(argv[i + 1]);
>> +				memmove(&argv[i], &argv[i + 2], (argc - i - 1) * sizeof(char *));
>> +				argc -= 2;
>> +				i--;
>> +			} else {
>> +				ksft_exit_fail_msg("Option --stage requires an argument\n");
>> +			}
>> +		}
>> +	}
>> +
>> +	luo_fd = luo_open_device();
>> +	if (luo_fd < 0)
>> +		ksft_exit_skip("Failed to open %s (%s). Is the luo module loaded?\n",
>> +			       strerror(errno), LUO_DEVICE);
>
> Need to reverse strerror(errno) and LUO_DEVICE?

Will fix. Thanks.

>
>> +
>> +	session = luo_retrieve_session(luo_fd, STATE_SESSION_NAME);
>> +	if (session == -ENOENT)
>> +		stage = 1;
>> +	else if (session >= 0)
>> +		stage = 2;
>> +	else
>> +		fail_exit("Failed to check for state session");
>> +
>> +	if (expected_stage && expected_stage != stage)
>> +		ksft_exit_fail_msg("Stage mismatch: expected %d, got %d\n",
>> +				   expected_stage, stage);
>> +
>> +	if (stage == 1)
>> +		create_state_file(luo_fd, STATE_SESSION_NAME, STATE_MEMFD_TOKEN, 2);
>> +
>> +	test_harness_run(argc, argv);
>> +}
>> -- 
>> 2.53.0.473.g4a7958ca14-goog
>> 
>> 

-- 
Regards,
Pratyush Yadav
