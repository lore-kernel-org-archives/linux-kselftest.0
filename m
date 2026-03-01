Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FD82D738A
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Mar 2026 11:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772363877; cv=pass; b=iXwVCtD2cSuKBZtTo5KQrNwSV/j46A94DUaJYrkuFcCCOTlfV/sgQ5r0E524FeaVvv+OuOPu7q6DR71hjDyM+kLCJki5k9AGtig6ZdDVbWo4lcaeRDiQXuighPmrMQblAkFHwT1OI76ZjUnYHjLRqT271MNiyRpPG7clEySro3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772363877; c=relaxed/simple;
	bh=k159yElqE8C6mjZznt1K9GndbHTozt7Zqms9bAr3ZZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rm2trAHe9MOyF0a2LSUXIlzYnabEe4GUq0C46w9Wd1Zu7SvlMunqPDZXAjG0g2M3ZVFsiIzaUo2OucHbM7pBVBmTcesC1MOhf50em7ncsrDgQ50MjfWyALbJC4uH8MBaPkYHyQquE+13MZyJvPn2Z29iC8mgGvWkqqL1sf3H8Jk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=llp6vOsf; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llp6vOsf"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b935ff845c8so426829166b.2
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Mar 2026 03:17:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772363874; cv=none;
        d=google.com; s=arc-20240605;
        b=Gx0kxjZ8Ikxr6ARi82sSG8hj1kTNfpnDUNxwhirOySvoHYOR7GQHmAXGnGIL06yF13
         gL8UPacw8oVgJmqhpKmCkBGHdYvB1oASJMxqX5S7B8AgLIvkS8QcT823dSQs/V/5k+zv
         NmGnQGL6YDz0Oj5ZC7fLgGnRIoX7jXlSnVKtIELTZfreORcQR0Z4u8cm6Mv8APb+34Q5
         I+yIhPOPX/DwsavABraRMK2tumKminJmMukp16lGPUdN/oUi7fWokLXMMUjRNJdK54Wm
         WIvUsXqE6Fg0xBVejwLzYklY9qW2YTFfyNe9MrVJAPE2qyCFeFP7RfwIKdi4+VSg8RDC
         sd2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cd6Hcun1yPAmB6g69o/sJHqtZVSQSHNWzd5WHtcyUqw=;
        fh=1Bt2zoGDqze+fOiW6nlsoEI1U7ti4lUH1MonvkIbhWE=;
        b=OAqXk15a2rbPwjZxvX3viMkXPsTlmwbOoOfoJ3Smy9dDJBxv74UhmzVWRfSCu9LKpK
         MxmQbpwOvWZ8QpKzFFhp1t1EsE+Duq2olZcE3VWSbnlQqyqaRIMGpUTk1QLFbAlucr4K
         dhu9s4Bj04vnvqu/j9wXHbxpN7Fg6WmKSqqNXiBKZrY1Z2xiXESwBwKEshG4ikRMYTIa
         dxZv7KGN23xTal+XmQk75jO8MK7U03GefrWldpVw+w0+D0dbt8F3q+feAl9gyvYi25qQ
         Trol0PrOv8nsCDASAAfww9ATblKtEv2revYdnl6URfPVOAfIASqk/4tXU52ZD1gwWlSZ
         874A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772363874; x=1772968674; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cd6Hcun1yPAmB6g69o/sJHqtZVSQSHNWzd5WHtcyUqw=;
        b=llp6vOsfaAukID78dJspJuDWygH3nQNBgi4345UAz3mm3fT9/T3WdevkJq2z2OCq2+
         cior0uqSoP9rIYxIdYy15iKYivL4gDaADJu8DUcXT3HmPb4fcGyyfJ16Aw9+u7iEhLDM
         t19cqj6CFRTbFuE3aCdL7ZODTB3J62ko/4LUqx2FphC9Cwbhxx556g8r/Wbcfw9t9nlp
         A4o8/RyOa3FwFzqRMIIvmtaFnBNmB8EaxQaaFV2oUjO26b05QBtwXzZWZ8seTW9d1NC/
         +9gndbkYAAiB3WO5Wdax+JPhZ4laP1lVfbTcMWWVjZ2NLdceemykbtJoQdVm/Kz+7jRn
         ysrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772363874; x=1772968674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cd6Hcun1yPAmB6g69o/sJHqtZVSQSHNWzd5WHtcyUqw=;
        b=o22VbCo5J6L7uyBr4XdbxEdRlJZeBVC0FR6dTOWmCnDszfwMMzNJcrkeDwyz+QmEVG
         BotBPSITFg4wX3i7gtH3kr4tc37vLb9jtpJPNWhfna4hdNeZAvh57fN/tkrTvL+YQ1oz
         tuoK/HjrGzbukMbWV0pDnrlAL6VaTxsDwvh4Yx8wWIRnO+oeVSUU51sbZUmSOM16EWKQ
         UBOl0LGiA7DBsZbJtastkbEJqm5rxyLOf+j7PYB9wSNKb3HSnb4kI8dgsM08s3Be2BMy
         qAq6ui50x3SbFudxA9jAT6Cs0nlDyhzE3TMAE3z25raxxIAbM78VOGJ0krxYDghFSvWg
         r/Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWoZhsvMFtVu4pMhLojB6c7MkrncRyPNeYqEJx68rpXojXiP+RcI55ifTuGrJeC3lsnZZupXsfCscNBnahy9bk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpo9UlN7zW41u0ij/Au15ZStKXRDPmNnzVRt7TbSZF8hpapwMp
	5BzwvQIN4iDOSOAR5pV3PnNyJb19WcauqFJn9cgb+7jjc31ZEKgH2vTCSd6rTkGxRqykqfFwoJw
	32O22AeBpz3fYAlu7yXWBDmtG4cTnvU0=
