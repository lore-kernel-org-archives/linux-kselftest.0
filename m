Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FA423D281
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 09:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788428112; cv=none; b=sFJo83ROEh+b5HTWrswZffKow0UoQg0iptBoZCKH0JkZI8pIo59oLmNS60N2etwUm88UnXDVMkMa8UCC1fDPp+PZZQ0ji1gPbBHue9Yty3bvQMISQVfix0CTEsEElle24gdViG+vk0yYF1AO0yeqSKl62CURP4+TwGR9hKgnuig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788428112; c=relaxed/simple;
	bh=3NK1gx3Wz80DE5vPdG39IevcRHNvAr4uoB2aYjNR0JA=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=RgN5VFdJznoicNLdYlZXyr2OBrQfFDzKUzOK7xDwed1HQVph/IDaqUBi+pM7SoIKWAITffnfFDDJmg5yk4Ghi6NzlHn6oPvFLBm3y3EJIRqerP+DnYOJ8z3yQvnvHhUKLQe/1gY32dJswz0E7FxVy0/3eQ3HTRD+9PVAh8ECyDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQlMAdll; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQlMAdll"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C6A1F00A3A
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 09:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788428111;
	bh=/jsTUhO55dcWuS3Qcwlc1TUXo0mEfgE6bMWkDbFZOW8=;
	h=Date:From:To:In-Reply-To:References:Subject;
	b=lQlMAdllVvv/YJ3N/DwOAMh0hAMitE0Taqaf2wpT6t5pEnSNYSOvYgb9KTHWfckvR
	 i1/YWjBbvW5hSRZf6wchSqpKYvtZp038TZyCocQcjbirD+Vsc8Qqh5amKTuxSvDbH/
	 ohOU5Xa6+5IatzDQpKZze23ZsypUgYsYEuanBU2wI9T6/GZeP7t4thDzBtPfc19/bs
	 1LY56oZOvFpgvyEmNdYRTSqx6D0i8IQcjYhO/8rnYVSzI9RBUM9OBwQY267y5dxvkX
	 WoVnYOtmGEy5OzpUutkJGo+ZLGrrdiXWRpHID5W4MYsVW515gSPhjJwyFlmkQW4XMN
	 TpCJ66m0xzwyg==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id CC1FB1980077;
	Thu,  3 Sep 2026 05:35:09 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Thu, 03 Sep 2026 05:35:09 -0400
X-ME-Sender: <xms:TD-ZalPc5c5nG3__8DJYPY6Xl5f2xi-wkkUt2tTaliYWmQ8rJNRZCQ>
    <xme:TD-Zaiw15I1Icxkk0HGz-zUuK0UueBmIS90I6NlPb9nBJA99O5NYc4tuw5rLhCenR
    Gx4x12uYj-b3DLtxAohaH7SgPh62wU_gPW9TfP0UGEZvCFMXs3hjmEk>
X-ME-Proxy-Cause: dmFkZTFAy7qoqujIZAdY/EbWuH0oEmuxrM5zrn/V9Q6j0Aiy3ty3hv4VkfSFKlwYvBrlzZ
    RGL+Na6slPKw8asXHsjNulf7CAABgOYN4nM9MJfoTu7HRS4OnB5lxsohjt0osa9O7Dwhm+
    7rZUUUqVdf7v+0GYXIbQYp9ZUXwCSr81MONDA40OdjxNQhfjLQWkPxzRXcG0e/Ccw3FefW
    9IWs/L3znnCDq7pbpYubVW2gkePE/ZUOBGUEJPGaMKGpjH1Kg2llsl0htnlTQGBmBkfB8C
    rqszgAzpbxX/Q9UFZWnlcNCFMnaummOA4M3D+ls/0neoNtOkyYFFZsMU98FdLyrxZWPMqz
    lfPCcuxjaK0da0zTneQteUD57wyL4UkAFceLX51cmQ5ENrw5FFFMoxGu42DvCfmg1jtahk
    u+XUkyMnS/ZbgI+irVjQzMTXK3wgrZ24+VCF8VokXmpJnGOQduWeE/yoxOG61lD23LyKGV
    6qZ3W31M/cq6fYdzVpcGWJtFzKXlPztXJPQBRcwIgmPhmQP7Gqf9QukumCy1ROWzdBlzPD
    QiaavYx/s9TilMxyNncLVNoquD0lZpX+RHxTmgb195t4mlQ9fbYf+jzNxoKkBAy3INzWMR
    nxaY6pfhSuHcfGbKwBUpRXFVIimN+IcENzM7EYBREHA3ryvwKFst1j6IsyaA
X-ME-Proxy: <xmx:TT-Zak0w6Y6wSngbzyuKw9yCnACjXLEmJoqxpx9T12mGlR-ATquQRg>
    <xmx:TT-Zas7MyoBUfQnoA3HPe2mAc1fwhpaU-C6G0AqRDQIPcUqX1h3tnA>
    <xmx:TT-ZanV9gyk9nBI1nstckVS-fd8kGxdyrq6153G-zpQQQcbm1Gayqg>
    <xmx:TT-ZarDWJTwj3cREhyyzDzdRq8AWYlf4mvDOR8kFZMaj47XJTa0Y8Q>
    <xmx:TT-Zam6cKa2maQLYtPVlC2oXzkosRibt5uL7uW2UdShAmcP_784EYKAI>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id D2AC1F8007A; Thu,  3 Sep 2026 05:35:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 03 Sep 2026 11:34:48 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Hui Wang" <hui.wang@canonical.com>, shuah@kernel.org,
 "Shuah Khan" <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org
Message-Id: <9352c070-753a-428e-90b3-5293f1bf3e8b@app.fastmail.com>
In-Reply-To: <20260820030101.35982-1-hui.wang@canonical.com>
References: <20260820030101.35982-1-hui.wang@canonical.com>
Subject: Re: [PATCH v2] selftests/efivarfs: skip write tests if efivarfs is mounted
 read-only
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Thu, 20 Aug 2026, at 05:01, Hui Wang wrote:
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
> efivarfs_mode ("ro" or "rw"). Group all tests that require a writable
> efivarfs into a single "if [ "$efivarfs_mode" = "rw" ]" block, so they
> are only run when efivarfs is writable; otherwise print a single message
> explaining that they were skipped.
>
> test_create_empty and test_invalid_filenames are left to run
> unconditionally, since their expectation still holds on a read-only
> mount; test_create_empty's stderr is silenced to avoid noise from the
> read-only redirection failure.
>
> Assisted-by: Copilot:claude-opus-4-8
> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> ---
> In the v2:
>  Move the rw tests in an if scope as suggested by Ard.
>
>  tools/testing/selftests/efivarfs/efivarfs.sh | 41 ++++++++++++++------
>  1 file changed, 29 insertions(+), 12 deletions(-)
>
> diff --git a/tools/testing/selftests/efivarfs/efivarfs.sh 
> b/tools/testing/selftests/efivarfs/efivarfs.sh
> index c62544b966ae..ec3036902b8a 100755
> --- a/tools/testing/selftests/efivarfs/efivarfs.sh
> +++ b/tools/testing/selftests/efivarfs/efivarfs.sh
> @@ -26,6 +26,14 @@ check_prereqs()
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
> @@ -74,7 +82,7 @@ test_create_empty()
>  {
>  	local file=$efivarfs_mount/$FUNCNAME-$test_guid
> 
> -	: > $file
> +	: 2>/dev/null > $file
> 

Why is this needed?
