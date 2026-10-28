Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793166945;
	b=teSDC9Y5TrEBxK9ZZsGuMQvQzZMRbNq94zaO8ziKxVpS7tIjVCVz6rf4OdAiob/I/4Af
	 IIbDK+A9cKAqOKayOJ0BxQV+ALPfE0uU+nYFXFCwTBWfQL8KIe6Yw5aJoeHhA3j/KmocW
	 WPP5KMKz0RNkbfTHZct9Gaw04CVFgmqehQuXzivylJK8IfpCWVsf8wrQYDf/ijrjQYMbo
	 U9hSOIJ0EiO4jC7nWyKUUegFzA8YEOtGjyewayU94gBwCxDkkNbiTkxGA+fXhJqgQAh8J
	 OVm15n0WDOilkRCPE2Mfhw91wqRzZ9HG/GIpD/CdtpncvGpefVR8lhsmeGs5XdJ3jNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793166945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=hLkqAi8ctPqSRIwXUevfGPv3vaKrwbjwbnl9pr4s97k=;
	b=ZCgklb7ZjkD2GaRyhylfbAXjXhbS4rLT1/5Bw4d51WAHEJbchr9BOvw/G9eJQN7ZW2U1
	 Pgq9+N3feKklfWgkM52gixQ30oms3szBkJ+rbw7GGGkQX49f25jc06foQl83kNIhsXnEr
	 jVyc0mUpgU3w6anwIQj86fhuU45Py6wsuwIxPbHZxpaCDw7GMdORSCuHIjhC/nR3A6i2k
	 vec9NZQmbBjUDKtpuEcQTXG0uTnx6uva/owecxkWVeUKwaDA39Y1xpIQdLbzv53kyddS4
	 Gj/NLJfDEW+KYBCu7ebahZR0kstr9xRr5EfasSoteuDZUMvTB2bjUwYY4uagAH9jDew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=S1bmZhe5;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03D6606A31D
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 05:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A03D6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=S1bmZhe5
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2eac4877accso1798805ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 22:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793166944; x=1793771744; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hLkqAi8ctPqSRIwXUevfGPv3vaKrwbjwbnl9pr4s97k=;
        b=S1bmZhe5omygstKNn+fR4XNnXR8jlOAug6FHViW62htHZqlaaV3C+husILnE2vlUDF
         qUlYJF3FxNHUTl83dYgzukZI/bHzvwRlNtWH7gR8fWpMpq/83wx9L/j3lJilHpU9YOHo
         cfLpDdCxwOCvGatK4hqkL/OtX/o2+WygsNxRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793166944; x=1793771744;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLkqAi8ctPqSRIwXUevfGPv3vaKrwbjwbnl9pr4s97k=;
        b=oEiSImJP0D5N+Fzazou0QVNYyP/+/Ybqf4bevebT+pUo1MqOH1/fxqmi7ZmVcMDJ/W
         XWMXIbKJ0X9FzV7T7ONPFnE8OIJ6c4I/wQE47AnmTuSXvpwDSbirtaPX7lsbIqdEV0vU
         4VajLHO3BJZwlqjZ8DL6xYu8oWzMATbDI8iYZK+fJ6OABKLiZ+JdJUeUfNn11uAyU41W
         orpWSxkwjqtUwX5J0OhBAWpMp92sfJDwbJD5jdchgUlesv/OgoKG1qEg6MAvtyGccKKq
         HAI2swg0PeV9ppbpUyvIpOT0qzcnKy2RMEbgQkqiIfT67k2OB88z9/3Cp01+JGIv/44g
         ckBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxN8Lmwb52IDR6lVKXBRcBJT0F+dPKD79qqCjR37ubgogwPdpQKf4SkrQldAOENpZ8y/xSjSldnn4dUt3VBSIg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6unshH1ze+4BRGXYG4lK5RIOCf3eZCumHQOZU0Ey1kpYggX+W
	OFc/8MJSMrCawxgdwknOI4tffYTMyUeg4S4/Gkw9Vznx/hipuAgvh5qy6rKQJcp2+xQ=
X-Gm-Gg: AYBFou2QbpKZfZY7CgpLqvmwSrFUn1VY2UXqT1oKm1POnVomkNbXzHP2p5ki89zErcx
	XqBagoYTIqBPq438pAYleK+CQOAbdqNzSWRykFsrqdBxNALqYRn2BWAEVgPAz2VJXpdmDv3V+a9
	xwwPKEJ49+YyawTJ+qfEhJ0ATKb403szUOyb/XG3iNjKUbGypQvKiJR4Ol8m1EJL6X3TCTsMm+A
	2QrSd7V5G+eEhhFKTgW4oZd+L6A5sAzv+Q4omkbnofqlKfhteubSATHZOdumDzwKc1kHJf7Xwee
	huXx7+xYWuYJQj5Pt7O0ua4oQroh1l2L+5sba1I72SFvXYp1UQFgML4BHOQYNy569hTfc3GEcrS
	GxSb9fR+5v8nSW/pyNs7gTRcP/I/6avbPAh5d1aib/YDZ2VFTOGRzGNc9ctmWthcOX/XUyb4DAj
	bcrGfi7kvPJvagHi8dODivDDsM42wlz4FuvVgBHmbNuQKeAsLIKwXK3bjyjPKPPebhPkeEygA1k
	ZC54/HgLHVaAoeKMkXuGBbgIGOcB7kN1yt+bWWRH0lFpCZpaSPLb+M6nJMttOWS2hklHI4h8ndH
	tZFNIs6HzxMNi88DKfJLSObqrLZoJtvgR6Rx+EAa0WWY95skDrRVmH+HbSu7cqs8OPT5OkYGrOs
	XQaknJRj6hM4zpxfYHxVquZg0FCiVkPdOL9H05lNpUtxan23e8uFtYUC6WHoRVp1D33Fi7lOA
X-Received: by 2002:a17:90b:4c47:b0:3ab:1af3:a0d with SMTP id 98e67ed59e1d1-3ae5811b551mr920591a91.33.1793166944108;
        Tue, 27 Oct 2026 22:55:44 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9019a4sm1368356a91.1.2026.10.27.22.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 22:55:43 -0700 (PDT)
Date: Wed, 28 Oct 2026 13:55:40 +0800
From: Chris Down <chris@chrisdown.name>
To: Jeff Xu <jeffxu@google.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	David Hildenbrand <david@kernel.org>, Kees Cook <kees@kernel.org>,
	Jeff Xu <jeffxu@chromium.org>, Andrey Vagin <avagin@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/3] mseal sysmap: Add mseal_system_mappings= boot
 parameter
Message-ID: <auGOXLB1XZFWcTfX@chrisdown.name>
References: <cover.1793094611.git.chris@chrisdown.name>
 <5bd3c89d733ad22224f296dfa8900769de937de0.1793094611.git.chris@chrisdown.name>
 <auCxjbvY3qPv1sV6@gremlin>
 <auDTMb6WMFUpxeZy@chrisdown.name>
 <auDTptDQsB4xBcz7@gremlin>
 <18e2972cb8520c2e.3137322e32382e342e3434.279dd1.0000sendgmr@google.com>
 <auGNkhSHpBRd2U_5@chrisdown.name>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <auGNkhSHpBRd2U_5@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Chris Down writes:
>- run_vmtests runs with -T expect_sealed when CONFIG_MSEAL_SYSTEM_MAPPINGS=y

Er, the other way around. I meant vm_runtests passes -T expect_sealed _unless_ 
CONFIG_MSEAL_SYSTEM_MAPPINGS=y.
