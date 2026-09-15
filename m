Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AAE4BE43A
	for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 18:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789496935; cv=none; b=S0IC5kQfw5AsTlo0nOlPTUatzFoqLJ2pHq28JYMIsWTohoJhFgyVsMdI7JmbgVs0bQePd2L5dHwFgOMTBQXQvYH1ZVmCwuGVxqs7V8F9/42nfMkdQ0S+FMM40l9HjBAQXMJa2O7+d9mVh+PHZ9bn/70a4TzNB1FB/u2bv1TxUqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789496935; c=relaxed/simple;
	bh=ExaSFTGuyajSGkffCmNiiOT5gX4RugpQ5HKd+MnvrqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STkW+Hd2eKFsxaZ7rqwbCOf1qaJRow65ekTEFS+aAUAXISN9cnnkINlPij0reshcg0+o0xkCmFSzilsrVJjLrOXBOKPt6LHiC+nCPBkhn4Uo6joqepISCHjjQpysa1UHX6VGiidWZga8eTDNjnECdTixSKttk5y8r8mqszXsVdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jh54XB8Y; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jh54XB8Y"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso9077f8f.2
        for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 11:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789496931; x=1790101731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2OVh9TORSOFM2eLBFL8+9fGSDQsNIFtP4Ssj+M+8PKU=;
        b=jh54XB8YWCe1aiMSLkQdoBxdEiOsF67lTi+047bm/pHMz+mYRwDd33G8uIgxpNCm/4
         DQbRGkukQDu5Tz4RsHIVbiMmaKe27za/IegnbSbl5jE7E0NNo5QiG4Q1nLR5SyBVHqX4
         AWu6+I1d/vcDZH5OmIZK2+rWDHDcn3QTX2GZ8shYKqParQ5C/H1YHGodOc7IyrHhEgL4
         lDyFUZZH1RhY/BSmwLYORiaPe4KvZ2DJaZ0sjUaBz8/2hIjmacg9uQ7ow4HbBGX90cCD
         ieWbBJjc4dNm9gxAe5kDBgfmZedaVM/8v5ktwn9TSwwRfrdFM3x3AoscqG3ahlh8NDUC
         AZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789496931; x=1790101731;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2OVh9TORSOFM2eLBFL8+9fGSDQsNIFtP4Ssj+M+8PKU=;
        b=jIh4VHji820WmuYVuICuFBZMwGGkJ+YUzevgXoFl5M/P91l+HheKqz1KPu/6cG2XaA
         kSbk561GKMQeLix/Hb5IUQ7uKWt5u6HQ94vejJt4ELa6UpgWUPt6dGdAKuD2YKU8Yucz
         BuiJYDUgc+jYI+zUu7vCeaAgBHKLPNuYjytc7UJLmwn7jJEL49V5Z08yfO1Pkau7FlrI
         3lnpDlc/0XS7rXVjFVYLuXTG76bcLcn+UeRrUB/oN17xLgFWkvVcYZ7LzyHONpvYWl0C
         AE6wbUarXPlE5GkUfQD8hSA97UqvsPtN7bCd8AXSx8/7gUb0iB//Kd1TxoK2k5J6B/JH
         RK3A==
X-Forwarded-Encrypted: i=1; AKwUvBzBlG+OhEBmnBlU7LYrF5cW2pkDAECkvC39KP6R4bYIvVvRcxdPeEeZDJfRviygvdjLh34iVXMmfHZLYM/NszM=@vger.kernel.org
X-Gm-Message-State: AFuF++lydtVqpcpHB2Gh7yw1mh6bmjpE3Q6s8oh7bTdNV2geo26rnYJ+
	SlwpR0Lhidf1YLrEM5NWw5+HP3o92rxQL/YaouIX0zVMFr1Bnf6uIqLq
X-Gm-Gg: AYBFou39Fafywyi3wkcMJDuJzo6qyyGi5RFEut0Hsyxr2fsHzb0axgYIhfUTgYUjoME
	t0LdTRBiL7V4rtmIe8f/zSuRcTSR8g1/nxn99bwyFbill6SiGdTbSfVFpP39DyAMZNq4bkPdfbi
	39gcxK/7i98P9cSoFry9r4lj52gGX2ZU9KUkpjPYIBqaExUJ/kT829pPSobQoQ48Cq1xofDNmX8
	TeGnskmYE9Ug0yZa/vlBJ6cUle/Sdkfkni1LbncSXgsVYaq4sL7CPaVF6is2UjdYMWc8jEKzcjL
	DZT2boiK3nstpSRUkFEMgXFYl51Y2uH9fnIeuIGXkUNhAEPQzPw3yfZktKiEhpsmmLX8QBctLhP
	nXzrwKQVfzMmlDXYLN0C+eymI46g51PHT8XQWEe62Tpb5JJYUFtXPyDtnZHD/OVRKR7sHX3cvRH
	1oPhmt1hkYjuV59ZIwVFgbpg+LsPTDKKMsYgmYFBDMXv+I7HJ6xW7VEIs+hV+opNCeU3ghot/bD
	4aEazJ/sCxTHU+p9FeXK4oetGOMVQ9YJxZ/CuywdhshraUAam1n3kuSeLDlisw/KCmzIf4D+jn3
	FejRSIuUPVz6Q9G5hr3Mh0Lp0ERLYHlMgwY6t/eJyZ49Z2VRbguymQx/4U1gWogkiFzre+Q4Fh9
	AXj1ucarOVYsa/uulPjYVkw==
X-Received: by 2002:a05:6000:184a:b0:487:bef:31a8 with SMTP id ffacd0b85a97d-4870bef3228mr766622f8f.0.1789496930649;
        Tue, 15 Sep 2026 11:28:50 -0700 (PDT)
Received: from MBP-von-Karl.localdomain (dynamic-2a02-3100-afd5-c801-ec9e-1a2a-2fc8-3f88.310.pool.telefonica.de. [2a02:3100:afd5:c801:ec9e:1a2a:2fc8:3f88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fe7esm805784f8f.6.2026.09.15.11.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 11:28:50 -0700 (PDT)
Date: Tue, 15 Sep 2026 20:28:47 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Haren Myneni <haren@us.ibm.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Dan Streetman <ddstreet@ieee.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] lib/842: add KUnit tests for the decompressor
Message-ID: <aqmN7Wt4f-DXGEhn@gmail.com>
References: <cover.1787978627.git.kmehltretter@gmail.com>
 <e9659617ce2f1466f227d562f47b961f340ab3c7.1787978627.git.kmehltretter@gmail.com>
 <CAMuHMdVcZ5cV4-HrjLYfFKh6UshiVxq5eXCNyp0Z1k_SMAvF5g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVcZ5cV4-HrjLYfFKh6UshiVxq5eXCNyp0Z1k_SMAvF5g@mail.gmail.com>

On Tue, Sep 15, 2026 at 02:57:55PM +0100, Geert Uytterhoeven wrote:
> > +config 842_DECOMPRESS_KUNIT_TEST
> > +       tristate "KUnit tests for the 842 decompressor" if !KUNIT_ALL_TESTS
> > +       depends on KUNIT
> > +       select 842_DECOMPRESS
> 
> Enabling a (modular) test should not silently enable additional kernel
> functionality, as that may increase the attack vector for a product.
> 

Hi Geert,

Wow, good catch, thank you! I'll prepare a follow-up to fix it.

I also found a few other KUnit tests using the same select pattern,
so I'll look into fixing those as well.

Karl
