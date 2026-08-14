Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6959746EC99
	for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 12:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786711873; cv=none; b=fcktasW61WWc7Lx3+hDEyZ9gy2R28Cx0IqssQe/D6MRx4+oy7kPiAjTBE/oFgxlcqcCImbLUhBJn0fSA2DU05dCXhXDZo1dk6J5zrXkA50BI6tQ8omEJs3gnXngeo/Ct4V2Hd1KyupjneL7KLS1w4MkpR6al/KpBCBbCULKeI1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786711873; c=relaxed/simple;
	bh=xhTEl6Rq/8TNEzqY9+1VW1LzFeZBlMsNa2Fe7K+u5K4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HzucecWNhpX3CyrAdLOgISM10UWso8JM3Q60CUOhPjFus1MWGvxwJDQ7NmKxchFRjVUdtl0dZqpu0e1BqU8xcG/b9O3YIDyXRQy/+wxipQMYYtPK/K3YZhN2MosEn/9JtXjj+1SDQApGd6VXgwXZFMgdw+iHC6UerddNm1cHkEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SRUKVShK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SRUKVShK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59F271F000E9;
	Fri, 14 Aug 2026 12:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786711869;
	bh=Yp8F8xjPNWmB+RDW4xJTkvaQ+IS/CNpnMALNCGQ+iGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SRUKVShK72r41Ws8g4FF6a9lZMwbBJEIk0HbBDqZ0N+STbG4WW2td6mK2zyOx+ZqJ
	 Mw4+Bw7svi7x4saObAoGV+T1A1eOyOzz4ItVk6Pxox+vyGuLwO6R/MKN0TZke5UUuj
	 OJfMai0xJ4YKMTOwwhg8/vCqnk5yMPAB10U5IibX7bXDcZAtU86RXSU/6vsZBy+c/a
	 na3v406UmuTXQzQt08BjZkitTPYP2X2lKoC/Z6y35BmGL68aGNnN424sAHWB9gMsZ8
	 GQUgaMLvNK+b55nEUzFjwjOsnHuv3fr5UZtblxsxIl5tblc20bQJg7RzIDCo2L7YKW
	 YRcsLTygUrLLg==
Date: Fri, 14 Aug 2026 13:50:50 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: linux-mm@kvack.org, geert@linux-m68k.org, daniel@thingy.jp, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, Mark Brown <broonie@kernel.org>, 
	Brendan Jackman <jackmanb@google.com>, Hangbin Liu <liuhangbin@gmail.com>, 
	"Ricardo B. Marliere" <rbm@suse.com>, linux-kselftest@vger.kernel.org, linux-um@lists.infradead.org
Subject: Re: [RFC PATCH 5/6] selftests: run tests on nommu architecture
Message-ID: <an8MlE22U3586R42@lucifer>
References: <20260813063401.1786548-1-thehajime@gmail.com>
 <20260813063401.1786548-6-thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813063401.1786548-6-thehajime@gmail.com>

On Thu, Aug 13, 2026 at 03:34:00PM +0900, Hajime Tazaki wrote:
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
> - kselftest_harness.h warns if the file is include when building for
>   NOMMU platform, as there is no fork(2) syscall.
> - replace "cd -" use as it is not available a shell supported on nommu
>   (e.g., busybox hush), use cd "$OLDDIR" instead.
> - describe the difference of nommu tests in the document.
>
> So command line to build/execute tests for nommu should be like below:
>
>  $ make ARCH=um NOMMU=1 O=build kselftest
>  $ make ARCH=um NOMMU=1 -C tools/testing/selftests/mm run_tests
>  $ NOMMU=1 /tmp/kselftest_install/run_kselftest.sh -s -c mm
>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Kees Cook <kees@kernel.org>
> Cc: Andy Lutomirski <luto@amacapital.net>
> Cc: Will Drewry <wad@chromium.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Brendan Jackman <jackmanb@google.com>
> Cc: Hangbin Liu <liuhangbin@gmail.com>
> Cc: "Ricardo B. Marliere" <rbm@suse.com>
> Cc: linux-kselftest@vger.kernel.org
> Cc: linux-um@lists.infradead.org
> Signed-off-by: Hajime Tazaki <thehajime@gmail.com>

Not really loving this as mentioned on the cover letter.

I'm sympathetic to making things work if it's not invasive, but now you've
essentially asking new test authors be aware of this to some degree.

And making the harness - which is the defacto way of writing tests - now
simply not work there is a bit crazy.

I'd ideally like to see _all_ tests use the harness.

Also a bunch of the tests already do forking as part of the testing:

$ cd tools/testing/selftests/mm
$ rg -l "fork\(" | wc -l
17

So at this point you're not really running much of the selftests at all,
and are only happening to run those that don't do the very basic stuff
nommu can't deal with.

I think an audit of existing tests to figure out what works with nommu vs
what doesn't is really unreasonable again, given nobody tests or seemingly
uses these arches.

So this patch might beget more nommu carve outs and exceptions and
therefore nommu workload and maintenance, which isn't really sustainable.

I know I complain about lack of testing on nommu, but at the same time I
don't think running arbitrary tests that happen to work on it and who knows
if they are valid asserts anyway really fixes things.

And given nobody really is doing testing, it's not really a great RoI
here...

...OTOH I suppose it's a minimal change we can largely ignore as long as
this doesn't lead to additional work/auditing from anybody but nommu
enthusiasts.

But I'm just not sure that will be the case :(

(I'm amazed we support a mode in linux that can't fork() in 2026 :)


> ---
>  Documentation/dev-tools/kselftest.rst       | 12 ++++++++++++
>  tools/testing/selftests/kselftest/runner.sh |  9 +++++++--
>  tools/testing/selftests/kselftest_harness.h |  4 ++++
>  tools/testing/selftests/lib.mk              |  8 ++++++++
>  4 files changed, 31 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
> index 64c0ec7428a2..800b2b688aff 100644
> --- a/Documentation/dev-tools/kselftest.rst
> +++ b/Documentation/dev-tools/kselftest.rst
> @@ -230,6 +230,18 @@ section::
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
> +  $ make ARCH=um NOMMU=1 O=build kselftest
> +  $ make ARCH=um NOMMU=1 -C tools/testing/selftests/mm run_tests
> +  $ NOMMU=1 /tmp/kselftest_install/run_kselftest.sh -s -c mm
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
>  	fi
>
>  	return $rc
> diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
> index 261e4df94d9d..8eee7b14f824 100644
> --- a/tools/testing/selftests/kselftest_harness.h
> +++ b/tools/testing/selftests/kselftest_harness.h
> @@ -1274,6 +1274,10 @@ static int test_harness_run(int argc, char **argv)
>  	unsigned int count = 0;
>  	unsigned int pass_count = 0;
>
> +#ifdef CONFIG_NOMMU
> +	ksft_print_msg("harness test doesn't support on NOMMU architecture (no fork(2)).\n");
> +	return KSFT_SKIP;
> +#endif /* CONFIG_NOMMU */
>  	ret = test_harness_argv_check(argc, argv);
>  	if (ret != KSFT_PASS)
>  		return ret;
> diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
> index 2cc819006424..4734b5ce613f 100644
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
>  all: $(TEST_GEN_PROGS) $(TEST_GEN_PROGS_EXTENDED) $(TEST_GEN_FILES) \
>  	$(if $(TEST_GEN_MODS_DIR),gen_mods_dir)
>
> --
> 2.43.0
>

--
Cheers, Lorenzo
