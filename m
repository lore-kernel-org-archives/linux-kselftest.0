Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7531636308A
	for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 18:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787682054; cv=pass; b=owEaoDvTpFxxzA4F78H3z9sKS1euk4IG+vnyiuUAzYmeyT5qyWrzyeCkt0j2hk9Dckmrwcg9Wo4c/VwfTPwAiO6FDHMNmhEyuptNwpj5WSFoM6DispL1JM7CbiSfktEm4zBSy+zTtxQ5lrcsXZf3MrUskelqiFWK6SawLjrh4Vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787682054; c=relaxed/simple;
	bh=L8vnnD4wqEAQFZKUQ+x9frnB9gGI7jKoJfDp0bNGiIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N3ShhpatCa3W+iBlwSYSMXRmznIWTvBomeAqNVIb+kdGQzQsiSx5FnbfWTsjgwASesx0cfBc0Hy51vilkv7mg/1tezoYDAqEkTV775WWIP8rRBYbaswNqoHuzSLbR6l+lgLIpGGk2HSP7qHecNEgmZMl4sNdiCEHcmtwIwKurD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c9coKXI6; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9coKXI6"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ccf2360620so1804465ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 11:20:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787682053; cv=none;
        d=google.com; s=arc-20260327;
        b=AV4PaWA7T++bLDskeSD3SJZDili9MQ7wD4uJ9ByfsfMlQZFU/OFt/avGXPLeIqy4U9
         ZCfVg4q6BSp0L5dJzUeznPANrarARteJPrHjKT6kVeKpzoNzKV2L1rXOfNqG+3kSVFFF
         ZYzseF/hXYPJAw+dGCqCI5Apk/CZG9bptkGeACpBdveutvkAn6+Mo+pf+1vgxewHItJA
         /yyJfZWvUArr0esRXnZgLSDm4PeS3v45bzUgxGN0OiK9DXge+h1BbNUpkEaNbCTBUtde
         i9f37Ans+nN7A+NGXa0+IsMn9gPL+z5oXsAz4q1RxuFwGi7igUPHn787VKZor/2Ltn3M
         bDEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L8vnnD4wqEAQFZKUQ+x9frnB9gGI7jKoJfDp0bNGiIc=;
        fh=oTKOKQLHh1SLYuK4ebNKvfMZBjAxJxVzms9f0ws5OSk=;
        b=WPVWsBap5hfGEShQ0yEBqKgHqczFWcoWumfTuVfQ8iqckP5ShT7z2x4KT+bSSWSKKT
         9iytMVcZXE8XU9CmhiUl2JcBaxuhQSy/YQwsMRI4f2QwgnIzYypSdZGtxv163PTm3X1v
         TQ3JaiWHll/uIpGgVsktbWE9BsTtZmH7JzQV730H1dx+WoY9HlrHiUkWmfoHJt0it3mH
         eQ9BqIfZhL8YW8sZ/Jmijf3eroIJnfjgGDmJf8k4/3oeng8LIT9ldUJUg6L6eC7Gbo1K
         gfvRWNcuhswBpQ6XKIz8gSN2P9Bu/yPQ8WeS783MFYz8nogFV4+fQM/vUSDzMcJ8ETMH
         ImaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787682053; x=1788286853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L8vnnD4wqEAQFZKUQ+x9frnB9gGI7jKoJfDp0bNGiIc=;
        b=c9coKXI6Vy1FaYVaIKowYLx43Zvt98gWxuMbsSfGAT+CT1YnoTYf1TvV7hu+JMO55o
         6CB9oxXBQTpCTwyV8XO4StCFQ9F0xUVxR6Fsr2c7db7zYv8zbZ/8PdOFlUB2bVAHklBz
         aLGcdoYx2OSIrwFBzZabaOEnwrhephr4+CPoNSwUmgciykKog2bXphpYd4GDjIA2tQza
         rCTt+Q81CJKpEn0ZRwBQUzVYSI4dGvyP6osnrWLWlD/6tY65yXAZkhnVroQv3UMl0+1h
         MyYJ0tDoJvcYbjtEPC6uB2jylypj15BJ711Zpj/QNrTRliW9a86JwrArF8SoSDTmaqlA
         4yfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787682053; x=1788286853;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L8vnnD4wqEAQFZKUQ+x9frnB9gGI7jKoJfDp0bNGiIc=;
        b=Ft2WmZo3ZE4kxSCgjLc7DQnaYigQ1PDORYBDQUmzGL4N0rHkic+qegPOgdWbr68I1u
         RXyL/cMMjJq4Ru53cspQCwIDrIObHrYqwseqxx1CqM368e+X0OAAV214oLPK8Ph/aweu
         uwH/hbf2c/cirPW9nmpKAAHcizx37nFnIlvpciMFFzlbAY+LYUE5IaWRAH6HHA5vqz1e
         kFwtV+plA5GdXR0BLWashQ8dU9141PAOjFYNZLfX4SR1FLDFPoU3+nTZViIO82R0aNR6
         Y1T8j1/TiiKR1nkK+mREe3Ry5cD8TP0JgMAO76gswYJEkDAalVfIMd2GyAvP3wuN8ECD
         OeIg==
