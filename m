Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265393FA5D2
	for <linux-kselftest@vger.kernel.org>; Thu,  4 Jun 2026 21:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780607938; cv=none; b=GbV1PVLZajzN/hGCSJxQKMK/b/9DPYj/xihMsPgg/hTnXLdctOBbzeRmnunnqFYrUHw+ADSA1dDrRwaQF+GuXHu8+xAx9Wf1W9Zd7WegU+zHKf8fIAfCo9WZyrumv1Ds3wP48IRpBTKDnpiIB2nCsQoK8cu6eBFSB2HZo5mc/FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780607938; c=relaxed/simple;
	bh=j5Va7+gmykjYF242T1iZbiZTv44+SJJypaxifOh0AUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RfFLTvaN0GYnNohR/5Rlv8C7hsi6doaFKTqjJIIABEHjVurBGelgQxSSqaqVTIZ7jlrXLXbrHDfndSEJRpd4M2TnneEVl4GtWeN7bzlPrN3YpP12mapwYFMi8jz/FhmIqbjUMKAcd8qDcYfxLjB0wVB7fCTJ2gUAdRulJoRd0Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f6Iwf48g; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f6Iwf48g"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-660456349d9so1596774d50.3
        for <linux-kselftest@vger.kernel.org>; Thu, 04 Jun 2026 14:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780607936; x=1781212736; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m2J8USZDL7/DpTIcuYHRyNZJXHApGCptCywopvKKKw0=;
        b=f6Iwf48g0sV8eFbaZLcfnfr49MvzIaKGKwgcqlifmYPouS15GCriYWKZBmyjHTmuzE
         zjyEb/65tqbtpv+uvM1STrUQ4ohRKKbNqvAdYScq0AP58i8eViSLl7y9eXrhBJLMPk4b
         v4IPBECBBEtfa9hc5CXR83YHg4q7n6bGKdhQlu8qU9Ybwv20FlAFkAHQsTUAmixwupZP
         sNXGO8teGzeRUFpJQkqDlyjDgU35kk7BO0ILO3T3VWR1fpcBUuvz7Dff3TKaQJTtgPKt
         vhwY+cm8yBYVDli1ckPgytEZo6fMcITwrLoUhTXHvtvbutcw7lWkW1kyrbdvyHuNex5h
         Pbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780607936; x=1781212736;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m2J8USZDL7/DpTIcuYHRyNZJXHApGCptCywopvKKKw0=;
        b=cGi/83fTDjIEu6osK2cVSmnkK9Veai/QFCDyKZ/74sK2paDVaKZGKz4SnWgDxwV9Kd
         YHgpPG3yRrIMfr/lgdzOxfk5uXV8LBozDXf5/u/HNJt4J8gxBcCQK806vw2I8YRgpUcz
         xR7rIOHhQQkKOmC217v1bEOM6/9U0RA29lOsxhqvyrZhrRu1sJ7/WmukxRNpUT8l1pZB
         JUgKEJjeR7mk8o3lrU96w4bhsb0HAAzzyu7Njj2yeU02aAq+Y8p+d6zUcNbgf9FsJHnS
         36FCUzeNNzuvo+YG3Urqb+Q4rdnsolb7PqmV7hSax7zgciOM691e8nTYkwrvowlRnwh2
         fs3Q==
X-Forwarded-Encrypted: i=1; AFNElJ9OBduMvr65ty9hLTHiqaGlUmD1qVMaj8Z+tJiDM5VfNz5a92AbT/Ct0cNMU0hWByDc/ir0AuHYFNLlCudTIvo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yye2BOCXVnNr8i7W1j0mgnIWUnx3eJtVTCH8FYyG+M8Kae+Bo7i
	KE5sdKLpx2caF7DqPuaiEW5NBh/n1jLej3aVbtambEdvhiF/3CMkrcpT
