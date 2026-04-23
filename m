Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06E631AF14
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 20:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776975776; cv=none; b=DLj9KTQjjVfI2arLbDMbnA5FM0hM50fCOmLBYHR+bBIRAEK0NhehhBH7vKHjGNSDpFQ+vcuCMr0+Cy+k10RCqVCLilXOr1Ptij9544bs8jA3xc3FQXNV+ysq3HUh1alTAwR8Y0wCl34QJ/MiQB20UIFDN23RB/I/Jke7o11W/QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776975776; c=relaxed/simple;
	bh=0yoTTIK9jvtoaN6oDnsx9bypKCAdqDn3T/Bi9awqNlY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gYcx65yHhdaoQbvYw5aV8uNKSvYSM55uXaHYSvcmH6BdNLAFk32FPaY0JlckWoYUsFqSF/ytaJzohFWMFfzVGwtwrsvXVljRCGFPAI3dXxam+UgP1f6PJzL5oDlQJbuqB+qdZC4IzZFE+QEbwLJRX7qgjQgkhWiEWMJ1j1hLnes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NSHVaFxV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NSHVaFxV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE92C2BCB9
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 20:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776975776;
	bh=0yoTTIK9jvtoaN6oDnsx9bypKCAdqDn3T/Bi9awqNlY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NSHVaFxVgnvgDFPLBJRn/HSJnZnyGD/ETRl2aeH/5+8ftgO6I014jzvwbboCkL/DV
	 vSWn2GWQ5rtQ7079GaIuISrBjyLDaPTqQi+kf9+KM1vwpr165BU01xWZy4Y49+57TZ
	 UAxDW/LMf95RShQtkbIfGhHE4qT0faGUC97lsJtH7QRpv2bGHVpOhjrs/I8Y5XG/Q1
	 nF91M1WNGQyg5AsFfd+gta7suKTnNv09DE/0DPSCHxU62RKYFe7Cx+cUywkvw5vJ1D
	 3XjZTzwYiowb836iNPatcsPWNutQlMcwT4zF0r9zH/oLbvkvc2ftXVJ4tPBCp7MYbU
	 E8NxenGg4tqOQ==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so170142066b.1
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 13:22:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8wV9XoBGVc+Anpvuwstr+DTfucLEagVJkQUgEcA7mcWfefnEA/6sNDfOkzcPVuH+L3iaK09JGgaJI8yjOOTRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf4zXGhx0XnqZUeQRuKCzglQaJqMwPZdwHWlUF8rb/raFdTfTc
	A/6i8bGGwh674B/jVIiCGsYJnZ4AQ/Rp4mFPAzyH9/06grlPxJa1ZyE+3Y/YZSapBhQqZvZ4x/f
	kAWzDknMzMKbQCIzrViHtQJ18vL4wic0=
X-Received: by 2002:a17:907:6e90:b0:baa:65b:fe43 with SMTP id
 a640c23a62f3a-baa066b40d1mr643391366b.38.1776975775156; Thu, 23 Apr 2026
 13:22:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <03a23a7a-58fe-42f4-a294-9d688ce33e2d@kernel.org>
 <20260422190847.216343-1-pratmal@google.com> <da96efa9-401d-4d11-90cc-00ebff340921@kernel.org>
In-Reply-To: <da96efa9-401d-4d11-90cc-00ebff340921@kernel.org>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 23 Apr 2026 13:22:43 -0700
X-Gmail-Original-Message-ID: <CAO9r8zOurrz71zxi7kbe_fYxqyQiizrHpkv_1rqGg3x9YzgAdw@mail.gmail.com>
X-Gm-Features: AQROBzAYv-6W8FmrEkCiowKjw-qG_okPOzeXzxeHNGb6zyZqY0KL08DwDTBCY10
Message-ID: <CAO9r8zOurrz71zxi7kbe_fYxqyQiizrHpkv_1rqGg3x9YzgAdw@mail.gmail.com>
Subject: Re: [RFC PATCH] selftests/mm: use pattern matching in .gitignore
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: pratmal@google.com, akpm@linux-foundation.org, shuah@kernel.org, 
	yosryahmed@google.com, ljs@kernel.org, Liam.Howlett@oracle.com, 
	vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 6:28=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 4/22/26 21:08, pratmal@google.com wrote:
> > (Resending to correct David's email address. Apologies for the noise!)
> >
>
> Heh, no worries, I didn't even notice.
>
> As long as you CC one of the mailing lists I'm subscribed to, even mails =
to my
> old RH address will still hit my inbox.
>
> > On 4/22/26 18:04, David Hildenbrand (Arm) wrote:
> >> On 4/21/26 20:30, pratmal@google.com wrote:
> >>> From: Pratyush Mallick <pratmal@google.com>
> >>>
> >>> The current .gitignore hardcodes each generated test binary by name,
> >>> requiring updates every time a new test is added.
> >>>
> >>> Switch to the patten-matching approach similar to KVM:selftests.
> >>> Ignore everything by default and then allow source extensions (.c, .h=
, .sh)
> >>> and tracked non-source files.
> >> That looks pretty nice. Any reason for the RFC? (iow, are you unsure a=
bout some
> >> side-effects?)
> >
> > Exactly that. I verified that the build works fine, however I sent it
> > as an RFC just to be cautious. I wanted to get some feedback in case th=
is
> > might introduce some unwanted behavior that I'm not aware of. :)
>
> After taking a peek at the KVM one, I think what you propose makes perfec=
t sense.
>
> I do wonder, whether we want to make our lives easier and rename
> "local_config.h" to something like "local_config.h_gen", so we don't need=
 the
> "re-ignore" part.

There's also the *.mod.c part, but I am not sure why that is needed as
the current .gitignore doesn't have anything with .mod.c in it.
