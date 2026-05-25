Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD603D3492;
	Mon, 25 May 2026 07:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779695306; cv=none; b=ads913zKNiUiLDiuRv6LRDOu7q0pU03wC69Af83BKEO8IRj1wGAd9QP30xXyVPvO/l29Z3UmZ7/wPLETAS885jOl2wODPCNa5pja/IZeLu9fEXfO2ZeNKfmxw+j5mrgCEABf1LqadVdK0FhOC7QDDn2LOKVGpLrozMTCgjavd0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779695306; c=relaxed/simple;
	bh=P+k3UT1fivq4Vpur3w2/LPBZCu45ilvoIApjnDARo4A=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Aq6AC07/cbCtyJujIM3uXCVsIDZ5CSYn8XQ3JANvAUBBXnjn1SIEynd7tns09yGiITOsnltlBWufyhpgMgfBbiJs8ogKja0+XZASVn7YzANqV/esCtWCN5MrcrzH9ai/OTKgQ9aM/g/JTkKsiR9OWdQglULSXeyR5N0dErQmxS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VgFiOYr6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VgFiOYr6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D4C1F00A3A;
	Mon, 25 May 2026 07:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779695305;
	bh=wjY9MInIrdeSdVKHsoHljcvbmHUlFL7f0hkiG9rqDjI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=VgFiOYr6S0DjulovWK0ttkMDGLLywevPI+YoML7qLCufLrKNwD3HggOMvcwOvMZaq
	 ZUXcaANqTQn6CBaR2TxSV7UQP9sudD33jQ+3G3cXfeZzHr1P0J7uDno03Tjf/m3Brd
	 dZLaEJgrFCwqUxTxcgRgmtxmdGPU8kx6GdhoMcVFWnjdW9KkXlDIDReZbfy+uJSznU
	 Zc49VqyBE/QJwZ3fKbhtsyqEFRw9kgbLPbmv1uYAd9/3rO+6jdvqzz9V7Khxhqa59D
	 QgRJB8XB7KoTHf5deafYNRqiLNNXUxfR2fStlLk4NhXKHFpMLmACTdxGgBRtAwAs2r
	 I2EekSJyNzmow==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 7/7] selftests/kho: handle QEMU not exiting after kexec
 on LoongArch
From: Mike Rapoport <rppt@kernel.org>
To: George Guo <dongtai.guo@linux.dev>
Cc: chenhuacai@kernel.org, rppt@kernel.org, pasha.tatashin@soleen.com, 
 pratyush@kernel.org, kernel@xen0n.name, graf@amazon.com, shuah@kernel.org, 
 loongarch@lists.linux.dev, kexec@lists.infradead.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 George Guo <guodongtai@kylinos.cn>
In-Reply-To: <20260525062810.103367-8-dongtai.guo@linux.dev>
References: <20260525062810.103367-1-dongtai.guo@linux.dev>
 <20260525062810.103367-8-dongtai.guo@linux.dev>
Date: Mon, 25 May 2026 10:48:14 +0300
Message-Id: <177969529482.4047269.8837009779600841681.b4-review@b4>
X-Mailer: b4 0.15.2

On Mon, 25 May 2026 14:28:10 +0800, George Guo <dongtai.guo@linux.dev> wrote:
> diff --git a/tools/testing/selftests/kho/vmtest.sh b/tools/testing/selftests/kho/vmtest.sh
> index a6ae9ac09595..3cb9674e4475 100755
> --- a/tools/testing/selftests/kho/vmtest.sh
> +++ b/tools/testing/selftests/kho/vmtest.sh
> @@ -103,16 +103,37 @@ function run_qemu() {
>  	local qemu_cmd=$1
>  	local cmdline=$2
>  	local kernel=$3
> +	local arch=$4
>  	local serial="$tmp_dir/qemu.serial"
>  
>  	cmdline="$cmdline kho=on panic=-1"
>  
> -	$qemu_cmd -m 1G -smp 2 -no-reboot -nographic -nodefaults \

Just make it 

	timeout 100 $qemu_cmd ...

for all architectures.

-- 
Sincerely yours,
Mike.

