Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E8B4A4999;
	Thu,  8 Oct 2026 13:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791466441; cv=none; b=AEOvk5PfQhO6Kb81Jm5utfTUiNCfWKz5r/ucQ43cj09o4SY/mQzWK21DgjLNzigAQt25U9SgIPkt2OdHTyozBz37nZhCrPow1VgvD6VM8xTUXfWv/AeZpIPzhvt/6ONUaNBBEW5Y08+EpiXfW4S3o5i5YKaThUq6GjK4s2rrBZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791466441; c=relaxed/simple;
	bh=R4efPWziYluq5OmHpl/wJK8M1tev4TSIbMoKQK1gVyw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=VSAuV6VJsUltNfXdA9VPRz5mT2kVsFngLeoXmBKGsgsRxE2vfLCzwLGMefOAXun8PyMTl+yR1YWX+PyffSPdIHkL5HAN+HUF7oQzdTkMq879GyOCbUcWuRxXEEklLU1IfUcz80ZfwE68eXZnPPyHcuHknV4HPGBAx0ZPltwC22Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B8eMDAx6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B8eMDAx6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15FCA1F00893;
	Thu,  8 Oct 2026 13:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791466439;
	bh=EMfIGKHZL2EcuSKE4fetcJKV4ZBxsEiNzCi6Z94i7bs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B8eMDAx6L9M21p4L4bm3XoG0wYjiHPzh4pUoHd6zVTIn+EQ9VKNLR0Eiw41R2CCok
	 kK30o0nyNc4Rz/9ptJ0DGGuj6nLT6LkyNLKMUx5MsbnyB6rx024+Ork7+zA8Hwlkjc
	 TqJ7jDSVlX9mtve4DDRPH2m9RKsqIe+ldoxUZZFdD+Xj9tN6maRT17w+T3uSp/Rg4X
	 jOUg5Nh6VeQzAmm5SGuiihTMbrU0JSq+AoPDHLUWQla8dwJrWw87TZCZdS23c0A4Cb
	 00QqAcU8V8gVUFUzKkP9PhfPO6V8/2h7q2fA+LKzembMMVtAvPFPR91uINyDYoy6f1
	 smig3ElBv0KAg==
Message-ID: <sashiko-outbox-164218@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] selftests/liveupdate: Prefer KVM and HVF over TCG in
 vmtest.sh
Reply-To: sashiko-reviews@lists.linux.dev
To: linux-kernel@vger.kernel.org, "David Matlack" <dmatlack@google.com>, linux-kselftest@vger.kernel.org
Cc: "Jordan Richards" <jordanrichards@google.com>, "Mike Rapoport" <rppt@kernel.org>, "Pratyush
 Yadav" <pratyush@kernel.org>, kexec@lists.infradead.org, "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Shuah
 Khan" <shuah@kernel.org>
In-Reply-To: <20261008132813.1966023-1-dmatlack@google.com>
References: <20261008132813.1966023-1-dmatlack@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 13:33:58 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] selftests: KVM accelerator preference breaks arm64 vmtest on GIC=
v3 hosts
--

commit 5b52122d5a64c0b3471d0fed69b32ec99d464203
Author: David Matlack <dmatlack@google.com>

selftests/liveupdate: Prefer KVM and HVF over TCG in vmtest.sh

This commit reorders the QEMU accelerator options to prefer KVM and HVF over
TCG. It aims to utilize hardware acceleration when available instead of alw=
ays
defaulting to TCG.

> Tested by running run-vmtests.sh and then observed that arm64 correctly
> fell back to using TCG after trying to use KVM and HVF, and that x86
> reported no warnings.

Will the arm64 test actually fall back to TCG when run natively on modern a=
rm64
hardware?

In get_arch_conf(), the arm64 QEMU command is defined without specifying a =
GIC
version:

QEMU_CMD=3D"qemu-system-aarch64 -M virt -cpu max"

Because the virt machine type defaults to GICv2 for backward compatibility,
running this natively on modern arm64 hardware (which typically only suppor=
ts
GICv3) will cause the KVM accelerator to successfully initialize, preventing
the fallback to TCG. However, KVM will then fail to create the default GICv2
in-kernel interrupt controller and QEMU will abort with a fatal error.

Was the observation of falling back to TCG made on a cross-compilation host
where the KVM accelerator itself failed to initialize?

> diff --git a/tools/testing/selftests/liveupdate/vmtest.sh b/tools/testing=
/selftests/liveupdate/vmtest.sh
> index 64fd2ab55b765..69beda6c961d7 100755
> --- a/tools/testing/selftests/liveupdate/vmtest.sh
> +++ b/tools/testing/selftests/liveupdate/vmtest.sh
> @@ -180,7 +180,7 @@ function run_qemu() {
>  	echo "# Serial Log: $serial"
>  	timeout 30s \
>  	$qemu_cmd -m 1G -smp 2 -no-reboot -nographic -nodefaults \
> -		  -accel tcg -accel hvf -accel kvm \
> +		  -accel kvm -accel hvf -accel tcg \

[Severity: Medium]
Does this change break native arm64 execution on modern hardware?

Since get_arch_conf() lacks the gic-version=3Dmax parameter for arm64, QEMU=
 will
default to GICv2. On modern arm64 hosts, KVM won't be able to emulate GICv2,
causing a hard failure during machine initialization rather than a fallback=
 to
TCG.

Should gic-version=3Dmax be added to the arm64 QEMU_CMD to safely enable KVM
acceleration on modern hosts?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008132813.1966=
023-1-dmatlack@google.com?part=3D1