X-Forwarded-Encrypted: i=1; AHgh+Rr87yk4jLKM52FSGw71SZrgeTV6afT6ReIIoyZGDbAlr0eFbFjJRdTQGRqq8u6PfWbtoqt2AsPxEWs9lkAwYzc=@vger.kernel.org
X-Gm-Message-State: AFuF++ml9HAyrPiqqtiaFtuTKB4ole+EoihQxf08WVM4J3DUppJ32Kzw
	5okDCkqulE7oXJfIO1quC70+sYsOWeZuwgGPjf84l7HCMHhYcb4THDB6ocJAwlOX3/5KqfEHsWs
	o++oo/wq20v5emGMehzIj1/+X27eY5Cc=
X-Gm-Gg: AR+sD12X0Xmt2c598bn3nO922fVDaSv6770ReklkZzLgcNrnFZ4OI5gHrRi7v9x+kB9
	MShfm2G1U8br0mjrsQB76Hjv3l3veZt1WH1vJNooVUD4vPt63oKhQsFp4NoDtCoe1JOzt3tMigh
	X8jMcoM1zswt2ogGeFlb2h4VGGGzzsExGzhETLZZa6yhk96s9PCML3xhunP3TM3BzPl4BtZhMCj
	xnvcd1XAI7S21rG3yMpxmancTAv3jOReNgSMAyW534IFl7cSw31bx4wRzHVyYp3PENo+PQk4KdJ
	UHDVrBpNA6HFpHRLAxQBgnhH9KwTnU+2VHZDxUpYBbrQuTwmNBMXBDXswQPGuoECvejjlxr8JxO
	kMw==
X-Received: by 2002:a17:90b:4f49:b0:395:4de9:b30 with SMTP id
 98e67ed59e1d1-3966d1baf30mr1848749a91.5.1787682052569; Tue, 25 Aug 2026
 11:20:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821114416.12255-1-anshumantewari123@gmail.com>
 <7bb2d581-924e-4a59-9955-b8afa2b51268@kernel.org> <CAJqi8kJf9EzfZWBo=1KpEzGiq+vGRz0J0mN+-NXAjrtq9HDrMg@mail.gmail.com>
 <e7c339b8-b936-40c7-b121-1a4c14838dd9@kernel.org> <CAJqi8kKaNsxBM86Hg4W09gLo2rj0+kc9dAvps48jmQCshUkxqQ@mail.gmail.com>
 <b993b8b3-351c-4d2e-9bd9-12c622f427ff@kernel.org>
In-Reply-To: <b993b8b3-351c-4d2e-9bd9-12c622f427ff@kernel.org>
From: Anshuman Tewari <anshumantewari123@gmail.com>
Date: Tue, 25 Aug 2026 23:50:39 +0530
X-Gm-Features: AcwNN1Ull72X_WS0KMiw_4u9rzH-HYvB6Zo9b63KvXBECPIeUZSEqjnT49MAQLY
Message-ID: <CAJqi8k+cTXvvk4Pz0RdjQMPvSNCszzORH746fb7YgQUgngykbg@mail.gmail.com>
Subject: Re: [PATCH] selftests/mm: check strdup() and fix buf leak in parse_test_type()
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R . Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That makes sense, thanks for explaining =E2=80=94 I wasn't aware Reported-b=
y
needed a Closes: link specifically. The inspired-by note with the
link is great, appreciate it.

I'll take a look once you send it out and add a Reviewed-by if it
looks good.

Anshuman

On Tue, 25 Aug 2026 at 16:33, David Hildenbrand (Arm) <david@kernel.org> wr=
ote:
>
> On 8/21/26 22:14, Anshuman Tewari wrote:
> > Sounds good, no objection from me =E2=80=94 happy to go with your versi=
on.
> >
> > One small ask: since this fixes the issue from my original patch,
> > could you add a Reported-by: Anshuman Tewari
> > <anshumantewari123@gmail.com> when you post/apply it?
>
> We typically use Reported-by: for actual bugs and must accompany it with =
a
> Closes: link. That doesn't quite apply here because this isn't really
> something that would ever trigger and really needs fixing. It's
>
> Suggested-by or Debugged-by also don't apply here.
>
> I will add
>
> "
> This patch is inspired by previous work from Anshuman Tewari [1].
>
> Link: https://lore.kernel.org/r/20260821114416.12255-1-anshumantewari123@=
gmail.com [1]
> "
>
> If you want you can send your Reviewed-by or Tested-by tags once
> I send it out officially.
>
> --
> Cheers,
>
> David
