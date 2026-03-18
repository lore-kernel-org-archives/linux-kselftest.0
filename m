Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEC63AE6FC
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 12:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773836855; cv=pass; b=eosV1ny4H4aDQK/kaw6djrKGpceWusRc3Inp4m1rZ5X8bHwCyscgYtc9xacJdR91lwS2uGvkKIpjZ94nXgu5SgPZAFKBdydw4zUSvC0pKYJ4VCGwfDurSxLitEyCcL54STSrySPJdbSbI/XaTmh1gXcwq/Vk7FJqHCxUg2Hgdms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773836855; c=relaxed/simple;
	bh=57DBatuAN96wEw1hs2NPGmR/MF6/IhbrTXX5NsTXVwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kAGSfrqqrp3y21TNhx7zXysFunygfVTwj+ilQW0RfftjFzOSjwry8aoJzOejNAI3TbCME75Oqt2on3KmyR/5PmnofirycKvrIfV4KKpiBUaS0lpE0PVkMhG8oqJl6QnoxIQMvOCLFavwNFHHhp68bWN5PKggjxxM06YX00bQNP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLgsf9gT; arc=pass smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLgsf9gT"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d750eeaec3so2535464a34.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 05:27:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773836853; cv=none;
        d=google.com; s=arc-20240605;
        b=eGl6zdd27VuQ9q1xqq0vs9fRlrqDTOyYgfw44bavb5o63KsSLKlTx3JUrWV4LBjZ3A
         LD3meN0olpQiBu4pmrRlTKRiBTSfbv0dLvzjgtvSRYwUdWpA+ffcdz2OLqA8pYCs3lyC
         KWvM4YxP4Y5eL2HVHh48AeGL3O84vQ5jVaWd4RDiJA5RvFtmQGSU6B8vYDzuIYMk2jUa
         dLkfSMiDUN7mVLayqbCXVw9HOqpmpQIqYcCEAprX0iGKJvLmZx2PVZ+K1cbbU4y6abtQ
         pDWHdZ1hHvuJhYHWAkA0vrJuBoNrprA5CvTwjzmFMPZoJWYW3RxjvIi2agFW7LLKosCl
         U25A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=57DBatuAN96wEw1hs2NPGmR/MF6/IhbrTXX5NsTXVwQ=;
        fh=Kv7k/lLfQesRArpP3+F1SJRb7PN+beW5URHNhvkqkOI=;
        b=h59vN5tisz0esxX0XhSTxqcISxqRbk32MlXBvAEhfcZOY1jcrySu0IjS/Nc5BRdotD
         thzDTKwcfCIs+r0JylP3vJLvxzCEeuswZ6ox/99gcA9Wmq910iqdo+U67DF2A5Vu9mND
         hEuSQcMsmeylIRV6r4vvam5mFLZBbGpTdqI5eIjHy11UxdcyQ9z3sRcRnryvG9Y3Ww2c
         gPmrOgG0o0zK2uHo6rhyif277BMbfM2oBwaenu4YznbvVwheHda5p0NCVesDY8lw+F76
         26tAvh9oyM3X0eNrMax/QnyEzAOC6PlUjsroCjVXuFq5Ac4mw4+947TFRuIPwYztUw1W
         sdSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773836853; x=1774441653; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=57DBatuAN96wEw1hs2NPGmR/MF6/IhbrTXX5NsTXVwQ=;
        b=VLgsf9gTPIazixgSHn+tH1bt/smKQvDbvn2KQGuMClCCX8bP5rht0pcPmqkZm/UoBz
         uA/nyqu0G23bFF8foVCTA8puYumRZvIZVViWTLv9ClyG0VE/SF81rxMX4nTn5HWCWjVM
         rYShf3VYLQKjRxK27WnTRtgNRlf17H54elG24LyA4r9PhL3WVtEb3Tw50FLsOy5buOFA
         zWfYZ/QGG6Lwya7oD/ycxv9zW1X6Ar5h0eEuqv9cBTIG/bnIByHMpt7uMG7zDE57Wnqp
         safG8c31RrM82MJFMIqM454aEHe9qdYZUAF8IGHfMuJQbiPYuCYPPNm6pg67sOcTxPrd
         1qyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773836853; x=1774441653;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57DBatuAN96wEw1hs2NPGmR/MF6/IhbrTXX5NsTXVwQ=;
        b=I25s/9JO1pihk65ZoHSiQrN3/+Qzs0CBtWd2Fl/YFe2a3KFlRniVKM6PT2PlP/hPCV
         AMGwp6ONT9soiQtOoAOJbQXET6bddFL8/b4XfKoG+wPuGbcyw/d9U/udXp8L0oSfR9pY
         BvfQNgeOMqakeIr0GsfCGulfwzyd3JXenOXPWTXqWYF82G0gIGMNOSNZxeScM+z5wI0N
         itpkLV86hq0aAC8uz3ylTBKTarS+VEty98uGYonfpUJRG/irSNcrIyyKWGxbDdz2+Iqw
         yUdi4qcEiAiiW7hflaccB919pXbotGnhmb/3dxRkSebkmVHjEEK2P4eAaBx0PQQH76d6
         SJJw==
