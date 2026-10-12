Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76074718EC;
	Mon, 12 Oct 2026 10:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800991; cv=none; b=F6wKFRV4ckxVs5SQTFx9gd8fbqKaHVl4F4t9UlseUCQN+eHh+EB49gfgs5ZVHYrRz6mMBSn0/5bkJ+mg/ts2z17Tv50TcXLtmKJnJmhiZoB3YjVclAJ2/nW3M4HVBj2xauBUmFDAJsIbuMGC2nn0lya+Is0wQi99Wkn+ebVsEtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800991; c=relaxed/simple;
	bh=5zbNkMtb7e6SKEtLVkUM2VXhlBRXbHTju/tTSHxlOGo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QXrKH9I+mGfAh7ZDA04XuIynZbyUuoOEgcoNn+Q/O/SK1oWXoTw1kJpvTgX25jV21lSmOWgNeNF+xHxsPMzmJtC6zcGVJouz2P03Sx1VU2Yn3pBOHvvE1lXDJfteDQxz6/L2GIOHghLCfMJNMHknvtkDwbco/e3kfFjtfbyvK6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kRu+XuQM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kRu+XuQM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9109C1F0089B;
	Mon, 12 Oct 2026 10:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791800985;
	bh=li1gWyf1yXK2Y0+8Y+XJI0fZtOcno0yy1qKJ4a5DFLQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=kRu+XuQMs2afadLx1E/dMzg4UjakTRJyFch11x+nKfuPjfky+k/kNXDOoDhj3rW1N
	 Vcpq9nfCc9DtqvN2BFOChx3riMtqSRoHOsOtlczK6tjDBlBNZWL8KKX3xlnOBCDDL3
	 f0F01h3Oo3jSMMsgotPXe5Mff0ELWO78/1SvG8M9Qog5tkbflus98C/kST/AEaxLSY
	 7gci+2byo1HErx2KJwEYiBm2aPoPPkW3jNs7jEj83RLZ6dvGnB88+MnD2lTvgkxSqC
	 2jkjTNzSBrbhEVkFdz/snNWEEAzPObgs0kY49vAdZiiBAIcFYl31oeTesZd6W9y1UO
	 lLKap5XQ8vVGA==
From: Pratyush Yadav <pratyush@kernel.org>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org,  Jordan Richards
 <jordanrichards@google.com>,  Mike Rapoport <rppt@kernel.org>,  Pasha
 Tatashin <pasha.tatashin@soleen.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH] selftests/liveupdate: Prefer KVM and HVF over TCG in
 vmtest.sh
In-Reply-To: <20261008132813.1966023-1-dmatlack@google.com> (David Matlack's
	message of "Thu, 8 Oct 2026 13:28:13 +0000")
References: <20261008132813.1966023-1-dmatlack@google.com>
Date: Mon, 12 Oct 2026 12:29:42 +0200
Message-ID: <2vxzv777jjop.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Oct 08 2026, David Matlack wrote:

> Pass the -accel options to QEMU in the order KVM, HVF, TCG, so that
> vmtest.sh prefers to use KVM and HVF over TCG when they are available.
>
> QEMU uses the first accelerator in the list that initializes, and TCG
> always initializes, so the tests currently always run under TCG, even
> though the commit that added vmtest.sh describes "automatic accelerator
> detection (KVM, HVF, or TCG)".
>
> Fixes: 89dd1421c554 ("selftests/liveupdate: add end to end test infrastructure and scripts")
> Signed-off-by: David Matlack <dmatlack@google.com>

IIUC HVF is only for MacOS. I don't think we care to run this script on
MacOS.

Anyway, thanks for the fix

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

> ---
> Tested by running run-vmtests.sh and then observed that arm64 correctly
> fell back to using TCG after trying to use KVM and HVF, and that x86
> reported no warnings.
>
> arm64:
>   qemu-system-aarch64: -accel kvm: invalid accelerator kvm
>   qemu-system-aarch64: -accel hvf: invalid accelerator hvf
>   qemu-system-aarch64: falling back to tcg
>
> x86:
>   (not warnings)
>
>  tools/testing/selftests/liveupdate/vmtest.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/liveupdate/vmtest.sh b/tools/testing/selftests/liveupdate/vmtest.sh
> index 64fd2ab55b76..69beda6c961d 100755
> --- a/tools/testing/selftests/liveupdate/vmtest.sh
> +++ b/tools/testing/selftests/liveupdate/vmtest.sh
> @@ -180,7 +180,7 @@ function run_qemu() {
>  	echo "# Serial Log: $serial"
>  	timeout 30s \
>  	$qemu_cmd -m 1G -smp 2 -no-reboot -nographic -nodefaults \
> -		  -accel tcg -accel hvf -accel kvm \
> +		  -accel kvm -accel hvf -accel tcg \
>  		  -serial file:"$serial" \
>  		  -append "$cmdline" \
>  		  -kernel "$kernel_path" \
>
> base-commit: 80cf37169daef112b6bea9ae7d9808355a045475

-- 
Regards,
Pratyush Yadav
