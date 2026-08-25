Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC77480346;
	Tue, 25 Aug 2026 13:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787664992; cv=none; b=aqTDNSC3S6N9PXOV2N5zWIdSehSVezXcP20l/cLQSPUnId3bYwz11DUtx47q8ED1zBENtjL0TraslGX8DBty7xS1Cz+10lJ7pWvkvu94DCE+CjUWcbF2U+h6yG23xmeh1ApjhiVxtq8r28PZ0VnF6i/LKbXMGAwkbfFZd/x23SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787664992; c=relaxed/simple;
	bh=DssUPjwFzh1LK0oT5JS9bOfwl8sKoL7GvMoONw+Y1f0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPoXvkfkWX5zC5W3cnfrgdue5D0W8VVEtU5Tio2G3uFcDEfWw2pBhueohSVXwogxCsFpDUniJFBSbToT5h2Ud+qESzOqZAXR6dYbNkn/1DOhfThf7NoTi2zI5dLuM7hFdwI1kYTUF6efz+ltD1751FSTiL6Xto9IcJNEp5dYSGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bL/6T7Pt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bL/6T7Pt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 996F61F000E9;
	Tue, 25 Aug 2026 13:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787664990;
	bh=j3O0jUa3F64kLLrL5LogQDPv2j12GdtTejlIkXela4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bL/6T7PtIl1SE4jX/P04Rg3Ro8uDMTXBR+IfVYE+x9UAvjV6ffKU5KIi2UYbb2Azk
	 p5jWRud8g9M6fKt/WdbCiANY8IOY6E0GO9tF+/y3HH2CIDHPBZRk4lM4v8EXdA9xIV
	 vvdmBV3MJpokO9m4uxF0kV9DadEr5xUgE4g1MEcQyIKv4p2QffHM5m8kqMZ5wAcpr1
	 1OFmbyY/SJk7SamSMGhyjmip1vkbS4m5jfEpR9huTf9xGy3VQG/pSuJr6VdL+amyfz
	 85Uhn+kpEjV22Ml8U417c58fgjFzYStIqvm9LlIaMeR72+D3VnMuYgSB9ZwSdjt5wy
	 9BywduZwpF00A==
Date: Tue, 25 Aug 2026 14:36:22 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: linux-mm@kvack.org, liam@infradead.org, rbm@suse.com, 
	akpm@linux-foundation.org, luto@amacapital.net, brendan.jackman@linux.dev, david@kernel.org, 
	liuhangbin@gmail.com, corbet@lwn.net, kees@kernel.org, broonie@kernel.org, 
	mhocko@suse.com, rppt@kernel.org, shuah@kernel.org, surenb@google.com, 
	vbabka@kernel.org, wad@chromium.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-um@lists.infradead.org, geert@linux-m68k.org, 
	daniel@thingy.jp
Subject: Re: [PATCH v2 1/2] selftests: run tests on nommu architecture
Message-ID: <ao2aTD1ZGObPfp4T@gremlin>
References: <20260825015945.141739-1-thehajime@gmail.com>
 <20260825015945.141739-2-thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825015945.141739-2-thehajime@gmail.com>

On Tue, Aug 25, 2026 at 10:59:44AM +0900, Hajime Tazaki wrote:
> Architectures lacks MMU doesn't support fork(2) syscall and only
> vfork(2) is available with limitations.  Thus, we cannot run kselftest
> on nommu architecture as is.
>
> This commit addresses this issue with the following changes:
>
> - on build stage, add -DCONFIG_NOMMU to CFLAGS when NOMMU=1 variable
>   added to the build/make argument.
> - on test run stage, avoid calling timeout command when NOMMU=1 variable
>   added to environmental variable, since timeout command uses fork
>   syscall which nommu platform doesn't support.
> - kselftest_harness.h: skip the tests if the file is include when
>   executing on NOMMU platform, as there is no fork(2) syscall.
> - replace "cd -" use as it is not available a shell supported on nommu
>   (e.g., busybox hush), use cd "$OLDDIR" instead.
> - describe the difference of nommu tests in the document.
>
> So command line to build/execute tests for nommu should be like below:
>
>  $ make ARCH=um NOMMU=1 O=build kselftest-all TARGETS=mm/nommu
>  $ make ARCH=um NOMMU=1 O=build kselftest-install TARGETS=mm/nommu
>  $ NOMMU=1 ./build/kselftest/kselftest_install/run_kselftest.sh -p \
>    -c mm/nommu
>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Kees Cook <kees@kernel.org>
> Cc: Andy Lutomirski <luto@amacapital.net>
> Cc: Will Drewry <wad@chromium.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Brendan Jackman <brendan.jackman@linux.dev>
> Cc: Hangbin Liu <liuhangbin@gmail.com>
> Cc: "Ricardo B. Marliere" <rbm@suse.com>
> Cc: linux-kselftest@vger.kernel.org
> Cc: linux-um@lists.infradead.org
> Cc: linux-mm@kvack.org
> Cc: linux-doc@vger.kernel.org
> Closes: https://sashiko.dev/#/patchset/20260813063401.1786548-1-thehajime%40gmail.com
> Signed-off-by: Hajime Tazaki <thehajime@gmail.com>

Doesn't seem too crazy, but some nitty comments below.

