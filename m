Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794666589;
	b=UGxcD36+7O5FbSHYVEN9R5bm0LniyAY2Q1o5Ec15/5cteMtBitvvGt4mdwFrq2VpEy+p
	 YoouTsdDtE4Ub1fkf4zluV8P1BMl75wEd5Uc8ARrvFWBypPT8BQkrMT6C5mWVQPVxYZdO
	 0l1h1rFc9Dtx7YU+PyojgAbTNlT4yM984uQNRCx5o4NQKu3ec28iuoY52AlXuI7wy7gk3
	 u1rDZRCNeeFravOj7avFvXjNL25vz886QQH7c8qJKaXniIDJZsDA6GPGlNugoa500mk8h
	 Fzld7/i04IRF+XwV/jmRRT/ZoigLrxyRLEQbEzmrx3Nv2IK0WWpo/ud5GVLhhuNg6ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=f7HvEUVX2tM63yR8jJepOym4Rh82WzMm5BKq2XP3tdo=;
	b=mFru0oFz+vMGd6La9BJBqmFJv4824Mv7KR6JCe4c9WVZcVcpy7d6c44ulxDhktNHu4K0
	 wCUoMLcWEaI66lqZVa7n3bzTqzC+gmb/J0Get9lc6J3gklrJ1xsr4Fie62cgyQZ4dIIcb
	 DTiC+gf9ltEItgcTgbcarQ9cdgn+ddG3p8KI5NcFTc7I/eqgJztE3xzWWLLRnlJMra+bd
	 lCj854aLIw2Rj157aAwzfNt46+it/mYO59OG/UlK7wAa/G7eiw2y02KY6y7k5IDAGFkG9
	 +3wUDGqcvfi6+Xcam1MgUW8zB4BU5Kl2MMwth2BBiWY3X3xHNNpB379ATtLAWhFh9Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HpXUScZA;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC27606A33E
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 14:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BC27606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HpXUScZA
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb61185057so4201295e9.1
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 06:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794666588; x=1795271388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f7HvEUVX2tM63yR8jJepOym4Rh82WzMm5BKq2XP3tdo=;
        b=HpXUScZACECxG4WhYK9jGinw4ofm8bkHLlHgC0rBsHtIayapJcUt8XtJ9A4FyTa+0R
         b11ZZl2iA9Rt1NDyvpXbeIbx/vRd5ZvFj5w1jFmYZeMLRs9m5fVvDbY3vrjzhSfID396
         mOAkiNkyBVDYGyFsa/NpUbcwMPhaFxsa1fLW7EweVi5rQKuP7G4cM2ZTXVJdeTpTeBAD
         SRDgnS8P+coEsSP/TyqY71F+vuh57tkCCTVD0a4jCahViewn6GustfvWM28hVIWR8R2j
         nj0/m6qQQ/P474IGCzI1zcrvTFZEhdaRMpal5S55MO7kkJ3J/gu/oezSqKL6jJNz3bHr
         Chnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794666588; x=1795271388;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f7HvEUVX2tM63yR8jJepOym4Rh82WzMm5BKq2XP3tdo=;
        b=mcr9sR9jC5uWovZm8BTe5Px8x61z2m7HSkFmM3IDuEqxqlHge81d1lh1TEWZx+BWyA
         ZykqK8rcvDLlbj6ijLrl8u648a+zfsn1WrIHj4FxfTPBwjQhLcNVs59M9AzPXc2d6rYv
         jb/Es753frkLqutbPdMxEOvm8f23wNhozF398i5K9b54MJDb2MFafQ9+tpo/2otAYRTP
         NpeLwkgGFvEtOwBFtlfpi5eE3J8u8DyZbqCWiMQuxLLHn+Ka/8oRVFMeOgIxt+84NQ6d
         u36d6F2jBECx0s9IIcaRWvM8KCxWiKyY7Yl6tGvjkI6jn+PKiIhEjMq8aMizcFd8jaZN
         V1qg==
X-Forwarded-Encrypted: i=1; AL+hErH4P/L6BUvSkR44z/+NsibxTBQYJAecC+YR06yiGEl+T97cgkj6WiS7YOGFNcnTdaXJ1EN+Iw2vtVpNlFm8hQY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VghvxaUmFd5bqe/yWCG4/lWiiPVl+tMKs6iZmwmNHy9I6PlHw
	5l+9inyAisLhuZq9NQ3rXEcFXSW0M/Hepbqdx6eBNcUtQCu/pNRBofhQ