X-Gm-Gg: ATEYQzybLihR8f59mWd2/6fyJt8M9/lkYngBUnDzrmNKpPNqckF8Fg8fr+/ncZ+ieeQ
	BvKC5GI+ATmplnqyO7SCjFmCaPCtGD6TbCXxqJAHsYuciBREtVpxXiz35zFfWEVeFlZjbYVQPzM
	xkbmuImmeXnfiysjmOUWg9bTHDIUpzVqCs4FSJYky4pww3YlwOTkEhJGEohhla3mFurKwMdzMtw
	vLcZoqxp+IeQHTg/rL0H1VhUS2q9NGAzTaQAuZSS2ZIRu6rvqPdi35+rzfQrpQCtR5qLDnaQeiu
	9BT1rQ==
X-Received: by 2002:a17:906:8410:b0:b89:fb0b:65e3 with SMTP id
 a640c23a62f3a-b937654ff2emr381712766b.47.1772363873608; Sun, 01 Mar 2026
 03:17:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260301011131.4057-1-teknoraver@meta.com> <8eb8c51eeb87f178e92e68bcfffd02701845c48d.camel@perches.com>
In-Reply-To: <8eb8c51eeb87f178e92e68bcfffd02701845c48d.camel@perches.com>
From: Matteo Croce <technoboy85@gmail.com>
Date: Sun, 1 Mar 2026 12:17:17 +0100
X-Gm-Features: AaiRm50-LNjx9Ny8V3e5yzdxhecUzh5cT2pFlVSJ5v9VDlJ7yq5lmvjH6894s3s
Message-ID: <CAFnufp0rQ=p2qGcpDdJB-SjW=qNOaxFRTrO1TprhKLtds96bJg@mail.gmail.com>
Subject: Re: [PATCH v2] get_maintainer: add KUnit maintainers for KUnit test files
To: Joe Perches <joe@perches.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno dom 1 mar 2026 alle ore 03:36 Joe Perches <joe@perches.com>
ha scritto:
>
> On Sun, 2026-03-01 at 02:11 +0100, Matteo Croce wrote:
> > ```
> > KUnit test files are scattered across the tree and don't always match
> > the F: patterns in the KERNEL UNIT TESTING FRAMEWORK MAINTAINERS entry.
> > Add the KUnit maintainers automatically when the file path matches
> > common KUnit naming conventions: _kunit.c, -kunit.c, _kunit_test.c,
> > and -kunit-tests.c.
>
> nack.  There's no need to modify get_maintainer.
>
> Use F: patterns instead.
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96e97d25e1c2..9796e184b9d5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13956,6 +13956,11 @@ F:     rust/kernel/kunit.rs
>  F:     rust/macros/kunit.rs
>  F:     scripts/rustdoc_test_*
>  F:     tools/testing/kunit/
> +F:     */*[_-]kunit*.c
> +F:     */*/*[_-]kunit*.c
> +F:     */*/*/*[_-]kunit*.c
> +F:     */*/*/*/*[_-]kunit*.c
> +F:     */*/*/*/*/*[_-]kunit*.c
>
>  KERNEL USERMODE HELPER
>  M:     Luis Chamberlain <mcgrof@kernel.org>

So many rules covering all possible depths?
Sounds good.

BTW at this point it would be useful to implement the ** glob operator,
but maybe it's not worth it.

Regards,
-- 
Matteo Croce

perl -e 'for($t=0;;$t++){print chr($t*($t>>8|$t>>13)&255)}' |aplay
