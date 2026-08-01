Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809F42139C9
	for <linux-kselftest@vger.kernel.org>; Sat,  1 Aug 2026 13:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785592268; cv=none; b=FEmjtXHRbkvRnpFtM2kbk+1THIgHlBWfXRbQji1/Qoh0W6Td/ft2HfQTMIqKROoKyVBOm5DbsN+dp0wdonIqkqWcNMhFKtWfIY3vpYE3+k9VcCYINaV5aHt4PTMfLV874ICzJqxGTnkW0TUE3RzyW65Ig4KbjVi+VX8Rp+ATrA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785592268; c=relaxed/simple;
	bh=rt25cJP/RrTvIsnCdMRI8qYKXwgY7lSCF/dPp1wNwGY=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=nlifQB1yddCJ2rBvi54DzleC8F9igdO9nNCOWZ4rfq3gOKtYaILyC6SUFQir8FcjU80PPNItOG/fOM0R0NiNazi7RfvjdBwnS6xOWopgqS75t9ND8birx16frZpCuDfm7NtyQfhKMbaXfC4xlkE+jvkHtCIbIM4b0BneVWjbF+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lk3BpRn3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lk3BpRn3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165B21F00ACA;
	Sat,  1 Aug 2026 13:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785592267;
	bh=AehxbtTGF0gHvDxz02bjJOtwVnqS4RItAc5Dqc+aBLc=;
	h=Date:From:To:In-Reply-To:References:Subject;
	b=lk3BpRn3akXRe++bkm9xzZxRi1KWYz2PKXQvHoMUhypiY1tY6Hal2foBDkcvFrhsM
	 owZ/DzsSMuWSFLN+bvw6v/gQNATZ0Eyl+a2KU1vXntm3NP1tipamF8VJuEmYQvErs4
	 +5LjWZUk7D2V08DNN2AHp1il/8B4Dbsr6dUbwTbeQ/yn4c4cg5+eQgunkbJAvIQ/xa
	 st/UWB+eivGF9CgDXNPvFPpWrq7umIMd+gB+55ae4gRRLeDi/q3NLAhp3ffOaNLI4Y
	 zhkhYbABW7fP1MMOCnDjnnX5ouiEasJipHG4CncSy60KjUkaBp9D2Bt/iBON4DLxs/
	 BfPQ2Hw8k4z3A==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id F1A6EF40074;
	Sat,  1 Aug 2026 09:51:05 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-01.internal (MEProxy); Sat, 01 Aug 2026 09:51:05 -0400
X-ME-Sender: <xms:yfltasYo_UjqxWMz0tTveMJjl2c6riV3sBGWq2MmNl-FoKMQuVC04A>
    <xme:yfltaiMUg6wTZ0QwGQWZh7Sv2Z-DpR1BxtUT4wEC_W0UITZMHVI3p194unMvqW7j7
    e2EUOUkWzat4watr_qQ7quTEwMky5tBbMXr_o1tC85oomWXytMWnC_u>
X-ME-Proxy-Cause: dmFkZTFDIiY0uqQK1LdtvM6HVqGsuZVZSKNkYEGOrhrS5nnb8BrWjcxGs/uz4FlYHK3rqR
    22yCTvZQ7tt1rBEUoThDD3bnY45V6GPXLMK6dj4gPwmKgDIlOrCcLiyFgJ5kpAyKhRUB56
    90Wl600FMFPiYiou+quSy94b2OOuMUiTApL0GAw441EY+jLJP+kAxw2GXT9pwtjPuqje5l
    vJeGR06VoKCPKwpmPJMyDj6tVkf+S90JavUU+Ardhhz0XxHeKE1Ha2znYoe54Gnr5MH8vb
    H+HfGTxwf38rFY6y4Ug1wwfECyKiLZacmpeCtAYT8Vszo2U4QWziRrq2RfhZ8l18ajfzYw
    nDigfTBveJKIlM6MyCf4MHKwCqa070Y/SQf/7kILrXxW6K58qjRWcQ8loRi0TZyAT0QIIt
    T7n3Ep01Li0qLIzGXRYD3Uw+5koMmhSBYODdx6XZULmGeL5CA0iYte3z9DgZbPoR4nnN3j
    /lIQr/hwzKmZBtNLFHztcy4kr7ybOP0URgCitDy8ZW7fcII3sK/jPiJb3Fuy8SoVEZ2VQ4
    3eLRXVNezuBLcPZluzp/PWstmQc8vtXUMc0UutobwNArfek8KkdOGGJeQtO0KKHepU7Rrf
    hZ90/qG5RaMVjkA6QddDvEcFo3npjqXMyMcadoThgeSJ07zBP0IzpfuMyBpQ
X-ME-Proxy: <xmx:yfltahDJ6Oprnr_7741u2ZNzOGu9QlvsmFO2jgRNigFkZUfacp7IVg>
    <xmx:yfltatUJoj3atT6ZgxqPKVxsxI8ndj247lpj3Tqz2KSDYBD1Ph4-ug>
    <xmx:yfltanDDcEZYMMu4b1BSlzWjCjaoT2GyzZ0RV4-EupKXA9TUXi25rw>
    <xmx:yfltao8kcOc-67pxmqKBxAiKD7H6ZSygVbqB1hf8aBPxr2eGQoPwZQ>
    <xmx:yfltamEeV4kwMyzorZmP0qRhl-lbQ0xGC217anmkS9_Z_2r3bXIC6S9K>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D0295182007E; Sat,  1 Aug 2026 09:51:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 01 Aug 2026 15:50:45 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Hui Wang" <hui.wang@canonical.com>, shuah@kernel.org,
 "Shuah Khan" <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org