X-Gm-Gg: AYBFou3x4QlXpX2awyi7T/y74hcqNg8cgBzhjm2i66uknBIToAwPU3k3wG2KRRRjDWJ
	UXNXVQx8ObHsWvQBs2VgLbEureAPiO0krtJEq7dEypDL2YWA28cyLLU7FnT1zKUArUHczWGzpRk
	yJyYs04+xJPwXcAKZjaOeb3a9eRCd5gDIR5M1M8G+eUJUYlOM648xTmCR0loffPEZcgSg1dd5eV
	dg7v6sZ5g3A17ijWoKsO+h90NFMizIyzlaXcn4Wk5AXc2ROsVBktXgchPtm69Yfutw0L3se6Rts
	MCZ+Vb/PsVsDBzb4FhQPwRODqUjoEqPSbR/piQMR9JQ5xTXklqyN46XXBIN29rIg5waeY539Az6
	SIKM6a1BGIL7zCSgh7JEGbQDs11iiAZ1+NLIWUGtlAFnNM7IqKdk2ZTIDg4G6iPUw2wga6zoI+7
	+FQFkis7VCQRlF4ytnTzo92jezJNIS4pTk8qlU25DfvFU4MdR5YAv8s269OLCqQd9SO5VnWWLY7
	aGSR835DynAz/2QN74Rc+RrY3HN2aOxCaWmin4SzFMt+jzo0awJLz2woO7b98LzO/n73k4s3g4b
	SUKao1qwebtj95YmakpUyAzKGQ8QXhHtW6hmS4H0nKlzQUUefGtIELxqIvQDR/K1Wg==
X-Received: by 2002:a05:600c:a0b:b0:4bb:685e:cc41 with SMTP id 5b1f17b1804b1-4bb685eccc8mr17988175e9.8.1794666587612;
        Sat, 14 Nov 2026 06:29:47 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56f8d054sm92922965e9.3.2026.11.14.06.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:29:47 -0800 (PST)
Date: Sat, 14 Nov 2026 14:29:46 +0000
From: David Laight <david.laight.linux@gmail.com>
To: bot+bpf-ci@kernel.org
Cc: pmladek@suse.com, kees@kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, jim.cromie@gmail.com,
 ljs@kernel.org, mcgrof@kernel.org, andrey.grodzovsky@crowdstrike.com,
 rostedt@goodmis.org, andrii@kernel.org, wusamuel@google.com,
 linux-kselftest@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net,
 martin.lau@kernel.org, eddyz87@gmail.com, yonghong.song@linux.dev,
 mason@kernel.org, ihor.solodrai@linux.dev
Subject: Re: [PATCH v3 next 02/13] scripts/kallsyms: Improve error reporting
Message-ID: <20261114142946.4d696bc5@pumpkin>
In-Reply-To: <8c6f9e7d8a4cb037b480c22ba2b6866133292bbd68ebdc777e385373950b793f@mail.kernel.org>
References: <20261111115911.1142000-3-david.laight.linux@gmail.com>
	<8c6f9e7d8a4cb037b480c22ba2b6866133292bbd68ebdc777e385373950b793f@mail.kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Nov 2026 23:33:55 +0000 (UTC)
bot+bpf-ci@kernel.org wrote:

> > scripts/kallsyms: Improve error reporting  
> 
> TL;DR:
> - Error message for failing to open the output file says "nin.out", likely a
>   typo for "out.bin"

Indeed - will fix (and in #4)

> - usage() text for --all-symbols may be inaccurate: it covers all sections,
>   not just local symbols

It'll do - needs to be terse and it's a build tool.

David

> 
> > diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> > --- a/scripts/kallsyms.c
> > +++ b/scripts/kallsyms.c  
> 
> [ ... ]
> 
> > @@ -822,6 +824,25 @@ static void sort_symbols(void)
> >  	qsort(table, table_cnt, sizeof(table[0]), compare_symbols);
> >  }
> >  
> > +static void usage(void)
> > +{
> > +	fprintf(stderr,
> > +		"Usage: kallsyms [options] vmlinux out.bin > out.S\n"
> > +		"       kallsyms --sysmap=out.map vmlinux\n"
> > +		"           --all-symbols     Include all local symbols\n"  
> 
> This isn't a bug, but is this description of --all-symbols accurate?
> 
> In symbol_valid() the option only disables the text range filter:
> 
>     if (!all_symbols) {
>         ...
>         if (symbol_in_range(s, text_ranges,
>                             ARRAY_SIZE(text_ranges)) == 0)
>             return 0;
> 
> so symbols from the data, rodata and bss sections are included, global and
> local alike.  Local text symbols are already kept without the option.  This
> also matches the CONFIG_KALLSYMS_ALL help text, "symbols from all sections".
> 
> Would something like "Include symbols from all sections, not only text" be
> closer to what the code does?
> 
> [ ... ]
> 
> > @@ -845,49 +867,57 @@ int main(int argc, char **argv)  
> [ ... ]
> >  	out_bin_name = argv[optind + 1];
> >  	out_bin_file = fopen(out_bin_name, "w");
> > -	if (!out_bin_file) {
> > -		perror(out_bin_name);
> > -		exit(EXIT_FAILURE);
> > -	}
> > +	if (!out_bin_file)
> > +		err(EXIT_FAILURE, "failed to open nin.out file %s", out_bin_name);  
> 
> Is "nin.out" a typo here?  usage() and the close-time message in main(),
> 
>     errx(EXIT_FAILURE, "error writing out.bin file %s", out_bin_name);
> 
> both call this file "out.bin".
> 
> The string is changed later in the series by 317dc01f3774 ("scripts/kallsyms:
> make use of binary data output optional") to "failed to open bin.out file
> %s", which still differs from the "out.bin" used by usage() and the
> close-time message.
> 
> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/43116767394

