Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794837903;
	b=DVk10xZCg9hr060V/iNdKmATn7xqKjkccct5rXw23c7fjuK2jfQG+ZoexB1MAYoDAWdL
	 8YDJKzVeSrG27OggznLz88MSs0i9Dv2768V+t0og70mRfmE7IjvxRie5ZvS4tb3wyWv2L
	 20vvPILRCDSCrA+4JJ4vLG/pik1DaIygylEJesJet/yVgF91lz4V2ez4wbBdUePGobiMq
	 OrIhh3v3N4IbXaYFd2qvPN/Lx6iqd6wP41Xc2SsHw3Thsv3a3i6HmQidtFVy7HqQo5UV2
	 4hAZ5mR64trim4uQBts/g9aedXOjCzNyH1URe5EbhIxmD0S4UwTpX36PY2oALP/+8cQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=IiIU9t/pme/D3WoLNwnnikBF+jtcauKxTw3ofmYpCiU=;
	b=MuCSTf9ro/7bgxcIAhUzNDKgqIHeBSX2bze+PtsCHGGrWsNkgszc6c+Am1WJr9rBtj0t
	 fRkU5zKIRC4lHGKxJyGxEpLCi6TVmguQHUK67ZUvO36S29tpOEK+ie3Iso2NUb56+A/9v
	 pvDKD2vairpzqA6ZT8+ZEL2cTu1yD1c6vCnMliwwcKrUmc+ewgC+uXcwDrW0qgHWJTtnP
	 Fb79FnsJe5UtUlNgas1pNfj1tTM1o24bte2jiP9MMpuCKkSBYxjrC1Mnwo5AF35EC++sC
	 VL7RN1w7/LVV2bbhQ4/XJxDDaEBlIPFAwU50t8kjdxdfn0JKt+cYo8PadXXPT1fHzhQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b="RDRD/OcL";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B07F606A32A
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 14:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B07F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=RDRD/OcL
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-716c0217635so4580172eaf.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 06:05:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794837902; cv=none;
        d=google.com; s=arc-20260327;
        b=s9rtcQPbBUvB9AdWZYxVTWvCRfNHNPrMLHMCTHPBw5JuNWxPUFIo/snxF2Y6UmycgM
         37JyGU/CjdVycb1Hna1Eha1eifBlGaMg16IKIK0NCsVuGHm/NsbZdNIeJlA9iGzAdTHL
         CsFsmtIqraiTMCf7h36Nc/WWcP+hjadxYql8ARjQ3YERopRCz3/3kEESRJvB1luIlryL
         625g+wi1Czxl/2uHBN9VIfuvfiCNe0G0fWSeuw8a4duMoWJt71uNFm0XfnUccNy1xU/T
         TLksoWy0GkyfQz+0Evuy0mDlSXDoWbdN+tgRqhhtMdNLoATKlqAHywc1BT7Sey5Bc7BP
         FLuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IiIU9t/pme/D3WoLNwnnikBF+jtcauKxTw3ofmYpCiU=;
        fh=KOpSQUge4zGaBczMKLABYnifrIjLSeiwDgfO55i23rs=;
        b=VimkMTMTINiicnhYY7fsQHvOzBmB58w8QwPqQuVb+VnNXNHaZ6e+f3wQSsYikYnkvs
         GNaQ/bSEBGCa4EIWhYIOOfbS9ju0jAILOAnU20usLsHbPYvkKuKL71qPUDc/bgPW4o6H
         qEQhvj94Ghwpmod/jv/O8mzgnl8Tr6jQH+Rtp08bmGAD9nuSqOmteFqzepv+6Bi+etzL
         U8lii1kZ2It80XtPYakseKG7mAsyXUCggKq3IYgGSUf1i/iorrqwbRLVlfeVEPcQvFxK
         SoKsxtvjh8hrbJ9hGl+bDVSdnAKf4uMHRk1O66M4kN2YliuNEeg9Psu/f7bPjcAuUUNO
         aIIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794837902; x=1795442702; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IiIU9t/pme/D3WoLNwnnikBF+jtcauKxTw3ofmYpCiU=;
        b=RDRD/OcLdIq6BBPMomGGzPawAcj++fY9/uI9T/1dA72dsAu8agY8Cu6695ALuLwM0n
         8y09N3w3OnPRYtLA+0e+4U9RcOnky1LhgUOxXzhjjfWtcgZu2/11KvN+/ArJuO0D3/uL
         AyPFayZijP6GzDPeUrJPAizS+wLTSC4SmUVsvfBY1Ile6aaQ9CPg/kv99IdzqKSiLgcp
         KkL/sqlkUbnuggAYKTgRgmfPG3aEwE4AOQ8e2We0/RHTjfPWdEnjmhtf16f6MefhQPs8
         wjXI5xul/QtA/M+DzPqpAjwMvOpyB7m+LDtVfZ6yuRFcXnnU7LE7HpmL5egmcfFarZcf
         uaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794837902; x=1795442702;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IiIU9t/pme/D3WoLNwnnikBF+jtcauKxTw3ofmYpCiU=;
        b=0areKC+9CDja1qE6NnP1F2J+1p+KnWeSdEWKfFXqwYGnBy+cfTpieYfv8Zq5YCXnE4
         BlmmlmJqEoWneGswd1oqmkD+4vVVXbqBngFcVn+7esJcYPsO0mtkIbmxyIN0m8AmXgKc
         WQsvkeESR6dF+Foz3+N0ZcFT14kbhlT54MQBIYJj7RId6b7ncW8BUbI3mJQSHtmMkF4s
         wT+W6sPuyi5Fhzf2BF9Er/mDdjvOZvGAGByoZzJ7/OPGYrXFDaoylXMigeLQLSlmOf9f
         GIm5M5nVops6OS3iFpj6eu7JWyouz8qPfCGU2c/EZb1Vx7Iy22GTTZpWKvGjuVlChuop
         Msjw==
