Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA48E49DB86;
	Mon, 28 Sep 2026 11:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593447; cv=none; b=h/270x6A9l5hYJ0RfmPM4eC/0L8Lq68D/oJiYXgO5ZLC6PXxj+zYv+IZz4P4e28KkmUBmi77J0QVFOHksyuD0vLEG5g3qAozIAIk7wycw0+g60RezgTuNtVMmXOKR3mlqALP5D5A+Es9GkW3YljKTy1JoySLTGRG9Rxh86whKUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593447; c=relaxed/simple;
	bh=6DTY0+Gm+vHfwDi/F4N3wGzRsYsSflT4f6vboBzK/Fk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6fC62NjvBpf+yJ0ab7P8xBxB/9Y6OCqRIVUxG1R8wwMH5MYwD+lYrXc+aM5w/I8H4JWVPlOvAUsI5bUVqbQFZ+aDEVf616SHaSF6Onij9kX7SgiliIOC0eY/JKVTNA5YDX4TH9ycNFkoEb4x+hf2VfTJuaERgCyDaoJgGCvGd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DJaay7PG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DJaay7PG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15191F000FF;
	Mon, 28 Sep 2026 11:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790593446;
	bh=iKzxJQmNYQsUt2PEmdmsZav4S/mmfjAvnn3I6ZHTKf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DJaay7PGP72R0tGkgyP+Oia4imEuYm8t8qR2pXFgrg9WILqzSl7Vjhp2rqDjHKhux
	 uDvrW2JpIyiASNUHIEFPZCnwPdOnC86ajBo8MeUmgKWcO1RGq3jtrAcpsqaC2H/gSN
	 YN8/cyXRUqo+vKyymEyDaWP/qu79jZshTmfGQWuhHsZgZlrxlBA4TpI5fBeUFX/zP9
	 Q5IWXT00yBQBnN09zoLUi1pomgDek0CrQ7diRBg3IxLLnE22BgtzKyel6+XVNdLMUg
	 BUbrKXD6vrPDCndd/xW8t3MDQHdtA92TFc5Ucd4FjBjsCfi2hMUSQGyF4YZtKTsPIl
	 GRMJ5Vp+/rHuA==
Date: Mon, 28 Sep 2026 12:03:58 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: linux-mm@kvack.org, liam@infradead.org, rbm@suse.com, 
	akpm@linux-foundation.org, luto@amacapital.net, brendan.jackman@linux.dev, david@kernel.org, 
	liuhangbin@gmail.com, corbet@lwn.net, kees@kernel.org, broonie@kernel.org, 
	mhocko@suse.com, rppt@kernel.org, shuah@kernel.org, surenb@google.com, 
	vbabka@kernel.org, wad@chromium.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-um@lists.infradead.org, geert@linux-m68k.org, 
	daniel@thingy.jp
Subject: Re: [PATCH v3 2/3] selftests: run tests on nommu architecture
Message-ID: <arpJSAGhxSRtgPyr@gremlin>
References: <20260926010819.604346-1-thehajime@gmail.com>
 <20260926010819.604346-3-thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926010819.604346-3-thehajime@gmail.com>

On Sat, Sep 26, 2026 at 10:08:18AM +0900, Hajime Tazaki wrote:
> Architectures lacks MMU doesn't support fork(2) syscall and only
> vfork(2) is available with limitations.  Thus, we cannot run kselftest
> on nommu architecture as is.
>
> This commit addresses this issue with the following changes:
>
> - on test run stage, avoid calling timeout command when NOMMU=1 variable
>   added to environmental variable, since timeout command uses fork
>   syscall which nommu platform doesn't support.
> - describe the difference of nommu tests in the document.
>
> So command line to build/execute tests for nommu should be like below:
>
>  $ make ARCH=um NOMMU=1 O=build kselftest-all TARGETS=nommu
>  $ make ARCH=um NOMMU=1 O=build kselftest-install TARGETS=nommu
>  $ NOMMU=1 ./build/kselftest/kselftest_install/run_kselftest.sh -p \
>    -c nommu
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

LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

>
> --
>
> v2 => v3
> - remove unnecessary modification
> - new target is moved from TARGETS=mm/nommu to TARGETS=nommu
> - rename CONFIG_NOMMU to NOMMU to avoid confusion to kernel config
>
> rfc => v2
> - reformat ktap header, reported by Sashiko review
> - https://lore.kernel.org/linux-mm/20260825015945.141739-2-thehajime@gmail.com/
>
> rfc: https://lore.kernel.org/linux-mm/20260813063401.1786548-1-thehajime@gmail.com/
> ---
>  Documentation/dev-tools/kselftest.rst       | 14 ++++++++++++++
>  tools/testing/selftests/kselftest/runner.sh |  6 +++++-
>  2 files changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
> index 64c0ec7428a2..c35b819947b7 100644
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
> +  $ make ARCH=um NOMMU=1 O=build kselftest-all TARGETS=nommu  # <= build-only
> +  $ make ARCH=um NOMMU=1 O=build kselftest-install TARGETS=nommu
> +  $ NOMMU=1 ./build/kselftest/kselftest_install/run_kselftest.sh -p -c nommu
> +
>  Contributing new tests
>  ======================
>
> diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
> index 8fc1018d6fec..95b5ebb8bbb9 100644
> --- a/tools/testing/selftests/kselftest/runner.sh
> +++ b/tools/testing/selftests/kselftest/runner.sh
> @@ -38,8 +38,12 @@ tap_prefix()
>
>  tap_timeout()
>  {
> +	# nommu doesn't support timeout command (missing fork(2))
> +	if [ "$NOMMU" = "1" ] ; then
> +		echo "timeout isn't supported for NOMMU"
> +		$1
>  	# Make sure tests will time out if utility is available.
> -	if [ -x /usr/bin/timeout ] ; then
> +	elif [ -x /usr/bin/timeout ] ; then
>  		/usr/bin/timeout --foreground "$kselftest_timeout" \
>  			/usr/bin/timeout "$kselftest_timeout" $1
>  	else
> --
> 2.43.0
>

--
Cheers, Lorenzo
