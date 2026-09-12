Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088043939DA;
	Sat, 12 Sep 2026 20:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789244137; cv=none; b=XYW2VkqHsIAWkeUFcGGNQn2aD+Dsjyys5P4KIIC4tpwgpvw9O+P1wWJ4QKABcwIb7dz7tZTgByOcZhAZvdLRHulZrqTYxeOCJYYZ0n/4R5b/S/wu1G0gfladhCz54oq7ne9hUtBPrhRrRFmqGy3VsG6SnpCzBaqsb+tHlbgox4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789244137; c=relaxed/simple;
	bh=RBfOOrvGVKYpvKa9WYgQvXelfxKbRw8hNtklKHzkVmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XuAycZNHBS3XWyZa4ALCZgNv0HGTvkdREzeyIOfv61+oTQ6RmV1dexfWXpS0RNvlxPEbhZ94wB3kpnxHUZkneKNlyokAyO0pzcBtPRgdBS46UWWdCttkXKeSTWxqqBm3cBdaYLy2bkIhh7NA1moHsTifjjs3ynV0x07g27V0Y7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=ay4kXHmq; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="ay4kXHmq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1789244131; x=1789848931; i=deller@gmx.de;
	bh=6WUjO+iYEe9g3VShEkT6lGDDK9JtMes2E/iuWLhxqus=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ay4kXHmqQU7EZtNNiJrRztPaOUXkerYPXdP9tBjPuM3fJqIO1rIs1+9HI+U6qWB+
	 cUSgKfLUkAf/KRTKEx1WDtTot+asds58s33v7cyz4E5MCVU7gWGsM3B1ZP0rvvHGR
	 tDznNIqQ5tfbllxC4euAVBOLjhyFRWIQBynZuFzPImHQs1cWUHys+F/DwST+d888w
	 nBoxLChtR7iFRHXiDzF9Twmdm51CeDY5dgN7+6HlYm8AdZn6gkVyXqx2Ppg7kzzAH
	 LWb/Shx7XTVW43tMeVaFwzzrBxv/ljdQN0+cD04GQaGyV5V8NjwUUsYvYJFSaFwps
	 FyyrHKks6SKOrVYFow==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9dsb-1whznS1VQr-00yWge; Sat, 12
 Sep 2026 22:15:31 +0200
Message-ID: <495ef25e-0bac-4f98-b0da-ae0d96dcea59@gmx.de>
Date: Sat, 12 Sep 2026 22:15:30 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/nolibc: add 64-bit parisc support
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-parisc@vger.kernel.org, David Laight <david.laight.linux@gmail.com>
References: <20260831-nolibc-parisc64-v2-1-022f9beff7a6@weissschuh.net>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260831-nolibc-parisc64-v2-1-022f9beff7a6@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YrS/kthw2SrEOpzLlefPYJ0vb+i050KmqdIzgpX25JGKLKK5LSd
 EKgKS6qanio3dga0HpxQ34GX1I0ahpVjOyGlnydfTDIKg2KJ73CK875vw/5pDMe/3hMRn7b
 /+a2XRiswmjHy+0D5Td9y3xkT/PovFCVAZlgVJbG7XSEAsYKdNnCUCha9lEdSj0fUlFmDvu
 mClZu/SWRFeFCR54nkzlA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UpAeh4xl5OM=;U4KRCpjSwVGLlMk7zLjB46VX2SQ
 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

On 8/31/26 06:32, Thomas Wei=C3=9Fschuh wrote:
> Extend the existing parisc support to also handle 64-bit mode.
>=20
> Some peculiarities:
> * The nonstandard ftruncate64 system call requires a workaround.
> * The linker defaults to main() as entry point, which needs to be
>    switched to _start() explicitly.
> * The linker defaults to dynamic linking, which needs to be disabled
>    explicitly.
> * With the default -Os, gcc does not use 64-bit multiplication
>    instructions, requiring libgcc. Use -O2 instead.
> * There is no qemu-user available.
> * CONFIG_COMPAT needs to be disabled to avoid build errors due to a
>    missing 32-bit vDSO compiler.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
> Changes in v2:
> - Rebase on latest nolibc/for-next.
> - Fix typo in comment.
> - Reorder conditions in run-tests.sh.
> - Fix llvm=3D1 check in run-tests.sh.
> - Link to v1: https://patch.msgid.link/20260820-nolibc-parisc64-v1-1-067=
ebe7c8efb@weissschuh.net
> ---
>   tools/include/nolibc/arch-parisc.h             | 26 ++++++++++++++++++=
+++++---
>   tools/include/nolibc/stdlib.h                  |  2 +-
>   tools/testing/selftests/nolibc/Makefile.nolibc |  5 +++++
>   tools/testing/selftests/nolibc/run-tests.sh    | 10 +++++++---
>   4 files changed, 36 insertions(+), 7 deletions(-)
>=20
> diff --git a/tools/include/nolibc/arch-parisc.h b/tools/include/nolibc/a=
rch-parisc.h
> index 417043ecbc53..5c595ef88a62 100644
> --- a/tools/include/nolibc/arch-parisc.h
> +++ b/tools/include/nolibc/arch-parisc.h
> @@ -7,9 +7,7 @@
>   #ifndef _NOLIBC_ARCH_PARISC_H
>   #define _NOLIBC_ARCH_PARISC_H
>  =20
> -#if defined(__LP64__)
> -#error 64-bit not supported
> -#endif
> +#include <linux/unistd.h>
>  =20
>   #include "compiler.h"
>   #include "crt.h"
> @@ -167,9 +165,15 @@
>   void __attribute__((weak, noreturn)) __nolibc_entrypoint __nolibc_no_s=
tack_protector _start(void)
>   {
>   	__asm__ volatile (
> +#ifdef __LP64__
> +		".import __gp\n"               /* Set up the dp register */
> +		"ldil L%__gp, %dp\n"
> +		"ldo R%__gp(%r27), %dp\n"

change to:
"ldo R%__gp(%dp), %dp\n"

> +#else
>   		".import $global$\n"           /* Set up the dp register */
>   		"ldil L%$global$, %dp\n"
>   		"ldo R%$global$(%r27), %dp\n"

change to:
"ldo R%$global$(%dp), %dp\n"


Helge
