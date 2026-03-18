Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3281B27E07E;
	Wed, 18 Mar 2026 07:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773819066; cv=none; b=EOO8PON5q21tnCN+xbQAUVddY07A1T9borEqevPfsBwi1IcNcJ5W2naMJxytzICneTJMGSH0zrP5Czj2e2cFOeJxDx7exIcz2hdP6j3d6r098/CMjbx7Rm/Vuua/lTFK7aDQIyC9zjU3zEOUrDQAD1T2TjHjzGXsWWpiRdhDWTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773819066; c=relaxed/simple;
	bh=7Cp5F5RAPtltpaduI57no0pNJvzvNkLMFYL3EGRzLZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WpzBPsWpXMLvPsrFpxo5qUGOOuQSFCC0cfgroFR8SmNTgEr46CtHQ1GKCf5TiA6JqUKQF8TwMTF00yRjXx3UbUnqtX8ObUwVSu924irEgPPa/EMZAdwE89zc2Tx/LFntspv5lafxmspBwraxd7EH7DHw+bGezu02IFo0orQ6odY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KsR1dFWJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KsR1dFWJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC8FCC19421;
	Wed, 18 Mar 2026 07:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773819065;
	bh=7Cp5F5RAPtltpaduI57no0pNJvzvNkLMFYL3EGRzLZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KsR1dFWJc6c/kpJkTR1cHeJ1sTGbTJQ5h0GXlUdBGSWEwmar8ygPoi5v4llJt9lUD
	 3mzxJSLkNSHX514tvqlOgnQp32jd4+WROa0gAqqwmFiBqh8v7A4+l5EdZlJonCHeLu
	 BKOTjPJHJgzuYCeCTH4wRbSa2Qhdie0u7sqjzuEkO2+ikyOt+b9XfSNcNzO8BBzZHy
	 TDfhgzxzwrttCFsoESxU1qHo3FStNpkD/pTnVjLpwMzriYglTdZ9GDS7ZzZ5u+91S5
	 TsqI+XZSiasjFKZ++KL7StsGQzZzOKRILfFvcJ9Ku90SEdBDFzwPHuXCWsUIsjbB0g
	 uW7teinKgSxEg==
Date: Wed, 18 Mar 2026 09:31:00 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 3/6] selftests/liveupdate: add test for memfd content
 preservation
Message-ID: <abpUtCd1-MGL1O4p@kernel.org>
References: <20260309115441.266805-1-pratyush@kernel.org>
 <20260309115441.266805-4-pratyush@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309115441.266805-4-pratyush@kernel.org>

On Mon, Mar 09, 2026 at 11:54:36AM +0000, Pratyush Yadav wrote:
> From: "Pratyush Yadav (Google)" <pratyush@kernel.org>
> 
> Add a selftest that makes sure the contents of a memfd are correctly
> preserved across a live update. In stage 1, create a memfd and fill it
> with random data, and preserve it. Save the random data to the file
> system. This will be used by stage 2 to verify the contents are correct.

There's a small caveat here, as some CI systems put selftests in tmpfs, so
creating a file there won't really help.
I think there should be a skip if the test runs of tmpfs. 
 
