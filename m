Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C6C33290B
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Feb 2026 11:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771327789; cv=none; b=bGbAutyut+SgN13jEwv0+RE4rS8XCjLXqbcs3vxtmv7StbrlIxuGPK/WrTZFVgoE/DlUYQw+0r1oCPAKJiwo86S5Zr+BOtHlpsY+C79zfE1hvz7n1OKSM1JERDhptYKdz04NpsukAQlnqQZ+J3OAd9wfz5wzqkPQ7OjBGjSNGAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771327789; c=relaxed/simple;
	bh=cMuSWvxYR5eb7V3y4b4uzhhpMV1mgsYv1SOkM72p9tY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Oipjff5KsQagzCqpcl4vD77HSQoaXO/eDJqT9iUZX7UTdK9uvSuDr41GcOHnAIEu3+YHLIGQKFru7AVw3iuRGDAbtF3+ocxUcsg090hzbTl/+iZUbH7fCa6QKhC8DTwWUb3IGGeozo9fowbfYTlhLyvaFdtoG1EXyvfpPrUm3SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyWyEd8q; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyWyEd8q"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48374014a77so35696135e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Feb 2026 03:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771327787; x=1771932587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QTNpRHxHGxeoSqckXDTYVg2ZKwL+NMU+Mba7FsgZ2g=;
        b=fyWyEd8qZ83xItAZlaWMohAPCbg0n7E2FS+SCzkMnWD6he3s4zZMIxcIf+LCKKitW8
         QK2bu5ak4Xavel2Iwu4M/S/UuwMutPagKQ9yfzrcRCdP9Ba3jbXRxdWgeQ+Em2180pmM
         MtMQiXyY2PecDg8FNc01SCZ2obyOt/tCkU78kik1US8I0UVgTEzvAqzNQ4kxjUCSK+jT
         CATviNwIM4BWJouzoCQuGia6SJJxMZ3r90E94S2YZGwCpJHshtRAc/pPMi9ALB8Fxtmg
         qD8yvQkjSBiGvRdlDoYVSsbcTtxVQBSb80ZV3sB7DNi3JPNLR6cjDvu/0WfTjstFKng0
         8lKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771327787; x=1771932587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7QTNpRHxHGxeoSqckXDTYVg2ZKwL+NMU+Mba7FsgZ2g=;
        b=qKIsuVKHEz9xarN8xfifAA4Sjza0xpw51Yfyz6AlnySh2MiZudv7ALCuCa4Ww7TW89
         o04+IpLyArAxPs9eFkyhN6xk/CY9hrHY+CDs+5z40bqWH2rcGP1W27947hbomfjlBgES
         xNgxak6Rsso486HeW+gYTahoVaDjy3qkSs6Kgca/FObK3FIPJ66BCINdPnr/J5O1Jsvs
         7J7kHEHjBa3t5yAAw7O70fSbd+N56zOQnPw2Hd4nEBOKZc0SHsQ38J0GkPaWOvBZYc4s
         BcACxioCoJ14dzF8cL5UPDRiaWhlN/lzPi/UMc5p1xumOkJnJZNFkaSXZCfVzK36fpvS
         h5bA==
X-Forwarded-Encrypted: i=1; AJvYcCU3uZigwN3H8nzuxqXsNX0OFPw0yeVJ0N0F5O1x7pe55gct5guMVPeh3FJVc8SpG+3e/exxMiiL1KuelmhzWBc=@vger.kernel.org
X-Gm-Message-State: AOJu0YybKScZootB3GSzE6KXY5XzypLRY6FyQN/nPpdZMDpVcMgzLlzV
	T6AxxTsRNMrKQRlRhwtdJFanrslEOhiwIeimMzCsp/dgr7YYbIafyzd4
X-Gm-Gg: AZuq6aLB5zaOBYOCuXOJpLeW/XshYSE/PXSuGnIpqJycsGmHuJrjduhXfzVtqfAdhR8
	9UpvUIvpBqMactzoRuLcSedXkx4KMHgiKiiu2v1FhTlwYyY62XjckedCvfE1Fec+tDAdKfnH1Ky
	292EsG1DgozhV6KtdHdlcmBaGV+CqHCaXgeQV+tbTgK88S+Y0WyrTKz14e4HAhwN5/Q1mnLpuQ0
	NSgldrfSiBv5tlx1JzLh03bFJsy8+OIC2m+4cqf4eHk27vTmO8TYp/q2Manj24J8ihnsOrlhzY/
	Dq5UCIXJnn7xD0x5cXgtvo01EontSN1AS7YI9WQQCrUDv5oGflDssaU7wuWAOlFqI1k7i5Zmc65
	x0lfI1+EZIjVx1YcWOauBc+n2U8wIjUQpM9NGVev4R+obOXjWjP1Kwwi3kXwoTOv9MbYoOGypBo
	MZe5B0KPe+WqcNeDTzj32rkyS/vZj21XYzry2Wc3vu84TILnoNuZjggits1G/8Psv6