X-Gm-Gg: Acq92OEKV7SzgebKNzExWPzhXY/hEgckZBkjBaznZWRkZPY9Z79X53owv2hHgBEicXq
	c7zddGwh5SCRnmaFcx0wbUi0Gzm0zrNF9XCqtYQsKZvh+QPn0hGAEiuo7GEjbzQwnJqhh/jcsQC
	crOIwUDsEgaqbKjyipDJ1jbNmVZeehdOtl8zkIp+iVBW7JzqlynHo0/vT3v5ychddeJe8yopIt7
	tOoo+Yq4WthMMibiC/WwZubiZXRa5i9U5pYj1W9HSonXKpw5nP72O/gzeQ6rykTsjwXG0qtCMhl
	Cyjr7r9vRzDaCVFc0YVrc0zPpLJzDdcNECQQfbxHyNpnkCXdkehDWhMxX3IvaabIufBzDK3dNCH
	9upcgZt5tTesyc0fIuGqfzX7HqsV34t6l67Xrws+UvPSUIOGuFSWAl9jIKj3haL9IWXxJTAYRFw
	mTfbcJpuPvGzoQZ+cMUje7PfkqyWdxszv1uUcxP+2x2CidoPZPnzllN891EliaA4Ajj34=
X-Received: by 2002:a05:690e:4805:b0:660:8e61:1a49 with SMTP id 956f58d0204a3-66106e4abb7mr376567d50.18.1780607936124;
        Thu, 04 Jun 2026 14:18:56 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:6d35:e45:54a5:6b0f])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-660d5f883e2sm4500821d50.6.2026.06.04.14.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 14:18:55 -0700 (PDT)
Date: Thu, 4 Jun 2026 17:18:55 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Song Liu <song@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
	live-patching@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Joshua Peisach <jpeisach@ubuntu.com>, 
	Florian Weimer <fw@deneb.enyo.de>, Breno Leitao <leitao@debian.org>, 
	Anthony Iliopoulos <ailiop@suse.com>, Michal Hocko <mhocko@suse.com>, Jiri Olsa <jolsa@kernel.org>
Subject: Re: [PATCH v3] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <aiHgdw_fBv8RTgC2@zenbox>
References: <20260508195749.1885522-1-sashal@kernel.org>
 <20260517134858.146569-1-sashal@kernel.org>
 <CAPhsuW4x8shWon8Moi5VgCq2n4E2EzaaauZ2HHpy42Rp1Y-J-g@mail.gmail.com>
 <agsVDqdALBoHEHlv@laps>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agsVDqdALBoHEHlv@laps>

On Mon, May 18, 2026 at 09:33:02AM -0400, Sasha Levin wrote:
> On Sun, May 17, 2026 at 11:37:36PM -0700, Song Liu wrote:
> > On Sun, May 17, 2026 at 6:49 AM Sasha Levin <sashal@kernel.org> wrote:
> > > * fail_function (CONFIG_FUNCTION_ERROR_INJECTION) is disabled in
> > >   most production kernels. Even where enabled, it only works on
> > >   functions pre-annotated with ALLOW_ERROR_INJECTION() in source -
> > >   no help for a freshly-disclosed CVE. The debugfs UI is blocked by
> > >   lockdown=integrity and the override is probabilistic.
> > > 
> > > * BPF override (bpf_override_return) honors the same
> > >   ALLOW_ERROR_INJECTION() whitelist, and BPF itself is off in many
> > >   production kernels. Even where on, the operator interface is
> > >   "load a verified BPF program," not a one-line write.
> > 
> > If it is OK for killswitch to attach to any kernel functions, do we still
> > need ALLOW_ERROR_INJECTION() for fail_function and BPF
> > override? Shall we instead also allow fail_function and BPF override
> > to attach to any kernel functions?
> 
> I don't think so. ALLOW_ERROR_INJECTION is not a security mechanism, it's an
> integrity/safety mechanism for both bpf and fault injection.
> 
> It protects against a "developer or CI script doing legitimate fault injection
> accidentally panics the box" scenario, not an "attacker gets in" one.
>
At that point why not just make this entire killswitch mechanism an expanded
version of the bpf_override_return helper that doesn't care about ALLOW_ERROR_INJECTION?

Then killswitch mitigations are just BPF programs.

This could be paired with a userspace tool for building and
loading the killswitch programs conveniently.

You can make the helper function only succeed if (CONFIG_KILLSWITCH=y
CONFIG_BPF_KPROBE_OVERRIDE=y etc.) and taint the kernel on the first call.

BPF has the crash_kexec kfunc already that can take down the kernel.
Thus it's not crazy in my opinion to add a helper with a similar intentional
intentional footgun in another kfunc/helper.

We can automatically benefit from BPF signing mechanisms to prevent
unauthorized loading of programs. If killswitch is enabled, users can
restrict unauthorized use of it by restricting the loading of all BPF
programs to those signed w/ the key.

Thanks,
Justin
> -- 
> Thanks,
> Sasha
