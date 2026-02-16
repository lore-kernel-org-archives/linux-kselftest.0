Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A85C2C15BA
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Feb 2026 17:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771262505; cv=none; b=du7qG9ai0R8qG4Oq/j5xYI3S00UxML4zEJJNwUIhNNaL9uyuI20Uer96VEzy5E3ZWTDEz1JuZsoRzacaUJtc6MD2HSOSLRRr+68XfwUeqhFGsvqaF8hiAkxsuUNpQbu1iH3G+Zsd/58+7atBj3H7Ss6JexdEGhhZ/fiiovppDVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771262505; c=relaxed/simple;
	bh=c6CTslHT4nO1dgMCQ1AI/ki9lcEWwsS0luH2lkZaV/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Igxdzxycqf/uCNC1U6cgA94g76yYFLSwriVK7Y3QJLdGsFIJAAAShUjfbOLXBWKzIelkcb0WLADxVoJYD4QmoavyUUWhyPOkvuaZvi6eyqBBCwbJAlII2ZRaOj/WX+3Ua33A1+K0W9x5naD9gpx0oP2n4J2fePXZ7Xpran1y+uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXBYzTze; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXBYzTze"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48375f1defeso26538605e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Feb 2026 09:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771262502; x=1771867302; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NUYsiLQQb1qxD78TUcLFJF8LYak17Djcv7sVzcOMuzc=;
        b=FXBYzTzet7+R4yOtBUKkgyr0JRLyCCVVsHm0e5U8TqzNegfI9F+YvurJNTFCoJRG9q
         6T2HOSDUOleGbLJzQyNmnxTieSMxoBX7RiAk0VT11bghL1dz/y4l+Lf8REsyuergnggk
         5LVIswNSyE24nIKeQziOGsYxipY/FMYLos1MIzYTAQ5l69RSIuMLyRlqzSxjoNs7E1NY
         pI/v/I26nlFLha2OW51crjJPm1ANXYYj71eXTJFDbEQq1V/H5ojPp/5yIlZ4GQcgSbFM
         KRmwoqFj1o6hFDrxe+JY6A6WNpt/PbxLstE1lELzA5pHhDJ5v3eqSN+2/Tq0Pl8EZX8h
         MgoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771262502; x=1771867302;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUYsiLQQb1qxD78TUcLFJF8LYak17Djcv7sVzcOMuzc=;
        b=ay4Yo0f9jC/N5CmHKM+e4Az84OgSCBM0pNZMCU+eoYJnzDkoaMR9KUoLxh+chxroow
         dTiUYliGlmlnWXXIh2FHcjteNg2rl3biqflVy1zEACQlrtjb0+UpqHFb2dG1+vTpT39r
         j06jHSmW8whFkpkRRbO+wA/thkqFsQCPdIv0hQvj9zs+G56yapW4LHM7DAd1iuk217a1
         9l2Oevik5VpRVrFSX953pIFIf+f//CttgW3Q24bHogdZz0b2U/55Jno1ud5wKmOT5RDl
         Gc3+nZetCoixeS8m1RBnVDN1X94otJSFevS6NFUZwnrS1zFvYjgqE2rgEVWF4cVJqCWv
         usoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVak3paeaAldNYl1G8KPDoqAmYI1GJyT9LgaMK0Q1fbU7gW7h90Sn5kXM7J6BtO5MEnQNYzhtGZFA3o846WESU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4N3bf3YS89eNLDj5aQr4saCZ2qLxgbqtTevX9kXje3GzHeMq9
	l0YEueJMV++oTH+XRlmsaLMD5zEyu3GG0t7sj9VCB/Ki99fXFoxJc/Ch
X-Gm-Gg: AZuq6aIFG0IEWxrau0kqXT1en0GvXz5Hg76F40vARznOuEPxCzTqi2qSARMwIlPOMG1
	d80WlyQVZ4lEJhjEP6s3xeEXWWwb+hmVKYD11kMv4igXoOrFIUC68uAKUoa+ay53VNNiJSCTO/l
	H/L0T17Ho/mzl3PHJHyvY3HY5n5VBanBsTcg4tv6XoWULT1jTGhmtKnfi7n/suxmeVqTjQcA+vl
	Lfj78Gsnwl3A9mgeIWw7IY6v+405a1ZsWE9rGXG8SeZgg2GACLV0nZOE7QPfoO349vE6h5c7nm/
	g5CN2XOLlH9xhMYXW9NXh07WW7iKGBx/lJKIIpJaNWeXUZtSfYLrp/vcLJXznKXz2VuuLmSJgB0
	6ZDAgT86eIieRdYniJMEzg126lkAK26/zA+mjkvZAG9I8zwAGWhgekuJbikxACORhazd2GiK+KO
	ZjHGVLEpD5OUBKwkVzGdxx4oZ9Ofj1Ddv/XtgIj3npvQ510x4SNb4FEENJNUQqYmH2
X-Received: by 2002:a05:600c:1c22:b0:47d:18b0:bb9a with SMTP id 5b1f17b1804b1-48373a786f3mr207765765e9.33.1771262502336;
        Mon, 16 Feb 2026 09:21:42 -0800 (PST)
Received: from ?IPV6:2a03:83e0:1126:4:b45b:76eb:2b30:c35f? ([2620:10d:c092:500::7:abe1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abc21dsm29890450f8f.20.2026.02.16.09.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 09:21:41 -0800 (PST)
Message-ID: <3658dc31-630b-48d2-b47b-d174c73955cb@gmail.com>
Date: Mon, 16 Feb 2026 17:21:40 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf] selftests/bpf: Remove hexdump dependency
To: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Mykyta Yatsenko <yatsenko@meta.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260216-bpf-sft-hexdump-od-v1-1-f8cebd8eb9d0@kernel.org>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <20260216-bpf-sft-hexdump-od-v1-1-f8cebd8eb9d0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/16/26 16:30, Matthieu Baerts (NGI0) wrote:
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
>    /bin/sh: 2: hexdump: not found
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
>   tools/testing/selftests/bpf/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
> index c6bf4dfb1495..5a618d14243e 100644
> --- a/tools/testing/selftests/bpf/Makefile
> +++ b/tools/testing/selftests/bpf/Makefile
> @@ -723,7 +723,7 @@ $(VERIFICATION_CERT) $(PRIVATE_KEY): $(VERIFY_SIG_SETUP)
>   # Generates a header with C array declaration, containing test_progs_verification_cert bytes
>   $(VERIFY_SIG_HDR): $(VERIFICATION_CERT)
>   	$(Q)(echo "unsigned char test_progs_verification_cert[] = {"; \
> -	 hexdump -v -e '12/1 "  0x%02x," "\n"' $< | sed 's/0x  ,//g; $$s/,$$//'; \
> +	 od -v -t 'xC' -w12 $< | awk 'NF > 1 {for (i=2; i<=NF; i++) { printf "  0x%s,", $$i }; printf "\n"}'; \
>   	 echo "};"; \
>   	 echo "unsigned int test_progs_verification_cert_len = $$(wc -c < $<);") > $@
>   
>
> ---
> base-commit: 886bf921ecfc30f8f31341bc26560d8bf08b937b
> change-id: 20260216-bpf-sft-hexdump-od-abd07a3bf026
>
> Best regards,
Works well.
Tested-by: Mykyta Yatsenko <yatsenko@meta.com>