X-Received: by 2002:a05:600c:8b2f:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-483739ff865mr193668865e9.4.1771327786470;
        Tue, 17 Feb 2026 03:29:46 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a29982sm104891805e9.15.2026.02.17.03.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 03:29:46 -0800 (PST)
Date: Tue, 17 Feb 2026 11:29:44 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, Mykyta Yatsenko
 <yatsenko@meta.com>, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf] selftests/bpf: Remove hexdump dependency
Message-ID: <20260217112944.75610d2b@pumpkin>
In-Reply-To: <20260216-bpf-sft-hexdump-od-v1-1-f8cebd8eb9d0@kernel.org>
References: <20260216-bpf-sft-hexdump-od-v1-1-f8cebd8eb9d0@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Feb 2026 17:30:34 +0100
"Matthieu Baerts (NGI0)" <matttbe@kernel.org> wrote:

> The verification signature header generation requires converting a
> binary certificate to a C array. Previously this only worked with xxd,
> and a switch to hexdump has been done in commit b640d556a2b3
> ("selftests/bpf: Remove xxd util dependency").
> 
> hexdump is a more common utility program, yet it might not be installed
> by default. When it is not installed, BPF selftests build without
> errors, but tests_progs is unusable: it exits with the 255 code and
> without any error messages. When manually reproducing the issue, it is
> not too hard to find out that the generated verification_cert.h file is
> incorrect, but that's time consuming. When digging the BPF selftests
> build logs, this line can be seen amongst thousands others, but ignored:
> 
>   /bin/sh: 2: hexdump: not found
> 
> Here, od is used with awk, instead of hexdump with sed. od is coming
> from the core utils package, and this new od command produces the same
> output when using od from GNU coreutils, uutils, and even busybox. This
> is more portable, and it produces the same results as what was done
> before with hexdump (without trailing whitespaces as a bonus).
> 
> Fixes: b640d556a2b3 ("selftests/bpf: Remove xxd util dependency")
> Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
> ---
> Originally, I was going to add a check to stop the build if hexdump was
> not available, but switching to 'od' seems to be a better solution while
> not adding a new dependency.
> 
> Because test_progs was not reporting why it became unusable, I added a
> Fixes tag to have this backported, to help others. Feel free to remove
> it, or even drop the patch if you prefer to stick with hexdump.
> ---
>  tools/testing/selftests/bpf/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
> index c6bf4dfb1495..5a618d14243e 100644
> --- a/tools/testing/selftests/bpf/Makefile
> +++ b/tools/testing/selftests/bpf/Makefile
> @@ -723,7 +723,7 @@ $(VERIFICATION_CERT) $(PRIVATE_KEY): $(VERIFY_SIG_SETUP)
>  # Generates a header with C array declaration, containing test_progs_verification_cert bytes
>  $(VERIFY_SIG_HDR): $(VERIFICATION_CERT)
>  	$(Q)(echo "unsigned char test_progs_verification_cert[] = {"; \
> -	 hexdump -v -e '12/1 "  0x%02x," "\n"' $< | sed 's/0x  ,//g; $$s/,$$//'; \
> +	 od -v -t 'xC' -w12 $< | awk 'NF > 1 {for (i=2; i<=NF; i++) { printf "  0x%s,", $$i }; printf "\n"}'; \

That is subtly different.
The hexdump version deletes the final ',' from the last full line.
But not a partial line because there are trailing spaces (from before
the '0x  ,' that get removed).
That may not matter, it is valid C, but not C++ (unless they've changed
the rules recently).

od could be used with:
	sed -e 's/ /,  0x/g; s/$/,/; s/^[0-7]*,//'
which outputs an empty line as well as the trailing ','.
Both removable with a more complex command line.

	David


>  	 echo "};"; \
>  	 echo "unsigned int test_progs_verification_cert_len = $$(wc -c < $<);") > $@
>  
> 
> ---
> base-commit: 886bf921ecfc30f8f31341bc26560d8bf08b937b
> change-id: 20260216-bpf-sft-hexdump-od-abd07a3bf026
> 
> Best regards,

