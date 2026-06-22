Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F254126BF7
	for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 17:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782148530; cv=pass; b=l8lzbgr4REGUqz+qznrhwA0RmWgs4/6AByohjdlyJFqGhPAhwoceiZsDkJOmdHlnvlcYCu1Z9gwKYlDjjWqLDH7iWZmDfolILQlFy5GLcWHGwQNhsSQY/rPPuZSr8+Hfy5dxb2+uLSAosi+54WMSPOk3K4jUil59WS7IF7c3cwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782148530; c=relaxed/simple;
	bh=jsOJdEA7JTwepZ4HyFdpCTUsNbIqQicD8iian1/afmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MbNSbFbASq0BplG86XF4e1EtWBoE6OnlGGnI2BoqLJ0D99oUERmWYBk3g9O0xBMYVQnx9WjTYmfc9JYePrWG6NdXLNMvuHSs3vDfotc9NoR36KOsB3o0blGIV+YQyb/UD/lSm3uYy5MtEDZRepkxAjqfngGreh375Nk06+Fiidc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qNe1LjQx; arc=pass smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qNe1LjQx"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-48751bd4abeso1692915b6e.0
        for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 10:15:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782148528; cv=none;
        d=google.com; s=arc-20240605;
        b=XGxZ3Eb3kr7tPnTkmKw98pmH4PRk4QYKpJPTKsmd7g25heaH7bgmhn2AeqM5M1Vfrs
         QqRPAbVs7E/wh7ZNpm0Ld3W8v7REgyl+c1SW0Fnz6TMj0tJ4EG/FlaIQaeicgGSDMMxa
         YrCGnOf/HlS/2tfqw75FIbcGnX4rQB4TiWwERuerZK37xszFA1nOGiWcKpsRaE8+Ww71
         ewpfY19+tyfPMWTTyu3chpmpfTJfCpDdCtd7beA/cMg0E0aVpkv0qPupdeOAdF3N5KhI
         K4rdLKxuOOIIk9aHstfXGim7Buqcu5g75a9Mqh4OdzTNgcCmWwfBOe3OGAh53kkBPLtA
         ELNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t5y3USGnElGMdKgxAn2V/X+lCqw7tv4tGIpnPXtqDPM=;
        fh=4NPg53j4a3J2bhy3qk1syh5Im48KP0tl1KJICR+mwQs=;
        b=BoUk1ncyOapxqMI/6Vv44NJPATooKZ6Evg9YBcSHOkMiymj/AkWlfab7YD3wQhCc51
         H+W76YiTFbe3itKBEeNs88Aji+BaGdt8JbhXVRIqnMLHTKAPOqkP/mojSoVRTMF87pC1
         gTgoH9+CyRloFV6b/uFc5fmPbK9GWYCkUgDIsM2BGjCEfRiuC/VHGjeFNvhJUbfBt+vv
         pf4LmH8ZUUoZQGYVzOqbEuzlxBzt7JhxiChD5DvHVqI0/cJNKthvnoDhxVPh2O8ie+EV
         Ct+FRJ3/G4NcSkTlhIeQh/DZnmMrwDB2xBn1rXs41gJi0sXkN/YDqQn+26Z82wkwnlF0
         eQaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782148528; x=1782753328; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5y3USGnElGMdKgxAn2V/X+lCqw7tv4tGIpnPXtqDPM=;
        b=qNe1LjQx7nztNMKfVohqoIkxDI6p12YgwuVYGjdwCexhEQq4GRX6509F2WEfeRPh9H
         mUB7gSrrOMSQS9MPfrohD9zV+L+dhrW0nekG9zQtD7QMO3l4rU3fTNg9kWvLMqviH4eG
         sh+CsJkL3v2PNRuqIuy2j9XeDIwLe3145HIqGFgYN8/EiVZiUm2rvO9DRNYvnPkuyDf0
         EeKrpfiQnpz+aKInC6EnCLJTQMt+mLRE7oKv4qGl1i3yik1xVAZU7mVc5IrBIICiiN4T
         +K+wyrJG+ZV/J3z1QC0bWKES3prdh3XI9aNC7zN9MciLQjseP80O+PdqnkNPdiRDxa/O
         cWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782148528; x=1782753328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t5y3USGnElGMdKgxAn2V/X+lCqw7tv4tGIpnPXtqDPM=;
        b=P39/KxznAw/JiMzs5EDKxRsCvWfH4N5PBEQ7XxqZ53Vr2V23mrKFX6NWv27ROrOI4o
         LBP1iMttZFls4iMMpw/ObAWTz46sN4oxzl13/qWsBTwjr12ub/FH6HkKchZ1No0Ky7Bt
         quEse7vT8ZTSyTImCH7emRZ8Ic3Yn3fxRLpUE03UoQhaVXfgrRIFzNF+P1Ep2LCyB+cd
         0uoGQOlInAGomQv4qvhfmAVUEa72aRoz6p47vuJufOMq6//Kd4+kjlbj/RqhZNQLHUpX
         FFv2d7NvPRHZGPZ0WVg0hHDZV4wPhzqWqDUTMSq6lRwGAbIwPUXMVOcdT2g2xX3uro7M
         ZpIA==
X-Forwarded-Encrypted: i=1; AFNElJ9mFhG8TKHzll0tBYJgXaeC+zljFtdmhOgnZQtimwmGoqT0MziqZ1KRn9Z2n4nnpb6qZE6KxTaObGP04svNkBE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx17tD438vxLU4m0gS4Fe7/otk9Cbqc1yWD/A45beI2w8oISiOw
	2tkzCJfqo1kdaicReMUQQowLPAaaTDmzwj19W5q+BUWbgH66MR2+rQ7tSoG6TW39Qy3e2TDt6Du
	QiVxRcc0LDW/Tbqnp7bdUDTlIFLJsZ4A=
