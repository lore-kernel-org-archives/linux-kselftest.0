Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F005734166B
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 04:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772597818; cv=pass; b=EE2xE1fHoWMTR5PUz8RnFLBWrJsDdaA4dG8W3n0KaUfhP5qNpwfbxCkFOX/+dcXosbzRaVkKE2TeLpx4U6by+HFLTP6VIF4j8owIfb6JyR+6hSX63LQ9ZYprz5jnTonZws9utJkk+2i0CdUJIMf0n6hWLpAji4pBjzaytdhRrAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772597818; c=relaxed/simple;
	bh=yPmACYW6vztC/1Of+1uRXukRBmKyCZbH/I1KQ4BLctY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b8iAPChLMlU86BAo4gzxR2Sr5+kyvkjH1Ru/N4MV/8GgcTxmjs/64UBjRPnytwlcGh7c996bKlqdhCGO6EZHUMVn3BAHGE/onS1xLME3dth1Q1CXM+VwhhQd9hqmiMWGLAr4CF+bpWYwTXbzZxyFIeWVvGOdcirD6LBlIC/iev0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ltett1aX; arc=pass smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ltett1aX"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d4c7d04890so5817622a34.3
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Mar 2026 20:16:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772597816; cv=none;
        d=google.com; s=arc-20240605;
        b=lwUtR8qS6QViQxQOW9+otr012DzIM0Ex3LFwyrxrlnntuMuS597eDvSvPL2U1WNz9s
         Xpm/MGDmZIX1mq3L+P0DEYjxzuBtNQ9Ty41+lwqHLnswT+BdCbfIeHv9Ypv7/+D97ZZn
         E//1Cv/Q8uBKlv9TpRQAAxRCSIxuicl3GrFUJUfUHEEBwyawE03zACnS8MS5yXiHjQOx
         sxijaNfJ0SJ6mcmoXishczOG8usm49pPPcZ76jVt6OALU9egHGGawuBuBN3SVk4X9M2r
         DC7x72LRprgB5oL3/88QfB/8xNGp4blPCdWJ2bRslPswMMGw/0yDzj+neVYhhMuR0mjW
         m+dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yPmACYW6vztC/1Of+1uRXukRBmKyCZbH/I1KQ4BLctY=;
        fh=0sZ7UcY54zyyoeuGZfmJH3USHp+udgYyOO0T3c5oEwo=;
        b=L2B2gGfoc6TtL0/AzsEdrM4MoXY5wm47dcm4R07RNzLuTL3fZKI12IvEqLnJTBZqZx
         UQ9PL7JuM19U1tSRsevTi8SxPLG+ieZplOS7Gz8O1fcgXtfDuHB/xdinTXejuhlQ2yZm
         H05o/mDhcyxehnrPAdf61nF7HbLXqPVo+FzReTn3knkadcbZtWF3nfGSX0DJck98DBh+
         4Ti19CoBTaCw4t8gZyRYd/egeKcNo1u7yOvSWgXCDtfiLbbOBbXL4a88GDsMcvjM5tHR
         TuxXp5I+tC0Hm0qIhdRvZrd6zrvdMUK67dPJai+Z/gDxafe005FSpaRg/HaYgbE9EmQI
         v1iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772597816; x=1773202616; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPmACYW6vztC/1Of+1uRXukRBmKyCZbH/I1KQ4BLctY=;
        b=Ltett1aXT1nyu3+sNz8wEyZnP2tV+XvnUXK+FUPk13VkiGK5utsZlybqqt5kSfCIqf
         mcLvb3++GtOQGdI2XdeDZJUSVLivT0vMECyQDW8F9zbeiWyDtnxwNa5Kwhdu/x4JasbV
         Xhl/uTA6qvqonn50C3+jJxp70oW1hcOOgeqx+dS9bzlgG4VEuiu8J5I0rArTQb/yeJC7
         2u7TBJ8KCbDKAisbCxwtHK2fOzT+RyemwF4Uk5WydEEiQkDwU79/wHfGmuqTk380qK+t
         9pT1qdlkUw5e9CZbHor29JZ3YzLvhkyhKp9hCrtDqMDEQ1uYRJayhS2mhA3CqkAWdBTd
         YpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772597816; x=1773202616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yPmACYW6vztC/1Of+1uRXukRBmKyCZbH/I1KQ4BLctY=;
        b=ga7BEhji3b1ivK2ny16eN00PJIQaRwHYctmbu79N6Lzn4hKWvassgzxjcbvCllSATF
         vLhzCHsRx97Ga2G9B2iAXRXvuIjUzJbUgk3yDPYP/hhrKzhZagJaxQ0DcUp8pTSizN/l
         EgzdEDsdGR5fZgldse8ZbsLWAGSaS1Pzn25iIgV4rXvCs+AmO/NKUnXHllT4KLbqPRFy
         vGvOxsr7nQZH6csIu4PeCoTQ5HUEMl31BVBCFppMlfXkq+vkO/opnwtUpyoQrwHstSLP
         Cd0Kt9i3sOYLMnKFb7lXOHAd2IY4z5DRqmmG7GZ2HmU3hRrgPsxA/DbNyXYDAt8ZxjFI
         Mlwg==
