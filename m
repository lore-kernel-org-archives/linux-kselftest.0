Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D9E33B970
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 09:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796412; cv=none; b=tye+6plcRph8MYUrJyTFbrc/eNpXQFfMRHxbmDdIhgxq0cw4wOHRwX4A66mutapRID3WxVlzPzybQh0U98R75nSAa2t4dHnWy8FKIKb5kVv8K23OvmYo/KCT5e9QcSqRPsGSxgqUYpAdGPFoFVwnmUJHNJYT8IamjnOsdPIhL/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796412; c=relaxed/simple;
	bh=4H+dWSvxr8+UjpRwRI0SHZ16MiF829cfsZgcOenFqDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tzz2F23VzdGeb14zb5+TVcTniK4bKaCFf93vmeoLqn9AN0e+j5prewa26RRYJLoBna/yPPqf2Eite7PPlJhCSrplTqbG02gCMjfAK+G8pMZVziftoGBQoI0ZyT+55XeJ2cvHjaq64OBtpG6oCZ+9w+yLzk+UcdxR3JdVpBwhrXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c9e7731b34so1501355e0c.2
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 02:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796410; x=1792401210;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jPEqW4IX1dV2O20vPEsTLBe6R8QJVWdW6CAGC3CFIBA=;
        b=hSFncoOhf2aQmGAZfai/SGGQ28gxZnw7Ndxdyo0K0pZ1DaOTOsOdd7ZoGOY6qa9LOb
         58PJkSW/CCrjUAYyKdthDpq8cxYBQ159585kS73GneZN2Ak2IZ9ugMyR0ShhXVT9UwnN
         4lxcqRgY58SsAyXu6ez5YKyaA7FCpd+5W8WKdtNeWtv4sZfjTpx8QsLZ8dMvvmR43yvF
         XY9uaRQyuJFZOEnC/2USy+ZyjxoJIXJuRX3s11HhqeQ5CsZnIesjMAVqb6ULZBmeAAxY
         9coj3/t2ArI0zXU23l4pWrxqeJEp1y6hu0F08gxPaRVSKTzqzp5vAUOZ5M8xcODdQLSz
         Cs4Q==
X-Forwarded-Encrypted: i=1; AKwUvBz8SuWE/AVd0ffqTigF97HLYGF1737vbAho6IqSRwUTdBRKb/YlFgdW4Srzfi/iKyHmao3+XW6FD8cGNeKNC7w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIe0JBzK3QmVe19GBaAyZIVQSH1SKjNXBbTZNtOmeJhiyqNne+0
	t5KP0ycgSymiKtC30x196adaz2Oe9ahtET/hC6bhJ1RfqGghMoyxJ5JY9YY9+ZQW
X-Gm-Gg: AYBFou0W6DfVB+mKhJmj/rDAkcmTWFVV6574oKhzjuAXUQIXGwUmRauwzX7V+YhA/C8
	7wfcfHnTbax3muFaxkUX6OFkEzddPr5HOu60ZD6a6kJHkQ8i1jcc9KWRWWpSX9HxpGYkjxNSCtB
	hkQBejLmAC2eHShgoex5osAESZh0gcX5qzPMNgVRJlnFC1QIguBxm06fSgXP227wt3LlNxXLHUY
	WyxBQ30BTTkRQw8C0ohGZeAfrIqpmzjXe6hjhdOd0AdPFdcsMERidT0ltI5pAfhxn7RtHMqENzG
	0HZFqxP5Xeoj13T0GJUOTdo+zvPZYeM0e2KTX76x/i7r1fV/cK2b263zTg6+jVerVWet26Is549
	qj9HgxaGYpsTh38RDvz16KC3GswkKho3qb6M19imHqO/UY5acZLQnWRrxfqLKX+OZUrbR3pfXya
	K55DMla6w7DQH16Z+t6DgXIGaqJHFeBcYlj1b1SM/nZi1Qbh/IYF/02AljAQ3TFvXmwlyAUFodk
	Ovapc01rdyWIDa5IRI36u7UyfeMN93Gghmx