X-Forwarded-Encrypted: i=1; AL+hErEFs7ln8BePEbEAvwLzQotE60YkohZNU5e7VbdZz0EcGD703jbDa+tdcUOsq1Oy8IAt9kuQn/n5jyfjBChMdA4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/y4T9KK75Fc12IQ3XWl+vLnInu9cbxIBHRL5zwjt6VAP639jcN
	QgpT4lZ2jNEaaLTsGjwV7vgTF/9LULlHVABnskd84z55kXh/pTkjLNYrOynwPVUAK8RiQ7h+DsX
	xoCD0O8aTH2Eh5X/Na7k+yUJHJF6ExWnuiJQ4o26yMw==
X-Gm-Gg: AYBFou1KKYaNFZrbmvYEhBhQ2xu7IxjVeM9r+UWDoooA9HbaqAKa+Tae1xQeSTSpF7i
	PqTjjJzgMJXB9U1YMSn/0/zaBHBvn0aziQHTkcm3pxNJ33/+cqaM3bJ0INOs5A7iaVCI1Yl3kxN
	4nfruHt8sAQR4O9+HLZQmijQMG0+dk8mFtm/uCZOX18MefMkqZCPuOtL+l3KG+yuNXbftyzc4N2
	Pq16WTt0tVHONp8SHnQ4meuHTU5H8JTn2hWIm81VuSoO0t/fKE4/IDlJpWSHKiAcgTGagU7+1zZ
	TTT9hSHffUqtlWPAROzvuO23zA8i7B70vRaLsuERakCThsZsvb7YvcJFpA3I0PD1LqbChMvMhe/
	3PF0lHEXgxiF0BwI3sa+7GkqX0T4nk03oPe6ffkUWkJXHgL0OwhXPdRC0oBfBH1WDVEiSVy1Z/8
	4hHK7Ki8aYp+Dxyp5H1V6mtp+zT40pkGY=
X-Received: by 2002:a05:6820:7093:10b0:71a:ea6a:4f51 with SMTP id
 006d021491bc7-71aea6a5809mr1437630eaf.14.1794837902102; Mon, 16 Nov 2026
 06:05:02 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAG4wq-cd01i7YrcFPmma=BXUcwn_PK=wneKW=vyEBYzQ3Bn7QA@mail.gmail.com>
 <20261116084107.6675-1-emmaonana18@gmail.com> <20261116084107.6675-3-emmaonana18@gmail.com>
In-Reply-To: <20261116084107.6675-3-emmaonana18@gmail.com>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Mon, 16 Nov 2026 14:04:50 +0000
X-Gm-Features: Aa3M54qRdeOnU1gJ7x3s56OW-hJCPdbvkrK8BlxFfQsIh19-OFAy7vmiVdSA8Lw
Message-ID: <CAG4wq-d_30-B4wQZu48ZQXAORM4QxRqPfmYsmoHS0hiYp1EtTA@mail.gmail.com>
Subject: Re: [PATCH net v3 2/2] selftests: net: veth: propagate bad-settings
 check failures to exit status
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 09:41:07 +0100 Omokefe Emmanuel Onanaroghene wrote:
> -             echo "fail - set operation successful ?!?" || echo " ok "
> +             { echo "fail - set operation successful ?!?"; ret=1; } || echo " ok "

Two small suggestions:

1. These lines are 85 columns wide, over the 80-column limit.
2. The style is inconsistent with the rest of the file. Other checks
   use if/else instead of a "cmd && { ...; } || ..." chain.

Cheers,
Tianyi