X-Forwarded-Encrypted: i=1; AJvYcCXJoPO2En9SmWi/s9ebzHzhYF0HSOM9LOdGFOCig9kkZ8Vm+KF+1hQy/P1vI7bdjjSCgIHOHnVgkoe8pY0hXoY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHLnici+XaiYsEbHI9uqWVGCRjCwoOfjgbBBLgAGiHcvZVCyN/
	HYG27kmtGvhuyZ0ZUG8wkgtRqnzxgWrOFqDxE2aP6jmyfmp26DRIuBq/flAoZ0No9iNGU9ddRKo
	o9zzmofAXikto2Jx1OC032v86OxKmEtg=
X-Gm-Gg: ATEYQzyNdD3DrjWDoaVVPobKBkCtCINr6FA1+xibCdrHOaItybr08iTI2qYMlmNVjbi
	daaMAs3oCpw4DWR72vJ4ZfeLEo0nk0VTkX8Nn913CQM/VkAsL72ccC+VD+nOuEvi2Yu9+suXxkp
	fRtk09Zwkt9PN0McvNAWPHDZ8DezCB9u+JuRvJ2Q2zeZjdBHa85BPZihewR8fqT/ym1QImVEKgQ
	rS0Qm108qu9ZolrCuNIWINJ6Ols7/JY2qiO3BQcIM+kXNXQyGN7rIkxmxw+4ZqSenlMTMceqGxX
	TSuJJA==
X-Received: by 2002:a05:6830:380d:b0:7d7:d4ee:c02d with SMTP id
 46e09a7af769-7d7d4eedb6emr394812a34.21.1773836852833; Wed, 18 Mar 2026
 05:27:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313232047.2068518-1-kuba@kernel.org> <20260317160948.5a358df0@kernel.org>
In-Reply-To: <20260317160948.5a358df0@kernel.org>
From: Donald Hunter <donald.hunter@gmail.com>
Date: Wed, 18 Mar 2026 12:27:21 +0000
X-Gm-Features: AaiRm50bKgI6qFOFT8WN3AQLtiSOOJ_pGC3hgT5P-Ky2jxuc2s378FO250cJxrs
Message-ID: <CAD4GDZw2GXOEGy=wbwDMbncwUr5o7T9W2cxRBO8SGsLsVGhnDQ@mail.gmail.com>
Subject: Re: [PATCH net-next] tools: ynl: rework policy access to support recursion
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org, 
	sdf@fomichev.me, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Mar 2026 at 23:09, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Fri, 13 Mar 2026 16:20:47 -0700 Jakub Kicinski wrote:
> > Donald points out that the current naive implementation using dicts
> > breaks if policy is recursive (child nest uses policy idx already
> > used by its parent).
> >
> > Lean more into the NlPolicy class. This lets us "render" the policy
> > on demand, when user accesses it. If someone wants to do an infinite
> > walk that's on them :) Show policy info as attributes of the class
> > and use dict format to descend into sub-policies for extra neatness.
>
> Hi Donald, you promised to take a look when officially posted?

Apologies, my response was sat in drafts :-/
