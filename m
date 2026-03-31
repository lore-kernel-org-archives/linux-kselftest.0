Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D8C38A709
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 20:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774990358; cv=none; b=RyjGxE1BNBhnpo0VB8xqesMPqwlE/9TZZtOmzd8h1UxWfANOx0nzg/oFPh3juse1TC7RS2gbPxtmsT45VYu9yIQ7bSEpQf9AZP5qwPOw5/Hp6nUjcSEbSyeT4CvdospTCQ5aFbvs55yqqz8jkWp9vrxE6e1xgWxjzfgHZeDYjH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774990358; c=relaxed/simple;
	bh=8+UnT8vSH5x3hLrKGpP2WV538rU6FUTW4TA7XgOjUqM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=VNG52jmlcnY0SmJ/kg5HsaNEds71ZFoMQWGHZdgqpjMXQC/f1Rt5rMVZn2g78EO1JOF72BTvv5wLanYlOeTYmCwzbPosBzKla/JfoQLJ1iZzX0LNp6r2KbaqcxTEOon8AcD9sIlxNa3zAgGHgN5ubSrUEVXvRMiVb5/2R6bjx8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wqit+y/2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rGkkLmvT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wqit+y/2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rGkkLmvT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774990356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jf5SVc6Wh+MV+1Py3i/pwSgvdn+BQX+ZgkhsoC83PmE=;
	b=Wqit+y/2a0yMcpdMzL+AlwklAKcgShT3dpN83Pa8HogZ8uGcpkfyPvmZ2WSnW5+zFk2uih
	UaCNq4r4+vdhwuG2iF7P4hEbw3IpP9f0xmoGq1s7oa7aBZqT8voK0yzGtRL5Z1C7RCluvV
	nnRFTDZgu87RfIRKdcByPcbGG7lwhvY=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-ys9BnnczPDycvZ8qUGOP1A-1; Tue, 31 Mar 2026 16:52:34 -0400
X-MC-Unique: ys9BnnczPDycvZ8qUGOP1A-1
X-Mimecast-MFC-AGG-ID: ys9BnnczPDycvZ8qUGOP1A_1774990353
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5675cb317e3so5204810e0c.0
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 13:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774990353; x=1775595153; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jf5SVc6Wh+MV+1Py3i/pwSgvdn+BQX+ZgkhsoC83PmE=;
        b=rGkkLmvTMp/Zmbgznyoe2IySWvq7FmHlAIDHJGQlhUKWz9qElnWvbWb+OQYHNXjHqR
         aSB3fPcdDaTHwRWrDSi/RA80SqnCIHHuxQViDEmkIetUMO1soqb8jwLkqAsn0dMv76Oe
         OxOboiNq67CGN5vXLu/QpVJPNE7YiLWntL81zYOmJT3WfsVbQb79H4TeGiUlegZasHwY
         fySmvBRH5q1ovzGOSHbUR6iSh/lj5AdJGYGW1+PY602wCUeoknPVgRROvl2HTtnT4cHe
         N8UKJuzPKuRDVGYgLlAAYMFHgD1/k6t0SmyO879meaBDU2W5Ayaf0QVKsy6xQtNliV30
         Yz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774990353; x=1775595153;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jf5SVc6Wh+MV+1Py3i/pwSgvdn+BQX+ZgkhsoC83PmE=;
        b=jRrFoj0asqKF0O4N7ihF72CpIfEQr/t3Oly0bUQrz3vwonbCWmg/4kIU+YtLXqp06V
         ZWnWTj9/6j1pWYUpyK0W3YGNrz8T8au7JKFGTXVMdj77EQpPmXjWC0ARwRLcVZf/m/dg
         0MECYku9BOnPuByu7rHPmjtetReMS4m/ggqsMO5ozA5n5hQfBN26A8soFQiKgYEna3BA
         NiqRLAT1dlpC49OK+oQLrfsUChOuKYQkZNlzdQSH3O7caM0g0S60tFKYFvnou+QI4RhV
         fZPwMVVlSX2Y9LwQl6nZML2vZ1oloJt30JLXbcAUWi6FUaZajANv+9ejOSI+/pd8qgzJ
         OX+w==
X-Forwarded-Encrypted: i=1; AJvYcCWqjoIGpDRV+QeBZ5myxnWmnepb9gllTz6I5VHh7faKoUz5xZj02oPrR9gf7yFpqzS6CeHY44e23+iFYEEs6mI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yybs8FIby+/q5eQlvUTCodQH+4/6IdI1l9YVB3K7Wfa7KZ7E6jt
	l/TZgoQNCbV+xmOAS20IlcuPiGbM7Nkc+7YItcevsvjCkVAa9Bqjy91F1AtyCxzFqWO4P2sB9kB
	ZzABbRRRKEL8Tz3jaSvGmLNCJ/gsb1NIegcVUyoR4npdnDR32cAK3bWwyKRr2lCFtaVXrGw==
