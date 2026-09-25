Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B587E4E1C87;
	Fri, 25 Sep 2026 19:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790365089; cv=none; b=EgSzsLUVwf1JvCpPGLdmCc/pNKdjGU0im7yItIogmnE+gQZLyubssVXuYNrbMEbpfHh1gGX1OyqRfLe0u40YEi3mx4o5wqFCdIDRUVPScC011c4p4qpmpTTPR7RTP6dvLmsTZ7o8s5n6O6Znw/iJhPmd56603CRTsLQjDolFELs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790365089; c=relaxed/simple;
	bh=dstBTE3lWCMn9EudZcftluRV7vRDMp0MnFzhpgOlsz0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=koiWIMG3NVDl/+d/3lPd8SDGZZo21Zssq4Tj5SKazV4zBoOdqgjF1u9+Z4mLxjr/RkMVJW9M1lpzQ2x+MwEpaD+Hf4C1WWs6YchmiYmfnqcnC0C0BfD1jbqZBSfQ1mUg0lXvAyJUvwTUKqbonYX+cVswYAoJNC2Eb81h1kc8E6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DxbIi28P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DxbIi28P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F401F000FF;
	Fri, 25 Sep 2026 19:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790365088;
	bh=0LEsbhIDjBe66cbu0GZSdPhdvVGyJ9cnICBeyy6iWkk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DxbIi28P95AzIzpsaRJqifwhTdKpAAPYMwT4+wQMpyTkmjQuoUxKrj2UjvZ1CzDD5
	 2dz5GyyZf+UVrlZzUi7246Dh6pWzJ9W7Wngn2hPuK1aiFavZpjeydxRVuDNMIUxFq7
	 X17bAkTBN1fMC2PylaMk7Rvp4/A6m8r52ETGTJMC4t6XJXPofRdG3WdbI8bKjXZK7g
	 G1JU9ZU6xnROvYjqRsDVA3WL2Wh4bkp3mkF7Lz4mpmR+9iPkg7uMvQ8cnOVC11EsoI
	 5m7BmFWf1IT7ed9EuauM/1lhewkRONS0osKU8zKGAvl585hEth7Rs4equHnAMtEzz1
	 wUQlc7U9HlCJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] kbuild: Move gen_init_cpio and gen_initramfs.sh
 to scripts/
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shuah Khan" <skhan@linuxfoundation.org>, "Jonathan Corbet" <corbet@lwn.net>, "Pasha
 Tatashin" <pasha.tatashin@soleen.com>, "Mike Rapoport" <rppt@kernel.org>, "Pratyush
 Yadav" <pratyush@kernel.org>, "Alexander Graf" <graf@amazon.com>, "Nicolas
 Schier" <nsc@kernel.org>, =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <linux@weissschuh.net>, "Maximilian
 Huber" <maximilian.huber@tngtech.com>, "Nathan Chancellor" <nathan@kernel.org>, "Willy
 Tarreau" <w@1wt.eu>, "Randy Dunlap" <rdunlap@infradead.org>, "Luis
 Augenstein" <luis.augenstein@tngtech.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, kexec@lists.infradead.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, "Askar
 Safin" <safinaskar@gmail.com>, linux-kbuild@vger.kernel.org,
 =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <thomas.weissschuh@linutronix.de>
In-Reply-To: <20260925-move-gen_init_cpio-to-scripts-v3-2-99c493f76722@kernel.org>
References: <20260925-move-gen_init_cpio-to-scripts-v3-0-99c493f76722@kernel.org>
 <20260925-move-gen_init_cpio-to-scripts-v3-2-99c493f76722@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 19:38:07 +0000
Message-Id: <20260925193807.70F401F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] selftests/liveupdate: vmtest.sh mkinitrd fails due to missing ge=
n_init_cpio
- [Low] kbuild: stale comment in gen_initramfs.sh assumes old usr/ location
--

commit 97c7fb8e47f1b247f157846cfecd29ff5f239ed1
Author: Nicolas Schier <nsc@kernel.org>

kbuild: Move gen_init_cpio and gen_initramfs.sh to scripts/

gen_init_cpio and gen_initramfs.sh are part of kbuild and required for
all kernel builds w/ CONFIG_BLK_DEV_INITRD.  Move both to scripts/ to be
more clear about their importance.

Link: https://lore.kernel.org/all/aSdrCFkUQup3qb-q@derry.ads.avm.de/

> diff --git a/tools/testing/selftests/kho/vmtest.sh b/tools/testing/selfte=
sts/kho/vmtest.sh
> index 0014bd76e88de..1e86ffcc3a79e 100755
> --- a/tools/testing/selftests/kho/vmtest.sh
> +++ b/tools/testing/selftests/kho/vmtest.sh
> @@ -100,7 +100,7 @@ file /init $tmp_dir/init 0755 0 0
>  file /kernel $kernel 0644 0 0
>  EOF
> =20
> -	"$build_dir/usr/gen_init_cpio" "$tmp_dir/cpio_list" > "$initrd"
> +	"$build_dir/scripts/gen_init_cpio" "$tmp_dir/cpio_list" > "$initrd"
>  }

[Severity: Medium]
The path for the kho selftest was updated, but it looks like=20
tools/testing/selftests/liveupdate/vmtest.sh also still calls the old path.

For example, in its mkinitrd():

	# Generate inner_initrd.cpio
	"$build_dir/usr/gen_init_cpio" "$workspace_dir/cpio_list_inner" > "$worksp=
ace_dir/inner_initrd.cpio"

and again later in the same function:

	# Generate the final initrd
	"$build_dir/usr/gen_init_cpio" "$workspace_dir/cpio_list" > "$initrd"

Since this patch ensures the old artifact is removed via
scripts/remove-stale-files, will the liveupdate selftest unconditionally
fail because it cannot find gen_init_cpio?=20

Should liveupdate/vmtest.sh be updated to use scripts/gen_init_cpio as well?

> diff --git a/usr/gen_initramfs.sh b/scripts/gen_initramfs.sh
> similarity index 99%
> rename from usr/gen_initramfs.sh
> rename to scripts/gen_initramfs.sh
> index 7eba2fddf0ef2..27ac1fd48001a 100755
> --- a/usr/gen_initramfs.sh
> +++ b/scripts/gen_initramfs.sh
> @@ -247,4 +247,4 @@ done
> =20
>  # If output_file is set we will generate cpio archive
>  # we are careful to delete tmp files
> -usr/gen_init_cpio $output $timestamp $cpio_list
> +scripts/gen_init_cpio $output $timestamp $cpio_list

[Severity: Low]
Is the script header comment now out of date?

At the top of the renamed scripts/gen_initramfs.sh it still states:

# Generate a cpio packed initramfs. It uses gen_init_cpio to generate
# the cpio archive.
# This script assumes that gen_init_cpio is located in usr/ directory

Should this comment be updated to reflect the new scripts/ location?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925-move-gen_i=
nit_cpio-to-scripts-v3-1-99c493f76722@kernel.org?part=3D2
