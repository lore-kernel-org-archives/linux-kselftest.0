Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D97C3839A9
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 20:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787604591; cv=pass; b=Mi5nq0bIbFAh5sUc932O4z2y6HROMCrWRFEyKgVtpff2VMCkVu58WXi0EA9gao9FrWddgEnfRYW+VQygaKV8zxpzAy7EwI853yAuibOOOQBji2zX1j0uphS1KanaOnQDN68CuyZvi63YTNSbzjaAJQ2ZtYNhWNciRbux3E4WQq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787604591; c=relaxed/simple;
	bh=8MTomgvndci6QL0zOaAHPeSzdW934vYd1zdRdj8UROQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b5hIrkDnqyH0qtf30f9kwo0eyormJ849T8GBNNwqG2dIEKoMA4Kf3rTPUX8QjQBhB+E57bzCLhDyxioEUgJrDHed0TvlwTe7wD6kewwOJ4PROA6I940xSJVgN8qCxDoAoSCM0EddbC4ZOxDZ9trj81dyW+NzOrsQVne9FDzRvKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U91E2Egn; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U91E2Egn"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51c01c79467so87731cf.0
        for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 13:49:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787604589; cv=none;
        d=google.com; s=arc-20260327;
        b=YbeJjiWrXd0gP6O5RgH2y1ka1WNkEEJgXA6oy9THJARshbiNCnINraWWGmG5YJqA6x
         EmFsoSnn3DMYxW9I4LGAOxzIHAgK7ISxA3fJQzaHG0eb5y/VvsUX/4nUmw08eDo0Ec9L
         01vmWtioV/zSqIS740PYdCRlkvXS683xxn9x/XLw9luDRijHT6nKa3wxvtukMBZXxGrC
         z2qSSEXr/nF44Cj6R3xbLMcfC3e6imgcrPOTU51Jyu842YdjsHdPwnQTHWFFqQm7QfEQ
         CnnmhtEC0EWYRsSuXv6ElrmrM5ymerJgnYljPiQ9ZW1oWwzklSc7keA23Mf82LnjlAB9
         X60A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rnrc6rgXkO/4siYHOqsGt2EqzbzE5rWSn7kKau8RpvM=;
        fh=42imFDd+ZmVNLNJpKwdI2Jcpo/W4TMxmo9frAW3rG90=;
        b=WZ2RBfll1MzV3A9Bd8Mg0aKch0WR15XXP8iOVpEbYFF1IoqvY7r89tteRXn7W+fvaj
         jPOUlR/GXrwkgeai9TicoGPtSTDwfxYM+dpbsPtKiOc7SWv/FB+Ve/U+Zgt8AoZFZ4k7
         bTyScjbvcMBMINegSDAD3IF0X6CoN1qPQkRMJ72QeAVNE328NaozRuV3I9skcL8+XFrY
         L7t2534adEHDyeolsde+2JFk0q3fk5TBMjPnnhmFY9tjeTLuU+1+abDTRDAIBeFEFUQ5
         295vCXDQkVjPTtp+RYGtSIBaqLbiTZllnwRP863fozgzcCH0o7q8v+v83q2anmNIw6jZ
         /gDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787604589; x=1788209389; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rnrc6rgXkO/4siYHOqsGt2EqzbzE5rWSn7kKau8RpvM=;
        b=U91E2EgnTOWq+oBcEShuBHdAA+asYkQFCr1Dz3NPt0y20dyqfvEUluMVnyfEVlStwV
         4J1jwWWOxoTLEBWJv6x0gYU5E5DMw3AJjPZA5Z5EJhUpJ7/Jguwwswo6xT9FOUFg/kjn
         T2B8Ic7oM1HhuJOgYWdgf3s2XOYYT71MCixIJyCleZdF87evh8ltez284txOS4acSJ+b
         Iq+ygtGdYNtA3OgBqE2R9YGXh6YDMy3aF+RPX+wSLZHAWJTBezMBPSSycOXwZCX29woN
         HU9Ct4Jarvyd28DPBLsHSJ8e6STzlU7VzhKEAO3Wz5GKvCmU4aE/aZGPOja8Bf5381vF
         Mh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787604589; x=1788209389;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rnrc6rgXkO/4siYHOqsGt2EqzbzE5rWSn7kKau8RpvM=;
        b=giHBZKlBdIjUsBUnrV+rp7ZnZznIRVs/fcdcQsPocqcMFSoTSkr02r0jaxe+DFBQdr
         ASTTk/t3v3tHTbqi9UptOcuK0s9EXFIgGW4GMqeq414KW0fsoStFJDIzNsMtZpzHyo0X
         byp81rJAe/Wa+uLSIDJBVSK42Zsgbp/BVDtyRNn+XM1s6FqbpALvQkf/PKxPuuJGkFu8
         fzZqfqUE0lYoWju3h3SQxWm9pwE8CVBfIG8StykKplXjwdnE6RtKqK9142K7zrv9eXMV
         entj1cQKBHnfap32ZXq3KEA6fjYOxF1gya+o0pMPxpPdgvL2CLpGqNONhx5Ox9SKUkvb
         e1EA==