X-Received: by 2002:a05:6122:9006:b0:5c9:c60e:3a3a with SMTP id 71dfb90a1353d-5e91f4e2199mr2774432e0c.18.1791796409779;
        Mon, 12 Oct 2026 02:13:29 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e94896af36sm1767463e0c.11.2026.10.12.02.13.28
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:13:28 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-779d18ef706so862914137.2
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 02:13:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxMbv88eX5wcTplunCZzbvvXQpozVFqCZDOWjt7TpLJZq7avEthy2MtFcRQVxrR/ZVVaFKc+WMhRL56ZVEFrzc=@vger.kernel.org
X-Received: by 2002:a05:6102:4490:b0:7a8:10eb:96ce with SMTP id
 ada2fe7eead31-7cb3668a4c7mr2485869137.4.1791796407802; Mon, 12 Oct 2026
 02:13:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002212058.25117-1-kmehltretter@gmail.com>
In-Reply-To: <20261002212058.25117-1-kmehltretter@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Oct 2026 11:13:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXPMSyHy4tU5Sq4y=ssFZy8Ktd_OZoFr9L2sj-m-=wFkg@mail.gmail.com>
X-Gm-Features: AclHuK_y85x8cMEVOZECVsvp7GHPU25gGQ7oBbJZUrQ3T9LAbD0GI07OmtaZn9U
Message-ID: <CAMuHMdXPMSyHy4tU5Sq4y=ssFZy8Ktd_OZoFr9L2sj-m-=wFkg@mail.gmail.com>
Subject: Re: [PATCH net-next v3] net: mctp: Make flow KUnit coverage an
 explicit opt-in
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>, Matt Johnston <matt@codeconstruct.com.au>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Karl,

On Fri, 2 Oct 2026 at 23:21, Karl Mehltretter <kmehltretter@gmail.com> wrote:
> MCTP_TEST selects MCTP_FLOWS, so KUNIT_ALL_TESTS builds flow support and
> SKB_EXTENSIONS even when no transport needs them. KUnit's style guide
> says tests should not select otherwise unused functionality. The CRC
> and crypto library tests use explicit ENABLE_ALL_FOR_KUNIT options for
> full coverage.
>
> Remove the selection from MCTP_TEST. The core suite remains available
> without flows; its two flow cases use their existing skip paths. Add
> MCTP_ENABLE_ALL_FOR_KUNIT to opt into full coverage, and enable it in
> all_tests.config and a dedicated net/mctp/.kunitconfig. Both profiles
> run the flow cases without a hardware transport.
>
> A plain MCTP_TEST=y configuration without the opt-in now skips those
> two cases. This is the coverage cost of leaving otherwise unused flow
> support disabled.
>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> Changes in v3:
> - Keep the core suite available without MCTP_FLOWS; a plain MCTP_TEST=y
>   configuration now skips only the two flow cases.
> - Add MCTP_ENABLE_ALL_FOR_KUNIT to retain full coverage in
>   all_tests.config and a focused net/mctp/.kunitconfig.
> - Drop the Fixes tag because this changes test configuration rather
>   than fixing a runtime MCTP bug.

Thanks for the update!

> --- a/net/mctp/Kconfig
> +++ b/net/mctp/Kconfig
> @@ -12,9 +12,23 @@ menuconfig MCTP
>           devices, you'll want to enable a driver for a specific hardware
>           channel.
>
> +config MCTP_ENABLE_ALL_FOR_KUNIT
> +       bool "Enable all optional MCTP features for KUnit tests"
> +       depends on MCTP=y && KUNIT=y
> +       select MCTP_FLOWS
> +       help
> +         Enable all optional MCTP features covered by KUnit tests, even
> +         when no transport needs them. Currently this selects MCTP_FLOWS
> +         so the two flow cases can run.
> +
> +         Without this option, the core suite remains available; the flow
> +         cases skip unless a transport enables flow support.
> +
> +         You still need to enable MCTP_TEST, either individually or through
> +         KUNIT_ALL_TESTS.

IMHO adding yet another symbol overcomplicates things.
Why not make MCTP_FLOWS visible if KUNIT is enabled instead, like is
already done for several other symbols ('git grep " if KUNIT"')?

> +
>  config MCTP_TEST
>          bool "MCTP core tests" if !KUNIT_ALL_TESTS
> -        select MCTP_FLOWS
>          depends on MCTP=y && KUNIT=y
>          default KUNIT_ALL_TESTS
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