X-Gm-Gg: ATEYQzwmX4eNYTk8ZkEJW/gpjrXfxi45MTP10DhR3cJbT65ugtV0Lnul3kfXCknaznD
	LbTtJgXDH0qT6xgFEtTaB/OPi99AvXmmAytYfKoz03SzEQ9m7TkJXlhyoUSzNfEl/VMpj7Uq/qc
	crp38uuFqIUgja0WJKA8dKK+QBj3L0LlTpGbwkNLRQ8nS3ENvrTddrx0wwMJCKtL27puxN3aidJ
	bPKuIARTpgHat3P0/wiMkldlDCvg+s4GAy1rYno1/9TNussCAJjpYULqox+Tfw/AGPjyUrc54qa
	wYWkL3jpu2t+eouamcKhOG4tyDoSG29P8pWuHJyncMr21SRGeXIv9ppTp+2p7tnimynt+VVTQbI
	PS0LUePUF/ieYg6Y=
X-Received: by 2002:a05:6122:8c8d:b0:56b:8023:b89e with SMTP id 71dfb90a1353d-56d8a8a5bb0mr521745e0c.6.1774990353595;
        Tue, 31 Mar 2026 13:52:33 -0700 (PDT)
X-Received: by 2002:a05:6122:8c8d:b0:56b:8023:b89e with SMTP id 71dfb90a1353d-56d8a8a5bb0mr521734e0c.6.1774990352988;
        Tue, 31 Mar 2026 13:52:32 -0700 (PDT)
Received: from localhost ([143.54.48.116])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d588bae4bsm13748228e0c.5.2026.03.31.13.52.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 13:52:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=a749765ff5ddb75338189f0b931545c94d3203d4c9aa1b60eb5b58e37bdb;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 31 Mar 2026 17:52:27 -0300
Message-Id: <DHH9KCN1GVWT.3SC8M0FTLBRPP@redhat.com>
Cc: "Pablo Hugen" <phugen@redhat.com>, <live-patching@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <jpoimboe@kernel.org>, <jikos@kernel.org>, <pmladek@suse.com>,
 <shuah@kernel.org>
Subject: Re: [PATCH] selftests/livepatch: add test for module function
 patching
From: "Pablo Hugen" <phugen@redhat.com>
To: "Miroslav Benes" <mbenes@suse.cz>, "Joe Lawrence"
 <joe.lawrence@redhat.com>
References: <20260320201135.1203992-1-phugen@redhat.com>
 <177436214729.62466.7977538958560300344.b4-review@b4>
 <acKje1XMQMQQYBIL@redhat.com>
 <177442832293.70541.15179138173140080388.b4-reply@b4>
In-Reply-To: <177442832293.70541.15179138173140080388.b4-reply@b4>

--a749765ff5ddb75338189f0b931545c94d3203d4c9aa1b60eb5b58e37bdb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> We sort of test the same in test-callbacks.sh. Just using different
> means. I think I would not mind having this as well.

Ok. The original idea Joe suggested was to check the function output
of module targets directly. From what I can tell, test-callbacks.sh
covers the callbacks and test-ftrace.sh checks that ftrace
can still trace a function after it's been livepatched, neither
actually checks that a replacement function in a module target runs.
I can be wrong though, still getting familiar with the livepatch tests.

> I was *just* in the middle of replying to the patch when yours came in,
> so I'll just move over here.  I had noticed the same thing re:
> test-callbacks.sh despite originally suggested writing this test to
> Pablo (and forgot about the callbacks test module).  With that, I agree
> that it's a nice basic sanity check that's obvious about what it's
> testing.

Fair point. Altough biased I think it is nice to have this explict sanity c=
heck.

> A nit but is 'noinline' keyword needed here? proc_create_single() below
> takes a function pointer so hopefully test_klp_mod_target_show() stays
> even without it?

> No strong preference either way.  I won't fault a livepatch developer
> for being paranoid w/respect to the compiler :D

Yeah I think you're right, not strictly needed, just wanted to be sure.
After some experience rebasing kpatch integration tests I've been bitten
enough times to be paranoid about that :)

But since I will work on a follow-up for the other suggestions, I think
I'll drop it there.

Anyways, thanks for the reviews!
Pablo

--a749765ff5ddb75338189f0b931545c94d3203d4c9aa1b60eb5b58e37bdb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQMP+tqh8XWgfhXItgg/MNYDx+9egUCacw0DwAKCRAg/MNYDx+9
et7mAQCQ3BS4Tzt+l9lrgsw5/AiE6uK+9S9cTY3uaYshOqa7YwD9EDdExC61qsp7
+e6A4kEz6WT7/BhN+jL0JDNSIg8zdQg=
=e5bP
-----END PGP SIGNATURE-----

--a749765ff5ddb75338189f0b931545c94d3203d4c9aa1b60eb5b58e37bdb--