X-Forwarded-Encrypted: i=1; AHgh+Roaevzo11rmkTUsF2a9u5nxTbgxiqbOcGM5MTmPSdM9GsP9PRn3rmwOfdkFDeyjpfN2+M3QsRYfa8ptpLMBAII=@vger.kernel.org
X-Gm-Message-State: AFuF++mOjgDyUuRgfRRrh/+Jz30dLrfXlvh834L2PKzyU+7TuDAx+CIW
	SWHbhhDJwGBc704pmYhdcYxrYURrpIikrS5Tge7Z4t9VfOBW3Pya9LPywiwjhocVuBj09ySU1Xg
	8Fw5jwbarbf8yuTVz1ngHDWuqYb/zNBv8k3KxXRsx
X-Gm-Gg: AR+sD11VGOOhhKAlYXKf2XcXooGx8aXltjQNXsQWmgoeU5qGmdwqX7hNSLjDUKSCJGn
	OOOXYISHw/1h2JEMQ+Z6Jt/32c3/D5JwxTwsJQA//FY3Guscqm3sKuehbDmKcK8l2anbDhtH2sP
	k3ISnbeJPvjc/j+jcHeT7X3UWvOcCGoYomEcyJPJcfrUHk/FOr76IZfzBs60ha5I8gDfovWfDIz
	VkkY805wd9JBmduB4mSMmCB7mNF1yyBL1OF5NOGooEFMvMbCJ94jx5m6qUUOmfYe2GwTdc70mbB
	uk1ODcbVU2BpH9qmMvmq5nJ2pnh6JNSKpXbFz6NW6Y8=
X-Received: by 2002:a05:622a:22a8:b0:517:5e32:2d14 with SMTP id
 d75a77b69052e-52e308039c6mr3439151cf.10.1787604588512; Mon, 24 Aug 2026
 13:49:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808200312.6326-1-kmehltretter@gmail.com>
In-Reply-To: <20260808200312.6326-1-kmehltretter@gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 24 Aug 2026 13:49:37 -0700
X-Gm-Features: AcwNN1U3QleQBnvzJTMW5EoRgp4utl8IsEYk7xBRzJCJAaM1F0xAu0phz7nBY1A
Message-ID: <CAJuCfpGTneUdh6xvZoeds0xt0Y=dc_xgOCninwqSv=HzVnPvoQ@mail.gmail.com>
Subject: Re: [PATCH v2] selftests/proc: make proc-maps-race work with READ_IMPLIES_EXEC
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
	Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 8, 2026 at 1:04=E2=80=AFPM Karl Mehltretter <kmehltretter@gmail=
.com> wrote:
>
> test_maps_tearing_from_split times out when READ_IMPLIES_EXEC is set.
> This happens by default on pre-ARMv6 CPUs, which lack no-execute support.
>
> split_vma() re-maps the first page with mod_info->prot | PROT_EXEC to
> make it differ from its neighbours.  With READ_IMPLIES_EXEC the original
> mapping is already executable, so no split occurs and the test hangs
> waiting for the modifier child.
>
> Use PROT_NONE for the split mapping, which always differs from its
> readable neighbours.
>
> Fixes: beb69e817246 ("selftests/proc: add /proc/pid/maps tearing from vma=
 split test")
> Assisted-by: Codex:gpt-5.6-terra
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Sorry for missing both versions.

Acked-by: Suren Baghdasaryan <surenb@google.com>

> ---
> Tested on:
> - QEMU versatilepb/ARM926EJ-S: maps and smaps fail before, pass after
> - QEMU realview-eb-mpcore/ARM11MPCore: maps and smaps pass before and aft=
er
>
> Changes since v1:
> - v1 went out without any recipients in To: and received no reply in 19 d=
ays.
> - No functional change. reworked the commit message.
>
> v1: https://lore.kernel.org/all/20260720061835.6290-1-kmehltretter@gmail.=
com/
>
>  tools/testing/selftests/proc/proc-maps-race.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/proc/proc-maps-race.c b/tools/testin=
g/selftests/proc/proc-maps-race.c
> index 1026d8c400e1..415eccb70468 100644
> --- a/tools/testing/selftests/proc/proc-maps-race.c
> +++ b/tools/testing/selftests/proc/proc-maps-race.c
> @@ -490,7 +490,8 @@ static bool query_addr_at(int maps_fd, void *addr,
>
>  static inline bool split_vma(FIXTURE_DATA(proc_maps_race) *self)
>  {
> -       return mmap(self->mod_info->addr, self->page_size, self->mod_info=
->prot | PROT_EXEC,
> +       /* PROT_NONE differs from both readable neighbors. */
> +       return mmap(self->mod_info->addr, self->page_size, PROT_NONE,
>                     MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0) !=3D =
MAP_FAILED;
>  }
>
> --
> 2.53.0