> In stage 2, retrieve the memfd and compare its contents with the
> contents saved on the file system.
> 
> Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
> Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
> ---
>  tools/testing/selftests/liveupdate/Makefile   |  1 +
>  .../testing/selftests/liveupdate/luo_memfd.c  | 61 +++++++++++++++++++
>  2 files changed, 62 insertions(+)
> 
> diff --git a/tools/testing/selftests/liveupdate/Makefile b/tools/testing/selftests/liveupdate/Makefile
> index 051daae55eec..8e2eb6500c07 100644
> --- a/tools/testing/selftests/liveupdate/Makefile
> +++ b/tools/testing/selftests/liveupdate/Makefile
> @@ -13,6 +13,7 @@ TEST_FILES += do_kexec.sh
>  include ../lib.mk
>  
>  CFLAGS += $(KHDR_INCLUDES)
> +CFLAGS += -I$(top_srcdir)/tools/include
>  CFLAGS += -Wall -O2 -Wno-unused-function
>  CFLAGS += -MD
>  
> diff --git a/tools/testing/selftests/liveupdate/luo_memfd.c b/tools/testing/selftests/liveupdate/luo_memfd.c
> index b779eee18387..52b5f6b16e19 100644
> --- a/tools/testing/selftests/liveupdate/luo_memfd.c
> +++ b/tools/testing/selftests/liveupdate/luo_memfd.c
> @@ -3,6 +3,9 @@
>  /*
>   * Copyright (c) 2026, Google LLC.
>   * Pratyush Yadav (Google) <pratyush@kernel.org>
> + *
> + * Copyright (C) 2025 Amazon.com Inc. or its affiliates.
> + * Pratyush Yadav <ptyadav@amazon.de>
>   */
>  
>  /*
> @@ -11,11 +14,14 @@
>  
>  #include <errno.h>
>  #include <fcntl.h>
> +#include <stdlib.h>
>  #include <string.h>
>  #include <sys/ioctl.h>
> +#include <sys/mman.h>
>  #include <unistd.h>
>  
>  #include <linux/liveupdate.h>
> +#include <linux/sizes.h>
>  
>  #include "../kselftest.h"
>  #include "../kselftest_harness.h"
> @@ -25,9 +31,64 @@
>  #define STATE_SESSION_NAME "luo-state"
>  #define STATE_MEMFD_TOKEN 1
>  
> +#define MEMFD_DATA_SESSION_NAME "memfd_data_session"
> +#define MEMFD_DATA_TOKEN 1
> +#define MEMFD_DATA_BUFFER_SIZE SZ_1M
> +#define RANDOM_DATA_FILE "luo_random_data.bin"

Reads to me like a random file containing data :)
Something like FILESYSTEM_DATA_COPY would better express the meaning.

> +
>  #define LIVEUPDATE_DEV "/dev/liveupdate"
>  static int luo_fd = -1, stage;
>  
> +/*
> + * Test that a memfd with its data is preserved across live update.
> + */
> +TEST(memfd_data)
> +{
> +	int fd, session;
> +	char *buffer;
> +	struct liveupdate_session_preserve_fd preserve_arg = { .size = sizeof(preserve_arg) };
> +	struct liveupdate_session_retrieve_fd retrieve_arg = { .size = sizeof(retrieve_arg) };
> +
> +	buffer = malloc(MEMFD_DATA_BUFFER_SIZE);
> +	ASSERT_NE(buffer, NULL);
> +
> +	switch (stage) {
> +	case 1:

Can we please move each state to a helper function?

> +		session = luo_create_session(luo_fd, MEMFD_DATA_SESSION_NAME);
> +		ASSERT_GE(session, 0);
> +
> +		fd = create_random_memfd("memfd_data", buffer, MEMFD_DATA_BUFFER_SIZE);
> +		ASSERT_GE(fd, 0);
> +
> +		ASSERT_EQ(save_test_data(RANDOM_DATA_FILE, buffer, MEMFD_DATA_BUFFER_SIZE), 0);
> +
> +		preserve_arg.fd = fd;
> +		preserve_arg.token = MEMFD_DATA_TOKEN;
> +		ASSERT_GE(ioctl(session, LIVEUPDATE_SESSION_PRESERVE_FD, &preserve_arg), 0);
> +
> +		daemonize_and_wait();
> +		break;
> +	case 2:
> +		session = luo_retrieve_session(luo_fd, MEMFD_DATA_SESSION_NAME);
> +		ASSERT_GE(session, 0);
> +
> +		ASSERT_EQ(load_test_data(RANDOM_DATA_FILE, buffer, MEMFD_DATA_BUFFER_SIZE), 0);
> +
> +		retrieve_arg.token = MEMFD_DATA_TOKEN;
> +		ASSERT_GE(ioctl(session, LIVEUPDATE_SESSION_RETRIEVE_FD, &retrieve_arg), 0);
> +		fd = retrieve_arg.fd;
> +		ASSERT_GE(fd, 0);
> +
> +		ASSERT_EQ(verify_fd_content(fd, buffer, MEMFD_DATA_BUFFER_SIZE), 0);
> +
> +		ASSERT_EQ(luo_session_finish(session), 0);
> +		break;


> +	default:
> +		TH_LOG("Unknown stage %d\n", stage);
> +		ASSERT_FALSE(true);
> +	}
> +}
> +
>  int main(int argc, char *argv[])
>  {
>  	int session, expected_stage = 0;
> -- 
> 2.53.0.473.g4a7958ca14-goog
> 

-- 
Sincerely yours,
Mike.
