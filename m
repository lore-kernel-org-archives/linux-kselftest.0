Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B33393DE9
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 13:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811063; cv=none; b=WHxeM3hdkBXbboa2/rY57baFI5cKjrFEcQfl0EEXKiWwTWns9WzS163MhqxQV1iSZrTnIC/IxSTdMcJfaTwcjIYtsLAN09NO57ieK8KcK5QNgS8k/p6+Kr/+A383GOlKnBaA4UhTmtLNUkpXwXjBRJ/eHyIXAS84KCJ5pB/6PGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811063; c=relaxed/simple;
	bh=sWZj4fi9PchIWq6iTv6FoJJcUWY4ROJjikopBkr9icg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fp4pEVlyT57rhUFuCJCPEM6OGjtin8WEpcrBMhuGS7qlMRxH1w1mGqRcHC7m7UVYJhh5RIaJWY3arIHS+wggxRHk5ZUNhmhvFkPE+iV+/t7KK17250E68ltB+IqVKO/E2C24e/0FRAb+6QXLE6dlD+cBQRN/HPb8/1RMFzgJYEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gyFHEdYS; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gyFHEdYS"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a17b4c613fso9167355e9.2
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 06:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791811060; x=1792415860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+fEAaRgfVTrd4ivzqjJHoxub+cLoCC1NeXyWvtmvqHk=;
        b=gyFHEdYStsj+LBr9NGC7a1w2pOu/0BpTT7rrJLqnUMTFuP4gQzld2wMQaPLXFyx9eQ
         SyaiOIIz/N6aHSi4Ykh0Lw8MZX7I8NWsbkFVMS6CjiaUz7XMEvZ/lrqsljWiHBwF5Z4I
         CxMAWnsaF3Kzx3GpPPCCRDWLUv+2Hsf1DmkeMeov2iAE+dwU6xTTC3fJPXq8XlQuPDZE
         HADKt6GkqgXddLHoL9FJg/pgwLj8gQezXCbP/bYFFQq9jOmhRaLhs+Ztt9lwx5qifkZz
         fj6kLCF5ub1LQUqaWvFqpNJWGKf6/7p9ol7OSsrDAVRgcJb7HMGUFvXtFMMGzCvtgqvZ
         Q+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811060; x=1792415860;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fEAaRgfVTrd4ivzqjJHoxub+cLoCC1NeXyWvtmvqHk=;
        b=ZAKCpahV26K4kAfF6mS1gIBRmJamnPk0LnM7R22YBNtNUBf4ni2MNFKnpf/FabeOCC
         bA9Mch2Sprql7rlLImOofA6EFKz5KMWcDrijR6sqi3fyq305T0/Sg54LZL+xHiRz5Qou
         rMv5oDoPeI2ei9E2s8mqIbEQKkIuZGrgVV3cCELTf/8A+3ORkFhoglr4p9AYZiud/2wM
         A541DznQjXcas79F2fjrXM7xifQC4vEoXv0fP4AnrhWquGJcJUA2yBVYS9xfCOWJpba/
         BPHENb18jvJnNI9Yh7KCP2Q2iowqGJ0gqGWBOSRLesPwDw1p4vsFNnpr4UZVgVys9kye
         Y8Mw==
X-Forwarded-Encrypted: i=1; AKwUvBxrJhzdmxZk0NSB3h3QZrifY4KGiHPj9toiEvYvTJvn8A5OBYM/KQNVFZbwX1DjHRVlWn1F7t1uwDiObpEcCpw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJv5Hh3UO0nTn0vF8euYmhBfv/AHfJUbzMrbq17TPA87ZoVWkt0
	VrtcbBVkrRUDvLR00+8IRIWTPT3XeE+hrO7DgKU3pFDfCD+s1G2KXN0w2yRRmsjIabUIdCeL8ga
	sWGEux3oxwN3Ukg==
X-Received: from wmoo9.prod.google.com ([2002:a05:600d:109:b0:4a1:8741:47d4])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b28:b0:49f:ff7b:f056 with SMTP id 5b1f17b1804b1-4a18e4a3c24mr156632435e9.9.1791811060039;
 Mon, 12 Oct 2026 06:17:40 -0700 (PDT)
Date: Mon, 12 Oct 2026 13:17:39 +0000
In-Reply-To: <20261012115928.1372317-1-smariotti@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261012115928.1372317-1-smariotti@disroot.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
Message-ID: <DM2W05XKJT97.2ATHPA28J84ZH@google.com>
Subject: Re: [PATCH] selftests/sched_ext: Fix build error in dequeue_remote selftest
From: Kuba Piecuch <jpiecuch@google.com>
To: Samuele Mariotti <smariotti@disroot.org>, <tj@kernel.org>
Cc: <void@manifault.com>, <arighi@nvidia.com>, <changwoo@igalia.com>, 
	<jpiecuch@google.com>, <shuah@kernel.org>, <sched-ext@lists.linux.dev>, 
	<linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon Oct 12, 2026 at 11:59 AM UTC, Samuele Mariotti wrote:
> Building the dequeue_remote selftest with newer compilers (e.g., gcc 16)
> triggers the following error:
>
> dequeue_remote.c:39:32: error: variable =E2=80=98sum=E2=80=99 set but not=
 used
>
> The 'volatile' qualifier prevents the writes from being optimized away,
> but does not silence the warning, since 'sum' is indeed only written and
> never read.
>
> Consume 'sum' via an empty asm() with a register input constraint, as
> already done for the dequeue selftest in commit 3788e3251653
> ("selftests/sched_ext: Fix build error in dequeue selftest"). This forces
> the compiler to keep the accumulated value (preserving the CPU stress loo=
p)
> and avoids the build error.
>
> Fixes: cc07fae1de5d ("selftests/sched_ext: Add a test for ops.dequeue() o=
n remote local DSQ moves")
>
> Signed-off-by: Samuele Mariotti <smariotti@disroot.org>
> ---
>  tools/testing/selftests/sched_ext/dequeue_remote.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/testing/selftests/sched_ext/dequeue_remote.c b/tools/t=
esting/selftests/sched_ext/dequeue_remote.c
> index f2c1901030de..af344581d5f1 100644
> --- a/tools/testing/selftests/sched_ext/dequeue_remote.c
> +++ b/tools/testing/selftests/sched_ext/dequeue_remote.c
> @@ -43,6 +43,7 @@ static void worker_fn(int id)
> =20
>  		for (j =3D 0; j < 20000 + id * 1000; j++)
>  			sum +=3D j;
> +		asm volatile("" : : "r"(sum));
>  		if (id & 1)
>  			usleep(100);
>  		else

LGTM, thank you Samuele!

Reviewed-by: Kuba Piecuch <jpiecuch@google.com>

