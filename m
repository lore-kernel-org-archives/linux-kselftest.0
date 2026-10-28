Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793166743;
	b=sqJmeSpgsm7wssNT4XjDx8uIzOEUPfQUuw82cJFEK4AIdSNf0aOraegTvBwvE9v+uiM4
	 4bqCd+q4dVAmTF4NG7sAt5QDuvuOV/e3Ex8Se87n04feb9ya4ixXs+ufFdxo8aCa3dZ/s
	 3eebeSjMd004mDtJPMTMqWg6xQyxGxIM3+BGF0qBy0D1ukxUVYQTI69G9U+Gr8IZWOb/S
	 Y+z9Fe+baBl7B2YT8g/xwbV3Q8Gpw7pEasZDJ83i6gY1YJnaZl4ZbaHQreaL9HdwLHDDO
	 tXufYp+SsRPeUIiwxPX27veun4nx/gVb+x+Sbiil56X8Xz94DCIZ7wqwVkGdxXnmZhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793166743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=o0+YQ8IhrloxYZmXJNyf64tQivuQ6Pn/Dp36CBxwNv4=;
	b=qK8XuIoHbZDVYZ3IvFB6/Ig5h4/x6/qu7zNr0jfB93mDfZFEK311YtLdLe3FTOarxlRz
	 NP15Bb+VFkpMO3GYUVzdemqN0mtxapoX46oK0QO2er8gAY0LWKKDddgQXtBO1ZEzS+859
	 L6nXg8lZZRgQLZ7a9DiwPoAk9HrfkLq15Eysax+aptC+qa6FuvLS2NloFTq5BeNv3d6Zt
	 ScQ436PZyqgXCi+Oh7qXLOcXLtfzKsxDZyEs9bqeOVZOOZgafDwMyEyDHBtsAhESLtW9x
	 39uBUDz8P9NyA7uI/xdcBpx9JzmPfMrecAeA8Y/VxjRg/KiHQVEIeOcz2cMoKqg7lIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=u1CUAc5U;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9786A606A31F
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 05:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9786A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=u1CUAc5U
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a05e3f0d23so353341b3a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 22:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793166742; x=1793771542; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=o0+YQ8IhrloxYZmXJNyf64tQivuQ6Pn/Dp36CBxwNv4=;
        b=u1CUAc5UGEIg8w651QAnSj1ilJ1Hp07nRBlYJYLip7lca9dtV+G4XIVLxIkkYk+9He
         Gi0KpLWies9ZXilvLmEHfJEIcvI8kzJ1Wyu473aUFgZ+EPn9NADS0gpTZFOInL5tm9Nq
         7qBSbt2D7PxHKFRNJ0ExDlyKLPKzHEsOpZICg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793166742; x=1793771542;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o0+YQ8IhrloxYZmXJNyf64tQivuQ6Pn/Dp36CBxwNv4=;
        b=KFBaZspTXTmELQ1Ohbb7hO32fivVxhMZTZcROQgq2D7ifMxOyX/3fhDwVdJHg7Nu8P
         Vc5mKOugrnJqbjq+UXHU9nJ576j+33l22Kn6B/Xs9yC8y/K1Qd+SY5LY6qwuObVyVE3e
         S2AMTHZSa5Vy5TUVbFe0xksvKw7r6ftfrAAm9QR82RIh3y8xUo3C85/+HmMEGCI7z4xa
         I7Fkx7hSmGIoeXswC+TmRndqhj2F8feYW5cv58VTU4tQLCvc/aKF430TTp3yY5AGQxCX
         BcNWt2GB1BKGq+r0zQ3dZQJ8ZZrfy4EbA+3/GUvDEeXRT7hHixPLmd3ZEi7by9BoUztN
         6X6w==
X-Forwarded-Encrypted: i=1; AKwUvBxWT7Tzi+WPRjfxTTMhXZMqjZTCbAOYFGNmEwr1x5NZv9SV9UJdzBdXUj2sFtCj8vqnrcinmIpL8Fh5UluabG8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAvlTxnHwaB8hFCAgjnMRbRMZKpgTOC+r2KIg1aCMVqkB3ztRf
	MKboQlhGOAHOkGPYvbn53UfS+W/FJ5DDV/p2EVOMoS707K5BkyUhe1/kNl2aCLzyB78=