Message-Id: <04dd6e7c-e290-477a-a4bc-45d0ace102be@app.fastmail.com>
In-Reply-To: <20260608111300.63242-1-hui.wang@canonical.com>
References: <20260608111300.63242-1-hui.wang@canonical.com>
Subject: Re: [PATCH] selftests/efivarfs: skip write tests if efivarfs is mounted
 read-only
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello Hui Wang,

On Mon, 8 Jun 2026, at 13:13, Hui Wang wrote:
> efivarfs is mounted read-only when the firmware does not provide a
> working runtime SetVariable() service. This happens, for example, on
> systems where the EFI runtime is provided by U-Boot's efi_loader (a
> common case on RISC-V under QEMU booting via OpenSBI -> U-Boot -> GRUB),
> or when runtime services are disabled (efi=noruntime, lockdown, etc).
>
> In that situation every test that creates, modifies or deletes an EFI
> variable is bound to fail, producing spurious test failures that do not
> reflect a real kernel bug.
>
> Detect the mount mode in check_prereqs() and store it in the global
> efivarfs_mode ("ro" or "rw"). Extend run_test() to take an optional
> "rw" argument marking tests that require a writable efivarfs; such tests
> are reported as [SKIP] (instead of being run and failing) when efivarfs
> is read-only, along with an explanatory message.
>
> test_create_empty and test_invalid_filenames are left to run
> unconditionally, since their expectation still holds on a read-only
> mount; their stderr is silenced to avoid noise from the read-only
> redirection failures.
>
> Assisted-by: Copilot:claude-opus-4-8
> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> ---
>  tools/testing/selftests/efivarfs/efivarfs.sh | 44 +++++++++++++++-----
>  1 file changed, 33 insertions(+), 11 deletions(-)
>
> diff --git a/tools/testing/selftests/efivarfs/efivarfs.sh 
> b/tools/testing/selftests/efivarfs/efivarfs.sh
> index c62544b966ae..d8883fdf3b01 100755
> --- a/tools/testing/selftests/efivarfs/efivarfs.sh
> +++ b/tools/testing/selftests/efivarfs/efivarfs.sh
> @@ -26,16 +26,33 @@ check_prereqs()
>  		echo $msg efivarfs is not mounted on $efivarfs_mount >&2
>  		exit $ksft_skip
>  	fi
> +
> +	# Determine whether efivarfs is mounted read-only or read-write
> +	# and store the result ("ro" or "rw") in the global efivarfs_mode.
> +	if grep -q "^\S\+ $efivarfs_mount efivarfs ro[, ]" /proc/mounts; then
> +		efivarfs_mode=ro
> +	else
> +		efivarfs_mode=rw
> +	fi
>  }
> 
>  run_test()
>  {
>  	local test="$1"
> +	# Second (optional) argument: "rw" if the test needs a writable
> +	# efivarfs. Such tests are skipped when efivarfs is mounted read-only.
> +	local need_rw="$2"
> 
>  	echo "--------------------"
>  	echo "running $test"
>  	echo "--------------------"
> 
> +	if [ "$need_rw" = "rw" ] && [ "$efivarfs_mode" = "ro" ]; then
> +		echo "  [SKIP] efivarfs is mounted read-only," \
> +		     "skipping test that requires write access" >&2
> +		return
> +	fi
> +
>  	if [ "$(type -t $test)" = 'function' ]; then
>  		( $test )
>  	else
> @@ -74,7 +91,7 @@ test_create_empty()
>  {
>  	local file=$efivarfs_mount/$FUNCNAME-$test_guid
> 
> -	: > $file
> +	: 2>/dev/null > $file
> 
>  	if [ -e $file ]; then
>  		echo "$file can be created without writing" >&2
> @@ -361,18 +378,23 @@ check_prereqs
> 
>  rc=0
> 
> -run_test test_create
> +if [ "$efivarfs_mode" = "ro" ]; then
> +	echo "efivarfs is mounted read-only on $efivarfs_mount;" \
> +	     "tests that require write access will be skipped" >&2
> +fi
> +
> +run_test test_create rw
>  run_test test_create_empty
> -run_test test_create_read
> -run_test test_delete
> -run_test test_zero_size_delete
> -run_test test_open_unlink
> -run_test test_valid_filenames
> +run_test test_create_read rw
> +run_test test_delete rw
> +run_test test_zero_size_delete rw
> +run_test test_open_unlink rw
> +run_test test_valid_filenames rw
>  run_test test_invalid_filenames
> -run_test test_no_set_size
> +run_test test_no_set_size rw
>  setup_test_multiple
> -run_test test_multiple_zero_size
> -run_test test_multiple_create
> -run_test test_multiple_delete_on_write
> +run_test test_multiple_zero_size rw
> +run_test test_multiple_create rw
> +run_test test_multiple_delete_on_write rw
> 

This looks rather messy to me. Can't you have the rw tests in
a single if scope that is only entered when the mount is rw?