X-Gm-Gg: AfdE7cmmbBOkcXWLdHVlUszzw4ww+3vsQCyXVtLLw9kVx/fhotU4PnCHRw0yYAlLASu
	/X0gMKjSvcWHYE+aCejCXwWE/HY4KhqpTum4qXEG2h2aPPSAuu85VwZ0yJugqztsSgv0O1fUIse
	kIVAMhkzqPs0D/rQ5L5ru4oyJf7fkX2biHav710egIkNrE++W8fwWz5WiUiRtcBif8gH5hGoCGf
	IYzEBSHY8gTgdhBRDE2Beuvpd6SkqeE+3UwMH1AI4FTEWznWRaoUNEmGdOb6NV4VmlGSzUGBapU
	xDZJryylEn/ds0PAfPUBzjkYRWj5
X-Received: by 2002:a05:6808:3442:b0:48a:c065:6fc9 with SMTP id
 5614622812f47-48ac06594fbmr9330170b6e.40.1782148528126; Mon, 22 Jun 2026
 10:15:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622043934.179879-1-farid.m.zakaria@gmail.com> <sfv7zc6jboy2oxv7zuyofysas4ncbzenwsuzveiyduisfr6i7q@mx23er7uxdbg>
In-Reply-To: <sfv7zc6jboy2oxv7zuyofysas4ncbzenwsuzveiyduisfr6i7q@mx23er7uxdbg>
From: Farid Zakaria <farid.m.zakaria@gmail.com>
Date: Mon, 22 Jun 2026 10:15:16 -0700
X-Gm-Features: AVVi8Cc5PMYcnmdUaPpm4OauvSyD0_Ly6wyUiTL5YPonWZg26gteXmXywIU7NwI
Message-ID: <CACCo2jkDuwy5w_yhX8833m+s-rY736pk8xtKjxg3_y_7BCOHeg@mail.gmail.com>
Subject: Re: [PATCH 0/2] fs: support $ORIGIN in ELF interpreter paths
To: Jan Kara <jack@suse.cz>
Cc: kees@kernel.org, brauner@kernel.org, viro@zeniv.linux.org.uk, 
	shuah@kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 3:40=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
>
> On Sun 21-06-26 21:39:32, Farid Zakaria wrote:
> > Currently, standard ELF and ELF FDPIC loaders require a fixed, absolute
> > path to the dynamic linker/interpreter (specified via PT_INTERP). This
> > creates significant inflexibility for relocatable dynamic interpreters,
> > where binaries are packaged independent of global system paths.
> >
> > The primary goal of this patch series is to support relocatable binarie=
s
> > in Nix, where packages are stored in a read-only store (typically /nix/=
store).
> > Allowing the ELF interpreter path to be resolved dynamically relative t=
o
> > the binary's location via $ORIGIN enables Nix packages to be relocated
> > without needing patchelf or wrapper scripts.
> >
> > For details on the design and motivation for this in Nix, see:
> > https://fzakaria.com/2026/06/21/nix-needs-relocatable-binaries
> >
> > This series introduces support for resolving the $ORIGIN placeholder in
> > the ELF interpreter path, bringing the kernel's binary loading behavior
> > in line with user-space dynamic linker origin resolution.
>
> Thanks for the patches! Before dwelving into implementation details we
> need to discuss whether something like this even belongs to the kernel.
> Frankly to me this looks rather arbitrary and tied to the particular way
> you've decided to setup your package management system. In particular the
> usual answer for situations like these is to use namespaces which you
> discount in your blog with: "If you are using tools like Bazel or Buck2
> they likely already employ their own sandboxing via namespacing for build=
s.
> Integrating Nix into these ecosystems becomes incredibly impractical
> because we run into nested user namespace and mount restrictions."
>
> I don't know enough details to really judge but it seems to me like you a=
re
> trying to workaround a mess in userspace with kernel changes.
>
> Anyway I'm pretty sure Christian will have more educated answer than me b=
ut
> I just wanted to express my skepticism about this approach and that perha=
ps
> you wait for feedback from him before spending more time on these patches=
.
>
>                                                                 Honza
> --
> Jan Kara <jack@suse.com>
> SUSE Labs, CR

Thank you for taking the time to look at my patch.
I'm new to contributing to Linux mailing list so receiving feedback
and responses is welcoming :)

Having put forward the patch, I'm clearly biased toward thinking this
support should exist in the kernel.
If I had to think to strengthen my argument would be that the kernel
should not be imposing how the interpreter is found on userland.
Finding the interpreter relative to the binary would be useful for
package deployment scenarios similar to app-bundles beyond systems
like Nix -- which is the originating reason why $ORIGIN exists in the
dynamic linker.

To me, the gap is that prior to systems like Nix, the idea of wanting
your dynamic linker to be part of your app bundle was not necessary
but Nix models the dependency chain down to the loader. Such
functionality would be even more correct for these other bundled
solutions as well, making them portable across userspace glibc
versions for instance.

I see Jori Koolstra mentioned that Sashiko found feedback on the
implementation.
Is it worthwhile to amend the patch now or should I wait to hear back
on whether such a contribution would be accepted?

Jori:
I'm not 100% clear on your question but the LLM assisted with some
code generation and brainstorming.