>
> --
>
> rfc => v2
> - reformat ktap header, reported by Sashiko review
>
> rfc: https://lore.kernel.org/linux-mm/20260813063401.1786548-1-thehajime@gmail.com/
> ---
>  Documentation/dev-tools/kselftest.rst       | 14 ++++++++++++++
>  tools/testing/selftests/kselftest/runner.sh |  9 +++++++--
>  tools/testing/selftests/kselftest_harness.h |  4 ++++
>  tools/testing/selftests/lib.mk              |  8 ++++++++
>  4 files changed, 33 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
> index 64c0ec7428a2..a65f3ebc5906 100644
> --- a/Documentation/dev-tools/kselftest.rst
> +++ b/Documentation/dev-tools/kselftest.rst
> @@ -230,6 +230,20 @@ section::
>
>  .. _tar's auto-compress: https://www.gnu.org/software/tar/manual/html_node/gzip.html#auto_002dcompress
>
> +Build and test on nommu target
> +==============================
> +
> +If you (cross-)build kselftests for nommu targets, or run tests on nommu targets, use
> +``NOMMU=1`` as a make variable/environment setting to tell build system to do the additional
> +checks.  These nommu targets may differ in several ways, such as not supporting fork(2) or
> +using musl or another libc.  Set this variable to apply the necessary build and test adjustments.
> +
> +::
> +
> +  $ make ARCH=um NOMMU=1 O=build kselftest-all TARGETS=mm/nommu  # <= build-only
> +  $ make ARCH=um NOMMU=1 O=build kselftest-install TARGETS=mm/nommu
> +  $ NOMMU=1 ./build/kselftest/kselftest_install/run_kselftest.sh -p -c mm/nommu
> +
>  Contributing new tests
>  ======================
>
> diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
> index 311811dc55a0..7287d8290b6c 100644
> --- a/tools/testing/selftests/kselftest/runner.sh
> +++ b/tools/testing/selftests/kselftest/runner.sh
> @@ -38,8 +38,12 @@ tap_prefix()
>
>  tap_timeout()
>  {
> +	# nommu doesn't support timeout command (missing fork(2))
> +	if [ "$NOMMU" = "1" ] ; then
> +		echo "timeout isn't supported for nommu"
> +		$1
>  	# Make sure tests will time out if utility is available.
> -	if [ -x /usr/bin/timeout ] ; then
> +	elif [ -x /usr/bin/timeout ] ; then
>  		/usr/bin/timeout --foreground "$kselftest_timeout" \
>  			/usr/bin/timeout "$kselftest_timeout" $1
>  	else
> @@ -130,6 +134,7 @@ run_one()
>  				return $KSFT_FAIL
>  			fi
>  		fi
> +		OLDDIR=$(pwd)
>  		cd `dirname $TEST` > /dev/null
>  		(((( tap_timeout "$cmd" 2>&1; echo $? >&3) |
>  			tap_prefix >&4) 3>&1) |
> @@ -147,7 +152,7 @@ run_one()
>  		*)
>  			ktap_test_fail "$TEST_HDR_MSG # exit=$rc";;
>  		esac
> -		cd - >/dev/null
> +		cd "$OLDDIR" >/dev/null

Hmm, why are you changing this bit?

>  	fi
>
>  	return $rc
> diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
> index 261e4df94d9d..0d05946a5e7a 100644
> --- a/tools/testing/selftests/kselftest_harness.h
> +++ b/tools/testing/selftests/kselftest_harness.h
> @@ -1274,6 +1274,10 @@ static int test_harness_run(int argc, char **argv)
>  	unsigned int count = 0;
>  	unsigned int pass_count = 0;
>
> +#ifdef CONFIG_NOMMU

Let's not prefix with CONFIG_ :) I think this is pretty confusing vs. the kernel
CONFIG_xxx flags, esp. as this obviously inverts CONFIG_MMU.

maybe just 'NOMMU'?

> +	ksft_print_header();
> +	ksft_exit_skip("kselftest harness requires fork(2), unavailable on NOMMU\n");
> +#endif /* CONFIG_NOMMU */
>  	ret = test_harness_argv_check(argc, argv);
>  	if (ret != KSFT_PASS)
>  		return ret;
> diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
> index f02cc8a2e4ae..fdb895967768 100644
> --- a/tools/testing/selftests/lib.mk
> +++ b/tools/testing/selftests/lib.mk
> @@ -97,6 +97,14 @@ TEST_GEN_PROGS := $(patsubst %,$(OUTPUT)/%,$(TEST_GEN_PROGS))
>  TEST_GEN_PROGS_EXTENDED := $(patsubst %,$(OUTPUT)/%,$(TEST_GEN_PROGS_EXTENDED))
>  TEST_GEN_FILES := $(patsubst %,$(OUTPUT)/%,$(TEST_GEN_FILES))
>
> +# detect if users request NOMMU build or not
> +# User can set NOMMU to 1 to build/test for NOMMU platforms
> +NOMMU ?= 0
> +ifeq ($(NOMMU),1)
> +CFLAGS += -DCONFIG_NOMMU
> +export NOMMU
> +endif
> +

I wonder if this could be put into testing/selftests/nommu/something.mk? Though
I guess would have to be included for all builds to account for nommu trying to
build any kind of tests.


>  all: $(TEST_GEN_PROGS) $(TEST_GEN_PROGS_EXTENDED) $(TEST_GEN_FILES) \
>  	$(if $(TEST_GEN_MODS_DIR),gen_mods_dir)
>
> --
> 2.43.0
>

--
Cheers, Lorenzo