X-Forwarded-Encrypted: i=1; AJvYcCWPdO0qQygYGWPXxfAa0v6obWma0XOse4vykKt1tQvf68AkB3vxDaFvHLQkdqp/KOgjUMgSkZS3ZRWpQxeO0bo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmq6dkqhxTc2BMz6shWzzwuV+cN9T8zamfIqbEnGFVgTsLebfO
	Y0+sSp9IYrt4V5m/tfkjZPzOb6zKRm9T7l6XjbWNv2NBbK4FKByx6tIm+JOPsx9ysPsqa/hKuCp
	NFnlammfzKHRVMN8PqwU9Ln7sI9N2y2k=
X-Gm-Gg: ATEYQzyg5E0MLEtwbszgAmL46kkIzOu8KHTAt7YjvjN1AclbIAhhfD9SIebZ2nMJty8
	TvR18/+6zL2Gwij9viWWt4EL5LndN9nyt/87QIVRVovtEtMCt0mfvC8Nq/I6qIaq2fPXir0lk07
	8FovAtWcrMylDbrAiAckRaQcBI2/J77Wn5J8V0K5yBW748peh7P5DsaT0eQfZZyyRCctipTx5/f
	5THTrNPF+PfJ3exdDrNntNFB9XzWF9PKHnz7G6TGczzdr4n/nZ/S/y7qcSNK6ZYKNjpY3KfY+ts
	28pUEi00ul8+7LjDr90eEzesf+7CT1AoBq5PmSxfP9N4qJ+wIGugMiiYdPTmFe3C5n3FAYD+
X-Received: by 2002:a05:6830:378b:b0:7cf:d9bb:63a1 with SMTP id
 46e09a7af769-7d6d136e4b5mr552669a34.16.1772597815951; Tue, 03 Mar 2026
 20:16:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260228074735.10438-1-mr.navi8680@gmail.com> <20260303181700.25878b2a@kernel.org>
 <CACQ1SaB0cnBgEAiX0iTM+WXL0cXYOsoi9wMUMvpcK-04hZLhAg@mail.gmail.com> <20260303184901.011fe650@kernel.org>
In-Reply-To: <20260303184901.011fe650@kernel.org>
From: Naveen A <mr.navi8680@gmail.com>
Date: Wed, 4 Mar 2026 09:46:44 +0530
X-Gm-Features: AaiRm50AyVUxl-FJfzQ5kVIapYXyW3NbGG2Q1uoYKHOcI8oKHj5y8ByHRRo6TOQ
Message-ID: <CACQ1SaAtHqeb-H4sw0fgXBfdcPYt5yBSBphyJU7yZix7A9zC6g@mail.gmail.com>
Subject: Re: [PATCH] selftests: tc-testing: fix list_categories() crash on
 list type
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, jhs@mojatatu.com, 
	jiri@resnulli.us, shuah@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You're right =E2=80=94 after checking with git grep, it looks like
list_categories() is not currently called anywhere in the
tc-testing framework.

I originally noticed the issue while manually testing the helper
function in a small Python snippet, which triggered the error:

TypeError: unhashable type: 'list'

since the test definitions use a list for category, e.g.:

"category": ["filter", "fw"]

So the patch was intended to make the helper handle that format
correctly. But since the function appears unused today.

Thanks for pointing that out.

On Wed, 4 Mar 2026 at 08:19, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Wed, 4 Mar 2026 08:04:18 +0530 Naveen A wrote:
> > > How did you find this issue? I can't figure out what's calling this
> > > function in the first place.
> >
> > I encountered this while running the tc-testing selftests locally.
>
> Running locally meaning? via tdc.py ? Or some other way ?
>
> $ git grep list_categories
> tools/testing/selftests/tc-testing/tdc_helper.py:def list_categories(test=
list):
>
> I guess I don't understand what the purpose if tdc_helper.py is
> but the function you're polishing appears not to be called today..