X-Gm-Gg: AYBFou2Q53qqRwQ4cINJOVj4eMPf0EMCjW0FLruEZNiOpb88GEM4+O51IkxRfa1mKR7
	siZIaQipaEmxXRwYUz2GxiAAi84gSDkILNCFIIJ5OC/5sZh82iX9LK3VukS4EKy7fhxveo4aJvN
	Swgh+42wz6r1TnKmMUEMwDq/qG1EE/Hmd1Q3PySXkPTgnX8ZcQ8rmgqMySDAicb14FFTXzTFhAf
	W2GoA2Zu3bWcCywFa0kQsfexLdW5qik2NxAngFpEwvdUWxKJNMmcZ738CrXQ9PaJws7i3dSMLuR
	nK0+51TNUVe2VOkKPjaOz2QCF1O17/ZydWMw6JD9+vX7/tk22sBk8YUOG3624eckPgRdBVnQjq7
	60NTGbIQYGAUNF62XxNOvptcaqR6M8+e5NeTm1MxaEQnI4IiPO+yQvNgv2qf+URiI06FRUmIrV7
	Q2RiZbD2J4SvVxZIAgzQcljjDT1rJvOt5SNmKrqUBgHxjjy2ZBBiPRFP+9M+mvs3gNepdgmseH/
	4SlFqzexTaCDwCDPJqSePZZ1822HJSLtINfc+PROAHCHa7neGGlrfQzIg5ckvdv+JWwnFS8Bnee
	78SpuwFav7c/sRhNhOltXl2YtEBIjzE8+a0NmToBfoEuHqHAZqi3V/+qGlhK1YQSBBCeamXS/Fi
	JhwnsDxDhKVLHcvOcFt06ft+mErFz4siE6AcZZoKLHytvZKUxg/VOWvA1XgxfpfiVPs5Da94M
X-Received: by 2002:a05:6a00:4b4f:b0:88d:20ff:15c9 with SMTP id d2e1a72fcca58-8a6e7acb277mr1168038b3a.17.1793166741947;
        Tue, 27 Oct 2026 22:52:21 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a6cfc785sm695363b3a.38.2026.10.27.22.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 22:52:21 -0700 (PDT)
Date: Wed, 28 Oct 2026 13:52:18 +0800
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
Message-ID: <auGNkhSHpBRd2U_5@chrisdown.name>
References: <cover.1793094611.git.chris@chrisdown.name>
 <5bd3c89d733ad22224f296dfa8900769de937de0.1793094611.git.chris@chrisdown.name>
 <auCxjbvY3qPv1sV6@gremlin>
 <auDTMb6WMFUpxeZy@chrisdown.name>
 <auDTptDQsB4xBcz7@gremlin>
 <18e2972cb8520c2e.3137322e32382e342e3434.279dd1.0000sendgmr@google.com>
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
In-Reply-To: <18e2972cb8520c2e.3137322e32382e342e3434.279dd1.0000sendgmr@google.com>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Hi Jeff,

Thanks for the review!

Jeff Xu writes:
>Could we please keep the test coverage for the unsealed [vdso] case and
>avoid unconditionally skipping whenever [vdso] is unsealed?
>
>There are two regressions I'd love for us to still be able to catch:
>
>1. Kernel or config regressions when sealing is expected to be on:

Yeah agreed. With the cleanup it matters even more I think because when sealing 
is set in one place the most likely regression is probably one that unseals 
everything at once.

>2. Regressions in the new `no_mseal_sys_mappings` boot parameter itself:

In v2 I can check /proc/cmdline for no_mseal_sys_mappings to do that.

Lorenzo, I think that also may inform your question about whether checking for 
the disabled case is redundant, right?

>   When booted with `no_mseal_sys_mappings` (or when unsealed), running
>   the assertions in Patch 3 (verifying system mappings have no `sl` flag
>   and that `munmap()` / `mremap()` -- and ideally `mprotect(PROT_READ |
>   PROT_WRITE)` -- on [vdso] succeed) directly verifies that the boot
>   parameter works and doesn't regress.

Sounds good.

>  or keep strict failure as an option (e.g. `./sysmap_is_sealed` fails if
>  unsealed without the boot param, while `run_vmtests.sh` passes a flag
>  like `--allow-disabled` when `CONFIG_MSEAL_SYSTEM_MAPPINGS` may not be
>  enabled), so CI environments that expect sealing still catch a broken
>  seal.

I like this and I think we can do it without adding some of the complexity that 
Lorenzo was not so happy about:

- Have check_sealed skip as usual when [vdso] isn't sealed and param is not set
- A new test, say expect_sealed, fails in the same case
- run_vmtests runs with -T expect_sealed when CONFIG_MSEAL_SYSTEM_MAPPINGS=y

That should be pretty minimal. Lorenzo, Jeff, how does that sound?
